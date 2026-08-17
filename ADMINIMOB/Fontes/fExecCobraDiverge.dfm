inherited frmExecCobraDiverge: TfrmExecCobraDiverge
  Left = 62
  Top = 75
  Caption = 'Gera Cobrança de Divergências'
  ClientHeight = 430
  ClientWidth = 663
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel [0]
    Left = 24
    Top = 76
    Width = 49
    Height = 13
    Caption = 'Contrato'
  end
  inherited pnlFundo: TPanel
    Width = 663
    Height = 348
    inherited lblTitulo: TfcLabel
      Left = 0
      Top = 0
      Width = 663
      Align = alTop
      Caption = 'Gera Cobrança de Divergências [ Valores ]'
    end
    object nbDiverge: TNotebook
      Left = 0
      Top = 24
      Width = 663
      Height = 324
      Align = alClient
      PageIndex = 1
      TabOrder = 0
      OnPageChanged = nbDivergePageChanged
      object TPage
        Left = 0
        Top = 0
        Caption = 'Cobranca'
        object Label11: TLabel
          Left = 80
          Top = 12
          Width = 49
          Height = 13
          Caption = 'Contrato'
        end
        object Label41: TLabel
          Left = 80
          Top = 60
          Width = 95
          Height = 13
          Caption = 'Cliente Debitado'
        end
        object edContrato2: TEdit
          Left = 80
          Top = 28
          Width = 473
          Height = 21
          TabStop = False
          Enabled = False
          TabOrder = 0
          Text = 'edContrato'
        end
        object edCliente2: TEdit
          Left = 80
          Top = 76
          Width = 473
          Height = 21
          TabStop = False
          Enabled = False
          TabOrder = 1
          Text = 'edContrato'
        end
        object GroupBox3: TGroupBox
          Left = 80
          Top = 112
          Width = 273
          Height = 145
          Caption = 'Valores a serem cobrados'
          TabOrder = 2
          object Label42: TLabel
            Left = 24
            Top = 80
            Width = 43
            Height = 13
            Caption = 'MULTA'
          end
          object Label43: TLabel
            Left = 24
            Top = 56
            Width = 42
            Height = 13
            Caption = 'JUROS'
          end
          object Label44: TLabel
            Left = 24
            Top = 32
            Width = 69
            Height = 13
            Caption = 'CORREÇÃO'
          end
          object Label45: TLabel
            Left = 24
            Top = 112
            Width = 41
            Height = 13
            Caption = 'TOTAL'
          end
          object edCorrecao: TRealEdit
            Left = 126
            Top = 28
            Width = 121
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edJuros: TRealEdit
            Left = 126
            Top = 52
            Width = 121
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edMulta: TRealEdit
            Left = 126
            Top = 76
            Width = 121
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edTotal: TRealEdit
            Left = 126
            Top = 108
            Width = 121
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
        object GroupBox4: TGroupBox
          Left = 368
          Top = 112
          Width = 185
          Height = 73
          Caption = 'Corrigir Valores até'
          TabOrder = 3
          object edDtAtualiza: TCMDateTimePicker
            Left = 32
            Top = 30
            Width = 129
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
        object btnContinuar1: TfcShapeBtn
          Left = 553
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
          TabOrder = 4
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuar1Click
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Receita'
        object Label9: TLabel
          Left = 24
          Top = 12
          Width = 49
          Height = 13
          Caption = 'Contrato'
        end
        object Label12: TLabel
          Left = 24
          Top = 226
          Width = 111
          Height = 13
          Caption = 'Forma de Cobrança'
        end
        object Label13: TLabel
          Left = 408
          Top = 60
          Width = 92
          Height = 13
          Caption = 'Tipo de Receita'
        end
        object Label14: TLabel
          Left = 24
          Top = 178
          Width = 92
          Height = 13
          Caption = 'Centro de Custo'
        end
        object Label15: TLabel
          Left = 24
          Top = 60
          Width = 95
          Height = 13
          Caption = 'Cliente Debitado'
        end
        object Label16: TLabel
          Left = 558
          Top = 12
          Width = 83
          Height = 13
          Caption = 'Nº Documento'
        end
        object Label10: TLabel
          Left = 360
          Top = 178
          Width = 75
          Height = 13
          Caption = 'Observações'
        end
        object edContrato: TEdit
          Left = 24
          Top = 28
          Width = 457
          Height = 21
          TabStop = False
          Enabled = False
          TabOrder = 0
          Text = 'edContrato'
        end
        object dblcPortadorForma: TCMDBLookupCombo
          Left = 24
          Top = 240
          Width = 315
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
          LookupTable = dtmLookImobiliario.qryLookPortadorForma
          LookupField = 'CODPORTFORMA'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = dblcPortadorFormaCloseUp
        end
        object btnVoltar2: TfcShapeBtn
          Left = 457
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
          TabOrder = 8
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = dbtVoltar3Click
        end
        object DBcboTipoRecDes: TwwDBLookupCombo
          Left = 408
          Top = 76
          Width = 233
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCCUSTORECIMO'#9'30'#9'Tipo de Despesa')
          LookupTable = dtmLookImobiliario.qryLookTipoRecDes
          LookupField = 'IDTIPOCUSTORECIMO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dblcCentroCusto: TwwDBLookupCombo
          Left = 24
          Top = 192
          Width = 313
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'NOME')
          LookupTable = dtmLookImobiliario.qryLookCentroCusto
          LookupField = 'CODCENTROCUSTO'
          Style = csDropDownList
          DropDownWidth = 113
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
        object edtNumDocumento: TEdit
          Left = 536
          Top = 28
          Width = 105
          Height = 21
          TabStop = False
          TabOrder = 1
        end
        object edCliente: TEdit
          Left = 24
          Top = 76
          Width = 369
          Height = 21
          TabStop = False
          Enabled = False
          TabOrder = 2
          Text = 'edContrato'
        end
        object GroupBox2: TGroupBox
          Left = 22
          Top = 104
          Width = 621
          Height = 61
          TabOrder = 4
          object Label29: TLabel
            Left = 358
            Top = 16
            Width = 101
            Height = 13
            Caption = 'Data Lançamento'
          end
          object lblDataVencimento: TLabel
            Left = 236
            Top = 16
            Width = 98
            Height = 13
            Caption = 'Data Vencimento'
          end
          object Label30: TLabel
            Left = 8
            Top = 16
            Width = 135
            Height = 13
            Caption = 'Competência (mês/ano)'
          end
          object Label31: TLabel
            Left = 480
            Top = 16
            Width = 117
            Height = 13
            Caption = 'Valor Total Corrigido'
          end
          object edtDataLanc: TCMDateTimePicker
            Left = 358
            Top = 30
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
            TabOrder = 3
          end
          object edtDataVenc: TCMDateTimePicker
            Left = 236
            Top = 30
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
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 156
            Top = 30
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object edtVlrTotal: TRealEdit
            Left = 480
            Top = 30
            Width = 129
            Height = 21
            Alignment = taRightJustify
            Color = 12648447
            Enabled = False
            Lines.Strings = (
              '      0,00')
            TabOrder = 4
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object cboMes: TComboBox
            Left = 8
            Top = 30
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
        end
        object memObs: TMemo
          Left = 356
          Top = 192
          Width = 285
          Height = 73
          MaxLength = 200
          TabOrder = 7
        end
        object btnContinuar2: TfcShapeBtn
          Left = 553
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
          TabOrder = 9
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuar2Click
        end
        object chkBoleto: TCheckBox
          Left = 24
          Top = 264
          Width = 201
          Height = 17
          Caption = 'Gerar boleto de cobrança'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Boleto'
        object GroupBox1: TGroupBox
          Left = 79
          Top = 23
          Width = 481
          Height = 225
          Caption = 'Mensagem do Boleto'
          TabOrder = 0
          object Label18: TLabel
            Left = 15
            Top = 26
            Width = 47
            Height = 13
            Caption = 'Linha 1:'
          end
          object Label19: TLabel
            Left = 15
            Top = 47
            Width = 47
            Height = 13
            Caption = 'Linha 2:'
          end
          object Label20: TLabel
            Left = 15
            Top = 68
            Width = 47
            Height = 13
            Caption = 'Linha 3:'
          end
          object Label21: TLabel
            Left = 15
            Top = 89
            Width = 47
            Height = 13
            Caption = 'Linha 4:'
          end
          object Label23: TLabel
            Left = 15
            Top = 110
            Width = 47
            Height = 13
            Caption = 'Linha 5:'
          end
          object Label24: TLabel
            Left = 15
            Top = 131
            Width = 47
            Height = 13
            Caption = 'Linha 6:'
          end
          object Label25: TLabel
            Left = 15
            Top = 152
            Width = 47
            Height = 13
            Caption = 'Linha 7:'
          end
          object Label27: TLabel
            Left = 15
            Top = 173
            Width = 47
            Height = 13
            Caption = 'Linha 8:'
          end
          object Label28: TLabel
            Left = 15
            Top = 194
            Width = 47
            Height = 13
            Caption = 'Linha 9:'
          end
          object edtLinha9: TEdit
            Left = 72
            Top = 189
            Width = 400
            Height = 21
            MaxLength = 69
            TabOrder = 8
          end
          object edtLinha8: TEdit
            Left = 72
            Top = 168
            Width = 400
            Height = 21
            MaxLength = 69
            TabOrder = 7
          end
          object edtLinha7: TEdit
            Left = 72
            Top = 147
            Width = 400
            Height = 21
            MaxLength = 69
            TabOrder = 6
          end
          object edtLinha6: TEdit
            Left = 72
            Top = 126
            Width = 400
            Height = 21
            MaxLength = 69
            TabOrder = 5
          end
          object edtLinha5: TEdit
            Left = 72
            Top = 105
            Width = 400
            Height = 21
            MaxLength = 69
            TabOrder = 4
          end
          object edtLinha4: TEdit
            Left = 72
            Top = 84
            Width = 400
            Height = 21
            MaxLength = 69
            TabOrder = 3
          end
          object edtLinha3: TEdit
            Left = 72
            Top = 63
            Width = 400
            Height = 21
            MaxLength = 69
            TabOrder = 2
          end
          object edtLinha2: TEdit
            Left = 72
            Top = 42
            Width = 400
            Height = 21
            MaxLength = 69
            TabOrder = 1
          end
          object edtLinha1: TEdit
            Left = 72
            Top = 21
            Width = 400
            Height = 21
            MaxLength = 69
            TabOrder = 0
          end
        end
        object dbtVoltar3: TfcShapeBtn
          Left = 457
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
          OnClick = dbtVoltar3Click
        end
        object btnContinuar3: TfcShapeBtn
          Left = 553
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
          OnClick = btnContinuar3Click
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Confirma'
        object btnVoltar4: TfcShapeBtn
          Left = 457
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
          TabOrder = 0
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnVoltar4Click
        end
        object btnConfirmar: TfcShapeBtn
          Left = 553
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
          OnClick = btnConfirmarClick
        end
        object Panel3: TPanel
          Left = 10
          Top = 6
          Width = 637
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Lançamentos a Gerar'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object btnTotaliza: TfcShapeBtn
            Left = 546
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
          end
        end
        object DBgrdLancamentos: TwwDBGrid
          Left = 10
          Top = 32
          Width = 637
          Height = 222
          Selected.Strings = (
            'IMOCODIGO'#9'8'#9'Código'
            'IMOVEL_EXTENSO'#9'36'#9'Imóvel '
            'CONTRATO_EXTENSO'#9'15'#9'Contrato'#9'F'
            'CODTIPIMOVEL'#9'7'#9'Tipo'
            'GXIPERCENTRATEIO'#9'9'#9'Rateio (I)'
            'PERCENT_RATEIO'#9'9'#9'Rateio (C)'
            'VALOR'#9'11'#9'Valor')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsRateio
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
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 397
    Width = 663
    inherited tb97Fundo: TToolbar97
      Left = 477
      DockPos = 477
    end
  end
  inherited Panel2: TPanel
    Top = 348
    Width = 663
    inherited lblContador: TLabel
      Left = 556
    end
    inherited ProgressBar: TProgressBar
      Width = 633
    end
  end
  object qryRateio: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ( IM.IMONOME ||'#39' - '#39'||I.IMONOME ) AS IMOVEL_EXTENSO,'
      '       ( C.CONNUMERO||'#39' - '#39'||C.CONNOME ) AS CONTRATO_EXTENSO,'
      
        '       I.IMOCODIGO,   I.CODTIPIMOVEL,   C.CONNUMERO,   C.CONNOME' +
        ','
      
        '       I.IMOAREA, I.IDIMOVEL,  -- para ratear receitas por contr' +
        'ato'
      
        '       I.IMOFRACAOIDEAL,       -- atualização para a FCRT eles c' +
        'alculam percentual por aqui, o default é IMOAREA'
      '       C.IDCONTRATOIMOVEL,'
      '       0 AS GXIPERCENTRATEIO,'
      '       0 AS VALOR,'
      '       0 AS VLR_PARCELA,'
      ''
      '       DECODE(CXI.FLGRATEIO, NULL, 100,'
      '          DECODE(CXI.FLGRATEIO, 0, 100,'
      
        '             DECODE(CXI.CIMPERCENTRATEIO, NULL, 0, CXI.CIMPERCEN' +
        'TRATEIO))) AS PERCENT_RATEIO'
      ''
      
        '  FROM IMOVEL I, IMOVEL IM, CONTRATOIMOVEL C, CONTRATOXIMOVEL CX' +
        'I'
      ''
      ' WHERE ( I.IDPESSOA = :PIDPESSOA )'
      
        '   AND ( (:PIDCONTRATOIMOVEL IS NULL) OR (C.IDCONTRATOIMOVEL = :' +
        'PIDCONTRATOIMOVEL) )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '   AND ( I.IDIMOVEL = CXI.IDIMOVEL(+) )'
      '   AND ( CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) )'
      
        '   AND ( ( C.CONDATAFIM >= SYSDATE ) OR ( C.FLGINDETERMINADO = '#39 +
        'S'#39' ) )'
      ''
      ' ORDER BY IMOVEL_EXTENSO'
      ''
      ''
      ''
      ''
      ''
      '')
    UpdateObject = updRateio
    ValidateWithMask = True
    Left = 400
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
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
      end>
    object qryRateioIMOCODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 8
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object qryRateioIMOVEL_EXTENSO: TStringField
      DisplayLabel = 'Imóvel '
      DisplayWidth = 36
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryRateioCONTRATO_EXTENSO: TStringField
      DisplayLabel = 'Contrato'
      DisplayWidth = 15
      FieldName = 'CONTRATO_EXTENSO'
      Size = 83
    end
    object qryRateioCODTIPIMOVEL: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 7
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryRateioGXIPERCENTRATEIO: TFloatField
      DisplayLabel = 'Rateio (I)'
      DisplayWidth = 9
      FieldName = 'GXIPERCENTRATEIO'
      DisplayFormat = '#0.0000 %'
      EditFormat = '#0 %'
    end
    object qryRateioPERCENT_RATEIO: TFloatField
      DisplayLabel = 'Rateio (C)'
      DisplayWidth = 9
      FieldName = 'PERCENT_RATEIO'
      ReadOnly = True
      DisplayFormat = '#0.0000 %'
      EditFormat = '#0 %'
    end
    object qryRateioVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 11
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,###,##0.00'
      EditFormat = '#0'
    end
    object qryRateioIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryRateioCONNUMERO: TStringField
      DisplayWidth = 20
      FieldName = 'CONNUMERO'
      Visible = False
    end
    object qryRateioCONNOME: TStringField
      DisplayWidth = 60
      FieldName = 'CONNOME'
      Visible = False
      Size = 60
    end
    object qryRateioVLR_PARCELA: TFloatField
      FieldName = 'VLR_PARCELA'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryRateioIMOAREA: TFloatField
      FieldName = 'IMOAREA'
      Visible = False
    end
    object qryRateioIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object qryRateioIMOFRACAOIDEAL: TFloatField
      FieldName = 'IMOFRACAOIDEAL'
      Visible = False
    end
  end
  object updRateio: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPOXIMOVEL'
      'set'
      '  GXIPERCENTRATEIO = :GXIPERCENTRATEIO'
      'where'
      '  IDGRUPORATEIO = :OLD_IDGRUPORATEIO and'
      '  IDIMOVEL = :OLD_IDIMOVEL')
    InsertSQL.Strings = (
      'insert into GRUPOXIMOVEL'
      '  (IDGRUPORATEIO, IDIMOVEL, GXIPERCENTRATEIO)'
      'values'
      '  (:IDGRUPORATEIO, :IDIMOVEL, :GXIPERCENTRATEIO)')
    DeleteSQL.Strings = (
      'delete from GRUPOXIMOVEL'
      'where'
      '  IDGRUPORATEIO = :OLD_IDGRUPORATEIO and'
      '  IDIMOVEL = :OLD_IDIMOVEL')
    Left = 400
    Top = 276
  end
  object dsRateio: TwwDataSource
    DataSet = qryRateio
    Left = 400
    Top = 288
  end
end
