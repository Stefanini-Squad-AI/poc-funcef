inherited frmExecTrataParcela: TfrmExecTrataParcela
  Left = 7
  Top = 69
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tratamento Individual de Parcelas'
  ClientHeight = 430
  ClientWidth = 771
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 771
    Height = 397
    object lblTitulo: TfcLabel
      Left = 16
      Top = 8
      Width = 343
      Height = 24
      Caption = 'Tratamento Individual de Parcelas'
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
      Top = 35
      Width = 771
      Height = 362
      Align = alBottom
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Selecao'
        object Label29: TLabel
          Left = 16
          Top = 10
          Width = 114
          Height = 13
          Caption = 'Número do Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 376
          Top = 234
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
          Top = 234
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
          Top = 234
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
          Top = 234
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
          Top = 234
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
          Top = 234
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
          Top = 234
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
          Left = 352
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
          TabOrder = 0
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuaSelecaoClick
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
          TabOrder = 1
        end
        object btnBuscaContrato: TBitBtn
          Left = 128
          Top = 24
          Width = 24
          Height = 22
          Hint = 'Busca o Contrato'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
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
        object DBedtJuros: TDBEdit
          Left = 376
          Top = 248
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
          TabOrder = 3
        end
        object DBedtDataInsc: TCMDateTimePicker
          Left = 16
          Top = 248
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
          TabOrder = 4
        end
        object DBedtDataCredito: TCMDateTimePicker
          Left = 136
          Top = 248
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
          TabOrder = 5
        end
        object DBedtValSolic: TDBEdit
          Left = 464
          Top = 248
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
          TabOrder = 6
        end
        object DBedtValorParcela: TDBEdit
          Left = 656
          Top = 248
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
          TabOrder = 7
        end
        object DBedtParcelas: TDBEdit
          Left = 576
          Top = 248
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
          TabOrder = 8
        end
        object DBedtDataPrimParcela: TCMDateTimePicker
          Left = 256
          Top = 248
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
          TabOrder = 9
        end
        object DBedtPatro: TDBEdit
          Left = 16
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
          TabOrder = 10
        end
        object DBedtPlanoPrev: TDBEdit
          Left = 392
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
          TabOrder = 11
        end
        object DBedtSitPart: TDBEdit
          Left = 16
          Top = 120
          Width = 241
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
          TabOrder = 12
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
          TabOrder = 13
        end
        object grpTitular: TGroupBox
          Left = 280
          Top = 52
          Width = 473
          Height = 89
          Caption = ' Dados do Participante Titular '
          Enabled = False
          TabOrder = 14
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
          TabOrder = 15
        end
        object DBEdit2: TDBEdit
          Left = 144
          Top = 72
          Width = 113
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
          TabOrder = 16
        end
        object DBedtTipoEmptmo: TDBEdit
          Left = 352
          Top = 200
          Width = 321
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
          TabOrder = 17
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
          TabOrder = 18
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
          TabOrder = 19
        end
        object chkBaixaManual: TCheckBox
          Left = 32
          Top = 288
          Width = 217
          Height = 17
          Caption = 'Exibir itens baixados manualmente'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          State = cbChecked
          TabOrder = 20
        end
        object chkSuspensao: TCheckBox
          Left = 32
          Top = 312
          Width = 217
          Height = 17
          Caption = 'Exibir APENAS itens Suspensos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 21
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'HistoricoMovimentacao'
        object lblData: TLabel
          Left = 16
          Top = 242
          Width = 84
          Height = 13
          Caption = 'Data Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 136
          Top = 229
          Width = 110
          Height = 26
          Caption = 'Nova Data Vencto ou Efetiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label5: TLabel
          Left = 528
          Top = 244
          Width = 114
          Height = 13
          Caption = 'Total selecionado:  '
        end
        object Label13: TLabel
          Left = 16
          Top = 314
          Width = 88
          Height = 13
          Caption = 'Valor Recebido'
        end
        object Label14: TLabel
          Left = 16
          Top = 280
          Width = 246
          Height = 13
          Caption = '(Data Vencto.: só para itens do Financeiro)'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label19: TLabel
          Left = 120
          Top = 332
          Width = 387
          Height = 13
          Caption = 
            '(Usar sempre valores positivos: sinal será invertido adequadamen' +
            'te)'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object DBgrdHistMov: TwwDBGrid
          Left = 11
          Top = 34
          Width = 746
          Height = 186
          Selected.Strings = (
            'FLGESCOLHA'#9'3'#9'Sel.'#9'F'
            'EVENTO'#9'13'#9'Evento'#9'F'
            'ANOMES'#9'7'#9'Comp.'#9'F'
            'HMEPARCELA'#9'3'#9'Par'#9'F'
            'HMESEQCOBRANCA'#9'3'#9'Seq'#9'F'
            'FORMACOBRANCA'#9'7'#9'Cobr.'#9'F'
            'IteDescricao'#9'24'#9'Item'#9'F'
            'HMEDATAVENCTO'#9'9'#9'Vencto.'#9'F'
            'HMEVLRPREVISTO'#9'10'#9'Valor Prev.'#9'F'
            'STATUS'#9'11'#9' '#9'F'
            'HMEVLREFETIVO'#9'9'#9'Valor Efet.'#9'F'
            'HMEDATAEFETIVA'#9'8'#9'Data Baixa'#9'F'
            'HMETXJUROS'#9'9'#9'Tx Juros'#9'F'
            'HMESALDODEV'#9'8'#9'Sld Dev'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          DataSource = dtsHistMov
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = DBgrdVlrAtualizadosCalcCellColors
          OnExit = DBgrdHistMovExit
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdVlrAtualizadosTopRowChanged
          object DBgrdHistMovIButton: TwwIButton
            Left = 0
            Top = 0
            Width = 13
            Height = 22
            AllowAllUp = True
          end
        end
        object btnVolta: TfcShapeBtn
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
          TabOrder = 12
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnVoltaClick
        end
        object btnContinua: TfcShapeBtn
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
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 13
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          Visible = False
          OnClick = btnContinuaClick
        end
        object edtDataProcesso: TCMDateTimePicker
          Left = 16
          Top = 256
          Width = 105
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
          TabOrder = 2
        end
        object btnDesvio: TfcShapeBtn
          Left = 376
          Top = 280
          Width = 89
          Height = 29
          Caption = 'Desviar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
          OnClick = btnDesvioClick
        end
        object btnAbono: TfcShapeBtn
          Left = 280
          Top = 280
          Width = 89
          Height = 29
          Caption = 'Abonar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
          OnClick = btnAbonoClick
        end
        object btnBaixaManual: TfcShapeBtn
          Left = 568
          Top = 280
          Width = 89
          Height = 29
          Caption = 'Baixar'#13#10'Manualmente'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 10
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.LineSpacing = -2
          TextOptions.VAlignment = vaVCenter
          OnClick = btnBaixaManualClick
        end
        object btnSuspensao: TfcShapeBtn
          Left = 280
          Top = 240
          Width = 89
          Height = 29
          Caption = 'Suspender'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
          OnClick = btnSuspensaoClick
        end
        object edtDataVencimento: TCMDateTimePicker
          Left = 136
          Top = 256
          Width = 105
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
          TabOrder = 3
        end
        object btnAlteraVencto: TfcShapeBtn
          Left = 472
          Top = 280
          Width = 89
          Height = 29
          Caption = 'Alterar'#13#10'Vencimento'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
          TextOptions.LineSpacing = -2
          TextOptions.VAlignment = vaVCenter
          OnClick = btnAlteraVenctoClick
        end
        object edtVlrSelecao: TRealEdit
          Left = 640
          Top = 240
          Width = 97
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clInactiveBorder
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 14
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object edtVlrRecebido: TRealEdit
          Left = 16
          Top = 328
          Width = 97
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 4
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object btnDesfazBaixa: TfcShapeBtn
          Left = 664
          Top = 280
          Width = 89
          Height = 29
          Caption = 'Desfazer'#13#10'Baixa Manual'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 11
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.LineSpacing = -2
          TextOptions.VAlignment = vaVCenter
          OnClick = btnDesfazBaixaClick
        end
        object Panel4: TPanel
          Left = 11
          Top = 8
          Width = 746
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Itens em Aberto / Baixa Manual'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object btnInverteSelecao: TBitBtn
            Left = 694
            Top = 3
            Width = 25
            Height = 23
            Hint = 'Inverte a Seleção'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = btnInverteSelecaoClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888488888888888888844888888888888444448888888888444444488
              1888884444444888118884448844888881188448884888888118844888888188
              8118844888881188111888448881111111888884881111111888888888811111
              8888888888881188888888888888818888888888888888888888}
          end
          object btnMarcaTodos: TBitBtn
            Left = 719
            Top = 3
            Width = 25
            Height = 23
            Hint = 'Seleciona Todos'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btnMarcaTodosClick
            Glyph.Data = {
              D6000000424DD60000000000000076000000280000000C0000000C0000000100
              0400000000006000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
              0000888224888888000088222248888800008822822488880000882848224888
              0000888224822488000088222248228800008822822482880000882888224888
              0000888888822488000088888888228800008888888882880000}
          end
        end
        object btnLiberaSuspensao: TfcShapeBtn
          Left = 376
          Top = 240
          Width = 89
          Height = 29
          Caption = 'Liberar'#13#10'Suspensão'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
          TextOptions.LineSpacing = -2
          TextOptions.VAlignment = vaVCenter
          OnClick = btnLiberaSuspensaoClick
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'ValoresAtualizados'
        object Label15: TLabel
          Left = 19
          Top = 294
          Width = 339
          Height = 13
          Caption = 'Tipo de Documento para Recebimentos (Contas a Receber)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnVoltaInicio: TfcShapeBtn
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
          TabOrder = 1
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnVoltaInicioClick
        end
        object btnConfirmar: TfcShapeBtn
          Left = 664
          Top = 320
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
          Enabled = False
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
          Visible = False
          OnClick = btnConfirmarClick
        end
        object DBrdgDebito: TRadioGroup
          Left = 19
          Top = 336
          Width = 154
          Height = 61
          Caption = ' Débito '
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Contas a Receber'
            'Folha de Pagamento')
          ParentColor = False
          ParentFont = False
          TabOrder = 3
          Visible = False
          OnClick = DBrdgDebitoClick
        end
        object pnlCAR: TPanel
          Left = 188
          Top = 340
          Width = 373
          Height = 57
          BevelOuter = bvNone
          Color = clGray
          TabOrder = 4
          Visible = False
          object Label30: TLabel
            Left = 0
            Top = 4
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
          object Bevel1: TBevel
            Left = -16
            Top = 32
            Width = 361
            Height = 4
            Shape = bsTopLine
          end
          object DBcboFormaRecebimento: TwwDBLookupCombo
            Left = 0
            Top = 10
            Width = 361
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
          Left = 16
          Top = 34
          Width = 737
          Height = 244
          Selected.Strings = (
            'TRATAMENTO'#9'25'#9'Tratamento'#9'F'
            'ANOMES'#9'7'#9'Mês Cobrança'#9'F'
            'HMEPARCELA'#9'10'#9'Id. Parcela'#9'F'
            'DESCRICAO'#9'40'#9'Ítem'#9'F'
            'VALOR'#9'10'#9'Valor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dtsHistMovVirtual
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          TabOrder = 6
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
        object pnlInformaFinal: TPanel
          Left = 16
          Top = 8
          Width = 737
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Parcela Tratada'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object cbxAgrupaParcela: TCheckBox
          Left = 380
          Top = 285
          Width = 373
          Height = 17
          Caption = 'Agrupar todos os Documentos ANTERIORES no mesmo boleto'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 5
        end
        object DBcboTipoDocRec: TwwDBLookupCombo
          Left = 19
          Top = 308
          Width = 350
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'DESCRICAO'#9'F')
          LookupTable = dtmLookEmptmo.qryLookTipoDocRec
          LookupField = 'CODTIPDOC'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 7
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 397
    Width = 771
    inherited tb97Fundo: TToolbar97
      Left = 599
      DockPos = 610
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150025
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
        'TRealEdit'
        'Text'
        0))
  end
  object dts: TwwDataSource
    AutoEdit = False
    DataSet = dtmEmptmo.qryDadosContrato
    Left = 728
  end
  object dtsHistMov: TwwDataSource
    DataSet = qryHistMov
    Left = 536
    Top = 360
  end
  object qryHistMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'0'#39' AS FLGESCOLHA,'
      ''
      '   HME.IDHISTMOVEMPTMO,'
      ''
      '   IRC.ITEDESCRICAO,'
      ''
      
        '   TO_CHAR(HME.HMEMESCOMPETENCIA, '#39'00'#39') || '#39'/'#39' || HME.HMEANOCOMP' +
        'ETENCIA AS ANOMES,'
      ''
      
        '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMESEQCOBRA' +
        'NCA,'
      
        '   HME.HMETIPOMOV       , HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTM' +
        'O  ,  HME.FLGBAIXADO,'
      
        '   HME.HMEDATAPREVISTA  , HME.HMEVLRPREVISTO   , HME.HMESALDODEV' +
        '   ,  HME.PLNCODIGO,'
      
        '   HME.HMETXJUROS       , HME.HMEPARCELA       , HME.HMEDATAATUA' +
        'LIZA, HME.HMENUMPARCELAS,'
      
        '   HME.HMEDATAEFETIVA   , HME.HMEVLREFETIVO    , HME.HMERECPAG, ' +
        '      HME.IDITEMCENTRALIZA,'
      
        '   HME.IDREGRA          , HME.HMEORIGEM        , HME.HMEPRIORIDA' +
        'DE,'
      ''
      '   DECODE(HME.HMETIPOMOV, 0, '#39'Concessão'#39','
      '                          1, '#39'Parcela '#39','
      '                          2, '#39'Amortização'#39','
      '                          3, '#39'Quitação'#39','
      '                          4, '#39'Atualização Débito'#39') AS EVENTO,'
      ''
      '   HME.HMEFORMACOBRANCA,'
      '   HME.IDRUBRICA,'
      '   CON.IDPATRO,'
      ''
      '   HME.CODDOCUMENTO,'
      ''
      '   HME.HMECENTRALIZA,'
      '   HME.HMEDESTACADO,'
      '   HME.HMEANOCOBRANCA,'
      '   HME.HMEMESCOBRANCA,'
      '   HME.HMEDATAVENCTO, HME.FLGENVIO,'
      ''
      '   HME.FLGBAIXAMANUAL,'
      '   HME.FLGSUSPENSAO,'
      ''
      
        '   DECODE(HME.HMEFORMACOBRANCA,'#39'F'#39','#39'Folha'#39', '#39'C'#39','#39'Financeiro'#39') AS' +
        ' FORMACOBRANCA,'
      
        '   DECODE(HME.FLGBAIXAMANUAL, 1, '#39'Baixa Manual'#39', DECODE(HME.FLGS' +
        'USPENSAO, 1, '#39'Suspenso'#39', NULL)) AS STATUS'
      ''
      'FROM'
      '   HISTMOVEMPTMO  HME,'
      '   CONTRATOEMPTMO CON,'
      '   ITEMXTIPOCONTR IRT,'
      '   ITEMEMPTMO     IRC'
      ''
      'WHERE'
      '       HME.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '   AND IRT.IDTIPOCONTREMPTMO  =:PIDTIPOCONTREMPTMO'
      ''
      '   AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO    = 1 )'
      '   AND HME.HMETIPOMOV         IN (1, 2, 3, 4)'
      ''
      
        '   AND ( HME.FLGESTORNADO     = 0 OR HME.FLGESTORNADO    IS NULL' +
        ' )'
      
        '   AND ( HME.FLGABONADO       = 0 OR HME.FLGABONADO      IS NULL' +
        ' )'
      
        '   AND ( HME.FLGQUITADO       = 0 OR HME.FLGQUITADO      IS NULL' +
        ' )'
      ''
      
        '   AND ( HME.FLGBAIXADO       = 0 OR (:PFLGBAIXAMANUAL   = 1 AND' +
        ' HME.FLGBAIXAMANUAL = 1) )'
      
        '   AND ( :PFLGSUSPENSAO       IS NULL OR (:PFLGSUSPENSAO = 1 AND' +
        ' HME.FLGSUSPENSAO = 1) )'
      ''
      '   AND HME.IDITEMEMPTMO       = IRT.IDITEMEMPTMO'
      '   AND IRT.IDITEMEMPTMO       = IRC.IDITEMEMPTMO'
      '   AND CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO'
      ''
      'ORDER BY'
      
        '   HME.HMEPARCELA, HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA,' +
        ' HME.HMETIPOMOV, HME.HMESEQCOBRANCA')
    UpdateObject = updHistMov
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 536
    Top = 372
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
        Value = '48955'
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'PFLGBAIXAMANUAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGSUSPENSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGSUSPENSAO'
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
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
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
    object qryHistMovEVENTO: TStringField
      DisplayLabel = 'Evento'
      DisplayWidth = 18
      FieldName = 'EVENTO'
      Size = 18
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
    object qryHistMovHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryHistMovIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object qryHistMovIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryHistMovCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryHistMovIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryHistMovHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object qryHistMovHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
    end
    object qryHistMovHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
    end
    object qryHistMovHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
    end
    object qryHistMovFLGESCOLHA: TStringField
      FieldName = 'FLGESCOLHA'
      OnChange = qryHistMovFLGESCOLHAChange
      FixedChar = True
      Size = 1
    end
    object qryHistMovHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qryHistMovHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryHistMovPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryHistMovFORMACOBRANCA: TStringField
      FieldName = 'FORMACOBRANCA'
      Size = 10
    end
    object qryHistMovHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryHistMovFLGENVIO: TFloatField
      FieldName = 'FLGENVIO'
    end
    object qryHistMovFLGBAIXADO: TFloatField
      FieldName = 'FLGBAIXADO'
    end
    object qryHistMovSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 12
    end
    object qryHistMovFLGBAIXAMANUAL: TFloatField
      FieldName = 'FLGBAIXAMANUAL'
    end
    object qryHistMovHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryHistMovHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object qryHistMovHMERECPAG: TStringField
      FieldName = 'HMERECPAG'
      FixedChar = True
      Size = 1
    end
    object qryHistMovIDITEMCENTRALIZA: TFloatField
      FieldName = 'IDITEMCENTRALIZA'
    end
    object qryHistMovIDREGRA: TFloatField
      FieldName = 'IDREGRA'
    end
    object qryHistMovHMEORIGEM: TFloatField
      FieldName = 'HMEORIGEM'
    end
    object qryHistMovHMEPRIORIDADE: TFloatField
      FieldName = 'HMEPRIORIDADE'
    end
    object qryHistMovFLGSUSPENSAO: TFloatField
      FieldName = 'FLGSUSPENSAO'
    end
  end
  object qryHistMovVirtual: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   0                                          AS IDHISTMOVEMPTMO' +
        ','
      
        '   0                                          AS IDCONTRATOEMPTM' +
        'O,'
      '   '#39'0123456789012345678901234567890123456789'#39' AS TRATAMENTO,'
      '   0 AS HMEPARCELA,'
      '   '#39'Parcela'#39' as PARCELA,'
      '   '#39'0000/00'#39' AS ANOMES,'
      '   '#39'00/00/0000'#39' AS HMEDATAPREVISTA,'
      '   '#39'0123456789012345678901234567890123456789'#39' AS DESCRICAO,'
      '   '#39'00/00/0000'#39' AS HMEDATAVENCTO,'
      '   0 AS VALOR'
      ''
      'FROM'
      '   HISTMOVEMPTMO HME'
      ''
      'WHERE'
      '   HME.IDCONTRATOEMPTMO = -1')
    UpdateObject = updHistMovVirtual
    ValidateWithMask = True
    Left = 448
    Top = 360
    object qryHistMovVirtualTRATAMENTO: TStringField
      FieldName = 'TRATAMENTO'
      FixedChar = True
      Size = 40
    end
    object qryHistMovVirtualHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryHistMovVirtualPARCELA: TStringField
      FieldName = 'PARCELA'
      FixedChar = True
      Size = 7
    end
    object qryHistMovVirtualANOMES: TStringField
      FieldName = 'ANOMES'
      FixedChar = True
      Size = 7
    end
    object qryHistMovVirtualHMEDATAPREVISTA: TStringField
      FieldName = 'HMEDATAPREVISTA'
      FixedChar = True
      Size = 10
    end
    object qryHistMovVirtualDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 40
    end
    object qryHistMovVirtualIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovVirtualHMEDATAVENCTO: TStringField
      FieldName = 'HMEDATAVENCTO'
      FixedChar = True
      Size = 10
    end
    object qryHistMovVirtualVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object dtsHistMovVirtual: TwwDataSource
    AutoEdit = False
    DataSet = qryHistMovVirtual
    Left = 448
    Top = 372
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
    Left = 448
    Top = 384
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 672
  end
  object qryAgrupaDocs: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   CODDOCUMENTO, DATAVENCTO, CODPORTFORMA, GRUPODOC'
      'FROM '
      '   DOCUMENTO '
      'WHERE '
      '       ( (EMISBLOQ <> '#39'S'#39') OR (EMISBLOQ IS NULL) ) '
      '   AND ( (RTRIM(STATUS) <> '#39'2'#39') OR (STATUS IS NULL) ) '
      '   AND ( DATAVENCTO = TO_DATE('#39'11/07/2002'#39','#39'dd/mm/yyyy'#39') )'
      '   AND ( CODDOCUMENTO IN (105633) )')
    ValidateWithMask = True
    Left = 600
    object qryAgrupaDocsCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryAgrupaDocsDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object qryAgrupaDocsCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object qryAgrupaDocsGRUPODOC: TStringField
      FieldName = 'GRUPODOC'
    end
  end
  object updHistMov: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTMOVEMPTMO'
      'set'
      '  FLGESCOLHA = :FLGESCOLHA'
      'where'
      '  IDHISTMOVEMPTMO = :OLD_IDHISTMOVEMPTMO')
    InsertSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      '')
    Left = 536
    Top = 384
  end
  object qryDesMarcaSuspensao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      'SET'
      '   FLGSUSPENSAO         = NULL,'
      '   HMEANOSUSPENSAO      = NULL,'
      '   HMEMESSUSPENSAO      = NULL'
      'WHERE'
      '       IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '   AND IDHISTMOVEMPTMO  =:PIDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 312
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryMarcaSuspensao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      'SET'
      '   FLGSUSPENSAO         = 1,'
      '   HMEANOSUSPENSAO      =:PHMEANOSUSPENSAO,'
      '   HMEMESSUSPENSAO      =:PHMEMESSUSPENSAO'
      'WHERE'
      '       IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '   AND IDHISTMOVEMPTMO  =:PIDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 312
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PHMEANOSUSPENSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESSUSPENSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end>
  end
end
