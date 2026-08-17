inherited frmExecReavaliacao: TfrmExecReavaliacao
  Left = 381
  Top = 147
  HelpContext = 540011
  Caption = 'Reavaliação de Imóveis'
  ClientHeight = 436
  ClientWidth = 737
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 737
    Height = 354
    object lblTitulo: TfcLabel
      Left = 16
      Top = 8
      Width = 265
      Height = 24
      Caption = 'Reavaliação de Imóveis [ ]'
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
      Width = 737
      Height = 321
      Align = alBottom
      TabOrder = 0
      OnPageChanged = ntbPrincipalPageChanged
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagSelecao'
        object Label7: TLabel
          Left = 440
          Top = 144
          Width = 137
          Height = 13
          Caption = 'Observações do Evento'
        end
        object Bevel2: TBevel
          Left = 16
          Top = 272
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object Label15: TLabel
          Left = 16
          Top = 95
          Width = 103
          Height = 13
          Caption = 'Data Reavaliação'
        end
        object Label1: TLabel
          Left = 16
          Top = 6
          Width = 100
          Height = 13
          Caption = 'Grupo de Imóveis'
        end
        object Bevel1: TBevel
          Left = 16
          Top = 88
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object Bevel4: TBevel
          Left = 16
          Top = 139
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object Label2: TLabel
          Left = 192
          Top = 95
          Width = 123
          Height = 13
          Caption = 'Valor da Reavaliação'
        end
        object Label3: TLabel
          Left = 368
          Top = 95
          Width = 47
          Height = 13
          Caption = 'Vida útil'
        end
        object Label4: TLabel
          Left = 440
          Top = 118
          Width = 37
          Height = 13
          Caption = 'Meses'
        end
        object Label8: TLabel
          Left = 16
          Top = 187
          Width = 140
          Height = 13
          Caption = 'Arquivo para Importação'
        end
        object Label9: TLabel
          Left = 568
          Top = 118
          Width = 134
          Height = 13
          Caption = 'no Cadastro de Imóveis'
        end
        object btnContinua1: TfcShapeBtn
          Left = 536
          Top = 284
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
          TabOrder = 6
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinua1Click
        end
        object btnAtualizar: TfcShapeBtn
          Left = 16
          Top = 284
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
          TabOrder = 5
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnAtualizarClick
        end
        object DBcboGrupo: TwwDBLookupCombo
          Left = 16
          Top = 20
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
        object meObsEvento: TMemo
          Left = 440
          Top = 159
          Width = 265
          Height = 104
          Lines.Strings = (
            '')
          MaxLength = 2000
          TabOrder = 4
        end
        object edtVlrReavalia: TRealEdit
          Left = 192
          Top = 110
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object DBspnVida: TwwDBSpinEdit
          Left = 368
          Top = 110
          Width = 65
          Height = 21
          Increment = 1
          Value = 1
          DataField = 'VIDAUTIL'
          DataSource = dsHistoricoVidaUtil
          TabOrder = 3
          UnboundDataType = wwDefault
        end
        object edtDataReavalia: TCMDateTimePicker
          Left = 16
          Top = 110
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
          TabOrder = 1
        end
        inline molFornecedor1: TmolFornecedor
          Left = 9
          Top = 144
          Width = 425
          TabOrder = 7
          inherited Label5: TLabel
            Width = 54
            Caption = 'Avaliador'
          end
          inherited btnBuscaForn: TBitBtn
            Left = 375                
            OnClick = molFornecedor1btnBuscaFornClick
          end
          inherited btnLimpaForn: TBitBtn
            Left = 399
          end
          inherited edtNomeFantasia: TEdit
            Width = 366
          end
          inherited edtRazaoSocial: TEdit
            Left = 23
            Width = 81
            Visible = False
          end
        end
        object edtArqImporta: TEdit
          Left = 16
          Top = 203
          Width = 368
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 8
        end
        object btnBuscaArq: TBitBtn
          Left = 384
          Top = 202
          Width = 24
          Height = 22
          Hint = 'Busca um Arquivo para Importação'
          TabOrder = 9
          OnClick = btnBuscaArqClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555555555555555555555555555555555555555555555555555555555
            555555555555555555555555555555555555555FFFFFFFFFF555550000000000
            55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
            B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
            000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
            555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
            55555575FFF75555555555700007555555555557777555555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
        end
        object btnLimpaArq: TBitBtn
          Left = 408
          Top = 202
          Width = 24
          Height = 22
          Hint = 'Limpa a seleção de Arquivo para Importação'
          TabOrder = 10
          OnClick = btnLimpaArqClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888FF8888888888888008888888888888F77F8888888888800F08888
            8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
            88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
            888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
            0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
            03088878F88878F878788887F8888090B03088878F888787878788887888880B
            0B038888788888787878888888888880B0B38888888888878788888888888888
            0BBB88888888888878F888888888888880BB8888888888888788}
          NumGlyphs = 2
        end
        object cbRegistraImovel: TCheckBox
          Left = 548
          Top = 101
          Width = 169
          Height = 17
          Caption = 'Registra a Reavaliação'
          Checked = True
          State = cbChecked
          TabOrder = 11
        end
        object rgLayout: TRadioGroup
          Left = 16
          Top = 230
          Width = 225
          Height = 37
          Caption = 'Layout de Importação'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Por Imóvel'
            'Por Bem')
          TabOrder = 12
        end
        object cbReavCommit: TCheckBox
          Left = 257
          Top = 242
          Width = 169
          Height = 17
          Caption = 'Grava a cada reavaliação'
          Checked = True
          State = cbChecked
          TabOrder = 13
        end
        inline molImovelouMestre1: TmolImovelouMestre
          Left = 8
          Top = 40
          Width = 609
          TabOrder = 14
          inherited edtImovel: TEdit
            Width = 489
          end
          inherited btnBuscaImovel: TBitBtn
            Left = 496
            OnClick = molImovelouMestre1btnBuscaImovelClick
          end
          inherited btnLimpaImovel: TBitBtn
            Left = 520
          end
        end
        object rgMetodoReav: TRadioGroup
          Left = 563
          Top = 13
          Width = 161
          Height = 65
          Caption = 'Método'
          Enabled = False
          ItemIndex = 1
          Items.Strings = (
            '1 - Mantém o Custo'
            '2 - Baixa custo ')
          TabOrder = 15
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagImporta'
        object Bevel7: TBevel
          Left = 16
          Top = 272
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object btnVoltar4: TfcShapeBtn
          Left = 440
          Top = 284
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
          TabOrder = 0
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnVoltar4Click
        end
        object btnContinuar4: TfcShapeBtn
          Left = 536
          Top = 284
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
          TabOrder = 1
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuar4Click
        end
        object Panel5: TPanel
          Left = 16
          Top = 8
          Width = 705
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Log de Importação'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object memLog: TMemo
          Left = 17
          Top = 34
          Width = 701
          Height = 231
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 3
        end
        object btnSalvar: TfcShapeBtn
          Left = 18
          Top = 284
          Width = 89
          Height = 29
          Caption = 'Salvar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
            FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
            FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
            007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
            7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
            99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
            99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
            99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
            93337FFFF7737777733300000033333333337777773333333333}
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 4
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnSalvarClick
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagImoveis'
        object Bevel5: TBevel
          Left = 16
          Top = 272
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object Label5: TLabel
          Left = 16
          Top = 277
          Width = 127
          Height = 13
          Caption = 'Total da Reavaliação:'
        end
        object Label6: TLabel
          Left = 176
          Top = 277
          Width = 105
          Height = 13
          Caption = 'Total dos Imóveis:'
        end
        object Panel1: TPanel
          Left = 16
          Top = 8
          Width = 705
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Imóveis para Reavaliação'
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
          Left = 18
          Top = 34
          Width = 700
          Height = 200
          Selected.Strings = (
            'IMOVEL_EXTENSO'#9'57'#9'Imóvel'#9'T'
            'VLR_CONTABIL'#9'14'#9'Valor Contábil'#9'T'
            'PERCENTUAL'#9'12'#9'Percentual'#9'F'
            'VLR_REAVALIA'#9'16'#9'Valor Reavaliação'#9'F'
            'VIDAUTIL'#9'8'#9'Vida Útil'#9'F')
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
          IndicatorColor = icBlack
          OnTopRowChanged = dbgImovelTopRowChanged
          OnFieldChanged = dbgImovelFieldChanged
        end
        object btnVoltar: TfcShapeBtn
          Left = 440
          Top = 284
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
        object btnContinua2: TfcShapeBtn
          Left = 536
          Top = 284
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
          TabOrder = 3
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinua2Click
        end
        object edtTotReavalia: TRealEdit
          Left = 16
          Top = 293
          Width = 137
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = 12648447
          Enabled = False
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 4
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object edtTotImovel: TRealEdit
          Left = 176
          Top = 293
          Width = 129
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = 12648447
          Enabled = False
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 5
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object fcShapeBtn4: TfcShapeBtn
          Left = 631
          Top = 10
          Width = 89
          Height = 25
          AllowAllUp = True
          Caption = 'Atualizar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
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
          OnClick = fcShapeBtn4Click
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagBens'
        object Bevel3: TBevel
          Left = 16
          Top = 272
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object dbgBens: TwwDBGrid
          Left = 32
          Top = 35
          Width = 705
          Height = 200
          Selected.Strings = (
            'DESBEM'#9'55'#9'Descrição do Bem'#9'T'
            'VLR_CONTABIL'#9'13'#9'Valor Contábil'#9'T'
            'PERCENTUAL'#9'11'#9'Percentual'#9'F'
            'VLR_REAVALIA'#9'15'#9'Valor Reavaliação'#9'F'
            'VIDAUTIL'#9'8'#9'Vida Útil'#9'F'
            'ACAO'#9'4'#9'Ação'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsBem
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
          OnCalcCellColors = dbgImovelCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = dbgImovelTopRowChanged
          OnFieldChanged = dbgBensFieldChanged
        end
        object btnVoltar2: TfcShapeBtn
          Left = 440
          Top = 284
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
          TabOrder = 1
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnVoltar4Click
        end
        object Panel3: TPanel
          Left = 16
          Top = 8
          Width = 705
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Bens para Reavaliação'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object fcShapeBtn1: TfcShapeBtn
            Left = 616
            Top = 2
            Width = 89
            Height = 25
            AllowAllUp = True
            Caption = 'Atualizar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
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
            TabOrder = 0
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = fcShapeBtn1Click
          end
        end
        object btnContinua3: TfcShapeBtn
          Left = 536
          Top = 284
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
          TabOrder = 0
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinua3Click
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagGrupos'
        object Bevel6: TBevel
          Left = 16
          Top = 272
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object Panel4: TPanel
          Left = 16
          Top = 8
          Width = 705
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Grupos Contábeis para Reavaliação'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dbgGrupos: TwwDBGrid
          Left = 16
          Top = 35
          Width = 705
          Height = 225
          Selected.Strings = (
            'DESCGRUPO'#9'70'#9'Grupo Contábil'#9'T'
            'VLR_REAVALIA'#9'24'#9'Valor de Reavaliação'#9'T'
            'PERCENTUAL'#9'15'#9'Percentual'#9'T')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsGrupos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
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
          IndicatorColor = icBlack
          OnTopRowChanged = dbgImovelTopRowChanged
        end
        object btnVoltar3: TfcShapeBtn
          Left = 440
          Top = 284
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
          OnClick = btnVoltar4Click
        end
        object btnConfirmar: TfcShapeBtn
          Left = 632
          Top = 284
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
  inherited Dock971: TDock97
    Top = 403
    Width = 737
    inherited tb97Fundo: TToolbar97
      Left = 565
      DockPos = 613
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 354
    Width = 737
    Height = 49
    Align = alBottom
    TabOrder = 2
    object lblProgress: TLabel
      Left = 16
      Top = 10
      Width = 140
      Height = 13
      Caption = 'Gerando Lançamentos...'
      Visible = False
    end
    object lblContador: TLabel
      Left = 628
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
      Width = 705
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 0
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 1011
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object qryBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '   VW.IDIMOVEL, VW.IMOVEL_EXTENSO, VW.IDBEM, VW.DESBEM, VW.IXBGR' +
        'UPO, VW.IDGRUPO, VW.CODTIPIMOVEL,'
      '   0 AS PERCENTUAL,'
      '   0 AS VLR_CONTABIL,'
      '   0.00 AS VLR_REAVALIA,'
      '   0 AS VIDAUTIL,'
      '   0 AS IDAVALIADOR,'
      '   0 AS IDCONJUNTO,'
      '   0 AS ALT,'
      '   '#39'R'#39' AS ACAO'
      'FROM'
      '   VWBEMXIMOVEL VW,'
      '   GRUPOXIMOVEL GI'
      'WHERE'
      '       ( VW.IDIMOVEL = GI.IDIMOVEL(+) )'
      '   AND ( VW.FLGATIVO = 1 )'
      '   AND ( VW.BAIXATOTAL = '#39'N'#39' )'
      
        '   AND ( (:PIDIMOVELMESTRE IS NULL) OR (VW.IDIMOVELMESTRE =:PIDI' +
        'MOVELMESTRE) )'
      
        '   AND ( (:PIDIMOVEL IS NULL)       OR (VW.IDIMOVEL =:PIDIMOVEL)' +
        ' )'
      
        '   AND ( (:PIDGRUPORATEIO  IS NULL) OR (GI.IDGRUPORATEIO =:PIDGR' +
        'UPORATEIO) )'
      
        '   AND ( (:PIDPESSOA IS NULL)       OR (VW.IDPESSOA =:PIDPESSOA)' +
        ' )'
      '   AND ( (:PVAZIA IS NULL)          OR (1=2) )'
      ''
      'ORDER BY'
      '   VW.IMOVEL_EXTENSO, VW.DESBEM'
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
    UpdateObject = updBem
    ValidateWithMask = True
    Left = 432
    Top = 120
    ParamData = <
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
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PVAZIA'
        ParamType = ptUnknown
      end>
    object qryBemDESBEM: TStringField
      DisplayLabel = 'Descrição do Bem'
      DisplayWidth = 60
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryBemPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 11
      FieldName = 'PERCENTUAL'
      DisplayFormat = '##0.0000%'
    end
    object qryBemVIDAUTIL: TFloatField
      DisplayLabel = 'Vida Útil'
      DisplayWidth = 8
      FieldName = 'VIDAUTIL'
    end
    object qryBemIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object qryBemIDBEM: TFloatField
      FieldName = 'IDBEM'
      Visible = False
    end
    object qryBemIXBGRUPO: TStringField
      FieldName = 'IXBGRUPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryBemIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryBemCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryBemALT: TFloatField
      FieldName = 'ALT'
      OnChange = qryBemALTChange
    end
    object qryBemVLR_CONTABIL: TFloatField
      DisplayLabel = 'Valor Contábil'
      FieldName = 'VLR_CONTABIL'
      DisplayFormat = '###,##0.00'
    end
    object qryBemVLR_REAVALIA: TFloatField
      DisplayLabel = 'Valor Reavaliação'
      FieldName = 'VLR_REAVALIA'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object qryBemIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryBemIDAVALIADOR: TFloatField
      FieldName = 'IDAVALIADOR'
    end
    object qryBemACAO: TStringField
      FieldName = 'ACAO'
      FixedChar = True
      Size = 1
    end
    object qryBemIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
  end
  object dsBem: TwwDataSource
    DataSet = cdsBem
    Left = 432
    Top = 137
  end
  object updBem: TUpdateSQL
    Left = 432
    Top = 156
  end
  object qryImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT DISTINCT'
      '   I.IDIMOVEL,'
      '   IM.IMONOME || '#39' - '#39' || I.IMONOME AS IMOVEL_EXTENSO,'
      '   0 AS PERCENTUAL,'
      '   0 AS VLR_CONTABIL,'
      '   0 AS VLR_REAVALIA,'
      '   0 AS VIDAUTIL,'
      '   0 AS ALT'
      'FROM'
      '   IMOVEL I,'
      '   IMOVEL IM,'
      '   GRUPOXIMOVEL GI'
      'WHERE'
      '       ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '   AND ( I.FLGATIVO = 1 )'
      '   AND ( I.IDIMOVEL = GI.IDIMOVEL(+) )'
      
        '   AND ( (:PIDPESSOA IS NULL)       OR (I.IDPESSOA =:PIDPESSOA) ' +
        ')'
      
        '   AND ( (:PIDIMOVELMESTRE IS NULL) OR (I.IDIMOVELMESTRE =:PIDIM' +
        'OVELMESTRE) )'
      
        '   AND ( (:PIDIMOVEL IS NULL)       OR (I.IDIMOVEL =:PIDIMOVEL) ' +
        ')'
      
        '   AND ( (:PIDGRUPORATEIO  IS NULL) OR (GI.IDGRUPORATEIO =:PIDGR' +
        'UPORATEIO) )'
      '   AND ( (:PVAZIA IS NULL)          OR (1=2) )'
      ''
      'ORDER BY'
      '   IMOVEL_EXTENSO')
    UpdateObject = updImovel
    ValidateWithMask = True
    Left = 368
    Top = 120
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
        DataType = ftString
        Name = 'PVAZIA'
        ParamType = ptUnknown
      end>
    object qryImovelIMOVEL_EXTENSO: TStringField
      DisplayLabel = 'Imóvel'
      DisplayWidth = 58
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryImovelPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 12
      FieldName = 'PERCENTUAL'
      DisplayFormat = '##0.0000%'
    end
    object qryImovelVLR_REAVALIA: TFloatField
      DisplayLabel = 'Valor Reavaliação'
      DisplayWidth = 16
      FieldName = 'VLR_REAVALIA'
      DisplayFormat = '###,##0.00'
    end
    object qryImovelVIDAUTIL: TFloatField
      DisplayLabel = 'Vida Útil'
      DisplayWidth = 8
      FieldName = 'VIDAUTIL'
    end
    object qryImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object qryImovelALT: TFloatField
      FieldName = 'ALT'
      OnChange = qryImovelALTChange
    end
    object qryImovelVLR_CONTABIL: TFloatField
      DisplayLabel = 'Valor Contábil'
      FieldName = 'VLR_CONTABIL'
      DisplayFormat = '###,##0.00'
    end
  end
  object dsImovel: TwwDataSource
    DataSet = cdsImovel
    Left = 368
    Top = 138
  end
  object updImovel: TUpdateSQL
    Left = 368
    Top = 156
  end
  object qryGrupos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'                                                        ' +
        '    '#39' AS DESCGRUPO,'
      '       0 AS VLR_REAVALIA,'
      '       0 AS PERCENTUAL'
      'FROM   DUAL'
      'WHERE  1=2'
      ''
      ' '
      ' ')
    UpdateObject = updGrupos
    ValidateWithMask = True
    Left = 508
    Top = 64
    object qryGruposVLR_REAVALIA: TFloatField
      DisplayLabel = 'Valor de Reavaliação'
      DisplayWidth = 10
      FieldName = 'VLR_REAVALIA'
      DisplayFormat = '###,##0.00'
    end
    object qryGruposPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 10
      FieldName = 'PERCENTUAL'
      DisplayFormat = '##0.0000%'
    end
    object qryGruposDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      FixedChar = True
      Size = 60
    end
  end
  object dsGrupos: TwwDataSource
    DataSet = qryGrupos
    Left = 508
    Top = 50
  end
  object updGrupos: TUpdateSQL
    Left = 508
    Top = 36
  end
  object dlgImporta: TOpenDialog
    Filter = 'Arquivo Texto ( *.txt )|*.txt'
    Left = 345
    Top = 304
  end
  object qryUpdImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'UPDATE IMOVEL'
      '   SET IMODATAREAVAL  = :pDATAREAVAL,'
      '       IMOVLRREAVAL   = :pVLRREAVAL,'
      '       IMOMOEDAREAVAL = :pIDMOEDA'
      ' WHERE IDIMOVEL = :pIDIMOVEL'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 184
    Top = 133
    ParamData = <
      item
        DataType = ftDate
        Name = 'pDATAREAVAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pVLRREAVAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDMOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayLabel = 'Imóvel'
      DisplayWidth = 58
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 12
      FieldName = 'PERCENTUAL'
      DisplayFormat = '##0.0000%'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Valor Reavaliação'
      DisplayWidth = 16
      FieldName = 'VLR_REAVALIA'
      DisplayFormat = '###,##0.00'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Vida Útil'
      DisplayWidth = 8
      FieldName = 'VIDAUTIL'
    end
    object FloatField4: TFloatField
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object FloatField5: TFloatField
      FieldName = 'ALT'
      OnChange = qryImovelALTChange
    end
    object FloatField6: TFloatField
      DisplayLabel = 'Valor Contábil'
      FieldName = 'VLR_CONTABIL'
      DisplayFormat = '###,##0.00'
    end
  end
  object dspBem: TDataSetProvider
    DataSet = qryBem
    Constraints = True
    Left = 432
    Top = 173
  end
  object cdsBem: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESBEM'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'PERCENTUAL'
        DataType = ftFloat
      end
      item
        Name = 'VIDAUTIL'
        DataType = ftFloat
      end
      item
        Name = 'IDIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDBEM'
        DataType = ftFloat
      end
      item
        Name = 'IXBGRUPO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IDGRUPO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPIMOVEL'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ALT'
        DataType = ftFloat
      end
      item
        Name = 'VLR_CONTABIL'
        DataType = ftFloat
      end
      item
        Name = 'VLR_REAVALIA'
        DataType = ftFloat
      end
      item
        Name = 'IMOVEL_EXTENSO'
        DataType = ftString
        Size = 123
      end
      item
        Name = 'IDAVALIADOR'
        DataType = ftFloat
      end
      item
        Name = 'ACAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IDCONJUNTO'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsBemInd1'
        Fields = 'IMOVEL_EXTENSO; IDIMOVEL'
      end>
    IndexName = 'cdsBemInd1'
    Params = <>
    ProviderName = 'dspBem'
    StoreDefs = True
    Left = 432
    Top = 191
    object cdsBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object cdsBemPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      DisplayFormat = '##0.0000%'
      EditFormat = '##0.0000%'
    end
    object cdsBemVIDAUTIL: TFloatField
      FieldName = 'VIDAUTIL'
    end
    object cdsBemIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsBemIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object cdsBemIXBGRUPO: TStringField
      FieldName = 'IXBGRUPO'
      FixedChar = True
      Size = 1
    end
    object cdsBemIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object cdsBemCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object cdsBemALT: TFloatField
      FieldName = 'ALT'
      OnChange = qryBemALTChange
    end
    object cdsBemVLR_CONTABIL: TFloatField
      FieldName = 'VLR_CONTABIL'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object cdsBemVLR_REAVALIA: TFloatField
      FieldName = 'VLR_REAVALIA'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object cdsBemIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object cdsBemIDAVALIADOR: TFloatField
      FieldName = 'IDAVALIADOR'
    end
    object cdsBemACAO: TStringField
      FieldName = 'ACAO'
      FixedChar = True
      Size = 1
    end
    object cdsBemIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
  end
  object dlgLogErro: TSaveDialog
    DefaultExt = 'TXT'
    Filter = 'Arquivo Texto ( *.txt )|*.txt'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 401
    Top = 304
  end
  object dspImovel: TDataSetProvider
    DataSet = qryImovel
    Constraints = True
    Left = 368
    Top = 173
  end
  object cdsImovel: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IMOVEL_EXTENSO'
        DataType = ftString
        Size = 123
      end
      item
        Name = 'PERCENTUAL'
        DataType = ftFloat
      end
      item
        Name = 'VLR_REAVALIA'
        DataType = ftFloat
      end
      item
        Name = 'VIDAUTIL'
        DataType = ftFloat
      end
      item
        Name = 'IDIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'ALT'
        DataType = ftFloat
      end
      item
        Name = 'VLR_CONTABIL'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsImovelInd1'
        Fields = 'IMOVEL_EXTENSO; IDIMOVEL'
        Options = [ixUnique]
      end>
    IndexName = 'cdsImovelInd1'
    Params = <>
    ProviderName = 'dspImovel'
    StoreDefs = True
    Left = 320
    Top = 223
    object cdsImovelIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object cdsImovelPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      DisplayFormat = '##0.0000%'
      EditFormat = '##0.0000%'
    end
    object cdsImovelVLR_REAVALIA: TFloatField
      DisplayLabel = 'Reavaliação'
      FieldName = 'VLR_REAVALIA'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object cdsImovelVIDAUTIL: TFloatField
      FieldName = 'VIDAUTIL'
    end
    object cdsImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsImovelALT: TFloatField
      FieldName = 'ALT'
    end
    object cdsImovelVLR_CONTABIL: TFloatField
      DisplayLabel = 'Valor Contábil'
      FieldName = 'VLR_CONTABIL'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
  end
  object dsHistoricoVidaUtil: TwwDataSource
    DataSet = cdsHistoricoVidaUtil
    Left = 320
    Top = 392
  end
  object cdsHistoricoVidaUtil: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'VIDAUTIL'
        DataType = ftFloat
      end
      item
        Name = 'TXDEP_ANO'
        DataType = ftFloat
      end
      item
        Name = 'TXDEP_MES'
        DataType = ftFloat
      end
      item
        Name = 'VIGENTE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IDIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'HIST_EVENTO'
        DataType = ftString
        Size = 32
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 352
    Top = 387
    object cdsHistoricoVidaUtilVIDAUTIL: TFloatField
      FieldName = 'VIDAUTIL'
    end
    object cdsHistoricoVidaUtilTXDEP_ANO: TFloatField
      FieldName = 'TXDEP_ANO'
    end
    object cdsHistoricoVidaUtilTXDEP_MES: TFloatField
      FieldName = 'TXDEP_MES'
    end
    object cdsHistoricoVidaUtilVIGENTE: TStringField
      FieldName = 'VIGENTE'
    end
    object cdsHistoricoVidaUtilTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object cdsHistoricoVidaUtilTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
    end
    object cdsHistoricoVidaUtilHistVidaUtilIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsHistoricoVidaUtilHIST_EVENTO: TStringField
      FieldName = 'HIST_EVENTO'
      Size = 32
    end
  end
end
