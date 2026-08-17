inherited frmCadTabela: TfrmCadTabela
  Left = 296
  Top = 81
  HelpContext = 450015
  Caption = 'Tabela Genérica'
  ClientHeight = 451
  ClientWidth = 590
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 590
    Height = 365
    Enabled = False
    inherited pnlMestre: TPanel
      Width = 588
      object Label1: TLabel
        Left = 17
        Top = 5
        Width = 94
        Height = 13
        Caption = 'Nome da Tabela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 17
        Top = 48
        Width = 123
        Height = 13
        Caption = 'Descrição da Tabela '
      end
      object dbedDescricao: TwwDBEdit
        Left = 17
        Top = 64
        Width = 545
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwdbeNome: TwwDBEdit
        Left = 17
        Top = 22
        Width = 145
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CODTABELA'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited pnlDetalhe: TPanel
      Width = 588
      Height = 273
      inherited pgctrlDetalhe: TPageControl
        Width = 582
        Height = 267
        OnChange = pgctrlDetalheChange
        OnChanging = pgctrlDetalheChanging
        inherited tbshDetalhe: TTabSheet
          Caption = 'Estrutura da Tabela'
          inherited pnlControlesDet: TPanel
            Left = -1
            Width = 569
            Height = 197
            Align = alNone
            object Label2: TLabel [0]
              Left = 15
              Top = 58
              Width = 78
              Height = 13
              Caption = 'Tipo de Dado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel [1]
              Left = 15
              Top = 17
              Width = 94
              Height = 13
              Caption = 'Nome da Coluna'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel [2]
              Left = 15
              Top = 101
              Width = 119
              Height = 13
              Caption = 'Descrição da Coluna'
            end
            inherited Panel4: TPanel
              Left = 459
              Width = 109
              Height = 195
              BevelOuter = bvLowered
              TabOrder = 3
              inherited bbtnOkDet: TBitBtn
                Left = 2
                Top = 1
                Width = 106
              end
              inherited bbtnCancelarDet: TBitBtn
                Left = 2
                Top = 28
                Width = 106
              end
            end
            object dblkcmbTipo: TwwDBLookupCombo
              Left = 15
              Top = 74
              Width = 258
              Height = 21
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMETIPODADO'#9'60'#9'Tipo de Dado')
              DataField = 'IDTIPODADO'
              DataSource = dsDet
              LookupTable = qryTpDado
              LookupField = 'IDTIPODADO'
              Options = [loRowLines, loTitles]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dbedDescCampo: TwwDBEdit
              Left = 15
              Top = 117
              Width = 338
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DESCRICAO'
              DataSource = dsDet
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBECodCampo: TwwDBEdit
              Left = 15
              Top = 33
              Width = 130
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODCAMPO'
              DataSource = dsDet
              MaxLength = 15
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object StrGrdTab: TStringGrid [1]
            Left = 0
            Top = 36
            Width = 565
            Height = 194
            ColCount = 1
            FixedCols = 0
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goTabs, goThumbTracking]
            TabOrder = 3
            OnKeyDown = StrGrdTabKeyDown
            OnKeyPress = StrGrdTabKeyPress
            OnSelectCell = StrGrdTabSelectCell
            RowHeights = (
              24
              24)
          end
          inherited dbgrdDet: TwwDBGrid
            Left = 466
            Top = 120
            Width = 94
            Height = 102
            Selected.Strings = (
              'CODTABELA'#9'10'#9'Cód.Tabela'
              'CODCAMPO'#9'10'#9'Cód.Coluna'
              'IDCAMPOCOL'#9'10'#9'Tipo de Dado'
              'NOME'#9'60'#9'Nome da Coluna')
            Align = alNone
            Visible = False
          end
          inherited pnlBarraDetalhe: TPanel
            Width = 574
            inherited sbtnProcDet: TSpeedButton
              Left = 537
              Visible = False
            end
            inherited sbtnInsDet: TSpeedButton [1]
              Hint = 'Inserir coluna'
              OnMouseDown = nil
            end
            object BtExcluiLinha: TSpeedButton [2]
              Left = 92
              Top = 4
              Width = 25
              Height = 25
              Hint = 'Excluir Linha'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                333333333333333333FF33333333333330003333333333333777333333333333
                300033FFFFFF3333377739999993333333333777777F3333333F399999933333
                3300377777733333337733333333333333003333333333333377333333333333
                3333333333333333333F333333333333330033333F33333333773333C3333333
                330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
                993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
                333333377F33333333FF3333C333333330003333733333333777333333333333
                3000333333333333377733333333333333333333333333333333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = BtExcluiLinhaClick
            end
            object BtInsereLinha: TSpeedButton [3]
              Left = 117
              Top = 4
              Width = 25
              Height = 25
              Hint = 'Inserir Linha'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33333333FF33333333FF333993333333300033377F3333333777333993333333
                300033F77FFF3333377739999993333333333777777F3333333F399999933333
                33003777777333333377333993333333330033377F3333333377333993333333
                3333333773333333333F333333333333330033333333F33333773333333C3333
                330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
                993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
                333333333337733333FF3333333C333330003333333733333777333333333333
                3000333333333333377733333333333333333333333333333333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = BtInsereLinhaClick
            end
            inherited sbtnAltDet: TSpeedButton
              Left = 31
              Hint = 'Alterar coluna'
            end
            inherited sbtnApagDet: TSpeedButton [5]
              Left = 56
              Hint = 'Remover coluna'
            end
            object btnBtInsereLinhaB: TSpeedButton
              Left = 141
              Top = 4
              Width = 25
              Height = 25
              Hint = 'Inserir Linha'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333C3333
                33333333333F333333333333333CC33333333333337FF3333FF33CCCCCCCCCC3
                99333FFFFF77FFF377F33CCCCCCCCCC399337777777777F377333333333CC333
                333377777777773333FF3333333C333330003333337733333777333333333333
                300033333373333337773333333333333333333333333333333F333399333333
                33003333FF3333333377333399333333330033377F3333333377339999993333
                333333F77FFF3333333F33999999333333003777777F33333377333399333333
                33003777777333333377333399333333333333377F33333333FF333333333333
                3000333773333333377733333333333330003333333333333777}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = btnBtInsereLinhaBClick
            end
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'Linhas da Coluna'
          TabVisible = False
          object SgrdDet: TStringGrid
            Left = 120
            Top = 134
            Width = 105
            Height = 67
            ColCount = 1
            DefaultColWidth = 80
            DefaultRowHeight = 16
            FixedCols = 0
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
            TabOrder = 2
          end
          object pnlControlesDet2: TPanel
            Left = 192
            Top = 77
            Width = 353
            Height = 148
            TabOrder = 0
            object Label5: TLabel
              Left = 16
              Top = 78
              Width = 68
              Height = 13
              Caption = 'Valor da Linha'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label4: TLabel
              Left = 14
              Top = 33
              Width = 97
              Height = 16
              Caption = 'Coluna Utilizada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edValor: TEdit
              Left = 135
              Top = 72
              Width = 325
              Height = 21
              TabOrder = 4
            end
            object Panel2: TPanel
              Left = 299
              Top = 1
              Width = 53
              Height = 146
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
              object bbtnOkDet2: TBitBtn
                Left = 1
                Top = 5
                Width = 70
                Height = 27
                Caption = '&OK'
                TabOrder = 0
                OnClick = bbtnOkDet2Click
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
                Spacing = 0
              end
              object bbtnCancelarDet2: TBitBtn
                Left = -15
                Top = 114
                Width = 70
                Height = 27
                Cancel = True
                Caption = '&Cancelar'
                TabOrder = 1
                OnClick = bbtnCancelarDet2Click
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
                Spacing = 0
              end
            end
            object dbedDescLinha: TwwDBEdit
              Left = 135
              Top = 6
              Width = 327
              Height = 21
              DataField = 'VALOR'
              DataSource = dsDet2
              TabOrder = 2
              UnboundDataType = wwDefault
              Visible = False
              WantReturns = False
              WordWrap = False
              OnKeyUp = dbedDescLinhaKeyUp
            end
            object edColUtilizada: TEdit
              Left = 135
              Top = 32
              Width = 250
              Height = 21
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              Text = 'edColUtilizada'
            end
            object dtedVlLinha: TCMDateTimePicker
              Left = 136
              Top = 72
              Width = 121
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
              TabOrder = 0
            end
          end
          object pnlBarraDetalhe2: TPanel
            Left = 0
            Top = 0
            Width = 574
            Height = 34
            Align = alTop
            TabOrder = 1
            object sbtnProcDet2: TSpeedButton
              Left = 89
              Top = 4
              Width = 25
              Height = 25
              Hint = 'Procurar por registro|'
              AllowAllUp = True
              GroupIndex = 1
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
                33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
                8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
                F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
                F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
                0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
                B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
                B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
                333333333777733333333333FBFBFB3333333333333333333333}
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
            end
            object sbtnApagLinha: TSpeedButton
              Left = 61
              Top = 4
              Width = 25
              Height = 25
              Hint = 'Remover o registro selecionado|'
              AllowAllUp = True
              GroupIndex = 1
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
              OnClick = sbtnApagLinhaClick
            end
            object sbtnAltLinha: TSpeedButton
              Left = 33
              Top = 4
              Width = 25
              Height = 25
              Hint = 'Alterar o registro selecionado|'
              AllowAllUp = True
              GroupIndex = 1
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
              OnClick = sbtnAltLinhaClick
            end
            object sbtnInsLinha: TSpeedButton
              Left = 8
              Top = 4
              Width = 23
              Height = 25
              Hint = 'Inserir novo registro|'
              AllowAllUp = True
              GroupIndex = 1
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
              OnClick = sbtnInsLinhaClick
              OnMouseDown = sbtnInserirMouseDown
            end
            object btnLinhas: TBitBtn
              Left = 573
              Top = 5
              Width = 69
              Height = 25
              Caption = 'Linhas'
              TabOrder = 0
              OnClick = btnLinhasClick
              Glyph.Data = {
                F2010000424DF201000000000000760000002800000024000000130000000100
                0400000000007C01000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
                3333333333388F3333333333000033334224333333333333338338F333333333
                0000333422224333333333333833338F33333333000033422222243333333333
                83333338F3333333000034222A22224333333338F33F33338F33333300003222
                A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
                38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
                2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
                0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
                333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
                33333A2224A2233333333338F338F83300003333333333A2224A333333333333
                8F338F33000033333333333A222433333333333338F338F30000333333333333
                A224333333333333338F38F300003333333333333A223333333333333338F8F3
                000033333333333333A3333333333333333383330000}
              NumGlyphs = 2
            end
          end
        end
      end
      object pnLinhas: TPanel
        Left = 2
        Top = 312
        Width = 574
        Height = 201
        BevelWidth = 2
        TabOrder = 1
        object Label6: TLabel
          Left = 8
          Top = 9
          Width = 237
          Height = 19
          Caption = 'Valor das Linhas na Tabela'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
        end
        object btnSairLinha: TBitBtn
          Left = 516
          Top = 8
          Width = 49
          Height = 24
          Cancel = True
          TabOrder = 0
          OnClick = btnSairLinhaClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333333333000033338833333333333333333F333333333333
            0000333911833333983333333388F333333F3333000033391118333911833333
            38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
            911118111118333338F3338F833338F3000033333911111111833333338F3338
            3333F8330000333333911111183333333338F333333F83330000333333311111
            8333333333338F3333383333000033333339111183333333333338F333833333
            00003333339111118333333333333833338F3333000033333911181118333333
            33338333338F333300003333911183911183333333383338F338F33300003333
            9118333911183333338F33838F338F33000033333913333391113333338FF833
            38F338F300003333333333333919333333388333338FFF830000333333333333
            3333333333333333333888330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
        object GrdDet2: TStringGrid
          Left = 7
          Top = 36
          Width = 555
          Height = 157
          ColCount = 1
          DefaultColWidth = 80
          DefaultRowHeight = 16
          FixedCols = 0
          RowCount = 2
          TabOrder = 1
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 590
  end
  inherited Dock971: TDock97
    Top = 412
    Width = 590
    inherited tb97Fundo: TToolbar97
      Left = 418
      DockPos = 421
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 249
      DockPos = 252
    end
    inherited dbnav: TDBNavigator
      Left = 116
      Hints.Strings = ()
      OnClick = dbnavClick
    end
    object BitBtnExportar: TBitBtn
      Left = 4
      Top = 2
      Width = 101
      Height = 33
      Caption = '&Exportar'
      TabOrder = 3
      OnClick = BitBtnExportarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 262
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    OnStateChange = nil
    Left = 452
    Top = 172
  end
  inherited ds: TwwDataSource
    DataSet = qryPrinc
    OnStateChange = dsStateChange
    OnDataChange = dsDataChange
    Left = 286
    Top = 13
  end
  inherited ImlPadrao: TImageList
    Left = 232
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 394
    Top = 12
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 424
    Top = 12
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 292
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 345
    Top = 172
  end
  object qryPrinc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT'
      '  T.CODTABELA, T.DESCRICAO, T.IDMODULO, T.IDPESSOA,'
      '  TU.FLGEXCLUIR, TU.FLGALTERAR, TU.FLGPROCURAR'
      'FROM'
      '  CM.TABGENER T, TABGENERUSUARIO TU'
      'WHERE'
      '  T.CODTABELA  = TU.CODTABELA AND'
      '  TU.FLGPROCURAR = 1 AND'
      '  TU.IDUSUARIO = :IDUSUARIO')
    UpdateObject = UpdPrinc
    ValidateWithMask = True
    Left = 256
    Top = 13
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end>
    object qryPrincCODTABELA: TStringField
      FieldName = 'CODTABELA'
      Origin = 'TABGENER.CODTABELA'
      Size = 15
    end
    object qryPrincDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TABGENER.DESCRICAO'
      Size = 60
    end
    object qryPrincFLGEXCLUIR: TFloatField
      FieldName = 'FLGEXCLUIR'
      Origin = 'BASEDADOS.TABGENERUSUARIO.FLGEXCLUIR'
    end
    object qryPrincFLGALTERAR: TFloatField
      FieldName = 'FLGALTERAR'
      Origin = 'BASEDADOS.TABGENERUSUARIO.FLGALTERAR'
    end
    object qryPrincFLGPROCURAR: TFloatField
      FieldName = 'FLGPROCURAR'
      Origin = 'BASEDADOS.TABGENERUSUARIO.FLGPROCURAR'
    end
    object qryPrincIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'BASEDADOS.TABGENER.IDMODULO'
    end
    object qryPrincIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.TABGENER.IDPESSOA'
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 332
    Top = 55
  end
  object qrySelect: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 287
    Top = 172
  end
  object qryTpDado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *    FROM TIPODADO'
      'ORDER BY NOMETIPODADO')
    ValidateWithMask = True
    Left = 216
    Top = 172
  end
  object dsSelect: TwwDataSource
    DataSet = qrySelect
    Left = 316
    Top = 172
  end
  object dsTpDad: TwwDataSource
    DataSet = qryTpDado
    Left = 245
    Top = 172
  end
  object dsDet2: TwwDataSource
    AutoEdit = False
    DataSet = qryDet2
    Left = 512
    Top = 172
  end
  object dsAux: TwwDataSource
    AutoEdit = False
    DataSet = qryAux
    Left = 360
    Top = 55
  end
  object qryLinhas: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 378
    Top = 172
  end
  object qryDet: TwwQuery
    BeforeInsert = qryDetBeforeInsert
    AfterInsert = qryDetAfterInsert
    BeforeEdit = qryDetBeforeEdit
    BeforeDelete = qryDetBeforeDelete
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    DataSource = ds
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      '  CODTABELA,'
      '  CODCAMPO,'
      '  IDTIPODADO,'
      '  DESCRICAO'
      'FROM'
      '  CM.CAMPOTABGENER'
      'WHERE'
      '  CODTABELA = :CODTABELA'
      '')
    ValidateWithMask = True
    Left = 424
    Top = 172
    ParamData = <
      item
        DataType = ftString
        Name = 'CODTABELA'
        ParamType = ptUnknown
      end>
  end
  object qryDet2: TwwQuery
    AfterInsert = qryDet2AfterInsert
    AfterScroll = qryDet2AfterScroll
    DatabaseName = 'BaseDados'
    DataSource = dsDet
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      '  VAL.CODTABELA, VAL.NUMLINHA, VAL.CODCAMPO, VAL.VALOR'
      'FROM'
      '  CM.VALTABGENER VAL'
      'WHERE'
      '  VAL.CODTABELA = :CODTABELA AND'
      '  VAL.CODCAMPO  = :CODCAMPO')
    ValidateWithMask = True
    Left = 483
    Top = 172
    ParamData = <
      item
        DataType = ftString
        Name = 'CODTABELA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCAMPO'
        ParamType = ptUnknown
      end>
  end
  object QryRegras: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM REGRATABGENER'
      'WHERE CODTABELA= :VCOD'
      'ORDER BY ORDEM')
    ValidateWithMask = True
    Left = 493
    Top = 55
    ParamData = <
      item
        DataType = ftString
        Name = 'VCOD'
        ParamType = ptUnknown
      end>
  end
  object QueryIn: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 461
    Top = 55
  end
  object QryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 393
    Top = 55
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'TABGENER.CODTABELA'
      'TABGENER.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Codigo'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TABGENER'
      'TABGENERUSUARIO')
    CamposChave.Strings = (
      'TABGENER.CODTABELA')
    Filtro.Strings = (
      'TABGENERUSUARIO.FLGPROCURAR = 1'
      'TABGENERUSUARIO.CODTABELA = TABGENER.CODTABELA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 333
    Top = 12
  end
  object Sd: TSaveDialog
    DefaultExt = '*.txt'
    Filter = 'Arquivo Texto|*.Txt'
    InitialDir = 'c:\'
    Title = 'Exportação de dados'
    Left = 363
    Top = 12
  end
  object QryValores: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 332
    Top = 87
  end
  object UpdPrinc: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.TABGENER'
      'set'
      '  CODTABELA = :CODTABELA,'
      '  DESCRICAO = :DESCRICAO,'
      '  IDMODULO =  :IDMODULO,'
      '  IDPESSOA = :IDPESSOA'
      ''
      'where'
      '  CODTABELA = :OLD_CODTABELA and'
      '  DESCRICAO = :OLD_DESCRICAO')
    InsertSQL.Strings = (
      'insert into CM.TABGENER'
      '  (CODTABELA, DESCRICAO,IDMODULO, IDPESSOA)'
      'values'
      '  (:CODTABELA, :DESCRICAO,:IDMODULO, :IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from CM.TABGENER'
      'where'
      '  CODTABELA = :OLD_CODTABELA and'
      '  DESCRICAO = :OLD_DESCRICAO')
    Left = 226
    Top = 13
  end
  object QryPermissao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDGRUPOREGRA, IDUSUARIO, FLGINSERIR, FLGALTERAR,'
      '      FLGEXCLUIR, FLGPROCURAR'
      'FROM'
      '    GRUPOREGRAUSUARIO'
      'WHERE'
      '     (IDGRUPOREGRA = :GRUPO) AND (IDUSUARIO = :USUARIO)'
      ''
      '')
    ValidateWithMask = True
    Left = 459
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'USUARIO'
        ParamType = ptUnknown
      end>
  end
end
