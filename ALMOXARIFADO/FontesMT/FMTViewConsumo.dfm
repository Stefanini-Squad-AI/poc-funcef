inherited FrmMTViewConsumo: TFrmMTViewConsumo
  Left = 78
  Top = 75
  HelpContext = 50072
  Caption = 'Consumo dos Produtos'
  ClientHeight = 421
  ClientWidth = 670
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 670
    Height = 382
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label2: TLabel
      Left = 160
      Top = 16
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label3: TLabel
      Left = 584
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Unidade'
    end
    object Label5: TLabel
      Left = 24
      Top = 64
      Width = 101
      Height = 13
      Caption = 'Grupo de Produto'
    end
    object Label4: TLabel
      Left = 272
      Top = 64
      Width = 33
      Height = 13
      Caption = 'Saldo'
    end
    object lbEstDia: TLabel
      Left = 400
      Top = 85
      Width = 218
      Height = 16
      Caption = 'Estoque suficiente para  0 dias '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edCodArt: TEdit
      Left = 24
      Top = 32
      Width = 121
      Height = 21
      TabStop = False
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edDesc: TEdit
      Left = 160
      Top = 32
      Width = 409
      Height = 21
      TabStop = False
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edUn: TEdit
      Left = 584
      Top = 32
      Width = 57
      Height = 21
      TabStop = False
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edGrp: TEdit
      Left = 24
      Top = 80
      Width = 233
      Height = 21
      TabStop = False
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edSaldo: TRealEdit
      Left = 272
      Top = 80
      Width = 121
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        '      0,00')
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object Panel2: TPanel
      Left = 5
      Top = 112
      Width = 660
      Height = 158
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 5
      object LbAnoPass: TLabel
        Left = 112
        Top = 33
        Width = 71
        Height = 19
        Caption = 'Ano 2000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbAnoAtu: TLabel
        Left = 432
        Top = 33
        Width = 71
        Height = 19
        Caption = 'Ano 2001'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 336
        Top = 80
        Width = 123
        Height = 16
        Caption = 'Últimos 03 meses'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 336
        Top = 104
        Width = 107
        Height = 16
        Caption = 'Últimos 10 dias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 336
        Top = 128
        Width = 69
        Height = 16
        Caption = 'Mês Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 16
        Top = 80
        Width = 123
        Height = 16
        Caption = 'Últimos 03 meses'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 16
        Top = 104
        Width = 107
        Height = 16
        Caption = 'Últimos 10 dias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 16
        Top = 128
        Width = 69
        Height = 16
        Caption = 'Mês Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 144
        Top = 64
        Width = 43
        Height = 16
        Caption = 'Diário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 232
        Top = 64
        Width = 37
        Height = 16
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 464
        Top = 64
        Width = 43
        Height = 16
        Caption = 'Diário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 552
        Top = 64
        Width = 37
        Height = 16
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 16
        Top = 48
        Width = 300
        Height = 9
        Shape = bsBottomLine
        Style = bsRaised
      end
      object Bevel2: TBevel
        Left = 336
        Top = 48
        Width = 298
        Height = 9
        Shape = bsBottomLine
        Style = bsRaised
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 660
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Consumo Médio'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object edUlt3mDiaAnoPass: TRealEdit
        Left = 144
        Top = 80
        Width = 81
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edUlt10dDiaAnoPass: TRealEdit
        Left = 144
        Top = 104
        Width = 81
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edUltMesDiaAnoPass: TRealEdit
        Left = 144
        Top = 128
        Width = 81
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edUlt3mDiaAnoAtu: TRealEdit
        Left = 464
        Top = 80
        Width = 81
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edUlt10dDiaAnoAtu: TRealEdit
        Left = 464
        Top = 104
        Width = 81
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edUltMesDiaAnoAtu: TRealEdit
        Left = 464
        Top = 128
        Width = 81
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edUlt3mTotAnoAtu: TRealEdit
        Left = 552
        Top = 80
        Width = 81
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edUlt10dTotAnoAtu: TRealEdit
        Left = 552
        Top = 104
        Width = 81
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edUltMesTotAnoAtu: TRealEdit
        Left = 552
        Top = 128
        Width = 81
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edUlt3mTotAnoPass: TRealEdit
        Left = 232
        Top = 80
        Width = 81
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edUlt10dTotAnoPass: TRealEdit
        Left = 232
        Top = 104
        Width = 81
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edUltMesTotAnoPass: TRealEdit
        Left = 232
        Top = 128
        Width = 81
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    object Panel1: TPanel
      Left = 5
      Top = 270
      Width = 660
      Height = 107
      Align = alBottom
      Caption = 'Panel1'
      TabOrder = 6
      object GrdUltComp: TwwDBGrid
        Tag = 99
        Left = 1
        Top = 26
        Width = 658
        Height = 80
        Selected.Strings = (
          'RAZAOSOCIAL'#9'30'#9'Fornecedor'
          'DATAENTDEVOL'#9'10'#9'Data'
          'QTDERECEBDEVOL'#9'10'#9'Quantidade'
          'CODMEDIDA'#9'4'#9'Unidade'
          'VLRUNITARIO'#9'10'#9'Valor Unitário'
          'VALUNEST'#9'10'#9'Valor Estoque')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsUltComp
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 658
        Height = 25
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Últimas Compras'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 382
    Width = 670
    inherited tb97Fundo: TToolbar97
      Left = 405
      DockPos = 509
      inherited sep1: TToolbarSep97
        Left = 179
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 97
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 99
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 181
        HelpContext = 50072
      end
      object BtnSel: TBitBtn
        Left = 0
        Top = 0
        Width = 97
        Height = 33
        Caption = 'S&elecionar'
        TabOrder = 2
        OnClick = BtnSelClick
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
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65523
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object dsUltComp: TwwDataSource
    AutoEdit = False
    DataSet = cdsUltComp
    Left = 360
    Top = 319
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PRODUTO.CODPRODUTO'
      'PRODUTO.DESCPROD'
      'PRODUTO.CODGRUPOPROD'
      'GRUPPROD.DESCGRUPOPROD')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código do Produto'
      'Descrição do Produto'
      'Código do Grupo'
      'Descrição do Grupo')
    Tabelas.Strings = (
      'PRODUTO'
      'GRUPPROD'
      'ARTIGO')
    CamposChave.Strings = (
      'ARTIGO.CODARTIGO'
      'PRODUTO.DESCPROD'
      'GRUPPROD.DESCGRUPOPROD'
      'PRODUTO.CODMEDCUSTO')
    Filtro.Strings = (
      'ARTIGO.FLGATIVO = '#39'S'#39
      'PRODUTO.CODGRUPOPROD = GRUPPROD.CODGRUPOPROD'
      'PRODUTO.CODPRODUTO = ARTIGO.CODARTIGO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '6'
      '10'
      '4'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 471
    Top = 13
  end
  object cdsConsMedDia: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 320
  end
  object cdsConsMedTot: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 584
    Top = 320
  end
  object cdsUltComp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 320
  end
end
