inherited frmExecTrataParcela: TfrmExecTrataParcela
  Left = 128
  Top = 176
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tratamento Individual de Parcelas'
  ClientHeight = 428
  ClientWidth = 771
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 771
    Height = 395
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
      Left = 1
      Top = 32
      Width = 769
      Height = 362
      Align = alBottom
      PageIndex = 1
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Selecao'
        object Label27: TLabel
          Left = 168
          Top = 58
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
        object Label42: TLabel
          Left = 168
          Top = 10
          Width = 103
          Height = 13
          Caption = 'Situação Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 16
          Top = 58
          Width = 117
          Height = 13
          Caption = 'Insc. em Empréstimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 16
          Top = 154
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
        object Label21: TLabel
          Left = 376
          Top = 210
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
          Top = 210
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
          Top = 210
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
        object Label4: TLabel
          Left = 424
          Top = 58
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
        object Label34: TLabel
          Left = 424
          Top = 10
          Width = 107
          Height = 13
          Caption = 'Matrícula Empresa'
        end
        object Label41: TLabel
          Left = 544
          Top = 10
          Width = 141
          Height = 13
          Caption = 'Situação do Participante'
        end
        object Label1: TLabel
          Left = 408
          Top = 104
          Width = 68
          Height = 13
          Caption = 'Beneficiário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 296
          Top = 10
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
        object Label14: TLabel
          Left = 400
          Top = 154
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
        object Label17: TLabel
          Left = 464
          Top = 210
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
          Top = 210
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
          Top = 210
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
          Top = 210
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
        object btnContinuaSelecao: TfcShapeBtn
          Left = 667
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
        object DBedtCodInsc: TDBEdit
          Left = 16
          Top = 72
          Width = 138
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'INSCRICAO'
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
        object DBedtPlanoPrev: TDBEdit
          Left = 168
          Top = 72
          Width = 242
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
          TabOrder = 2
        end
        object DBedtSituacao: TDBEdit
          Left = 168
          Top = 24
          Width = 118
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'DESCSITCONTRATO'
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
          Left = 16
          Top = 112
          Width = 377
          Height = 32
          TabStop = False
          Color = clBtnFace
          DataField = 'TITULAR'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBedtNumContrato: TDBEdit
          Left = 16
          Top = 24
          Width = 112
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'IDContratoEmptmo'
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
        object btnBuscaContrato: TBitBtn
          Left = 128
          Top = 24
          Width = 24
          Height = 22
          Hint = 'Busca o Contrato'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
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
        object DBedtTipoContrato: TDBEdit
          Left = 16
          Top = 168
          Width = 361
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'TceDescricao'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object DBedtJuros: TDBEdit
          Left = 376
          Top = 224
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
          TabOrder = 8
        end
        object DBedtDataInsc: TCMDateTimePicker
          Left = 16
          Top = 224
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
          DataField = 'DATAINSC'
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
        object DBedtDataCredito: TCMDateTimePicker
          Left = 136
          Top = 224
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
          TabOrder = 10
        end
        object DBedtPatro: TDBEdit
          Left = 424
          Top = 72
          Width = 329
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
          TabOrder = 11
        end
        object DBedtInscricao: TDBEdit
          Left = 296
          Top = 24
          Width = 118
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
          TabOrder = 12
        end
        object DBedtMtrEmpresa: TDBEdit
          Left = 424
          Top = 24
          Width = 110
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
          TabOrder = 13
        end
        object DBedtSitPart: TDBEdit
          Left = 544
          Top = 24
          Width = 152
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'SITUACAO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
        end
        object DBedtBeneficiario: TDBEdit
          Left = 408
          Top = 120
          Width = 345
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'BENEFICIARIO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 15
        end
        object DBedtTipoEmptmo: TDBEdit
          Left = 400
          Top = 168
          Width = 353
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
          TabOrder = 16
        end
        object DBedtValSolic: TDBEdit
          Left = 464
          Top = 224
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
          TabOrder = 17
        end
        object DBedtValorParcela: TDBEdit
          Left = 656
          Top = 224
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
          Top = 224
          Width = 68
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clBtnFace
          DataField = 'NUMPARCELAS'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 19
        end
        object DBedtDataPrimParcela: TCMDateTimePicker
          Left = 256
          Top = 224
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
          TabOrder = 20
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'HistoricoMovimentacao'
        object lblData: TLabel
          Left = 36
          Top = 264
          Width = 102
          Height = 13
          Caption = 'Data do Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 188
          Top = 264
          Width = 116
          Height = 13
          Caption = 'Data do Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBgrdHistMov: TwwDBGrid
          Left = 16
          Top = 34
          Width = 737
          Height = 222
          Selected.Strings = (
            'FLGESCOLHA'#9'3'#9' '#9'F'
            'EVENTO'#9'16'#9'Evento'#9'F'
            'ANOMES'#9'8'#9'Compet.'#9'F'
            'HMEPARCELA'#9'4'#9'Parc'#9'F'
            'HMESEQCOBRANCA'#9'3'#9'Seq'#9'F'
            'IteDescricao'#9'26'#9'Item'#9'F'
            'HMEDATAPREVISTA'#9'10'#9'Previsão'#9'F'
            'HMEVLRPREVISTO'#9'9'#9'Valor Prev.'#9'F'
            'HMETXJUROS'#9'9'#9'Tx Juros'#9'F'
            'HMESALDODEV'#9'10'#9'Sld Devedor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
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
          object DBgrdHistMovIButton: TwwIButton
            Left = 0
            Top = 0
            Width = 13
            Height = 22
            AllowAllUp = True
          end
        end
        object btnVolta: TfcShapeBtn
          Left = 570
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
          OnClick = btnVoltaClick
        end
        object btnContinua: TfcShapeBtn
          Left = 667
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
          OnClick = btnContinuaClick
        end
        object edtData: TCMDateTimePicker
          Left = 36
          Top = 278
          Width = 141
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
          TabOrder = 4
        end
        object btnDesvio: TfcShapeBtn
          Left = 346
          Top = 276
          Width = 82
          Height = 23
          Caption = 'Desvio'
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
          TextOptions.VAlignment = vaVCenter
          Visible = False
          OnClick = btnDesvioClick
        end
        object btnAbono: TfcShapeBtn
          Left = 522
          Top = 276
          Width = 82
          Height = 23
          Caption = 'Abono'
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
          Visible = False
          OnClick = btnAbonoClick
        end
        object btnBaixaManual: TfcShapeBtn
          Left = 434
          Top = 276
          Width = 82
          Height = 23
          Caption = 'Baixa Manual'
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
          Visible = False
          OnClick = btnBaixaManualClick
        end
        object grpTratamento: TRadioGroup
          Left = 32
          Top = 304
          Width = 533
          Height = 49
          Caption = ' Tratamento '
          Columns = 5
          Items.Strings = (
            '&Desvio'
            '&Baixa Manual'
            '&Abono'
            '&Suspensão'
            '&Mudar Vencto')
          TabOrder = 9
        end
        object btnSuspensao: TfcShapeBtn
          Left = 610
          Top = 276
          Width = 82
          Height = 23
          Caption = 'Suspensão'
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
          TextOptions.VAlignment = vaVCenter
          Visible = False
          OnClick = btnSuspensaoClick
        end
        object Panel4: TPanel
          Left = 15
          Top = 8
          Width = 738
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
        object edtDataVencimento: TCMDateTimePicker
          Left = 188
          Top = 278
          Width = 141
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
          TabOrder = 5
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'ValoresAtualizados'
        object btnVoltaInicio: TfcShapeBtn
          Left = 570
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
          Left = 667
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
          Left = 11
          Top = 288
          Width = 154
          Height = 61
          Caption = ' Débito '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Contas a Receber'
            'Folha de Pagamento')
          ParentFont = False
          TabOrder = 3
          Visible = False
          OnClick = DBrdgDebitoClick
        end
        object pnlCAR: TPanel
          Left = 172
          Top = 292
          Width = 390
          Height = 57
          BevelOuter = bvNone
          TabOrder = 4
          Visible = False
          object Label30: TLabel
            Left = 0
            Top = 20
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
            Left = 0
            Top = 0
            Width = 454
            Height = 4
            Shape = bsTopLine
          end
          object DBcboFormaRecebimento: TwwDBLookupCombo
            Left = 0
            Top = 34
            Width = 391
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
            'TRATAMENTO'#9'35'#9'Tratamento'#9'F'
            'ANOMES'#9'7'#9'Mês Cobrança'#9'F'
            'HMEPARCELA'#9'10'#9'Id. Parcela'#9'F'
            'DESCRICAO'#9'40'#9'Ítem'#9'F')
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
          Left = 571
          Top = 291
          Width = 118
          Height = 17
          Caption = 'Agrupar parcelas'
          TabOrder = 5
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 395
    Width = 771
    inherited tb97Fundo: TToolbar97
      Left = 599
      DockPos = 610
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  INS.IDINSCRICAOEMPTMO AS INSCRICAO,'
      '  PPP.INSCRICAONUMERO,'
      '  DECODE(CNT.FLGSITUACAO,'#39'A'#39','#39'Ativo'#39','
      '                         '#39'C'#39','#39'Cancelado'#39','
      '                         '#39'E'#39','#39'Encerrado'#39','
      '                         '#39'Q'#39','#39'Quitado'#39','
      '                         '#39'R'#39','#39'Refinanciado'#39','
      '                         '#39'S'#39','#39'Suspenso'#39','
      
        '                         '#39'K'#39','#39'Pendente de Quitação'#39') AS DESCSITC' +
        'ONTRATO,'
      ''
      '  SIT.IDSITPART,'
      '  SIT.DESCRICAO AS SITUACAO,'
      '  SIT.FLGINTERNO,'
      '  PLV.NOME      AS PLANOPREV,'
      '  JUR.NOME      AS PATRO,'
      '  ELP.MATRICULA,'
      '  TIT.NOME      AS TITULAR,'
      '  BEN.NOME      AS BENEFICIARIO,'
      ''
      '  TIP.TCEDESCRICAO, TIP.IDTIPOEMPTMO,'
      ''
      '  TEM.DESCTIPOEMPTMO,'
      '  INS.DATAINSC,'
      '  BAN.NOME AS BANCO,'
      '  CTB.CONTACORRENTE, AGB.NUMAGENCIA,'
      ''
      
        '  CNT.IDCONTRATOEMPTMO , CNT.IDCONTRQUITACAO, CNT.IDPESSOA      ' +
        ' , CNT.IDBENEF     ,'
      
        '  CNT.IDINSCRICAOEMPTMO, CNT.IDPLANOPREV    , CNT.IDPATRO       ' +
        ' , CNT.IDVERBA     ,'
      
        '  CNT.IDTIPOCONTREMPTMO, CNT.IDCBANCARIA    , CNT.IDMOTIVOCANC  ' +
        ' , CNT.NUMPARCELAS ,'
      
        '  CNT.CODFORMAPAG      , CNT.PORTFORMAPAG   , CNT.PORTFORMAREC  ' +
        ' , CNT.DATACANC    ,'
      
        '  CNT.DATACREDITO      , CNT.DATASITUACAO   , CNT.DATAASSINATURA' +
        ' , CNT.DATAPRIMPARC,'
      
        '  CNT.VLRCONTRATO      , CNT.VLRPARCELA     , CNT.TXJUROS       ' +
        ' ,'
      '  CNT.FLGSITUACAO      , CNT.FLGFORMAREC    , CNT.FLGFORMAPAG'
      ''
      'FROM'
      ' PESSOA          JUR,'
      ' PESSOA          TIT,'
      ' PESSOA          BEN,'
      ' PESSOA          BAN,'
      ' AGENCIABANCARIA AGB,'
      ' CONTABANCARIA   CTB,'
      ' PARTPREVPLAN    PPP,'
      ' ELEGPATRO       ELP,'
      ' TIPOCONTREMPTMO TIP,'
      ' TIPOEMPTMO      TEM,'
      ' SITPART         SIT,'
      ' CONTRATOEMPTMO  CNT,'
      ' INSCRICAOEMPTMO INS,'
      ' PLANPREV        PLV'
      ''
      ''
      'WHERE'
      ' CNT.IDCONTRATOEMPTMO      = :PIDCONTRATOEMPTMO'
      ' AND PPP.FLGDESATIVADO     = 0'
      ' AND CNT.IDPESSOA          = PPP.IDPESSOA'
      ' AND SIT.IDSITPART         = PPP.IDSITPART'
      ' AND PLV.IDPLANOPREV       = PPP.IDPLANOPREV'
      ' AND CNT.IDPATRO           = JUR.IDPESSOA'
      ' AND CNT.IDPESSOA          = ELP.IDPESSOA'
      ' AND CNT.IDPATRO           = ELP.IDPESSJUR'
      ' AND CNT.IDPESSOA          = TIT.IDPESSOA'
      ' AND CNT.IDBENEF           = BEN.IDPESSOA'
      ' AND CNT.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO'
      ' AND TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO'
      ' AND CNT.IDINSCRICAOEMPTMO = INS.IDINSCRICAOEMPTMO'
      ' AND INS.IDCBANCARIA       = CTB.IDCBANCARIA(+)'
      ' AND CTB.IDAGENCIA         = AGB.IDPESSOA(+)'
      ' AND AGB.IDBANCO           = BAN.IDPESSOA(+)'
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
    Left = 224
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDContratoEmptmo'
        ParamType = ptInput
      end>
    object qryINSCRICAO: TFloatField
      FieldName = 'INSCRICAO'
    end
    object qryINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryDESCSITCONTRATO: TStringField
      FieldName = 'DESCSITCONTRATO'
    end
    object qryIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
    object qrySITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 50
    end
    object qryFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryPLANOPREV: TStringField
      FieldName = 'PLANOPREV'
      Size = 50
    end
    object qryPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryTITULAR: TStringField
      FieldName = 'TITULAR'
      Size = 60
    end
    object qryBENEFICIARIO: TStringField
      FieldName = 'BENEFICIARIO'
      Size = 60
    end
    object qryDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object qryDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
    end
    object qryBANCO: TStringField
      FieldName = 'BANCO'
      Size = 60
    end
    object qryCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qryNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object qryIDCONTRQUITACAO: TFloatField
      FieldName = 'IDCONTRQUITACAO'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryIDVERBA: TFloatField
      FieldName = 'IDVERBA'
    end
    object qryIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryIDMOTIVOCANC: TFloatField
      FieldName = 'IDMOTIVOCANC'
    end
    object qryCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object qryPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object qryPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
    end
    object qryNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryDATASITUACAO: TDateTimeField
      FieldName = 'DATASITUACAO'
    end
    object qryDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object qryDATAPRIMPARC: TDateTimeField
      FieldName = 'DATAPRIMPARC'
    end
    object qryDATACANC: TDateTimeField
      FieldName = 'DATACANC'
    end
    object qryVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryVLRPARCELA: TFloatField
      FieldName = 'VLRPARCELA'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryTXJUROS: TFloatField
      FieldName = 'TXJUROS'
      DisplayFormat = '#,##0.0000 %'
      EditFormat = '#,##0.0000 %'
    end
    object qryFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
    end
    object qryTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object qryIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
  end
  object dts: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 272
    Top = 184
  end
  object dtsHistMov: TwwDataSource
    AutoEdit = False
    DataSet = qryHistMov
    Left = 72
    Top = 144
  end
  object qryHistMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'0'#39' AS FLGESCOLHA,'
      '   IRC.ITEDESCRICAO,'
      
        '   TO_CHAR(HME.HMEMESCOMPETENCIA, '#39'00'#39') || '#39'/'#39' || HME.HMEANOCOMP' +
        'ETENCIA AS ANOMES,'
      
        '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMESEQCOBRA' +
        'NCA,'
      
        '   HME.HMETIPOMOV       , HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTM' +
        'O  ,'
      
        '   HME.HMEDATAPREVISTA  , HME.HMEVLRPREVISTO   , HME.HMESALDODEV' +
        '   ,'
      
        '   HME.HMETXJUROS       , HME.HMEPARCELA       , HME.HMEDATAATUA' +
        'LIZA, HME.HMENUMPARCELAS,  '
      '   DECODE(HME.HMETIPOMOV,0,'#39'Concessão'#39','
      '                         1,'#39'Parcela '#39','
      '                         2,'#39'Amortização'#39','
      '                         3,'#39'Quitação'#39','
      '                         4,'#39'Atualização Débito'#39') AS EVENTO,'
      '   HME.HMEFORMACOBRANCA,'
      '   HME.IDRUBRICA,'
      '   CNT.IDPATRO,'
      '   HME.CODDOCUMENTO,'
      '   HME.IDHISTMOVEMPTMO,'
      '   HME.HMECENTRALIZA,'
      '   HME.HMEDESTACADO,'
      '   HME.HMEANOCOBRANCA,'
      '   HME.HMEMESCOBRANCA'
      'FROM'
      '   HISTMOVEMPTMO  HME,'
      '   CONTRATOEMPTMO CNT,'
      '   ITEMXTIPOCONTR IRT,'
      '   ITEMEMPTMO     IRC'
      'WHERE'
      '   ( HME.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO )'
      '   AND ( IRT.IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO )'
      '   AND ( HME.IDITEMEMPTMO = IRT.IDITEMEMPTMO )'
      '   AND ( IRT.IDITEMEMPTMO = IRC.IDITEMEMPTMO )'
      '   AND ( (HME.FLGSUSPENSAO = 0) OR (HME.FLGSUSPENSAO IS NULL) )'
      '   AND ( (HME.HMECENTRALIZA = 1) OR (IRT.FLGDESTACADO = 1) )'
      '   AND ( HME.FLGBAIXADO = 0 )'
      '   AND ( (HME.FLGESTORNADO = 0) OR (HME.FLGESTORNADO IS NULL) )'
      '   AND ( CNT.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO )'
      'ORDER BY'
      '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMEPARCELA'
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGESCOLHA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 72
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
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
      Size = 1
    end
    object qryHistMovHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qryHistMovHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
  end
  object qryHistMovVirtual: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   '#39'0123456789012345678901234567890123456789'#39' AS TRATAMENTO,'
      '   0 AS HMEPARCELA,'
      '   '#39'Parcela'#39' as PARCELA,'
      '   '#39'0000/00'#39' AS ANOMES,'
      '   '#39'00/00/0000'#39' AS HMEDATAPREVISTA,'
      '   '#39'01234567890123456789'#39' AS DESCRICAO'
      ''
      'FROM'
      '   HISTMOVEMPTMO HME'
      ''
      'WHERE'
      '   HME.IDCONTRATOEMPTMO = -1')
    UpdateObject = updHistMovVirtual
    ValidateWithMask = True
    Left = 344
    Top = 200
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
    end
  end
  object dtsHistMovVirtual: TwwDataSource
    AutoEdit = False
    DataSet = qryHistMovVirtual
    Left = 160
    Top = 184
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
    Left = 464
    Top = 184
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 111
    Caption = 'Seleciona'
    Colunas.Strings = (
      'EL.MATRICULA'
      'P.NOME'
      'P.NUMDOCUMENTO'
      'PPP.INSCRICAONUMERO'
      'C.IDCONTRATOEMPTMO'
      'PL.NOME'
      'PA.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'CPF ou CNPJ'
      'Inscrição'
      'Contrato'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N'
      'S'
      'S'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA P'
      'ELEGPATRO EL'
      'PARTPREVPLAN PPP'
      'CONTRATOEMPTMO C'
      'PESSOA PA'
      'PLANPREV PL')
    CamposChave.Strings = (
      'C.IDCONTRATOEMPTMO')
    Filtro.Strings = (
      'P.IDPESSOA = EL.IDPESSOA(+)'
      'EL.IDPESSJUR = PPP.IDPESSJUR'
      'P.IDPESSOA = PPP.IDPESSOA(+)'
      'P.IDPESSOA = C.IDPESSOA'
      'PPP.FLGDESATIVADO = 0'
      'PPP.SEQPROPOSTA = '#39'1'#39
      'PL.TPPLANOPREV = '#39'F'#39
      'PA.IDPESSOA = PPP.IDPESSJUR'
      'PL.IDPLANOPREV = PPP.IDPLANOPREV'
      'EL.IDPESSOA = PPP.IDPESSOA'
      'C.FLGSITUACAO = '#39'A'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '43'
      '18'
      '10'
      '12'
      '50'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    Left = 712
    Top = 6
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 712
    Top = 296
  end
  object qryAgrupaDocs: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   D.CODDOCUMENTO, D.DATAVENCTO, D.CODPORTFORMA,'
      '   L.LOGIN_USUARIO AS GRUPODOC'
      ''
      'FROM'
      '   DOCUMENTO D, VWLANCAMENTO L'
      ''
      'WHERE'
      '   ( L.IDCONTRATOIMOVEL =:CONTRATO )'
      '   AND ( D.EMISBLOQ <> '#39'S'#39' OR D.EMISBLOQ IS NULL)'
      '   AND ( D.STATUS <> '#39'2'#39'  OR D.STATUS IS NULL)'
      '   AND ( L.CODDOCUMENTO = D.CODDOCUMENTO )'
      '   '
      'ORDER BY'
      '   D.DATAVENCTO')
    ValidateWithMask = True
    Left = 336
    Top = 308
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end>
    object qryAgrupaDocsCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
    end
    object qryAgrupaDocsDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
      Origin = 'DOCUMENTO.DATAVENCTO'
    end
    object qryAgrupaDocsCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'DOCUMENTO.CODPORTFORMA'
    end
    object qryAgrupaDocsGRUPODOC: TStringField
      FieldName = 'GRUPODOC'
      Origin = 'VWLANCAMENTO.LOGIN_USUARIO'
    end
  end
end
