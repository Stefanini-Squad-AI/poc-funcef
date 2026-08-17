inherited FrmGrupoBiometrica: TFrmGrupoBiometrica
  Left = 251
  Top = 77
  Caption = 'Visualizar Tabelas Biométricas'
  ClientHeight = 434
  ClientWidth = 450
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 450
    Height = 348
    object Label1: TLabel
      Left = 23
      Top = 33
      Width = 123
      Height = 13
      Caption = 'Descrição da Tabela '
      FocusControl = DBEdit1
    end
    object Label6: TLabel
      Left = 332
      Top = 9
      Width = 101
      Height = 13
      Caption = 'Código da Tabela'
      FocusControl = DBEdit3
    end
    object PgCtrlDetalhe: TPageControl
      Left = 5
      Top = 80
      Width = 440
      Height = 263
      ActivePage = tbshDetalhe
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object tbshDetalhe: TTabSheet
        Caption = 'Tabela Biométrica - Valores'
        object DbGrdDet: TwwDBGrid
          Left = 8
          Top = 34
          Width = 489
          Height = 222
          Selected.Strings = (
            'IDADE'#9'10'#9'IDADE'#9'No'
            'V1'#9'10'#9'V1'#9'No'
            'V2'#9'10'#9'V2'#9'No'
            'V3'#9'10'#9'V3'#9'No'
            'V4'#9'10'#9'V4'#9'No'
            'V5'#9'10'#9'V5'#9'No'
            'V6'#9'10'#9'V6'#9'No'
            'V7'#9'10'#9'V7'#9'No'
            'V8'#9'10'#9'V8'#9'No'
            'V9'#9'10'#9'V9'#9'No'
            'V10'#9'10'#9'V10'#9'No'
            'V11'#9'10'#9'V11'#9'No'
            'V12'#9'10'#9'V12'#9'No'
            'V13'#9'10'#9'V13'#9'No'
            'V14'#9'10'#9'V14'#9'No'
            'V15'#9'10'#9'V15'#9'No'
            'V16'#9'10'#9'V16'#9'No'
            'V17'#9'10'#9'V17'#9'No'
            'V18'#9'10'#9'V18'#9'No'
            'V19'#9'10'#9'V19'#9'No'
            'V20'#9'10'#9'V20'#9'No'
            'V21'#9'10'#9'V21'#9'No'
            'V22'#9'10'#9'V22'#9'No'
            'V23'#9'10'#9'V23'#9'No'
            'V24'#9'10'#9'V24'#9'No'
            'V25'#9'10'#9'V25'#9'No'
            'V26'#9'10'#9'V26'#9'No'
            'V27'#9'10'#9'V27'#9'No'
            'V28'#9'10'#9'V28'#9'No'
            'V29'#9'10'#9'V29'#9'No'
            'V30'#9'10'#9'V30'#9'No'
            'V31'#9'10'#9'V31'#9'No'
            'V32'#9'10'#9'V32'#9'No'
            'V33'#9'10'#9'V33'#9'No'
            'V34'#9'10'#9'V34'#9'No'
            'V35'#9'10'#9'V35'#9'No'
            'V36'#9'10'#9'V36'#9'No'
            'V37'#9'10'#9'V37'#9'No'
            'V38'#9'10'#9'V38'#9'No'
            'V39'#9'10'#9'V39'#9'No'
            'V40'#9'10'#9'V40'#9'No'
            'V41'#9'10'#9'V41'#9'No'
            'V42'#9'10'#9'V42'#9'No'
            'V43'#9'10'#9'V43'#9'No'
            'V44'#9'10'#9'V44'#9'No'
            'V45'#9'10'#9'V45'#9'No'
            'V46'#9'10'#9'V46'#9'No'
            'V47'#9'10'#9'V47'#9'No'
            'V48'#9'10'#9'V48'#9'No'
            'V49'#9'10'#9'V49'#9'No'
            'V50'#9'10'#9'V50'#9'No'
            'V51'#9'10'#9'V51'#9'No'
            'V52'#9'10'#9'V52'#9'No'
            'V53'#9'10'#9'V53'#9'No'
            'V54'#9'10'#9'V54'#9'No'
            'V55'#9'10'#9'V55'#9'No'
            'V56'#9'10'#9'V56'#9'No'
            'V57'#9'10'#9'V57'#9'No'
            'V58'#9'10'#9'V58'#9'No'
            'V59'#9'10'#9'V59'#9'No'
            'V60'#9'10'#9'V60'#9'No'
            'V61'#9'10'#9'V61'#9'No'
            'V62'#9'10'#9'V62'#9'No'
            'V63'#9'10'#9'V63'#9'No'
            'V64'#9'10'#9'V64'#9'No'
            'V65'#9'10'#9'V65'#9'No'
            'V66'#9'10'#9'V66'#9'No'
            'V67'#9'10'#9'V67'#9'No'
            'V68'#9'10'#9'V68'#9'No'
            'V69'#9'10'#9'V69'#9'No'
            'V70'#9'10'#9'V70'#9'No'
            'V71'#9'10'#9'V71'#9'No'
            'V72'#9'10'#9'V72'#9'No'
            'V73'#9'10'#9'V73'#9'No'
            'V74'#9'10'#9'V74'#9'No'
            'V75'#9'10'#9'V75'#9'No'
            'V76'#9'10'#9'V76'#9'No'
            'V77'#9'10'#9'V77'#9'No'
            'V78'#9'10'#9'V78'#9'No'
            'V79'#9'10'#9'V79'#9'No'
            'V80'#9'10'#9'V80'#9'No'
            'V81'#9'10'#9'V81'#9'No'
            'V82'#9'10'#9'V82'#9'No'
            'V83'#9'10'#9'V83'#9'No'
            'V84'#9'10'#9'V84'#9'No'
            'V85'#9'10'#9'V85'#9'No'
            'V86'#9'10'#9'V86'#9'No'
            'V87'#9'10'#9'V87'#9'No'
            'V88'#9'10'#9'V88'#9'No'
            'V89'#9'10'#9'V89'#9'No'
            'V90'#9'10'#9'V90'#9'No'
            'V91'#9'10'#9'V91'#9'No'
            'V92'#9'10'#9'V92'#9'No'
            'V93'#9'10'#9'V93'#9'No'
            'V94'#9'10'#9'V94'#9'No'
            'V95'#9'10'#9'V95'#9'No'
            'V96'#9'10'#9'V96'#9'No'
            'V97'#9'10'#9'V97'#9'No'
            'V98'#9'10'#9'V98'#9'No'
            'V99'#9'10'#9'V99'#9'No'
            'V100'#9'10'#9'V100'#9'No')
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = DsDet
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 2
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnDblClick = DbGrdDetDblClick
          IndicatorColor = icBlack
        end
        object PnlDetalhe: TPanel
          Left = 0
          Top = 13
          Width = 432
          Height = 222
          Align = alBottom
          TabOrder = 1
          object Label3: TLabel
            Left = 12
            Top = 10
            Width = 118
            Height = 13
            Caption = 'Descrição do Grupo '
            FocusControl = DBEdit1
          end
          object Label4: TLabel
            Left = 44
            Top = 91
            Width = 158
            Height = 13
            Caption = 'Nome do índice ou anuidae'
          end
          object Label7: TLabel
            Left = 282
            Top = 68
            Width = 101
            Height = 13
            Caption = 'Código da Tabela'
            FocusControl = DBEdit4
          end
          object Label8: TLabel
            Left = 44
            Top = 135
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object DBEdit2: TDBEdit
            Left = 44
            Top = 105
            Width = 337
            Height = 21
            AutoSelect = False
            DataSource = DsDet
            TabOrder = 1
          end
          object bbtnOkDet: TBitBtn
            Left = 243
            Top = 190
            Width = 81
            Height = 27
            Caption = '&OK'
            Default = True
            TabOrder = 3
            OnClick = bbtnOkDetClick
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
          object bbtnCancelarDet: TBitBtn
            Left = 327
            Top = 190
            Width = 81
            Height = 27
            Cancel = True
            Caption = '&Cancelar'
            TabOrder = 4
            OnClick = bbtnCancelarDetClick
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
          object DBEdit4: TDBEdit
            Left = 282
            Top = 82
            Width = 99
            Height = 21
            DataSource = DsDet
            TabOrder = 0
          end
          object DBEdit5: TDBEdit
            Left = 44
            Top = 148
            Width = 167
            Height = 21
            DataSource = DsDet
            TabOrder = 2
            OnKeyPress = DBEdit5KeyPress
          end
        end
        object pnlBarraDetalhe: TPanel
          Left = 0
          Top = 0
          Width = 432
          Height = 34
          Align = alTop
          TabOrder = 0
          object BtProc: TSpeedButton
            Left = 56
            Top = 4
            Width = 25
            Height = 25
            Hint = 'Procurar por registro|'
            AllowAllUp = True
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
            Visible = False
            OnClick = BtProcClick
          end
          object BtExcl: TSpeedButton
            Left = 81
            Top = 4
            Width = 25
            Height = 25
            Hint = 'Remover o registro selecionado|'
            AllowAllUp = True
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
            Visible = False
            OnClick = BtExclClick
          end
          object btAlt: TSpeedButton
            Left = 31
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
            Visible = False
            OnClick = btAltClick
          end
          object BtIns: TSpeedButton
            Left = 6
            Top = 4
            Width = 25
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
            Visible = False
            OnClick = BtInsClick
          end
        end
      end
    end
    object DBEdit1: TDBEdit
      Left = 23
      Top = 48
      Width = 405
      Height = 21
      AutoSelect = False
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 344
      Top = 24
      Width = 84
      Height = 21
      Color = clSilver
      DataField = 'IDTABELA'
      DataSource = ds
      Enabled = False
      ReadOnly = True
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 395
    Width = 450
    inherited tb97Fundo: TToolbar97
      Left = 260
      DockPos = 260
      inherited sep1: TToolbarSep97
        Left = 163
      end
      inherited sep3: TToolbarSep97
        Left = 80
      end
    end
    inherited dbnav: TDBNavigator [1]
      Width = 168
      DataSource = DsDet
      Hints.Strings = (
        'Primeiro registro'
        'Próximo registro'
        'Registro anterior'
        'Último registro'
        'Insere registro'
        'Apaga registro'
        'Edita registro'
        'Confirma modificação'
        'Cancela  modificação ')
      ParentShowHint = False
      ShowHint = True
      OnClick = dbnavClick
    end
    inherited TB97oKCancelar: TToolbar97 [2]
      Left = 92
      DockPos = 92
    end
  end
  inherited Dock972: TDock97
    Width = 450
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited ds: TwwDataSource
    DataSet = QryPrincipal
    Left = 284
    Top = 57
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 398
    Top = 3
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Caption = 'Pesquisa no Arquivo '
    DataSet = QryPrincipal
    Left = 350
    Top = 3
  end
  object QryPrincipal: TwwQuery
    BeforePost = QryPrincipalBeforePost
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT  IDTABELA,DESCRICAO'
      'FROM CM.TABBIO'
      'ORDER BY IDTABELA')
    ValidateWithMask = True
    Left = 246
    Top = 57
    object QryPrincipalIDTABELA: TFloatField
      FieldName = 'IDTABELA'
      Origin = 'TABBIO.IDTABELA'
    end
    object QryPrincipalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TABBIO.DESCRICAO'
      Size = 60
    end
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 396
    Top = 113
  end
  object QryDetalhe: TwwQuery
    BeforePost = QryDetalheBeforePost
    DatabaseName = 'BaseDados'
    DataSource = ds
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM CM.VALTABBIO '
      'WHERE IDTABELA = :IDTABELA'
      'ORDER BY IDADE'
      '                '
      '                     '
      '                               '
      '                              '
      '                            '
      '                              ')
    Params.Data = {01000100084944544142454C4100030400000000000100}
    ValidateWithMask = True
    Left = 318
    Top = 272
    object QryDetalheIDADE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDADE'
      Origin = 'VALTABBIO.IDADE'
    end
    object QryDetalheV1: TFloatField
      DisplayWidth = 10
      FieldName = 'V1'
      Origin = 'VALTABBIO.V1'
    end
    object QryDetalheV2: TFloatField
      DisplayWidth = 10
      FieldName = 'V2'
      Origin = 'VALTABBIO.V2'
    end
    object QryDetalheV3: TFloatField
      DisplayWidth = 10
      FieldName = 'V3'
      Origin = 'VALTABBIO.V3'
    end
    object QryDetalheV4: TFloatField
      DisplayWidth = 10
      FieldName = 'V4'
      Origin = 'VALTABBIO.V4'
    end
    object QryDetalheV5: TFloatField
      DisplayWidth = 10
      FieldName = 'V5'
      Origin = 'VALTABBIO.V5'
    end
    object QryDetalheV6: TFloatField
      DisplayWidth = 10
      FieldName = 'V6'
      Origin = 'VALTABBIO.V6'
    end
    object QryDetalheV7: TFloatField
      DisplayWidth = 10
      FieldName = 'V7'
      Origin = 'VALTABBIO.V7'
    end
    object QryDetalheV8: TFloatField
      DisplayWidth = 10
      FieldName = 'V8'
      Origin = 'VALTABBIO.V8'
    end
    object QryDetalheV9: TFloatField
      DisplayWidth = 10
      FieldName = 'V9'
      Origin = 'VALTABBIO.V9'
    end
    object QryDetalheV10: TFloatField
      DisplayWidth = 10
      FieldName = 'V10'
      Origin = 'VALTABBIO.V10'
    end
    object QryDetalheV11: TFloatField
      DisplayWidth = 10
      FieldName = 'V11'
      Origin = 'VALTABBIO.V11'
    end
    object QryDetalheV12: TFloatField
      DisplayWidth = 10
      FieldName = 'V12'
      Origin = 'VALTABBIO.V12'
    end
    object QryDetalheV13: TFloatField
      DisplayWidth = 10
      FieldName = 'V13'
      Origin = 'VALTABBIO.V13'
    end
    object QryDetalheV14: TFloatField
      DisplayWidth = 10
      FieldName = 'V14'
      Origin = 'VALTABBIO.V14'
    end
    object QryDetalheV15: TFloatField
      DisplayWidth = 10
      FieldName = 'V15'
      Origin = 'VALTABBIO.V15'
    end
    object QryDetalheV16: TFloatField
      DisplayWidth = 10
      FieldName = 'V16'
      Origin = 'VALTABBIO.V16'
    end
    object QryDetalheV17: TFloatField
      DisplayWidth = 10
      FieldName = 'V17'
      Origin = 'VALTABBIO.V17'
    end
    object QryDetalheV18: TFloatField
      DisplayWidth = 10
      FieldName = 'V18'
      Origin = 'VALTABBIO.V18'
    end
    object QryDetalheV19: TFloatField
      DisplayWidth = 10
      FieldName = 'V19'
      Origin = 'VALTABBIO.V19'
    end
    object QryDetalheV20: TFloatField
      DisplayWidth = 10
      FieldName = 'V20'
      Origin = 'VALTABBIO.V20'
    end
    object QryDetalheV21: TFloatField
      DisplayWidth = 10
      FieldName = 'V21'
      Origin = 'VALTABBIO.V21'
    end
    object QryDetalheV22: TFloatField
      DisplayWidth = 10
      FieldName = 'V22'
      Origin = 'VALTABBIO.V22'
    end
    object QryDetalheV23: TFloatField
      DisplayWidth = 10
      FieldName = 'V23'
      Origin = 'VALTABBIO.V23'
    end
    object QryDetalheV24: TFloatField
      DisplayWidth = 10
      FieldName = 'V24'
      Origin = 'VALTABBIO.V24'
    end
    object QryDetalheV25: TFloatField
      DisplayWidth = 10
      FieldName = 'V25'
      Origin = 'VALTABBIO.V25'
    end
    object QryDetalheV26: TFloatField
      DisplayWidth = 10
      FieldName = 'V26'
      Origin = 'VALTABBIO.V26'
    end
    object QryDetalheV27: TFloatField
      DisplayWidth = 10
      FieldName = 'V27'
      Origin = 'VALTABBIO.V27'
    end
    object QryDetalheV28: TFloatField
      DisplayWidth = 10
      FieldName = 'V28'
      Origin = 'VALTABBIO.V28'
    end
    object QryDetalheV29: TFloatField
      DisplayWidth = 10
      FieldName = 'V29'
      Origin = 'VALTABBIO.V29'
    end
    object QryDetalheV30: TFloatField
      DisplayWidth = 10
      FieldName = 'V30'
      Origin = 'VALTABBIO.V30'
    end
    object QryDetalheV31: TFloatField
      DisplayWidth = 10
      FieldName = 'V31'
      Origin = 'VALTABBIO.V31'
    end
    object QryDetalheV32: TFloatField
      DisplayWidth = 10
      FieldName = 'V32'
      Origin = 'VALTABBIO.V32'
    end
    object QryDetalheV33: TFloatField
      DisplayWidth = 10
      FieldName = 'V33'
      Origin = 'VALTABBIO.V33'
    end
    object QryDetalheV34: TFloatField
      DisplayWidth = 10
      FieldName = 'V34'
      Origin = 'VALTABBIO.V34'
    end
    object QryDetalheV35: TFloatField
      DisplayWidth = 10
      FieldName = 'V35'
      Origin = 'VALTABBIO.V35'
    end
    object QryDetalheV36: TFloatField
      DisplayWidth = 10
      FieldName = 'V36'
      Origin = 'VALTABBIO.V36'
    end
    object QryDetalheV37: TFloatField
      DisplayWidth = 10
      FieldName = 'V37'
      Origin = 'VALTABBIO.V37'
    end
    object QryDetalheV38: TFloatField
      DisplayWidth = 10
      FieldName = 'V38'
      Origin = 'VALTABBIO.V38'
    end
    object QryDetalheV39: TFloatField
      DisplayWidth = 10
      FieldName = 'V39'
      Origin = 'VALTABBIO.V39'
    end
    object QryDetalheV40: TFloatField
      DisplayWidth = 10
      FieldName = 'V40'
      Origin = 'VALTABBIO.V40'
    end
    object QryDetalheV41: TFloatField
      DisplayWidth = 10
      FieldName = 'V41'
      Origin = 'VALTABBIO.V41'
    end
    object QryDetalheV42: TFloatField
      DisplayWidth = 10
      FieldName = 'V42'
      Origin = 'VALTABBIO.V42'
    end
    object QryDetalheV43: TFloatField
      DisplayWidth = 10
      FieldName = 'V43'
      Origin = 'VALTABBIO.V43'
    end
    object QryDetalheV44: TFloatField
      DisplayWidth = 10
      FieldName = 'V44'
      Origin = 'VALTABBIO.V44'
    end
    object QryDetalheV45: TFloatField
      DisplayWidth = 10
      FieldName = 'V45'
      Origin = 'VALTABBIO.V45'
    end
    object QryDetalheV46: TFloatField
      DisplayWidth = 10
      FieldName = 'V46'
      Origin = 'VALTABBIO.V46'
    end
    object QryDetalheV47: TFloatField
      DisplayWidth = 10
      FieldName = 'V47'
      Origin = 'VALTABBIO.V47'
    end
    object QryDetalheV48: TFloatField
      DisplayWidth = 10
      FieldName = 'V48'
      Origin = 'VALTABBIO.V48'
    end
    object QryDetalheV49: TFloatField
      DisplayWidth = 10
      FieldName = 'V49'
      Origin = 'VALTABBIO.V49'
    end
    object QryDetalheV50: TFloatField
      DisplayWidth = 10
      FieldName = 'V50'
      Origin = 'VALTABBIO.V50'
    end
    object QryDetalheV51: TFloatField
      DisplayWidth = 10
      FieldName = 'V51'
      Origin = 'VALTABBIO.V51'
    end
    object QryDetalheV52: TFloatField
      DisplayWidth = 10
      FieldName = 'V52'
      Origin = 'VALTABBIO.V52'
    end
    object QryDetalheV53: TFloatField
      DisplayWidth = 10
      FieldName = 'V53'
      Origin = 'VALTABBIO.V53'
    end
    object QryDetalheV54: TFloatField
      DisplayWidth = 10
      FieldName = 'V54'
      Origin = 'VALTABBIO.V54'
    end
    object QryDetalheV55: TFloatField
      DisplayWidth = 10
      FieldName = 'V55'
      Origin = 'VALTABBIO.V55'
    end
    object QryDetalheV56: TFloatField
      DisplayWidth = 10
      FieldName = 'V56'
      Origin = 'VALTABBIO.V56'
    end
    object QryDetalheV57: TFloatField
      DisplayWidth = 10
      FieldName = 'V57'
      Origin = 'VALTABBIO.V57'
    end
    object QryDetalheV58: TFloatField
      DisplayWidth = 10
      FieldName = 'V58'
      Origin = 'VALTABBIO.V58'
    end
    object QryDetalheV59: TFloatField
      DisplayWidth = 10
      FieldName = 'V59'
      Origin = 'VALTABBIO.V59'
    end
    object QryDetalheV60: TFloatField
      DisplayWidth = 10
      FieldName = 'V60'
      Origin = 'VALTABBIO.V60'
    end
    object QryDetalheIDTABELA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTABELA'
      Origin = 'VALTABBIO.IDTABELA'
      Visible = False
    end
  end
  object DsDet: TwwDataSource
    AutoEdit = False
    DataSet = QryDetalhe
    Left = 374
    Top = 272
  end
  object DsAuxiliar: TwwDataSource
    DataSet = QryAuxiliar
    Left = 390
    Top = 167
  end
  object QryAuxiliar: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 344
    Top = 167
  end
  object QueryCampo: TwwQuery
    DatabaseName = 'basedados'
    DataSource = ds
    SQL.Strings = (
      'SELECT * FROM CM.CAMPOTABBIO'
      'WHERE IDTABELA =  :IDTABELA')
    Params.Data = {01000100084944544142454C410006080000000000000000000100}
    ValidateWithMask = True
    Left = 168
    Top = 55
  end
end
