inherited frmExecAgrupaDocumentoNovo: TfrmExecAgrupaDocumentoNovo
  Left = 32
  Top = 63
  HelpContext = 640002
  Caption = 'Agrupa Documentos'
  ClientWidth = 736
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 736
    inherited lblTitulo: TfcLabel
      Width = 319
      Caption = 'Agrupa Documentos [ seleção ]'
    end
    object ntbPrincipal: TNotebook
      Left = 0
      Top = 33
      Width = 736
      Height = 321
      Align = alBottom
      TabOrder = 0
      OnPageChanged = ntbPrincipalPageChanged
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagSelecao'
        object Label22: TLabel
          Left = 416
          Top = 26
          Width = 111
          Height = 13
          Caption = 'Forma de Cobrança'
        end
        object Label5: TLabel
          Left = 24
          Top = 214
          Width = 98
          Height = 13
          Caption = 'Data Vencimento'
        end
        object btnContinuaSelecao: TfcShapeBtn
          Left = 536
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
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 0
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuaSelecaoClick
        end
        object btnAtualizar: TfcShapeBtn
          Left = 16
          Top = 280
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
          Enabled = False
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
            33333333333F8888883F33330000324334222222443333388F3833333388F333
            000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
            F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
            223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
            3338888300003AAAAAAA33333333333888888833333333330000333333333333
            333333333333333333FFFFFF000033333333333344444433FFFF333333888888
            00003A444333333A22222438888F333338F3333800003A2243333333A2222438
            F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
            22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
            33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
            3333333333338888883333330000333333333333333333333333333333333333
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
          TabOrder = 1
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          Visible = False
        end
        inline molContrato1: TmolContrato
          Left = 16
          Top = 80
          TabOrder = 2
        end
        inline MolResponsavel1: TmolResponsavel
          Left = 16
          Top = 24
          Width = 385
          TabOrder = 3
          inherited btnAbrePessoa: TBitBtn
            Left = 256
            Visible = False
          end
        end
        object DBcboPortadorForma: TwwDBLookupCombo
          Left = 416
          Top = 40
          Width = 305
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'DESCRICAO'#9'F'
            'IDCONFIGBARRAS'#9'10'#9'IDCONFIGBARRAS'#9'F')
          LookupTable = dtmLookImobiliario.qryLookPortadorForma
          LookupField = 'CODPORTFORMA'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 4
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = True
        end
        object edtDataVencimento: TCMDateTimePicker
          Left = 24
          Top = 228
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
          TabOrder = 5
        end
        object grpCompetencia: TGroupBox
          Left = 152
          Top = 198
          Width = 241
          Height = 70
          Caption = ' Mês de Competência '
          TabOrder = 6
          object DBspnAnoCompetencia: TwwDBSpinEdit
            Left = 164
            Top = 24
            Width = 65
            Height = 21
            Increment = 1
            MaxValue = 2050
            MinValue = 1980
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object cboMesCompetencia: TComboBox
            Left = 16
            Top = 24
            Width = 145
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'Janeiro'
              'Fevereiro'
              'Março'
              'Abril'
              'Maio'
              'Junho'
              'Julho'
              'Agosto'
              'Setembro'
              'Outubro'
              'Novembro'
              'Dezembro')
          end
          object chkIgnoraCompetencia: TCheckBox
            Left = 16
            Top = 48
            Width = 153
            Height = 17
            Caption = 'Ignora a Competência'
            TabOrder = 2
          end
        end
        inline molLocatario1: TmolLocatario
          Left = 16
          Top = 136
          TabOrder = 7
          inherited btnAbrePessoa: TBitBtn
            Left = 232
            Visible = False
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagMensagemFrente'
        object GroupBox2: TGroupBox
          Left = 16
          Top = 29
          Width = 705
          Height = 213
          Caption = 'Mensagem do Boleto - frente'
          TabOrder = 0
          object Label32: TLabel
            Left = 16
            Top = 20
            Width = 47
            Height = 13
            Caption = 'Linha 1:'
          end
          object Label33: TLabel
            Left = 16
            Top = 41
            Width = 47
            Height = 13
            Caption = 'Linha 2:'
          end
          object Label34: TLabel
            Left = 16
            Top = 62
            Width = 47
            Height = 13
            Caption = 'Linha 3:'
          end
          object Label35: TLabel
            Left = 16
            Top = 83
            Width = 47
            Height = 13
            Caption = 'Linha 4:'
          end
          object Label36: TLabel
            Left = 16
            Top = 104
            Width = 47
            Height = 13
            Caption = 'Linha 5:'
          end
          object Label37: TLabel
            Left = 16
            Top = 125
            Width = 47
            Height = 13
            Caption = 'Linha 6:'
          end
          object Label38: TLabel
            Left = 16
            Top = 146
            Width = 47
            Height = 13
            Caption = 'Linha 7:'
          end
          object Label39: TLabel
            Left = 16
            Top = 167
            Width = 47
            Height = 13
            Caption = 'Linha 8:'
          end
          object Label40: TLabel
            Left = 16
            Top = 188
            Width = 47
            Height = 13
            Caption = 'Linha 9:'
          end
          object edtln1: TEdit
            Left = 72
            Top = 16
            Width = 617
            Height = 21
            MaxLength = 69
            TabOrder = 0
          end
          object edtln2: TEdit
            Left = 72
            Top = 37
            Width = 617
            Height = 21
            MaxLength = 69
            TabOrder = 1
            Text = 'Não receber após vencimento'
          end
          object edtln4: TEdit
            Left = 72
            Top = 79
            Width = 617
            Height = 21
            MaxLength = 69
            TabOrder = 3
          end
          object edtln5: TEdit
            Left = 72
            Top = 100
            Width = 617
            Height = 21
            MaxLength = 69
            TabOrder = 4
          end
          object edtln6: TEdit
            Left = 72
            Top = 121
            Width = 617
            Height = 21
            MaxLength = 69
            TabOrder = 5
          end
          object edtln7: TEdit
            Left = 72
            Top = 142
            Width = 617
            Height = 21
            MaxLength = 69
            TabOrder = 6
          end
          object edtln3: TEdit
            Left = 72
            Top = 58
            Width = 617
            Height = 21
            MaxLength = 69
            TabOrder = 2
          end
          object edtln8: TEdit
            Left = 72
            Top = 163
            Width = 617
            Height = 21
            MaxLength = 69
            TabOrder = 7
          end
          object edtln9: TEdit
            Left = 72
            Top = 184
            Width = 617
            Height = 21
            MaxLength = 69
            TabOrder = 8
          end
        end
        object fcShapeBtn1: TfcShapeBtn
          Left = 440
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
          OnClick = fcShapeBtn4Click
        end
        object fcShapeBtn2: TfcShapeBtn
          Left = 536
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
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 2
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = fcShapeBtn2Click
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagMensagemVerso'
        object fcShapeBtn4: TfcShapeBtn
          Left = 440
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
          OnClick = fcShapeBtn4Click
        end
        object Panel3: TPanel
          Left = 16
          Top = 8
          Width = 481
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Mensagens para o boleto - verso'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object Memo1: TMemo
          Left = 16
          Top = 32
          Width = 481
          Height = 233
          Lines.Strings = (
            'Cobrança valores da Fundação'
            'Competência: <competencia>'
            'Vencimento: <vencimento>'
            'DISCRIMINAÇÃO'
            '<receitasxvalores>'
            'Total dos Lançamentos = <total>'
            ''
            'INFORMAÇÕES GERAIS:'
            '<enderecocontrato>')
          TabOrder = 2
        end
        object Panel6: TPanel
          Left = 504
          Top = 8
          Width = 225
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Curingas'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
        object Memo2: TMemo
          Left = 504
          Top = 32
          Width = 224
          Height = 233
          Lines.Strings = (
            ''
            '<competencia> = mês / ano de '
            'competência da cobrança'
            ''
            '<vencimento> = dia de vencimento da '
            'cobrança'
            ''
            '<receitasxvalores> = nome das '
            'receitas agrupadas com seus '
            'respectivos valores'
            ''
            '<total> = Total dos lançamentos'
            ''
            '<enderecocontrato> = endereço do '
            'contrato de locação')
          ReadOnly = True
          TabOrder = 4
        end
        object btnContinuarLanc: TfcShapeBtn
          Left = 536
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
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 5
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuarLancClick
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'pagLancamentos'
        object btnVoltar: TfcShapeBtn
          Left = 440
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
          OnClick = btnVoltarClick
        end
        object Panel5: TPanel
          Left = 16
          Top = 8
          Width = 705
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Lançamentos a Agrupar'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object wwDBGrid1: TwwDBGrid
          Left = 16
          Top = 33
          Width = 704
          Height = 240
          Selected.Strings = (
            'FLGAGRUPAR'#9'9'#9'Agrupar'#9'F'
            'CONTRATO_EXTENSO'#9'53'#9'Contrato'#9'F'
            'DESCCUSTORECIMO'#9'41'#9'Receita '#9'F'
            'DATAVENCIMENTO'#9'13'#9'Vencimento'#9'F'
            'VALOR_LANC'#9'13'#9'Valor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsLancamentosAgrupar
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 2
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnDblClick = wwDBGrid1DblClick
          IndicatorColor = icBlack
        end
        object btnMarcar: TfcShapeBtn
          Left = 16
          Top = 280
          Width = 129
          Height = 29
          Caption = 'Marcar Todas'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
          OnClick = btnMarcarClick
        end
        object btnDesmarcar: TfcShapeBtn
          Left = 160
          Top = 280
          Width = 129
          Height = 29
          Caption = 'Desmarcar Todas'
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
            88888888888FF8888888888888008888888888888F77F8888888888800F08888
            8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
            88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
            888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
            0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
            03088878F88878F878788887F8888090B03088878F888787878788887888880B
            0B038888788888787878888888888880B0B38888888888878788888888888888
            0BBB88888888888878F888888888888880BB8888888888888788}
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
          OnClick = btnDesmarcarClick
        end
        object btnConfirma: TfcShapeBtn
          Left = 632
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
          TabOrder = 5
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnConfirmaClick
        end
      end
    end
  end
  inherited Dock971: TDock97
    Width = 736
  end
  inherited Panel2: TPanel
    Width = 736
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  object qryLancamentosAgrupar: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   L.IDLOCATARIO, L.IDCONTRATOIMOVEL, L.CODDOCUMENTO, L.CODPORTF' +
        'ORMA, L.DATAVENCIMENTO,'
      '   L.CONTRATO_EXTENSO, L.DESCCUSTORECIMO,'
      '   SUM(L.VALOR_LANC) AS VALOR_LANC,'
      '   1 AS FLGAGRUPAR'
      ''
      'FROM'
      '   VWLANCAMENTO L'
      ''
      'WHERE'
      '   ( L.CODPORTFORMA = :PCODPORTFORMA )'
      '   AND ( L.DATAVENCIMENTO = :PDATAVENCIMENTO )'
      
        '   AND ( (:PMESCOMPETENCIA IS NULL) OR (L.MESCOMPETENCIA = :PMES' +
        'COMPETENCIA) )'
      
        '   AND ( (:PANOCOMPETENCIA IS NULL) OR (L.ANOCOMPETENCIA = :PANO' +
        'COMPETENCIA) )'
      
        '   AND ( (:PIDCONTRATOIMOVEL IS NULL) OR (L.IDCONTRATOIMOVEL = :' +
        'PIDCONTRATOIMOVEL) )'
      
        '   AND ( (:PIDRESPONSAVEL IS NULL) OR (L.IDRESPONSAVEL = :PIDRES' +
        'PONSAVEL) )'
      
        '   AND ( (:PIDLOCATARIO IS NULL) OR (L.IDLOCATARIO = :PIDLOCATAR' +
        'IO) )'
      '   AND ( L.FLGINTEGRADO IS NULL )'
      '   AND ( L.EMISBLOQ <> '#39'S'#39' OR L.EMISBLOQ IS NULL)'
      '   AND ( L.STATUS_DOC <> '#39'2'#39'  OR L.STATUS_DOC IS NULL)'
      ''
      'GROUP BY'
      
        '   L.IDLOCATARIO, L.IDCONTRATOIMOVEL, L.CODDOCUMENTO, L.CODPORTF' +
        'ORMA, L.DATAVENCIMENTO,'
      '   L.CONTRATO_EXTENSO, L.DESCCUSTORECIMO'
      ''
      'ORDER BY'
      '   L.CONTRATO_EXTENSO, L.DESCCUSTORECIMO'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    UpdateObject = updLancamentosAgrupar
    ControlType.Strings = (
      'FLGAGRUPAR;CheckBox;1;0')
    ValidateWithMask = True
    Left = 305
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCATARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOCATARIO'
        ParamType = ptUnknown
      end>
    object qryLancamentosAgruparCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.VWLANCAMENTO.CODDOCUMENTO'
    end
    object qryLancamentosAgruparCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'BASEDADOS.VWLANCAMENTO.CODPORTFORMA'
    end
    object qryLancamentosAgruparDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
      Origin = 'BASEDADOS.VWLANCAMENTO.DATAVENCIMENTO'
    end
    object qryLancamentosAgruparCONTRATO_EXTENSO: TStringField
      FieldName = 'CONTRATO_EXTENSO'
      Origin = 'BASEDADOS.VWLANCAMENTO.CONTRATO_EXTENSO'
      Size = 83
    end
    object qryLancamentosAgruparDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Origin = 'BASEDADOS.VWLANCAMENTO.DESCCUSTORECIMO'
      Size = 60
    end
    object qryLancamentosAgruparVALOR_LANC: TFloatField
      FieldName = 'VALOR_LANC'
      Origin = 'BASEDADOS.VWLANCAMENTO.VALOR_LANC'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryLancamentosAgruparFLGAGRUPAR: TFloatField
      FieldName = 'FLGAGRUPAR'
    end
    object qryLancamentosAgruparIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryLancamentosAgruparIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
    end
  end
  object dsLancamentosAgrupar: TwwDataSource
    DataSet = qryLancamentosAgrupar
    Left = 305
    Top = 324
  end
  object updLancamentosAgrupar: TUpdateSQL
    Left = 304
    Top = 312
  end
  object qryAgrupaDocs: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      ' ')
    ValidateWithMask = True
    Left = 408
    Top = 312
  end
  object qryLookEndereco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   (E.LOGRADOURO||'#39' - '#39'||E.NUMERO||'#39' - '#39'||E.COMPLEMENTO) AS ENDE' +
        'RECO'
      ''
      'FROM'
      '   PESSOA P, ENDPESS E'
      ''
      'WHERE'
      '   ( P.IDPESSOA = :PIDPESSOA )'
      '   AND ( P.IDENDCOBRANCA = E.IDENDERECO )')
    ValidateWithMask = True
    Left = 489
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryLookEnderecoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'BASEDADOS.ENDPESS.LOGRADOURO'
      Size = 94
    end
  end
end
