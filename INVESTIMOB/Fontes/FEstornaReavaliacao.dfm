inherited frmEstornaReavaliacao: TfrmEstornaReavaliacao
  Left = 271
  Top = 196
  HelpContext = 540012
  Caption = 'Desfazer Reavaliação'
  ClientHeight = 432
  ClientWidth = 691
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 184
    Top = 138
    Width = 103
    Height = 13
    Caption = 'Data Reavaliação'
  end
  inherited pnlFundo: TPanel
    Width = 691
    Height = 399
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 691
      Height = 350
      Align = alClient
      TabOrder = 0
      object lblTitulo: TfcLabel
        Left = 16
        Top = 8
        Width = 360
        Height = 24
        Caption = 'Desfazer Reavaliação de Imóveis [ ]'
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
        Left = 1
        Top = 40
        Width = 689
        Height = 309
        Align = alBottom
        TabOrder = 0
        OnPageChanged = ntbPrincipalPageChanged
        object TPage
          Left = 0
          Top = 0
          Caption = 'pagSelecao'
          object Bevel2: TBevel
            Left = 16
            Top = 256
            Width = 706
            Height = 3
            Shape = bsTopLine
          end
          object Label15: TLabel
            Left = 24
            Top = 187
            Width = 103
            Height = 13
            Caption = 'Data Reavaliação'
          end
          object Label1: TLabel
            Left = 16
            Top = 10
            Width = 100
            Height = 13
            Caption = 'Grupo de Imóveis'
          end
          object Bevel4: TBevel
            Left = 16
            Top = 153
            Width = 706
            Height = 3
            Shape = bsTopLine
          end
          object Label3: TLabel
            Left = 232
            Top = 187
            Width = 93
            Height = 13
            Caption = 'Data do Estorno'
          end
          object Label9: TLabel
            Left = 449
            Top = 221
            Width = 134
            Height = 13
            Caption = 'no Cadastro de Imóveis'
          end
          object btnContinua: TfcShapeBtn
            Left = 480
            Top = 268
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
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 7
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnContinuaClick
          end
          object btnAtualizar: TfcShapeBtn
            Left = 24
            Top = 268
            Width = 89
            Height = 29
            Caption = 'Atualizar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              888888888888FFFFFF88888800008888844444488888888F88F7777778F88888
              000024884222222448888877FF788888877F888800002244222222222488887F
              7788FFFFF887F8880000222222AAAAA22248887F888F77777F887F8800002222
              2A88888A2224887F88F7888887F887F80000222228888888A224887F8878F888
              887FF7F80000222222888888A444887FFFF78F88887777880000AAAAAAA88888
              8888887777777888888888880000888888888888888888888888888888FFFFFF
              00008888888888844444488FFFF888888777777F0000A444888888A222224877
              77F888887F88887F0000A2248888888A2222487F878F888887F8887F00008A22
              48888844222248878878FFFF7788887F00008A222444442222224887F8877777
              888FF87F000088A2222222222AA248887FF888888FF77F780000888AA222222A
              A88A8888877FFFFFF7788788000088888AAAAAA8888888888887777778888888
              0000}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 6
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnAtualizarClick
          end
          object DBcboGrupo: TwwDBLookupCombo
            Left = 16
            Top = 24
            Width = 273
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'GRRDESCRICAO'#9'60'#9'Descrição')
            LookupTable = dtmLookImobiliario.qryLookGrupoRateio
            LookupField = 'IDGRUPORATEIO'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnCloseUp = DBcboGrupoCloseUp
          end
          inline molImovelouMestre1: TmolImovelouMestre
            Left = 8
            Top = 49
            Width = 657
            TabOrder = 1
            inherited edtImovel: TEdit
              Width = 481
            end
            inherited btnBuscaImovel: TBitBtn
              Left = 488
              OnClick = molImovelouMestre1btnBuscaImovelClick
            end
            inherited btnLimpaImovel: TBitBtn
              Left = 512
            end
          end
          object edtDataEstorno: TCMDateTimePicker
            Left = 232
            Top = 204
            Width = 113
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
            ParentShowHint = False
            ShowHint = True
            ShowButton = True
            TabOrder = 4
          end
          inline molFornecedor1: TmolFornecedor
            Left = 9
            Top = 97
            Width = 624
            Height = 48
            TabOrder = 2
            inherited Label5: TLabel
              Width = 54
              Caption = 'Avaliador'
            end
            inherited btnBuscaForn: TBitBtn
              Left = 488
            end
            inherited btnLimpaForn: TBitBtn
              Left = 512
            end
            inherited edtNomeFantasia: TEdit
              Width = 273
            end
            inherited edtRazaoSocial: TEdit
              Left = 280
              Width = 209
            end
          end
          object edtDataReavalia: TCMDateTimePicker
            Left = 24
            Top = 204
            Width = 113
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
            TabOrder = 3
          end
          object cbApagaImovel: TCheckBox
            Left = 430
            Top = 204
            Width = 195
            Height = 17
            Caption = 'Apaga a última Reavaliação'
            Checked = True
            State = cbChecked
            TabOrder = 5
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'pagImoveis'
          object Bevel1: TBevel
            Left = 16
            Top = 256
            Width = 658
            Height = 3
            Shape = bsTopLine
          end
          object btnSeleciona: TSpeedButton
            Left = 23
            Top = 267
            Width = 119
            Height = 30
            Hint = 'Marca todos os Imóveis para estorno'
            Caption = 'Seleciona Todas'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
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
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btnSelecionaClick
          end
          object btnLimpa: TSpeedButton
            Left = 153
            Top = 267
            Width = 119
            Height = 30
            Hint = 'Desmarca todos os Imóveis para estorno'
            Caption = 'Desmaca Todas'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
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
            NumGlyphs = 2
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btnLimpaClick
          end
          object Panel2: TPanel
            Left = 16
            Top = 8
            Width = 657
            Height = 27
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Imóveis para Estorno'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object dbgImovel: TwwDBGrid
            Left = 16
            Top = 35
            Width = 657
            Height = 214
            Selected.Strings = (
              'ESTORNA'#9'5'#9#9'F'
              'IMOVEL_EXTENSO'#9'77'#9'Imóvel'#9'T'
              'DATAREAVALIACAO'#9'19'#9'Data Reavaliação'#9'T')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsImovel
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            KeyOptions = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'Small Fonts'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            OnCalcCellColors = dbgImovelCalcCellColors
            OnDblClick = dbgImovelDblClick
            IndicatorColor = icBlack
            OnTopRowChanged = dbgImovelTopRowChanged
          end
          object btnVoltar: TfcShapeBtn
            Left = 384
            Top = 268
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
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
              88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
              B08887F8888F888887F887FBBB0BBBBBB0888788887F8888878F7FBBB00BBBBB
              BB087F88877FFFFFF87F7FBB00000000BB087F8877777777F87F7FB000000000
              BB087F8777777777F87F7FBB00000000BB087F8877777777887F7FBBB00BBBBB
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
            OnClick = btnVoltarClick
          end
          object btnConfirmar: TfcShapeBtn
            Left = 576
            Top = 268
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
            TabOrder = 3
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnConfirmarClick
          end
        end
      end
    end
    object pProgress: TPanel
      Left = 0
      Top = 350
      Width = 691
      Height = 49
      Align = alBottom
      TabOrder = 1
      object lblProgress: TLabel
        Left = 16
        Top = 10
        Width = 140
        Height = 13
        Caption = 'Gerando Lançamentos...'
        Visible = False
      end
      object lblContador: TLabel
        Left = 580
        Top = 10
        Width = 93
        Height = 13
        Alignment = taRightJustify
        Caption = '00000 de 00000'
        Visible = False
      end
      object ProgressBar: TProgressBar
        Left = 16
        Top = 24
        Width = 657
        Height = 16
        Min = 0
        Max = 100
        Step = 1
        TabOrder = 0
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 399
    Width = 691
    inherited tb97Fundo: TToolbar97
      Left = 421
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  object qryImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT DISTINCT'
      '   I.IDIMOVEL,'
      '   IM.IMONOME || '#39' - '#39' || I.IMONOME AS IMOVEL_EXTENSO,'
      '   R.DATAREAVALIACAO,'
      '   R.IDAVALIADOR,'
      '   P.RAZAOSOCIAL,'
      '   1 AS ESTORNA'
      'FROM'
      '   IMOVEL I,'
      '   IMOVEL IM,'
      '   PESSOA P,'
      '   GRUPOXIMOVEL GI,'
      '   REAVALIAXREAVALIA R'
      'WHERE'
      
        '       ( (:PIDPESSOA IS NULL)        OR (I.IDPESSOA = :PIDPESSOA' +
        ') )'
      
        '   AND ( (:PIDIMOVELMESTRE IS NULL)  OR (I.IDIMOVELMESTRE = :PID' +
        'IMOVELMESTRE) )'
      
        '   AND ( (:PIDIMOVEL IS NULL)        OR (I.IDIMOVEL = :PIDIMOVEL' +
        ') )'
      
        '   AND ( (:PIDGRUPORATEIO  IS NULL)  OR (GI.IDGRUPORATEIO = :PID' +
        'GRUPORATEIO) )'
      
        '   AND ( (:PIDAVALIADOR IS NULL)     OR (R.IDAVALIADOR = :PIDAVA' +
        'LIADOR) )'
      
        '   AND ( (:PDATAREAVALIACAO IS NULL) OR (R.DATAREAVALIACAO = :PD' +
        'ATAREAVALIACAO) )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '   AND ( I.IDIMOVEL = GI.IDIMOVEL(+) )'
      '   AND ( R.IDAVALIADOR = P.IDPESSOA(+) )'
      '   AND ( R.IDIMOVEL = I.IDIMOVEL )'
      ''
      'ORDER BY'
      '   IM.IMONOME || '#39' - '#39' || I.IMONOME'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    UpdateObject = updImovel
    ControlType.Strings = (
      'ESTORNA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 168
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPORATEIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPORATEIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDAVALIADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDAVALIADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAREAVALIACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAREAVALIACAO'
        ParamType = ptUnknown
      end>
    object qryImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryImovelIMOVEL_EXTENSO: TStringField
      DisplayLabel = 'Nome do Imóvel'
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryImovelDATAREAVALIACAO: TDateTimeField
      DisplayLabel = 'Data Reavaliação'
      FieldName = 'DATAREAVALIACAO'
    end
    object qryImovelESTORNA: TFloatField
      FieldName = 'ESTORNA'
    end
    object qryImovelIDAVALIADOR: TFloatField
      FieldName = 'IDAVALIADOR'
    end
    object qryImovelRAZAOSOCIAL: TStringField
      DisplayLabel = 'Avaliador'
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
  end
  object dsImovel: TwwDataSource
    DataSet = qryImovel
    Left = 200
    Top = 266
  end
  object updImovel: TUpdateSQL
    Left = 184
    Top = 220
  end
  object qryEstornaBaixa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT DISTINCT IXB.IDBEM'
      '  FROM IMOVELXBEM IXB, BEM B, HISTORICOMOVIMENTACAO H'
      ' WHERE IXB.IDBEM = B.IDBEM'
      '   AND B.IDBEM = H.IDBEM'
      '   AND B.BAIXATOTAL = '#39'S'#39
      '   AND H.IDTIPOMOVIMENTACAO IN(6,24)'
      '   AND H.DATAMOVIMENTACAO = :PDATABAIXA'
      '   AND IXB.IDIMOVEL = :PIDIMOVEL   ')
    ControlType.Strings = (
      'ESTORNA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 595
    Top = 136
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PDATABAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end>
    object qryEstornaBaixaIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
  end
  object qryEstornaInc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IB.IDIMOVEL, IB.IDBEM'
      'FROM'
      '   IMOVEL I, IMOVELXBEM IB, BEM B'
      'WHERE'
      '   IB.IDBEM = B.IDBEM'
      '   AND (NVL(B.BAIXATOTAL,'#39'N'#39') = '#39'N'#39')'
      '   AND (I.IDIMOVEL = IB.IDIMOVEL)'
      '   AND ( (:PIDIMOVEL IS NULL) OR (IB.IDIMOVEL = :PIDIMOVEL) )'
      
        '   AND ( (:PDATAINCLUSAO IS NULL) OR (B.DTAINCLUSAO = :PDATAINCL' +
        'USAO) )'
      '   AND ('
      '         (B.IDBEM NOT IN (SELECT DISTINCT IDBEM'
      '                          FROM REAVALIACAO'
      
        '                          WHERE DATAREAVALIACAO = :PDATAINCLUSAO' +
        ')'
      '         )'
      '        OR'
      '         (B.IDBEM IN (SELECT DISTINCT R.IDBEM'
      '                      FROM REAVALIACAO R, BEM B'
      '                      WHERE R.DATAREAVALIACAO = :PDATAINCLUSAO'
      '                      AND NVL(B.VALHISTORICO,0) = 0'
      '                      AND B.IDBEM = R.IDBEM'
      '                      AND B.DTAINCLUSAO = R.DATAREAVALIACAO)'
      '         )'
      '       )'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 593
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINCLUSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINCLUSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINCLUSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINCLUSAO'
        ParamType = ptUnknown
      end>
    object qryEstornaIncIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryEstornaIncIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
  end
  object cdsVerificaTipoReaval: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 280
  end
  object sqlVerificaTipoReaval: TCMSqlParams
    SQL.Strings = (
      'SELECT IDMOVIMENTACAO'
      'FROM HISTORICOMOVIMENTACAO'
      'WHERE IDBEM = :IDBEM'
      '  AND DATAMOVIMENTACAO = :DATAMOV'
      '  AND IDTIPOMOVIMENTACAO >= 81 AND IDTIPOMOVIMENTACAO <= 94'
      '  AND IDPESSOA = :IDPESSOA'
      '')
    ClientDataSet = cdsVerificaTipoReaval
    Left = 312
    Top = 266
  end
end
