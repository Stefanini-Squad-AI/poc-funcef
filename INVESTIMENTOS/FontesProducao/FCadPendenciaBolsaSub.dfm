inherited frmPendenciaBolsaSub: TfrmPendenciaBolsaSub
  Left = 2
  Top = 34
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Liquidação de Subscrição'
  ClientHeight = 446
  ClientWidth = 784
  FormStyle = fsNormal
  KeyPreview = True
  Visible = False
  OnKeyDown = FormKeyDown
  OnPaint = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 783
    Height = 404
    Align = alNone
    object Panel2: TPanel
      Left = 5
      Top = 54
      Width = 773
      Height = 285
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Panel6: TPanel
        Left = 1
        Top = 34
        Width = 771
        Height = 21
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'Operações'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object DBGrid1: TwwDBGrid
        Left = 1
        Top = 56
        Width = 771
        Height = 225
        Selected.Strings = (
          'SGLBOLSAVALORES'#9'21'#9'Bolsa'
          'DESCINVESTIMENTO'#9'25'#9'Investimento'
          'CODTIPOACAO'#9'8'#9'Tipo '
          'DATAVENCOPER'#9'10'#9'Liquidação'
          'VLROPERACAO'#9'25'#9'Valor da Operação')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 3
        ShowHorzScrollBar = True
        EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
        Color = clSilver
        DataSource = DsConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
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
        OnEnter = DBGrid1Enter
        OnExit = DBGrid1Exit
        OnKeyDown = DBGrid1KeyDown
        OnKeyUp = DBGrid1KeyUp
        IndicatorColor = icYellow
      end
      object Dock977: TDock97
        Left = 1
        Top = 1
        Width = 771
        Height = 33
        AllowDrag = False
        BoundLines = [blTop, blBottom, blLeft, blRight]
        object Toolbar974: TToolbar97
          Left = 0
          Top = 0
          Caption = 'tb97BotoesDetalhe'
          DockPos = 0
          TabOrder = 0
          object BtAltDet: TSpeedButton
            Left = 0
            Top = 1
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
            OnClick = BtAltDetClick
          end
          object BtDelDet: TSpeedButton
            Left = 25
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
        object Toolbar971: TToolbar97
          Left = 202
          Top = 0
          Caption = 'tb97Fundo'
          Color = clNone
          CloseButton = False
          DefaultDock = Dock971
          DockPos = 202
          TabOrder = 1
          object ToolbarSep971: TToolbarSep97
            Left = 264
            Top = 0
            Blank = True
            SizeHorz = 2
          end
          object BtOkDet: TBitBtn
            Left = 0
            Top = 0
            Width = 87
            Height = 27
            Caption = '&Confirmar'
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
          object BtVoltaDet: TBitBtn
            Left = 177
            Top = 0
            Width = 87
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
          object BtCancDet: TBitBtn
            Left = 87
            Top = 0
            Width = 90
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
        end
      end
    end
    object Panel3: TPanel
      Left = 5
      Top = 342
      Width = 773
      Height = 57
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 1
      object Panel7: TPanel
        Left = 375
        Top = 2
        Width = 396
        Height = 26
        BevelInner = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Panel9: TPanel
        Left = 375
        Top = 27
        Width = 396
        Height = 26
        BevelInner = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object ProgressBar1: TProgressBar
          Left = 2
          Top = 2
          Width = 393
          Height = 22
          Min = 0
          Max = 100
          TabOrder = 0
        end
      end
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 773
      Height = 49
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 2
      object Label2: TLabel
        Left = 12
        Top = 5
        Width = 105
        Height = 13
        Caption = 'Data de Operação'
      end
      object Label3: TLabel
        Left = 146
        Top = 5
        Width = 112
        Height = 13
        Caption = 'Data de Liquidação'
      end
      object dbDtaOperacao: TCMDateTimePicker
        Left = 12
        Top = 20
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
        OnChange = dbDtaOperacaoChange
      end
      object dblLiquidacao: TwwDBLookupCombo
        Left = 146
        Top = 20
        Width = 168
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DATAVENCOPER'#9'10'#9'Data')
        LookupTable = QryLiquidacao
        LookupField = 'DATAVENCOPER'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnChange = dblLiquidacaoChange
      end
    end
  end
  inherited Dock971: TDock97
    Top = 407
    Width = 784
    inherited tb97Fundo: TToolbar97
      Left = 296
      DockPos = 296
      inherited sep1: TToolbarSep97
        Left = 241
      end
      inherited bbtnSair: TBitBtn
        Left = 161
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 243
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        Enabled = False
        TabOrder = 2
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnCancelar: TBitBtn
        Left = 80
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Cancelar'
        Enabled = False
        TabOrder = 3
        OnClick = bbtnCancelarClick
        Kind = bkCancel
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 117
    Top = 195
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object DsConsulta: TwwDataSource
    AutoEdit = False
    DataSet = QryConsulta
    Left = 101
    Top = 67
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 357
    Top = 137
  end
  object QryBuscaDespesa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'IDTIPODESPINVEST, MOECODIGO, DESCTIPODESPINV, '
      #9'NATUREZAOPERACAO'
      ''
      'FROM CM.TIPODESPINVEST')
    ValidateWithMask = True
    Left = 597
    Top = 137
    object QryBuscaDespesaIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'TIPODESPINVEST.IDTIPODESPINVEST'
    end
    object QryBuscaDespesaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'TIPODESPINVEST.MOECODIGO'
    end
    object QryBuscaDespesaDESCTIPODESPINV: TStringField
      FieldName = 'DESCTIPODESPINV'
      Origin = 'TIPODESPINVEST.DESCTIPODESPINV'
      Size = 60
    end
    object QryBuscaDespesaNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'TIPODESPINVEST.NATUREZAOPERACAO'
      Size = 1
    end
  end
  object QryBuscaCredor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PS.IDPESSOA, PS.RAZAOSOCIAL'
      ''
      'FROM PESSOA PS, EMPRESAFORN EF '
      ''
      'WHERE PS.IDPESSOA  = EF.IDFORCLI '
      ''
      'ORDER BY PS.RAZAOSOCIAL')
    ValidateWithMask = True
    Left = 597
    Top = 65
    object QryBuscaCredorIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.PESSOA".IDPESSOA'
    end
    object QryBuscaCredorRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = '"CM.PESSOA".RAZAOSOCIAL'
      Size = 60
    end
  end
  object UpdDespesas: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.DESPOPERINVEST'
      'set'
      '  IDFORCLI = :IDFORCLI,'
      '  VLRDESPOPER = :VLRDESPOPER,'
      '  DATAVENCDESPOPER = :DATAVENCDESPOPER'
      'where'
      '  IDDESPOPERINVEST = :OLD_IDDESPOPERINVEST')
    InsertSQL.Strings = (
      'SELECT * FROM DESPOPERINVEST'
      'WHERE 1=2'
      ''
      '')
    DeleteSQL.Strings = (
      'SELECT * FROM DESPOPERINVEST'
      'WHERE 1=2'
      ''
      '')
    Left = 508
    Top = 139
  end
  object QryDespesasOperacao: TwwQuery
    CachedUpdates = True
    AfterInsert = QryDespesasOperacaoAfterInsert
    BeforePost = QryDespesasOperacaoBeforePost
    AfterPost = QryDespesasOperacaoAfterPost
    OnUpdateError = QryDespesasOperacaoUpdateError
    DatabaseName = 'BaseDados'
    DataSource = DsFinalizar
    SQL.Strings = (
      
        'SELECT '#9'DOP.IDDESPOPERINVEST, DOP.IDFORCLI,       DOP.IDOPERACAO' +
        'INVEST,'
      
        '         DOP.IDTIPOINVEST,     DOP.IDTIPOOPERACAO, NVL(DOP.VLRDE' +
        'SPOPER,0) AS VLRDESPOPER,'
      '         OI.DATAOPERACAO,      PE.NOME,'
      
        #9'      DOP.IDTIPODESPINVEST, DOP.DATAVENCDESPOPER, DOP.IDREGRACA' +
        'LCUSADA,'
      
        #9'      DOP.IDREGRAVENCUSADA, OI.NUMDOCUMENTO,      OI.IDINVESTIM' +
        'ENTO,'
      
        #9'      OI.IDCARTEIRAINVEST,  OI.VLROPERACAO,       OI.QTDEOPERAC' +
        'AO, OI.MOECODIGO, OI.IDLOTE,'
      
        #9'      DECODE(DOP.FLGCALCDIARIO,0, '#39'N'#39', '#39'S'#39') AS FLGCALCDIARIO, T' +
        'P.DESCTIPOOPERACAO,'
      
        #9'      IV.DESCINVESTIMENTO, TP.NATUREZAOPERACAO, TD.DESCTIPODESP' +
        'INV,'
      #9'      CONCAT(TR.CODTIPRENFIXA, AC.CODTIPOACAO) AS TIPOTITULO'
      ''
      'FROM '#9'CM.DESPOPERINVEST DOP, CM.OPERACAOINVEST OI,'
      #9'      CM.TIPOOPERACAO TP,    CM.INVESTIMENTO IV,   CM.ACAO AC,'
      #9'      CM.TITRENFIXA TR,      CM.TIPODESPINVEST TD, CM.PESSOA PE'
      ''
      'WHERE '#9'(DOP.IDOPERACAOINVEST = :IDOPERACAOINVEST)   AND'
      #9'      (DOP.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND'
      #9'      (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST) AND'
      #9'      (DOP.IDFORCLI         = PE.IDPESSOA)         AND'
      #9'      (OI.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)      AND'
      #9'      (OI.IDINVESTIMENTO = IV.IDINVESTIMENTO)      AND'
      #9'      (IV.IDINVESTIMENTO = AC.IDACAO(+))           AND'
      #9'      (IV.IDINVESTIMENTO = TR.IDTITRENFIXA(+))'
      ''
      'ORDER BY OI.NUMDOCUMENTO, TD.DESCTIPODESPINV'
      ''
      '')
    UpdateObject = UpdDespesas
    ValidateWithMask = True
    Left = 594
    Top = 187
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
    object QryDespesasOperacaoIDDESPOPERINVEST: TFloatField
      FieldName = 'IDDESPOPERINVEST'
      Origin = '"CM.DESPOPERINVEST".IDDESPOPERINVEST'
    end
    object QryDespesasOperacaoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = '"CM.DESPOPERINVEST".IDOPERACAOINVEST'
    end
    object QryDespesasOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = '"CM.DESPOPERINVEST".IDTIPOINVEST'
    end
    object QryDespesasOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = '"CM.DESPOPERINVEST".IDTIPOOPERACAO'
    end
    object QryDespesasOperacaoIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = '"CM.DESPOPERINVEST".IDTIPODESPINVEST'
    end
    object QryDespesasOperacaoDATAVENCDESPOPER: TDateTimeField
      FieldName = 'DATAVENCDESPOPER'
      Origin = '"CM.DESPOPERINVEST".DATAVENCDESPOPER'
    end
    object QryDespesasOperacaoIDREGRACALCUSADA: TFloatField
      FieldName = 'IDREGRACALCUSADA'
      Origin = '"CM.DESPOPERINVEST".IDREGRACALCUSADA'
    end
    object QryDespesasOperacaoIDREGRAVENCUSADA: TFloatField
      FieldName = 'IDREGRAVENCUSADA'
      Origin = '"CM.DESPOPERINVEST".IDREGRAVENCUSADA'
    end
    object QryDespesasOperacaoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object QryDespesasOperacaoVLRDESPOPER: TFloatField
      FieldName = 'VLRDESPOPER'
      DisplayFormat = '###,###,###,#0.00'
      EditFormat = '##########0.00'
    end
    object QryDespesasOperacaoNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'OPERACAOINVEST.NUMDOCUMENTO'
      Required = True
      Size = 30
    end
    object QryDespesasOperacaoFLGCALCDIARIO: TStringField
      FieldName = 'FLGCALCDIARIO'
      ReadOnly = True
      Size = 1
    end
    object QryDespesasOperacaoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryDespesasOperacaoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryDespesasOperacaoVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object QryDespesasOperacaoQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object QryDespesasOperacaoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryDespesasOperacaoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryDespesasOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Size = 1
    end
    object QryDespesasOperacaoDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object QryDespesasOperacaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object QryDespesasOperacaoTIPOTITULO: TStringField
      FieldName = 'TIPOTITULO'
      Size = 10
    end
    object QryDespesasOperacaoNATOPERDESP: TStringField
      FieldKind = fkLookup
      FieldName = 'NATOPERDESP'
      LookupDataSet = QryBuscaDespesa
      LookupKeyFields = 'IDTIPODESPINVEST'
      LookupResultField = 'NATUREZAOPERACAO'
      KeyFields = 'IDTIPODESPINVEST'
      Size = 1
      Lookup = True
    end
    object QryDespesasOperacaoIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object QryDespesasOperacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QryDespesasOperacaoDESCTIPODESPINV: TStringField
      FieldName = 'DESCTIPODESPINV'
      Size = 60
    end
  end
  object DsDespesasOperacao: TwwDataSource
    DataSet = QryDespesasOperacao
    Left = 456
    Top = 187
  end
  object QryConsolidado: TwwQuery
    AfterOpen = QryConsultaAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#9'TD.DESCTIPODESPINV, SUM(NVL(DOP.VLRDESPOPER,0)) AS VLRDE' +
        'SPOPER'
      ''
      
        'FROM '#9'CM.OPERACAOINVEST OI, CM.DESPOPERINVEST DOP, CM.TIPODESPIN' +
        'VEST TD'
      ''
      'WHERE '#9'(OI.NUMDOCUMENTO      = :NUMDOC) '#9'     AND '
      #9'(DOP.IDOPERACAOINVEST = OI.IDOPERACAOINVEST) AND '
      #9'(DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST) '
      #9
      'GROUP BY TD.DESCTIPODESPINV '
      ' '
      'ORDER BY TD.DESCTIPODESPINV')
    ValidateWithMask = True
    Left = 272
    Top = 187
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMDOC'
        ParamType = ptUnknown
        Value = 'RV-99/0037'
      end>
    object QryConsolidadoDESCTIPODESPINV: TStringField
      FieldName = 'DESCTIPODESPINV'
      Size = 60
    end
    object QryConsolidadoVLRDESPOPER: TFloatField
      FieldName = 'VLRDESPOPER'
      DisplayFormat = '###,###,###,#0.00'
    end
  end
  object DtsConsolidado: TwwDataSource
    DataSet = QryConsolidado
    Left = 357
    Top = 187
  end
  object QryBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BOL.IDBOLETA, BOL.OBSERVACAO'
      ''
      'FROM CM.BOLETA BOL'
      ''
      'WHERE BOL.IDBOLETA = :IDBOLETA')
    ValidateWithMask = True
    Left = 358
    Top = 66
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end>
  end
  object PopDespesas: TPopupMenu
    Left = 430
    Top = 139
    object Alterar1: TMenuItem
      Caption = 'Alterar'
    end
  end
  object MSBuscaCredor: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Credor')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'EMPRESAFORN')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'PESSOA.NOME')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = EMPRESAFORN.IDFORCLI')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 29
    Top = 195
  end
  object QryConsulta: TwwQuery
    CachedUpdates = True
    AfterOpen = QryConsultaAfterOpen
    BeforePost = QryConsultaBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BV.SGLBOLSAVALORES, OI.DATAOPERACAO, OI.DATAVENCOPER, OI.' +
        'QTDEOPERACAO, OI.IDOPERACAOINVEST,'
      
        '       OI.PRECOUNITOPERACAO, ROUND(OI.VLROPERACAO) AS VLROPERACA' +
        'O, DS.TOTALDESPESAS,'
      '       SUBSTR(ME.DESCMERCADO,1,10) AS DESCMERCADO,'
      
        '       PS.NOME, SUBSTR(IV.DESCINVESTIMENTO,1,12) AS DESCINVESTIM' +
        'ENTO, SIGLATIPOOPER AS DESCTIPOOPERACAO, OI.NUMDOCUMENTO,'
      
        '       TI.NATUREZAOPERACAO, OI.IDTIPOOPERACAO, TI.IDTIPOINVEST, ' +
        'OI.IDTIPOOPERACAO, OI.IDFORCLI, OI.IDCARTEIRAINVEST,'
      
        '       AC.CODTIPOACAO, OI.MOECODIGO, OI.IDINVESTIMENTO, OI.IDLOT' +
        'E, OI.IDCORRETVALORES, AB.QTDELOTE,'
      '       OI.EMPRESAPROP, OI.IDOPERACAOORIGEM, '
      '       DECODE(TI.NATUREZAOPERACAO, '#39'D'#39','#39'R'#39','
      '          DECODE(TI.NATUREZAOPERACAO, '#39'S'#39','#39'R'#39','
      '             DECODE(TI.NATUREZAOPERACAO, '#39'O'#39','#39'R'#39','
      '                DECODE(TI.NATUREZAOPERACAO, '#39'R'#39','#39'R'#39','
      
        '                   DECODE(TI.NATUREZAOPERACAO, '#39'I'#39','#39'R'#39','#39'P'#39'))))) ' +
        'AS  RECPAGBOL'
      ''
      
        'FROM   PESSOA PS,CM.OPERACAOINVEST OI, CM.OPRACAO OA, BOLSAVALOR' +
        'ES BV,'
      
        '        CM.INVESTIMENTO IV, CM.TIPOOPERACAO TI, CM.MERCADO ME, C' +
        'M.ACAO AC,'
      '        CM.ACOESXBOLSA AB, CM.PARAMINVEST PI,'
      
        '     '#9'(SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOTA' +
        'LDESPESAS'
      #9' FROM   CM.DESPOPERINVEST DOI, TIPODESPINVEST TDI'
      #9' WHERE  DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST '#9'AND'
      #9'        TDI.NATUREZAOPERACAO NOT IN ('#39'N'#39')'
      #9' GROUP BY DOI.IDOPERACAOINVEST) DS'
      ''
      'WHERE (OI.IDTIPOOPERACAO   = PI.IDTIPOOPERDIRSUB)    AND'
      '      (OI.IDOPERACAOINVEST = OA.IDOPERACAOINVEST)    AND'
      '      (OI.IDOPERACAOINVEST = DS.IDOPERACAOINVEST(+)) AND'
      '      (OI.IDCORRETVALORES  = PS.IDPESSOA(+)) '#9'     AND'
      '      (OA.IDBOLSAVALORES   = BV.IDBOLSAVALORES)'#9'     AND'
      '      (OA.IDACAO '#9'   = IV.IDINVESTIMENTO)      AND'
      '      (TI.IDMERCADO        = ME.IDMERCADO)'#9'     AND'
      '      (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO)      AND'
      '      (OI.IDINVESTIMENTO   = AC.IDACAO)              AND'
      '      (AB.IDACAO           = AC.IDACAO)              AND'
      '      (AB.IDBOLSAVALORES   = BV.IDBOLSAVALORES)')
    UpdateObject = updConsulta
    ValidateWithMask = True
    Left = 53
    Top = 84
    object QryConsultaSGLBOLSAVALORES: TStringField
      DisplayLabel = 'Bolsa'
      DisplayWidth = 21
      FieldName = 'SGLBOLSAVALORES'
      Size = 10
    end
    object QryConsultaDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 25
      FieldName = 'DESCINVESTIMENTO'
      Size = 12
    end
    object QryConsultaCODTIPOACAO: TStringField
      DisplayLabel = 'Tipo '
      DisplayWidth = 8
      FieldName = 'CODTIPOACAO'
      Size = 5
    end
    object QryConsultaDATAVENCOPER: TDateTimeField
      DisplayLabel = 'Liquidação'
      DisplayWidth = 10
      FieldName = 'DATAVENCOPER'
    end
    object QryConsultaVLROPERACAO: TFloatField
      DisplayLabel = 'Valor da Operação'
      DisplayWidth = 25
      FieldName = 'VLROPERACAO'
      OnValidate = QryConsultaVLROPERACAOValidate
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryConsultaDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 7
      FieldName = 'DESCTIPOOPERACAO'
      Visible = False
      Size = 4
    end
    object QryConsultaQTDEOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 13
      FieldName = 'QTDEOPERACAO'
      Visible = False
      DisplayFormat = '###,###,###,###'
    end
    object QryConsultaPRECOUNITOPERACAO: TFloatField
      DisplayLabel = 'PU'
      DisplayWidth = 9
      FieldName = 'PRECOUNITOPERACAO'
      Visible = False
      DisplayFormat = '###,###,###0.000'
    end
    object QryConsultaTOTALDESPESAS: TFloatField
      DisplayLabel = 'Tot. de Desp.'
      DisplayWidth = 10
      FieldName = 'TOTALDESPESAS'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryConsultaDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Visible = False
    end
    object QryConsultaIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
    object QryConsultaDESCMERCADO: TStringField
      FieldName = 'DESCMERCADO'
      Visible = False
      Size = 10
    end
    object QryConsultaNOME: TStringField
      FieldName = 'NOME'
      Visible = False
      Size = 60
    end
    object QryConsultaNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Visible = False
      Size = 30
    end
    object QryConsultaNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      Size = 1
    end
    object QryConsultaIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryConsultaIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryConsultaIDTIPOOPERACAO_1: TFloatField
      FieldName = 'IDTIPOOPERACAO_1'
      Visible = False
    end
    object QryConsultaIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object QryConsultaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryConsultaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object QryConsultaIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object QryConsultaIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object QryConsultaIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Visible = False
    end
    object QryConsultaQTDELOTE: TFloatField
      FieldName = 'QTDELOTE'
      Visible = False
    end
    object QryConsultaEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
      Visible = False
    end
    object QryConsultaIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
      Visible = False
    end
    object QryConsultaRECPAGBOL: TStringField
      FieldName = 'RECPAGBOL'
      Visible = False
      Size = 1
    end
  end
  object qryAtualizaBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE BOLETA'
      'SET STATUS = '#39'F'#39
      'WHERE IDBOLETA = :BOLETA')
    ValidateWithMask = True
    Left = 272
    Top = 137
    ParamData = <
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
    Left = 272
    Top = 73
    ParamData = <
      item
        DataType = ftString
        Name = 'BOLETA'
        ParamType = ptUnknown
      end>
  end
  object QryCorretagemDevol: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT nvl(DOP.VLRDESPOPER,0) AS VLRDESPOPER, TD.DESCTIPODESPINV'
      ''
      'FROM '#9'CM.DESPOPERINVEST DOP,      CM.TIPODESPINVEST TD'
      ''
      'WHERE       (DOP.IDOPERACAOINVEST =:IDOPERACAOINVEST) AND'
      
        '           ((TD.DESCTIPODESPINV   Like '#39'%Devolucao Corretagem%'#39')' +
        '    OR'
      
        '            (TD.DESCTIPODESPINV   Like '#39'%Devolucao de Corretagem' +
        '%'#39') OR'
      
        '            (TD.DESCTIPODESPINV   Like '#39'%DEVOLUCAO DE CORRETAGEM' +
        '%'#39') OR'
      
        ' '#9'     (TD.DESCTIPODESPINV  Like '#39'%DEVOLUCAO CORRETAGEM%'#39'))   AN' +
        'D'
      '            (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST)'
      ''
      'UNION'
      ''
      'SELECT nvl(DOP.VLRDESPOPER,0) AS VLRDESPOPER, TD.DESCTIPODESPINV'
      ''
      'FROM CM.DESPOPERINVEST DOP, TIPODESPINVEST TD'
      ''
      'WHERE (DOP.IDOPERACAOINVEST =:IDOPERACAOINVEST) AND'
      '     ((TD.DESCTIPODESPINV  Like '#39'Corretagem%'#39')  OR'
      '      (TD.DESCTIPODESPINV  Like '#39'CORRETAGEM%'#39')) AND'
      '      (DOP.IDTIPODESPINVEST = TD.IDTIPODESPINVEST)')
    ValidateWithMask = True
    Left = 570
    Top = 330
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryCorretValores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   CV.IDCORRETVALORES,'
      '   CV.SGLCORRETVALORES'
      'FROM'
      '   CORRETVALORES CV, OPERACAOINVEST OPI'
      'WHERE'
      '    CV.IDCORRETVALORES = OPI.IDCORRETVALORES AND'
      '    OPI.DATAOPERACAO = :P_DATAOPERACAO'
      'ORDER BY SGLCORRETVALORES')
    ValidateWithMask = True
    Left = 693
    Top = 64
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'P_DATAOPERACAO'
        ParamType = ptUnknown
      end>
    object QryCorretValoresSGLCORRETVALORES: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 10
      FieldName = 'SGLCORRETVALORES'
      Origin = 'CORRETVALORES.SGLCORRETVALORES'
      Size = 10
    end
    object QryCorretValoresIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = 'CORRETVALORES.IDCORRETVALORES'
      Visible = False
    end
  end
  object DsFinalizar: TwwDataSource
    AutoEdit = False
    Left = 517
    Top = 59
  end
  object updConsulta: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.OPERACAOINVEST'
      'set'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  DATAVENCOPER = :DATAVENCOPER,'
      '  QTDEOPERACAO = :QTDEOPERACAO,'
      '  IDOPERACAOINVEST = :IDOPERACAOINVEST,'
      '  PRECOUNITOPERACAO = :PRECOUNITOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDFORCLI = :IDFORCLI,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  MOECODIGO = :MOECODIGO,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDLOTE = :IDLOTE,'
      '  IDCORRETVALORES = :IDCORRETVALORES,'
      '  IDOPERACAOORIGEM = :IDOPERACAOORIGEM'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    InsertSQL.Strings = (
      'insert into CM.OPERACAOINVEST'
      
        '  (DATAOPERACAO, DATAVENCOPER, QTDEOPERACAO, IDOPERACAOINVEST, P' +
        'RECOUNITOPERACAO, '
      
        '   VLROPERACAO, NUMDOCUMENTO, IDTIPOOPERACAO, IDTIPOINVEST, IDFO' +
        'RCLI, IDCARTEIRAINVEST, '
      
        '   MOECODIGO, IDINVESTIMENTO, IDLOTE, IDCORRETVALORES, IDOPERACA' +
        'OORIGEM)'
      'values'
      
        '  (:DATAOPERACAO, :DATAVENCOPER, :QTDEOPERACAO, :IDOPERACAOINVES' +
        'T, :PRECOUNITOPERACAO, '
      
        '   :VLROPERACAO, :NUMDOCUMENTO, :IDTIPOOPERACAO, :IDTIPOINVEST, ' +
        ':IDFORCLI, '
      
        '   :IDCARTEIRAINVEST, :MOECODIGO, :IDINVESTIMENTO, :IDLOTE, :IDC' +
        'ORRETVALORES, '
      '   :IDOPERACAOORIGEM)')
    DeleteSQL.Strings = (
      'delete from CM.OPERACAOINVEST'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    Left = 161
    Top = 48
  end
  object QryOperacaoPendente: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDOPERACAOINVEST,'
      '   VLRPENDENTE'
      'FROM OPERACAOPENDENTE'
      'WHERE'
      '   IDOPERACAOINVEST=:IDOPERACAOINVEST')
    UpdateObject = UpdOperacaoPendente
    ValidateWithMask = True
    Left = 29
    Top = 134
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
    object QryOperacaoPendenteIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'OPERACAOPENDENTE.IDOPERACAOINVEST'
    end
    object QryOperacaoPendenteVLRPENDENTE: TFloatField
      FieldName = 'VLRPENDENTE'
      Origin = 'OPERACAOPENDENTE.VLRPENDENTE'
    end
  end
  object DsOperacaoPendente: TwwDataSource
    AutoEdit = False
    DataSet = QryOperacaoPendente
    Left = 93
    Top = 134
  end
  object UpdOperacaoPendente: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOPENDENTE'
      'set'
      '  IDOPERACAOINVEST = :IDOPERACAOINVEST,'
      '  VLRPENDENTE = :VLRPENDENTE'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    InsertSQL.Strings = (
      'insert into OPERACAOPENDENTE'
      '  (IDOPERACAOINVEST, VLRPENDENTE)'
      'values'
      '  (:IDOPERACAOINVEST, :VLRPENDENTE)')
    DeleteSQL.Strings = (
      'delete from OPERACAOPENDENTE'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    Left = 153
    Top = 136
  end
  object QryParamInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PARAMINVEST')
    ValidateWithMask = True
    Left = 434
    Top = 70
  end
  object QryUpdOperacaoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE OPERACAOINVEST'
      'SET'
      '   VLROPERACAO  =:VLROPERACAO, '
      '   DATAVENCOPER =:DATAVENCOPER'
      'WHERE'
      '   IDOPERACAOINVEST  = :IDOPERACAOINVEST AND'
      '   IDTIPOOPERACAO   <> :IDTIPOOPERACAO'
      '')
    ValidateWithMask = True
    Left = 290
    Top = 262
    ParamData = <
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
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
  end
  object QryDelOperacaoPendente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM'
      '     OPERACAOPENDENTE'
      'WHERE '
      '     IDOPERACAOINVEST =:IDOPERACAOINVEST')
    ValidateWithMask = True
    Left = 170
    Top = 254
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryOperacaoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '     OI.QTDEOPERACAO, '
      '     OI.IDTIPOOPERACAO,'
      '     OI.IDTIPOOPERACAO,'
      '     TI.NATUREZAOPERACAO'
      'FROM'
      '     OPERACAOINVEST OI, TIPOOPERACAO TI'
      'WHERE'
      '  (IDOPERACAOINVEST =:IDOPERACAOINVEST)     AND'
      '  (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO)'
      '')
    ValidateWithMask = True
    Left = 690
    Top = 126
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryInsOperacaoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into CM.OPERACAOINVEST'
      
        '  (IDOPERACAOINVEST, IDCORRETVALORES, MOECODIGO, IDCARTEIRAINVES' +
        'T, IDINVESTIMENTO, '
      
        '   IDTIPOINVEST, IDTIPOOPERACAO, DATAOPERACAO, NUMDOCUMENTO, QTD' +
        'EOPERACAO, '
      
        '   PRECOUNITOPERACAO, VLROPERACAO, DATAVENCOPER, IDFORCLI, IDLOT' +
        'E, IDOPERACAOORIGEM)'
      'values'
      
        '  (:IDOPERACAOINVEST, :IDCORRETVALORES, :MOECODIGO, :IDCARTEIRAI' +
        'NVEST,'
      
        '   :IDINVESTIMENTO, :IDTIPOINVEST, :IDTIPOOPERACAO, :DATAOPERACA' +
        'O, :NUMDOCUMENTO,'
      
        '   :QTDEOPERACAO, :PRECOUNITOPERACAO, :VLROPERACAO, :DATAVENCOPE' +
        'R, :IDFORCLI,'
      '   :IDLOTE, :IDOPERACAOORIGEM)')
    ValidateWithMask = True
    Left = 573
    Top = 278
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MOECODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDINVESTIMENTO'
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
        DataType = ftUnknown
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
        DataType = ftUnknown
        Name = 'DATAVENCOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDOPERACAOORIGEM'
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
      '       FLGTRANSF,    FLGCORRET,      FLGORDMOVINV, FLGTRATAIR'
      ''
      'FROM CM.TIPOOPERACAO'
      'WHERE IDTIPOOPERACAO = :TIPOOPERACAO'
      '')
    ValidateWithMask = True
    Left = 688
    Top = 209
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
  end
  object QryAltOperacaoPendente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE OPERACAOPENDENTE SET'
      '       VLRPENDENTE   =:VLRPENDENTE'
      'WHERE '
      '     IDOPERACAOINVEST =:IDOPERACAOINVEST')
    ValidateWithMask = True
    Left = 682
    Top = 323
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'VLRPENDENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaQtdOperPendente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      QTDEPENDENTE'
      'FROM  OPERACAOPENDENTE'
      ''
      'WHERE '
      '     IDOPERACAOINVEST =:IDOPERACAOINVEST')
    ValidateWithMask = True
    Left = 682
    Top = 274
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryDelOperacaoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM OPERACAOINVEST'
      'WHERE'
      '   DATAVENCOPER     =:DATAVENCOPER     AND'
      '   IDOPERACAOORIGEM =:IDOPERACAOORIGEM AND'
      '   IDTIPOOPERACAO   =:IDTIPOOPERACAO')
    ValidateWithMask = True
    Left = 50
    Top = 258
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATAVENCOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
  end
  object QryUpdOperacaoPendente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE  OPERACAOPENDENTE SET'
      '     QTDEPENDENTE     = :QTDEPENDENTE'
      'WHERE'
      '     IDOPERACAOINVEST = :IDOPERACAOINVEST')
    ValidateWithMask = True
    Left = 42
    Top = 295
    ParamData = <
      item
        DataType = ftFloat
        Name = 'QTDEPENDENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryHistCartInv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   VLRMOVCARTINV,'
      '   QTDEMOVINVCART,'
      '   DATAMOVCARTINV'
      '   PLNCODIGO,'
      '   CODDOCUMENTO,'
      '   PLANO'
      'FROM'
      '  HISTCARTINV'
      'WHERE'
      '  IDOPERACAOINVEST = :IDOPERACAOINVEST AND'
      '  TIPMOVCARTINV    = '#39'OPE'#39)
    ValidateWithMask = True
    Left = 170
    Top = 298
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
    object QryHistCartInvVLRMOVCARTINV: TFloatField
      FieldName = 'VLRMOVCARTINV'
      Origin = 'HISTCARTINV.VLRMOVCARTINV'
    end
    object QryHistCartInvQTDEMOVINVCART: TFloatField
      FieldName = 'QTDEMOVINVCART'
      Origin = 'HISTCARTINV.QTDEMOVINVCART'
    end
    object QryHistCartInvPLNCODIGO: TDateTimeField
      FieldName = 'PLNCODIGO'
      Origin = 'HISTCARTINV.DATAMOVCARTINV'
    end
    object QryHistCartInvCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'HISTCARTINV.CODDOCUMENTO'
    end
    object QryHistCartInvPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'HISTCARTINV.PLANO'
    end
  end
  object QryBuscaUltDataOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(DATAVENCOPER) AS DATAVENCOPER'
      'FROM OPERACAOINVEST'
      'WHERE'
      '   DATAOPERACAO     = :DATAOPERACAO   AND'
      '   IDTIPOOPERACAO   = :IDTIPOOPERACAO AND'
      '   IDOPERACAOORIGEM = :IDOPERACAOINVEST ')
    ValidateWithMask = True
    Left = 282
    Top = 322
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaOperPendente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DATAVENCOPER, '
      '   QTDEOPERACAO,     '
      '   VLROPERACAO'
      'FROM '
      '   OPERACAOINVEST'
      'WHERE'
      '   DATAVENCOPER     = :DATAVENCOPER   AND'
      '   IDOPERACAOORIGEM = :IDOPERACAOORIGEM AND'
      '   IDTIPOOPERACAO   = :IDTIPOOPERACAO'
      '      ')
    ValidateWithMask = True
    Left = 394
    Top = 266
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAVENCOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
  end
  object QryUpdOperacaoInvest_2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE OPERACAOINVEST'
      'SET'
      '   VLROPERACAO    =:VLROPERACAO,'
      '   QTDEOPERACAO   =:QTDEOPERACAO,'
      '   DATAVENCOPER   =:DATAVENCOPER,'
      '   IDOPERACAOORIGEM = NULL'
      'WHERE'
      '   IDOPERACAOINVEST  = :IDOPERACAOINVEST AND'
      '   IDTIPOOPERACAO   <> :IDTIPOOPERACAO'
      '')
    ValidateWithMask = True
    Left = 394
    Top = 334
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VLROPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'QTDEOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAVENCOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
  end
  object QryUpdOperInvestNull: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE OPERACAOINVEST SET IDOPERACAOORIGEM = NULL'
      'WHERE IDOPERACAOORIGEM = :IDOPERACAOORIGEM')
    ValidateWithMask = True
    Left = 402
    Top = 382
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDOPERACAOORIGEM'
        ParamType = ptUnknown
      end>
  end
  object QryLiquidacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   DATAVENCOPER'
      'FROM'
      '   OPERACAOINVEST'
      'WHERE'
      '   DATAOPERACAO    = :DATAOPERACAO    AND'
      '   NOT IDOPERACAOORIGEM IS NULL  '
      'ORDER BY  DATAVENCOPER'
      '')
    ValidateWithMask = True
    Left = 717
    Top = 20
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end>
    object QryLiquidacaoDATAVENCOPER: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAVENCOPER'
      Origin = '"CM.OPERACAOINVEST".DATAVENCOPER'
    end
  end
  object DsLiquidacao: TwwDataSource
    AutoEdit = False
    DataSet = QryLiquidacao
    Left = 645
    Top = 43
  end
  object QryDelOperacaoInvestPend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM OPERACAOINVEST'
      'WHERE'
      '   DATAVENCOPER     =:DATAVENCOPER     AND'
      '   IDOPERACAOINVEST =:IDOPERACAOINVEST AND'
      '   IDTIPOOPERACAO   =:IDTIPOOPERACAO')
    ValidateWithMask = True
    Left = 274
    Top = 386
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAVENCOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
  end
  object QryTestaMenorData: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   DATAVENCOPER'
      'FROM'
      '   OPERACAOINVEST'
      'WHERE'
      '   IDTIPOOPERACAO     = :IDTIPOOPERACAO  AND'
      '   DATAVENCOPER      <> :DATAVENCOPER    AND'
      '   NOT IDOPERACAOORIGEM IS NULL  '
      'ORDER BY  DATAVENCOPER'
      '')
    ValidateWithMask = True
    Left = 677
    Top = 372
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAVENCOPER'
        ParamType = ptUnknown
      end>
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAVENCOPER'
      Origin = '"CM.OPERACAOINVEST".DATAVENCOPER'
    end
  end
  object QryTestaQtdZerada: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(DATAVENCOPER) AS DATAVENCOPER, IDOPERACAOINVEST'
      'FROM OPERACAOINVEST'
      'WHERE'
      '  (IDCORRETVALORES  = :IDCORRETVALORES)  AND'
      '  (DATAOPERACAO     = :DATAOPERACAO)     AND'
      '  (DATAVENCOPER     < :DATAVENCOPER)     AND'
      '  (IDOPERACAOORIGEM = :IDOPERACAOORIGEM) AND'
      '  (IDTIPOOPERACAO   = :IDTIPOOPERACAO)   AND'
      '  (QTDEOPERACAO     = 0)'
      'GROUP BY IDOPERACAOINVEST')
    ValidateWithMask = True
    Left = 557
    Top = 396
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAVENCOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAVENCOPER'
      Origin = '"CM.OPERACAOINVEST".DATAVENCOPER'
    end
    object QryTestaQtdZeradaIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = '"CM.OPERACAOINVEST".IDOPERACAOINVEST'
    end
  end
  object QryLiquidacao1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   DATAVENCOPER'
      'FROM'
      '   OPERACAOINVEST'
      'WHERE'
      '   IDTIPOOPERACAO  = :IDTIPOOPERACAO  AND'
      '   DATAOPERACAO    = :DATAOPERACAO    AND'
      '   NOT IDOPERACAOORIGEM IS NULL  '
      'ORDER BY  DATAVENCOPER'
      '')
    ValidateWithMask = True
    Left = 733
    Top = 172
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end>
    object DateTimeField3: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAVENCOPER'
      Origin = '"CM.OPERACAOINVEST".DATAVENCOPER'
    end
  end
  object QryInsOperacaoPendente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into OPERACAOPENDENTE'
      '  (IDOPERACAOINVEST, VLRPENDENTE)'
      'values'
      '  (:IDOPERACAOINVEST, :VLRPENDENTE)')
    ValidateWithMask = True
    Left = 50
    Top = 375
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VLRPENDENTE'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaUltDtaOperInv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MAX(DATAVENCOPER) AS DATAVENCOPER'
      'FROM  OPERACAOINVEST'
      'WHERE DATAVENCOPER     < :DATAVENCOPER     AND'
      '      IDOPERACAOORIGEM = :IDOPERACAOORIGEM')
    ValidateWithMask = True
    Left = 130
    Top = 383
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAVENCOPER'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOORIGEM'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaDataVenc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(DATAVENCOPER) AS DATAVENCOPER'
      'FROM'
      '   OPERACAOINVEST'
      'WHERE'
      '   IDTIPOOPERACAO  = :IDTIPOOPERACAO  AND'
      '   IDCORRETVALORES = :IDCORRETVALORES AND'
      '   DATAOPERACAO    = :DATAOPERACAO    AND'
      '   NOT IDOPERACAOORIGEM IS NULL'
      ''
      '')
    ValidateWithMask = True
    Left = 202
    Top = 391
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end>
  end
  object QryVerOperInvPendente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DATAVENCOPER, '
      '   QTDEOPERACAO,     '
      '   VLROPERACAO'
      'FROM '
      '   OPERACAOINVEST'
      'WHERE'
      '   IDOPERACAOORIGEM = :IDOPERACAOORIGEM AND'
      '   IDTIPOOPERACAO   = :IDTIPOOPERACAO'
      '      ')
    ValidateWithMask = True
    Left = 482
    Top = 266
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
  end
  object QryVerDtaVenc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(DATAVENCOPER) AS DATAVENCOPER'
      'FROM   OPERACAOINVEST'
      'WHERE'
      '       IDOPERACAOORIGEM = :IDOPERACAOORIGEM AND'
      '       IDOPERACAOORIGEM <> IDOPERACAOINVEST')
    ValidateWithMask = True
    Left = 482
    Top = 306
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOORIGEM'
        ParamType = ptUnknown
      end>
  end
end
