inherited frmExecQuitacao: TfrmExecQuitacao
  Left = 352
  Top = 198
  HelpContext = 150020
  BorderStyle = bsSingle
  Caption = 'Quitação Antecipada / por Falecimento'
  ClientHeight = 428
  ClientWidth = 772
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 772
    Height = 395
    object lblTitulo: TfcLabel
      Left = 5
      Top = 5
      Width = 489
      Height = 24
      Caption = 'Quitação Antecipada / por Falecimento [seleção]'
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
      Width = 772
      Height = 362
      Align = alBottom
      PageIndex = 1
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Selecao'
        object Label2: TLabel
          Left = 534
          Top = 280
          Width = 109
          Height = 13
          Caption = 'Data de Quitação: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel2: TBevel
          Left = 16
          Top = 309
          Width = 738
          Height = 3
          Shape = bsTopLine
        end
        object Bevel3: TBevel
          Left = 16
          Top = 266
          Width = 738
          Height = 3
          Shape = bsTopLine
        end
        object Label29: TLabel
          Left = 16
          Top = 10
          Width = 114
          Height = 13
          Caption = 'Número do Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 376
          Top = 226
          Width = 63
          Height = 13
          Caption = 'Taxa Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label43: TLabel
          Left = 136
          Top = 226
          Width = 90
          Height = 13
          Caption = 'Data do Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 16
          Top = 226
          Width = 109
          Height = 13
          Caption = 'Data de Assinatura'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 464
          Top = 226
          Width = 90
          Height = 13
          Caption = 'Valor Solicitado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label38: TLabel
          Left = 576
          Top = 226
          Width = 68
          Height = 13
          Caption = 'Nº Parcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label39: TLabel
          Left = 656
          Top = 226
          Width = 95
          Height = 13
          Caption = 'Valor da Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 256
          Top = 226
          Width = 109
          Height = 13
          Caption = 'Data da 1º Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 392
          Top = 146
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 16
          Top = 146
          Width = 122
          Height = 13
          Caption = 'Plano Previdenciário '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 168
          Top = 10
          Width = 50
          Height = 13
          Caption = 'Mutuário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 16
          Top = 106
          Width = 141
          Height = 13
          Caption = 'Situação do Participante'
        end
        object Label7: TLabel
          Left = 16
          Top = 58
          Width = 55
          Height = 13
          Caption = 'Matrícula'
        end
        object Label8: TLabel
          Left = 144
          Top = 58
          Width = 36
          Height = 13
          Caption = 'C.P.F.'
        end
        object Label11: TLabel
          Left = 347
          Top = 186
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 16
          Top = 186
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label51: TLabel
          Left = 672
          Top = 186
          Width = 57
          Height = 13
          Caption = 'Indexador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 258
          Top = 324
          Width = 126
          Height = 13
          Caption = 'Data do Falecimento: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnContinuaSelecao: TfcShapeBtn
          Left = 664
          Top = 320
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
          Enabled = False
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
          TabOrder = 22
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuaSelecaoClick
        end
        object btnBuscaContrato: TBitBtn
          Left = 128
          Top = 24
          Width = 24
          Height = 22
          Hint = 'Busca o Contrato'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnBuscaContratoClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
            777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
            77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
            77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
            077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
            FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
            F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
            7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
            777777787FFF8777777777770000777777777777888877777777}
          NumGlyphs = 2
        end
        object edtDataVencto: TCMDateTimePicker
          Left = 644
          Top = 276
          Width = 97
          Height = 21
          AutoSize = False
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 20
        end
        object rdgTipoQuitacao: TRadioGroup
          Left = 17
          Top = 267
          Width = 474
          Height = 39
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Quitação Antecipada'
            'Quitação por Falecimento/Invalidez')
          TabOrder = 19
          OnClick = rdgTipoQuitacaoClick
        end
        object DBedtNumContrato: TDBEdit
          Left = 16
          Top = 24
          Width = 112
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'IDCONTRATOEMPTMO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBedtJuros: TDBEdit
          Left = 376
          Top = 240
          Width = 73
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'TXJUROS'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 15
        end
        object DBedtDataInsc: TCMDateTimePicker
          Left = 16
          Top = 240
          Width = 105
          Height = 21
          TabStop = False
          AutoSize = False
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clBtnFace
          ButtonStyle = cbsCustom
          DataField = 'DATAASSINATURA'
          DataSource = dts
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ShowButton = True
          TabOrder = 12
        end
        object DBedtDataCredito: TCMDateTimePicker
          Left = 136
          Top = 240
          Width = 105
          Height = 21
          TabStop = False
          AutoSize = False
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clBtnFace
          ButtonStyle = cbsCustom
          DataField = 'DATACREDITO'
          DataSource = dts
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ShowButton = True
          TabOrder = 13
        end
        object DBedtValSolic: TDBEdit
          Left = 464
          Top = 240
          Width = 97
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'VLRCONTRATO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 16
        end
        object DBedtValorParcela: TDBEdit
          Left = 656
          Top = 240
          Width = 97
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'VLRPARCELA'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 18
        end
        object DBedtParcelas: TDBEdit
          Left = 576
          Top = 240
          Width = 68
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clBtnFace
          DataField = 'PRAZO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 17
        end
        object DBedtDataPrimParcela: TCMDateTimePicker
          Left = 256
          Top = 240
          Width = 105
          Height = 21
          TabStop = False
          AutoSize = False
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clBtnFace
          ButtonStyle = cbsCustom
          DataField = 'DATAPRIMPARC'
          DataSource = dts
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ShowButton = True
          TabOrder = 14
        end
        object DBedtPatro: TDBEdit
          Left = 392
          Top = 160
          Width = 361
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'PATRO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object DBedtPlanoPrev: TDBEdit
          Left = 16
          Top = 160
          Width = 361
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'PLANOPREV'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object DBedtSitPart: TDBEdit
          Left = 16
          Top = 120
          Width = 258
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'SITDESCRICAO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBedtBeneficiario: TDBEdit
          Left = 168
          Top = 24
          Width = 585
          Height = 21
          DataField = 'NOME_MUTUARIO'
          DataSource = dts
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object grpTitular: TGroupBox
          Left = 280
          Top = 58
          Width = 473
          Height = 85
          Caption = ' Dados do Participante Titular '
          Enabled = False
          TabOrder = 6
          object Label9: TLabel
            Left = 24
            Top = 42
            Width = 55
            Height = 13
            Caption = 'Matrícula'
          end
          object Label16: TLabel
            Left = 152
            Top = 42
            Width = 36
            Height = 13
            Caption = 'C.P.F.'
          end
          object Label18: TLabel
            Left = 336
            Top = 42
            Width = 114
            Height = 13
            Caption = 'Insc. Previdenciária'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBedtMtrEmpresa: TDBEdit
            Left = 24
            Top = 56
            Width = 113
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'MATRICULA'
            DataSource = dts
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBedtCPF: TDBEdit
            Left = 152
            Top = 56
            Width = 113
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'CPF_TITULAR'
            DataSource = dts
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBedtInscricao: TDBEdit
            Left = 336
            Top = 56
            Width = 113
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'INSCRICAONUMERO'
            DataSource = dts
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBedtParticipante: TDBEdit
            Left = 24
            Top = 16
            Width = 425
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'NOME_TITULAR'
            DataSource = dts
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object DBEdit1: TDBEdit
          Left = 16
          Top = 72
          Width = 113
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'MATRICULA_MUTUARIO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit2: TDBEdit
          Left = 144
          Top = 72
          Width = 131
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'CPF_MUTUARIO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBedtTipoEmptmo: TDBEdit
          Left = 344
          Top = 200
          Width = 319
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'TCEDESCRICAO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object DBEdit3: TDBEdit
          Left = 16
          Top = 200
          Width = 321
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'DESCTIPOEMPTMO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit4: TDBEdit
          Left = 672
          Top = 200
          Width = 81
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'MOESIGLA'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object edtDataFalecimento: TCMDateTimePicker
          Left = 384
          Top = 320
          Width = 97
          Height = 21
          AutoSize = False
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 21
        end
        object chkExcepcional: TCheckBox
          Left = 24
          Top = 321
          Width = 109
          Height = 17
          Caption = 'Excepcional'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 23
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'HistoricoMovimentacao'
        object DBgrdHistMov: TwwDBGrid
          Left = 14
          Top = 34
          Width = 744
          Height = 270
          Selected.Strings = (
            'EVENTO'#9'18'#9'Evento'#9'F'
            'ANOMES'#9'8'#9'Compet.'#9'F'
            'HMEPARCELA'#9'4'#9'Parc'#9'F'
            'HMESEQCOBRANCA'#9'3'#9'Seq'#9'F'
            'IteDescricao'#9'28'#9'Item'#9'F'
            'HMEDATAPREVISTA'#9'11'#9'Data Prev'#9'F'
            'HMEDATAVENCTO'#9'11'#9'Data Vencto'#9'F'
            'HMEVLRPREVISTO'#9'13'#9'Valor Prev.'#9'F'
            'HMETXJUROS'#9'9'#9'Tx Juros'#9'F'
            'HMESALDODEV'#9'10'#9'Sld Devedor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dtsHistMov
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          TabOrder = 2
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = DBgrdVlrAtualizadosCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdVlrAtualizadosTopRowChanged
        end
        object btnCancelaEncerra: TfcShapeBtn
          Left = 568
          Top = 320
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
          OnClick = btnCancelaEncerraClick
        end
        object btnContinuaEncerra: TfcShapeBtn
          Left = 664
          Top = 320
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
          OnClick = btnContinuaEncerraClick
        end
        object Panel4: TPanel
          Left = 14
          Top = 8
          Width = 744
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Itens em Aberto'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
        object rdgMetodo: TRadioGroup
          Left = 368
          Top = 317
          Width = 185
          Height = 40
          Color = clBtnShadow
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Método 1'
            'Método 2')
          ParentColor = False
          TabOrder = 4
          Visible = False
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'ValoresAtualizados'
        object Bevel1: TBevel
          Left = 14
          Top = 246
          Width = 741
          Height = 4
          Shape = bsTopLine
        end
        object Bevel6: TBevel
          Left = 16
          Top = 190
          Width = 737
          Height = 3
          Shape = bsTopLine
        end
        object Bevel4: TBevel
          Left = 14
          Top = 306
          Width = 741
          Height = 4
          Shape = bsTopLine
        end
        object Label23: TLabel
          Left = 18
          Top = 257
          Width = 95
          Height = 13
          Caption = 'Tipo do Recurso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 179
          Top = 257
          Width = 205
          Height = 13
          Caption = 'Identificação de Origem do Recurso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnCancelaAltera: TfcShapeBtn
          Left = 568
          Top = 322
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
          TabOrder = 1
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnCancelaAlteraClick
        end
        object btnConfirmar: TfcShapeBtn
          Left = 664
          Top = 322
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
          TabOrder = 2
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnConfirmarClick
        end
        object DBrdgDebito: TRadioGroup
          Left = 14
          Top = 200
          Width = 329
          Height = 41
          Caption = ' Forma de Envio '
          Columns = 2
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemIndex = 0
          Items.Strings = (
            'Financeiro'
            'Folha')
          ParentFont = False
          TabOrder = 3
          OnClick = DBrdgDebitoClick
        end
        object pnlCAR: TPanel
          Left = 352
          Top = 193
          Width = 409
          Height = 49
          BevelOuter = bvNone
          TabOrder = 4
          object Label30: TLabel
            Left = 10
            Top = 10
            Width = 195
            Height = 13
            Caption = 'Conta-Caixa x Forma Recebimento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBcboFormaRecebimento: TwwDBLookupCombo
            Left = 10
            Top = 24
            Width = 393
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'1'#9'DESCRICAO'#9'F')
            LookupTable = dtmLookEmptmo.qryLookPortadorFormaR
            LookupField = 'CODPORTFORMA'
            ParentFont = False
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
        object DBgrdHistMovVirtual: TwwDBGrid
          Left = 14
          Top = 35
          Width = 744
          Height = 112
          Selected.Strings = (
            'EVENTO'#9'16'#9'Evento'#9'F'
            'ANOMES'#9'7'#9'Compet.'#9'F'
            'HMEPARCELA'#9'4'#9'Parc'#9'F'
            'HMESEQCOBRANCA'#9'3'#9'Seq'#9'F'
            'IteDescricao'#9'25'#9'Item'#9'F'
            'HMEDATAPREVISTA'#9'9'#9'Previsão'#9'F'
            'HMEVLRPREVISTO'#9'12'#9'Valor Previsto'#9'F'
            'HMETXJUROS'#9'8'#9'Tx.Juros'#9'F'
            'HMESALDODEV'#9'10'#9'Sld. Devedor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dtsHistMovVirtual
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          TabOrder = 5
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = DBgrdVlrAtualizadosCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdVlrAtualizadosTopRowChanged
        end
        object Panel9: TPanel
          Left = 14
          Top = 8
          Width = 744
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Valores Atualizados'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object DBContaDeb: TDBGrid
          Left = 16
          Top = 150
          Width = 454
          Height = 40
          DataSource = dsBancoDeb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 6
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'BANCO'
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -8
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 190
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMAGENCIA'
              Title.Alignment = taCenter
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTACORRENTE'
              Title.Alignment = taCenter
              Title.Caption = 'Conta Corrente'
              Width = 128
              Visible = True
            end>
        end
        object cboTipoRecurso: TwwDBLookupCombo
          Left = 21
          Top = 274
          Width = 148
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'IDTIPORECURSO'#9'10'#9'IDTIPORECURSO'#9'F'
            'NOME'#9'20'#9'NOME'#9'F'
            'TRGDTINCLUSAO'#9'18'#9'TRGDTINCLUSAO'#9'F'
            'TRGUSERINCLUSAO'#9'30'#9'TRGUSERINCLUSAO'#9'F')
          LookupTable = qryTipoRecurso
          LookupField = 'idTipoRecurso'
          Style = csDropDownList
          TabOrder = 7
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = cboTipoRecursoChange
        end
        object EdOrigemRecurso: TEdit
          Left = 181
          Top = 274
          Width = 569
          Height = 21
          MaxLength = 200
          TabOrder = 8
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 395
    Width = 772
    inherited tb97Fundo: TToolbar97
      Left = 600
      DockPos = 610
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object dts: TwwDataSource
    AutoEdit = False
    DataSet = dtmEmptmo.qryDadosContrato
    Left = 355
    Top = 384
  end
  object dtsHistMov: TwwDataSource
    AutoEdit = False
    DataSet = qryHistMov
    Left = 216
    Top = 188
  end
  object qryHistMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   ITE.ITEDESCRICAO,'
      
        '   TO_CHAR(HME.HMEMESCOMPETENCIA, '#39'00'#39') || '#39'/'#39' || HME.HMEANOCOMP' +
        'ETENCIA AS ANOMES,'
      ''
      
        '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMESEQCOBRA' +
        'NCA,'
      
        '   HME.HMETIPOMOV       , HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTM' +
        'O  ,'
      '   HME.HMEDATAPREVISTA  , HME.HMEDATAVENCTO,'
      '   HME.HMEVLRPREVISTO   , HME.HMESALDODEV   ,'
      '   HME.HMETXJUROS       , HME.HMEPARCELA       ,'
      ''
      '   DECODE(HME.HMETIPOMOV,'
      '          0, '#39'Concessão/Renovação'#39','
      '          1, '#39'Prestação '#39','
      '          2, '#39'Amortização/Refinanciamento'#39','
      '          3, '#39'Quitação'#39','
      '          4, '#39'Atualização de Débito'#39','
      '          5, '#39'Atualização de Saldo (Diária)'#39' ,'
      '          6, '#39'Importação/Migração'#39','
      '          7, '#39'Ajustes (Cobrança/Devolução)'#39','
      '          8, '#39'Ajustes (Saldo Devedor)'#39
      '         ) AS EVENTO'
      ''
      'FROM'
      '   HISTMOVEMPTMO  HME,'
      '   TIPOSUSPEMPTMO TSE,'
      '   ITEMEMPTMO     ITE'
      ''
      'WHERE'
      '       ( HME.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO )'
      '   AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) )'
      '   AND ( HME.HMETIPOMOV       IN (1, 2, 3, 4, 7) )'
      '   AND ( HME.FLGBAIXADO       = 0 )'
      
        '   AND ( (HME.FLGESTORNADO    IS NULL) OR (HME.FLGESTORNADO = 0)' +
        ' )'
      
        '   AND ( (HME.FLGABONADO      IS NULL) OR (HME.FLGABONADO   = 0)' +
        ' )'
      
        '   AND ( (HME.FLGQUITADO      IS NULL) OR (HME.FLGQUITADO   = 0)' +
        ' )'
      ''
      '   AND HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO'
      '   AND HME.IDTIPOSUSPEMPTMO   = TSE.IDTIPOSUSPEMPTMO(+)'
      ''
      '   AND ('
      '       (:PINIBESUSP           IS NULL)'
      '       OR'
      '       (:PINIBESUSP           = 1 AND ('
      
        '                                      NVL(HME.FLGSUSPENSAO, 0)  ' +
        '= 0 OR'
      
        '                                      (NVL(HME.FLGSUSPENSAO, 0) ' +
        '<> 0 AND NVL(TSE.FLGEMABERTO, 0) = 1)'
      '                                      )'
      '       )'
      '       )'
      ''
      'ORDER BY'
      '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMEPARCELA')
    ValidateWithMask = True
    Left = 306
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PINIBESUSP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PINIBESUSP'
        ParamType = ptInput
      end>
    object qryHistMovHMEANOCOMPETENCIA: TFloatField
      DisplayLabel = 'Ano'
      DisplayWidth = 7
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryHistMovHMEMESCOMPETENCIA: TFloatField
      DisplayLabel = 'Mês'
      DisplayWidth = 5
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryHistMovHMESEQCOBRANCA: TFloatField
      DisplayLabel = 'Seq.'
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryHistMovHMETIPOMOV: TFloatField
      DisplayWidth = 7
      FieldName = 'HMETIPOMOV'
    end
    object qryHistMovHMEDATAPREVISTA: TDateTimeField
      DisplayLabel = 'Previsão'
      DisplayWidth = 12
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryHistMovHMEVLRPREVISTO: TFloatField
      DisplayLabel = 'Valor Previsto'
      DisplayWidth = 7
      FieldName = 'HMEVLRPREVISTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryHistMovHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryHistMovHMETXJUROS: TFloatField
      DisplayLabel = 'Tx Juros'
      FieldName = 'HMETXJUROS'
      DisplayFormat = '#,##0.0000 %'
      EditFormat = '#,##0.0000 %'
    end
    object qryHistMovHMEPARCELA: TFloatField
      DisplayLabel = 'Nº Parc.'
      FieldName = 'HMEPARCELA'
      DisplayFormat = '#00'
      EditFormat = '#00'
    end
    object qryHistMovANOMES: TStringField
      Alignment = taCenter
      FieldName = 'ANOMES'
      Size = 44
    end
    object qryHistMovITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryHistMovIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryHistMovEVENTO: TStringField
      FieldName = 'EVENTO'
      Size = 29
    end
    object qryHistMovHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
  end
  object qryHistMovVirtual: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   '#39'12345678901234567890123456789012345678901234567890'#39' AS ITEDE' +
        'SCRICAO,'
      '   '#39'Atualização Débito'#39' AS EVENTO,'
      '   '#39'0000/00'#39' AS ANOMES,'
      ''
      
        '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMESEQCOBRA' +
        'NCA ,'
      
        '   HME.HMETIPOMOV       , HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTM' +
        'O   ,'
      
        '   HME.HMEDATAPREVISTA  , HME.HMEVLRPREVISTO   , HME.HMESALDODEV' +
        '    ,'
      '   HME.HMETXJUROS       , HME.HMEPARCELAALT,     HME.HMEPARCELA'
      ''
      'FROM'
      '   HISTMOVEMPTMO HME'
      ''
      'WHERE'
      '   HME.IDCONTRATOEMPTMO = -1')
    UpdateObject = updHistMovVirtual
    ValidateWithMask = True
    Left = 297
    Top = 223
    object qryHistMovVirtualHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryHistMovVirtualHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryHistMovVirtualHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryHistMovVirtualHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryHistMovVirtualHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryHistMovVirtualHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryHistMovVirtualHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryHistMovVirtualHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
      DisplayFormat = '#,##0.0000 %'
    end
    object qryHistMovVirtualHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
      DisplayFormat = '#00'
      EditFormat = '#00'
    end
    object qryHistMovVirtualEVENTO: TStringField
      FieldName = 'EVENTO'
      FixedChar = True
      Size = 18
    end
    object qryHistMovVirtualANOMES: TStringField
      Alignment = taCenter
      FieldName = 'ANOMES'
      FixedChar = True
      Size = 7
    end
    object qryHistMovVirtualITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      FixedChar = True
      Size = 50
    end
    object qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovVirtualIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryHistMovVirtualHMEPARCELAALT: TFloatField
      FieldName = 'HMEPARCELAALT'
    end
  end
  object dtsHistMovVirtual: TwwDataSource
    AutoEdit = False
    DataSet = qryHistMovVirtual
    Left = 98
    Top = 236
  end
  object updHistMovVirtual: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTMOVEMPTMO'
      'set'
      '  ITEDESCRICAO = :ITEDESCRICAO,'
      '  EVENTO = :EVENTO,'
      '  ANOMES = :ANOMES,'
      '  HMEANOCOMPETENCIA = :HMEANOCOMPETENCIA,'
      '  HMEMESCOMPETENCIA = :HMEMESCOMPETENCIA,'
      '  HMESEQCOBRANCA = :HMESEQCOBRANCA,'
      '  HMETIPOMOV = :HMETIPOMOV,'
      '  IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO,'
      '  IDITEMEMPTMO = :IDITEMEMPTMO,'
      '  HMEDATAPREVISTA = :HMEDATAPREVISTA,'
      '  HMEVLRPREVISTO = :HMEVLRPREVISTO,'
      '  HMESALDODEV = :HMESALDODEV,'
      '  HMETXJUROS = :HMETXJUROS,'
      '  HMEPARCELA = :HMEPARCELA'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    InsertSQL.Strings = (
      'insert into HISTMOVEMPTMO'
      
        '  (ITEDESCRICAO, EVENTO, ANOMES, HMEANOCOMPETENCIA, HMEMESCOMPET' +
        'ENCIA, '
      
        '   HMESEQCOBRANCA, HMETIPOMOV, IDCONTRATOEMPTMO, IDITEMEMPTMO, H' +
        'MEDATAPREVISTA, '
      '   HMEVLRPREVISTO, HMESALDODEV, HMETXJUROS, HMEPARCELA)'
      'values'
      
        '  (:ITEDESCRICAO, :EVENTO, :ANOMES, :HMEANOCOMPETENCIA, :HMEMESC' +
        'OMPETENCIA, '
      
        '   :HMESEQCOBRANCA, :HMETIPOMOV, :IDCONTRATOEMPTMO, :IDITEMEMPTM' +
        'O, :HMEDATAPREVISTA, '
      '   :HMEVLRPREVISTO, :HMESALDODEV, :HMETXJUROS, :HMEPARCELA)')
    DeleteSQL.Strings = (
      'delete from HISTMOVEMPTMO'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    Left = 165
    Top = 351
  end
  object qryUpdateSitFormaFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      ''
      'SET'
      '   HMETIPOFOLHA = '#39'B'#39
      ''
      'WHERE'
      '       ( HMEFORMACOBRANCA   = '#39'F'#39' )'
      '   AND ( IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO )'
      '   AND ( FLGENVIO           = 0 )'
      '   AND ( (HMECENTRALIZA     = 1) OR (HMEDESTACADO = 1) )'
      ''
      '   AND IDHISTMOVEMPTMO IN'
      '   ('
      '   SELECT'
      '      IDHISTMOVEMPTMO'
      '   FROM'
      '      HISTMOVEMPTMO H,'
      '      CONTRATOEMPTMO C,'
      '      PARTPREVPLAN PPP,'
      '      SITPART SP'
      '   WHERE'
      '          ( SP.FLGINTERNO        IN ('#39'AS'#39', '#39'CA'#39' ) )'
      '      AND ( H.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO )'
      '      AND ( H.HMEFORMACOBRANCA   = '#39'F'#39' )'
      '      AND ( H.FLGENVIO           = 0 )'
      '      AND ( (H.HMECENTRALIZA     = 1) OR (H.HMEDESTACADO = 1) )'
      '      AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO )'
      '      AND ( C.IDPESSOA           = PPP.IDPESSOA )'
      '      AND ( PPP.IDSITPART        = SP.IDSITPART )'
      '      AND PPP.FLGDESATIVADO      = 0'
      '   )')
    ValidateWithMask = True
    Left = 564
    Top = 180
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryUpdateSitFormaCaR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      ''
      'SET'
      '   HMEFORMACOBRANCA = '#39'C'#39
      ''
      'WHERE'
      '       ( HMEFORMACOBRANCA   = '#39'F'#39' )'
      '   AND ( IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO )'
      '   AND ( FLGENVIO           = 0 )'
      '   AND ( (HMECENTRALIZA     = 1) OR (HMEDESTACADO = 1) )'
      ''
      '   AND IDHISTMOVEMPTMO IN'
      '   ('
      '   SELECT'
      '      IDHISTMOVEMPTMO'
      '   FROM'
      '      HISTMOVEMPTMO H,'
      '      CONTRATOEMPTMO C,'
      '      PARTPREVPLAN PPP,'
      '      SITPART SP'
      '   WHERE'
      '          ( SP.FLGINTERNO        IN ('#39'MA'#39', '#39'MS'#39', '#39'MP'#39') )'
      '      AND ( H.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO )'
      '      AND ( H.HMEFORMACOBRANCA   = '#39'F'#39' )'
      '      AND ( H.FLGENVIO           = 0 )'
      '      AND ( (H.HMECENTRALIZA     = 1) OR (H.HMEDESTACADO = 1) )'
      '      AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO )'
      '      AND ( C.IDPESSOA           = PPP.IDPESSOA )'
      '      AND ( PPP.IDSITPART        = SP.IDSITPART )'
      '      AND PPP.FLGDESATIVADO      = 0'
      '   )')
    ValidateWithMask = True
    Left = 536
    Top = 180
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryUpdateSitFormaPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      ''
      'SET'
      '   HMETIPOFOLHA = '#39'P'#39
      ''
      'WHERE'
      '       ( HMEFORMACOBRANCA   = '#39'F'#39' )'
      '   AND ( IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO )'
      '   AND ( FLGENVIO           = 0 )'
      '   AND ( (HMECENTRALIZA     = 1) OR (HMEDESTACADO = 1) )'
      ''
      '   AND IDHISTMOVEMPTMO IN'
      '   ('
      '   SELECT'
      '      IDHISTMOVEMPTMO'
      '   FROM'
      '      HISTMOVEMPTMO  H,'
      '      CONTRATOEMPTMO C,'
      '      PARTPREVPLAN   PPP,'
      '      SITPART        SP'
      '   WHERE'
      '          ( SP.FLGINTERNO        = '#39'AT'#39' )'
      '      AND ( H.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO )'
      '      AND ( H.HMEFORMACOBRANCA   = '#39'F'#39' )'
      '      AND ( H.FLGENVIO           = 0 )'
      '      AND ( (H.HMECENTRALIZA     = 1) OR (H.HMEDESTACADO = 1) )'
      '      AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO )'
      '      AND ( C.IDPESSOA           = PPP.IDPESSOA )'
      '      AND ( PPP.IDSITPART        = SP.IDSITPART )'
      '      AND PPP.FLGDESATIVADO      = 0'
      '   )')
    ValidateWithMask = True
    Left = 508
    Top = 180
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryAtualizacoesPosteriores: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   DISTINCT HME.HMEDATAATUALIZA'
      'FROM'
      '   HISTMOVEMPTMO  HME,'
      '   CONTRATOEMPTMO CON,'
      '   ITEMXTIPOCONTR ITC'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '  AND (HME.FLGESTORNADO     = 0 OR HME.FLGESTORNADO IS NULL)'
      '  AND HME.HMEDATAATUALIZA   >:PHMEDATAATUALIZA'
      '  AND ITC.ITCTRATASALDODEV  <> 0'
      '  AND CON.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO'
      '  AND ITC.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO'
      '  AND ITC.IDITEMEMPTMO      = HME.IDITEMEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 592
    Top = 180
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end>
    object qryAtualizacoesPosterioresHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDATAATUALIZA'
    end
  end
  object qryAtualizaDebito: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMESEQCOBRAN' +
        'CA ,'
      
        '  HME.HMETIPOMOV       , HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTMO' +
        '   ,'
      
        '  HME.HMEDATAPREVISTA  , HME.HMEVLRPREVISTO   , HME.HMESALDODEV ' +
        '   ,  HME.HMEDATAVENCTO,'
      
        '  HME.HMETXJUROS       , HME.HMEPARCELA       , HME.HMEFORMACOBR' +
        'ANCA, HME.HMEPRIORIDADE,'
      
        '  HME.IDHISTMOVEMPTMO  , HME.HMEANOCOBRANCA   , HME.HMEMESCOBRAN' +
        'CA, HME.IDREGRA,'
      
        '  HME.IDRUBRICA        , HME.HMEORIGEM        , HME.HMECENTRALIZ' +
        'A, HME.HMEDESTACADO,'
      
        '  HME.HMEDATAATUALIZA  , HME.HMENUMPARCELAS   , HME.HMERECPAG, F' +
        'LGTIPODIVERG,'
      
        '  HME.HMEDATAEFETIVA   , HME.HMEVLREFETIVO    , HME.IDITEMCENTRA' +
        'LIZA, HME.CODDOCUMENTO,'
      
        '  TO_CHAR(HME.HMEMESCOMPETENCIA,'#39'00'#39') ||'#39'/'#39'|| HME.HMEANOCOMPETEN' +
        'CIA AS COMPETENCIA,'
      
        '  TO_CHAR(HME.HMEMESCOBRANCA,'#39'00'#39') ||'#39'/'#39'|| HME.HMEANOCOBRANCA AS' +
        ' COBRANCA,'
      ''
      
        '  CEP.IDPATRO          , CEP.IDPLANOPREV      , CEP.DATAASSINATU' +
        'RA,'
      ''
      '  PPP.IDSITPART,'
      ''
      '  STP.FLGINTERNO,'
      ''
      '  PES.NOME,'
      ''
      '  ITE.ITEDESCRICAO,'
      '  TSE.TSEDESCRICAO'
      ''
      'FROM'
      '   PESSOA          PES,'
      '   HISTMOVEMPTMO   HME,'
      '   PARTPREVPLAN    PPP,'
      '   CONTRATOEMPTMO  CEP,'
      '   SITPART         STP,'
      '   TIPOCONTREMPTMO TC,'
      '   TIPOEMPTMO      TE,'
      '   ITEMEMPTMO      ITE,'
      '   TIPOSUSPEMPTMO  TSE'
      ''
      'WHERE'
      '       ( HME.FLGDIVERGPEND = 1 )'
      '   AND ( (HME.HMECENTRALIZA    = 1) OR (HME.HMEDESTACADO = 1) )'
      '   AND ( TE.IDEMPRESAPROP      =:PIDEMPRESAPROP )'
      
        '   AND ( (:PIDCONTRATOEMPTMO   IS NULL) OR (CEP.IDCONTRATOEMPTMO' +
        '  =:PIDCONTRATOEMPTMO) )'
      '   AND ( CEP.FLGSITUACAO       NOT IN ('#39'C'#39','#39'Q'#39') )'
      '   AND ( CEP.IDPATRO           = PPP.IDPESSJUR )'
      '   AND ( CEP.IDPESSOA          = PPP.IDPESSOA )'
      '   AND ( HME.IDCONTRATOEMPTMO  = CEP.IDCONTRATOEMPTMO )'
      '   AND ( PPP.IDSITPART         = STP.IDSITPART )'
      '   AND ( CEP.IDBENEF           = PES.IDPESSOA )'
      '   AND ( CEP.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO )'
      '   AND ( TC.IDTIPOEMPTMO       = TE.IDTIPOEMPTMO )'
      '   AND ( HME.IDITEMEMPTMO      = ITE.IDITEMEMPTMO )'
      '   AND ( CEP.IDTIPOSUSPEMPTMO  = TSE.IDTIPOSUSPEMPTMO(+) )'
      '   AND PPP.FLGDESATIVADO       = 0 '
      'ORDER BY'
      '   HME.IDCONTRATOEMPTMO, HME.HMEPARCELA')
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 621
    Top = 179
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryAtualizaDebitoHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryAtualizaDebitoHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryAtualizaDebitoHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryAtualizaDebitoHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryAtualizaDebitoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryAtualizaDebitoIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryAtualizaDebitoHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryAtualizaDebitoHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryAtualizaDebitoHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryAtualizaDebitoHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryAtualizaDebitoHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qryAtualizaDebitoHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryAtualizaDebitoHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryAtualizaDebitoHMEPRIORIDADE: TFloatField
      FieldName = 'HMEPRIORIDADE'
    end
    object qryAtualizaDebitoIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryAtualizaDebitoHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
    end
    object qryAtualizaDebitoHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
    end
    object qryAtualizaDebitoIDREGRA: TFloatField
      FieldName = 'IDREGRA'
    end
    object qryAtualizaDebitoIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object qryAtualizaDebitoHMEORIGEM: TFloatField
      FieldName = 'HMEORIGEM'
    end
    object qryAtualizaDebitoHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object qryAtualizaDebitoHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
    end
    object qryAtualizaDebitoHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qryAtualizaDebitoHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryAtualizaDebitoHMERECPAG: TStringField
      FieldName = 'HMERECPAG'
      FixedChar = True
      Size = 1
    end
    object qryAtualizaDebitoFLGTIPODIVERG: TFloatField
      FieldName = 'FLGTIPODIVERG'
    end
    object qryAtualizaDebitoHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
    end
    object qryAtualizaDebitoHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryAtualizaDebitoIDITEMCENTRALIZA: TFloatField
      FieldName = 'IDITEMCENTRALIZA'
    end
    object qryAtualizaDebitoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryAtualizaDebitoCOMPETENCIA: TStringField
      FieldName = 'COMPETENCIA'
      Size = 44
    end
    object qryAtualizaDebitoCOBRANCA: TStringField
      FieldName = 'COBRANCA'
      Size = 44
    end
    object qryAtualizaDebitoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryAtualizaDebitoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryAtualizaDebitoDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object qryAtualizaDebitoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryAtualizaDebitoITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryAtualizaDebitoTSEDESCRICAO: TStringField
      FieldName = 'TSEDESCRICAO'
      Size = 60
    end
  end
  object dsBancoDeb: TDataSource
    DataSet = dtmLookEmptmo.qryLookDadosBancarios
    Left = 238
    Top = 327
  end
  object qryTipoRecurso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPORECURSO,NOME FROM CM.TIPORECURSO'
      'WHERE ((IDMODULO=15) OR (IDMODULO IS NULL))')
    ValidateWithMask = True
    Left = 648
    Top = 179
  end
  object QryUptdateContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update  contratoemptmo set FLGPERDAEFETIVA = 1'
      'where idcontratoemptmo = :idcontratoemptmo')
    ValidateWithMask = True
    Left = 614
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idcontratoemptmo'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      DisplayLabel = 'Ano'
      DisplayWidth = 7
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Mês'
      DisplayWidth = 5
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Seq.'
      FieldName = 'HMESEQCOBRANCA'
    end
    object FloatField4: TFloatField
      DisplayWidth = 7
      FieldName = 'HMETIPOMOV'
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Previsão'
      DisplayWidth = 12
      FieldName = 'HMEDATAPREVISTA'
    end
    object FloatField5: TFloatField
      DisplayLabel = 'Valor Previsto'
      DisplayWidth = 7
      FieldName = 'HMEVLRPREVISTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object FloatField6: TFloatField
      FieldName = 'HMESALDODEV'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object FloatField7: TFloatField
      DisplayLabel = 'Tx Juros'
      FieldName = 'HMETXJUROS'
      DisplayFormat = '#,##0.0000 %'
      EditFormat = '#,##0.0000 %'
    end
    object FloatField8: TFloatField
      DisplayLabel = 'Nº Parc.'
      FieldName = 'HMEPARCELA'
      DisplayFormat = '#00'
      EditFormat = '#00'
    end
    object StringField1: TStringField
      Alignment = taCenter
      FieldName = 'ANOMES'
      Size = 44
    end
    object StringField2: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object FloatField9: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object FloatField10: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object StringField3: TStringField
      FieldName = 'EVENTO'
      Size = 29
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
  end
  object qryBloq: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update SUSPCONCESSAO '
      'set FLGSTATUS = '#39'E'#39','
      'SUCDATAFINAL = :SUCDATAFINAL '
      'where '
      'IDMOTIVOSUSPCONCESSAO = 23 '
      'and FLGSTATUS = '#39'A'#39' '
      'and idpessoa= :idpessoa')
    ValidateWithMask = True
    Left = 456
    Top = 345
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SUCDATAFINAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idpessoa'
        ParamType = ptUnknown
      end>
  end
end
