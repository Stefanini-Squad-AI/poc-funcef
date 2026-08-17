inherited frmExecConcilia: TfrmExecConcilia
  Left = 269
  Top = 109
  HelpContext = 1350010
  Caption = 'Conciliação das Parcelas'
  ClientHeight = 430
  ClientWidth = 669
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 669
    Height = 397
    object ntbConcilia: TNotebook
      Left = 0
      Top = 0
      Width = 669
      Height = 397
      Align = alClient
      PageIndex = 1
      TabOrder = 0
      OnPageChanged = ntbConciliaPageChanged
      object TPage
        Left = 0
        Top = 0
        Caption = 'Selecao'
        object lblTitulo: TfcLabel
          Left = 0
          Top = 0
          Width = 669
          Height = 24
          Align = alTop
          Caption = '  Conciliação das Parcelas [Seleção]'
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
          Left = 23
          Top = 32
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
          Left = 22
          Top = 116
          Width = 555
          TabOrder = 1
          inherited edtRazaoSocial: TEdit
            Width = 473
          end
          inherited btnBuscaForn: TBitBtn
            Left = 482
            OnClick = molComprador1btnBuscaFornClick
          end
          inherited btnLimpaForn: TBitBtn
            Left = 506
          end
        end
        object btnContinua1: TfcShapeBtn
          Left = 550
          Top = 335
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
          Left = 31
          Top = 211
          Width = 162
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
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object cbAmort: TCheckBox
            Left = 17
            Top = 66
            Width = 121
            Height = 16
            Caption = 'Amortização Extra'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
          object cbExtra: TCheckBox
            Left = 17
            Top = 111
            Width = 139
            Height = 16
            Caption = 'Cob. Divergências'
            Checked = True
            State = cbChecked
            TabOrder = 3
          end
          object cbVista: TCheckBox
            Left = 17
            Top = 89
            Width = 139
            Height = 16
            Caption = 'Pagamento a Vista'
            Checked = True
            State = cbChecked
            TabOrder = 4
          end
          object cbAntec: TCheckBox
            Left = 16
            Top = 133
            Width = 139
            Height = 16
            Caption = 'Parc. Antecipada'
            Checked = True
            State = cbChecked
            TabOrder = 5
          end
        end
        object GroupBox2: TGroupBox
          Left = 208
          Top = 211
          Width = 329
          Height = 63
          Caption = 'Vencimento'
          TabOrder = 4
          object Label2: TLabel
            Left = 18
            Top = 15
            Width = 34
            Height = 13
            Caption = 'Início'
          end
          object Label1: TLabel
            Left = 170
            Top = 15
            Width = 46
            Height = 13
            Caption = 'Término'
          end
          object edDataI: TCMDateTimePicker
            Left = 18
            Top = 31
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
            Left = 170
            Top = 31
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
          Left = 24
          Top = 75
          Width = 545
          TabOrder = 5
          inherited edtResponsavel: TEdit
            Width = 473
          end
          inherited btnBuscaResponsavel: TBitBtn
            Left = 480
          end
          inherited btnLimpaResponsavel: TBitBtn
            Left = 504
          end
          inherited btnAbrePessoa: TBitBtn
            Visible = False
          end
        end
        object GroupBox3: TGroupBox
          Left = 209
          Top = 280
          Width = 141
          Height = 49
          Caption = 'Data de Integração'
          TabOrder = 6
          object edtDataProc: TCMDateTimePicker
            Left = 10
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
          end
        end
        object gbDiverg: TGroupBox
          Left = 353
          Top = 280
          Width = 184
          Height = 49
          Caption = 'Divergências atualizadas até'
          TabOrder = 7
          object edtDataAtualiza: TCMDateTimePicker
            Left = 24
            Top = 19
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
        object cbRecalculo: TCheckBox
          Left = 209
          Top = 349
          Width = 313
          Height = 17
          Caption = 'Recalcular divergências do período informado'
          TabOrder = 8
          OnClick = cbRecalculoClick
        end
        object cbExcluiAbono: TCheckBox
          Left = 209
          Top = 367
          Width = 313
          Height = 17
          Caption = 'Excluir abonos do período informado'
          TabOrder = 9
          OnClick = cbExcluiAbonoClick
        end
        inline molAdministradora1: TmolAdministradora
          Left = 24
          Top = 158
          Width = 545
          TabOrder = 10
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
        object bbSaldo: TButton
          Left = 560
          Top = 264
          Width = 75
          Height = 25
          Caption = 'teste saldo'
          Enabled = False
          TabOrder = 11
          Visible = False
          OnClick = bbSaldoClick
        end
        object cbSoPagas: TCheckBox
          Left = 210
          Top = 331
          Width = 313
          Height = 17
          Caption = 'Exibir APENAS parcelas pagas'
          Checked = True
          State = cbChecked
          TabOrder = 12
          OnClick = cbExcluiAbonoClick
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Confirma'
        object grdParc: TwwDBGrid
          Left = 0
          Top = 27
          Width = 669
          Height = 327
          Selected.Strings = (
            'CHKINTEGRA'#9'3'#9'  '
            'NUMCONTRATO'#9'15'#9'Nº do Contrato'
            'NOMECONTRATO'#9'36'#9'Descrição do Contrato'
            'RAZAOSOCIAL'#9'36'#9'Comprador'
            'DATAVENCIMENTO'#9'12'#9'Vencimento'
            'DATABAIXA'#9'12'#9'Pagamento'
            'VLRPRESTACAO'#9'16'#9'Valor Prestação'
            'VALORPAGO'#9'16'#9'Valor Pago')
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
          Top = 354
          Width = 669
          Height = 43
          Align = alBottom
          TabOrder = 0
          object btnSeleciona: TSpeedButton
            Left = 7
            Top = 9
            Width = 119
            Height = 30
            Hint = 'Marca todas as parcelas para conciliar'
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
            Hint = 'Desmarca todas as parcelas para conciliar'
            Caption = 'Desmarca Todas'
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
          Width = 669
          Height = 27
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Parcelas à Conciliar'
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
        Caption = 'Diverge'
        object pDiverge: TPanel
          Left = 0
          Top = 0
          Width = 669
          Height = 27
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Parcelas com Divergências de Pagamento'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object grdDiverge: TwwDBGrid
          Left = 0
          Top = 27
          Width = 669
          Height = 324
          Selected.Strings = (
            'CHKBOLETO'#9'2'#9'   '#9'F'
            'NUMCONTRATO'#9'15'#9'Nº do Contrato'#9'F'
            'NOMECONTRATO'#9'35'#9'Descrição do Contrato'#9'F'
            'CODDOCUMENTO'#9'10'#9'Documento'#9'F'
            'DATAVENCIMENTO'#9'12'#9'Dt. Vencimento '#9'F'
            'VLRPRESTACAO'#9'10'#9'Valor Prestação '#9'F'
            'DATALIMITE'#9'12'#9'Data Limite'#9'F'
            'DATABAIXA'#9'12'#9'Dt. Pagamento '#9'F'
            'VLRPAGO'#9'16'#9'Valor Pago'#9'F'
            'DSC_STATUS'#9'7'#9'Tipo Baixa '#9'F'
            'SALDO_DOC'#9'12'#9'Saldo Doc.'#9'F'
            'VLRCMATRASO'#9'12'#9'Correção'#9'F'
            'VLRMORAATRASO'#9'12'#9'Juros'#9'F'
            'VLRMULTAATRASO'#9'12'#9'Multa'#9'F'
            'DIASDIF'#9'6'#9'Dias'#9'F'
            'VLRDIF'#9'16'#9'Divergência'#9'F'
            'VLRCMCORRIG'#9'10'#9'Correção s/ Div.'#9'F'
            'VLRJUROSCORRIG'#9'10'#9'Juros s/ Div. + CM'#9'F'
            'VLRCORRIG'#9'10'#9'Div. Atualizada'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          BorderStyle = bsNone
          DataSource = dsDiverge
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = grdDivergeCalcCellColors
          OnDblClick = grdDivergeDblClick
          IndicatorColor = icBlack
          OnTopRowChanged = grdParcTopRowChanged
        end
        object Panel3: TPanel
          Left = 0
          Top = 351
          Width = 669
          Height = 46
          Align = alBottom
          TabOrder = 2
          object sbImprime: TSpeedButton
            Left = 447
            Top = 8
            Width = 100
            Height = 30
            Hint = 'Imprime relatório de divergências'
            Caption = 'Imprimir'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
              00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
              8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
              8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
              8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
              03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
              03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
              33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
              33333337FFFF7733333333300000033333333337777773333333}
            NumGlyphs = 2
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = sbImprimeClick
          end
          object sbBoleto: TSpeedButton
            Left = 239
            Top = 8
            Width = 100
            Height = 30
            Hint = 'Gera boleto com os valores divergentes das parcelas selecionadas'
            Caption = 'Gerar Boleto'
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
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
              0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0FEEEEEEE
              F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
              F05557F7F777777757F550F0FF777FFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
              F05557F7F777777757F550F0FF7F777FF05557F7F5FFFFFFF7F550F0FEEEEEEE
              F05557F7F777777757F550F0FF77F7FFF05557F7F5FFFFFFF7F550F0FEEEEEEE
              F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
              005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
              0555557575757575755555505050505055555557575757575555}
            NumGlyphs = 2
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = sbBoletoClick
          end
          object sbAbona: TSpeedButton
            Left = 343
            Top = 8
            Width = 100
            Height = 30
            Hint = 'Abona as divergências selecionadas'
            Caption = 'Abonar'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008B88888BCB88
              888B888888887888888888BB888BCB888BB8888888887888888888BBBB8CCC8B
              BBB88888888777888888888B8CCCCCCC8B888888877777778888888BCC88C88C
              CB8888887788788778888888CC88C88CC888888877887887788888888888C88C
              C8888888888878877888888B888CCCCC8B8888888887777788888BBB8CCCCC88
              8BBB8888877777888888888BCC88C8888B8888887788788888888888CC88C88C
              C8888888778878877888888BCC88C88CCB888888778878877888888B8CCCCCCC
              8B88888887777777888888BBBB8CCC8BBBB8888888877788888888BB888BCB88
              8BB888888888788888888B88888BCB88888B8888888878888888}
            NumGlyphs = 2
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = sbAbonaClick
          end
          object sbMarcaTudo: TSpeedButton
            Left = 11
            Top = 8
            Width = 106
            Height = 30
            Hint = 'Marca todas as parcelas para conciliar'
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
            OnClick = sbMarcaTudoClick
          end
          object sbDesmarcaTudo: TSpeedButton
            Left = 121
            Top = 8
            Width = 106
            Height = 30
            Hint = 'Desmarca todas as parcelas para conciliar'
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
            OnClick = sbDesmarcaTudoClick
          end
          object btnCancelar3: TfcShapeBtn
            Left = 554
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
            TabOrder = 0
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnCancelar3Click
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 397
    Width = 669
    inherited tb97Fundo: TToolbar97
      Left = 457
      DockPos = 457
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
  object dsParc: TwwDataSource
    AutoEdit = False
    DataSet = qryParc
    Left = 288
    Top = 209
  end
  object qryParc: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryParcCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     (1) CHKINTEGRA,'
      '     MIN(CI.IDCONTRATOIMOVEL)  AS IDCONTRATOIMOVEL,'
      '     MIN(CI.CONNUMERO)         AS NUMCONTRATO,'
      '     MIN(CI.CONNOME)           AS NOMECONTRATO,'
      '     MIN(IM.NOMEMESTRE)        AS NOMEMESTRE,'
      '     PR.IDPARCFINANCIMOV,'
      '     PR.IDCONDPAGIMOVEL,'
      '     MIN(PR.FLGTIPOLANC)       AS FLGTIPOLANC,'
      '     MIN(PR.CODDOCUMENTO)      AS CODDOCUMENTO,'
      '     MIN(PR.PLNCODIGO)         AS PLNCODIGO,'
      '     MIN(PR.VLRPRESTACAO)      AS VLRPRESTACAO,'
      '     MIN(PR.DATAVENCIMENTO)    AS DATAVENCIMENTO,'
      '     MIN(PR.NUMPARCELA)        AS NUMPARCELA,'
      '     MIN(CI.IDLOCATARIO)       AS IDPESSOA,'
      '     MIN(P.RAZAOSOCIAL)        AS RAZAOSOCIAL,'
      ''
      '     MIN(CI.IDCIDADES)         AS IDCIDADES,'
      '     MIN(CI.IDPAIS)            AS IDPAIS,'
      '     MIN(CI.CODESTADO)         AS CODESTADO,'
      '     MIN(BX.FLGNAOCONCILIADO)  AS FLGNAOCONCILIADO,'
      ''
      '     MIN(PR.FLGCONCILIADO)     AS FLGCONCILIADO,'
      '     MIN(PR.IDPARCDIVERGE)     AS IDPARCDIVERGE,'
      '     MIN(PR.FLGLANCINTEGRA)    AS FLGLANCINTEGRA,'
      ''
      
        '     DECODE(MIN(PR.FLGLANCINTEGRA),3,2, 4,2, MIN(BX.STATUS) ) AS' +
        ' STATUS,'
      ''
      ''
      '     DECODE(MIN(PR.FLGLANCINTEGRA),'
      '                3,MIN(PR.DATAPAGAMENTO),'
      '                4,MIN(PR.DATAPAGAMENTO),'
      '                5,MIN(PR.DATAPAGAMENTO),'
      '                6,MIN(PR.DATAPAGAMENTO),'
      '                  MIN(DECODE(NVL(BX.VALORPAGO,0), 0, NULL,'
      
        '                  DECODE(BX.DATABAIXARP,NULL,BX.DATABAIXA, BX.DA' +
        'TABAIXARP) ))'
      '     ) AS DATABAIXA,'
      ''
      '     DECODE(MIN(PR.FLGLANCINTEGRA),'
      '                3,MIN(PR.VLRPAGO),'
      '                4,MIN(PR.VLRPAGO),'
      '                5,MIN(PR.VLRPAGO),'
      '                6,MIN(PR.VLRPAGO),'
      
        '                  MIN(DECODE(NVL(BX.VALORPAGO,0), 0, NULL, BX.VA' +
        'LORPAGO)) ) AS VALORPAGO'
      ''
      'FROM'
      '     PARCFINANCIMOV PR,'
      '     CONDPAGIMOVEL CP,'
      '     CONTRATOIMOVEL CI,'
      '     PESSOA P,'
      '     ('
      '       SELECT CXI.IDCONTRATOIMOVEL, M.IMONOME AS NOMEMESTRE'
      '         FROM CONTRATOXIMOVEL CXI, IMOVEL I, IMOVEL M'
      '        WHERE CXI.IDIMOVEL = I.IDIMOVEL'
      '          AND I.IDIMOVELMESTRE = M.IDIMOVEL'
      '      ) IM,'
      ''
      ''
      '       ( SELECT D.CODDOCUMENTO,'
      '                D.FLGNAOCONCILIADO,'
      '                D.STATUS,'
      '                MIN(LD.DATALANCTO) AS DATABAIXA,'
      '                MIN(RP.DATABAIXA)  AS DATABAIXARP,'
      '                SUM(LD.VALOR)      AS VALORPAGO'
      '         FROM DOCUMENTO D, LANCTODOCUM LD, RECBTOPAGTO RP'
      
        '         WHERE ( D.IDMODULO IN(135,64) OR D.CODDOCUMENTO IN(SELE' +
        'CT CODDOCUMENTO FROM PARCFINANCIMOV) )'
      
        '           AND ( RTRIM(LD.OPERACAO) = '#39'5'#39' OR LD.CODALTERADOR = :' +
        'pCPMF )'
      '           AND ( LD.ESTORNO IS NULL )'
      '           AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )'
      '           AND ( LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) )'
      '           AND ( LD.NUMLANCTO    = RP.NUMLANCTO(+) )'
      '        GROUP BY D.CODDOCUMENTO, D.FLGNAOCONCILIADO, D.STATUS'
      '        ) BX'
      ''
      'WHERE'
      '       ( PR.FLGLANCINTEGRA > 1 )'
      '   AND ( PR.FLGCONCILIADO IS NULL OR PR.FLGCONCILIADO <> '#39'C'#39')'
      '   AND ((:PRECALCULO IS NOT NULL) OR ( BX.VALORPAGO > 0 ))'
      
        '   AND ((:PRECALCULO IS NOT NULL) OR ( BX.FLGNAOCONCILIADO = 1 )' +
        ')'
      '   AND (CI.FLGSTATUS = '#39'V'#39')'
      '   AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      '   AND (CP.IDCONDPAGIMOVEL = PR.IDCONDPAGIMOVEL)'
      '   AND (CI.IDLOCATARIO = P.IDPESSOA)'
      '   AND (CI.IDCONTRATOIMOVEL = IM.IDCONTRATOIMOVEL(+))'
      '   AND (PR.CODDOCUMENTO = BX.CODDOCUMENTO(+))'
      '   AND ((:pDATAI IS NULL) OR (PR.DATAVENCIMENTO >= :pDATAI))'
      '   AND ((:pDATAF IS NULL) OR (PR.DATAVENCIMENTO <= :pDATAF))'
      '   AND ((:pIDPESSOA IS NULL) OR (CI.IDLOCATARIO = :pIDPESSOA))'
      
        '   AND ((:pIDRESPONSAVEL IS NULL) OR (CI.IDRESPONSAVEL = :pIDRES' +
        'PONSAVEL))'
      
        '   AND ((:pIDADMINIMOVEL IS NULL) OR (CI.IDADMINIMOVEL = :pIDADM' +
        'INIMOVEL))'
      
        '   AND ((:pIDCONTRATO IS NULL) OR (CI.IDCONTRATOIMOVEL = :pIDCON' +
        'TRATO))'
      '   AND (   ((:pSINAL = '#39'S'#39') AND (PR.FLGTIPOLANC = 2))'
      '        OR ((:pGERA  = '#39'S'#39') AND (PR.FLGTIPOLANC = 3))'
      '        OR ((:pAMORT = '#39'S'#39') AND (PR.FLGTIPOLANC = 5))'
      '        OR ((:pEXTRA = '#39'S'#39') AND (PR.FLGTIPOLANC = 6))'
      '        OR ((:pVISTA = '#39'S'#39') AND (PR.FLGTIPOLANC = 7))'
      '        OR ((:pANTEC = '#39'S'#39') AND (PR.FLGTIPOLANC = 9)) )'
      ''
      'GROUP BY PR.IDCONDPAGIMOVEL, PR.IDPARCFINANCIMOV'
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
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updParc
    ControlType.Strings = (
      'CODDOCUMENTO;CheckBox;1;0'
      'CHKINTEGRA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 248
    Top = 241
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pCPMF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECALCULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRECALCULO'
        ParamType = ptUnknown
      end
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
      end
      item
        DataType = ftString
        Name = 'pGERA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pAMORT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pEXTRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pVISTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pANTEC'
        ParamType = ptUnknown
      end>
    object qryParcCHKINTEGRA: TFloatField
      DisplayLabel = '  '
      DisplayWidth = 3
      FieldName = 'CHKINTEGRA'
    end
    object qryParcNUMCONTRATO: TStringField
      DisplayLabel = 'Nº do Contrato'
      DisplayWidth = 15
      FieldName = 'NUMCONTRATO'
    end
    object qryParcNOMECONTRATO: TStringField
      DisplayLabel = 'Descrição do Contrato'
      DisplayWidth = 36
      FieldName = 'NOMECONTRATO'
      Size = 60
    end
    object qryParcRAZAOSOCIAL: TStringField
      DisplayLabel = 'Comprador'
      DisplayWidth = 36
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryParcDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 12
      FieldName = 'DATAVENCIMENTO'
    end
    object qryParcDATABAIXA: TDateTimeField
      DisplayLabel = 'Pagamento'
      DisplayWidth = 12
      FieldName = 'DATABAIXA'
    end
    object qryParcVLRPRESTACAO: TFloatField
      DisplayLabel = 'Valor Prestação'
      DisplayWidth = 16
      FieldName = 'VLRPRESTACAO'
      DisplayFormat = '#,##0.00'
    end
    object qryParcVALORPAGO: TFloatField
      DisplayLabel = 'Valor Pago'
      DisplayWidth = 16
      FieldName = 'VALORPAGO'
      DisplayFormat = '#,##0.00'
    end
    object qryParcFLGCONCILIADO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCONCILIADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryParcIDPARCDIVERGE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPARCDIVERGE'
      Visible = False
    end
    object qryParcSTATUS: TFloatField
      DisplayWidth = 10
      FieldName = 'STATUS'
      Visible = False
    end
    object qryParcCAL_TIPO: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'CAL_TIPO'
      Visible = False
      Calculated = True
    end
    object qryParcCODDOCUMENTO: TFloatField
      DisplayLabel = '   '
      DisplayWidth = 1
      FieldName = 'CODDOCUMENTO'
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
    object qryParcFLGTIPOLANC: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGTIPOLANC'
      Visible = False
    end
    object qryParcFLGNAOCONCILIADO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGNAOCONCILIADO'
      Visible = False
    end
    object qryParcIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
      Visible = False
    end
    object qryParcIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Visible = False
    end
    object qryParcCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qryParcFLGLANCINTEGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGLANCINTEGRA'
      Visible = False
    end
  end
  object qryUpdConcilia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE DOCUMENTO'
      'SET FLGNAOCONCILIADO = NULL'
      'WHERE CODDOCUMENTO = :pCODDOCUMENTO'
      '')
    ValidateWithMask = True
    Left = 164
    Top = 210
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryUpdParc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   PARCFINANCIMOV'
      'SET'
      '   DATAPAGAMENTO      = :pDATAPAG,'
      '   DATALIMITE         = :pDATALIMITE,'
      '   VLRCORRIGIDOATRASO = :pCORRIGIDO,'
      '   VLRPAGO            = :pVLRPAGO,'
      '   VLRMULTAATRASO     = :pMULTA,'
      '   VLRMORAATRASO      = :pMORA,'
      '   FLGCONCILIADO      = :pCONCILIA,'
      '   VLRPRESTCORRIG     = NULL,'
      '   VLRMULTACORRIG     = NULL,'
      '   VLRJUROSCORRIG     = NULL'
      'WHERE'
      '   ( IDPARCFINANCIMOV = :pIDPARCFINANCIMOV )'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 157
    Top = 281
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'pDATAPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDATALIMITE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pCORRIGIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pVLRPAGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pMULTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pMORA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pCONCILIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDPARCFINANCIMOV'
        ParamType = ptUnknown
      end>
  end
  object qryDiverge: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     MIN(0)                     AS CHKBOLETO,'
      '     MIN(CI.IDCONTRATOIMOVEL)   AS IDCONTRATOIMOVEL,'
      '     MIN(CI.CONNUMERO)          AS NUMCONTRATO,'
      '     MIN(CI.CONNOME)            AS NOMECONTRATO,'
      '     MIN(IM.NOMEMESTRE)         AS NOMEMESTRE,'
      '     MIN(IM.CODTIPIMOVEL)       AS CODTIPIMOVEL,'
      '     PR.IDPARCFINANCIMOV,'
      '     PR.IDCONDPAGIMOVEL,'
      '     MIN(PR.NUMPARCELA)         AS NUMPARCELA,'
      '     MIN(PR.CODDOCUMENTO)       AS CODDOCUMENTO,'
      '     MIN(PR.FLGTIPOLANC)        AS FLGTIPOLANC,'
      '     MIN(PR.FLGCONCILIADO)      AS FLGCONCILIADO,'
      '     MIN(PR.VLRPRESTACAO)       AS VLRPRESTACAO,'
      '     MIN(PR.DATAVENCIMENTO)     AS DATAVENCIMENTO,'
      '     MIN(PP.DATAPAGAMENTO)      AS DATABAIXA,'
      '     MIN(PP.VLRPAGO)            AS VLRPAGO,'
      '     MIN(PR.DATALIMITE)         AS DATALIMITE,'
      '     MIN(NVL(SD.SALDO_DOC,0))   AS SALDO_DOC,'
      '     MIN(PP.DATAPAGAMENTO - PR.DATALIMITE) AS DIASDIF,'
      '     MIN(CI.IDLOCATARIO)        AS IDPESSOA,'
      '     MIN(P.RAZAOSOCIAL)         AS RAZAOSOCIAL,'
      
        '     DECODE(MIN(PR.FLGLANCINTEGRA), 3,2, 4,2, MIN(D.STATUS) ) AS' +
        ' STATUS,'
      
        '     DECODE(MIN(PR.FLGLANCINTEGRA), 3,'#39'Manual'#39', 4,'#39'Importada'#39', D' +
        'ECODE(MIN(D.STATUS),2,'#39'Total'#39','#39'Parcial'#39') ) AS DSC_STATUS,'
      '     MIN(CMA.VLRCORRIGIDOATRASO) AS VLRCMATRASO,'
      '     MIN(MA.VLRMULTAATRASO)     AS VLRMULTAATRASO,'
      '     MIN(JA.VLRMORAATRASO)      AS VLRMORAATRASO,'
      
        '     ROUND(MIN(  DECODE(PR.FLGTIPOLANC,4,0,DECODE(PR.CODDOCUMENT' +
        'O, NULL, NVL(PR.VLRPRESTACAO,0) - NVL(PP.VLRPAGO,0),'
      
        '                 ROUND( ( ( NVL(PR.VLRPRESTACAO,0) + NVL( CMA.VL' +
        'RCORRIGIDOATRASO, 0 ) + NVL( MA.VLRMULTAATRASO, 0 ) + NVL( JA.VL' +
        'RMORAATRASO, 0 ) ) - NVL( PP.VLRPAGO, 0 ) ), 2 ) )) ),2)AS VLRDI' +
        'F,'
      
        '     ROUND(MIN(  DECODE(PR.FLGTIPOLANC,4,0,DECODE(PR.CODDOCUMENT' +
        'O, NULL, NVL(PR.VLRPRESTACAO,0) - NVL(PP.VLRPAGO,0),'
      
        '                 ROUND( ( ( NVL(PR.VLRPRESTACAO,0) + NVL( CMA.VL' +
        'RCORRIGIDOATRASO, 0 ) + NVL( MA.VLRMULTAATRASO, 0 ) + NVL( JA.VL' +
        'RMORAATRASO, 0 ) ) - NVL( PP.VLRPAGO, 0 ) ), 2 ) )) ),2)+'
      
        '     ROUND(MIN( ( NVL(CMS.VLRCORRIGIDOSALDO,0) + NVL(MS.VLRMULTA' +
        'SALDO,0) + NVL(JS.VLRMORASALDO,0) ) ), 2) AS VLRCORRIG,'
      '     MIN(NVL(PR.VLRPRESTCORRIG,0)) AS VLRPRESTCORRIG,'
      '     MIN(NVL(CMS.VLRCORRIGIDOSALDO,0)) AS VLRCMCORRIG,'
      '     MIN(NVL(JS.VLRMORASALDO,0)) AS VLRJUROSCORRIG,'
      '     MIN(NVL(MS.VLRMULTASALDO,0)) AS VLRMULTACORRIG'
      'FROM'
      '     PARCFINANCIMOV PR,'
      '     CONDPAGIMOVEL CP,'
      '     CONTRATOIMOVEL CI,'
      '     DOCUMENTO D,'
      '     PESSOA P,'
      '       ('
      '         SELECT /*+ INDEX(LD) INDEX(RP)*/'
      '                IDPARCFINANCIMOV,'
      
        '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.DATAPAGAMENTO' +
        '), MAX(RP.DATABAIXA) ) AS DATAPAGAMENTO,'
      
        '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.VLRPAGO), SUM' +
        '(LD.VALOR) ) AS VLRPAGO'
      '           FROM PARCFINANCIMOV P, LANCTODOCUM LD, RECBTOPAGTO RP'
      '          WHERE P.CODDOCUMENTO  = LD.CODDOCUMENTO(+)'
      '            AND LD.CODDOCUMENTO = RP.CODDOCUMENTO(+)'
      '            AND LD.NUMLANCTO    = RP.NUMLANCTO(+)'
      
        '            AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENTO <' +
        '= :pDATAD ) OR'
      
        '                 (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPER' +
        'ACAO) = '#39'5'#39' OR LD.CODALTERADOR = 215 )'
      
        '                                             AND LD.ESTORNO IS N' +
        'ULL'
      
        '                                             AND LD.DATALANCTO <' +
        '= :pDATAD ) )'
      '          GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO'
      '       ) PP,'
      '     ( SELECT P2.IDPARCFINANCIMOV,'
      '              (P2.VLRPRESTACAO - P2.VLRPAGO) AS SALDO_DOC'
      '         FROM PARCFINANCIMOV P2, CONDPAGIMOVEL C2'
      '        WHERE P2.IDCONDPAGIMOVEL = C2.IDCONDPAGIMOVEL'
      '          AND P2.VLRPAGO IS NOT NULL'
      '          AND P2.VLRPAGO < P2.VLRPRESTACAO'
      
        '          AND ((:PIDCONTRATO IS NULL) OR (C2.IDCONTRATOIMOVEL = ' +
        ':PIDCONTRATO))  ) SD,'
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
      ','
      '       ( SELECT /*+ INDEX (L) */'
      
        '                L.IDPARCFINANCIMOV, SUM(L.VLRACUM) AS VLRMULTAAT' +
        'RASO'
      '           FROM LANCOPERDIAIMOB L, PARAMALIENACAO P,'
      '                ( SELECT MAX(L2.DATAOPER) AS DTAPUR'
      '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2'
      '                   WHERE P2.IDPESSOA = 1'
      '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA)'
      
        '                     AND ( (:pDATAD IS NOT NULL AND DATAOPER <= ' +
        ':pDATAD) OR'
      
        '                           (:pDATAD IS NULL AND DATAOPER <= SYSD' +
        'ATE) ) ) D'
      '          WHERE L.DATAOPER = D.DTAPUR'
      '            AND L.DATABAIXA IS NOT NULL'
      '            AND P.IDPESSOA  = 1'
      '            AND ( L.IDOPERACAO = P.IDOPERATUALMULTA )'
      '          GROUP BY L.IDPARCFINANCIMOV'
      '        ) MA,'
      '       ( SELECT /*+ INDEX (L) */'
      
        '                L.IDPARCFINANCIMOV, SUM(L.VLRACUM) AS VLRMORAATR' +
        'ASO'
      '           FROM LANCOPERDIAIMOB L, PARAMALIENACAO P,'
      '                ( SELECT MAX(L2.DATAOPER) AS DTAPUR'
      '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2'
      '                   WHERE P2.IDPESSOA = 1'
      '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALJUROS)'
      
        '                     AND ( (:pDATAD IS NOT NULL AND DATAOPER <= ' +
        ':pDATAD) OR'
      
        '                           (:pDATAD IS NULL AND DATAOPER <= SYSD' +
        'ATE) ) ) D'
      '          WHERE L.DATAOPER = D.DTAPUR'
      '            AND L.DATABAIXA IS NOT NULL'
      '            AND P.IDPESSOA = 1'
      '            AND ( L.IDOPERACAO = P.IDOPERATUALJUROS )'
      '          GROUP BY L.IDPARCFINANCIMOV'
      '        ) JA,'
      '       ( SELECT /*+ INDEX (L) */'
      
        '                L.IDPARCFINANCIMOV, SUM(L.VLRACUM) AS VLRCORRIGI' +
        'DOATRASO'
      '           FROM LANCOPERDIAIMOB L, PARAMALIENACAO P,'
      '                ( SELECT MAX(L2.DATAOPER) AS DTAPUR'
      '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2'
      '                   WHERE P2.IDPESSOA = 1'
      '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALCM)'
      
        '                     AND ( (:pDATAD IS NOT NULL AND DATAOPER <= ' +
        ':pDATAD) OR'
      
        '                           (:pDATAD IS NULL AND DATAOPER <= SYSD' +
        'ATE) ) ) D'
      '          WHERE L.DATAOPER = D.DTAPUR'
      '            AND L.DATABAIXA IS NOT NULL'
      '            AND P.IDPESSOA = 1'
      '            AND ( L.IDOPERACAO = P.IDOPERATUALCM )'
      '          GROUP BY L.IDPARCFINANCIMOV'
      '        ) CMA,'
      '       ( SELECT /*+ INDEX (L) */'
      
        '                L.IDPARCFINANCIMOV, SUM(L.VLRACUM) AS VLRMULTASA' +
        'LDO'
      '           FROM LANCOPERDIAIMOB L, PARAMALIENACAO P,'
      '                ( SELECT MAX(L2.DATAOPER) AS DTAPUR'
      '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2'
      '                   WHERE P2.IDPESSOA = 1'
      '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA)'
      
        '                     AND ( (:pDATAD IS NOT NULL AND DATAOPER <= ' +
        ':pDATAD) OR'
      
        '                           (:pDATAD IS NULL AND DATAOPER <= SYSD' +
        'ATE) ) ) D'
      '          WHERE L.DATAOPER = D.DTAPUR'
      '            AND L.DATABAIXA IS NULL'
      '            AND P.IDPESSOA = 1'
      '            AND ( L.IDOPERACAO = P.IDOPERATUALMULTA )'
      '          GROUP BY L.IDPARCFINANCIMOV'
      '        ) MS,'
      '       ( SELECT /*+ INDEX (L) */'
      
        '                L.IDPARCFINANCIMOV, SUM(L.VLRACUM) AS VLRMORASAL' +
        'DO'
      '           FROM LANCOPERDIAIMOB L, PARAMALIENACAO P,'
      '                ( SELECT MAX(L2.DATAOPER) AS DTAPUR'
      '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2'
      '                   WHERE P2.IDPESSOA = 1'
      '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALJUROS)'
      
        '                     AND ( (:pDATAD IS NOT NULL AND DATAOPER <= ' +
        ':pDATAD) OR'
      
        '                           (:pDATAD IS NULL AND DATAOPER <= SYSD' +
        'ATE) ) ) D'
      '          WHERE L.DATAOPER = D.DTAPUR'
      '            AND L.DATABAIXA IS NULL'
      '            AND P.IDPESSOA = 1'
      '            AND ( L.IDOPERACAO = P.IDOPERATUALJUROS )'
      '          GROUP BY L.IDPARCFINANCIMOV'
      '        ) JS,'
      '       ( SELECT /*+ INDEX (L) */'
      
        '                L.IDPARCFINANCIMOV, SUM(L.VLRACUM) AS VLRCORRIGI' +
        'DOSALDO'
      '           FROM LANCOPERDIAIMOB L, PARAMALIENACAO P,'
      '                ( SELECT MAX(L2.DATAOPER) AS DTAPUR'
      '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2'
      '                   WHERE P2.IDPESSOA = 1'
      '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALCM)'
      
        '                     AND ( (:pDATAD IS NOT NULL AND DATAOPER <= ' +
        ':pDATAD) OR'
      
        '                           (:pDATAD IS NULL AND DATAOPER <= SYSD' +
        'ATE) ) ) D'
      '          WHERE L.DATAOPER = D.DTAPUR'
      '            AND L.DATABAIXA IS NULL'
      '            AND P.IDPESSOA = 1'
      '            AND ( L.IDOPERACAO = P.IDOPERATUALCM )'
      '          GROUP BY L.IDPARCFINANCIMOV'
      '        ) CMS'
      'WHERE'
      
        '       ( ((PR.FLGCONCILIADO <> '#39'S'#39') AND (PR.FLGCONCILIADO <> '#39'C'#39 +
        ')) OR (PR.FLGCONCILIADO IS NULL) )'
      '   AND (PR.DATAPAGAMENTO IS NOT NULL )'
      '   AND (PR.FLGLANCINTEGRA > 1)'
      '   AND (PR.CODDOCUMENTO = D.CODDOCUMENTO(+))'
      '   AND (PR.IDPARCFINANCIMOV = SD.IDPARCFINANCIMOV(+))'
      '   AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      '   AND (CP.IDCONDPAGIMOVEL  = PR.IDCONDPAGIMOVEL)'
      '   AND (CI.IDLOCATARIO      = P.IDPESSOA)'
      '   AND (CI.IDCONTRATOIMOVEL = IM.IDCONTRATOIMOVEL(+))'
      '   AND ((:pDATAI IS NULL) OR (PR.DATAVENCIMENTO >= :pDATAI))'
      '   AND ((:pDATAF IS NULL) OR (PR.DATAVENCIMENTO <= :pDATAF))'
      '   AND ((:pDATAD IS NULL) OR (PP.DATAPAGAMENTO <= :pDATAD))'
      '   AND ((:pIDPESSOA IS NULL) OR (CI.IDLOCATARIO = :pIDPESSOA))'
      
        '   AND ((:pIDRESPONSAVEL IS NULL) OR (CI.IDRESPONSAVEL = :pIDRES' +
        'PONSAVEL))'
      
        '   AND ((:pIDADMINIMOVEL IS NULL) OR (CI.IDADMINIMOVEL = :pIDADM' +
        'INIMOVEL))'
      
        '   AND ((:pIDCONTRATO IS NULL) OR (CI.IDCONTRATOIMOVEL = :pIDCON' +
        'TRATO))'
      '   AND (   ((:pSINAL = '#39'S'#39') AND (PR.FLGTIPOLANC = 2))'
      '        OR ((:pGERA  = '#39'S'#39') AND (PR.FLGTIPOLANC = 3))'
      '        OR ((:pAMORT = '#39'S'#39') AND (PR.FLGTIPOLANC = 5))'
      '        OR ((:pEXTRA = '#39'S'#39') AND (PR.FLGTIPOLANC = 6))'
      '        OR ((:pVISTA = '#39'S'#39') AND (PR.FLGTIPOLANC = 7))'
      '        OR ((:pANTEC = '#39'S'#39') AND (PR.FLGTIPOLANC = 9)) )'
      '   AND PR.IDPARCFINANCIMOV = PP.IDPARCFINANCIMOV(+)'
      'AND PR.IDPARCFINANCIMOV = JA.IDPARCFINANCIMOV(+)'
      'AND PR.IDPARCFINANCIMOV = MA.IDPARCFINANCIMOV(+)'
      'AND PR.IDPARCFINANCIMOV = CMA.IDPARCFINANCIMOV(+)'
      'AND PR.IDPARCFINANCIMOV = JS.IDPARCFINANCIMOV(+)'
      'AND PR.IDPARCFINANCIMOV = MS.IDPARCFINANCIMOV(+)'
      'AND PR.IDPARCFINANCIMOV = CMS.IDPARCFINANCIMOV(+)'
      'GROUP BY PR.IDCONDPAGIMOVEL, PR.IDPARCFINANCIMOV'
      
        'ORDER BY NUMCONTRATO, IDCONDPAGIMOVEL, DATAVENCIMENTO, NUMPARCEL' +
        'A'
      ''
      ' ')
    UpdateObject = updDiverge
    ControlType.Strings = (
      'CHKBOLETO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 352
    Top = 241
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'pDATAD'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAD'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAD'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAD'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAD'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAD'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAD'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAD'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAD'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAD'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAD'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAD'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAD'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAD'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAD'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAD'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAD'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAD'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAD'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAD'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDATAD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDRESPONSAVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDRESPONSAVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pSINAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pGERA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pAMORT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pEXTRA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pVISTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pANTEC'
        ParamType = ptInput
      end>
    object qryDivergeCHKBOLETO: TFloatField
      DisplayLabel = '   '
      DisplayWidth = 2
      FieldName = 'CHKBOLETO'
    end
    object qryDivergeNUMCONTRATO: TStringField
      DisplayLabel = 'Nº do Contrato'
      DisplayWidth = 15
      FieldName = 'NUMCONTRATO'
    end
    object StringField2: TStringField
      DisplayLabel = 'Descrição do Contrato'
      DisplayWidth = 35
      FieldName = 'NOMECONTRATO'
      Size = 60
    end
    object qryDivergeCODDOCUMENTO: TFloatField
      DisplayLabel = 'Documento'
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Dt. Vencimento '
      DisplayWidth = 12
      FieldName = 'DATAVENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryDivergeVLRPRESTACAO: TFloatField
      DisplayLabel = 'Valor Prestação '
      DisplayWidth = 10
      FieldName = 'VLRPRESTACAO'
      DisplayFormat = '#,##0.00'
    end
    object qryDivergeDATALIMITE: TDateTimeField
      DisplayLabel = 'Data Limite'
      DisplayWidth = 12
      FieldName = 'DATALIMITE'
    end
    object qryDivergeDATABAIXA: TDateTimeField
      DisplayLabel = 'Dt. Pagamento '
      DisplayWidth = 12
      FieldName = 'DATABAIXA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryDivergeVLRPAGO: TFloatField
      DisplayLabel = 'Valor Pago'
      DisplayWidth = 16
      FieldName = 'VLRPAGO'
      DisplayFormat = '#,##0.00'
    end
    object qryDivergeDSC_STATUS: TStringField
      DisplayLabel = 'Tipo Baixa '
      DisplayWidth = 7
      FieldName = 'DSC_STATUS'
      Size = 7
    end
    object qryDivergeSALDO_DOC: TFloatField
      DisplayLabel = 'Saldo Doc.'
      DisplayWidth = 12
      FieldName = 'SALDO_DOC'
      DisplayFormat = '#,##0.00'
    end
    object qryDivergeVLRCMATRASO: TFloatField
      DisplayLabel = 'Correção'
      DisplayWidth = 12
      FieldName = 'VLRCMATRASO'
      DisplayFormat = '#,##0.00'
    end
    object qryDivergeVLRMORAATRASO: TFloatField
      DisplayLabel = 'Juros'
      DisplayWidth = 12
      FieldName = 'VLRMORAATRASO'
      DisplayFormat = '#,##0.00'
    end
    object qryDivergeVLRMULTAATRASO: TFloatField
      DisplayLabel = 'Multa'
      DisplayWidth = 12
      FieldName = 'VLRMULTAATRASO'
      DisplayFormat = '#,##0.00'
    end
    object qryDivergeDIASDIF: TFloatField
      DisplayLabel = 'Dias'
      DisplayWidth = 6
      FieldName = 'DIASDIF'
    end
    object qryDivergeVLRDIF: TFloatField
      DisplayLabel = 'Divergência'
      DisplayWidth = 16
      FieldName = 'VLRDIF'
      DisplayFormat = '#,##0.00'
    end
    object qryDivergeVLRCMCORRIG: TFloatField
      DisplayLabel = 'Correção s/ Div.'
      DisplayWidth = 10
      FieldName = 'VLRCMCORRIG'
    end
    object qryDivergeVLRJUROSCORRIG: TFloatField
      DisplayLabel = 'Juros s/ Div. + CM'
      DisplayWidth = 10
      FieldName = 'VLRJUROSCORRIG'
    end
    object qryDivergeVLRCORRIG: TFloatField
      DisplayLabel = 'Div. Atualizada'
      DisplayWidth = 10
      FieldName = 'VLRCORRIG'
      DisplayFormat = '#,##0.00'
    end
    object qryDivergeRAZAOSOCIAL: TStringField
      DisplayLabel = 'Comprador'
      DisplayWidth = 35
      FieldName = 'RAZAOSOCIAL'
      Visible = False
      Size = 60
    end
    object qryDivergeSTATUS: TFloatField
      DisplayWidth = 10
      FieldName = 'STATUS'
      Visible = False
    end
    object StringField6: TStringField
      DisplayWidth = 60
      FieldName = 'NOMEMESTRE'
      Visible = False
      Size = 60
    end
    object qryDivergeIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDivergeIDCONDPAGIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDPAGIMOVEL'
      Visible = False
    end
    object qryDivergeFLGCONCILIADO: TStringField
      FieldName = 'FLGCONCILIADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDivergeVLRPRESTCORRIG: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRPRESTCORRIG'
      Visible = False
    end
    object qryDivergeVLRMULTACORRIG: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRMULTACORRIG'
      Visible = False
    end
    object qryDivergeCODTIPIMOVEL: TStringField
      DisplayWidth = 5
      FieldName = 'CODTIPIMOVEL'
      Visible = False
      Size = 5
    end
    object qryDivergeFLGTIPOLANC: TFloatField
      FieldName = 'FLGTIPOLANC'
      Visible = False
    end
    object qryDivergeIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
      Visible = False
    end
    object qryDivergeIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
  end
  object dsDiverge: TwwDataSource
    AutoEdit = False
    DataSet = qryDiverge
    Left = 416
    Top = 209
  end
  object rpDiverge: TppReport
    AutoStop = False
    DataPipeline = pplDiverge
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpDivergeBeforePrint
    DeviceType = 'Screen'
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 26
    Top = 296
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplDiverge'
    object HeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 16140
      mmPrintPosition = 0
      object lblRptTitulo: TppLabel
        UserName = 'lblRptTitulo'
        Caption = 'Divergências de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 71702
        mmTop = 8731
        mmWidth = 56621
        BandType = 0
      end
      object LblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84138
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
    end
    object DetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DATAVENCIMENTO'
        DataPipeline = pplDiverge
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDiverge'
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VLRPRESTACAO'
        DataPipeline = pplDiverge
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDiverge'
        mmHeight = 3175
        mmLeft = 15346
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DATABAIXA'
        DataPipeline = pplDiverge
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDiverge'
        mmHeight = 3175
        mmLeft = 50536
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VLRPAGO'
        DataPipeline = pplDiverge
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDiverge'
        mmHeight = 3175
        mmLeft = 67998
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'DIASDIF'
        DataPipeline = pplDiverge
        DisplayFormat = '###0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplDiverge'
        mmHeight = 3175
        mmLeft = 85725
        mmTop = 0
        mmWidth = 7144
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VLRCMATRASO'
        DataPipeline = pplDiverge
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDiverge'
        mmHeight = 3175
        mmLeft = 93398
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'VLRMULTAATRASO'
        DataPipeline = pplDiverge
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDiverge'
        mmHeight = 3175
        mmLeft = 108744
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'VLRMORAATRASO'
        DataPipeline = pplDiverge
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDiverge'
        mmHeight = 3175
        mmLeft = 123825
        mmTop = 0
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'VLRDIF'
        DataPipeline = pplDiverge
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDiverge'
        mmHeight = 3175
        mmLeft = 138113
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'DATALIMITE'
        DataPipeline = pplDiverge
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDiverge'
        mmHeight = 3175
        mmLeft = 32808
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'VLRCMCORRIG'
        DataPipeline = pplDiverge
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDiverge'
        mmHeight = 3175
        mmLeft = 155840
        mmTop = 0
        mmWidth = 12171
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'VLRCORRIG'
        DataPipeline = pplDiverge
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDiverge'
        mmHeight = 3175
        mmLeft = 181240
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'VLRJUROSCORRIG'
        DataPipeline = pplDiverge
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDiverge'
        mmHeight = 3175
        mmLeft = 168540
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
    end
    object FooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object Line2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object LblSistema: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object Calc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object Calc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NUMCONTRATO'
      DataPipeline = pplDiverge
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplDiverge'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 23283
        mmPrintPosition = 0
        object ppRegion1: TppRegion
          UserName = 'Region1'
          mmHeight = 12171
          mmLeft = 0
          mmTop = 0
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel1: TppLabel
            UserName = 'Label1'
            Caption = 'Contrato'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3175
            mmLeft = 1588
            mmTop = 1852
            mmWidth = 11642
            BandType = 3
            GroupNo = 0
          end
          object ppDBText1: TppDBText
            UserName = 'DBText1'
            DataField = 'NUMCONTRATO'
            DataPipeline = pplDiverge
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplDiverge'
            mmHeight = 3175
            mmLeft = 19315
            mmTop = 1852
            mmWidth = 17198
            BandType = 3
            GroupNo = 0
          end
          object ppDBText2: TppDBText
            UserName = 'DBText2'
            AutoSize = True
            DataField = 'NOMECONTRATO'
            DataPipeline = pplDiverge
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplDiverge'
            mmHeight = 3175
            mmLeft = 41010
            mmTop = 1852
            mmWidth = 24342
            BandType = 3
            GroupNo = 0
          end
          object ppLabel2: TppLabel
            UserName = 'Label2'
            Caption = 'Comprador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3175
            mmLeft = 1323
            mmTop = 6879
            mmWidth = 15346
            BandType = 3
            GroupNo = 0
          end
          object ppDBText4: TppDBText
            UserName = 'DBText4'
            AutoSize = True
            DataField = 'RAZAOSOCIAL'
            DataPipeline = pplDiverge
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplDiverge'
            mmHeight = 3175
            mmLeft = 19315
            mmTop = 7144
            mmWidth = 19844
            BandType = 3
            GroupNo = 0
          end
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Vencto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4498
          mmLeft = 0
          mmTop = 16933
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 21696
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Vlr Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4498
          mmLeft = 14817
          mmTop = 16933
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4498
          mmLeft = 51065
          mmTop = 16933
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Valor Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4498
          mmLeft = 69321
          mmTop = 16933
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4498
          mmLeft = 86519
          mmTop = 16933
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4498
          mmLeft = 128852
          mmTop = 16933
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'CM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4498
          mmLeft = 100542
          mmTop = 16933
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'Diverg.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4498
          mmLeft = 140229
          mmTop = 16933
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Multa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4498
          mmLeft = 115094
          mmTop = 16933
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label14'
          AutoSize = False
          Caption = 'Data Limite'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4498
          mmLeft = 33602
          mmTop = 16933
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label15'
          AutoSize = False
          Caption = 'CM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4498
          mmLeft = 158750
          mmTop = 16933
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label16'
          AutoSize = False
          Caption = 'Vlr Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4498
          mmLeft = 181240
          mmTop = 16933
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label17'
          AutoSize = False
          Caption = 'Divergência Atualizada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 160073
          mmTop = 12700
          mmWidth = 37042
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label11'
          AutoSize = False
          Caption = 'Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4498
          mmLeft = 171186
          mmTop = 16933
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object ppLabel12: TppLabel
          UserName = 'Label13'
          Caption = 'Total divergente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 107421
          mmTop = 1588
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLRDIF'
          DataPipeline = pplDiverge
          DisplayFormat = '###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDiverge'
          mmHeight = 3175
          mmLeft = 138113
          mmTop = 1588
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VLRCORRIG'
          DataPipeline = pplDiverge
          DisplayFormat = '###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDiverge'
          mmHeight = 3175
          mmLeft = 180446
          mmTop = 1588
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object pplDiverge: TppBDEPipeline
    DataSource = dsDiverge
    UserName = 'lDiverge'
    Left = 27
    Top = 280
  end
  object updDiverge: TUpdateSQL
    ModifySQL.Strings = (
      'update PARCFINANCIMOV'
      'set'
      '  FLGCONCILIADO = :FLGCONCILIADO,'
      '  VLRPRESTCORRIG = :VLRPRESTCORRIG,'
      '  VLRMULTACORRIG = :VLRMULTACORRIG,'
      '  VLRJUROSCORRIG = :VLRJUROSCORRIG'
      'where'
      '  IDPARCFINANCIMOV = :OLD_IDPARCFINANCIMOV')
    InsertSQL.Strings = (
      '')
    Left = 481
    Top = 242
  end
  object updParc: TUpdateSQL
    InsertSQL.Strings = (
      '')
    Left = 593
    Top = 218
  end
  object qryTeste: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCONTRATOIMOVEL, CONNUMERO'
      '  FROM CONTRATOIMOVEL'
      ' WHERE FLGTIPOCONTRATO = '#39'C'#39
      '  AND FLGSTATUS = '#39'V'#39
      'ORDER BY CONNUMERO')
    ControlType.Strings = (
      'CODDOCUMENTO;CheckBox;1;0'
      'CHKINTEGRA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 544
    Top = 209
  end
end
