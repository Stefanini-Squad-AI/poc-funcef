inherited frmExecDesmembramento: TfrmExecDesmembramento
  Left = 289
  Top = 136
  HelpContext = 540009
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Desmembramento de Imóveis'
  ClientHeight = 436
  ClientWidth = 731
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 731
    Height = 354
    object lblTitulo: TfcLabel
      Left = 16
      Top = 8
      Width = 414
      Height = 24
      Caption = 'Desmembramento de Imóveis [ Seleção ]'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.Style = fclsRaised
      TextOptions.VAlignment = vaTop
    end
    object ntbPrincipal: TNotebook
      Left = 0
      Top = 33
      Width = 731
      Height = 321
      Align = alBottom
      PageIndex = 1
      TabOrder = 0
      OnPageChanged = ntbPrincipalPageChanged
      object TPage
        Left = 0
        Top = 0
        Caption = 'Selecao'
        object Label3: TLabel
          Left = 597
          Top = 9
          Width = 105
          Height = 13
          Caption = 'Data da Operação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnContinuaSelecao: TfcShapeBtn
          Left = 624
          Top = 280
          Width = 89
          Height = 29
          Caption = 'Continuar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F88888888887F887FBBBBB0BBBB088878888887F88878F7FBBBBBB00BB
            BB087F88FFFF77F8887F7FB00000000BBB087F877777777F887F7FB000000000
            BB087F8777777777887F7FB00000000BBB087F8777777778887F7FBBBBBB00BB
            BB0878F888887788887887FBBBBB0BBBB08887F88888788887F887FBBBBBBBBB
            B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
            8888888778FFFF77888888888777778888888888877777888888}
          Layout = blGlyphRight
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          ParentShowHint = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          ShowHint = True
          TabOrder = 3
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuaSelecaoClick
        end
        inline molImovelAtivo1: TmolImovelAtivo
          Left = 8
          Top = 8
          Width = 529
          inherited Label5: TLabel
            Top = 1
          end
          inherited edtImovel: TEdit
            Width = 449
          end
          inherited btnBuscaImovel: TBitBtn
            Left = 456
            OnClick = molImovelAtivo1btnBuscaImovelClick
          end
          inherited btnLimpaImovel: TBitBtn
            Left = 480
            OnClick = molImovelAtivo1btnLimpaImovelClick
          end
        end
        object Panel8: TPanel
          Left = 16
          Top = 183
          Width = 697
          Height = 24
          BevelInner = bvLowered
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = clWindow
          Enabled = False
          TabOrder = 2
          object Label5: TLabel
            Left = 384
            Top = 4
            Width = 146
            Height = 13
            Caption = 'Saldo Contábil do Imóvel:'
          end
          object edtSaldoContabil: TRealEdit
            Left = 536
            Top = 4
            Width = 137
            Height = 22
            Alignment = taRightJustify
            BorderStyle = bsNone
            Lines.Strings = (
              '      0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
        object DBgrdBemOriginal: TwwDBGrid
          Left = 17
          Top = 88
          Width = 697
          Height = 38
          Selected.Strings = (
            'DESCGRUPO'#9'32'#9'Grupo'#9'F'
            'DESBEM'#9'61'#9'Bem'#9'F'
            'SUMVALCTB'#9'15'#9'Valor Contábil'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsImovelxBem
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 4
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = DBgrdBemOriginalCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdBemOriginalTopRowChanged
        end
        object Panel5: TPanel
          Left = 16
          Top = 62
          Width = 697
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Bens que compõem o Imóvel'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object GroupBox1: TGroupBox
          Left = 16
          Top = 220
          Width = 217
          Height = 89
          TabOrder = 5
          object Panel1: TPanel
            Left = 8
            Top = 16
            Width = 201
            Height = 65
            BevelOuter = bvNone
            TabOrder = 0
            object Label2: TLabel
              Left = 22
              Top = 10
              Width = 119
              Height = 16
              Caption = 'Desmembrar em '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 86
              Top = 37
              Width = 101
              Height = 16
              Caption = 'imóveis novos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edtNumImoveis: TRealEdit
              Left = 22
              Top = 32
              Width = 57
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
          end
        end
        object GroupBox2: TGroupBox
          Left = 264
          Top = 220
          Width = 321
          Height = 89
          Caption = 'Observações do Evento'
          TabOrder = 6
          object memEvento: TMemo
            Left = 20
            Top = 20
            Width = 281
            Height = 59
            MaxLength = 2000
            TabOrder = 0
          end
        end
        object edtDataOper: TCMDateTimePicker
          Left = 597
          Top = 23
          Width = 116
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
          TabOrder = 7
          DisplayFormat = 'dd/mm/yyyy'
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Evento'
        object Panel6: TPanel
          Left = 120
          Top = 19
          Width = 489
          Height = 62
          Enabled = False
          TabOrder = 1
          object Label1: TLabel
            Left = 16
            Top = 10
            Width = 80
            Height = 13
            Caption = 'Imóvel Mestre'
          end
          object edtMestre: TEdit
            Left = 16
            Top = 24
            Width = 449
            Height = 21
            Enabled = False
            MaxLength = 60
            TabOrder = 0
          end
        end
        object Panel7: TPanel
          Left = 120
          Top = 88
          Width = 489
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Imóveis Resultantes'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object btnContinuaEvento: TfcShapeBtn
          Left = 624
          Top = 280
          Width = 89
          Height = 29
          Caption = 'Continuar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F88888888887F887FBBBBB0BBBB088878888887F88878F7FBBBBBB00BB
            BB087F88FFFF77F8887F7FB00000000BBB087F877777777F887F7FB000000000
            BB087F8777777777887F7FB00000000BBB087F8777777778887F7FBBBBBB00BB
            BB0878F888887788887887FBBBBB0BBBB08887F88888788887F887FBBBBBBBBB
            B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
            8888888778FFFF77888888888777778888888888877777888888}
          Layout = blGlyphRight
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          ParentShowHint = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          ShowHint = True
          TabOrder = 2
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuaEventoClick
        end
        object btnVoltaEvento: TfcShapeBtn
          Left = 528
          Top = 280
          Width = 89
          Height = 29
          Caption = 'Voltar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888888888888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F8888F888887F887FBBB0BBBBBB0888788887F888887887FBBB00BBBBB
            BB087F88877FFFFFF8787FBB00000000BB087F8877777777F8787FB000000000
            BB087F8777777777F8787FBB00000000BB087F887777777788787FBBB00BBBBB
            BB0878F8877F8888887887FBBB0BBBBBB08887F88878888887F887FBBBBBBBBB
            B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          ParentShowHint = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          ShowHint = True
          TabOrder = 3
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnVoltaEventoClick
        end
        object dbgImoveis: TwwDBGrid
          Left = 120
          Top = 112
          Width = 489
          Height = 137
          Selected.Strings = (
            'NOME_IMOVEL'#9'63'#9'Nome do Imóvel'#9'F'
            'PERCENT_DESMEMBRA'#9'11'#9'       %'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsImovelResult
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 4
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = DBgrdBemOriginalCalcCellColors
          OnEnter = dbgImoveisEnter
          OnExit = dbgImoveisExit
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdBemOriginalTopRowChanged
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Confirma'
        object DBgrdResult: TwwDBGrid
          Left = 62
          Top = 34
          Width = 605
          Height = 231
          Selected.Strings = (
            'NOME_IMOVEL'#9'52'#9'Imóvel'#9'T'
            '_GRUPO'#9'30'#9'Grupo'#9'T'
            'PERCENT_DESMEMBRA'#9'11'#9'       %'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsBemResult
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 3
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = DBgrdBemOriginalCalcCellColors
          OnEnter = DBgrdResultEnter
          OnExit = DBgrdResultExit
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdBemOriginalTopRowChanged
        end
        object btnCancelaDesmembra: TfcShapeBtn
          Left = 528
          Top = 280
          Width = 89
          Height = 29
          Caption = 'Voltar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888888888888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F8888F888887F887FBBB0BBBBBB0888788887F888887887FBBB00BBBBB
            BB087F88877FFFFFF8787FBB00000000BB087F8877777777F8787FB000000000
            BB087F8777777777F8787FBB00000000BB087F887777777788787FBBB00BBBBB
            BB0878F8877F8888887887FBBB0BBBBBB08887F88878888887F887FBBBBBBBBB
            B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 2
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnCancelaDesmembraClick
        end
        object btnConfirmaDesmembra: TfcShapeBtn
          Left = 624
          Top = 280
          Width = 89
          Height = 29
          Caption = 'Confirmar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888002222200
            88888887788888778F88887222222222088888788888888878F887A228822222
            208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
            22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
            22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
            220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
            2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
            8888888778FFFF77888888888777778888888888877777888888}
          Layout = blGlyphRight
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 1
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnConfirmaDesmembraClick
        end
        object Panel4: TPanel
          Left = 61
          Top = 8
          Width = 606
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Bens Resultantes'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 731
    inherited tb97Fundo: TToolbar97
      Left = 559
      DockPos = 589
    end
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 354
    Width = 731
    Height = 49
    Align = alBottom
    TabOrder = 2
    object lblProgress: TLabel
      Left = 16
      Top = 8
      Width = 141
      Height = 13
      Caption = 'Processando Relatório...'
      Visible = False
    end
    object lblContador: TLabel
      Left = 620
      Top = 8
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = '00000 de 00000'
      Visible = False
    end
    object ProgressBar: TProgressBar
      Left = 16
      Top = 24
      Width = 697
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 0
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    TargetsData = (
      1
      3
      (
        'TMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object dsImovelxBem: TwwDataSource
    AutoEdit = False
    DataSet = qryImovelXBem
    Left = 621
    Top = 249
  end
  object qryBemResult: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryBemResultCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   0 AS IDIMOVEL_RESULT,'
      '   0 AS NO_IMOVEL_RESULT,'
      '   0 AS IDBEM_ORIGEM,'
      
        '   '#39'                                                            ' +
        #39' AS NOME_IMOVEL,'
      
        '   '#39'                                                            ' +
        '                                                                ' +
        '                                                                ' +
        '            '#39' AS DESBEM,'
      '   '#39' '#39' AS IXBGRUPO,'
      '   0 AS PERCENT_DESMEMBRA,'
      '   0 AS CC_ORIGINAL,'
      '   0 AS CC_DESMEMBRA,'
      '   0 AS IDCONJUNTO_RESULT,'
      '   0 AS IDBEM_RESULT,'
      '   0 AS IDMOVIMENTACAO_DESMEMBRA,'
      '   0 AS FLGSEMPLACA,'
      '   -1 AS PLACA_RESULT,'
      '   0 AS IDGRUPO_RESULT'
      ''
      'FROM'
      '   DUAL'
      ''
      'WHERE'
      '   1=2'
      'ORDER BY'
      '   IDIMOVEL_RESULT, IDGRUPO_RESULT'
      ' '
      ' '
      ' ')
    UpdateObject = updBemResult
    ValidateWithMask = True
    Left = 208
    Top = 380
    object qryBemResultNOME_IMOVEL: TStringField
      DisplayWidth = 39
      FieldName = 'NOME_IMOVEL'
      FixedChar = True
      Size = 60
    end
    object qryBemResult_GRUPO: TStringField
      FieldKind = fkCalculated
      FieldName = '_GRUPO'
      Size = 25
      Calculated = True
    end
    object qryBemResultDESBEM: TStringField
      DisplayLabel = 'Bem'
      DisplayWidth = 39
      FieldName = 'DESBEM'
      FixedChar = True
      Size = 200
    end
    object qryBemResultPERCENT_DESMEMBRA: TFloatField
      DisplayLabel = ' %'
      DisplayWidth = 8
      FieldName = 'PERCENT_DESMEMBRA'
      DisplayFormat = '##0.0000 %'
      EditFormat = '##0.0000'
    end
    object qryBemResultIDIMOVEL_RESULT: TFloatField
      FieldName = 'IDIMOVEL_RESULT'
      Visible = False
    end
    object qryBemResultIDBEM_ORIGEM: TFloatField
      FieldName = 'IDBEM_ORIGEM'
      Visible = False
    end
    object qryBemResultIXBGRUPO: TStringField
      FieldName = 'IXBGRUPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryBemResultCC_ORIGINAL: TFloatField
      FieldName = 'CC_ORIGINAL'
    end
    object qryBemResultCC_DESMEMBRA: TFloatField
      FieldName = 'CC_DESMEMBRA'
    end
    object qryBemResultIDBEM_RESULT: TFloatField
      FieldName = 'IDBEM_RESULT'
    end
    object qryBemResultIDMOVIMENTACAO_DESMEMBRA: TFloatField
      FieldName = 'IDMOVIMENTACAO_DESMEMBRA'
    end
    object qryBemResultNO_IMOVEL_RESULT: TFloatField
      FieldName = 'NO_IMOVEL_RESULT'
    end
    object qryBemResultPLACA_RESULT: TFloatField
      FieldName = 'PLACA_RESULT'
      Visible = False
    end
    object qryBemResultFLGSEMPLACA: TFloatField
      FieldName = 'FLGSEMPLACA'
    end
    object qryBemResultIDCONJUNTO_RESULT: TFloatField
      FieldName = 'IDCONJUNTO_RESULT'
    end
    object qryBemResultIDGRUPO_RESULT: TFloatField
      FieldName = 'IDGRUPO_RESULT'
    end
  end
  object dsBemResult: TwwDataSource
    DataSet = qryBemResult
    Left = 208
    Top = 368
  end
  object updBemResult: TUpdateSQL
    Left = 208
    Top = 356
  end
  object updImovelResult: TUpdateSQL
    Left = 304
    Top = 380
  end
  object dsImovelResult: TwwDataSource
    DataSet = qryImovelResult
    Left = 304
    Top = 368
  end
  object qryImovelResult: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryBemResultCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   0 AS IDIMOVELMESTRE,'
      '   0 AS IDIMOVEL_RESULT,'
      '   0 AS NO_IMOVEL_RESULT,'
      
        '   '#39'                                                            ' +
        #39' AS NOME_IMOVEL,'
      '   '#39'               '#39' AS IMOCODIGO,'
      '   0 AS PERCENT_DESMEMBRA,'
      '   0 AS CC_DESMEMBRA,'
      '   0 AS IDEVENTO_RESULT'
      ''
      'FROM'
      '   IMOVEL'
      ''
      'WHERE'
      '   IDIMOVEL = 0'
      ' '
      ' ')
    UpdateObject = updImovelResult
    ValidateWithMask = True
    Left = 304
    Top = 352
    object qryImovelResultIDIMOVEL_RESULT: TFloatField
      FieldName = 'IDIMOVEL_RESULT'
    end
    object qryImovelResultPERCENT_DESMEMBRA: TFloatField
      FieldName = 'PERCENT_DESMEMBRA'
      DisplayFormat = '##0.0000 %'
      EditFormat = '##0.0000'
    end
    object qryImovelResultCC_DESMEMBRA: TFloatField
      FieldName = 'CC_DESMEMBRA'
    end
    object qryImovelResultNOME_IMOVEL: TStringField
      FieldName = 'NOME_IMOVEL'
      FixedChar = True
      Size = 60
    end
    object qryImovelResultNO_IMOVEL_RESULT: TFloatField
      FieldName = 'NO_IMOVEL_RESULT'
    end
    object qryImovelResultIDEVENTO_RESULT: TFloatField
      FieldName = 'IDEVENTO_RESULT'
    end
    object qryImovelResultIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object qryImovelResultIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      FixedChar = True
      Size = 15
    end
  end
  object qryInsertDesmembraImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO DESMEMBRAIMOVEL'
      '('
      'IDIMOVELINI, IDIMOVELFIM,'
      'IDEVENTOIMOVELINI, IDEVENTOIMOVELFIM,'
      'FLGTIPODESMEMBRA, DMRDATA, DMRPERCENT'
      ')'
      'VALUES'
      '('
      ':PIDIMOVELINI, :PIDIMOVELFIM,'
      ':PIDEVENTOIMOVELINI, :PIDEVENTOIMOVELFIM,'
      ':PFLGTIPODESMEMBRA, :PDMRDATA, :PDMRPERCENT'
      ')'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 432
    Top = 356
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDIMOVELINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDIMOVELFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDEVENTOIMOVELINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDEVENTOIMOVELFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PFLGTIPODESMEMBRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDMRDATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDMRPERCENT'
        ParamType = ptUnknown
      end>
  end
  object qryImovelXBem: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryImovelXBemCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   VW.IDIMOVEL, VW.NOME_MESTRE, VW.NOME_IMOVEL, VW.IMOVEL_EXTENS' +
        'O,'
      '   VW.IDBEM, VW.PLACA, VW.DESBEM, VW.IXBGRUPO,'
      '   VW.IMOCODIGO, VW.IMOMATRICULA,'
      '   VW.CODTIPIMOVEL, VW.DESCTIPOIMOVEL,'
      
        '   VW.FLGATIVO, VW.STATUS_IMOVEL, VW.FLGSTATUSOCUPACAO, VW.FLGSE' +
        'MPLACA,'
      '   VW.IDLOCALIZACAO, VW.IDRESPONSAVEL,'
      
        '   VW.IMOAREA, VW.IMOAREAGERENCIAL, VW.IMOFRACAOIDEAL, VW.IMOPER' +
        'CENTRATEIO,'
      
        '   VW.IMOMOEDACOMPRA, VW.IMOVLRCOMPRA, VW.IMODATACOMPRA, VW.MOED' +
        'A_COMPRA,'
      
        '   VW.IMOMOEDAREAVAL, VW.IMOVLRREAVAL, VW.IMODATAREAVAL, VW.MOED' +
        'A_REAVAL,'
      
        '   VW.IMOMOEDAMERCADO, VW.IMOVLRMERCADO, VW.IMODATAMERCADO, VW.M' +
        'OEDA_MERCADO,'
      '   VW.CONTROLE, VW.BAIXATOTAL, VW.DTAINCLUSAO,'
      
        '   VW.FLGDEPREC, VW.DATAULTDEP, VW.DATAINICIODEP, VW.TAXADEP, VW' +
        '.IDGRUPO,'
      '   VW.IDCLASSEBEM, VW.VALHISTORICO, VW.NOMEFORN,'
      '   VW.CODGRUPO, VW.DESCGRUPO, VW.TIPOGRUPO,'
      '   VW.CODCENTROCUSTO, VW.DESCCCUSTO, VW.TIPOCCUSTO,'
      '   VW.CODCLASSEBEM, VW.DESCCLASSEBEM, VW.TIPOCLASSEBEM,'
      '   VW.DESCCONJUNTO, VW.IDCONJUNTO, VW.DESCLOCAL, VW.NOMERESP,'
      '   0 AS SUMVALCTB'
      'FROM'
      '   VWBEMXIMOVEL VW'
      'WHERE'
      '       ( (:PIDIMOVEL IS NULL) OR (VW.IDIMOVEL =:PIDIMOVEL) )'
      '   AND ( (:PIDPESSOA IS NULL) OR (VW.IDPESSOA =:PIDPESSOA) )'
      'ORDER BY'
      '   VW.NOME_MESTRE, VW.NOME_IMOVEL, VW.DESBEM')
    UpdateObject = updImovelXBem
    ValidateWithMask = True
    Left = 608
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryImovelXBemIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryImovelXBemNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object qryImovelXBemNOME_IMOVEL: TStringField
      FieldName = 'NOME_IMOVEL'
      Size = 60
    end
    object qryImovelXBemIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryImovelXBemIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryImovelXBemPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryImovelXBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryImovelXBemIXBGRUPO: TStringField
      FieldName = 'IXBGRUPO'
      FixedChar = True
      Size = 1
    end
    object qryImovelXBemIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object qryImovelXBemIMOMATRICULA: TStringField
      FieldName = 'IMOMATRICULA'
    end
    object qryImovelXBemCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryImovelXBemDESCTIPOIMOVEL: TStringField
      FieldName = 'DESCTIPOIMOVEL'
      Size = 60
    end
    object qryImovelXBemFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
    end
    object qryImovelXBemSTATUS_IMOVEL: TStringField
      FieldName = 'STATUS_IMOVEL'
      FixedChar = True
      Size = 1
    end
    object qryImovelXBemFLGSTATUSOCUPACAO: TStringField
      FieldName = 'FLGSTATUSOCUPACAO'
      FixedChar = True
      Size = 1
    end
    object qryImovelXBemFLGSEMPLACA: TFloatField
      FieldName = 'FLGSEMPLACA'
    end
    object qryImovelXBemIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
    end
    object qryImovelXBemIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qryImovelXBemIMOAREA: TFloatField
      FieldName = 'IMOAREA'
    end
    object qryImovelXBemIMOAREAGERENCIAL: TFloatField
      FieldName = 'IMOAREAGERENCIAL'
    end
    object qryImovelXBemIMOFRACAOIDEAL: TFloatField
      FieldName = 'IMOFRACAOIDEAL'
    end
    object qryImovelXBemIMOPERCENTRATEIO: TFloatField
      FieldName = 'IMOPERCENTRATEIO'
    end
    object qryImovelXBemIMOMOEDACOMPRA: TFloatField
      FieldName = 'IMOMOEDACOMPRA'
    end
    object qryImovelXBemIMOVLRCOMPRA: TFloatField
      FieldName = 'IMOVLRCOMPRA'
    end
    object qryImovelXBemIMODATACOMPRA: TDateTimeField
      FieldName = 'IMODATACOMPRA'
    end
    object qryImovelXBemMOEDA_COMPRA: TStringField
      FieldName = 'MOEDA_COMPRA'
      Size = 10
    end
    object qryImovelXBemIMOMOEDAREAVAL: TFloatField
      FieldName = 'IMOMOEDAREAVAL'
    end
    object qryImovelXBemIMOVLRREAVAL: TFloatField
      FieldName = 'IMOVLRREAVAL'
    end
    object qryImovelXBemIMODATAREAVAL: TDateTimeField
      FieldName = 'IMODATAREAVAL'
    end
    object qryImovelXBemMOEDA_REAVAL: TStringField
      FieldName = 'MOEDA_REAVAL'
      Size = 10
    end
    object qryImovelXBemIMOMOEDAMERCADO: TFloatField
      FieldName = 'IMOMOEDAMERCADO'
    end
    object qryImovelXBemIMOVLRMERCADO: TFloatField
      FieldName = 'IMOVLRMERCADO'
    end
    object qryImovelXBemIMODATAMERCADO: TDateTimeField
      FieldName = 'IMODATAMERCADO'
    end
    object qryImovelXBemMOEDA_MERCADO: TStringField
      FieldName = 'MOEDA_MERCADO'
      Size = 10
    end
    object qryImovelXBemCONTROLE: TStringField
      FieldName = 'CONTROLE'
      FixedChar = True
      Size = 1
    end
    object qryImovelXBemBAIXATOTAL: TStringField
      FieldName = 'BAIXATOTAL'
      FixedChar = True
      Size = 1
    end
    object qryImovelXBemDTAINCLUSAO: TDateTimeField
      FieldName = 'DTAINCLUSAO'
    end
    object qryImovelXBemFLGDEPREC: TFloatField
      FieldName = 'FLGDEPREC'
    end
    object qryImovelXBemDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
    object qryImovelXBemDATAINICIODEP: TDateTimeField
      FieldName = 'DATAINICIODEP'
    end
    object qryImovelXBemTAXADEP: TFloatField
      FieldName = 'TAXADEP'
    end
    object qryImovelXBemIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryImovelXBemIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
    end
    object qryImovelXBemVALHISTORICO: TFloatField
      FieldName = 'VALHISTORICO'
    end
    object qryImovelXBemNOMEFORN: TStringField
      FieldName = 'NOMEFORN'
      Size = 60
    end
    object qryImovelXBemCODGRUPO: TStringField
      FieldName = 'CODGRUPO'
      FixedChar = True
      Size = 15
    end
    object qryImovelXBemDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryImovelXBemTIPOGRUPO: TStringField
      FieldName = 'TIPOGRUPO'
      FixedChar = True
      Size = 1
    end
    object qryImovelXBemCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object qryImovelXBemDESCCCUSTO: TStringField
      FieldName = 'DESCCCUSTO'
      Size = 30
    end
    object qryImovelXBemTIPOCCUSTO: TStringField
      FieldName = 'TIPOCCUSTO'
      FixedChar = True
      Size = 1
    end
    object qryImovelXBemCODCLASSEBEM: TStringField
      FieldName = 'CODCLASSEBEM'
      FixedChar = True
      Size = 15
    end
    object qryImovelXBemDESCCLASSEBEM: TStringField
      FieldName = 'DESCCLASSEBEM'
      Size = 60
    end
    object qryImovelXBemTIPOCLASSEBEM: TStringField
      FieldName = 'TIPOCLASSEBEM'
      FixedChar = True
      Size = 1
    end
    object qryImovelXBemDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object qryImovelXBemIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
    object qryImovelXBemDESCLOCAL: TStringField
      FieldName = 'DESCLOCAL'
      Size = 60
    end
    object qryImovelXBemNOMERESP: TStringField
      FieldName = 'NOMERESP'
      Size = 60
    end
    object qryImovelXBemSUMVALCTB: TFloatField
      FieldName = 'SUMVALCTB'
      DisplayFormat = '###,##0.00'
    end
    object qryImovelXBem_GRUPO: TStringField
      FieldKind = fkCalculated
      FieldName = '_GRUPO'
      Calculated = True
    end
  end
  object updImovelXBem: TUpdateSQL
    Left = 608
    Top = 208
  end
  object qryUpdImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   IMOVEL'
      'SET'
      '   IMOCODIGO = :PIMOCODIGO'
      'WHERE'
      '   IDIMOVEL = :PIDIMOVEL'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 73
    Top = 242
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIMOCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptInput
      end>
  end
end
