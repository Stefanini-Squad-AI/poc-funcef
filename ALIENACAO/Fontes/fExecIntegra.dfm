inherited frmExecIntegra: TfrmExecIntegra
  Left = 302
  Top = 144
  HelpContext = 1350008
  Caption = 'Integração das Parcelas'
  ClientHeight = 476
  ClientWidth = 643
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock971: TDock97 [0]
    Top = 443
    Width = 643
    inherited tb97Fundo: TToolbar97
      Left = 455
      DockPos = 456
      inherited sep1: TToolbarSep97
        Left = 91
      end
      inherited ToolbarSep972: TToolbarSep97
        Left = 182
      end
      inherited bbtnSair: TBitBtn
        Width = 89
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 93
        Width = 89
      end
    end
  end
  inherited pnlFundo: TPanel [1]
    Width = 643
    Height = 443
    object ntbIntegra: TNotebook
      Left = 0
      Top = 0
      Width = 643
      Height = 443
      Align = alClient
      TabOrder = 0
      OnPageChanged = ntbIntegraPageChanged
      object TPage
        Left = 0
        Top = 0
        Caption = 'Selecao'
        object lblTitulo: TfcLabel
          Left = 0
          Top = 0
          Width = 643
          Height = 24
          Align = alTop
          Caption = '  Integração das Parcelas [Seleção]'
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
        inline molProposta1: TmolProposta
          Left = 31
          Top = 35
          Width = 539
          inherited Label1: TLabel
            Width = 85
            Caption = 'Nº do Contrato'
          end
          inherited Label2: TLabel
            Width = 103
            Caption = 'Nome do Contrato'
          end
          inherited edtNomProp: TEdit
            Width = 369
          end
          inherited btnBuscaProp: TBitBtn
            Left = 482
            OnClick = molProposta1btnBuscaPropClick
          end
          inherited btnLimpaProp: TBitBtn
            Left = 506
          end
        end
        inline molComprador1: TmolComprador
          Left = 30
          Top = 117
          Width = 555
          TabOrder = 1
          inherited edtRazaoSocial: TEdit
            Width = 473
          end
          inherited btnBuscaForn: TBitBtn
            Left = 482
          end
          inherited btnLimpaForn: TBitBtn
            Left = 506
          end
        end
        object btnContinua1: TfcShapeBtn
          Left = 480
          Top = 351
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
          OnClick = btnContinua1Click
        end
        object GroupBox1: TGroupBox
          Left = 39
          Top = 211
          Width = 226
          Height = 174
          Caption = 'Tipo de Parcela'
          TabOrder = 3
          object cbGerada: TCheckBox
            Left = 17
            Top = 44
            Width = 121
            Height = 16
            Caption = 'Parcela Gerada'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object cbSinal: TCheckBox
            Left = 17
            Top = 22
            Width = 121
            Height = 16
            Caption = 'Sinal'
            TabOrder = 1
          end
          object cbAmort: TCheckBox
            Left = 17
            Top = 64
            Width = 121
            Height = 16
            Caption = 'Amortização Extra'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
          object cbProj: TCheckBox
            Left = 17
            Top = 153
            Width = 121
            Height = 16
            Caption = 'Parcela Projetada'
            Enabled = False
            TabOrder = 3
            Visible = False
          end
          object cbVista: TCheckBox
            Left = 17
            Top = 86
            Width = 144
            Height = 16
            Caption = 'Pagamento a Vista'
            TabOrder = 4
          end
          object cbAntec: TCheckBox
            Left = 17
            Top = 108
            Width = 144
            Height = 16
            Caption = 'Parcela Antecipada'
            TabOrder = 5
          end
          object cbCaucao: TCheckBox
            Left = 17
            Top = 130
            Width = 72
            Height = 16
            Caption = 'Caução'
            TabOrder = 6
          end
        end
        object GroupBox2: TGroupBox
          Left = 267
          Top = 211
          Width = 306
          Height = 70
          Caption = ' Vencimento '
          TabOrder = 4
          object Label2: TLabel
            Left = 18
            Top = 18
            Width = 34
            Height = 13
            Caption = 'Início'
          end
          object Label1: TLabel
            Left = 154
            Top = 18
            Width = 46
            Height = 13
            Caption = 'Término'
          end
          object edDataI: TCMDateTimePicker
            Left = 18
            Top = 34
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
          object edDataF: TCMDateTimePicker
            Left = 154
            Top = 34
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
            TabOrder = 1
          end
        end
        inline molResponsavel1: TmolResponsavel
          Left = 32
          Top = 76
          Width = 545
          TabOrder = 5
          inherited edtResponsavel: TEdit
            Width = 473
          end
          inherited btnBuscaResponsavel: TBitBtn
            Left = 482
          end
          inherited btnLimpaResponsavel: TBitBtn
            Left = 506
          end
          inherited btnAbrePessoa: TBitBtn
            Visible = False
          end
        end
        object GroupBox3: TGroupBox
          Left = 267
          Top = 285
          Width = 153
          Height = 54
          Caption = ' Data de Emissão '
          TabOrder = 6
          object edtDataProc: TCMDateTimePicker
            Left = 18
            Top = 28
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
        inline molAdministradora1: TmolAdministradora
          Left = 31
          Top = 160
          Width = 546
          TabOrder = 7
          inherited edtAdministradora: TEdit
            Width = 473
          end
          inherited btnBuscaAdministradora: TBitBtn
            Left = 480
          end
          inherited btnLimpaAdministradora: TBitBtn
            Left = 504
          end
          inherited btnAbrePessoa: TBitBtn
            Visible = False
          end
        end
        object GroupBox4: TGroupBox
          Left = 267
          Top = 345
          Width = 201
          Height = 35
          Caption = ' Tipo '
          TabOrder = 8
          object cbContrato: TCheckBox
            Left = 16
            Top = 15
            Width = 97
            Height = 17
            Caption = 'Contrato'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object cbAcordo: TCheckBox
            Left = 112
            Top = 15
            Width = 66
            Height = 17
            Caption = 'Acordo'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
        end
        object grbLancamento: TGroupBox
          Left = 428
          Top = 286
          Width = 143
          Height = 54
          Caption = ' Data de Lançamento '
          TabOrder = 9
          object edtDataLancto: TCMDateTimePicker
            Left = 9
            Top = 26
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
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Confirma'
        object grdParc: TwwDBGrid
          Left = 0
          Top = 27
          Width = 643
          Height = 370
          Selected.Strings = (
            'CHKINTEGRA'#9'2'#9'   '#9'F'
            'DATAVENCIMENTO'#9'12'#9'Vencimento'#9'F'
            'RAZAOSOCIAL'#9'40'#9'Comprador'#9'F'
            'NUMCONTRATO'#9'15'#9'Nº do Contrato'#9'F'
            'CAL_TIPO'#9'20'#9'Tipo'#9'F'
            'VLRPRESTACAO'#9'12'#9'Valor'#9'F'
            'NOMECONTRATO'#9'35'#9'Descrição do Contrato'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          BorderStyle = bsNone
          DataSource = dsParc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 2
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = grdParcCalcCellColors
          OnDblClick = grdParcDblClick
          IndicatorColor = icBlack
          OnTopRowChanged = grdParcTopRowChanged
        end
        object Panel1: TPanel
          Left = 0
          Top = 397
          Width = 643
          Height = 46
          Align = alBottom
          TabOrder = 0
          object btnSeleciona: TSpeedButton
            Left = 7
            Top = 9
            Width = 119
            Height = 30
            Hint = 'Marca todas as parcelas para integrar'
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
            Left = 129
            Top = 9
            Width = 119
            Height = 30
            Hint = 'Desmarca todas as parcelas para integrar'
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
          object btnContinua2: TfcShapeBtn
            Left = 550
            Top = 10
            Width = 89
            Height = 29
            Caption = 'Integrar'
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
              8888888888FFFFF8888888888000008888888888F777778FF888888005555500
              88888887788888778F8888755555555508888878888888F878F887D555555F55
              508887F888F8878F87F887D58F55FFF55088878887F87778F78F7D558F5FFFFF
              55087F8887F77777887F7D558F555F8555087F8887F887F8887F7D558F555F85
              55087F88F7FFF7F8887F7D5FFFFF5F8555087F87777787F8887F7D55FFF55F85
              550878F877788788887887D55F555555508887F88788888887F887D555555555
              5088878F888888888788887DD555555508888878FF88888F788888877DDDDD77
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
            TabOrder = 0
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnContinua2Click
          end
          object btnCancela2: TfcShapeBtn
            Left = 460
            Top = 10
            Width = 89
            Height = 29
            Caption = 'Cancelar'
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
              8888888888FFFFF8888888888000008888888888F777778FF888888009191900
              88888887788888778F88887991919191088888788888888878F8879919191919
              108887F88888888887F88791919191919088878888888888878F791919191919
              19087F88FFFFFFFFF87F79988888888891087F8777777777F87F791FFFFFFFF8
              19087F8777777777F87F799FFFFFFFF891087F8777777777887F791919191919
              190878F8888888888878879191919191908887F88888888887F8879919191919
              1088878F88888888878888799191919108888878FF88888F7888888779999977
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
            OnClick = btnCancela2Click
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 643
          Height = 27
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Parcelas à Integrar'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Erros'
        object fcLabel1: TfcLabel
          Left = 0
          Top = 0
          Width = 643
          Height = 24
          Align = alTop
          Caption = '  Integração das Parcelas [ Parcelas Não Integradas ]'
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
        object Panel2: TPanel
          Left = 0
          Top = 402
          Width = 643
          Height = 41
          Align = alBottom
          TabOrder = 0
          object fcShapeBtn1: TfcShapeBtn
            Left = 460
            Top = 7
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
            OnClick = fcShapeBtn1Click
          end
        end
        object memErro: TMemo
          Left = 0
          Top = 24
          Width = 643
          Height = 378
          Align = alClient
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 533
    Top = 101
  end
  object qryVerifPag: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(L.DATALANCTO) AS DATAPAG'
      'FROM'
      '     LANCTODOCUM L,'
      '     DOCUMENTO D'
      'WHERE'
      '      (D.CODDOCUMENTO = :CODDOCUMENTO)'
      '  AND (D.STATUS = '#39'2'#39')'
      '  AND (L.OPERACAO = '#39'5 '#39')'
      '  AND (L.CODDOCUMENTO = D.CODDOCUMENTO)'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 597
    Top = 29
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryVerifPagDATAPAG: TDateTimeField
      FieldName = 'DATAPAG'
      Origin = 'BASEDADOS.LANCTODOCUM.DATALANCTO'
    end
  end
  object qryParc: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryParcCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     (0) CHKINTEGRA,'
      '     MIN(CI.IDCONTRATOIMOVEL) AS IDCONTRATOIMOVEL,'
      '     MIN(CI.CONNUMERO)      AS NUMCONTRATO,'
      '     MIN(CI.CONNOME)        AS NOMECONTRATO,'
      '     MIN(IM.NOMEMESTRE)     AS NOMEMESTRE,'
      '     MIN(IM.CODTIPIMOVEL)   AS CODTIPIMOVEL,'
      '     PR.IDPARCFINANCIMOV,'
      '     MIN(PR.CODDOCUMENTO)   AS CODDOCUMENTO,'
      '     MIN(PR.PLNCODIGO)      AS PLNCODIGO,'
      '     PR.IDCONDPAGIMOVEL,'
      '     MIN(PR.VLRPRESTACAO)   AS VLRPRESTACAO,'
      '     MIN(PR.VLRNOMINAL)     AS VLRNOMINAL,'
      '     MIN(PR.VLRAMORTIZACAO) AS VLRAMORTIZACAO,'
      '     MIN(PR.VLRJUROS)       AS VLRJUROS,'
      '     MIN(PR.VLRJUROSPARC)   AS VLRJUROSPARC,'
      '     MIN(PR.VLRRESIDUO)     AS VLRRESIDUO,'
      '     MIN(NVL(PR.VLRCORRSALDO,0)) AS VLRCORRSALDO,'
      '     MIN(PR.DATAVENCIMENTO) AS DATAVENCIMENTO,'
      '     MIN(PR.NUMPARCELA)     AS NUMPARCELA,'
      '     MIN(CP.NUMPARCELAS)    AS NUMPARCELAS,'
      '     MIN(CP.TIPOCONDPAG)    AS TIPOCONDPAG,'
      '     MIN(CP.PRAZO)          AS PRAZO,'
      '     MIN(CP.PERIODO)        AS PERIODO,'
      '     MIN(CP.FORMACALCULO)   AS FORMACALCULO,'
      '     MIN(CI.IDLOCATARIO)    AS IDPESSOA,'
      '     MIN(P.RAZAOSOCIAL)     AS RAZAOSOCIAL,'
      '     MIN(PR.FLGTIPOLANC)    AS FLGTIPOLANC,'
      '     MIN(CP.ATRASOINDCORREC)AS ATRASOINDCORREC,'
      '     MIN(CP.ATRASOMULTA)    AS ATRASOMULTA,'
      '     MIN(CP.ATRASOTXJUROS)  AS ATRASOTXJUROS,'
      '     MIN(CI.IDMSGBOLETO)    AS IDMSGBOLETO,'
      
        '     DECODE(MIN(CI.CODPORTFORMA), NULL, -1, MIN(CI.CODPORTFORMA)' +
        ') AS CODPORTFORMA,'
      
        '     DECODE(MIN(PF.CODFORMA), NULL, -1, MIN(PF.CODFORMA)) AS COD' +
        'FORMA,'
      '     MIN(PR.DATALANCINTEGRA)  AS DATALANCINTEGRA,'
      '     MIN(PR.FLGLANCINTEGRA)   AS FLGLANCINTEGRA,'
      '     CI.FLGTIPOCONTRATO'
      ''
      'FROM'
      '     PARCFINANCIMOV PR,'
      '     CONDPAGIMOVEL CP,'
      '     CONTRATOIMOVEL CI,'
      '     PESSOA P,'
      '     PORTADORFORMA PF,'
      '     ( SELECT CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL,'
      '              M.IMONOME            AS NOMEMESTRE,'
      '              I.CODTIPIMOVEL       AS CODTIPIMOVEL'
      '       FROM'
      '              CONTRATOXIMOVEL CXI,'
      '              IMOVEL I,'
      '              IMOVEL M'
      '       WHERE'
      '              CXI.IDIMOVEL = I.IDIMOVEL AND'
      '              I.IDIMOVELMESTRE = M.IDIMOVEL ) IM'
      'WHERE'
      '       ( (NVL(PR.FLGLANCINTEGRA,0) = 0) OR'
      '         (PR.FLGLANCINTEGRA = 1 AND PR.FLGTIPOLANC <> 4) )'
      '   AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      '   AND (CP.IDCONDPAGIMOVEL = PR.IDCONDPAGIMOVEL)'
      '   AND (CI.IDLOCATARIO = P.IDPESSOA)'
      
        '   AND ((CI.FLGVGV IS NULL) OR ((CI.FLGVGV = 1) AND (PR.FLGTIPOL' +
        'ANC <> 3)))'
      '   AND (CI.IDCONTRATOIMOVEL = IM.IDCONTRATOIMOVEL(+))'
      '   AND (CI.CODPORTFORMA = PF.CODPORTFORMA(+))'
      '   AND ((:pDATAI IS NULL) OR (PR.DATAVENCIMENTO >= :pDATAI))'
      '   AND ((:pDATAF IS NULL) OR (PR.DATAVENCIMENTO <= :pDATAF))'
      '   AND ((:pIDPESSOA IS NULL) OR (CI.IDLOCATARIO = :pIDPESSOA))'
      
        '   AND ((:pIDRESPONSAVEL IS NULL) OR (CI.IDRESPONSAVEL = :pIDRES' +
        'PONSAVEL))'
      
        '   AND ((:pIDADMINIMOVEL IS NULL) OR (CI.IDADMINIMOVEL = :pIDADM' +
        'INIMOVEL))'
      
        '   AND ((:pIDCONTRATO IS NULL) OR (CI.IDCONTRATOIMOVEL = :pIDCON' +
        'TRATO))'
      '   AND (   ((:pSINAL = '#39'S'#39')  AND (PR.FLGTIPOLANC = 2))'
      '        OR ((:pGERA  = '#39'S'#39')  AND (PR.FLGTIPOLANC = 3))'
      '        OR ((:pPROJ  = '#39'S'#39')  AND (PR.FLGTIPOLANC = 4))'
      '        OR ((:pAMORT = '#39'S'#39')  AND (PR.FLGTIPOLANC = 5))'
      '        OR ((:pVISTA = '#39'S'#39')  AND (PR.FLGTIPOLANC = 7))'
      ''
      '        OR ((:pCAUCAO = '#39'S'#39') AND (PR.FLGTIPOLANC = 8))'
      ''
      '        OR ((:pANTEC = '#39'S'#39')  AND (PR.FLGTIPOLANC = 9)) )'
      
        '   AND (   ((:pFLGCONTRATO = '#39'S'#39') AND ((CI.FLGTIPOCONTRATO = '#39'C'#39 +
        ') OR'
      
        '                                       (CI.IDCONTRATOIMOVEL IN(S' +
        'ELECT DISTINCT IDCONTRATOIMOVEL'
      
        '                                                               F' +
        'ROM CONDPAGIMOVEL'
      
        '                                                               W' +
        'HERE TIPOCONDPAG = '#39'C'#39')) ))'
      
        '        OR ((:pFLGACORDO   = '#39'S'#39') AND (CI.FLGTIPOCONTRATO = '#39'A'#39')' +
        ')  )'
      ''
      
        'GROUP BY PR.IDCONDPAGIMOVEL, PR.IDPARCFINANCIMOV, CI.FLGTIPOCONT' +
        'RATO'
      'ORDER BY DATAVENCIMENTO'
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
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpdParc
    ControlType.Strings = (
      'CHKINTEGRA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 472
    Top = 96
    ParamData = <
      item
        DataType = ftDate
        Name = 'pDATAI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDATAI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDATAF'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDATAF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pSINAL'
        ParamType = ptUnknown
        Value = 'S'
      end
      item
        DataType = ftString
        Name = 'pGERA'
        ParamType = ptUnknown
        Value = 'S'
      end
      item
        DataType = ftString
        Name = 'pPROJ'
        ParamType = ptUnknown
        Value = 'S'
      end
      item
        DataType = ftString
        Name = 'pAMORT'
        ParamType = ptUnknown
        Value = 'S'
      end
      item
        DataType = ftString
        Name = 'pVISTA'
        ParamType = ptUnknown
        Value = 'S'
      end
      item
        DataType = ftString
        Name = 'pCAUCAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pANTEC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFLGCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pFLGACORDO'
        ParamType = ptInput
      end>
    object qryParcCHKINTEGRA: TFloatField
      DisplayLabel = '   '
      DisplayWidth = 2
      FieldName = 'CHKINTEGRA'
    end
    object qryParcDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 12
      FieldName = 'DATAVENCIMENTO'
    end
    object qryParcRAZAOSOCIAL: TStringField
      DisplayLabel = 'Comprador'
      DisplayWidth = 40
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryParcNUMCONTRATO: TStringField
      DisplayLabel = 'Nº do Contrato'
      DisplayWidth = 15
      FieldName = 'NUMCONTRATO'
    end
    object qryParcCAL_TIPO: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'CAL_TIPO'
      Calculated = True
    end
    object qryParcVLRPRESTACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 12
      FieldName = 'VLRPRESTACAO'
      DisplayFormat = '#,##0.00'
    end
    object qryParcNOMECONTRATO: TStringField
      DisplayLabel = 'Descrição do Contrato'
      DisplayWidth = 35
      FieldName = 'NOMECONTRATO'
      Size = 60
    end
    object qryParcCODDOCUMENTO: TFloatField
      DisplayLabel = 'Cód. Documento'
      DisplayWidth = 8
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object qryParcFLGLANCINTEGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGLANCINTEGRA'
      Visible = False
    end
    object qryParcDATALANCINTEGRA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATALANCINTEGRA'
      Visible = False
    end
    object qryParcCODFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODFORMA'
      Visible = False
    end
    object qryParcCODPORTFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object qryParcIDMSGBOLETO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMSGBOLETO'
      Visible = False
    end
    object qryParcNUMPARCELAS: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMPARCELAS'
      Visible = False
    end
    object qryParcNOMEMESTRE: TStringField
      DisplayWidth = 60
      FieldName = 'NOMEMESTRE'
      Visible = False
      Size = 60
    end
    object qryParcNUMPARCELA: TFloatField
      DisplayLabel = 'Parcela'
      DisplayWidth = 6
      FieldName = 'NUMPARCELA'
      Visible = False
    end
    object qryParcIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryParcIDPARCFINANCIMOV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPARCFINANCIMOV'
      Visible = False
    end
    object qryParcIDCONDPAGIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDPAGIMOVEL'
      Visible = False
    end
    object qryParcIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.IDPESSOA'
      Visible = False
    end
    object qryParcPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.PARCFINANCIMOV.PLNCODIGO'
      Visible = False
    end
    object qryParcATRASOINDCORREC: TFloatField
      FieldName = 'ATRASOINDCORREC'
      Visible = False
    end
    object qryParcATRASOMULTA: TFloatField
      FieldName = 'ATRASOMULTA'
      Visible = False
    end
    object qryParcATRASOTXJUROS: TFloatField
      FieldName = 'ATRASOTXJUROS'
      Visible = False
    end
    object qryParcFLGTIPOLANC: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGTIPOLANC'
      Visible = False
    end
    object qryParcPRAZO: TStringField
      DisplayWidth = 1
      FieldName = 'PRAZO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryParcPERIODO: TFloatField
      DisplayWidth = 10
      FieldName = 'PERIODO'
      Visible = False
    end
    object qryParcVLRAMORTIZACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRAMORTIZACAO'
      Visible = False
    end
    object qryParcVLRJUROS: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRJUROS'
      Visible = False
    end
    object qryParcVLRRESIDUO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRRESIDUO'
      Visible = False
    end
    object qryParcTIPOCONDPAG: TStringField
      FieldName = 'TIPOCONDPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryParcCODTIPIMOVEL: TStringField
      DisplayWidth = 5
      FieldName = 'CODTIPIMOVEL'
      Visible = False
      Size = 5
    end
    object qryParcFORMACALCULO: TFloatField
      DisplayWidth = 10
      FieldName = 'FORMACALCULO'
      Visible = False
    end
    object qryParcVLRCORRSALDO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRCORRSALDO'
      Visible = False
    end
    object qryParcVLRNOMINAL: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRNOMINAL'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryParcVLRJUROSPARC: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRJUROSPARC'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryParcFLGTIPOCONTRATO: TStringField
      FieldName = 'FLGTIPOCONTRATO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object dsParc: TwwDataSource
    AutoEdit = False
    DataSet = qryParc
    Left = 472
    Top = 48
  end
  object UpdParc: TUpdateSQL
    ModifySQL.Strings = (
      'update PARCFINANCIMOV'
      'set'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  FLGLANCINTEGRA = :FLGLANCINTEGRA'
      'where'
      '  IDPARCFINANCIMOV = :OLD_IDPARCFINANCIMOV')
    InsertSQL.Strings = (
      'insert into PARCFINANCIMOV'
      '  (CODDOCUMENTO, PLNCODIGO, FLGLANCINTEGRA)'
      'values'
      '  (:CODDOCUMENTO, :PLNCODIGO, :FLGLANCINTEGRA)')
    DeleteSQL.Strings = (
      'delete from PARCFINANCIMOV'
      'where'
      '  IDPARCFINANCIMOV = :OLD_IDPARCFINANCIMOV')
    Left = 472
    Top = 145
  end
  object qryImoveis: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryParcCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT I.IMOCODIGO'
      '  FROM CONTRATOXIMOVEL CXI, IMOVEL I'
      ' WHERE CXI.IDIMOVEL = I.IDIMOVEL'
      '   AND CXI.IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL ')
    ControlType.Strings = (
      'CODDOCUMENTO;CheckBox;1;0'
      'CHKINTEGRA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 512
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryImoveisIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Origin = 'BASEDADOS.IMOVEL.IMOCODIGO'
      Size = 15
    end
  end
  object QryParcelasPend: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '/* Documentos de Alienação não integrados */'
      'SELECT CI.CONNUMERO, CI.CONNOME, P.NUMPARCELA, P.DATAVENCIMENTO'
      '  FROM PARCFINANCIMOV P, CONDPAGIMOVEL C, CONTRATOIMOVEL CI'
      ' WHERE P.IDCONDPAGIMOVEL = C.IDCONDPAGIMOVEL'
      '   AND C.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL'
      '   AND TO_CHAR(P.DATAVENCIMENTO,'#39'MMYYYY'#39') = :MESANO'
      '   AND NUMPARCELA > 0'
      '   AND (NVL(FLGLANCINTEGRA,0) = 0 OR FLGTIPOLANC = 4)'
      'ORDER BY CONNUMERO, DATAVENCIMENTO'
      '')
    ValidateWithMask = True
    Left = 425
    Top = 228
    ParamData = <
      item
        DataType = ftString
        Name = 'MESANO'
        ParamType = ptInput
      end>
    object QryParcelasPendCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object QryParcelasPendCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object QryParcelasPendNUMPARCELA: TFloatField
      FieldName = 'NUMPARCELA'
    end
    object QryParcelasPendDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
  end
  object qryDadosCliente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    EST.IDPAIS,'
      '    CID.IDCIDADES,'
      '    EST.CODESTADO'
      'FROM'
      '    PESSOA  PES,'
      '    ENDPESS END,'
      '    CIDADES CID,'
      '    ESTADO  EST'
      'WHERE'
      '    PES.IDPESSOA      = :IDPESSOA          AND'
      '    END.IDENDERECO(+) = PES.IDENDCOMERCIAL AND'
      '    CID.IDCIDADES(+)  = END.IDCIDADES      AND'
      '    EST.IDESTADO(+)   = CID.IDESTADO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 584
    Top = 115
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    object qryDadosClienteIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object qryDadosClienteIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
    end
    object qryDadosClienteCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
  end
end
