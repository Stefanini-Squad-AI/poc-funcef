inherited frmCadOperAGE: TfrmCadOperAGE
  Left = 10
  Top = 20
  Caption = 'Operação de Eventos'
  ClientHeight = 448
  ClientWidth = 777
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 777
    Height = 362
    object pnlOrigem: TPanel
      Left = 1
      Top = 1
      Width = 775
      Height = 175
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object dbgOrigemDivJur: TwwDBGrid
        Left = 0
        Top = 24
        Width = 775
        Height = 151
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
        DataSource = DsOrigDivJur
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
        OnEnter = dbgOrigemEnter
        IndicatorColor = icBlack
      end
      object dbgOrigem: TwwDBGrid
        Left = 0
        Top = 24
        Width = 775
        Height = 151
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'15'#9'Ação'#9'F'
          'DESCCARTINVEST'#9'16'#9'Carteira'#9'F'
          'QTDEDIREITO'#9'17'#9'Quantidade Base'#9'F'
          'VALOREXERCIDO'#9'17'#9'Valor'#9'F'
          'VLRREMUNERACAO'#9'12'#9'Remuneração'#9'F'
          'IR'#9'10'#9'Valor do IR'#9'F'
          'VLRLIQ'#9'13'#9'Valor Líquido'#9'F'
          'SGLCUSTODIANTE'#9'9'#9'Custodiante'#9'F'
          'SIGLAMOTBLOQ'#9'4'#9'Bloq.'#9'F'
          'DATAREFERENCIA'#9'11'#9'Data Base'#9'F'
          'VLRCUSTOATUAL'#9'17'#9'Custo Atual'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = ds
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
        OnEnter = dbgOrigemEnter
        IndicatorColor = icBlack
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 775
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
        TabOrder = 1
      end
    end
    object pnlDestino: TPanel
      Left = 1
      Top = 176
      Width = 775
      Height = 185
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object dbgDestino: TwwDBGrid
        Left = 0
        Top = 57
        Width = 775
        Height = 128
        Selected.Strings = (
          'ACAO'#9'14'#9'Ação'#9'F'
          'DESCCARTEIRA'#9'15'#9'Carteira'#9'F'
          'DESCCUSTODIANTE'#9'9'#9'Custodiante'#9'F'
          'DESCBLOQUEIO'#9'4'#9'Bloq.'#9'F'
          'IDLOTE'#9'9'#9'Lote'#9'F'
          'QTDEDIREITO'#9'14'#9'Qtd. Direito'#9'F'
          'QTDENOVA'#9'13'#9'Qtd. Prevista'#9'F'
          'VALOREXERCIDO'#9'15'#9'Vlr. Exercido'#9'F'
          'VLRCUSTO'#9'17'#9'Custo'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dtsFilha
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
        OnEnter = dbgDestinoEnter
        OnExit = dbgDestinoExit
        OnKeyDown = dbgDestinoKeyDown
        OnKeyPress = dbgDestinoKeyPress
        IndicatorColor = icBlack
      end
      object dblCustodiante: TwwDBLookupCombo
        Left = 207
        Top = 100
        Width = 86
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SGLCUSTODIANTE'#9'10'#9'Custodiante')
        DataField = 'IDCUSTODIANTE'
        DataSource = dtsFilha
        LookupTable = qryCustodiante
        LookupField = 'IDCUSTODIANTE'
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnKeyDown = dbgDestinoKeyDown
        OnKeyPress = dbgDestinoKeyPress
      end
      object dblBloqueio: TwwDBLookupCombo
        Left = 292
        Top = 100
        Width = 89
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SIGLAMOTBLOQ'#9'3'#9'Bloqueio')
        DataField = 'IDMOTIVOBLOQUEIO'
        DataSource = dtsFilha
        LookupTable = qryMotivoBloqueio
        LookupField = 'IDMOTIVOBLOQUEIO'
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnKeyDown = dbgDestinoKeyDown
        OnKeyPress = dbgDestinoKeyPress
      end
      object pnlBotoesDestino: TPanel
        Left = 0
        Top = 24
        Width = 775
        Height = 33
        Align = alTop
        Caption = 'pnlBotoesDestino'
        TabOrder = 3
        object Dock977: TDock97
          Left = 1
          Top = 1
          Width = 773
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
              OnClick = BtVoltaDetClick
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
        Width = 775
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
        TabOrder = 5
      end
      object dblCarteira: TwwDBLookupCombo
        Left = 82
        Top = 100
        Width = 127
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'60'#9'Carteira')
        DataField = 'IDCARTEIRAINVEST'
        DataSource = dtsFilha
        LookupTable = qryCarteiraInvest
        LookupField = 'IDCARTEIRAINVEST'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnKeyDown = dbgDestinoKeyDown
        OnKeyPress = dbgDestinoKeyPress
      end
    end
  end
  inherited Dock972: TDock97
    Width = 777
    object lblSigla: TLabel [0]
      Left = 84
      Top = 3
      Width = 52
      Height = 18
      Caption = 'lblSigla'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblDataAGE: TLabel [1]
      Left = 84
      Top = 26
      Width = 80
      Height = 18
      Caption = 'lblDataAGE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblTipoOperacao: TLabel [2]
      Left = 174
      Top = 26
      Width = 118
      Height = 18
      Caption = 'lblTipoOperacao'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object LblBoleta: TLabel [3]
      Left = 350
      Top = 6
      Width = 73
      Height = 19
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
      Left = 8
      DockPos = 8
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
    Top = 409
    Width = 777
    object lbDistribuido: TLabel [0]
      Left = 237
      Top = 4
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = '0,00'
      Visible = False
    end
    object lbAdistribuir: TLabel [1]
      Left = 237
      Top = 21
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = '0,00'
      Visible = False
    end
    object Label4: TLabel [2]
      Left = 24
      Top = 4
      Width = 89
      Height = 13
      Caption = 'Qtd. Distribuida'
      Visible = False
    end
    object Label5: TLabel [3]
      Left = 24
      Top = 21
      Width = 90
      Height = 13
      Caption = 'Qtd. a Distribuir'
      Visible = False
    end
    object lblDataEfetiva: TLabel [4]
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
    inherited tb97Fundo: TToolbar97
      Left = 594
      DockPos = 594
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 425
      DockPos = 425
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
  object dblAcao: TwwDBLookupCombo [3]
    Left = 124
    Top = 363
    Width = 71
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'DESCINVESTIMENTO'#9'30'#9'Descrição')
    DataField = 'IDINVESTIMENTO'
    DataSource = dtsFilha
    LookupTable = qryInvestimento
    LookupField = 'IDINVESTIMENTO'
    TabOrder = 3
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = True
    ShowMatchText = True
    OnKeyDown = dbgDestinoKeyDown
    OnKeyPress = dbgDestinoKeyPress
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 32
    Top = 6
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 643
    Top = 97
  end
  inherited upd: TUpdateSQL
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
    Left = 713
    Top = 97
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
    Left = 216
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 81
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 134
    Top = 10
  end
  inherited qry: TwwQuery
    AfterPost = qryAfterPost
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
      '        0 AS RENDIMENTO,'
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
        'RACAODIREITO=:P_IDOPERACAODIREITO AND ORIGDEST = '#39'O'#39') AND'
      '        OXI.IDOPERACAODIREITO = :P_IDOPERACAODIREITO   AND'
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
        'ACAODIREITO=:P_IDOPERACAODIREITO AND'
      
        '                                                          ORIGDE' +
        'ST = '#39'O'#39' )  AND DATAMOVCUSTOD <= :pDATAAGE'
      
        '                           GROUP BY IDCARTEIRAINVEST, IDMOTIVOBL' +
        'OQUEIO)'
      
        '     ORDER BY INV.DESCINVESTIMENTO, DESCCARTINVEST, C.SGLCUSTODI' +
        'ANTE,'
      
        '                           DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL,' +
        ' MB.SIGLAMOTBLOQ)'
      ' ')
    Left = 575
    Top = 97
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_IDOPERACAODIREITO'
        ParamType = ptUnknown
        Value = 216
      end
      item
        DataType = ftInteger
        Name = 'P_IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'P_IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDATAAGE'
        ParamType = ptUnknown
      end>
    object qryDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 15
      FieldName = 'DESCINVESTIMENTO'
      ReadOnly = True
      Size = 60
    end
    object qryDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 16
      FieldName = 'DESCCARTINVEST'
      ReadOnly = True
      Size = 60
    end
    object qryQTDEDIREITO: TFloatField
      DisplayLabel = 'Quantidade Base'
      DisplayWidth = 17
      FieldName = 'QTDEDIREITO'
      OnSetText = qryQTDEDIREITOSetText
      DisplayFormat = '###,###,###,###,###'
    end
    object qryVALOREXERCIDO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 17
      FieldName = 'VALOREXERCIDO'
      ReadOnly = True
      OnSetText = qryVALOREXERCIDOSetText
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object qryVLRREMUNERACAO: TFloatField
      DisplayLabel = 'Remuneração'
      DisplayWidth = 12
      FieldName = 'VLRREMUNERACAO'
      OnSetText = qryVLRREMUNERACAOSetText
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object qryIR: TFloatField
      DisplayLabel = 'Valor do IR'
      DisplayWidth = 10
      FieldName = 'IR'
      ReadOnly = True
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object qryVLRLIQ: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 13
      FieldName = 'VLRLIQ'
      ReadOnly = True
      OnSetText = qryVLRLIQSetText
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object qrySGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 9
      FieldName = 'SGLCUSTODIANTE'
      ReadOnly = True
      Size = 10
    end
    object qrySIGLAMOTBLOQ: TStringField
      DisplayLabel = 'Bloq.'
      DisplayWidth = 4
      FieldName = 'SIGLAMOTBLOQ'
      ReadOnly = True
      Size = 3
    end
    object qryDATAREFERENCIA: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 11
      FieldName = 'DATAREFERENCIA'
      ReadOnly = True
    end
    object qryVLRCUSTOATUAL: TFloatField
      DisplayLabel = 'Custo Atual'
      DisplayWidth = 17
      FieldName = 'VLRCUSTOATUAL'
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object qryQTDE: TFloatField
      DisplayLabel = 'Quantidade Base'
      DisplayWidth = 15
      FieldName = 'QTDE'
      ReadOnly = True
      Visible = False
      DisplayFormat = '###,###,###,###,###'
      EditFormat = '##0'
    end
    object qryVLRCUSTO: TFloatField
      DisplayLabel = 'Custo Previsto'
      DisplayWidth = 17
      FieldName = 'VLRCUSTO'
      Visible = False
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object qryIDLOTE: TStringField
      DisplayLabel = 'Lote'
      DisplayWidth = 6
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object qryIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object qryIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object qryVLRIRREMUNERACAO: TFloatField
      FieldName = 'VLRIRREMUNERACAO'
      Visible = False
    end
    object qryPERCENTUALINV: TFloatField
      FieldName = 'PERCENTUALINV'
      Visible = False
    end
    object qryRENDIMENTO: TFloatField
      FieldName = 'RENDIMENTO'
      Visible = False
    end
  end
  object qryEmissor: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDEMISSOR,'
      '  SIGLAEMISSOR'
      'FROM'
      '  EMISSOR'
      'ORDER BY'
      '  SIGLAEMISSOR')
    ValidateWithMask = True
    Left = 245
    Top = 97
    object qryEmissorSIGLAEMISSOR: TStringField
      DisplayWidth = 15
      FieldName = 'SIGLAEMISSOR'
      Origin = 'EMISSOR.SIGLAEMISSOR'
      Size = 15
    end
    object qryEmissorIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Origin = 'EMISSOR.IDEMISSOR'
      Visible = False
    end
  end
  object qryFilha: TwwQuery
    CachedUpdates = True
    AfterPost = qryFilhaAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   INV.DESCINVESTIMENTO,'
      '   0 AS IDCARTEIRAINVEST,'
      '   0 AS IDCUSTODIANTE,'
      '   0 AS IDMOTIVOBLOQUEIO,'
      '   '#39' '#39' AS IDLOTE,'
      '   0 AS QTDEDIREITO,'
      '   0 AS QTDENOVA,   '
      '   0 AS VALOREXERCIDO,'
      '   0 AS PERCCUSTO,'
      '   0 AS VLRCUSTO,'
      '   INV.IDINVESTIMENTO,'
      '   OXI.PERCENTUALINV,'
      '   OXI.IDOPERACAODIREITO, OXI.IDOPERACAOINVEST'
      'FROM'
      '   INVESTIMENTO  INV, OPERDIREITOXINV OXI'
      'WHERE'
      '   OXI.IDOPERACAODIREITO = :P_IDOPERACAODIREITO   AND'
      '   OXI.ORIGDEST          = '#39'D'#39'                    AND'
      '   INV.IDINVESTIMENTO    =  OXI.IDINVESTIMENTO(+)'
      'ORDER BY INV.DESCINVESTIMENTO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updFilha
    ControlType.Strings = (
      'IDCARTEIRAINVEST;CustomEdit;dblCarteira'
      'IDCUSTODIANTE;CustomEdit;dblCustodiante'
      'IDMOTIVOBLOQUEIO;CustomEdit;dblBloqueio'
      'DESCCARTEIRA;CustomEdit;dblCarteira'
      'DESCCUSTODIANTE;CustomEdit;dblCustodiante'
      'DESCBLOQUEIO;CustomEdit;dblBloqueio'
      'ACAO;CustomEdit;dblAcao')
    ValidateWithMask = True
    Left = 575
    Top = 145
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_IDOPERACAODIREITO'
        ParamType = ptUnknown
        Value = 225
      end>
    object qryFilhaACAO: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 14
      FieldKind = fkLookup
      FieldName = 'ACAO'
      LookupDataSet = qryInvestimento
      LookupKeyFields = 'IDINVESTIMENTO'
      LookupResultField = 'DESCINVESTIMENTO'
      KeyFields = 'IDINVESTIMENTO'
      Size = 60
      Lookup = True
    end
    object qryFilhaDESCCARTEIRA: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'DESCCARTEIRA'
      LookupDataSet = qryCarteiraInvest
      LookupKeyFields = 'IDCARTEIRAINVEST'
      LookupResultField = 'DESCCARTINVEST'
      KeyFields = 'IDCARTEIRAINVEST'
      Size = 60
      Lookup = True
    end
    object qryFilhaDESCCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 9
      FieldKind = fkLookup
      FieldName = 'DESCCUSTODIANTE'
      LookupDataSet = qryCustodiante
      LookupKeyFields = 'IDCUSTODIANTE'
      LookupResultField = 'SGLCUSTODIANTE'
      KeyFields = 'IDCUSTODIANTE'
      Size = 30
      Lookup = True
    end
    object qryFilhaDESCBLOQUEIO: TStringField
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
    object qryFilhaIDLOTE: TStringField
      DisplayLabel = 'Lote'
      DisplayWidth = 9
      FieldName = 'IDLOTE'
      Size = 1
    end
    object qryFilhaQTDEDIREITO: TFloatField
      DisplayLabel = 'Qtd. Direito'
      DisplayWidth = 14
      FieldName = 'QTDEDIREITO'
      OnSetText = qryFilhaQTDEDIREITOSetText
      DisplayFormat = '###,###,###,###,###'
    end
    object qryFilhaQTDENOVA: TFloatField
      DisplayLabel = 'Qtd. Prevista'
      DisplayWidth = 13
      FieldName = 'QTDENOVA'
      OnSetText = qryFilhaQTDENOVASetText
      DisplayFormat = '###,###,###,###,###'
    end
    object qryFilhaVALOREXERCIDO: TFloatField
      DisplayLabel = 'Vlr. Exercido'
      DisplayWidth = 15
      FieldName = 'VALOREXERCIDO'
      DisplayFormat = ',##0.00'
      EditFormat = '0.00'
    end
    object qryFilhaVLRCUSTO: TFloatField
      DisplayLabel = 'Custo'
      DisplayWidth = 17
      FieldName = 'VLRCUSTO'
      DisplayFormat = ',##0.00'
      EditFormat = '0.00'
    end
    object qryFilhaPERCCUSTO: TFloatField
      DisplayLabel = 'Vlr. Custo'
      DisplayWidth = 17
      FieldName = 'PERCCUSTO'
      Visible = False
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object qryFilhaDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 30
      FieldName = 'DESCINVESTIMENTO'
      Visible = False
      Size = 60
    end
    object qryFilhaIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryFilhaIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object qryFilhaIDMOTIVOBLOQUEIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object qryFilhaIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryFilhaPERCENTUALINV: TFloatField
      FieldName = 'PERCENTUALINV'
      Visible = False
    end
    object qryFilhaIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object qryFilhaIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
  end
  object dtsFilha: TwwDataSource
    DataSet = qryFilha
    OnStateChange = dtsFilhaStateChange
    OnDataChange = dtsFilhaDataChange
    Left = 643
    Top = 145
  end
  object qryTipoOperacao: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   '
      '   IDTIPOOPERACAO,'
      '   DESCTIPOOPERACAO'
      'FROM'
      '   TIPOOPERACAO'
      'WHERE'
      '    IDTIPOINVEST = 2  AND'
      '    FLGOPDIREITO = '#39'S'#39
      'ORDER BY DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 149
    Top = 196
    object qryTipoOperacaoDESCTIPOOPERACAO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
  end
  object qryOperacaoDireito: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM'
      '   OPERACAODIREITO'
      'WHERE'
      '   IDOPERACAODIREITO =:IDOPERACAODIREITO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 144
    Top = 381
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end>
    object qryOperacaoDireitoIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Origin = 'BASEDADOS.OPERACAODIREITO.IDOPERACAODIREITO'
    end
    object qryOperacaoDireitoINVORIGEM: TFloatField
      FieldName = 'INVORIGEM'
      Origin = 'BASEDADOS.OPERACAODIREITO.INVORIGEM'
    end
    object qryOperacaoDireitoDATAAGE: TDateTimeField
      FieldName = 'DATAAGE'
      Origin = 'BASEDADOS.OPERACAODIREITO.DATAAGE'
    end
    object qryOperacaoDireitoDATAEX: TDateTimeField
      FieldName = 'DATAEX'
      Origin = 'BASEDADOS.OPERACAODIREITO.DATAEX'
    end
    object qryOperacaoDireitoDATACOM: TDateTimeField
      FieldName = 'DATACOM'
      Origin = 'BASEDADOS.OPERACAODIREITO.DATACOM'
    end
    object qryOperacaoDireitoPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      Origin = 'BASEDADOS.OPERACAODIREITO.PERCENTUAL'
    end
    object qryOperacaoDireitoPARIDADE: TFloatField
      FieldName = 'PARIDADE'
      Origin = 'BASEDADOS.OPERACAODIREITO.PARIDADE'
    end
    object qryOperacaoDireitoPRZBOLSA: TDateTimeField
      FieldName = 'PRZBOLSA'
      Origin = 'BASEDADOS.OPERACAODIREITO.PRZBOLSA'
    end
    object qryOperacaoDireitoPRZEMPRESA: TDateTimeField
      FieldName = 'PRZEMPRESA'
      Origin = 'BASEDADOS.OPERACAODIREITO.PRZEMPRESA'
    end
    object qryOperacaoDireitoATADECISAO: TDateTimeField
      FieldName = 'ATADECISAO'
      Origin = 'BASEDADOS.OPERACAODIREITO.ATADECISAO'
    end
    object qryOperacaoDireitoFORMAPAGREC: TStringField
      FieldName = 'FORMAPAGREC'
      Origin = 'BASEDADOS.OPERACAODIREITO.FORMAPAGREC'
      Size = 30
    end
    object qryOperacaoDireitoDIVPORACAO: TFloatField
      FieldName = 'DIVPORACAO'
      Origin = 'BASEDADOS.OPERACAODIREITO.DIVPORACAO'
    end
    object qryOperacaoDireitoINIPAGTO: TDateTimeField
      FieldName = 'INIPAGTO'
      Origin = 'BASEDADOS.OPERACAODIREITO.INIPAGTO'
    end
    object qryOperacaoDireitoJUROSCAP: TStringField
      FieldName = 'JUROSCAP'
      Origin = 'BASEDADOS.OPERACAODIREITO.JUROSCAP'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoDireitoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.OPERACAODIREITO.TRGDTINCLUSAO'
    end
    object qryOperacaoDireitoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.OPERACAODIREITO.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryOperacaoDireitoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.OPERACAODIREITO.IDTIPOINVEST'
    end
    object qryOperacaoDireitoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.OPERACAODIREITO.IDTIPOOPERACAO'
    end
    object qryOperacaoDireitoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'BASEDADOS.OPERACAODIREITO.IDEMISSOR'
    end
    object qryOperacaoDireitoOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.OPERACAODIREITO.OBSERVACAO'
      BlobType = ftMemo
      Size = 300
    end
    object qryOperacaoDireitoSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'BASEDADOS.OPERACAODIREITO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoDireitoISENCAOIR: TStringField
      FieldName = 'ISENCAOIR'
      Origin = 'BASEDADOS.OPERACAODIREITO.ISENCAOIR'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoDireitoIRLITIGIO: TStringField
      FieldName = 'IRLITIGIO'
      Origin = 'BASEDADOS.OPERACAODIREITO.IRLITIGIO'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoDireitoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.OPERACAODIREITO.PLNCODIGO'
    end
    object qryOperacaoDireitoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.OPERACAODIREITO.CODDOCUMENTO'
    end
    object qryOperacaoDireitoPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.OPERACAODIREITO.PLANO'
    end
    object qryOperacaoDireitoQTDEACOESDIRPROV: TFloatField
      FieldName = 'QTDEACOESDIRPROV'
      Origin = 'BASEDADOS.OPERACAODIREITO.QTDEACOESDIRPROV'
    end
    object qryOperacaoDireitoIDPEDIDOFUNDO: TFloatField
      FieldName = 'IDPEDIDOFUNDO'
      Origin = 'BASEDADOS.OPERACAODIREITO.IDPEDIDOFUNDO'
    end
    object qryOperacaoDireitoQTDERECDIRPARC: TFloatField
      FieldName = 'QTDERECDIRPARC'
      Origin = 'BASEDADOS.OPERACAODIREITO.QTDERECDIRPARC'
    end
    object qryOperacaoDireitoDATAOPER: TDateTimeField
      FieldName = 'DATAOPER'
      Origin = 'BASEDADOS.OPERACAODIREITO.DATAOPER'
    end
    object qryOperacaoDireitoQTDDIREITO: TFloatField
      FieldName = 'QTDDIREITO'
      Origin = 'BASEDADOS.OPERACAODIREITO.QTDDIREITO'
    end
    object qryOperacaoDireitoFLGTIPODIREITO: TStringField
      FieldName = 'FLGTIPODIREITO'
      Origin = 'BASEDADOS.OPERACAODIREITO.FLGTIPODIREITO'
      FixedChar = True
      Size = 1
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
    Left = 245
    Top = 49
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object qryAcoesxBolsaQTDELOTE: TFloatField
      FieldName = 'QTDELOTE'
      Origin = 'ACOESXBOLSA.QTDELOTE'
    end
    object qryAcoesxBolsaIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
      Origin = 'BASEDADOS.ACOESXBOLSA.IDBOLSAVALORES'
    end
  end
  object qryCarteiraInvest: TwwQuery
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
    Left = 149
    Top = 49
    object qryCarteiraInvestDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Origin = 'CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraInvestIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
  end
  object qryCustodiante: TwwQuery
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
    Left = 149
    Top = 145
    object qryCustodianteSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 10
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
    object qryCustodianteIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Origin = 'CUSTODIANTE.IDCUSTODIANTE'
      Visible = False
    end
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
    Left = 149
    Top = 236
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
  object updFilha: TUpdateSQL
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
    Left = 713
    Top = 145
  end
  object qryInvestimento: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    DataSource = dtsOperacaoDireito
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
      'ORDER BY INV.DESCINVESTIMENTO')
    ControlType.Strings = (
      'DESCINVESTIMENTO;CustomEdit;dblAcao')
    ValidateWithMask = True
    Left = 149
    Top = 97
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end>
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
  end
  object dtsOperacaoDireito: TwwDataSource
    DataSet = qryOperacaoDireito
    Left = 242
    Top = 381
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
      'FROM CM.TIPOOPERACAO'
      'WHERE IDTIPOOPERACAO = :TIPOOPERACAO'
      '')
    ValidateWithMask = True
    Left = 42
    Top = 97
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TIPOOPERACAO'
        ParamType = ptUnknown
      end>
    object QryBuscaTipoOperIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = '"CM.TIPOOPERACAO".IDTIPOINVEST'
    end
    object QryBuscaTipoOperIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = '"CM.TIPOOPERACAO".IDTIPOOPERACAO'
    end
    object QryBuscaTipoOperIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = '"CM.TIPOOPERACAO".IDMERCADO'
    end
    object QryBuscaTipoOperDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = '"CM.TIPOOPERACAO".DESCTIPOOPERACAO'
      Size = 60
    end
    object QryBuscaTipoOperNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = '"CM.TIPOOPERACAO".NATUREZAOPERACAO'
      Size = 1
    end
    object QryBuscaTipoOperTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      Origin = '"CM.TIPOOPERACAO".TIPOCUSTODIA'
      Size = 1
    end
    object QryBuscaTipoOperVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
      Origin = '"CM.TIPOOPERACAO".VENCIMENTO'
    end
    object QryBuscaTipoOperTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = '"CM.TIPOOPERACAO".TIPCREDOR'
      Size = 2
    end
    object QryBuscaTipoOperFLGTRANSF: TStringField
      FieldName = 'FLGTRANSF'
      Origin = '"CM.TIPOOPERACAO".FLGTRANSF'
      Size = 1
    end
    object QryBuscaTipoOperFLGCORRET: TStringField
      FieldName = 'FLGCORRET'
      Origin = 'TIPOOPERACAO.FLGCORRET'
      Size = 1
    end
    object QryBuscaTipoOperFLGORDMOVINV: TStringField
      FieldName = 'FLGORDMOVINV'
      Origin = 'TIPOOPERACAO.FLGORDMOVINV'
      Size = 1
    end
    object QryBuscaTipoOperFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      Size = 1
    end
    object QryBuscaTipoOperRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.RECPAG'
      FixedChar = True
      Size = 1
    end
  end
  object QryBuscaInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  INV.IDINVESTIMENTO,   INV.IDMOEDACONTAB, INV.IDEMISSOR, ' +
        'INV.IDTIPOINVEST,'
      
        '        INV.DESCINVESTIMENTO, ACA.CODTIPOACAO, AXB.MOECODIGO, AX' +
        'B.QTDELOTE,'
      '        AXB.IDBOLSAVALORES'
      'FROM   CM.INVESTIMENTO INV, CM.ACAO ACA, CM.ACOESXBOLSA AXB'
      'WHERE (INV.IDINVESTIMENTO = :IDINVESTIMENTO) AND'
      '      (INV.IDINVESTIMENTO = ACA.IDACAO)     AND'
      '      (INV.IDINVESTIMENTO = AXB.IDACAO)'
      ' ')
    ValidateWithMask = True
    Left = 42
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object QryBuscaInvestimentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'INVESTIMENTO.IDINVESTIMENTO'
    end
    object QryBuscaInvestimentoIDMOEDACONTAB: TFloatField
      FieldName = 'IDMOEDACONTAB'
      Origin = 'INVESTIMENTO.IDMOEDACONTAB'
    end
    object QryBuscaInvestimentoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'INVESTIMENTO.IDEMISSOR'
    end
    object QryBuscaInvestimentoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'INVESTIMENTO.IDTIPOINVEST'
    end
    object QryBuscaInvestimentoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object QryBuscaInvestimentoCODTIPOACAO: TStringField
      FieldName = 'CODTIPOACAO'
      Origin = 'ACAO.CODTIPOACAO'
      Size = 5
    end
    object QryBuscaInvestimentoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'ACOESXBOLSA.MOECODIGO'
    end
    object QryBuscaInvestimentoQTDELOTE: TFloatField
      FieldName = 'QTDELOTE'
      Origin = 'ACOESXBOLSA.QTDELOTE'
    end
    object QryBuscaInvestimentoIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
      Origin = 'ACOESXBOLSA.IDBOLSAVALORES'
    end
  end
  object QryInsetOperacaoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO OPERACAOINVEST'
      '(IDOPERACAOINVEST,  MOECODIGO,        IDMODULO,'
      
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
      
        ' PERCENTUAL,        IDCARTEIRAGERENC, IDPLANPREVCTBPATR,ORIGDEST' +
        ','
      ' IDOPERCUSTODIA)'
      'VALUES'
      '(:IDOPERACAOINVEST,  :MOECODIGO,        :IDMODULO,'
      
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
      
        ' :PERCENTUAL,        :IDCARTEIRAGERENC, :IDPLANPREVCTBPATR,:ORIG' +
        'DEST,'
      ' :IDOPERCUSTODIA)'
      ' ')
    ValidateWithMask = True
    Left = 488
    Top = 97
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
        DataType = ftString
        Name = 'ORIGDEST'
        ParamType = ptInput
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
    Left = 493
    Top = 145
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
  object QryBuscaOrdem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  O.IDORDMOVINV ,'
      '  O.IDCORRETVALORES,'
      '  O.IDINVESTIMENTO,'
      '  O.PUORDMOVINV,'
      '  O.OBSMOVINV,'
      '  O.DATAORDMOVINV,'
      '  O.QTDEORDMOVINV,'
      '  O.NUMDOCMOVINV,'
      '  O.STATMOVINV,'
      '  O.IDUSUARIO,'
      '  O.IDAUTORIZACAO,'
      '  O.TRGDTINCLUSAO,'
      '  O.TRGUSERINCLUSAO,'
      '  O.IDTIPOINVEST,'
      '  O.IDTIPOOPERACAO,'
      '  O.OBSAUTMOV,'
      '  O.IDCARTEIRAINVEST,'
      '  O.IDLOTE,'
      '  O.IDBOLSAVALORES,'
      '  O.IDCUSTODIANTE,'
      '  O.QTDEORDENADA,'
      '  O.DATAAUTORIZACAO,'
      '  I.DESCINVESTIMENTO,'
      '  '#39'00:00'#39' AS HORAMOV,'
      '  0 AS VALOR'
      'FROM'
      '  ORDMOVINV O,  INVESTIMENTO I'
      'WHERE'
      '  O.STATMOVINV = '#39'A'#39' AND'
      '  O.DATAORDMOVINV LIKE TO_DATE(:STRDATA,'#39'DD/MM/YYYY'#39') AND'
      '  O.IDINVESTIMENTO  =I.IDINVESTIMENTO'
      ''
      '')
    ControlType.Strings = (
      'IDCUSTODIANTE;CustomEdit;wwDBLookupCombo1'
      'SGLCUSTODIANTE;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 42
    Top = 49
    ParamData = <
      item
        DataType = ftString
        Name = 'STRDATA'
        ParamType = ptUnknown
      end>
    object QryBuscaOrdemIDORDMOVINV: TFloatField
      FieldName = 'IDORDMOVINV'
    end
    object QryBuscaOrdemIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object QryBuscaOrdemIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryBuscaOrdemPUORDMOVINV: TFloatField
      FieldName = 'PUORDMOVINV'
    end
    object QryBuscaOrdemOBSMOVINV: TStringField
      FieldName = 'OBSMOVINV'
      Size = 200
    end
    object QryBuscaOrdemDATAORDMOVINV: TDateTimeField
      FieldName = 'DATAORDMOVINV'
    end
    object QryBuscaOrdemQTDEORDMOVINV: TFloatField
      FieldName = 'QTDEORDMOVINV'
    end
    object QryBuscaOrdemNUMDOCMOVINV: TStringField
      FieldName = 'NUMDOCMOVINV'
      Size = 30
    end
    object QryBuscaOrdemSTATMOVINV: TStringField
      FieldName = 'STATMOVINV'
      Size = 1
    end
    object QryBuscaOrdemIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
    end
    object QryBuscaOrdemIDAUTORIZACAO: TFloatField
      FieldName = 'IDAUTORIZACAO'
    end
    object QryBuscaOrdemTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object QryBuscaOrdemTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object QryBuscaOrdemIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object QryBuscaOrdemIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object QryBuscaOrdemOBSAUTMOV: TStringField
      FieldName = 'OBSAUTMOV'
      Size = 200
    end
    object QryBuscaOrdemIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryBuscaOrdemIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object QryBuscaOrdemIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
    end
    object QryBuscaOrdemIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object QryBuscaOrdemQTDEORDENADA: TFloatField
      FieldName = 'QTDEORDENADA'
    end
    object QryBuscaOrdemDATAAUTORIZACAO: TDateTimeField
      FieldName = 'DATAAUTORIZACAO'
    end
    object QryBuscaOrdemDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryBuscaOrdemHORAMOV: TStringField
      FieldName = 'HORAMOV'
      Size = 5
    end
    object QryBuscaOrdemVALOR: TFloatField
      FieldName = 'VALOR'
    end
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
    Left = 42
    Top = 244
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end>
  end
  object QryNumDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 245
    Top = 196
  end
  object QryUpdOperacaoDireitoStatus: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE OPERACAODIREITO SET STATUS=:pSTATUS WHERE'
      'IDOPERACAODIREITO = :pIDOPERACAODIREITO')
    ValidateWithMask = True
    Left = 365
    Top = 196
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
  object QryInsertBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO BOLETA'
      '(IDBOLETA, STATUS, DATABOLETA, IDFORCLI, TIPMOVBOLETA)'
      'VALUES'
      '(:IDBOLETA,:STATUS,:DATABOLETA,:IDFORCLI, :TIPMOVBOLETA)'
      ' ')
    ValidateWithMask = True
    Left = 493
    Top = 196
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
    Left = 245
    Top = 145
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end>
    object QryBoletaIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Origin = 'BOLETA.IDBOLETA'
      Size = 30
    end
  end
  object QryBuscaCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '       IDPLANOPREV,IDPATROCINADORA'
      'FROM '
      '       CM.CARTEIRAINVEST'
      'WHERE'
      '       IDCARTEIRAINVEST = :pIDCARTEIRAINVEST')
    ValidateWithMask = True
    Left = 42
    Top = 289
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pIDCARTEIRAINVEST'
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
      '      IDOPERACAOINVEST = :pIDOPERACAOINVEST'
      ' ')
    ValidateWithMask = True
    Left = 365
    Top = 244
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
  object QryLote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   QTDELOTE'
      'FROM'
      '   CM.ACOESXBOLSA'
      'WHERE IDACAO =:IDACAO')
    ValidateWithMask = True
    Left = 245
    Top = 289
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDACAO'
        ParamType = ptUnknown
      end>
    object QryLoteQTDELOTE: TFloatField
      FieldName = 'QTDELOTE'
      Origin = 'BASEDADOS.ACOESXBOLSA.QTDELOTE'
    end
  end
  object QryUpdCustoHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HISTCARTINV SET'
      '       MOVIMAQUI =:MOVIMAQUI'
      'WHERE'
      '       IDOPERACAOINVEST =:IDOPERACAOINVEST'
      ' ')
    ValidateWithMask = True
    Left = 365
    Top = 333
    ParamData = <
      item
        DataType = ftFloat
        Name = 'MOVIMAQUI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
  end
  object qryUpdOperacaoDireito: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE OPERACAODIREITO SET'
      '   DIVPORACAO        =:P_DIVPORACAO,'
      '   QTDERECDIRPARC    =:P_QTDERECDIRPARC'
      'WHERE'
      '   IDOPERACAODIREITO =:P_IDOPERACAODIREITO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 365
    Top = 97
    ParamData = <
      item
        DataType = ftFloat
        Name = 'P_DIVPORACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'P_QTDERECDIRPARC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'P_IDOPERACAODIREITO'
        ParamType = ptUnknown
      end>
  end
  object QryOperacaoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    VLRREMUNERACAO,'
      '    VLRIRREMUNER,'
      '    VLROPERACAO,'
      '    QTDEOPERACAO,'
      '    NUMDOCUMENTO,'
      '    DATAOPERACAO,'
      '    VLRIR'
      'FROM'
      '    OPERACAOINVEST'
      'WHERE'
      '    IDOPERACAODIREITO = :IDOPERACAODIREITO    AND'
      '    IDCARTEIRAINVEST  = :IDCARTEIRAINVEST  '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 149
    Top = 335
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end>
    object QryOperacaoInvestVLRREMUNERACAO: TFloatField
      FieldName = 'VLRREMUNERACAO'
      Origin = 'OPERACAOINVEST.VLRREMUNERACAO'
    end
    object QryOperacaoInvestVLRIRREMUNER: TFloatField
      FieldName = 'VLRIRREMUNER'
      Origin = 'OPERACAOINVEST.VLRIRREMUNER'
    end
    object QryOperacaoInvestQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
      Origin = 'OPERACAOINVEST.QTDEOPERACAO'
    end
    object QryOperacaoInvestVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.VLROPERACAO'
    end
    object QryOperacaoInvestNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'BASEDADOS.OPERACAOINVEST.NUMDOCUMENTO'
      Size = 30
    end
    object QryOperacaoInvestDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.DATAOPERACAO'
    end
    object QryOperacaoInvestVLRIR: TFloatField
      FieldName = 'VLRIR'
      Origin = 'BASEDADOS.OPERACAOINVEST.VLRIR'
    end
  end
  object QryBuscaOperacaInvestGrv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM OPERACAOINVEST'
      'WHERE DATAOPERACAO      = :DATAOPERACAO     AND'
      '      IDOPERACAODIREITO = :IDOPERACAODIREITO AND'
      '      IDINVESTIMENTO    = :IDINVESTIMENTO    AND'
      '      PERCENTUAL <> 0')
    ValidateWithMask = True
    Left = 42
    Top = 381
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaValoresCtbFin: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLNTOTCRE AS VALORPLANILHA, VALOR AS VALORDOCUMENTO'
      'FROM PLANILHA PL, LANCTODOCUM LT'
      'WHERE PL.PLNCODIGO = :PLNCODIGO AND'
      '      LT.CODDOCUMENTO = :CODDOCUMENTO')
    ValidateWithMask = True
    Left = 42
    Top = 335
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptInput
      end>
    object qryBuscaValoresCtbFinVALORPLANILHA: TFloatField
      FieldName = 'VALORPLANILHA'
      Origin = 'BASEDADOS.PLANILHA.PLNTOTCRE'
    end
    object qryBuscaValoresCtbFinVALORDOCUMENTO: TFloatField
      FieldName = 'VALORDOCUMENTO'
      Origin = 'BASEDADOS.LANCTODOCUM.VALOR'
    end
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
    Left = 365
    Top = 287
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
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 245
    Top = 335
  end
  object UpdOrigDivJur: TUpdateSQL
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
    Left = 713
    Top = 196
  end
  object DsOrigDivJur: TwwDataSource
    DataSet = QryOrigDivJur
    Left = 643
    Top = 196
  end
  object QryOrigDivJur: TwwQuery
    CachedUpdates = True
    AfterPost = qryAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '     SELECT DISTINCT'
      '        INV.DESCINVESTIMENTO,'
      '        TP.DESCTIPOOPERACAO,'
      '        CA.DESCCARTINVEST,'
      '        C.SGLCUSTODIANTE,'
      
        '        DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL, MB.SIGLAMOTBLOQ) S' +
        'IGLAMOTBLOQ,'
      '        HC.IDLOTE,'
      '        DATAOPERACAO AS DATAREFERENCIA,'
      '        QTDEOPERACAO AS QTDE,'
      '        QTDEOPERACAO AS QTDEDIREITO,'
      '        VLROPERACAO AS VALOREXERCIDO,'
      '        VLRREMUNERACAO,'
      '        VLRIR+VLRIRREMUNER AS IR,'
      '        (VLROPERACAO+VLRREMUNERACAO)-VLRIR AS VLRLIQ,'
      '        VLRIRREMUNER AS VLRIRREMUNERACAO,'
      '        OP.IDCARTEIRAINVEST,'
      '        OP.IDINVESTIMENTO,'
      '        OP.IDCUSTODIANTE,'
      '        HC.IDMOTIVOBLOQUEIO,'
      '        OXI.PERCENTUALINV,'
      '        0 AS VLRCUSTOATUAL,'
      '        0 AS VLRCUSTO'
      '     FROM'
      
        '        OPERACAOINVEST OP, HISTCUSTODIA HC, CUSTODIANTE C, MOTIV' +
        'OBLOQUEIO MB,'
      
        '        CARTEIRAINVEST CA, INVESTIMENTO INV, OPERDIREITOXINV OXI' +
        ', TIPOOPERACAO TP'
      '     WHERE'
      '        OP.IDOPERACAODIREITO  = :P_IDOPERACAODIREITO   AND'
      '        HC.IDMOTIVOBLOQUEIO  <= -1                     AND'
      '        HC.IDINVESTIMENTO(+)  = OP.IDINVESTIMENTO      AND'
      '        HC.IDCUSTODIANTE      = C.IDCUSTODIANTE(+)     AND'
      '        HC.IDMOTIVOBLOQUEIO   = MB.IDMOTIVOBLOQUEIO(+) AND'
      '        INV.IDINVESTIMENTO    = OP.IDINVESTIMENTO      AND'
      '        OXI.IDOPERACAODIREITO = OP.IDOPERACAODIREITO   AND'
      '        OXI.ORIGDEST          = '#39'O'#39'                    AND'
      '        CA.IDCARTEIRAINVEST   = OP.IDCARTEIRAINVEST    AND'
      '        TP.IDTIPOOPERACAO     = OP.IDTIPOOPERACAO'
      ''
      ''
      '')
    UpdateObject = UpdOrigDivJur
    ValidateWithMask = True
    Left = 575
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_IDOPERACAODIREITO'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 15
      FieldName = 'DESCINVESTIMENTO'
      ReadOnly = True
      Size = 60
    end
    object StringField2: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 16
      FieldName = 'DESCCARTINVEST'
      ReadOnly = True
      Size = 60
    end
    object QryOrigDivJurDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 15
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data Prevista'
      DisplayWidth = 10
      FieldName = 'DATAREFERENCIA'
      ReadOnly = True
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Quantidade Base'
      DisplayWidth = 17
      FieldName = 'QTDEDIREITO'
      OnSetText = qryQTDEDIREITOSetText
      DisplayFormat = '###,###,###,###,###'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 17
      FieldName = 'VALOREXERCIDO'
      ReadOnly = True
      OnSetText = qryVALOREXERCIDOSetText
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Remuneração'
      DisplayWidth = 12
      FieldName = 'VLRREMUNERACAO'
      OnSetText = qryVLRREMUNERACAOSetText
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Valor do IR'
      DisplayWidth = 10
      FieldName = 'IR'
      ReadOnly = True
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object FloatField5: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 13
      FieldName = 'VLRLIQ'
      ReadOnly = True
      OnSetText = qryVLRLIQSetText
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object StringField3: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 9
      FieldName = 'SGLCUSTODIANTE'
      ReadOnly = True
      Size = 10
    end
    object StringField4: TStringField
      DisplayLabel = 'Bloq.'
      DisplayWidth = 4
      FieldName = 'SIGLAMOTBLOQ'
      ReadOnly = True
      Size = 3
    end
    object FloatField6: TFloatField
      DisplayLabel = 'Custo Atual'
      DisplayWidth = 17
      FieldName = 'VLRCUSTOATUAL'
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object FloatField7: TFloatField
      DisplayLabel = 'Quantidade Base'
      DisplayWidth = 15
      FieldName = 'QTDE'
      ReadOnly = True
      Visible = False
      DisplayFormat = '###,###,###,###,###'
      EditFormat = '##0'
    end
    object FloatField8: TFloatField
      DisplayLabel = 'Custo Previsto'
      DisplayWidth = 17
      FieldName = 'VLRCUSTO'
      Visible = False
      DisplayFormat = ',##0.00'
      EditFormat = '##0.00'
    end
    object StringField5: TStringField
      DisplayLabel = 'Lote'
      DisplayWidth = 6
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
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
      FieldName = 'VLRIRREMUNERACAO'
      Visible = False
    end
    object FloatField14: TFloatField
      FieldName = 'PERCENTUALINV'
      Visible = False
    end
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
    Left = 42
    Top = 145
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPEDIDOFUNDO'
        ParamType = ptUnknown
      end>
  end
  object qryUpdOperacaoDireitoQtd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE OPERACAODIREITO SET'
      '   QTDDIREITO    =:QTDDIREITO'
      'WHERE'
      '   IDOPERACAODIREITO =:IDOPERACAODIREITO'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 365
    Top = 145
    ParamData = <
      item
        DataType = ftFloat
        Name = 'QTDDIREITO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end>
  end
  object qryAtualizaBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE BOLETA'
      'SET STATUS = '#39'F'#39','
      '    PLANO = :PLANO,'
      '    PLNCODIGO = :PLNCODIGO,'
      '    CODDOCUMENTO = :CODDOCUMENTO'
      'WHERE IDBOLETA = :BOLETA'
      ' ')
    ValidateWithMask = True
    Left = 149
    Top = 289
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
  object QryAtualizaOperacoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE OPERACAOINVEST SET FLGSTATUSFECHBOL = '#39'F'#39
      'WHERE NUMDOCUMENTO= :BOLETA')
    ValidateWithMask = True
    Left = 245
    Top = 244
    ParamData = <
      item
        DataType = ftString
        Name = 'BOLETA'
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
    Left = 505
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
    object QryOperacaoInvestDestinoVLRREMUNERACAO: TFloatField
      FieldName = 'VLRREMUNERACAO'
      Origin = 'OPERACAOINVEST.VLRREMUNERACAO'
    end
    object QryOperacaoInvestDestinoVLRIRREMUNER: TFloatField
      FieldName = 'VLRIRREMUNER'
      Origin = 'OPERACAOINVEST.VLRIRREMUNER'
    end
    object QryOperacaoInvestDestinoQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
      Origin = 'OPERACAOINVEST.QTDEOPERACAO'
    end
    object QryOperacaoInvestDestinoVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.VLROPERACAO'
    end
    object QryOperacaoInvestDestinoNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'OPERACAOINVEST.NUMDOCUMENTO'
      Size = 30
    end
  end
  object QryUpdOperDiretoXInv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE OPERDIREITOXINV SET'
      '       IDOPERACAOINVEST  =:IDOPERACAOINVEST'
      'WHERE  IDOPERACAODIREITO =:IDOPERACAODIREITO AND'
      '       IDINVESTIMENTO    =:IDINVESTIMENTO    AND'
      #9' ORIGDEST'#9' =:ORIGDEST'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 510
    Top = 329
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
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'ORIGDEST'
        ParamType = ptInput
      end>
  end
  object QryCarteiraGerenc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM '
      'CARTEIRAGERENC ')
    ValidateWithMask = True
    Left = 488
    Top = 50
  end
end
