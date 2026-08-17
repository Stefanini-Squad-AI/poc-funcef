inherited FrmMTAnaliseInvent: TFrmMTAnaliseInvent
  Left = 20
  Top = 150
  HelpContext = 50040
  Caption = 'Análise das Diferenças de Inventário'
  ClientHeight = 324
  ClientWidth = 698
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 698
    Height = 281
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 696
      Height = 55
      Align = alTop
      BevelOuter = bvNone
      BevelWidth = 2
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object lbInvent: TLabel
        Left = 96
        Top = 32
        Width = 94
        Height = 13
        Caption = 'Nº do Inventário'
      end
      object lbAlmox: TLabel
        Left = 96
        Top = 8
        Width = 73
        Height = 13
        Caption = 'Almoxarifado'
      end
      object Label3: TLabel
        Left = 488
        Top = 8
        Width = 108
        Height = 13
        Caption = 'Atividade / Projeto'
      end
      object btnProcurar: TBitBtn
        Left = 5
        Top = 5
        Width = 68
        Height = 44
        Caption = '&Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnProcurarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
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
      end
      object dblcAtiv: TwwDBLookupCombo
        Left = 488
        Top = 24
        Width = 177
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Descrição'
          'UNIDNEGOC'#9'10'#9'Código')
        LookupTable = cdsUnidNegoc
        LookupField = 'UNIDNEGOC'
        Options = [loTitles]
        Color = clSilver
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object grdDiferencas: TwwDBGrid
      Left = 1
      Top = 56
      Width = 696
      Height = 224
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'Descrição'
        'QTDECONTADA'#9'10'#9'Contagem'
        'SALDOINICIAL'#9'10'#9'Saldo'
        'DIFERENCAATUAL'#9'10'#9'Diferença'#9'F'
        'CUSTOMEDIO'#9'10'#9'Custo Médio')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsAnalise
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      UseTFields = False
      OnCalcCellColors = grdDiferencasCalcCellColors
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 281
    Width = 698
    Height = 43
    inherited tb97Fundo: TToolbar97
      Left = 403
      DockPos = 517
      inherited sep1: TToolbarSep97
        Left = 210
      end
      inherited bbtnSair: TBitBtn
        Left = 129
        Height = 37
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 212
        Width = 79
        Height = 37
        HelpContext = 50040
      end
      object bbtnAtualizaSaldo: TBitBtn
        Left = 0
        Top = 0
        Width = 129
        Height = 37
        Hint = '&Atualiza Saldo pela Contagem'
        Caption = '&Atualiza Saldo'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = bbtnAtualizaSaldoClick
        Glyph.Data = {
          16030000424D160300000000000076000000280000003F000000150000000100
          040000000000A002000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777777777777777777777777777777770777888888888
          8888887777778888888888888887777778888888888888887770770000000000
          000008888770000000000000008888770000000000000008888070B7B7B70FBF
          BFB7B000070B7B7B70FBFBFB7B000070B7B7B70FBFBFB7B0000070FBFFFF0BFB
          FBFB7B7B770FBFFFF0BFBFBFB7B7B770FBFFFF0BFBFBFB7B7B7077000000BFBF
          BFFFB7B7B77000000BFBFBFFFB7B7B77000000BFBFBFFFB7B7B0707B7B7B0BFB
          FBFBFBFBF707B7B7B0BFBFBFBFBFBF707B7B7B0BFBFBFBFBFBF070BFBFFF0FFF
          FFFFBFBFB70BFBFFF0FFFFFFFBFBFB70BFBFFF0FFFFFFFBFBFB077000000FBFF
          FFFBFFFBF77000000FBFFFFFBFFFBF77000000FBFFFFFBFFFBF070B7B7BF0FF0
          FFFFFFBFF70B7B7BF0FF0FFFFFFBFF70B7B7BF0FF0FFFFFFBFF070FBFFFB0B0F
          FBFBFBFBF70FBFFFB0B0FFBFBFBFBF70FBFFFB0B0FFBFBFBFBF077000000BF0F
          BFFFFFFFF77000000BF0FBFFFFFFFF77000000BF0FBFFFFFFFF0707B7BFB00FB
          FBFBFBFBF707B7BFB00FBFBFBFBFBF707B7BFB00FBFBFBFBFBF070BFBFFF00FF
          BFBF0000070BFBFFF00FFBFBF0000070BFBFFF00FFBFBF0000007700000000FB
          FBF0777777700000000FBFBF0777777700000000FBFBF08888807777777770BF
          BF07777777777777770BFBF07777777777777770BFBF08888880777777770BFB
          F07777777777777770BFBF07777777777777770BFBF088777770777777770FBF
          077777777777777770FBF077777777777777770FBF0887777770777777770BF0
          777777777777777770BF0777777777777777770BF08877777770777777770FB0
          777777777777777770FB0777777777777777770FB08777777770777777777007
          7777777777777777770077777777777777777770087777777770}
        NumGlyphs = 3
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 27
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'INVENTAR.IDINVENTARIO'
      'INVENTAR.DATAINVENTARIO'
      'INVENTAR.CODGRUPOPROD'
      'GRUPPROD.DESCGRUPOPROD')
    TipodeDado.Strings = (
      'N'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Num. Inventário'
      'Data Inventário'
      'Código do Grupo'
      'Descrição do Grupo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INVENTAR'
      'GRUPPROD')
    CamposChave.Strings = (
      'INVENTAR.IDINVENTARIO')
    Filtro.Strings = (
      'GRUPPROD.CODGRUPOPROD(+) = INVENTAR.CODGRUPOPROD')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 559
    Top = 86
  end
  object dsAnalise: TwwDataSource
    AutoEdit = False
    DataSet = cdsAnalise
    Left = 456
    Top = 64
  end
  object cdsAnalise: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 112
  end
  object cdsUnidNegoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 168
  end
end
