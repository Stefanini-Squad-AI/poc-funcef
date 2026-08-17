inherited frmCadOperAGENovo: TfrmCadOperAGENovo
  Left = 0
  Top = 0
  Caption = 'Operação de Eventos'
  ClientHeight = 543
  ClientWidth = 792
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 792
    Height = 457
    object PnlOrigem: TPanel
      Left = 1
      Top = 1
      Width = 790
      Height = 249
      Align = alClient
      TabOrder = 0
      object dbgOrigemDivJurAnu: TwwDBGrid
        Left = 1
        Top = 25
        Width = 788
        Height = 223
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'15'#9'Ação'
          'DESCCARTINVEST'#9'16'#9'Carteira'
          'DESCTIPOOPERACAO'#9'15'#9'Operação'
          'DATAREFERENCIA'#9'10'#9'Data Prevista'#9'F'
          'QTDEDIREITO'#9'17'#9'Quantidade Base'
          'VALOREXERCIDO'#9'17'#9'Valor'
          'VLRREMUNERACAO'#9'12'#9'Remuneração'
          'IR'#9'10'#9'Valor do IR'
          'VLRLIQ'#9'13'#9'Valor Líquido'
          'SGLCUSTODIANTE'#9'9'#9'Custodiante'
          'SIGLAMOTBLOQ'#9'4'#9'Bloq.'
          'VLRCUSTOATUAL'#9'17'#9'Custo Atual')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = []
        ParentFont = False
        TabOrder = 4
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object dbgOrigemGrupamento: TwwDBGrid
        Left = 1
        Top = 25
        Width = 788
        Height = 223
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'26'#9'Investimento'#9'F'
          'DESCCARTINVEST'#9'30'#9'Carteira'#9'F'
          'QTDEDIREITO'#9'18'#9'Quantidade Base'#9'F'
          'SGLCUSTODIANTE'#9'15'#9'Custodiante'#9'F'
          'SIGLAMOTBLOQ'#9'3'#9'Bloq.'#9'F'
          'DATAREFERENCIA'#9'10'#9'Data Base'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsOrigemGrupamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = []
        ParentFont = False
        TabOrder = 5
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object dbgOrigemIncPerAlt: TwwDBGrid
        Left = 1
        Top = 25
        Width = 788
        Height = 223
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsOrigemIncPerAlt
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = []
        ParentFont = False
        TabOrder = 3
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object dbgOrigemRestCap: TwwDBGrid
        Left = 1
        Top = 25
        Width = 788
        Height = 223
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'23'#9'Ação'
          'DESCCARTINVEST'#9'25'#9'Carteira'
          'QTDEDIREITO'#9'15'#9'Quantidade Base'
          'VALOREXERCIDO'#9'16'#9'Valor'#9'F'
          'DATAREFERENCIA'#9'10'#9'Data Base'
          'VLRCUSTOATUAL'#9'15'#9'Custo Atual')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsOrigemRestCap
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = []
        ParentFont = False
        TabOrder = 7
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object dbgOrigemDesdobramento: TwwDBGrid
        Left = 1
        Top = 25
        Width = 788
        Height = 223
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'35'#9'Ação'
          'DESCCARTINVEST'#9'38'#9'Carteira'
          'QTDEDIREITO'#9'20'#9'Quantidade Base'
          'DATAREFERENCIA'#9'12'#9'Data Base'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsOrigemDesdobramento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = []
        ParentFont = False
        TabOrder = 6
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object dbgOrigemSub: TwwDBGrid
        Left = 1
        Top = 25
        Width = 788
        Height = 223
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'26'#9'Ação'#9'F'
          'DESCCARTINVEST'#9'30'#9'Carteira'#9'F'
          'QTDEDIREITO'#9'17'#9'Quantidade Base'#9'F'
          'SGLCUSTODIANTE'#9'15'#9'Custodiante'#9'F'
          'SIGLAMOTBLOQ'#9'4'#9'Bloq.'#9'F'
          'DATAREFERENCIA'#9'11'#9'Data Base'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsOrigemSub
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = []
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object dbgOrigemDirJur: TwwDBGrid
        Left = 1
        Top = 25
        Width = 788
        Height = 223
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'22'#9'Ação'#9'F'
          'DESCCARTINVEST'#9'30'#9'Carteira'#9'F'
          'SIGLAMOTBLOQ'#9'4'#9'Bloq.'#9'F'
          'QTDEDIREITO'#9'17'#9'Quantidade Base'#9'F'
          'VALOREXERCIDO'#9'17'#9'Valor'#9'F'
          'VLRREMUNERACAO'#9'12'#9'Remuneração'#9'F'
          'IR'#9'10'#9'Valor do IR'#9'F'
          'VLRLIQ'#9'13'#9'Valor Líquido'#9'F'
          'SGLCUSTODIANTE'#9'15'#9'Custodiante'#9'F'
          'DATAREFERENCIA'#9'11'#9'Data Base'#9'F'
          'QTDE'#9'10'#9'Quantidade Base'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsOrigemDivJur
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = []
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 788
        Height = 24
        Align = alTop
        Caption = 'Origem'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
    object pnlDestino: TPanel
      Left = 1
      Top = 250
      Width = 790
      Height = 206
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object dbgDestinoDesdobramento: TwwDBGrid
        Left = 0
        Top = 57
        Width = 790
        Height = 149
        Selected.Strings = (
          'ACAO'#9'30'#9'Ação'
          'DESCCARTEIRA'#9'35'#9'Carteira'
          'DESCCUSTODIANTE'#9'15'#9'Custodiante'#9'F'
          'DESCBLOQUEIO'#9'4'#9'Bloq.'
          'QTDEDIREITO'#9'20'#9'Qtd. Direito')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsDestinoDesdobramento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = []
        ParentFont = False
        TabOrder = 8
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object dbgDestinoGrupamento: TwwDBGrid
        Left = 0
        Top = 57
        Width = 790
        Height = 149
        Selected.Strings = (
          'ACAO'#9'20'#9'Ação'#9'F'
          'DESCCARTEIRA'#9'24'#9'Carteira'#9'F'
          'DESCCUSTODIANTE'#9'13'#9'Custodiante'#9'F'
          'DESCBLOQUEIO'#9'4'#9'Bloq.'#9'F'
          'QTDEDIREITO'#9'15'#9'Qtd. Direito'#9'F'
          'QTDENOVA'#9'15'#9'Qtd. Prevista'#9'F'
          'VLRCUSTO'#9'12'#9'Custo'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsDestinoGrupamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = []
        ParentFont = False
        TabOrder = 7
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnEnter = dbgDestinoSubEnter
        OnKeyDown = dbgDestinoSubKeyDown
        OnKeyPress = dbgDestinoSubKeyPress
        IndicatorColor = icBlack
      end
      object dbgDestinoSub: TwwDBGrid
        Left = 0
        Top = 57
        Width = 790
        Height = 149
        Selected.Strings = (
          'ACAO'#9'14'#9'Ação'
          'DESCCARTEIRA'#9'15'#9'Carteira'
          'DESCCUSTODIANTE'#9'9'#9'Custodiante'
          'DESCBLOQUEIO'#9'4'#9'Bloq.'
          'IDLOTE'#9'12'#9'Lote'
          'QTDEDIREITO'#9'15'#9'Qtd. Direito'
          'VALOREXERCIDO'#9'18'#9'Vlr. Exercido'
          'VLRCUSTO'#9'15'#9'Custo')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsDestinoSub
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = []
        ParentFont = False
        TabOrder = 2
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnEnter = dbgDestinoSubEnter
        OnKeyDown = dbgDestinoSubKeyDown
        OnKeyPress = dbgDestinoSubKeyPress
        IndicatorColor = icBlack
      end
      object dbgDestinoRestCap: TwwDBGrid
        Left = 0
        Top = 57
        Width = 790
        Height = 149
        Selected.Strings = (
          'ACAO'#9'14'#9'Ação'#9'F'
          'DESCCARTEIRA'#9'15'#9'Carteira'#9'F'
          'DESCCUSTODIANTE'#9'9'#9'Custodiante'#9'F'
          'DESCBLOQUEIO'#9'4'#9'Bloq.'#9'F'
          'IDLOTE'#9'12'#9'Lote'#9'F'
          'QTDEDIREITO'#9'15'#9'Qtd. Direito'#9'F'
          'VALOREXERCIDO'#9'18'#9'Vlr. Exercido'#9'F'
          'VLRCUSTO'#9'15'#9'Custo'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsDestinoRestCap
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = []
        ParentFont = False
        TabOrder = 9
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnEnter = dbgDestinoSubEnter
        OnKeyDown = dbgDestinoSubKeyDown
        OnKeyPress = dbgDestinoSubKeyPress
        IndicatorColor = icBlack
      end
      object dbgDestinoIncPerAlt: TwwDBGrid
        Left = 0
        Top = 57
        Width = 790
        Height = 149
        Selected.Strings = (
          'ACAO'#9'20'#9'Ação'
          'DESCCARTEIRA'#9'21'#9'Carteira'#9'F'
          'DESCCUSTODIANTE'#9'13'#9'Custodiante'
          'DESCBLOQUEIO'#9'4'#9'Bloq.'
          'QTDEDIREITO'#9'15'#9'Qtd. Direito'
          'QTDENOVA'#9'15'#9'Qtd. Prevista'
          'VLRCUSTO'#9'15'#9'Custo')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsDestinoIncPerAlt
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = []
        ParentFont = False
        TabOrder = 6
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnEnter = dbgDestinoSubEnter
        OnKeyDown = dbgDestinoIncPerAltKeyDown
        OnKeyPress = dbgDestinoSubKeyPress
        IndicatorColor = icBlack
      end
      object dblCustodiante: TwwDBLookupCombo
        Left = 140
        Top = 97
        Width = 86
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SGLCUSTODIANTE'#9'10'#9'Custodiante')
        DataField = 'IDCUSTODIANTE'
        DataSource = DsDestinoSub
        LookupTable = QryCustodiante
        LookupField = 'IDCUSTODIANTE'
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object pnlBotoesDestino: TPanel
        Left = 0
        Top = 24
        Width = 790
        Height = 33
        Align = alTop
        Caption = 'pnlBotoesDestino'
        TabOrder = 1
        object Dock977: TDock97
          Left = 1
          Top = 1
          Width = 788
          Height = 31
          AllowDrag = False
          object Toolbar974: TToolbar97
            Left = 0
            Top = 0
            Caption = 'tb97BotoesDetalhe'
            DockPos = 0
            TabOrder = 0
            object BtIncDet: TSpeedButton
              Left = 0
              Top = 1
              Width = 25
              Height = 25
              Hint = 'Inserir novo registro|'
              AllowAllUp = True
              GroupIndex = 1
              Enabled = False
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
                0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
                33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
                B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                3BB33773333773333773B333333B3333333B7333333733333337}
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
              OnClick = BtIncDetClick
            end
            object BtAltDet: TSpeedButton
              Left = 25
              Top = 1
              Width = 25
              Height = 25
              Hint = 'Alterar o registro selecionado|'
              AllowAllUp = True
              GroupIndex = 1
              Enabled = False
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
                000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
                00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
                F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
                0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
                FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
                FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
                0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
                00333377737FFFFF773333303300000003333337337777777333}
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
              OnClick = BtAltDetClick
            end
            object BtDelDet: TSpeedButton
              Left = 50
              Top = 1
              Width = 25
              Height = 25
              Hint = 'Remover o registro selecionado|'
              AllowAllUp = True
              GroupIndex = 1
              Enabled = False
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
                555557777F777555F55500000000555055557777777755F75555005500055055
                555577F5777F57555555005550055555555577FF577F5FF55555500550050055
                5555577FF77577FF555555005050110555555577F757777FF555555505099910
                555555FF75777777FF555005550999910555577F5F77777775F5500505509990
                3055577F75F77777575F55005055090B030555775755777575755555555550B0
                B03055555F555757575755550555550B0B335555755555757555555555555550
                BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
                50BB555555555555575F555555555555550B5555555555555575}
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
              OnClick = BtDelDetClick
            end
          end
          object Toolbar975: TToolbar97
            Left = 507
            Top = 0
            Caption = 'tb97Detalhe'
            DockPos = 507
            TabOrder = 1
            object BtOkDet: TBitBtn
              Left = 0
              Top = 0
              Width = 80
              Height = 27
              Caption = '&OK'
              Default = True
              Enabled = False
              TabOrder = 0
              OnClick = BtOkDetClick
              Glyph.Data = {
                BE060000424DBE06000000000000360400002800000024000000120000000100
                0800000000008802000000000000000000000001000000010000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A600000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                0303030303030303030303030303030303030303030303030303030303030303
                03030303030303030303030303030303030303030303FF030303030303030303
                03030303030303040403030303030303030303030303030303F8F8FF03030303
                03030303030303030303040202040303030303030303030303030303F80303F8
                FF030303030303030303030303040202020204030303030303030303030303F8
                03030303F8FF0303030303030303030304020202020202040303030303030303
                0303F8030303030303F8FF030303030303030304020202FA0202020204030303
                0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
                040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
                03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
                FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
                0303030303030303030303FA0202020403030303030303030303030303F8FF03
                03F8FF03030303030303030303030303FA020202040303030303030303030303
                0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
                03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
                030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
                0202040303030303030303030303030303F8FF03F8FF03030303030303030303
                03030303FA0202030303030303030303030303030303F8FFF803030303030303
                030303030303030303FA0303030303030303030303030303030303F803030303
                0303030303030303030303030303030303030303030303030303030303030303
                0303}
              NumGlyphs = 2
            end
            object BtCancDet: TBitBtn
              Left = 80
              Top = 0
              Width = 80
              Height = 27
              Cancel = True
              Caption = '&Cancelar'
              Enabled = False
              TabOrder = 1
              OnClick = BtCancDetClick
              Glyph.Data = {
                BE060000424DBE06000000000000360400002800000024000000120000000100
                0800000000008802000000000000000000000001000000010000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A600000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                0303030303030303030303030303030303030303030303030303030303030303
                0303F8F80303030303030303030303030303030303FF03030303030303030303
                0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
                03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
                030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
                FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
                030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
                F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
                010101F8030303030303030303F8FF030303030303FFF8030303030303030303
                030101010101F80303030303030303030303F8FF0303030303F8030303030303
                0303030303F901010101F8030303030303030303030303F8FF030303F8030303
                0303030303030303F90101010101F8030303030303030303030303F803030303
                F8FF030303030303030303F9010101F8010101F803030303030303030303F803
                03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
                03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
                03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
                0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
                030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
                03030303030303030303030303030303030303030303030303F8F8F803030303
                0303030303030303030303030303030303030303030303030303030303030303
                0303}
              NumGlyphs = 2
            end
            object BtVoltaDet: TBitBtn
              Left = 160
              Top = 0
              Width = 80
              Height = 27
              Cancel = True
              Caption = '&Voltar'
              Enabled = False
              TabOrder = 2
              OnClick = BtCancDetClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
                FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
                C8807FF7777777777FF700000000000000007777777777777777333333333333
                3333333333333333333333333333333333333333333333333333}
              NumGlyphs = 2
            end
          end
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 790
        Height = 24
        Align = alTop
        Caption = 'Destino'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object dblCarteira: TwwDBLookupCombo
        Left = 250
        Top = 97
        Width = 127
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'40'#9'Carteira'#9'F')
        DataField = 'IDCARTEIRAINVEST'
        DataSource = DsDestinoSub
        LookupTable = QryCarteiraInvest
        LookupField = 'IDCARTEIRAINVEST'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblAcao: TwwDBLookupCombo
        Left = 403
        Top = 97
        Width = 71
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'30'#9'Descrição')
        DataField = 'IDINVESTIMENTO'
        DataSource = DsDestinoIncPerAlt
        LookupTable = QryInvestimento
        LookupField = 'IDINVESTIMENTO'
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  inherited Dock972: TDock97
    Width = 792
    object lblDataAGE: TLabel [0]
      Left = 84
      Top = 26
      Width = 87
      Height = 19
      Caption = 'lblDataAGE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object lblTipoOperacao: TLabel [1]
      Left = 174
      Top = 26
      Width = 126
      Height = 19
      Caption = 'lblTipoOperacao'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object lblSigla: TLabel [2]
      Left = 84
      Top = 3
      Width = 56
      Height = 19
      Caption = 'lblSigla'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object LblBoleta: TLabel [3]
      Left = 515
      Top = 6
      Width = 73
      Height = 19
      Alignment = taCenter
      Caption = 'LblBoleta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 504
    Width = 792
    object lblDataEfetiva: TLabel [0]
      Left = 296
      Top = 0
      Width = 78
      Height = 13
      Caption = 'Data Prevista'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label4: TLabel [1]
      Left = 24
      Top = 4
      Width = 89
      Height = 13
      Caption = 'Qtd. Distribuida'
      Visible = False
    end
    object Label5: TLabel [2]
      Left = 24
      Top = 21
      Width = 90
      Height = 13
      Caption = 'Qtd. a Distribuir'
      Visible = False
    end
    object lbDistribuido: TLabel [3]
      Left = 237
      Top = 4
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = '0,00'
      Visible = False
    end
    object lbAdistribuir: TLabel [4]
      Left = 237
      Top = 21
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = '0,00'
      Visible = False
    end
    object edtDataEfetiva: TCMDateTimePicker
      Left = 296
      Top = 13
      Width = 105
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      Epoch = 1950
      ButtonGlyph.Data = {
        06050000424D06050000000000003604000028000000100000000D0000000100
        080000000000D000000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
        000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
        A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
        A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
        A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
        FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
        04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
        000000000000000000FF}
      ShowButton = True
      TabOrder = 2
      Visible = False
    end
  end
  object dblBloqueio: TwwDBLookupCombo [3]
    Left = 492
    Top = 393
    Width = 89
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'SIGLAMOTBLOQ'#9'3'#9'Bloqueio')
    DataField = 'IDMOTIVOBLOQUEIO'
    DataSource = DsDestinoSub
    LookupTable = qryMotivoBloqueio
    LookupField = 'IDMOTIVOBLOQUEIO'
    TabOrder = 3
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = True
    ShowMatchText = True
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 672
    Top = 2
  end
  inherited ds: TwwDataSource
    Left = 645
    Top = 3
  end
  inherited upd: TUpdateSQL
    Left = 618
    Top = 3
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOOPERACAO.DESCTIPOOPERACAO'
      'EMISSOR.SIGLAEMISSOR'
      'OPERACAODIREITO.DATACOM'
      'OPERACAODIREITO.DIVPORACAO'
      'OPERACAOINVEST.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'N'
      'C')
    Descricao.Strings = (
      'Tipo de Operacao'
      'Emissor'
      'Data Prevista'
      'Dividendos por Ação'
      'Boleta')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'EMISSOR'
      'OPERACAODIREITO'
      'TIPOOPERACAO'
      'OPERACAOINVEST')
    CamposChave.Strings = (
      'OPERACAODIREITO.IDEMISSOR'
      'OPERACAODIREITO.DATAEX'
      'OPERACAODIREITO.IDTIPOOPERACAO'
      'OPERACAODIREITO.IDOPERACAODIREITO'
      'EMISSOR.SIGLAEMISSOR'
      'TIPOOPERACAO.DESCTIPOOPERACAO'
      'OPERACAOINVEST.NUMDOCUMENTO')
    Filtro.Strings = (
      'OPERACAODIREITO.IDEMISSOR = EMISSOR.IDEMISSOR'
      'OPERACAODIREITO.IDTIPOOPERACAO = TIPOOPERACAO.IDTIPOOPERACAO'
      
        'OPERACAOINVEST.IDOPERACAODIREITO(+) =OPERACAODIREITO.IDOPERACAOD' +
        'IREITO ')
    Mascaras.Strings = (
      ''
      ''
      ''
      ',#0.000000000000'
      '')
    Larguras.Strings = (
      '30'
      '20'
      '15'
      '18'
      '20')
    UsaDistinct = True
    Left = 749
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 697
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 724
    Top = 2
  end
  inherited qry: TwwQuery
    Left = 592
    Top = 3
  end
  object UpdOrigemDivJur: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCUSTODIA'
      'set'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  IDLOTE = :IDLOTE,'
      '  IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    InsertSQL.Strings = (
      'insert into HISTCUSTODIA'
      
        '  (IDCARTEIRAINVEST, IDINVESTIMENTO, IDCUSTODIANTE, IDLOTE, IDMO' +
        'TIVOBLOQUEIO, '
      '   IDPLANPREVCTBPATR)'
      'values'
      
        '  (:IDCARTEIRAINVEST, :IDINVESTIMENTO, :IDCUSTODIANTE, :IDLOTE, ' +
        ':IDMOTIVOBLOQUEIO, '
      '   :IDPLANPREVCTBPATR)')
    DeleteSQL.Strings = (
      'delete from HISTCUSTODIA'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    Left = 118
    Top = 67
  end
  object QryOrigemDivJur: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '        INV.DESCINVESTIMENTO,'
      '        CA.DESCCARTINVEST,'
      '        C.SGLCUSTODIANTE,'
      
        '        DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL, MB.SIGLAMOTBLOQ) S' +
        'IGLAMOTBLOQ,'
      '        HC.IDLOTE,'
      '        SYSDATE  AS DATAREFERENCIA,'
      '        0 AS QTDE,'
      '        0 AS QTDEDIREITO,'
      '        0 AS VALOREXERCIDO,'
      '        0 AS VLRREMUNERACAO,'
      '        0 AS IR,'
      '        0 AS VLRLIQ,'
      '        0 AS VLRIRREMUNERACAO,'
      '        HC.IDCARTEIRAINVEST,'
      '        HC.IDINVESTIMENTO,'
      '        HC.IDCUSTODIANTE,'
      '        HC.IDMOTIVOBLOQUEIO,'
      '        OXI.PERCENTUALINV,'
      '        0 AS VLRCUSTOATUAL,'
      '        0 AS VLRCUSTO'
      '     FROM'
      
        '        HISTCUSTODIA HC, CUSTODIANTE C, MOTIVOBLOQUEIO MB, CARTE' +
        'IRAINVEST CA,'
      '        INVESTIMENTO INV, OPERDIREITOXINV OXI'
      '     WHERE'
      '        HC.IDINVESTIMENTO  IN'
      
        '        (SELECT IDINVESTIMENTO FROM  OPERDIREITOXINV WHERE IDOPE' +
        'RACAODIREITO=:IDOPERACAODIREITO AND ORIGDEST = '#39'O'#39') AND'
      '        OXI.IDOPERACAODIREITO = :IDOPERACAODIREITO     AND'
      '        OXI.ORIGDEST          = '#39'O'#39'                    AND'
      '        HC.IDCARTEIRAINVEST   = CA.IDCARTEIRAINVEST    AND'
      '        HC.IDINVESTIMENTO     = INV.IDINVESTIMENTO     AND'
      '        HC.IDCUSTODIANTE      = C.IDCUSTODIANTE(+)     AND'
      '        HC.IDMOTIVOBLOQUEIO   = MB.IDMOTIVOBLOQUEIO(+) AND'
      
        '        HC.IDCUSTODIA  IN (SELECT MAX(IDCUSTODIA) FROM HISTCUSTO' +
        'DIA'
      '                           WHERE IDCUSTODIA IN'
      
        '                                (SELECT MAX(IDCUSTODIA) FROM HIS' +
        'TCUSTODIA'
      '                                 WHERE'
      
        '                                        IDINVESTIMENTO IN (SELEC' +
        'T IDINVESTIMENTO'
      
        '                                                           FROM ' +
        'OPERDIREITOXINV'
      
        '                                                           WHERE' +
        ' IDOPERACAODIREITO =:IDOPERACAODIREITO AND'
      
        '                                                         ORIGDES' +
        'T          = '#39'O'#39' )             AND'
      
        '                                        DATAMOVCUSTOD    <=:DATA' +
        'AGE'
      
        '                                 GROUP BY IDCARTEIRAINVEST, IDCU' +
        'STODIANTE,IDMOTIVOBLOQUEIO)'
      
        '                           GROUP BY IDCARTEIRAINVEST, IDCUSTODIA' +
        'NTE, IDMOTIVOBLOQUEIO)'
      
        '     ORDER BY INV.DESCINVESTIMENTO, DESCCARTINVEST, C.SGLCUSTODI' +
        'ANTE,'
      
        '                           DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL,' +
        ' MB.SIGLAMOTBLOQ)')
    UpdateObject = UpdOrigemDivJur
    ValidateWithMask = True
    Left = 44
    Top = 67
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAAGE'
        ParamType = ptUnknown
      end>
    object QryOrigemDivJurDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 22
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryOrigemDivJurDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 30
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object QryOrigemDivJurSIGLAMOTBLOQ: TStringField
      DisplayLabel = 'Bloq.'
      DisplayWidth = 4
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object QryOrigemDivJurQTDEDIREITO: TFloatField
      DisplayLabel = 'Quantidade Base'
      DisplayWidth = 17
      FieldName = 'QTDEDIREITO'
      OnSetText = QryOrigemDivJurQTDEDIREITOSetText
      DisplayFormat = '###,###,###,###,###'
    end
    object QryOrigemDivJurVALOREXERCIDO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 17
      FieldName = 'VALOREXERCIDO'
      OnSetText = QryOrigemDivJurVALOREXERCIDOSetText
      DisplayFormat = ',##0.00'
    end
    object QryOrigemDivJurVLRREMUNERACAO: TFloatField
      DisplayLabel = 'Remuneração'
      DisplayWidth = 12
      FieldName = 'VLRREMUNERACAO'
      OnSetText = QryOrigemDivJurVLRREMUNERACAOSetText
      DisplayFormat = ',##0.00'
    end
    object QryOrigemDivJurIR: TFloatField
      DisplayLabel = 'Valor do IR'
      DisplayWidth = 10
      FieldName = 'IR'
      OnSetText = QryOrigemDivJurIRSetText
      DisplayFormat = ',##0.00'
    end
    object QryOrigemDivJurVLRLIQ: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 13
      FieldName = 'VLRLIQ'
      OnSetText = QryOrigemDivJurVLRLIQSetText
      DisplayFormat = ',##0.00'
    end
    object QryOrigemDivJurSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 15
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object QryOrigemDivJurDATAREFERENCIA: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 11
      FieldName = 'DATAREFERENCIA'
    end
    object QryOrigemDivJurQTDE: TFloatField
      DisplayLabel = 'Quantidade Base'
      DisplayWidth = 10
      FieldName = 'QTDE'
      DisplayFormat = '###,###,###,###,###'
    end
    object QryOrigemDivJurVLRCUSTOATUAL: TFloatField
      DisplayLabel = 'Custo Atual'
      DisplayWidth = 17
      FieldName = 'VLRCUSTOATUAL'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object QryOrigemDivJurIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object QryOrigemDivJurVLRIRREMUNERACAO: TFloatField
      FieldName = 'VLRIRREMUNERACAO'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object QryOrigemDivJurIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryOrigemDivJurIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object QryOrigemDivJurIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object QryOrigemDivJurIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object QryOrigemDivJurPERCENTUALINV: TFloatField
      FieldName = 'PERCENTUALINV'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object QryOrigemDivJurVLRCUSTO: TFloatField
      FieldName = 'VLRCUSTO'
      Visible = False
      DisplayFormat = ',##0.00'
    end
  end
  object DsOrigemDivJur: TwwDataSource
    DataSet = QryOrigemDivJur
    Left = 193
    Top = 67
  end
  object QryLote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   QTDELOTE'
      'FROM'
      '   ACOESXBOLSA'
      'WHERE IDACAO =:IDACAO')
    ValidateWithMask = True
    Left = 377
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDACAO'
        ParamType = ptUnknown
      end>
  end
  object QryOperacaoInvestDestino: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    VLRREMUNERACAO,'
      '    VLRIRREMUNER,'
      '    VLROPERACAO,'
      '    QTDEOPERACAO,'
      '    NUMDOCUMENTO'
      'FROM'
      '    OPERACAOINVEST'
      'WHERE'
      '    IDOPERACAOINVEST  = :IDOPERACAOINVEST'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 377
    Top = 94
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaTipoOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDTIPOINVEST, IDTIPOOPERACAO, IDMERCADO,   DESCTIPOOPERAC' +
        'AO,'
      
        '       TIPOCUSTODIA, VENCIMENTO,     TIPCREDOR,   NATUREZAOPERAC' +
        'AO,'
      
        '       FLGTRANSF,    FLGCORRET,      FLGORDMOVINV, FLGTRATAIR, R' +
        'ECPAG'
      ''
      'FROM TIPOOPERACAO'
      'WHERE IDTIPOOPERACAO = :TIPOOPERACAO'
      '')
    ValidateWithMask = True
    Left = 472
    Top = 50
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TIPOOPERACAO'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  INV.IDINVESTIMENTO,   INV.IDMOEDACONTAB, INV.IDEMISSOR, ' +
        'INV.IDTIPOINVEST,'
      
        '        INV.DESCINVESTIMENTO, ACA.CODTIPOACAO, AXB.MOECODIGO, AX' +
        'B.QTDELOTE,'
      '        AXB.IDBOLSAVALORES'
      'FROM   INVESTIMENTO INV, ACAO ACA, ACOESXBOLSA AXB'
      'WHERE (INV.IDINVESTIMENTO = :IDINVESTIMENTO) AND'
      '      (INV.IDINVESTIMENTO = ACA.IDACAO)     AND'
      '      (INV.IDINVESTIMENTO = AXB.IDACAO)')
    ValidateWithMask = True
    Left = 472
    Top = 140
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaBolsaValores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDBOLSAVALORES'
      'FROM'
      '   BOLSAVALORES'
      'WHERE'
      '   IDCUSTODIANTE =:IDCUSTODIANTE      ')
    ValidateWithMask = True
    Left = 472
    Top = 95
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end>
  end
  object QryInsetOperacaoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO OPERACAOINVEST'
      
        '(IDOPERACAOINVEST,  MOECODIGO,        IDMODULO,         ORIGDEST' +
        ','
      
        ' EMPRESAPROP,       IDINVESTIMENTO,   IDCARTEIRAINVEST, IDTIPOIN' +
        'VEST,'
      
        ' IDTIPOOPERACAO,    DATAOPERACAO,     NUMDOCUMENTO,     QTDEOPER' +
        'ACAO,'
      
        ' PRECOUNITOPERACAO, VLROPERACAO,      DATAVENCOPER,     IDFORCLI' +
        ','
      
        ' IDLOTE,            IDCUSTODIANTE,    VLRIR,            FLGSTATU' +
        'SFECHBOL,'
      
        ' FLGSTATUSORDMOV,   IDOPERACAODIREITO,VLRREMUNERACAO,   VLRIRREM' +
        'UNER,'
      
        ' PERCENTUAL,        IDCARTEIRAGERENC, IDPLANPREVCTBPATR,IDOPERCU' +
        'STODIA)'
      'VALUES'
      
        '(:IDOPERACAOINVEST,  :MOECODIGO,        :IDMODULO,         :ORIG' +
        'DEST,'
      
        ' :EMPRESAPROP,       :IDINVESTIMENTO,   :IDCARTEIRAINVEST, :IDTI' +
        'POINVEST,'
      
        ' :IDTIPOOPERACAO,    :DATAOPERACAO,     :NUMDOCUMENTO,     :QTDE' +
        'OPERACAO,'
      
        ' :PRECOUNITOPERACAO, :VLROPERACAO,      :DATAVENCOPER,     :IDFO' +
        'RCLI,'
      
        ' :IDLOTE,            :IDCUSTODIANTE,    :VLRIR,            :FLGS' +
        'TATUSFECHBOL,'
      
        ' :FLGSTATUSORDMOV,   :IDOPERACAODIREITO,:VLRREMUNERACAO,   :VLRI' +
        'RREMUNER,'
      
        ' :PERCENTUAL,        :IDCARTEIRAGERENC, :IDPLANPREVCTBPATR,:IDOP' +
        'ERCUSTODIA)'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 728
    Top = 50
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MOECODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ORIGDEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'QTDEOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PRECOUNITOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLROPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAVENCOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRIR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGSTATUSFECHBOL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGSTATUSORDMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRREMUNERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VLRIRREMUNER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PERCENTUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCUSTODIA'
        ParamType = ptInput
      end>
  end
  object QryInsertOprAcao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO OPRACAO'
      '(IDOPERACAOINVEST, IDBOLSAVALORES, IDACAO, IDEMISSOR)'
      'VALUES'
      '(:IDOPERACAOINVEST,:IDBOLSAVALORES,:IDACAO,:IDEMISSOR)')
    ValidateWithMask = True
    Left = 728
    Top = 94
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBOLSAVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end>
  end
  object QryInsertBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO BOLETA'
      '(IDBOLETA, STATUS, DATABOLETA, IDFORCLI, TIPMOVBOLETA)'
      'VALUES'
      '(:IDBOLETA,:STATUS,:DATABOLETA,:IDFORCLI, :TIPMOVBOLETA)'
      ' ')
    ValidateWithMask = True
    Left = 728
    Top = 139
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATABOLETA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPMOVBOLETA'
        ParamType = ptInput
      end>
  end
  object QryBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBOLETA FROM BOLETA'
      'WHERE IDBOLETA = :IDBOLETA')
    ValidateWithMask = True
    Left = 377
    Top = 139
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end>
  end
  object QryUpdOperacaoDireitoStatus: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE OPERACAODIREITO SET STATUS=:pSTATUS WHERE'
      'IDOPERACAODIREITO = :pIDOPERACAODIREITO')
    ValidateWithMask = True
    Left = 597
    Top = 50
    ParamData = <
      item
        DataType = ftString
        Name = 'pSTATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDOPERACAODIREITO'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaValoresCtbFin: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLNTOTCRE AS VALORPLANILHA'
      'FROM PLANILHA PL'
      'WHERE PL.PLNCODIGO = :PLNCODIGO ')
    ValidateWithMask = True
    Left = 472
    Top = 185
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptInput
      end>
  end
  object QryUpdHistCartInv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '      HISTCARTINV'
      'SET '
      '      PLANO = :pPLANO,'
      '      CODDOCUMENTO = :pCODDOCUMENTO,'
      '      PLNCODIGO = :pPLNCODIGO'
      'WHERE '
      '      IDOPERACAOINVEST IN( SELECT'
      '                              IDOPERACAOINVEST'
      '                           FROM'
      #9#9#9'      OPERACAOINVEST'
      '                           WHERE'
      
        '                              IDOPERACAODIREITO = :pIDOPERACAODI' +
        'REITO)')
    ValidateWithMask = True
    Left = 605
    Top = 229
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pCODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pPLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pIDOPERACAODIREITO'
        ParamType = ptUnknown
      end>
  end
  object QryUpdIrLitigio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '      IRLITIGIO'
      'SET '
      '      PLANO     = :pPLANO,'
      '      PLNCODIGO = :pPLNCODIGO'
      'WHERE'
      '      IDOPERACAOINVEST = :pIDOPERACAOINVEST')
    ValidateWithMask = True
    Left = 605
    Top = 277
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pPLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryCarteiraGerenc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM '
      'CARTEIRAGERENC ')
    ValidateWithMask = True
    Left = 472
    Top = 230
  end
  object QryDestinoSub: TwwQuery
    CachedUpdates = True
    BeforePost = QryDestinoSubBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   INV.DESCINVESTIMENTO,'
      '   0 AS IDCARTEIRAINVEST,'
      '   0 AS IDCUSTODIANTE,'
      '   0 AS IDMOTIVOBLOQUEIO,'
      '   '#39' '#39' AS IDLOTE,'
      '   0 AS QTDEDIREITO,'
      '   0 AS QTDENOVA,'
      '   0 AS VALOREXERCIDO,'
      '   0 AS PERCCUSTO,'
      '   0 AS VLRCUSTO,'
      '   INV.IDINVESTIMENTO,'
      '   0 AS PERCENTUALINV,'
      '   OI.IDOPERACAODIREITO,'
      '   OI.IDOPERACAOINVEST'
      'FROM'
      '   INVESTIMENTO  INV, OPERACAOINVEST OI'
      'WHERE'
      '   OI.IDOPERACAODIREITO = :IDOPERACAODIREITO   AND'
      '   OI.IDCARTEIRAGERENC IS NULL                 AND'
      '   INV.IDINVESTIMENTO   =  OI.IDINVESTIMENTO(+)'
      'ORDER BY INV.DESCINVESTIMENTO'
      ''
      ''
      ''
      ''
      ' ')
    UpdateObject = UpdDestinoSub
    ControlType.Strings = (
      'IDCARTEIRAINVEST;CustomEdit;dblCarteira'
      'IDCUSTODIANTE;CustomEdit;dblCustodiante'
      'IDMOTIVOBLOQUEIO;CustomEdit;dblBloqueio'
      'DESCCARTEIRA;CustomEdit;dblCarteira'
      'DESCCUSTODIANTE;CustomEdit;dblCustodiante'
      'DESCBLOQUEIO;CustomEdit;dblBloqueio'
      'ACAO;CustomEdit;dblAcao')
    ValidateWithMask = True
    Left = 32
    Top = 130
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end>
    object QryDestinoSubACAO: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 14
      FieldKind = fkLookup
      FieldName = 'ACAO'
      LookupDataSet = QryInvestimento
      LookupKeyFields = 'IDINVESTIMENTO'
      LookupResultField = 'DESCINVESTIMENTO'
      KeyFields = 'IDINVESTIMENTO'
      Size = 60
      Lookup = True
    end
    object QryDestinoSubDESCCARTEIRA: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'DESCCARTEIRA'
      LookupDataSet = QryCarteiraInvest
      LookupKeyFields = 'IDCARTEIRAINVEST'
      LookupResultField = 'DESCCARTINVEST'
      KeyFields = 'IDCARTEIRAINVEST'
      Size = 60
      Lookup = True
    end
    object QryDestinoSubDESCCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 9
      FieldKind = fkLookup
      FieldName = 'DESCCUSTODIANTE'
      LookupDataSet = QryCustodiante
      LookupKeyFields = 'IDCUSTODIANTE'
      LookupResultField = 'SGLCUSTODIANTE'
      KeyFields = 'IDCUSTODIANTE'
      Size = 30
      Lookup = True
    end
    object QryDestinoSubDESCBLOQUEIO: TStringField
      DisplayLabel = 'Bloq.'
      DisplayWidth = 4
      FieldKind = fkLookup
      FieldName = 'DESCBLOQUEIO'
      LookupDataSet = qryMotivoBloqueio
      LookupKeyFields = 'IDMOTIVOBLOQUEIO'
      LookupResultField = 'SIGLAMOTBLOQ'
      KeyFields = 'IDMOTIVOBLOQUEIO'
      Lookup = True
    end
    object QryDestinoSubIDLOTE: TStringField
      DisplayLabel = 'Lote'
      DisplayWidth = 12
      FieldName = 'IDLOTE'
      Size = 1
    end
    object QryDestinoSubQTDEDIREITO: TFloatField
      DisplayLabel = 'Qtd. Direito'
      DisplayWidth = 15
      FieldName = 'QTDEDIREITO'
      OnSetText = QryDestinoSubQTDEDIREITOSetText
      DisplayFormat = ',###'
    end
    object QryDestinoSubVALOREXERCIDO: TFloatField
      DisplayLabel = 'Vlr. Exercido'
      DisplayWidth = 18
      FieldName = 'VALOREXERCIDO'
      DisplayFormat = ',##0.00'
      EditFormat = '0.00'
    end
    object QryDestinoSubVLRCUSTO: TFloatField
      DisplayLabel = 'Custo'
      DisplayWidth = 15
      FieldName = 'VLRCUSTO'
      DisplayFormat = ',##0.00'
      EditFormat = '0.00'
    end
    object QryDestinoSubDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 14
      FieldName = 'DESCINVESTIMENTO'
      LookupDataSet = QryInvestimento
      LookupKeyFields = 'IDINVESTIMENTO'
      LookupResultField = 'DESCINVESTIMENTO'
      KeyFields = 'IDINVESTIMENTO'
      Visible = False
      Size = 60
    end
    object QryDestinoSubQTDENOVA: TFloatField
      DisplayLabel = 'Qtd. Prevista'
      DisplayWidth = 15
      FieldName = 'QTDENOVA'
      Visible = False
      DisplayFormat = ',###'
    end
    object QryDestinoSubPERCCUSTO: TFloatField
      DisplayLabel = 'Vlr. Custo'
      DisplayWidth = 17
      FieldName = 'PERCCUSTO'
      Visible = False
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object QryDestinoSubIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryDestinoSubIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object QryDestinoSubIDMOTIVOBLOQUEIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object QryDestinoSubIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object QryDestinoSubPERCENTUALINV: TFloatField
      FieldName = 'PERCENTUALINV'
      Visible = False
    end
    object QryDestinoSubIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object QryDestinoSubIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
  end
  object DsDestinoSub: TwwDataSource
    DataSet = QryDestinoSub
    OnStateChange = DsDestinoSubStateChange
    Left = 189
    Top = 130
  end
  object UpdDestinoSub: TUpdateSQL
    ModifySQL.Strings = (
      'update INVESTIMENTO'
      'set'
      '  QTDEDIREITO = :QTDEDIREITO,'
      '  QTDENOVA = :QTDENOVA,'
      '  VALOREXERCIDO = :VALOREXERCIDO'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    InsertSQL.Strings = (
      'insert into INVESTIMENTO'
      '  (QTDEDIREITO, QTDENOVA, VALOREXERCIDO)'
      'values'
      '  (:QTDEDIREITO, :QTDENOVA, :VALOREXERCIDO)')
    DeleteSQL.Strings = (
      'delete from INVESTIMENTO'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    Left = 114
    Top = 130
  end
  object QryCarteiraInvest: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCARTEIRAINVEST,'
      '   DESCCARTINVEST'
      'FROM'
      '  CARTEIRAINVEST'
      'WHERE'
      '   IDTIPOINVEST = 2'
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 377
    Top = 275
    object QryCarteiraInvestDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Origin = 'CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object QryCarteiraInvestIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
  end
  object QryInvestimento: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   INV.DESCINVESTIMENTO,  '
      '   INV.IDINVESTIMENTO'
      'FROM'
      '   INVESTIMENTO  INV'
      'WHERE'
      '   INV.IDINVESTIMENTO   IN'
      '   (SELECT IDINVESTIMENTO FROM  OPERDIREITOXINV'
      '     WHERE IDOPERACAODIREITO= :IDOPERACAODIREITO'
      '     AND ORIGDEST = '#39'D'#39')'
      'ORDER BY INV.DESCINVESTIMENTO'
      ' ')
    ControlType.Strings = (
      'DESCINVESTIMENTO;CustomEdit;dblAcao')
    ValidateWithMask = True
    Left = 377
    Top = 322
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end>
    object QryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
  end
  object QryCustodiante: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDCUSTODIANTE,'
      '  SGLCUSTODIANTE'
      'FROM'
      '  CUSTODIANTE'
      'ORDER BY'
      '  SGLCUSTODIANTE')
    ValidateWithMask = True
    Left = 377
    Top = 229
    object QryCustodianteSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 10
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
    object QryCustodianteIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Origin = 'CUSTODIANTE.IDCUSTODIANTE'
      Visible = False
    end
  end
  object QryOrigemSub: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '        INV.DESCINVESTIMENTO,'
      '        CA.DESCCARTINVEST,'
      '        C.SGLCUSTODIANTE,'
      
        '        DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL, MB.SIGLAMOTBLOQ) S' +
        'IGLAMOTBLOQ,'
      '        HC.IDLOTE,'
      '        SYSDATE  AS DATAREFERENCIA,'
      '        0 AS QTDE,'
      '        0 AS QTDEDIREITO,'
      '        0 AS VALOREXERCIDO,'
      '        0 AS VLRREMUNERACAO,'
      '        0 AS IR,'
      '        0 AS VLRLIQ,'
      '        0 AS VLRIRREMUNERACAO,'
      '        HC.IDCARTEIRAINVEST,'
      '        HC.IDINVESTIMENTO,'
      '        HC.IDCUSTODIANTE,'
      '        HC.IDMOTIVOBLOQUEIO,'
      '        OXI.PERCENTUALINV,'
      '        0 AS VLRCUSTOATUAL,'
      '        0 AS VLRCUSTO'
      'FROM'
      
        '   HISTCUSTODIA HC, CUSTODIANTE C, MOTIVOBLOQUEIO MB, CARTEIRAIN' +
        'VEST CA,'
      '   INVESTIMENTO INV, OPERDIREITOXINV OXI'
      'WHERE'
      '   HC.IDINVESTIMENTO  IN'
      
        '   (SELECT IDINVESTIMENTO FROM  OPERDIREITOXINV WHERE IDOPERACAO' +
        'DIREITO=:IDOPERACAODIREITO AND ORIGDEST = '#39'O'#39') AND'
      '   OXI.IDOPERACAODIREITO = :IDOPERACAODIREITO   AND'
      '   OXI.ORIGDEST          = '#39'O'#39'                    AND'
      '   HC.IDCARTEIRAINVEST   = CA.IDCARTEIRAINVEST    AND'
      '   HC.IDINVESTIMENTO     = INV.IDINVESTIMENTO     AND'
      '   HC.IDCUSTODIANTE      = C.IDCUSTODIANTE(+)     AND'
      '   HC.IDMOTIVOBLOQUEIO   = MB.IDMOTIVOBLOQUEIO(+) AND'
      '   HC.IDCUSTODIA  IN (SELECT MAX(IDCUSTODIA) FROM HISTCUSTODIA'
      
        '                      WHERE IDINVESTIMENTO IN (SELECT IDINVESTIM' +
        'ENTO'
      
        '                                               FROM OPERDIREITOX' +
        'INV'
      
        '                                               WHERE IDOPERACAOD' +
        'IREITO=:IDOPERACAODIREITO'
      
        '                                                 AND ORIGDEST = ' +
        #39'O'#39' )'
      '                        AND DATAMOVCUSTOD <= :DATAAGE'
      '                      GROUP BY IDINVESTIMENTO, IDMOTIVOBLOQUEIO)'
      'ORDER BY INV.DESCINVESTIMENTO, DESCCARTINVEST, C.SGLCUSTODIANTE,'
      '         DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL, MB.SIGLAMOTBLOQ)')
    UpdateObject = UpdOrigemSub
    ValidateWithMask = True
    Left = 32
    Top = 113
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAAGE'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 26
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object StringField2: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 30
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Quantidade Base'
      DisplayWidth = 17
      FieldName = 'QTDEDIREITO'
      DisplayFormat = '###,###,###,###,###'
    end
    object StringField3: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 15
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object StringField4: TStringField
      DisplayLabel = 'Bloq.'
      DisplayWidth = 4
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 11
      FieldName = 'DATAREFERENCIA'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 17
      FieldName = 'VALOREXERCIDO'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Remuneração'
      DisplayWidth = 12
      FieldName = 'VLRREMUNERACAO'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Valor do IR'
      DisplayWidth = 10
      FieldName = 'IR'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object FloatField5: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 13
      FieldName = 'VLRLIQ'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object FloatField6: TFloatField
      DisplayLabel = 'Custo Atual'
      DisplayWidth = 17
      FieldName = 'VLRCUSTOATUAL'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object StringField5: TStringField
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object FloatField7: TFloatField
      DisplayLabel = 'Quantidade Base'
      FieldName = 'QTDE'
      Visible = False
      DisplayFormat = '###,###,###,###,###'
    end
    object FloatField8: TFloatField
      FieldName = 'VLRIRREMUNERACAO'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object FloatField9: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object FloatField10: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object FloatField11: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object FloatField12: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object FloatField13: TFloatField
      FieldName = 'PERCENTUALINV'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object FloatField14: TFloatField
      FieldName = 'VLRCUSTO'
      Visible = False
      DisplayFormat = ',##0.00'
    end
  end
  object UpdOrigemSub: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCUSTODIA'
      'set'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  IDLOTE = :IDLOTE,'
      '  IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    InsertSQL.Strings = (
      'insert into HISTCUSTODIA'
      
        '  (IDCARTEIRAINVEST, IDINVESTIMENTO, IDCUSTODIANTE, IDLOTE, IDMO' +
        'TIVOBLOQUEIO, '
      '   IDPLANPREVCTBPATR)'
      'values'
      
        '  (:IDCARTEIRAINVEST, :IDINVESTIMENTO, :IDCUSTODIANTE, :IDLOTE, ' +
        ':IDMOTIVOBLOQUEIO, '
      '   :IDPLANPREVCTBPATR)')
    DeleteSQL.Strings = (
      'delete from HISTCUSTODIA'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    Left = 114
    Top = 113
  end
  object DsOrigemSub: TwwDataSource
    DataSet = QryOrigemSub
    Left = 189
    Top = 113
  end
  object QryOrigemIncPerAlt: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '        INV.DESCINVESTIMENTO,'
      '        CA.DESCCARTINVEST,'
      '        C.SGLCUSTODIANTE,'
      
        '        DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL, MB.SIGLAMOTBLOQ) S' +
        'IGLAMOTBLOQ,'
      '        HC.IDLOTE,'
      '        SYSDATE  AS DATAREFERENCIA,'
      '        0 AS QTDE,'
      '        0 AS QTDEDIREITO,'
      '        0 AS VALOREXERCIDO,'
      '        0 AS VLRREMUNERACAO,'
      '        0 AS IR,'
      '        0 AS VLRLIQ,'
      '        0 AS VLRIRREMUNERACAO,'
      '        HC.IDCARTEIRAINVEST,'
      '        HC.IDINVESTIMENTO,'
      '        HC.IDCUSTODIANTE,'
      '        HC.IDMOTIVOBLOQUEIO,'
      '        OXI.PERCENTUALINV,'
      '        0 AS VLRCUSTOATUAL,'
      '        0 AS VLRCUSTO'
      '     FROM'
      
        '        HISTCUSTODIA HC, CUSTODIANTE C, MOTIVOBLOQUEIO MB, CARTE' +
        'IRAINVEST CA,'
      '        INVESTIMENTO INV, OPERDIREITOXINV OXI'
      '     WHERE'
      '        HC.IDINVESTIMENTO  IN'
      
        '        (SELECT IDINVESTIMENTO FROM  OPERDIREITOXINV WHERE IDOPE' +
        'RACAODIREITO=:IDOPERACAODIREITO AND ORIGDEST = '#39'O'#39') AND'
      '        OXI.IDOPERACAODIREITO = :IDOPERACAODIREITO   AND'
      '        OXI.ORIGDEST          = '#39'O'#39'                    AND'
      '        HC.IDCARTEIRAINVEST   = CA.IDCARTEIRAINVEST    AND'
      '        HC.IDINVESTIMENTO     = INV.IDINVESTIMENTO     AND'
      '        HC.IDCUSTODIANTE      = C.IDCUSTODIANTE(+)     AND'
      '        HC.IDMOTIVOBLOQUEIO   = MB.IDMOTIVOBLOQUEIO(+) AND'
      
        '        HC.IDCUSTODIA  IN (SELECT MAX(IDCUSTODIA) FROM HISTCUSTO' +
        'DIA'
      '                           WHERE'
      
        '                                IDINVESTIMENTO IN (SELECT IDINVE' +
        'STIMENTO'
      
        '                                                    FROM OPERDIR' +
        'EITOXINV'
      
        '                                                    WHERE IDOPER' +
        'ACAODIREITO=:IDOPERACAODIREITO AND'
      
        '                                                          ORIGDE' +
        'ST = '#39'O'#39' )  AND DATAMOVCUSTOD <= :DATAAGE'
      '                           GROUP BY IDMOTIVOBLOQUEIO)'
      
        '     ORDER BY INV.DESCINVESTIMENTO, DESCCARTINVEST, C.SGLCUSTODI' +
        'ANTE,'
      
        '                           DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL,' +
        ' MB.SIGLAMOTBLOQ)')
    UpdateObject = UpdOrigemIncPerAlt
    ValidateWithMask = True
    Left = 32
    Top = 177
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAAGE'
        ParamType = ptUnknown
      end>
    object StringField7: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 25
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object StringField8: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 30
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object FloatField19: TFloatField
      DisplayLabel = 'Quantidade Base'
      DisplayWidth = 20
      FieldName = 'QTDEDIREITO'
      DisplayFormat = '###,###,###,###,###'
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 10
      FieldName = 'DATAREFERENCIA'
    end
    object FloatField24: TFloatField
      DisplayLabel = 'Custo Atual'
      DisplayWidth = 19
      FieldName = 'VLRCUSTOATUAL'
      DisplayFormat = ',##0.00'
    end
    object FloatField20: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 15
      FieldName = 'VALOREXERCIDO'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object FloatField25: TFloatField
      DisplayLabel = 'Quantidade Base'
      DisplayWidth = 10
      FieldName = 'QTDE'
      Visible = False
      DisplayFormat = '###,###,###,###,###'
    end
    object FloatField21: TFloatField
      DisplayLabel = 'Remuneração'
      DisplayWidth = 12
      FieldName = 'VLRREMUNERACAO'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object FloatField22: TFloatField
      DisplayLabel = 'Valor do IR'
      DisplayWidth = 10
      FieldName = 'IR'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object FloatField23: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 13
      FieldName = 'VLRLIQ'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object StringField9: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 15
      FieldName = 'SGLCUSTODIANTE'
      Visible = False
      Size = 10
    end
    object StringField10: TStringField
      DisplayLabel = 'Bloq.'
      DisplayWidth = 4
      FieldName = 'SIGLAMOTBLOQ'
      Visible = False
      Size = 3
    end
    object StringField11: TStringField
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object FloatField26: TFloatField
      FieldName = 'VLRIRREMUNERACAO'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object FloatField27: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object FloatField28: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object FloatField29: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object FloatField30: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object FloatField31: TFloatField
      FieldName = 'PERCENTUALINV'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object FloatField32: TFloatField
      FieldName = 'VLRCUSTO'
      Visible = False
      DisplayFormat = ',##0.00'
    end
  end
  object UpdOrigemIncPerAlt: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCUSTODIA'
      'set'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  IDLOTE = :IDLOTE,'
      '  IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    InsertSQL.Strings = (
      'insert into HISTCUSTODIA'
      
        '  (IDCARTEIRAINVEST, IDINVESTIMENTO, IDCUSTODIANTE, IDLOTE, IDMO' +
        'TIVOBLOQUEIO, '
      '   IDPLANPREVCTBPATR)'
      'values'
      
        '  (:IDCARTEIRAINVEST, :IDINVESTIMENTO, :IDCUSTODIANTE, :IDLOTE, ' +
        ':IDMOTIVOBLOQUEIO, '
      '   :IDPLANPREVCTBPATR)')
    DeleteSQL.Strings = (
      'delete from HISTCUSTODIA'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    Left = 114
    Top = 177
  end
  object DsOrigemIncPerAlt: TwwDataSource
    DataSet = QryOrigemIncPerAlt
    Left = 189
    Top = 177
  end
  object QryDestinoIncPerAlt: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    BeforePost = QryDestinoIncPerAltBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   INV.DESCINVESTIMENTO,'
      '   OI.IDCARTEIRAINVEST,'
      '   HC.IDCUSTODIANTE,'
      '   HC.IDMOTIVOBLOQUEIO,'
      '   '#39' '#39' AS IDLOTE,'
      '   OI.QTDEOPERACAO AS QTDEDIREITO,'
      '   0 AS QTDENOVA,'
      '   0 AS VALOREXERCIDO,'
      '   0 AS PERCCUSTO,'
      '   0 AS VLRCUSTO,'
      '   INV.IDINVESTIMENTO,'
      '   0 AS PERCENTUALINV,'
      '   OI.IDOPERACAODIREITO,'
      '   OI.IDOPERACAOINVEST'
      'FROM'
      
        '   HISTCUSTODIA HC, OPERACAOINVEST OI, INVESTIMENTO INV, OPERDIR' +
        'EITOXINV OX'
      'WHERE'
      '   OX.IDOPERACAODIREITO = :IDOPERACAODIREITO    AND'
      '   OX.ORIGDEST          = '#39'D'#39'                   AND'
      '   OI.ORIGDEST          = '#39'D'#39'                   AND   '
      '   OI.IDOPERACAODIREITO = OX.IDOPERACAODIREITO  AND'
      '   OI.IDINVESTIMENTO    = OX.IDINVESTIMENTO     AND'
      '   OI.IDCARTEIRAGERENC IS NULL                  AND'
      '   INV.IDINVESTIMENTO   =  OI.IDINVESTIMENTO(+) AND'
      '   HC.IDOPERACAOINVEST  =  OI.IDOPERACAOINVEST'
      'ORDER BY INV.DESCINVESTIMENTO'
      ' ')
    UpdateObject = UpdDestinoIncPerAlt
    ControlType.Strings = (
      'IDCARTEIRAINVEST;CustomEdit;dblCarteira'
      'IDCUSTODIANTE;CustomEdit;dblCustodiante'
      'IDMOTIVOBLOQUEIO;CustomEdit;dblBloqueio'
      'DESCCARTEIRA;CustomEdit;dblCarteira'
      'DESCCUSTODIANTE;CustomEdit;dblCustodiante'
      'DESCBLOQUEIO;CustomEdit;dblBloqueio'
      'ACAO;CustomEdit;dblAcao')
    ValidateWithMask = True
    Left = 32
    Top = 193
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end>
    object QryDestinoIncPerAltACAO: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'ACAO'
      LookupDataSet = QryInvestimento
      LookupKeyFields = 'IDINVESTIMENTO'
      LookupResultField = 'DESCINVESTIMENTO'
      KeyFields = 'IDINVESTIMENTO'
      Size = 60
      Lookup = True
    end
    object QryDestinoIncPerAltDESCCARTEIRA: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 21
      FieldKind = fkLookup
      FieldName = 'DESCCARTEIRA'
      LookupDataSet = QryCarteiraInvest
      LookupKeyFields = 'IDCARTEIRAINVEST'
      LookupResultField = 'DESCCARTINVEST'
      KeyFields = 'IDCARTEIRAINVEST'
      Size = 60
      Lookup = True
    end
    object QryDestinoIncPerAltDESCCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 13
      FieldKind = fkLookup
      FieldName = 'DESCCUSTODIANTE'
      LookupDataSet = QryCustodiante
      LookupKeyFields = 'IDCUSTODIANTE'
      LookupResultField = 'SGLCUSTODIANTE'
      KeyFields = 'IDCUSTODIANTE'
      Size = 30
      Lookup = True
    end
    object QryDestinoIncPerAltDESCBLOQUEIO: TStringField
      DisplayLabel = 'Bloq.'
      DisplayWidth = 4
      FieldKind = fkLookup
      FieldName = 'DESCBLOQUEIO'
      LookupDataSet = qryMotivoBloqueio
      LookupKeyFields = 'IDMOTIVOBLOQUEIO'
      LookupResultField = 'SIGLAMOTBLOQ'
      KeyFields = 'IDMOTIVOBLOQUEIO'
      Lookup = True
    end
    object QryDestinoIncPerAltQTDEDIREITO: TFloatField
      DisplayLabel = 'Qtd. Direito'
      DisplayWidth = 15
      FieldName = 'QTDEDIREITO'
      OnSetText = QryDestinoIncPerAltQTDEDIREITOSetText
      DisplayFormat = ',###'
    end
    object QryDestinoIncPerAltQTDENOVA: TFloatField
      DisplayLabel = 'Qtd. Prevista'
      DisplayWidth = 15
      FieldName = 'QTDENOVA'
      DisplayFormat = ',###'
    end
    object QryDestinoIncPerAltVLRCUSTO: TFloatField
      DisplayLabel = 'Custo'
      DisplayWidth = 15
      FieldName = 'VLRCUSTO'
      DisplayFormat = ',##0.00'
      EditFormat = '0.00'
    end
    object QryDestinoIncPerAltIDLOTE: TStringField
      DisplayLabel = 'Lote'
      DisplayWidth = 12
      FieldName = 'IDLOTE'
      Visible = False
      Size = 1
    end
    object QryDestinoIncPerAltVALOREXERCIDO: TFloatField
      DisplayLabel = 'Vlr. Exercido'
      DisplayWidth = 18
      FieldName = 'VALOREXERCIDO'
      Visible = False
      DisplayFormat = ',##0.00'
      EditFormat = '0.00'
    end
    object QryDestinoIncPerAltDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 14
      FieldName = 'DESCINVESTIMENTO'
      LookupDataSet = QryInvestimento
      LookupKeyFields = 'IDINVESTIMENTO'
      LookupResultField = 'DESCINVESTIMENTO'
      KeyFields = 'IDINVESTIMENTO'
      Visible = False
      Size = 60
    end
    object QryDestinoIncPerAltPERCCUSTO: TFloatField
      DisplayLabel = 'Vlr. Custo'
      DisplayWidth = 17
      FieldName = 'PERCCUSTO'
      Visible = False
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object QryDestinoIncPerAltIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryDestinoIncPerAltIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object QryDestinoIncPerAltIDMOTIVOBLOQUEIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object QryDestinoIncPerAltIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object QryDestinoIncPerAltPERCENTUALINV: TFloatField
      FieldName = 'PERCENTUALINV'
      Visible = False
    end
    object QryDestinoIncPerAltIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object QryDestinoIncPerAltIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
  end
  object UpdDestinoIncPerAlt: TUpdateSQL
    ModifySQL.Strings = (
      'update INVESTIMENTO'
      'set'
      '  QTDEDIREITO = :QTDEDIREITO,'
      '  QTDENOVA = :QTDENOVA,'
      '  VALOREXERCIDO = :VALOREXERCIDO'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    InsertSQL.Strings = (
      'insert into INVESTIMENTO'
      '  (QTDEDIREITO, QTDENOVA, VALOREXERCIDO)'
      'values'
      '  (:QTDEDIREITO, :QTDENOVA, :VALOREXERCIDO)')
    DeleteSQL.Strings = (
      'delete from INVESTIMENTO'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    Left = 114
    Top = 193
  end
  object DsDestinoIncPerAlt: TwwDataSource
    DataSet = QryDestinoIncPerAlt
    OnStateChange = DsDestinoIncPerAltStateChange
    Left = 189
    Top = 193
  end
  object QryUpdOperacaoDireitoParc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE OPERACAODIREITO SET'
      '       QTDERECDIRPARC    =:P_QTDERECDIRPARC'
      'WHERE'
      '       IDOPERACAODIREITO =:P_IDOPERACAODIREITO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 598
    Top = 94
    ParamData = <
      item
        DataType = ftFloat
        Name = 'P_QTDERECDIRPARC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_IDOPERACAODIREITO'
        ParamType = ptInput
      end>
  end
  object QryBuscaFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCFUNDOINVEST, DESCTIPOOPERACAO'
      'FROM'
      '       PEDIDOFUNDO PF, FUNDOINVEST FI, TIPOOPERACAO TP'
      'WHERE'
      '       PF.IDPEDIDOFUNDO  = :IDPEDIDOFUNDO    AND'
      '       FI.IDFUNDOINVEST  = PF.IDFUNDOINVEST  AND'
      '       TP.IDTIPOOPERACAO = PF.IDTIPOOPERACAO'
      ' ')
    ValidateWithMask = True
    Left = 472
    Top = 277
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPEDIDOFUNDO'
        ParamType = ptUnknown
      end>
  end
  object UpdOrigDivJurAnu: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCUSTODIA'
      'set'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  IDLOTE = :IDLOTE,'
      '  IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    InsertSQL.Strings = (
      'insert into HISTCUSTODIA'
      
        '  (IDCARTEIRAINVEST, IDINVESTIMENTO, IDCUSTODIANTE, IDLOTE, IDMO' +
        'TIVOBLOQUEIO, '
      '   IDPLANPREVCTBPATR)'
      'values'
      
        '  (:IDCARTEIRAINVEST, :IDINVESTIMENTO, :IDCUSTODIANTE, :IDLOTE, ' +
        ':IDMOTIVOBLOQUEIO, '
      '   :IDPLANPREVCTBPATR)')
    DeleteSQL.Strings = (
      'delete from HISTCUSTODIA'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    Left = 118
    Top = 50
  end
  object QryOrigDivJurAnu: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   INV.DESCINVESTIMENTO,'
      '   TP.DESCTIPOOPERACAO,'
      '   CA.DESCCARTINVEST,'
      '   C.SGLCUSTODIANTE,'
      
        '   DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL, MB.SIGLAMOTBLOQ) SIGLAM' +
        'OTBLOQ,'
      '   HC.IDLOTE,'
      '   DATAOPERACAO AS DATAREFERENCIA,'
      '   QTDEOPERACAO AS QTDE,'
      '   QTDEOPERACAO AS QTDEDIREITO,'
      '   VLROPERACAO AS VALOREXERCIDO,'
      '   VLRREMUNERACAO,'
      '   VLRIR+VLRREMUNERACAO AS IR,'
      '   VLROPERACAO-(VLRIR+VLRREMUNERACAO) AS VLRLIQ,'
      '   0 AS VLRIRREMUNERACAO,'
      '   HC.IDCARTEIRAINVEST,'
      '   HC.IDINVESTIMENTO,'
      '   HC.IDCUSTODIANTE,'
      '   HC.IDMOTIVOBLOQUEIO,'
      '   OXI.PERCENTUALINV,'
      '   0 AS VLRCUSTOATUAL,'
      '   0 AS VLRCUSTO'
      'FROM'
      
        '   OPERACAOINVEST OP, HISTCUSTODIA HC, CUSTODIANTE C, MOTIVOBLOQ' +
        'UEIO MB,'
      
        '   CARTEIRAINVEST CA, INVESTIMENTO INV, OPERDIREITOXINV OXI, TIP' +
        'OOPERACAO TP'
      'WHERE'
      '   OP.IDOPERACAODIREITO  = :P_IDOPERACAODIREITO   AND'
      '   HC.IDINVESTIMENTO(+)  = OP.IDINVESTIMENTO      AND'
      '   HC.IDCUSTODIANTE      = C.IDCUSTODIANTE(+)     AND'
      '   HC.IDMOTIVOBLOQUEIO   = MB.IDMOTIVOBLOQUEIO(+) AND'
      '   INV.IDINVESTIMENTO    = OP.IDINVESTIMENTO      AND'
      '   OXI.IDOPERACAODIREITO = OP.IDOPERACAODIREITO   AND'
      '   OXI.ORIGDEST          = '#39'O'#39'                    AND'
      '   CA.IDCARTEIRAINVEST   = OP.IDCARTEIRAINVEST    AND'
      '   TP.IDTIPOOPERACAO     = OP.IDTIPOOPERACAO'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpdOrigDivJurAnu
    ValidateWithMask = True
    Left = 36
    Top = 50
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_IDOPERACAODIREITO'
        ParamType = ptUnknown
      end>
    object StringField12: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 15
      FieldName = 'DESCINVESTIMENTO'
      ReadOnly = True
      Size = 60
    end
    object StringField13: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 16
      FieldName = 'DESCCARTINVEST'
      ReadOnly = True
      Size = 60
    end
    object QryOrigDivJurAnuDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 15
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = 'Data Prevista'
      DisplayWidth = 10
      FieldName = 'DATAREFERENCIA'
      ReadOnly = True
    end
    object FloatField33: TFloatField
      DisplayLabel = 'Quantidade Base'
      DisplayWidth = 17
      FieldName = 'QTDEDIREITO'
      DisplayFormat = '###,###,###,###,###'
    end
    object FloatField34: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 17
      FieldName = 'VALOREXERCIDO'
      ReadOnly = True
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object FloatField35: TFloatField
      DisplayLabel = 'Remuneração'
      DisplayWidth = 12
      FieldName = 'VLRREMUNERACAO'
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object FloatField36: TFloatField
      DisplayLabel = 'Valor do IR'
      DisplayWidth = 10
      FieldName = 'IR'
      ReadOnly = True
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object FloatField37: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 13
      FieldName = 'VLRLIQ'
      ReadOnly = True
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object StringField14: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 9
      FieldName = 'SGLCUSTODIANTE'
      ReadOnly = True
      Size = 10
    end
    object StringField15: TStringField
      DisplayLabel = 'Bloq.'
      DisplayWidth = 4
      FieldName = 'SIGLAMOTBLOQ'
      ReadOnly = True
      Size = 3
    end
    object FloatField38: TFloatField
      DisplayLabel = 'Custo Atual'
      DisplayWidth = 17
      FieldName = 'VLRCUSTOATUAL'
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object FloatField39: TFloatField
      DisplayLabel = 'Quantidade Base'
      DisplayWidth = 15
      FieldName = 'QTDE'
      ReadOnly = True
      Visible = False
      DisplayFormat = '###,###,###,###,###'
      EditFormat = '##0'
    end
    object FloatField40: TFloatField
      DisplayLabel = 'Custo Previsto'
      DisplayWidth = 17
      FieldName = 'VLRCUSTO'
      Visible = False
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object StringField16: TStringField
      DisplayLabel = 'Lote'
      DisplayWidth = 6
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object FloatField41: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object FloatField42: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object FloatField43: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object FloatField44: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object FloatField45: TFloatField
      FieldName = 'VLRIRREMUNERACAO'
      Visible = False
    end
    object FloatField46: TFloatField
      FieldName = 'PERCENTUALINV'
      Visible = False
    end
  end
  object DsOrigDivJurAnu: TwwDataSource
    DataSet = QryOrigDivJurAnu
    Left = 193
    Top = 50
  end
  object QryOperacaoInvestOrigem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    VLRREMUNERACAO,'
      '    VLRIRREMUNER,'
      '    VLROPERACAO,'
      '    QTDEOPERACAO,'
      '    NUMDOCUMENTO,'
      '    DATAOPERACAO'
      'FROM'
      '    OPERACAOINVEST'
      'WHERE'
      '   (IDOPERACAODIREITO = :IDOPERACAODIREITO) AND'
      
        ' (((:IDCARTEIRAINVEST IS NOT NULL) AND (IDCARTEIRAINVEST=:IDCART' +
        'EIRAINVEST)) OR'
      '   (:IDCARTEIRAINVEST IS NULL))             AND'
      '   (IDCARTEIRAGERENC  IS NULL)'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 377
    Top = 50
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end>
  end
  object QryOrigemGrupamento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '        INV.DESCINVESTIMENTO,'
      '        CA.DESCCARTINVEST,'
      '        C.SGLCUSTODIANTE,'
      
        '        DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL, MB.SIGLAMOTBLOQ) S' +
        'IGLAMOTBLOQ,'
      '        HC.IDLOTE,'
      '        SYSDATE  AS DATAREFERENCIA,'
      '        0 AS QTDE,'
      '        0 AS QTDEDIREITO,'
      '        0 AS VALOREXERCIDO,'
      '        0 AS VLRREMUNERACAO,'
      '        0 AS IR,'
      '        0 AS VLRLIQ,'
      '        0 AS VLRIRREMUNERACAO,'
      '        HC.IDCARTEIRAINVEST,'
      '        HC.IDINVESTIMENTO,'
      '        HC.IDCUSTODIANTE,'
      '        HC.IDMOTIVOBLOQUEIO,'
      '        OXI.PERCENTUALINV,'
      '        0 AS VLRCUSTOATUAL,'
      '        0 AS VLRCUSTO'
      '     FROM'
      
        '        HISTCUSTODIA HC, CUSTODIANTE C, MOTIVOBLOQUEIO MB, CARTE' +
        'IRAINVEST CA,'
      '        INVESTIMENTO INV, OPERDIREITOXINV OXI'
      '     WHERE'
      '        HC.IDINVESTIMENTO  IN'
      
        '        (SELECT IDINVESTIMENTO FROM OPERDIREITOXINV WHERE IDOPER' +
        'ACAODIREITO=:IDOPERACAODIREITO AND ORIGDEST = '#39'O'#39') AND'
      '        OXI.IDOPERACAODIREITO = :IDOPERACAODIREITO     AND'
      '        OXI.ORIGDEST          = '#39'O'#39'                    AND'
      '        HC.IDCARTEIRAINVEST   = CA.IDCARTEIRAINVEST    AND'
      '        HC.IDINVESTIMENTO     = INV.IDINVESTIMENTO     AND'
      '        HC.IDCUSTODIANTE      = C.IDCUSTODIANTE(+)     AND'
      '        HC.IDMOTIVOBLOQUEIO   = MB.IDMOTIVOBLOQUEIO(+) AND'
      
        '        HC.IDCUSTODIA  IN (SELECT MAX(IDCUSTODIA) FROM HISTCUSTO' +
        'DIA'
      '                           WHERE'
      
        '                                IDINVESTIMENTO IN (SELECT IDINVE' +
        'STIMENTO'
      
        '                                                    FROM OPERDIR' +
        'EITOXINV'
      
        '                                                    WHERE IDOPER' +
        'ACAODIREITO=:IDOPERACAODIREITO AND'
      
        '                                                          ORIGDE' +
        'ST = '#39'O'#39' )  AND'
      '                                DATAMOVCUSTOD <= :DATAAGE'
      
        '                           GROUP BY IDCARTEIRAINVEST, IDMOTIVOBL' +
        'OQUEIO)'
      
        '     ORDER BY INV.DESCINVESTIMENTO, DESCCARTINVEST, C.SGLCUSTODI' +
        'ANTE,'
      
        '                           DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL,' +
        ' MB.SIGLAMOTBLOQ)'
      ''
      ' '
      ' ')
    UpdateObject = UpdOrigemGrupamento
    ValidateWithMask = True
    Left = 32
    Top = 300
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAAGE'
        ParamType = ptUnknown
      end>
    object QryOrigemGrupamentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 26
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryOrigemGrupamentoDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 30
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object QryOrigemGrupamentoQTDEDIREITO: TFloatField
      DisplayLabel = 'Quantidade Base'
      DisplayWidth = 18
      FieldName = 'QTDEDIREITO'
      OnSetText = QryOrigemGrupamentoQTDEDIREITOSetText
      DisplayFormat = '###,###,###,###,###'
    end
    object QryOrigemGrupamentoSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 15
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object QryOrigemGrupamentoSIGLAMOTBLOQ: TStringField
      DisplayLabel = 'Bloq.'
      DisplayWidth = 3
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object QryOrigemGrupamentoDATAREFERENCIA: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 10
      FieldName = 'DATAREFERENCIA'
    end
    object QryOrigemGrupamentoIDLOTE: TStringField
      DisplayWidth = 10
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object QryOrigemGrupamentoQTDE: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDE'
      Visible = False
      DisplayFormat = '###,###,###,###,###'
    end
    object QryOrigemGrupamentoVALOREXERCIDO: TFloatField
      DisplayWidth = 10
      FieldName = 'VALOREXERCIDO'
      Visible = False
      OnSetText = QryOrigemGrupamentoVALOREXERCIDOSetText
      DisplayFormat = ',##0.00'
    end
    object QryOrigemGrupamentoVLRREMUNERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRREMUNERACAO'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object QryOrigemGrupamentoIR: TFloatField
      DisplayWidth = 10
      FieldName = 'IR'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object QryOrigemGrupamentoVLRLIQ: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRLIQ'
      Visible = False
      OnSetText = QryOrigemGrupamentoVLRLIQSetText
      DisplayFormat = ',##0.00'
    end
    object QryOrigemGrupamentoVLRIRREMUNERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRIRREMUNERACAO'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object QryOrigemGrupamentoIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryOrigemGrupamentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object QryOrigemGrupamentoIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object QryOrigemGrupamentoIDMOTIVOBLOQUEIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object QryOrigemGrupamentoPERCENTUALINV: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCENTUALINV'
      Visible = False
    end
    object QryOrigemGrupamentoVLRCUSTOATUAL: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRCUSTOATUAL'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object QryOrigemGrupamentoVLRCUSTO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRCUSTO'
      Visible = False
      DisplayFormat = ',##0.00'
    end
  end
  object UpdOrigemGrupamento: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCUSTODIA'
      'set'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  IDLOTE = :IDLOTE,'
      '  IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    InsertSQL.Strings = (
      'insert into HISTCUSTODIA'
      
        '  (IDCARTEIRAINVEST, IDINVESTIMENTO, IDCUSTODIANTE, IDLOTE, IDMO' +
        'TIVOBLOQUEIO, '
      '   IDPLANPREVCTBPATR)'
      'values'
      
        '  (:IDCARTEIRAINVEST, :IDINVESTIMENTO, :IDCUSTODIANTE, :IDLOTE, ' +
        ':IDMOTIVOBLOQUEIO, '
      '   :IDPLANPREVCTBPATR)')
    DeleteSQL.Strings = (
      'delete from HISTCUSTODIA'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    Left = 114
    Top = 300
  end
  object DsOrigemGrupamento: TwwDataSource
    DataSet = QryOrigemGrupamento
    Left = 189
    Top = 300
  end
  object QryDestinoGrupamento: TwwQuery
    CachedUpdates = True
    BeforePost = QryDestinoGrupamentoBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   INV.DESCINVESTIMENTO,'
      '   OI.IDCARTEIRAINVEST,'
      '   HC.IDCUSTODIANTE,'
      '   HC.IDMOTIVOBLOQUEIO,'
      '   '#39' '#39' AS IDLOTE,'
      '   OI.QTDEOPERACAO AS QTDEDIREITO,'
      '   0 AS QTDENOVA,'
      '   0 AS VALOREXERCIDO,'
      '   0 AS PERCCUSTO,'
      '   0 AS VLRCUSTO,'
      '   INV.IDINVESTIMENTO,'
      '   0 AS PERCENTUALINV,'
      '   OI.IDOPERACAODIREITO,'
      '   OI.IDOPERACAOINVEST,'
      '   OX.ORIGDEST'
      'FROM'
      
        '   HISTCUSTODIA HC, OPERACAOINVEST OI, INVESTIMENTO INV, OPERDIR' +
        'EITOXINV OX'
      'WHERE'
      '   OX.IDOPERACAODIREITO = :IDOPERACAODIREITO    AND'
      '   OX.ORIGDEST          = '#39'D'#39'                   AND'
      '   OI.ORIGDEST          = '#39'D'#39'                   AND'
      '   OI.IDOPERACAODIREITO = OX.IDOPERACAODIREITO  AND'
      '   OI.IDINVESTIMENTO    = OX.IDINVESTIMENTO     AND'
      '   OI.IDCARTEIRAGERENC IS NULL                  AND'
      '   INV.IDINVESTIMENTO   =  OI.IDINVESTIMENTO(+) AND'
      '   HC.IDOPERACAOINVEST  = OI.IDOPERACAOINVEST'
      'ORDER BY INV.DESCINVESTIMENTO')
    UpdateObject = UpdDestinoGrupamento
    ControlType.Strings = (
      'IDCARTEIRAINVEST;CustomEdit;dblCarteira'
      'IDCUSTODIANTE;CustomEdit;dblCustodiante'
      'IDMOTIVOBLOQUEIO;CustomEdit;dblBloqueio'
      'DESCCARTEIRA;CustomEdit;dblCarteira'
      'DESCCUSTODIANTE;CustomEdit;dblCustodiante'
      'DESCBLOQUEIO;CustomEdit;dblBloqueio'
      'ACAO;CustomEdit;dblAcao')
    ValidateWithMask = True
    Left = 32
    Top = 317
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end>
    object StringField22: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'ACAO'
      LookupDataSet = QryInvestimento
      LookupKeyFields = 'IDINVESTIMENTO'
      LookupResultField = 'DESCINVESTIMENTO'
      KeyFields = 'IDINVESTIMENTO'
      Size = 60
      Lookup = True
    end
    object StringField23: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 24
      FieldKind = fkLookup
      FieldName = 'DESCCARTEIRA'
      LookupDataSet = QryCarteiraInvest
      LookupKeyFields = 'IDCARTEIRAINVEST'
      LookupResultField = 'DESCCARTINVEST'
      KeyFields = 'IDCARTEIRAINVEST'
      Size = 60
      Lookup = True
    end
    object StringField24: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 13
      FieldKind = fkLookup
      FieldName = 'DESCCUSTODIANTE'
      LookupDataSet = QryCustodiante
      LookupKeyFields = 'IDCUSTODIANTE'
      LookupResultField = 'SGLCUSTODIANTE'
      KeyFields = 'IDCUSTODIANTE'
      Lookup = True
    end
    object StringField25: TStringField
      DisplayLabel = 'Bloq.'
      DisplayWidth = 4
      FieldKind = fkLookup
      FieldName = 'DESCBLOQUEIO'
      LookupDataSet = qryMotivoBloqueio
      LookupKeyFields = 'IDMOTIVOBLOQUEIO'
      LookupResultField = 'SIGLAMOTBLOQ'
      KeyFields = 'IDMOTIVOBLOQUEIO'
      Lookup = True
    end
    object QryDestinoGrupamentoQTDEDIREITO: TFloatField
      DisplayLabel = 'Qtd. Direito'
      DisplayWidth = 15
      FieldName = 'QTDEDIREITO'
      OnSetText = QryDestinoGrupamentoQTDEDIREITOSetText
      DisplayFormat = ',###'
    end
    object FloatField72: TFloatField
      DisplayLabel = 'Qtd. Prevista'
      DisplayWidth = 15
      FieldName = 'QTDENOVA'
      DisplayFormat = ',###'
    end
    object FloatField62: TFloatField
      DisplayLabel = 'Custo'
      DisplayWidth = 12
      FieldName = 'VLRCUSTO'
      DisplayFormat = ',##0.00'
      EditFormat = '0.00'
    end
    object StringField26: TStringField
      DisplayLabel = 'Lote'
      DisplayWidth = 12
      FieldName = 'IDLOTE'
      Visible = False
      Size = 1
    end
    object FloatField63: TFloatField
      DisplayLabel = 'Vlr. Exercido'
      DisplayWidth = 18
      FieldName = 'VALOREXERCIDO'
      Visible = False
      DisplayFormat = ',##0.00'
      EditFormat = '0.00'
    end
    object StringField27: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 14
      FieldName = 'DESCINVESTIMENTO'
      LookupDataSet = QryInvestimento
      LookupKeyFields = 'IDINVESTIMENTO'
      LookupResultField = 'DESCINVESTIMENTO'
      KeyFields = 'IDINVESTIMENTO'
      Visible = False
      Size = 60
    end
    object FloatField64: TFloatField
      DisplayLabel = 'Vlr. Custo'
      DisplayWidth = 17
      FieldName = 'PERCCUSTO'
      Visible = False
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object FloatField65: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object FloatField66: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object FloatField67: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object FloatField68: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object FloatField69: TFloatField
      FieldName = 'PERCENTUALINV'
      Visible = False
    end
    object FloatField70: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object QryDestinoGrupamentoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
    object QryDestinoGrupamentoORIGDEST: TStringField
      FieldName = 'ORIGDEST'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object UpdDestinoGrupamento: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOINVEST'
      'set'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDLOTE = :IDLOTE,'
      '  IDOPERACAODIREITO = :IDOPERACAODIREITO,'
      '  ORIGDEST = :ORIGDEST'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDOPERACAODIREITO = :OLD_IDOPERACAODIREITO and'
      '  ORIGDEST = :OLD_ORIGDEST')
    InsertSQL.Strings = (
      'insert into OPERACAOINVEST'
      '  (IDOPERACAOINVEST, IDCUSTODIANTE, IDCARTEIRAINVEST, '
      'IDINVESTIMENTO, IDLOTE, '
      '   IDOPERACAODIREITO, ORIGDEST)'
      'values'
      '  (:IDOPERACAOINVEST, :IDCUSTODIANTE, :IDCARTEIRAINVEST, '
      ':IDINVESTIMENTO, '
      '   :IDLOTE, :IDOPERACAODIREITO, :ORIGDEST)')
    DeleteSQL.Strings = (
      'delete from OPERACAOINVEST'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDOPERACAODIREITO = :OLD_IDOPERACAODIREITO and'
      '  ORIGDEST = :OLD_ORIGDEST')
    Left = 114
    Top = 317
  end
  object DsDestinoGrupamento: TwwDataSource
    DataSet = QryDestinoGrupamento
    OnStateChange = DsDestinoIncPerAltStateChange
    Left = 189
    Top = 317
  end
  object QryUpdOperDiretoXInv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE OPERDIREITOXINV SET'
      '       IDOPERACAOINVEST  =:IDOPERACAOINVEST'
      'WHERE  IDOPERACAODIREITO =:IDOPERACAODIREITO AND'
      #9' ORIGDEST'#9' =:ORIGDEST'
      ' ')
    ValidateWithMask = True
    Left = 598
    Top = 139
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ORIGDEST'
        ParamType = ptInput
      end>
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 727
    Top = 229
  end
  object qryAuxiliar: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 727
    Top = 184
  end
  object qryAtualizaBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE BOLETA'
      'SET STATUS       = '#39'F'#39','
      '         PLANO   = :PLANO,'
      '     PLNCODIGO   = :PLNCODIGO,'
      '  CODDOCUMENTO   = :CODDOCUMENTO'
      '  '
      'WHERE IDBOLETA   = :BOLETA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 377
    Top = 369
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BOLETA'
        ParamType = ptUnknown
      end>
  end
  object qryUpdOperDirCtbFin: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE OPERACAODIREITO'
      'SET PLANO = :PLANO,'
      '    PLNCODIGO = :PLNCODIGO,'
      '    CODDOCUMENTO = :CODDOCUMENTO'
      'WHERE IDOPERACAODIREITO = :IDOPERACAODIREITO'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 597
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptInput
      end>
  end
  object QryOrigemDesdobramento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '        INV.DESCINVESTIMENTO,'
      '        CA.DESCCARTINVEST,'
      '        C.SGLCUSTODIANTE,'
      
        '        DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL, MB.SIGLAMOTBLOQ) S' +
        'IGLAMOTBLOQ,'
      '        HC.IDLOTE,'
      '        SYSDATE  AS DATAREFERENCIA,'
      '        0 AS QTDE,'
      '        0 AS QTDEDIREITO,'
      '        0 AS VALOREXERCIDO,'
      '        0 AS VLRREMUNERACAO,'
      '        0 AS IR,'
      '        0 AS VLRLIQ,'
      '        0 AS VLRIRREMUNERACAO,'
      '        HC.IDCARTEIRAINVEST,'
      '        HC.IDINVESTIMENTO,'
      '        HC.IDCUSTODIANTE,'
      '        HC.IDMOTIVOBLOQUEIO,'
      '        OXI.PERCENTUALINV,'
      '        0 AS VLRCUSTOATUAL,'
      '        0 AS VLRCUSTO'
      '     FROM'
      
        '        HISTCUSTODIA HC, CUSTODIANTE C, MOTIVOBLOQUEIO MB, CARTE' +
        'IRAINVEST CA,'
      '        INVESTIMENTO INV, OPERDIREITOXINV OXI'
      '     WHERE'
      '        HC.IDINVESTIMENTO  IN'
      
        '        (SELECT IDINVESTIMENTO FROM  OPERDIREITOXINV WHERE IDOPE' +
        'RACAODIREITO=:IDOPERACAODIREITO AND ORIGDEST = '#39'O'#39') AND'
      '        OXI.IDOPERACAODIREITO = :IDOPERACAODIREITO     AND'
      '        OXI.ORIGDEST          = '#39'O'#39'                    AND'
      '        HC.IDCARTEIRAINVEST   = CA.IDCARTEIRAINVEST    AND'
      '        HC.IDINVESTIMENTO     = INV.IDINVESTIMENTO     AND'
      '        HC.IDCUSTODIANTE      = C.IDCUSTODIANTE(+)     AND'
      '        HC.IDMOTIVOBLOQUEIO   = MB.IDMOTIVOBLOQUEIO(+) AND'
      
        '        HC.IDCUSTODIA  IN (SELECT MAX(IDCUSTODIA) FROM HISTCUSTO' +
        'DIA'
      '                           WHERE IDCUSTODIA IN'
      
        '                                (SELECT MAX(IDCUSTODIA) FROM HIS' +
        'TCUSTODIA'
      '                                 WHERE'
      
        '                                        IDINVESTIMENTO IN (SELEC' +
        'T IDINVESTIMENTO'
      
        '                                                           FROM ' +
        'OPERDIREITOXINV'
      
        '                                                           WHERE' +
        ' IDOPERACAODIREITO =:IDOPERACAODIREITO AND'
      
        '                                                         ORIGDES' +
        'T          = '#39'O'#39' )             AND'
      
        '                                        DATAMOVCUSTOD    <=:DATA' +
        'AGE'
      
        '                                 GROUP BY IDCARTEIRAINVEST, IDMO' +
        'TIVOBLOQUEIO)'
      '                           GROUP BY IDCARTEIRAINVEST)'
      
        '     ORDER BY INV.DESCINVESTIMENTO, DESCCARTINVEST, C.SGLCUSTODI' +
        'ANTE,'
      
        '                           DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL,' +
        ' MB.SIGLAMOTBLOQ)')
    UpdateObject = UpdOrigemDesdobramento
    ValidateWithMask = True
    Left = 32
    Top = 239
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAAGE'
        ParamType = ptUnknown
      end>
    object QryOrigemDesdobramentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 35
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryOrigemDesdobramentoDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 38
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object QryOrigemDesdobramentoQTDEDIREITO: TFloatField
      DisplayLabel = 'Quantidade Base'
      DisplayWidth = 20
      FieldName = 'QTDEDIREITO'
      DisplayFormat = '###,###,###,###,###'
    end
    object QryOrigemDesdobramentoDATAREFERENCIA: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 12
      FieldName = 'DATAREFERENCIA'
    end
    object QryOrigemDesdobramentoVLRCUSTOATUAL: TFloatField
      DisplayLabel = 'Custo Atual'
      DisplayWidth = 15
      FieldName = 'VLRCUSTOATUAL'
      Visible = False
    end
    object QryOrigemDesdobramentoVALOREXERCIDO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 15
      FieldName = 'VALOREXERCIDO'
      Visible = False
    end
    object QryOrigemDesdobramentoSGLCUSTODIANTE: TStringField
      FieldName = 'SGLCUSTODIANTE'
      Visible = False
      Size = 10
    end
    object QryOrigemDesdobramentoSIGLAMOTBLOQ: TStringField
      FieldName = 'SIGLAMOTBLOQ'
      Visible = False
      Size = 3
    end
    object QryOrigemDesdobramentoIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object QryOrigemDesdobramentoQTDE: TFloatField
      FieldName = 'QTDE'
      Visible = False
      DisplayFormat = '###,###,###,###,###'
    end
    object QryOrigemDesdobramentoVLRREMUNERACAO: TFloatField
      FieldName = 'VLRREMUNERACAO'
      Visible = False
    end
    object QryOrigemDesdobramentoIR: TFloatField
      FieldName = 'IR'
      Visible = False
    end
    object QryOrigemDesdobramentoVLRLIQ: TFloatField
      FieldName = 'VLRLIQ'
      Visible = False
    end
    object QryOrigemDesdobramentoVLRIRREMUNERACAO: TFloatField
      FieldName = 'VLRIRREMUNERACAO'
      Visible = False
    end
    object QryOrigemDesdobramentoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryOrigemDesdobramentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object QryOrigemDesdobramentoIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object QryOrigemDesdobramentoIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object QryOrigemDesdobramentoPERCENTUALINV: TFloatField
      FieldName = 'PERCENTUALINV'
      Visible = False
    end
    object QryOrigemDesdobramentoVLRCUSTO: TFloatField
      FieldName = 'VLRCUSTO'
      Visible = False
    end
  end
  object UpdOrigemDesdobramento: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCUSTODIA'
      'set'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  IDLOTE = :IDLOTE,'
      '  IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    InsertSQL.Strings = (
      'insert into HISTCUSTODIA'
      
        '  (IDCARTEIRAINVEST, IDINVESTIMENTO, IDCUSTODIANTE, IDLOTE, IDMO' +
        'TIVOBLOQUEIO, '
      '   IDPLANPREVCTBPATR)'
      'values'
      
        '  (:IDCARTEIRAINVEST, :IDINVESTIMENTO, :IDCUSTODIANTE, :IDLOTE, ' +
        ':IDMOTIVOBLOQUEIO, '
      '   :IDPLANPREVCTBPATR)')
    DeleteSQL.Strings = (
      'delete from HISTCUSTODIA'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    Left = 114
    Top = 239
  end
  object DsOrigemDesdobramento: TwwDataSource
    DataSet = QryOrigemDesdobramento
    Left = 191
    Top = 239
  end
  object QryDestinoDesdobramento: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    BeforePost = QryDestinoIncPerAltBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   INV.DESCINVESTIMENTO,'
      '   OI.IDCARTEIRAINVEST,'
      '   HC.IDCUSTODIANTE,'
      '   HC.IDMOTIVOBLOQUEIO,'
      '   '#39' '#39' AS IDLOTE,'
      '   OI.QTDEOPERACAO AS QTDEDIREITO,'
      '   0 AS QTDENOVA,'
      '   0 AS VALOREXERCIDO,'
      '   0 AS PERCCUSTO,'
      '   0 AS VLRCUSTO,'
      '   INV.IDINVESTIMENTO,'
      '   0 AS PERCENTUALINV,'
      '   OI.IDOPERACAODIREITO,'
      '   OI.IDOPERACAOINVEST'
      'FROM'
      
        '   HISTCUSTODIA HC, OPERACAOINVEST OI, INVESTIMENTO INV, OPERDIR' +
        'EITOXINV OX'
      'WHERE'
      '   OX.IDOPERACAODIREITO = :IDOPERACAODIREITO    AND'
      '   OX.ORIGDEST          = '#39'D'#39'                   AND'
      '   OI.ORIGDEST          = '#39'D'#39'                   AND   '
      '   OI.IDOPERACAODIREITO = OX.IDOPERACAODIREITO  AND'
      '   OI.IDINVESTIMENTO    = OX.IDINVESTIMENTO     AND'
      '   OI.IDCARTEIRAGERENC IS NULL                  AND'
      '   INV.IDINVESTIMENTO   =  OI.IDINVESTIMENTO(+) AND'
      '   HC.IDOPERACAOINVEST  =  OI.IDOPERACAOINVEST'
      'ORDER BY INV.DESCINVESTIMENTO'
      ' ')
    UpdateObject = UpdDestinoDesdobramento
    ControlType.Strings = (
      'IDCARTEIRAINVEST;CustomEdit;dblCarteira'
      'IDCUSTODIANTE;CustomEdit;dblCustodiante'
      'IDMOTIVOBLOQUEIO;CustomEdit;dblBloqueio'
      'DESCCARTEIRA;CustomEdit;dblCarteira'
      'DESCCUSTODIANTE;CustomEdit;dblCustodiante'
      'DESCBLOQUEIO;CustomEdit;dblBloqueio'
      'ACAO;CustomEdit;dblAcao')
    ValidateWithMask = True
    Left = 32
    Top = 254
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end>
    object StringField17: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'ACAO'
      LookupDataSet = QryInvestimento
      LookupKeyFields = 'IDINVESTIMENTO'
      LookupResultField = 'DESCINVESTIMENTO'
      KeyFields = 'IDINVESTIMENTO'
      Size = 60
      Lookup = True
    end
    object StringField18: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 35
      FieldKind = fkLookup
      FieldName = 'DESCCARTEIRA'
      LookupDataSet = QryCarteiraInvest
      LookupKeyFields = 'IDCARTEIRAINVEST'
      LookupResultField = 'DESCCARTINVEST'
      KeyFields = 'IDCARTEIRAINVEST'
      Size = 60
      Lookup = True
    end
    object StringField19: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'DESCCUSTODIANTE'
      LookupDataSet = QryCustodiante
      LookupKeyFields = 'IDCUSTODIANTE'
      LookupResultField = 'SGLCUSTODIANTE'
      KeyFields = 'IDCUSTODIANTE'
      Size = 30
      Lookup = True
    end
    object StringField20: TStringField
      DisplayLabel = 'Bloq.'
      DisplayWidth = 4
      FieldKind = fkLookup
      FieldName = 'DESCBLOQUEIO'
      LookupDataSet = qryMotivoBloqueio
      LookupKeyFields = 'IDMOTIVOBLOQUEIO'
      LookupResultField = 'SIGLAMOTBLOQ'
      KeyFields = 'IDMOTIVOBLOQUEIO'
      Lookup = True
    end
    object FloatField47: TFloatField
      DisplayLabel = 'Qtd. Direito'
      DisplayWidth = 20
      FieldName = 'QTDEDIREITO'
      OnSetText = QryDestinoIncPerAltQTDEDIREITOSetText
      DisplayFormat = ',###'
    end
    object FloatField48: TFloatField
      DisplayLabel = 'Custo'
      DisplayWidth = 15
      FieldName = 'VLRCUSTO'
      Visible = False
      DisplayFormat = ',##0.00'
      EditFormat = '0.00'
    end
    object StringField21: TStringField
      DisplayLabel = 'Lote'
      DisplayWidth = 12
      FieldName = 'IDLOTE'
      Visible = False
      Size = 1
    end
    object FloatField49: TFloatField
      DisplayLabel = 'Vlr. Exercido'
      DisplayWidth = 18
      FieldName = 'VALOREXERCIDO'
      Visible = False
      DisplayFormat = ',##0.00'
      EditFormat = '0.00'
    end
    object StringField28: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 14
      FieldName = 'DESCINVESTIMENTO'
      LookupDataSet = QryInvestimento
      LookupKeyFields = 'IDINVESTIMENTO'
      LookupResultField = 'DESCINVESTIMENTO'
      KeyFields = 'IDINVESTIMENTO'
      Visible = False
      Size = 60
    end
    object FloatField50: TFloatField
      DisplayLabel = 'Vlr. Custo'
      DisplayWidth = 17
      FieldName = 'PERCCUSTO'
      Visible = False
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object FloatField51: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object FloatField52: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object FloatField53: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object FloatField54: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object FloatField55: TFloatField
      FieldName = 'PERCENTUALINV'
      Visible = False
    end
    object FloatField56: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object FloatField57: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
    object FloatField58: TFloatField
      DisplayLabel = 'Qtd. Prevista'
      DisplayWidth = 15
      FieldName = 'QTDENOVA'
      Visible = False
      DisplayFormat = ',###'
    end
  end
  object UpdDestinoDesdobramento: TUpdateSQL
    ModifySQL.Strings = (
      'update INVESTIMENTO'
      'set'
      '  QTDEDIREITO = :QTDEDIREITO,'
      '  QTDENOVA = :QTDENOVA,'
      '  VALOREXERCIDO = :VALOREXERCIDO'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    InsertSQL.Strings = (
      'insert into INVESTIMENTO'
      '  (QTDEDIREITO, QTDENOVA, VALOREXERCIDO)'
      'values'
      '  (:QTDEDIREITO, :QTDENOVA, :VALOREXERCIDO)')
    DeleteSQL.Strings = (
      'delete from INVESTIMENTO'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    Left = 114
    Top = 254
  end
  object DsDestinoDesdobramento: TwwDataSource
    DataSet = QryDestinoDesdobramento
    OnStateChange = DsDestinoIncPerAltStateChange
    Left = 189
    Top = 254
  end
  object QryOrigemRestCap: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '        INV.DESCINVESTIMENTO,'
      '        CA.DESCCARTINVEST,'
      '        C.SGLCUSTODIANTE,'
      
        '        DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL, MB.SIGLAMOTBLOQ) S' +
        'IGLAMOTBLOQ,'
      '        HC.IDLOTE,'
      '        SYSDATE  AS DATAREFERENCIA,'
      '        0 AS QTDE,'
      '        0 AS QTDEDIREITO,'
      '        0 AS VALOREXERCIDO,'
      '        0 AS VLRREMUNERACAO,'
      '        0 AS IR,'
      '        0 AS VLRLIQ,'
      '        0 AS VLRIRREMUNERACAO,'
      '        HC.IDCARTEIRAINVEST,'
      '        HC.IDINVESTIMENTO,'
      '        HC.IDCUSTODIANTE,'
      '        HC.IDMOTIVOBLOQUEIO,'
      '        OXI.PERCENTUALINV,'
      '        0 AS VLRCUSTOATUAL,'
      '        0 AS VLRCUSTO'
      '     FROM'
      
        '        HISTCUSTODIA HC, CUSTODIANTE C, MOTIVOBLOQUEIO MB, CARTE' +
        'IRAINVEST CA,'
      '        INVESTIMENTO INV, OPERDIREITOXINV OXI'
      '     WHERE'
      '        HC.IDINVESTIMENTO  IN'
      
        '        (SELECT IDINVESTIMENTO FROM  OPERDIREITOXINV WHERE IDOPE' +
        'RACAODIREITO=:IDOPERACAODIREITO AND ORIGDEST = '#39'O'#39') AND'
      '        OXI.IDOPERACAODIREITO = :IDOPERACAODIREITO   AND'
      '        OXI.ORIGDEST          = '#39'O'#39'                    AND'
      '        HC.IDCARTEIRAINVEST   = CA.IDCARTEIRAINVEST    AND'
      '        HC.IDINVESTIMENTO     = INV.IDINVESTIMENTO     AND'
      '        HC.IDCUSTODIANTE      = C.IDCUSTODIANTE(+)     AND'
      '        HC.IDMOTIVOBLOQUEIO   = MB.IDMOTIVOBLOQUEIO(+) AND'
      
        '        HC.IDCUSTODIA  IN (SELECT MAX(IDCUSTODIA) FROM HISTCUSTO' +
        'DIA'
      '                           WHERE'
      
        '                                IDINVESTIMENTO IN (SELECT IDINVE' +
        'STIMENTO'
      
        '                                                    FROM OPERDIR' +
        'EITOXINV'
      
        '                                                    WHERE IDOPER' +
        'ACAODIREITO=:IDOPERACAODIREITO AND'
      
        '                                                          ORIGDE' +
        'ST = '#39'O'#39' )  AND DATAMOVCUSTOD <= :DATAAGE'
      '                           GROUP BY IDMOTIVOBLOQUEIO)'
      
        '     ORDER BY INV.DESCINVESTIMENTO, DESCCARTINVEST, C.SGLCUSTODI' +
        'ANTE,'
      
        '                           DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL,' +
        ' MB.SIGLAMOTBLOQ)')
    UpdateObject = UpdOrigemRestCap
    ValidateWithMask = True
    Left = 35
    Top = 363
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAAGE'
        ParamType = ptUnknown
      end>
    object QryOrigemRestCapDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 23
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryOrigemRestCapDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 25
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object QryOrigemRestCapQTDEDIREITO: TFloatField
      DisplayLabel = 'Quantidade Base'
      DisplayWidth = 15
      FieldName = 'QTDEDIREITO'
      DisplayFormat = '###,###,###,###0'
    end
    object QryOrigemRestCapVALOREXERCIDO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 16
      FieldName = 'VALOREXERCIDO'
      DisplayFormat = ',##0.00'
    end
    object QryOrigemRestCapDATAREFERENCIA: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 10
      FieldName = 'DATAREFERENCIA'
    end
    object QryOrigemRestCapVLRCUSTOATUAL: TFloatField
      DisplayLabel = 'Custo Atual'
      DisplayWidth = 15
      FieldName = 'VLRCUSTOATUAL'
      DisplayFormat = ',##0.00'
    end
    object QryOrigemRestCapSGLCUSTODIANTE: TStringField
      FieldName = 'SGLCUSTODIANTE'
      Visible = False
      Size = 10
    end
    object QryOrigemRestCapSIGLAMOTBLOQ: TStringField
      FieldName = 'SIGLAMOTBLOQ'
      Visible = False
      Size = 3
    end
    object QryOrigemRestCapIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object QryOrigemRestCapQTDE: TFloatField
      FieldName = 'QTDE'
      Visible = False
      DisplayFormat = '###,###,###,###0'
    end
    object QryOrigemRestCapVLRREMUNERACAO: TFloatField
      FieldName = 'VLRREMUNERACAO'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object QryOrigemRestCapIR: TFloatField
      FieldName = 'IR'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object QryOrigemRestCapVLRLIQ: TFloatField
      FieldName = 'VLRLIQ'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object QryOrigemRestCapVLRIRREMUNERACAO: TFloatField
      FieldName = 'VLRIRREMUNERACAO'
      Visible = False
      DisplayFormat = ',##0.00'
    end
    object QryOrigemRestCapIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryOrigemRestCapIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object QryOrigemRestCapIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object QryOrigemRestCapIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object QryOrigemRestCapPERCENTUALINV: TFloatField
      FieldName = 'PERCENTUALINV'
      Visible = False
    end
    object QryOrigemRestCapVLRCUSTO: TFloatField
      FieldName = 'VLRCUSTO'
      Visible = False
      DisplayFormat = ',##0.00'
    end
  end
  object UpdOrigemRestCap: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCUSTODIA'
      'set'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  IDLOTE = :IDLOTE,'
      '  IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    InsertSQL.Strings = (
      'insert into HISTCUSTODIA'
      
        '  (IDCARTEIRAINVEST, IDINVESTIMENTO, IDCUSTODIANTE, IDLOTE, IDMO' +
        'TIVOBLOQUEIO, '
      '   IDPLANPREVCTBPATR)'
      'values'
      
        '  (:IDCARTEIRAINVEST, :IDINVESTIMENTO, :IDCUSTODIANTE, :IDLOTE, ' +
        ':IDMOTIVOBLOQUEIO, '
      '   :IDPLANPREVCTBPATR)')
    DeleteSQL.Strings = (
      'delete from HISTCUSTODIA'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    Left = 114
    Top = 363
  end
  object DsOrigemRestCap: TwwDataSource
    DataSet = QryOrigemRestCap
    Left = 189
    Top = 362
  end
  object UpdDestinoRestCap: TUpdateSQL
    ModifySQL.Strings = (
      'update INVESTIMENTO'
      'set'
      '  QTDEDIREITO = :QTDEDIREITO,'
      '  QTDENOVA = :QTDENOVA,'
      '  VALOREXERCIDO = :VALOREXERCIDO'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    InsertSQL.Strings = (
      'insert into INVESTIMENTO'
      '  (QTDEDIREITO, QTDENOVA, VALOREXERCIDO)'
      'values'
      '  (:QTDEDIREITO, :QTDENOVA, :VALOREXERCIDO)')
    DeleteSQL.Strings = (
      'delete from INVESTIMENTO'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    Left = 114
    Top = 378
  end
  object DsDestinoRestCap: TwwDataSource
    DataSet = QryDestinoRestCap
    OnStateChange = DsDestinoSubStateChange
    Left = 189
    Top = 378
  end
  object QryDestinoRestCap: TwwQuery
    CachedUpdates = True
    BeforePost = QryDestinoSubBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   INV.DESCINVESTIMENTO,'
      '   0 AS IDCARTEIRAINVEST,'
      '   0 AS IDCUSTODIANTE,'
      '   0 AS IDMOTIVOBLOQUEIO,'
      '   '#39' '#39' AS IDLOTE,'
      '   0 AS QTDEDIREITO,'
      '   0 AS QTDENOVA,'
      '   0 AS VALOREXERCIDO,'
      '   0 AS PERCCUSTO,'
      '   0 AS VLRCUSTO,'
      '   INV.IDINVESTIMENTO,'
      '   0 AS PERCENTUALINV,'
      '   OI.IDOPERACAODIREITO,'
      '   OI.IDOPERACAOINVEST'
      'FROM'
      '   INVESTIMENTO  INV, OPERACAOINVEST OI'
      'WHERE'
      '   OI.IDOPERACAODIREITO = :IDOPERACAODIREITO   AND'
      '   OI.IDCARTEIRAGERENC IS NULL                 AND'
      '   INV.IDINVESTIMENTO   =  OI.IDINVESTIMENTO(+)'
      'ORDER BY INV.DESCINVESTIMENTO'
      ''
      ''
      ''
      ''
      ' ')
    UpdateObject = UpdDestinoRestCap
    ControlType.Strings = (
      'IDCARTEIRAINVEST;CustomEdit;dblCarteira'
      'IDCUSTODIANTE;CustomEdit;dblCustodiante'
      'IDMOTIVOBLOQUEIO;CustomEdit;dblBloqueio'
      'DESCCARTEIRA;CustomEdit;dblCarteira'
      'DESCCUSTODIANTE;CustomEdit;dblCustodiante'
      'DESCBLOQUEIO;CustomEdit;dblBloqueio'
      'ACAO;CustomEdit;dblAcao')
    ValidateWithMask = True
    Left = 32
    Top = 378
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end>
    object StringField29: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 14
      FieldKind = fkLookup
      FieldName = 'ACAO'
      LookupDataSet = QryInvestimento
      LookupKeyFields = 'IDINVESTIMENTO'
      LookupResultField = 'DESCINVESTIMENTO'
      KeyFields = 'IDINVESTIMENTO'
      Size = 60
      Lookup = True
    end
    object StringField30: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'DESCCARTEIRA'
      LookupDataSet = QryCarteiraInvest
      LookupKeyFields = 'IDCARTEIRAINVEST'
      LookupResultField = 'DESCCARTINVEST'
      KeyFields = 'IDCARTEIRAINVEST'
      Size = 60
      Lookup = True
    end
    object StringField31: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 9
      FieldKind = fkLookup
      FieldName = 'DESCCUSTODIANTE'
      LookupDataSet = QryCustodiante
      LookupKeyFields = 'IDCUSTODIANTE'
      LookupResultField = 'SGLCUSTODIANTE'
      KeyFields = 'IDCUSTODIANTE'
      Size = 30
      Lookup = True
    end
    object StringField32: TStringField
      DisplayLabel = 'Bloq.'
      DisplayWidth = 4
      FieldKind = fkLookup
      FieldName = 'DESCBLOQUEIO'
      LookupDataSet = qryMotivoBloqueio
      LookupKeyFields = 'IDMOTIVOBLOQUEIO'
      LookupResultField = 'SIGLAMOTBLOQ'
      KeyFields = 'IDMOTIVOBLOQUEIO'
      Lookup = True
    end
    object StringField33: TStringField
      DisplayLabel = 'Lote'
      DisplayWidth = 12
      FieldName = 'IDLOTE'
      Size = 1
    end
    object QryDestinoRestCapQTDEDIREITO: TFloatField
      DisplayLabel = 'Qtd. Direito'
      DisplayWidth = 15
      FieldName = 'QTDEDIREITO'
      OnSetText = QryDestinoRestCapQTDEDIREITOSetText
      DisplayFormat = ',###'
    end
    object FloatField60: TFloatField
      DisplayLabel = 'Vlr. Exercido'
      DisplayWidth = 18
      FieldName = 'VALOREXERCIDO'
      DisplayFormat = ',##0.00'
      EditFormat = '0.00'
    end
    object FloatField61: TFloatField
      DisplayLabel = 'Custo'
      DisplayWidth = 15
      FieldName = 'VLRCUSTO'
      DisplayFormat = ',##0.00'
      EditFormat = '0.00'
    end
    object StringField34: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 14
      FieldName = 'DESCINVESTIMENTO'
      LookupDataSet = QryInvestimento
      LookupKeyFields = 'IDINVESTIMENTO'
      LookupResultField = 'DESCINVESTIMENTO'
      KeyFields = 'IDINVESTIMENTO'
      Visible = False
      Size = 60
    end
    object FloatField71: TFloatField
      DisplayLabel = 'Qtd. Prevista'
      DisplayWidth = 15
      FieldName = 'QTDENOVA'
      Visible = False
      DisplayFormat = ',###'
    end
    object FloatField73: TFloatField
      DisplayLabel = 'Vlr. Custo'
      DisplayWidth = 17
      FieldName = 'PERCCUSTO'
      Visible = False
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object FloatField74: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object FloatField75: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object FloatField76: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object FloatField77: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object FloatField78: TFloatField
      FieldName = 'PERCENTUALINV'
      Visible = False
    end
    object FloatField79: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object FloatField80: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
  end
  object qryAcoesxBolsa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDBOLSAVALORES,'
      '   QTDELOTE'
      'FROM'
      '   ACOESXBOLSA'
      'WHERE'
      '   IDACAO = :IDINVESTIMENTO'
      ' ')
    ValidateWithMask = True
    Left = 472
    Top = 322
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryOperacaoDireito: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM'
      '   OPERACAODIREITO'
      'WHERE'
      '   IDOPERACAODIREITO =:IDOPERACAODIREITO'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 470
    Top = 371
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end>
  end
  object qryMotivoBloqueio: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDMOTIVOBLOQUEIO,'
      
        '  DECODE(IDMOTIVOBLOQUEIO, -1,NULL, SIGLAMOTBLOQ) AS SIGLAMOTBLO' +
        'Q'
      'FROM'
      '  MOTIVOBLOQUEIO'
      'ORDER BY'
      '  DECODE(IDMOTIVOBLOQUEIO, -1,NULL, SIGLAMOTBLOQ)')
    ValidateWithMask = True
    Left = 605
    Top = 322
    object qryMotivoBloqueioSIGLAMOTBLOQ: TStringField
      DisplayLabel = 'Bloqueio'
      DisplayWidth = 3
      FieldName = 'SIGLAMOTBLOQ'
      Origin = 'MOTIVOBLOQUEIO.SIGLAMOTBLOQ'
      Size = 3
    end
    object qryMotivoBloqueioIDMOTIVOBLOQUEIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVOBLOQUEIO'
      Origin = 'MOTIVOBLOQUEIO.IDMOTIVOBLOQUEIO'
      Visible = False
    end
  end
  object QryBuscaHistCPMF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM   HISTCARTINV'
      'WHERE  IDHISTCARTINV =:IDHISTCARTINV AND SALDOQTDECPMF <> 0')
    ValidateWithMask = True
    Left = 727
    Top = 277
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINV'
        ParamType = ptResult
      end>
  end
  object QryUpdHistCPMF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTCARTINV SET SALDOQTDECPMF=:SALDOQTDECPMF'
      'WHERE  IDHISTCARTINV =:IDHISTCARTINV AND SALDOQTDECPMF <> 0'
      ''
      ' ')
    ValidateWithMask = True
    Left = 727
    Top = 322
    ParamData = <
      item
        DataType = ftFloat
        Name = 'SALDOQTDECPMF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDHISTCARTINV'
        ParamType = ptResult
      end>
  end
  object QryBuscaAnuncio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '       IDOPERACAODIREITO, IDCARTEIRAINVEST, IDTIPOOPERACAO, VLRO' +
        'PERACAO'
      'FROM'
      '       OPERACAOINVEST'
      'WHERE'
      
        '       DATAOPERACAO      = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') A' +
        'ND'
      '       IDOPERACAODIREITO = :IDOPERACAODIREITO  AND'
      '       IDTIPOOPERACAO    = :IDTIPOOPERACAO     AND'
      '       IDCARTEIRAINVEST  = :IDCARTEIRAINVEST   AND'
      '       IDCARTEIRAGERENC IS NULL'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 608
    Top = 370
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end>
  end
end
