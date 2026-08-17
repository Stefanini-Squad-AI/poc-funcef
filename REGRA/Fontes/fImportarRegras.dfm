inherited frmImportarRegras: TfrmImportarRegras
  Left = 437
  Top = 93
  HelpContext = 450006
  Caption = 'Importação de Regras'
  ClientHeight = 442
  ClientWidth = 651
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 651
    Height = 403
    object pc: TPageControl
      Left = 1
      Top = 1
      Width = 649
      Height = 401
      ActivePage = tbRegras
      Align = alClient
      TabOrder = 0
      object tbRegras: TTabSheet
        Caption = 'Regras'
        object Splitter1: TSplitter
          Left = 0
          Top = 153
          Width = 641
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object Splitter2: TSplitter
          Left = 0
          Top = 197
          Width = 641
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object Panel2: TPanel
          Left = 0
          Top = 156
          Width = 641
          Height = 41
          Align = alTop
          TabOrder = 0
          object btnNovoRegra: TBitBtn
            Left = 226
            Top = 6
            Width = 112
            Height = 29
            Hint = 'Caso a Regra já exista, clique aqui para criar uma nova.'
            Caption = 'Nova Regra'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = btnNovoRegraClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
              333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
              0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
              07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
              0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
              33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
              B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
              3BB33773333773333773B333333B3333333B7333333733333337}
            NumGlyphs = 2
          end
          object btnExcluirRegra: TBitBtn
            Left = 346
            Top = 6
            Width = 112
            Height = 29
            Hint = 'Excluir a Regra da lista à importar.'
            Caption = 'Excluir Regra'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btnExcluirRegraClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333FF3333333333333003333333333333377F33333333333307
              733333FFF333337773333C003333307733333777FF333777FFFFC0CC03330770
              000077777FF377777777C033C03077FFFFF077FF77F777FFFFF7CC00000F7777
              777077777777777777773CCCCC00000000003777777777777777333330030FFF
              FFF03333F77F7F3FF3F7333C0C030F00F0F03337777F7F77373733C03C030FFF
              FFF03377F77F7F3F333733C03C030F0FFFF03377F7737F733FF733C000330FFF
              0000337777F37F3F7777333CCC330F0F0FF0333777337F737F37333333330FFF
              0F03333333337FFF7F7333333333000000333333333377777733}
            NumGlyphs = 2
          end
          object CkBxExcluiPassos: TCheckBox
            Left = 470
            Top = 21
            Width = 161
            Height = 15
            Hint = 
              'Caso a Regra já exista, excluir todos os passos existentes antes' +
              ' de importar os novos.'
            Caption = 'Exclui Passos existentes'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
          end
          object btnDiretorio: TBitBtn
            Left = 5
            Top = 6
            Width = 140
            Height = 29
            Hint = 'Busca o arquivo com as regras à importar.'
            Caption = 'Buscar &Arquivo'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = btnDiretorioClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
              333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
              300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
              333337F373F773333333303330033333333337F3377333333333303333333333
              333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
              333337777F337F33333330330BB00333333337F373F773333333303330033333
              333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
              333377777F77377733330BBB0333333333337F337F33333333330BB003333333
              333373F773333333333330033333333333333773333333333333}
            NumGlyphs = 2
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 200
          Width = 641
          Height = 173
          Align = alClient
          TabOrder = 1
          object wwDBGrid2: TwwDBGrid
            Left = 1
            Top = 26
            Width = 639
            Height = 146
            Selected.Strings = (
              'IDREGRA'#9'14'#9'Número  '#9'F'
              'NOMEREGRA'#9'69'#9'Descricao da Regra')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsRegraView
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          object Panel12: TPanel
            Left = 1
            Top = 1
            Width = 639
            Height = 25
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'Regras existentes com mesmo nome'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object dedRegra: TwwDBEdit
            Left = 484
            Top = 32
            Width = 121
            Height = 21
            DataField = 'IDREGRA'
            DataSource = dsRegraView
            TabOrder = 2
            UnboundDataType = wwDefault
            Visible = False
            WantReturns = False
            WordWrap = False
            OnChange = dedRegraChange
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 641
          Height = 153
          Align = alTop
          TabOrder = 2
          object Panel11: TPanel
            Left = 1
            Top = 1
            Width = 639
            Height = 25
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'Regras à importar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object wwDBGrid1: TwwDBGrid
            Left = 1
            Top = 26
            Width = 639
            Height = 126
            Selected.Strings = (
              'IDREGRA'#9'10'#9'Número'
              'NOMEREGRA'#9'74'#9'Descrição da Regra'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsTabRegra
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
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
          object dedRegraExp: TwwDBEdit
            Left = 480
            Top = 68
            Width = 121
            Height = 21
            DataField = 'IDREGRA'
            DataSource = dsTabRegra
            TabOrder = 2
            UnboundDataType = wwDefault
            Visible = False
            WantReturns = False
            WordWrap = False
            OnChange = dedRegraExpChange
          end
        end
      end
      object tbPassos: TTabSheet
        Caption = 'Passos'
        object Splitter3: TSplitter
          Left = 0
          Top = 177
          Width = 641
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 641
          Height = 177
          Align = alTop
          TabOrder = 0
          object Panel13: TPanel
            Left = 1
            Top = 1
            Width = 639
            Height = 25
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'Passos das regras à importar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object wwDBGrid3: TwwDBGrid
            Left = 1
            Top = 26
            Width = 639
            Height = 150
            Selected.Strings = (
              'IDALGORITMODAREG'#9'10'#9'Passos'
              'DESCRICAOALGORIT'#9'120'#9'Descrição dos Passos')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsPassosPdx
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
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
        end
        object Panel7: TPanel
          Left = 0
          Top = 180
          Width = 641
          Height = 193
          Align = alClient
          TabOrder = 1
          object Panel14: TPanel
            Left = 1
            Top = 1
            Width = 639
            Height = 32
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'Passos das regras existentes'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object BtExcPassos: TBitBtn
              Left = 481
              Top = 4
              Width = 125
              Height = 25
              Hint = 'Exclui passos existentes'
              Caption = 'Excluir Passos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = BtExcPassosClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333FF3333333333333003333333333333377F33333333333307
                733333FFF333337773333C003333307733333777FF333777FFFFC0CC03330770
                000077777FF377777777C033C03077FFFFF077FF77F777FFFFF7CC00000F7777
                777077777777777777773CCCCC00000000003777777777777777333330030FFF
                FFF03333F77F7F3FF3F7333C0C030F00F0F03337777F7F77373733C03C030FFF
                FFF03377F77F7F3F333733C03C030F0FFFF03377F7737F733FF733C000330FFF
                0000337777F37F3F7777333CCC330F0F0FF0333777337F737F37333333330FFF
                0F03333333337FFF7F7333333333000000333333333377777733}
              NumGlyphs = 2
            end
          end
          object wwDBGrid4: TwwDBGrid
            Left = 1
            Top = 33
            Width = 639
            Height = 159
            Selected.Strings = (
              'IDALGORITMODAREG'#9'10'#9'Passos'#9'F'
              'DESCRICAOALGORIT'#9'120'#9'Descrição dos Passos'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsAlgregra
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
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
        end
      end
      object tbFormulas: TTabSheet
        Caption = 'Fórmulas'
        object Splitter5: TSplitter
          Left = 0
          Top = 153
          Width = 641
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object Splitter6: TSplitter
          Left = 0
          Top = 197
          Width = 641
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 641
          Height = 153
          Align = alTop
          TabOrder = 0
          object dbgrFormulaExp: TwwDBGrid
            Left = 1
            Top = 26
            Width = 639
            Height = 126
            Selected.Strings = (
              'IDFORMULA'#9'10'#9'Número da Formula'
              'DESCRICAOFORMULA'#9'60'#9'Descrição da Formula'
              'EXPRESSAOREAL'#9'255'#9'Expressão da Formula')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsFormulaPdx
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentShowHint = False
            ShowHint = True
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
          object Panel15: TPanel
            Left = 1
            Top = 1
            Width = 639
            Height = 25
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'Fórmulas à importar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object dedFormula: TwwDBEdit
            Left = 484
            Top = 32
            Width = 121
            Height = 21
            DataField = 'IDFORMULA'
            DataSource = dsFormulaPdx
            TabOrder = 2
            UnboundDataType = wwDefault
            Visible = False
            WantReturns = False
            WordWrap = False
            OnChange = dedFormulaChange
          end
        end
        object Panel9: TPanel
          Left = 0
          Top = 156
          Width = 641
          Height = 41
          Align = alTop
          Alignment = taLeftJustify
          TabOrder = 1
          object Mens: TStaticText
            Left = 1
            Top = 1
            Width = 168
            Height = 39
            Align = alLeft
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSunken
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object btnNovaFormula: TBitBtn
            Left = 262
            Top = 7
            Width = 125
            Height = 29
            Hint = 'Caso Fórmula já exista, clique aqui para criar uma nova'
            Caption = 'Nova Fórmula'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btnNovaFormulaClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
              333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
              0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
              07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
              0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
              33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
              B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
              3BB33773333773333773B333333B3333333B7333333733333337}
            NumGlyphs = 2
          end
          object btnExcluirFormula: TBitBtn
            Left = 398
            Top = 7
            Width = 125
            Height = 29
            Hint = 'Excluir Fórmula da lista à importar'
            Caption = 'Excluir Fórmula'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = btnExcluirFormulaClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333FF3333333333333003333333333333377F33333333333307
              733333FFF333337773333C003333307733333777FF333777FFFFC0CC03330770
              000077777FF377777777C033C03077FFFFF077FF77F777FFFFF7CC00000F7777
              777077777777777777773CCCCC00000000003777777777777777333330030FFF
              FFF03333F77F7F3FF3F7333C0C030F00F0F03337777F7F77373733C03C030FFF
              FFF03377F77F7F3F333733C03C030F0FFFF03377F7737F733FF733C000330FFF
              0000337777F37F3F7777333CCC330F0F0FF0333777337F737F37333333330FFF
              0F03333333337FFF7F7333333333000000333333333377777733}
            NumGlyphs = 2
          end
        end
        object Panel10: TPanel
          Left = 0
          Top = 200
          Width = 641
          Height = 173
          Align = alClient
          TabOrder = 2
          object wwDBGrid6: TwwDBGrid
            Left = 1
            Top = 26
            Width = 639
            Height = 146
            Selected.Strings = (
              'IDFORMULA'#9'10'#9'Número da Fórmula'
              'DESCRICAOFORMULA'#9'60'#9'Descrição da Formula'
              'EXPRESSAOREAL'#9'255'#9'Expressão da Formula')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsFormula
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          object Panel16: TPanel
            Left = 1
            Top = 1
            Width = 639
            Height = 25
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'Fórmulas da Regra existente '
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object tbOutras: TTabSheet
        Caption = 'Outras Fórmulas'
        object PanOutras: TPanel
          Left = 0
          Top = 0
          Width = 641
          Height = 41
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 0
        end
        object wwDBGrid5: TwwDBGrid
          Left = 0
          Top = 41
          Width = 641
          Height = 332
          Selected.Strings = (
            'IDFORMULA'#9'10'#9'Número da Formula'
            'DESCRICAOFORMULA'#9'60'#9'Descrição da Formula'
            'EXPRESSAOREAL'#9'255'#9'Expressão da Formula')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsFormulaAux
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
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
      end
      object tbResultados: TTabSheet
        Caption = 'Resultados'
        object rchedt: TRichEdit
          Left = 0
          Top = 0
          Width = 641
          Height = 340
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
        end
        object Panel1: TPanel
          Left = 0
          Top = 340
          Width = 641
          Height = 33
          Align = alBottom
          TabOrder = 1
          object SbtnSalvar: TSpeedButton
            Left = 4
            Top = 4
            Width = 157
            Height = 25
            Hint = 'Gravar o Resultado em Arquivo'
            Caption = 'Salvar Resultado'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000BFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F00000000000000000000000000000000
              00000000000000000000000000000000000000007F7F7FBFBFBFBFBFBF000000
              FF0000FF00000000007F7F7FFF0000FF0000FFFFFFBFBFBFBFBFBF000000FF00
              00FF0000000000BFBFBFBFBFBF000000FF0000FF00000000007F7F7FFF0000FF
              0000FFFFFFBFBFBFBFBFBF000000FF0000FF0000000000BFBFBFBFBFBF000000
              FF0000FF0000000000BFBFBF7F7F7F7F7F7FBFBFBFBFBFBFBFBFBF000000FF00
              00FF0000000000BFBFBFBFBFBF000000FF0000FF00007F7F0000000000000000
              00000000000000000000007F7F00FF0000FF0000000000BFBFBFBFBFBF000000
              FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
              00FF0000000000BFBFBFBFBFBF000000FF00007F7F0000000000000000000000
              00000000000000000000000000007F7F00FF0000000000BFBFBFBFBFBF000000
              FF0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              00FF0000000000BFBFBFBFBFBF000000FF0000000000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF0000000000BFBFBFBFBFBF000000
              FF0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              00FF0000000000BFBFBFBFBFBF000000FF0000000000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF0000000000BFBFBFBFBFBF000000
              000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
              00000000000000BFBFBFBFBFBF000000FF0000000000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF0000000000BFBFBFBFBFBF7F7F7F
              0000000000000000000000000000000000000000000000000000000000000000
              000000007F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
              BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF}
            OnClick = SbtnSalvarClick
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 651
    inherited tb97Fundo: TToolbar97
      Left = 471
      DockPos = 471
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 302
      DockPos = 302
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
    object btnDescompactar: TButton
      Left = 184
      Top = 2
      Width = 93
      Height = 33
      Caption = '&Decompactar'
      TabOrder = 2
      Visible = False
      OnClick = btnDescompactarClick
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 209
    Top = 89
  end
  object dsTabRegra: TwwDataSource
    DataSet = TabRegra
    Left = 303
    Top = 148
  end
  object TabRegra: TwwTable
    DatabaseName = 'c:\Temp'
    TableName = 'REGRA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 274
    Top = 148
  end
  object QryRegraView: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  R.IDREGRA, R.NOMEREGRA, T.DESCREGRA'
      'FROM'
      '  REGRA R, TIPOREGRA T'
      'WHERE'
      '  (R.IDTIPOREGRA = T.IDTIPOREGRA) AND'
      '  (RTRIM(R.NOMEREGRA) = :NOME)    AND'
      '  (RTRIM(T.DESCREGRA) = :TIPO)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 22
    Top = 290
    ParamData = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end>
  end
  object dsRegraView: TwwDataSource
    DataSet = QryRegraView
    Left = 51
    Top = 290
  end
  object Pdd: TProcuraDirDlg
    Caption = 'Seleção de Diretório para Exportação / Importação'
    Directory = 
      #17'btnNovoRegraClick'#27#0#22#0#0#0#20'btnExcluirRegraClick'#24#0#23#0#0#0#17'btnDiretorio' +
      'Click'#21#0#24#0#0#0#14'dedRegraChange'#24#0#25#0#0#0#17'dedRegraExpChange'#23#0#26#0#0#0#16'BtExcPa' +
      'ssosClick'#23#0#27#0#0#0#16'dedFormulaChange'#26#0#28#0#0#0#19'btnNovaFormulaClick'#29#0#29#0#0#0 +
      #22'btnExcluirFormulaClick'#22#0#30#0#0#0#15'SbtnSalvarClick'#25#0#31#0#0#0#18'bbtnConfirma' +
      'rCli'
    Folder = foCustom
    ShowPath = False
    Left = 81
    Top = 89
  end
  object TabTipoRegra: TwwTable
    TableName = 'TIPOREGRA.DB'
    TableType = ttParadox
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 111
    Top = 148
  end
  object TabAlgRegra: TwwTable
    TableName = 'ALGREGRA.DB'
    TableType = ttParadox
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 139
    Top = 148
  end
  object QryPassosPdx: TwwQuery
    SQL.Strings = (
      'SELECT'
      '      IDREGRA, IDALGORITMODAREG, IDCAMPO, CORRELACAO, FORMULA2,'
      '      IDCAMPO2, VALOR, TIPOALGORITMO, ALGORSUBSEQTRUE, FORMULA1,'
      
        '      ALGORSUBSEQFALSE, DESCRICAOALGORIT, TIPOCAMPO1, TIPOCAMPO2' +
        ','
      '      FORMATACAO'
      'FROM'
      '    ALGREGRA'
      'WHERE'
      '     IDREGRA = :ID'
      'ORDER BY'
      '      IDREGRA, IDALGORITMODAREG')
    ValidateWithMask = True
    Left = 394
    Top = 76
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object dsPassosPdx: TwwDataSource
    DataSet = QryPassosPdx
    Left = 426
    Top = 76
  end
  object QryAlgregra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDREGRA, IDALGORITMODAREG, IDCAMPO, CORRELACAO, FORMULA2,'
      '      IDCAMPO2, VALOR, TIPOALGORITMO, ALGORSUBSEQTRUE, FORMULA1,'
      
        '      ALGORSUBSEQFALSE, DESCRICAOALGORIT, TIPOCAMPO1, TIPOCAMPO2' +
        ','
      '      FORMATACAO'
      'FROM'
      '    ALGREGRA'
      'WHERE'
      '     IDREGRA = :ID'
      'ORDER BY'
      '      IDREGRA, IDALGORITMODAREG')
    ValidateWithMask = True
    Left = 100
    Top = 226
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object QryAlgregraIDALGORITMODAREG: TFloatField
      DisplayLabel = 'Passos'
      DisplayWidth = 10
      FieldName = 'IDALGORITMODAREG'
      Origin = '"CM.ALGREGRA".IDALGORITMODAREG'
    end
    object QryAlgregraDESCRICAOALGORIT: TStringField
      DisplayLabel = 'Descrição dos Passos'
      DisplayWidth = 120
      FieldName = 'DESCRICAOALGORIT'
      Origin = '"CM.ALGREGRA".DESCRICAOALGORIT'
      Size = 120
    end
    object QryAlgregraIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = '"CM.ALGREGRA".IDREGRA'
      Visible = False
    end
    object QryAlgregraIDCAMPO: TStringField
      FieldName = 'IDCAMPO'
      Origin = '"CM.ALGREGRA".IDCAMPO'
      Visible = False
      Size = 12
    end
    object QryAlgregraCORRELACAO: TStringField
      FieldName = 'CORRELACAO'
      Origin = '"CM.ALGREGRA".CORRELACAO'
      Visible = False
      Size = 2
    end
    object QryAlgregraFORMULA2: TFloatField
      FieldName = 'FORMULA2'
      Origin = '"CM.ALGREGRA".FORMULA2'
      Visible = False
    end
    object QryAlgregraIDCAMPO2: TStringField
      FieldName = 'IDCAMPO2'
      Origin = '"CM.ALGREGRA".IDCAMPO2'
      Visible = False
      Size = 12
    end
    object QryAlgregraVALOR: TStringField
      FieldName = 'VALOR'
      Origin = '"CM.ALGREGRA".VALOR'
      Visible = False
      Size = 60
    end
    object QryAlgregraTIPOALGORITMO: TFloatField
      FieldName = 'TIPOALGORITMO'
      Origin = '"CM.ALGREGRA".TIPOALGORITMO'
      Visible = False
    end
    object QryAlgregraALGORSUBSEQTRUE: TFloatField
      FieldName = 'ALGORSUBSEQTRUE'
      Origin = '"CM.ALGREGRA".ALGORSUBSEQTRUE'
      Visible = False
    end
    object QryAlgregraFORMULA1: TFloatField
      FieldName = 'FORMULA1'
      Origin = '"CM.ALGREGRA".FORMULA1'
      Visible = False
    end
    object QryAlgregraALGORSUBSEQFALSE: TFloatField
      FieldName = 'ALGORSUBSEQFALSE'
      Origin = '"CM.ALGREGRA".ALGORSUBSEQFALSE'
      Visible = False
    end
    object QryAlgregraTIPOCAMPO1: TFloatField
      FieldName = 'TIPOCAMPO1'
      Origin = '"CM.ALGREGRA".TIPOCAMPO1'
      Visible = False
    end
    object QryAlgregraTIPOCAMPO2: TFloatField
      FieldName = 'TIPOCAMPO2'
      Origin = '"CM.ALGREGRA".TIPOCAMPO2'
      Visible = False
    end
    object QryAlgregraFORMATACAO: TFloatField
      FieldName = 'FORMATACAO'
      Origin = '"CM.ALGREGRA".FORMATACAO'
      Visible = False
    end
  end
  object dsAlgregra: TwwDataSource
    DataSet = QryAlgregra
    Left = 129
    Top = 234
  end
  object QryFormulaPdx: TwwQuery
    SQL.Strings = (
      'SELECT DISTINCT FORMULA.IDFORMULA, FORMULA.EXPRESSAOREAL,'
      '       FORMULA.DESCRICAOFORMULA, FORMULA.IDANTIGO,'
      '       FORMULA.CODGRUPOFORMULA'
      'FROM'
      '    FORMULA,  ALGREGRA'
      'WHERE'
      '     ALGREGRA.FORMULA1 = FORMULA.IDFORMULA AND'
      '     ALGREGRA.IDREGRA = :ID'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 330
    Top = 76
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object dsFormulaPdx: TwwDataSource
    DataSet = QryFormulaPdx
    Left = 362
    Top = 76
  end
  object QryFormulaAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDFORMULA, EXPRESSAOREAL, DESCRICAOFORMULA'
      'FROM'
      '  FORMULA'
      'WHERE'
      '  TRIM(EXPRESSAOREAL)    = :EXPR  AND'
      '  TRIM(DESCRICAOFORMULA) = :DESCR AND'
      '  TRIM(CODGRUPOFORMULA)  = :CODGR'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 292
    Top = 349
    ParamData = <
      item
        DataType = ftString
        Name = 'EXPR'
        ParamType = ptInput
        Value = 'ARITM(@VAL1+@VAL2+@VAL3+@VAL4+@VAL5+@VAL6+@VAL7)'
      end
      item
        DataType = ftString
        Name = 'DESCR'
        ParamType = ptInput
        Value = 'ADIÇÃO(VAL1+VAL2+VAL3+VAL4+VAL5+VAL6+VAL7)'
      end
      item
        DataType = ftString
        Name = 'CODGR'
        ParamType = ptInput
        Value = 'BAS'
      end>
  end
  object dsFormulaAux: TwwDataSource
    DataSet = QryFormulaAux
    Left = 322
    Top = 349
  end
  object QryFormula: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT F.IDFORMULA, F.EXPRESSAOFORMULA, F.CODGRUPOFORMU' +
        'LA,'
      '                F.DESCRICAOFORMULA, F.EXPRESSAOREAL'
      'FROM FORMULA F, '
      '     (SELECT IDREGRA, FORMULA1, TIPOCAMPO2'
      '      FROM ALGREGRA'
      '      WHERE TIPOCAMPO2 = 4) A'
      'WHERE (TRIM(F.EXPRESSAOREAL) = :EXPRESSAOREAL)'
      '  AND (TRIM(F.DESCRICAOFORMULA) = :DESCRICAOFORMULA)'
      '  AND (TRIM(F.CODGRUPOFORMULA) = :CODGRUPOFORMULA)'
      '  AND (F.IDFORMULA = A.FORMULA1(+))'
      'ORDER BY F.DESCRICAOFORMULA'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 225
    Top = 349
    ParamData = <
      item
        DataType = ftString
        Name = 'EXPRESSAOREAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRICAOFORMULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODGRUPOFORMULA'
        ParamType = ptUnknown
      end>
  end
  object dsFormula: TwwDataSource
    DataSet = QryFormula
    Left = 255
    Top = 349
  end
  object tabGrpFormula: TwwTable
    TableName = 'GRPFORMULA'
    TableType = ttParadox
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 196
    Top = 148
  end
  object TabGrpArquivo: TwwTable
    TableName = 'GRPARQUIVO'
    TableType = ttParadox
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 168
    Top = 148
  end
  object TabCmpBdGrp: TwwTable
    TableName = 'CMPBDGRP'
    TableType = ttParadox
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 82
    Top = 148
  end
  object TabCmpBd: TwwTable
    TableName = 'CMPBD'
    TableType = ttParadox
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 53
    Top = 148
  end
  object tabFormula: TwwTable
    TableName = 'FORMULA'
    TableType = ttParadox
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 25
    Top = 148
  end
  object QryWrk: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 521
    Top = 290
  end
  object Od: TOpenDialog
    DefaultExt = '*.Exp'
    Filter = 'Arquivos de Exportação|*.exp'
    Title = 'Arquivos de Exportação de Regras'
    Left = 145
    Top = 89
  end
  object ZipMaster1: TZipMaster
    Verbose = False
    Trace = False
    AddCompLevel = 9
    AddOptions = []
    ExtrBaseDir = 'c:\expregra'
    ExtrOptions = [ExtrDirNames, ExtrOverWrite]
    SFXOptions = []
    Unattended = False
    SFXPath = 'ZipSFX.bin'
    SFXOverWriteMode = OvrConfirm
    SFXCaption = 'Self-extracting Archive'
    KeepFreeOnDisk1 = 0
    VersionInfo = '1.52 M'
    Left = 113
    Top = 89
  end
  object Sd: TSaveDialog
    DefaultExt = '*.doc'
    Filter = 'Arquivo DOC|*.doc'
    Title = 'Resultado da Importação'
    Left = 177
    Top = 89
  end
  object QryTipoRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDTIPOREGRA, DESCREGRA'
      'FROM'
      '    TIPOREGRA')
    ValidateWithMask = True
    Left = 305
    Top = 290
  end
  object QryFormulaBD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDFORMULA'
      'FROM'
      '    FORMULA'
      'ORDER BY'
      '      IDFORMULA')
    ValidateWithMask = True
    Left = 550
    Top = 290
  end
  object QryRegraBD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDREGRA'
      'FROM'
      '    REGRA'
      'ORDER BY'
      '      IDREGRA')
    ValidateWithMask = True
    Left = 579
    Top = 290
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 577
    Top = 5
  end
  object Table1: TTable
    DatabaseName = 'C:\temp'
    TableName = 'tiporegra'
    Left = 544
    Top = 5
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 492
    Top = 290
  end
end
