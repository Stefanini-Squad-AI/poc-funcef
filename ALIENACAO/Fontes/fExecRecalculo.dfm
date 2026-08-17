inherited frmExecRecalculo: TfrmExecRecalculo
  Left = 286
  Top = 222
  HelpContext = 1350015
  Caption = 'Recalculo de Parcelas em Aberto'
  ClientHeight = 429
  ClientWidth = 589
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel [0]
    Left = 16
    Top = 140
    Width = 61
    Height = 13
    Caption = 'Comprador'
  end
  inherited pnlFundo: TPanel
    Width = 589
    Height = 396
    object lblTitulo: TfcLabel
      Left = 0
      Top = 0
      Width = 589
      Height = 24
      Align = alTop
      Caption = 'Parcela para Recálculo [Seleção]'
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
    object ntbRecalculo: TNotebook
      Left = 0
      Top = 24
      Width = 589
      Height = 372
      Align = alClient
      TabOrder = 0
      OnPageChanged = ntbRecalculoPageChanged
      object TPage
        Left = 0
        Top = 0
        Caption = 'Selecao'
        object Bevel4: TBevel
          Left = -119
          Top = 312
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object Label12: TLabel
          Left = 16
          Top = 288
          Width = 334
          Height = 13
          Caption = 'Somente as parcelas Integradas poderão ser recalculadas.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnProcurar: TfcShapeBtn
          Left = 46
          Top = 324
          Width = 89
          Height = 29
          Hint = 'Procura o Documento a ser recalculado'
          Caption = '&Procurar'
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
          OnClick = btnProcurarClick
        end
        object btnContinuaSelecao: TfcShapeBtn
          Left = 440
          Top = 324
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
          OnClick = btnContinuaSelecaoClick
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 589
          Height = 273
          Align = alTop
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 2
          object Label4: TLabel
            Left = 15
            Top = 9
            Width = 49
            Height = 13
            Caption = 'Contrato'
          end
          object Label5: TLabel
            Left = 16
            Top = 52
            Width = 61
            Height = 13
            Caption = 'Comprador'
          end
          object Label13: TLabel
            Left = 336
            Top = 52
            Width = 74
            Height = 13
            Caption = 'Responsável'
          end
          object Label14: TLabel
            Left = 16
            Top = 95
            Width = 80
            Height = 13
            Caption = 'Imóvel Mestre'
          end
          object DBEdit9: TDBEdit
            Left = 15
            Top = 25
            Width = 121
            Height = 21
            DataField = 'CONNUMERO'
            DataSource = dsParc
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit10: TDBEdit
            Left = 135
            Top = 25
            Width = 434
            Height = 21
            DataField = 'CONNOME'
            DataSource = dsParc
            ReadOnly = True
            TabOrder = 1
          end
          object DBEdit13: TDBEdit
            Left = 16
            Top = 68
            Width = 305
            Height = 21
            DataField = 'COMPRADOR'
            DataSource = dsParc
            ReadOnly = True
            TabOrder = 2
          end
          object DBEdit14: TDBEdit
            Left = 336
            Top = 68
            Width = 233
            Height = 21
            DataField = 'RESPONSAVEL'
            DataSource = dsParc
            ReadOnly = True
            TabOrder = 3
          end
          object DBEdit15: TDBEdit
            Left = 16
            Top = 111
            Width = 553
            Height = 21
            DataField = 'NOMEMESTRE'
            DataSource = dsParc
            ReadOnly = True
            TabOrder = 4
          end
          object GroupBox2: TGroupBox
            Left = 16
            Top = 141
            Width = 553
            Height = 113
            TabOrder = 5
            object Label15: TLabel
              Left = 13
              Top = 12
              Width = 44
              Height = 13
              Caption = 'Parcela'
            end
            object Label16: TLabel
              Left = 13
              Top = 57
              Width = 75
              Height = 13
              Caption = 'Data Lancto.'
            end
            object Label17: TLabel
              Left = 432
              Top = 12
              Width = 76
              Height = 13
              Caption = 'Data Vencto.'
            end
            object Label18: TLabel
              Left = 296
              Top = 12
              Width = 34
              Height = 13
              Caption = 'Valor '
            end
            object Label19: TLabel
              Left = 112
              Top = 57
              Width = 101
              Height = 13
              Caption = 'Nº do Documento'
            end
            object Label20: TLabel
              Left = 112
              Top = 12
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object DBEdit16: TDBEdit
              Left = 13
              Top = 28
              Width = 84
              Height = 21
              Color = 12648447
              DataField = 'NUMPARCELA'
              DataSource = dsParc
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit17: TDBEdit
              Left = 13
              Top = 72
              Width = 84
              Height = 21
              Color = 12648447
              DataField = 'DATALANCINTEGRA'
              DataSource = dsParc
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit18: TDBEdit
              Left = 432
              Top = 28
              Width = 104
              Height = 21
              Color = 12648447
              DataField = 'DATAVENCIMENTO'
              DataSource = dsParc
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit19: TDBEdit
              Left = 296
              Top = 28
              Width = 113
              Height = 21
              Color = 12648447
              DataField = 'VLRPRESTACAO'
              DataSource = dsParc
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit20: TDBEdit
              Left = 112
              Top = 72
              Width = 137
              Height = 21
              Color = 12648447
              DataField = 'CODDOCUMENTO'
              DataSource = dsParc
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit21: TDBEdit
              Left = 112
              Top = 28
              Width = 161
              Height = 21
              Color = 12648447
              DataField = 'CAL_TIPO'
              DataSource = dsParc
              ReadOnly = True
              TabOrder = 5
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Indice'
        object Label21: TLabel
          Left = 54
          Top = 15
          Width = 106
          Height = 16
          Caption = 'Recalcular até:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel2: TBevel
          Left = -31
          Top = 312
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object edtDataVencimento: TCMDateTimePicker
          Left = 168
          Top = 13
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
        object grpReajuste: TGroupBox
          Left = 55
          Top = 48
          Width = 474
          Height = 61
          Caption = 'Correção Montetária'
          TabOrder = 1
          TabStop = True
          object Label59: TLabel
            Left = 186
            Top = 28
            Width = 96
            Height = 13
            Caption = 'Utilizar indice de'
          end
          object Label63: TLabel
            Left = 340
            Top = 28
            Width = 112
            Height = 13
            Caption = 'mes(es) anterior(es)'
          end
          object DBcboIndiceReajuste: TwwDBLookupCombo
            Left = 16
            Top = 24
            Width = 145
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOESIGLA'#9'6'#9'Moeda')
            DataField = 'IDINDCORRECAO'
            DataSource = dsContratoXMulta
            LookupTable = qryLookMoeda
            LookupField = 'MOECODIGO'
            Style = csDropDownList
            DropDownCount = 4
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dbSpEdtMesesAnteriores: TwwDBSpinEdit
            Left = 286
            Top = 24
            Width = 49
            Height = 21
            Increment = 1
            MaxValue = 9
            DataField = 'MESREFCORRECAO'
            DataSource = dsContratoXMulta
            TabOrder = 1
            UnboundDataType = wwDefault
          end
        end
        object grpMulta: TGroupBox
          Left = 55
          Top = 120
          Width = 473
          Height = 65
          Caption = ' Multa'
          TabOrder = 2
          TabStop = True
          object Label24: TLabel
            Left = 436
            Top = 32
            Width = 16
            Height = 20
            Caption = '%'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label25: TLabel
            Left = 16
            Top = 18
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object Label26: TLabel
            Left = 312
            Top = 18
            Width = 62
            Height = 13
            Caption = 'Percentual'
          end
          object Label27: TLabel
            Left = 287
            Top = 32
            Width = 21
            Height = 20
            Caption = 'ou'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label28: TLabel
            Left = 144
            Top = 18
            Width = 39
            Height = 13
            Caption = 'Moeda'
          end
          object DBedtPercentMulta: TDBRealEdit
            Left = 312
            Top = 32
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 2
            WordWrap = False
            IntDigits = 3
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'PERCMULTA'
            DataSource = dsContratoXMulta
          end
          object DBedtVlrMulta: TDBRealEdit
            Left = 16
            Top = 32
            Width = 113
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 15
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRMULTA'
            DataSource = dsContratoXMulta
          end
          object DBcboMoedaMulta: TwwDBLookupCombo
            Left = 144
            Top = 32
            Width = 137
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOESIGLA'#9'6'#9'Moeda')
            DataField = 'MOEDAMULTA'
            DataSource = dsContratoXMulta
            LookupTable = qryLookMoeda
            LookupField = 'MOECODIGO'
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object grpMora: TGroupBox
          Left = 55
          Top = 192
          Width = 298
          Height = 105
          Caption = ' Juros de Mora '
          TabOrder = 3
          TabStop = True
          object Label1: TLabel
            Left = 16
            Top = 18
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object Label2: TLabel
            Left = 132
            Top = 72
            Width = 16
            Height = 20
            Caption = '%'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label29: TLabel
            Left = 48
            Top = 58
            Width = 62
            Height = 13
            Caption = 'Percentual'
          end
          object Label30: TLabel
            Left = 17
            Top = 72
            Width = 21
            Height = 20
            Caption = 'ou'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label31: TLabel
            Left = 144
            Top = 18
            Width = 39
            Height = 13
            Caption = 'Moeda'
          end
          object DBedtVlrMora: TDBRealEdit
            Left = 16
            Top = 32
            Width = 113
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 15
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRJUROS'
            DataSource = dsContratoXMulta
          end
          object DBedtPercentMora: TDBRealEdit
            Left = 48
            Top = 72
            Width = 81
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,0000')
            TabOrder = 2
            WordWrap = False
            IntDigits = 3
            DecDigits = 4
            NumberFormat = fNumber
            Signal = False
            DataField = 'PERCJUROS'
            DataSource = dsContratoXMulta
          end
          object DBedtMoedaMora: TwwDBLookupCombo
            Left = 144
            Top = 32
            Width = 137
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOESIGLA'#9'6'#9'Moeda')
            DataField = 'MOEDAJUROS'
            DataSource = dsContratoXMulta
            LookupTable = qryLookMoeda
            LookupField = 'MOECODIGO'
            Style = csDropDownList
            DropDownCount = 6
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object grpPeriodicidadeMora: TGroupBox
          Left = 351
          Top = 192
          Width = 177
          Height = 105
          TabOrder = 4
          TabStop = True
          object Label3: TLabel
            Left = 16
            Top = 18
            Width = 78
            Height = 13
            Caption = 'Periodicidade'
          end
          object Label7: TLabel
            Left = 44
            Top = 67
            Width = 107
            Height = 26
            AutoSize = False
            Caption = 'Mora proporcional ao nº de dias'
            WordWrap = True
          end
          object DBchkMoraProporc: TDBCheckBox
            Left = 24
            Top = 72
            Width = 17
            Height = 17
            DataField = 'FLGJUROSPROPORC'
            DataSource = dsContratoXMulta
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object dbCboPeriodicidade: TwwDBComboBox
            Left = 16
            Top = 33
            Width = 137
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = False
            DataField = 'PERIODOJUROS'
            DataSource = dsContratoXMulta
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Mensal'#9'M'
              'Diária'#9'D')
            Sorted = False
            TabOrder = 0
            UnboundDataType = wwDefault
          end
        end
        object btnVoltaIndice: TfcShapeBtn
          Left = 344
          Top = 324
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
          TabOrder = 5
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnVoltaIndiceClick
        end
        object btnContinuaIndice: TfcShapeBtn
          Left = 440
          Top = 324
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
          OnClick = btnContinuaIndiceClick
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Mensagem'
        object Label41: TLabel
          Left = 21
          Top = 245
          Width = 62
          Height = 13
          Caption = 'Curingas:  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label44: TLabel
          Left = 32
          Top = 265
          Width = 120
          Height = 13
          Caption = '<vo> = Valor Original'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label45: TLabel
          Left = 32
          Top = 281
          Width = 157
          Height = 13
          Caption = '<cm> = Correção Monetária'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label42: TLabel
          Left = 204
          Top = 265
          Width = 142
          Height = 13
          Caption = '<juros>  = Valor do Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label43: TLabel
          Left = 204
          Top = 281
          Width = 142
          Height = 13
          Caption = '<multa> = Valor da Multa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label49: TLabel
          Left = 376
          Top = 265
          Width = 189
          Height = 13
          Caption = '<dataval>  = Validade do Cálculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel1: TBevel
          Left = -119
          Top = 312
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object Label11: TLabel
          Left = 376
          Top = 281
          Width = 157
          Height = 13
          Caption = '<parc>      = Nr. da Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object GroupBox1: TGroupBox
          Left = 17
          Top = 9
          Width = 551
          Height = 226
          Caption = 'Mensagem do Boleto'
          TabOrder = 0
          object Label32: TLabel
            Left = 15
            Top = 28
            Width = 47
            Height = 13
            Caption = 'Linha 1:'
          end
          object Label33: TLabel
            Left = 15
            Top = 49
            Width = 47
            Height = 13
            Caption = 'Linha 2:'
          end
          object Label34: TLabel
            Left = 15
            Top = 70
            Width = 47
            Height = 13
            Caption = 'Linha 3:'
          end
          object Label35: TLabel
            Left = 15
            Top = 91
            Width = 47
            Height = 13
            Caption = 'Linha 4:'
          end
          object Label36: TLabel
            Left = 15
            Top = 112
            Width = 47
            Height = 13
            Caption = 'Linha 5:'
          end
          object Label37: TLabel
            Left = 15
            Top = 133
            Width = 47
            Height = 13
            Caption = 'Linha 6:'
          end
          object Label38: TLabel
            Left = 15
            Top = 154
            Width = 47
            Height = 13
            Caption = 'Linha 7:'
          end
          object Label39: TLabel
            Left = 15
            Top = 175
            Width = 47
            Height = 13
            Caption = 'Linha 8:'
          end
          object Label40: TLabel
            Left = 15
            Top = 196
            Width = 47
            Height = 13
            Caption = 'Linha 9:'
          end
          object edtln1: TEdit
            Left = 71
            Top = 24
            Width = 465
            Height = 21
            MaxLength = 69
            TabOrder = 0
            Text = 'Cálculos Válidos até: <dataval>'
          end
          object edtln2: TEdit
            Left = 71
            Top = 45
            Width = 465
            Height = 21
            MaxLength = 69
            TabOrder = 1
            Text = 'Não receber após: <dataval>'
          end
          object edtln4: TEdit
            Left = 71
            Top = 87
            Width = 465
            Height = 21
            MaxLength = 69
            TabOrder = 3
            Text = 'Parcela Nr.: <parc>      Valor Original: <vo>'
          end
          object edtln5: TEdit
            Left = 71
            Top = 108
            Width = 465
            Height = 21
            MaxLength = 69
            TabOrder = 4
            Text = 'Correção Monetária: <cm>'
          end
          object edtln6: TEdit
            Left = 71
            Top = 129
            Width = 465
            Height = 21
            MaxLength = 69
            TabOrder = 5
            Text = 'Juros: <juros>'
          end
          object edtln7: TEdit
            Left = 71
            Top = 150
            Width = 465
            Height = 21
            MaxLength = 69
            TabOrder = 6
            Text = 'Multa:<multa>'
          end
          object edtln3: TEdit
            Left = 71
            Top = 66
            Width = 465
            Height = 21
            MaxLength = 69
            TabOrder = 2
          end
          object edtln8: TEdit
            Left = 71
            Top = 171
            Width = 465
            Height = 21
            MaxLength = 69
            TabOrder = 7
          end
          object edtln9: TEdit
            Left = 71
            Top = 192
            Width = 465
            Height = 21
            MaxLength = 69
            TabOrder = 8
          end
        end
        object btnVoltarMens: TfcShapeBtn
          Left = 344
          Top = 324
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
          OnClick = btnVoltarMensClick
        end
        object btnContinuarMens: TfcShapeBtn
          Left = 440
          Top = 324
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
          OnClick = btnContinuarMensClick
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Calculo'
        object Bevel3: TBevel
          Left = -119
          Top = 312
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object btnVoltarCalculo: TfcShapeBtn
          Left = 344
          Top = 324
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
          OnClick = btnVoltarCalculoClick
        end
        object btnContinuarCalculo: TfcShapeBtn
          Left = 440
          Top = 324
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
          OnClick = btnContinuarCalculoClick
        end
        object Panel2: TPanel
          Left = 18
          Top = 89
          Width = 265
          Height = 214
          BevelOuter = bvLowered
          TabOrder = 2
          object Label47: TLabel
            Left = 6
            Top = 26
            Width = 119
            Height = 13
            Caption = 'Saldo do Documento'
          end
          object Label9: TLabel
            Left = 13
            Top = 74
            Width = 112
            Height = 13
            Caption = 'Correção Monetária'
          end
          object Label10: TLabel
            Left = 93
            Top = 106
            Width = 32
            Height = 13
            Caption = 'Multa'
          end
          object Label8: TLabel
            Left = 93
            Top = 137
            Width = 31
            Height = 13
            Caption = 'Juros'
          end
          object Label46: TLabel
            Left = 61
            Top = 184
            Width = 63
            Height = 13
            Caption = 'Valor Total'
          end
          object edtVO: TRealEdit
            Left = 141
            Top = 22
            Width = 105
            Height = 21
            TabStop = False
            Alignment = taRightJustify
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
          object edtCM: TRealEdit
            Left = 141
            Top = 70
            Width = 105
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edtMulta: TRealEdit
            Left = 141
            Top = 102
            Width = 105
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
          object edtJuros: TRealEdit
            Left = 141
            Top = 133
            Width = 105
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edtTotal: TRealEdit
            Left = 141
            Top = 180
            Width = 105
            Height = 21
            TabStop = False
            Alignment = taRightJustify
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
        end
        object Panel3: TPanel
          Left = 296
          Top = 89
          Width = 265
          Height = 214
          BevelOuter = bvLowered
          TabOrder = 3
          object Label48: TLabel
            Left = 89
            Top = 26
            Width = 168
            Height = 13
            Caption = 'Alteradores a serem lançados'
          end
          object edCorr: TEdit
            Left = 8
            Top = 69
            Width = 249
            Height = 21
            Color = clMenu
            ReadOnly = True
            TabOrder = 0
            Text = 'edCorr'
          end
          object edMulta: TEdit
            Left = 8
            Top = 102
            Width = 249
            Height = 21
            Color = clMenu
            ReadOnly = True
            TabOrder = 1
            Text = 'edMulta'
          end
          object edJuros: TEdit
            Left = 8
            Top = 133
            Width = 249
            Height = 21
            Color = clMenu
            ReadOnly = True
            TabOrder = 2
            Text = 'edJuros'
          end
        end
        object Panel4: TPanel
          Left = 18
          Top = 8
          Width = 543
          Height = 68
          BevelOuter = bvLowered
          TabOrder = 4
          object Label22: TLabel
            Left = 432
            Top = 12
            Width = 71
            Height = 13
            Caption = 'Ultima Baixa'
          end
          object Label50: TLabel
            Left = 138
            Top = 12
            Width = 63
            Height = 13
            Caption = 'Vlr Original'
          end
          object Label51: TLabel
            Left = 9
            Top = 12
            Width = 67
            Height = 13
            Caption = 'Vencimento'
          end
          object Label52: TLabel
            Left = 242
            Top = 12
            Width = 65
            Height = 13
            Caption = 'Alteradores'
          end
          object Label53: TLabel
            Left = 374
            Top = 12
            Width = 38
            Height = 13
            Caption = 'Baixas'
          end
          object edtVlrOrig: TRealEdit
            Left = 117
            Top = 28
            Width = 84
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Color = clMenu
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
          object edtVlrAlt: TRealEdit
            Left = 223
            Top = 28
            Width = 84
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Color = clMenu
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
          object edtVlrBaixa: TRealEdit
            Left = 328
            Top = 28
            Width = 84
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Color = clMenu
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
          object edtVencto: TCMDateTimePicker
            Left = 8
            Top = 28
            Width = 105
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            Color = clMenu
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
            Enabled = False
            ShowButton = False
            TabOrder = 3
          end
          object edtDtBaixa: TCMDateTimePicker
            Left = 431
            Top = 28
            Width = 105
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            Color = clMenu
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
            Enabled = False
            ShowButton = False
            TabOrder = 4
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Alterador'
        object Label23: TLabel
          Left = 37
          Top = 26
          Width = 151
          Height = 13
          Caption = 'Alteradores do Documento'
        end
        object Bevel5: TBevel
          Left = -119
          Top = 312
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object DBgrdAlteradoresLanc: TwwDBGrid
          Left = 37
          Top = 48
          Width = 507
          Height = 129
          Selected.Strings = (
            'DESCRICAO'#9'18'#9'Tipo do Alterador'
            'HISTORICOCOMPL'#9'27'#9'Histórico'
            'VALOR'#9'10'#9'Valor'
            'DATALANCTO'#9'10'#9'Data')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsAlteradoresLanc
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object btnExcluiAlterador: TBitBtn
          Left = 396
          Top = 184
          Width = 148
          Height = 33
          Caption = 'Excluir Alterador(es)'
          ModalResult = 1
          TabOrder = 2
          OnClick = btnExcluiAlteradorClick
          Glyph.Data = {
            BE060000424DBE06000000000000360400002800000024000000120000000100
            0800000000008802000000000000000000000001000000010000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
            0707070707070707070707070707070707070707070707070707070707070707
            0707F8F80707070707070707070707070707070707FF07070707070707070707
            0707070707F90101F80707070707F9F80707070707070707F8F8FF0707070707
            07FF07070707070707F9010101F8070707F90101F8070707070707F8FF07F8FF
            070707FFF8F8FF070707070707F901010101F807F901010101F80707070707F8
            FF0707F8FF07FFF80707F8FF070707070707F901010101F80101010101F80707
            070707F8FF070707F8FFF807070707F8FF070707070707F90101010101010101
            F807070707070707F8FF070707F807070707FFF80707070707070707F9010101
            010101F8070707070707070707F8FF070707070707FFF8070707070707070707
            070101010101F80707070707070707070707F8FF0707070707F8070707070707
            0707070707F901010101F8070707070707070707070707F8FF070707F8070707
            0707070707070707F90101010101F8070707070707070707070707F807070707
            F8FF070707070707070707F9010101F8010101F807070707070707070707F807
            07070707F8FF0707070707070707F9010101F807F9010101F807070707070707
            07F8070707F8FF0707F8FF07070707070707F90101F8070707F9010101F80707
            07070707F8FF0707F807F8FF0707F8FF07070707070707F9010707070707F901
            0101070707070707F8FFFFF8070707F8FF0707F8FF0707070707070707070707
            070707F901F907070707070707F8F80707070707F8FFFFFFF807070707070707
            07070707070707070707070707070707070707070707070707F8F8F807070707
            0707070707070707070707070707070707070707070707070707070707070707
            0707}
          NumGlyphs = 2
          Spacing = 2
        end
        object btnVoltarAlterador: TfcShapeBtn
          Left = 344
          Top = 324
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
          TabOrder = 3
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnVoltarAlteradorClick
        end
        object bntConfirmar: TfcShapeBtn
          Left = 440
          Top = 324
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
          TabOrder = 4
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = bntConfirmarClick
        end
        object GroupBox3: TGroupBox
          Left = 37
          Top = 221
          Width = 426
          Height = 82
          Caption = 'Descrição do Evento'
          TabOrder = 5
          object Panel5: TPanel
            Left = 2
            Top = 15
            Width = 422
            Height = 65
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 4
            TabOrder = 0
            object memEvento: TMemo
              Left = 4
              Top = 4
              Width = 414
              Height = 57
              Align = alClient
              TabOrder = 0
            end
          end
        end
        object cbDataProgramada: TCheckBox
          Left = 39
          Top = 191
          Width = 265
          Height = 17
          Caption = 'Altera a Data Programada do documento'
          TabOrder = 1
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 396
    Width = 589
    inherited tb97Fundo: TToolbar97
      Left = 417
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      3
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object MS_Parc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CI.CONNUMERO'
      'CI.CONNOME'
      'P.RAZAOSOCIAL'
      'R.NOME'
      'PF.CODDOCUMENTO'
      'PF.NUMPARCELA'
      'PF.DATAVENCIMENTO'
      'PF.VLRPRESTACAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N'
      'N'
      'D'
      'N')
    Descricao.Strings = (
      'Nr. Contrato'
      'Nome do Contrato'
      'Comprador'
      'Responsável'
      'Cod. Documento'
      'Parcela'
      'Vencimento'
      'Valor')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOIMOVEL CI'
      'PESSOA P'
      'PESSOA R'
      'CONDPAGIMOVEL CP'
      'PARCFINANCIMOV PF')
    CamposChave.Strings = (
      'PF.IDPARCFINANCIMOV')
    Filtro.Strings = (
      'CI.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL'
      'CP.IDCONDPAGIMOVEL = PF.IDCONDPAGIMOVEL'
      'PF.FLGLANCINTEGRA = 2'
      'CI.IDLOCATARIO = P.IDPESSOA(+)'
      'CI.IDRESPONSAVEL = R.IDPESSOA(+)'
      'CI.FLGTIPOCONTRATO IN ('#39'C'#39','#39'A'#39')')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      'dd/mm/yyyy'
      '###,##0.00')
    Larguras.Strings = (
      '20'
      '60'
      '60'
      '60'
      '10'
      '10'
      '18'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 145
    Top = 337
  end
  object qryParc: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryParcCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     PF.IDPARCFINANCIMOV,'
      '     PF.IDCONDPAGIMOVEL,'
      '     CP.IDCONTRATOIMOVEL,'
      ''
      '     CI.CONNUMERO,'
      '     CI.CONNOME,'
      '     P.RAZAOSOCIAL  AS COMPRADOR,'
      '     R.NOME         AS RESPONSAVEL,'
      '     IM.NOMEMESTRE,'
      ''
      '     CI.IDCIDADES,'
      '     CI.CODESTADO,'
      '     CI.IDPAIS,'
      ''
      '     D.CODGRUPOCNAB,'
      ''
      
        '     DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || '#39'/'#39' |' +
        '| TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA,'
      
        '     DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENTO)' +
        ' AS DATAVENCIMENTO,'
      ''
      '     PF.VLRPRESTACAO,'
      '     PF.FLGTIPOLANC,'
      '     PF.FLGLANCINTEGRA,'
      '     PF.CODDOCUMENTO,'
      '     PF.DATALANCINTEGRA'
      ''
      'FROM'
      '     PARCFINANCIMOV PF,'
      '     CONDPAGIMOVEL  CP,'
      '     CONTRATOIMOVEL CI,'
      '     PESSOA P,'
      '     PESSOA R,'
      '     DOCUMENTO D,'
      ''
      '     ( SELECT A.IDCONDINICIAL  AS IDCONDINICIAL,'
      '              A.NUMPARCELAS    AS NUMPARCELAS,'
      '              A.DATAINI,'
      '              A.IDCONDPAGIMOVEL'
      '       FROM   CONDPAGIMOVEL A,'
      '              (SELECT   IDCONDINICIAL,'
      '                        MAX(DATAINI) AS DATAINI'
      '               FROM     CONDPAGIMOVEL'
      '               GROUP BY IDCONDINICIAL) B'
      '       WHERE   B.IDCONDINICIAL = A.IDCONDINICIAL'
      '         AND   B.DATAINI       = A.DATAINI ) CPFINAL,'
      ''
      '     ( SELECT DISTINCT'
      '              CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL,'
      '              M.IMONOME   AS NOMEMESTRE'
      '       FROM'
      '              CONTRATOXIMOVEL CXI,'
      '              IMOVEL I,'
      '              IMOVEL M'
      '       WHERE'
      '              CXI.IDIMOVEL = I.IDIMOVEL AND'
      '              I.IDIMOVELMESTRE = M.IDIMOVEL ) IM'
      ''
      'WHERE'
      '         (PF.IDCONDPAGIMOVEL  = CP.IDCONDPAGIMOVEL)'
      '     AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      '     AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL)'
      '     AND (PF.CODDOCUMENTO     = D.CODDOCUMENTO)'
      '     AND (P.IDPESSOA(+) = CI.IDLOCATARIO)'
      '     AND (R.IDPESSOA(+) = CI.IDRESPONSAVEL)'
      '     AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL)'
      '     AND (PF.IDPARCFINANCIMOV = :pIDPARCFINANCIMOV)'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    UpdateObject = updParc
    ValidateWithMask = True
    Left = 227
    Top = 281
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDPARCFINANCIMOV'
        ParamType = ptUnknown
      end>
    object qryParcIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
    end
    object qryParcIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryParcIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryParcCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryParcCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object qryParcCOMPRADOR: TStringField
      FieldName = 'COMPRADOR'
      Size = 60
    end
    object qryParcRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Size = 60
    end
    object qryParcNOMEMESTRE: TStringField
      FieldName = 'NOMEMESTRE'
      Size = 60
    end
    object qryParcNUMPARCELA: TStringField
      FieldName = 'NUMPARCELA'
      Size = 81
    end
    object qryParcDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = 'dd/mm/yyyy'
    end
    object qryParcFLGTIPOLANC: TFloatField
      FieldName = 'FLGTIPOLANC'
    end
    object qryParcFLGLANCINTEGRA: TFloatField
      FieldName = 'FLGLANCINTEGRA'
    end
    object qryParcCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryParcDATALANCINTEGRA: TDateTimeField
      FieldName = 'DATALANCINTEGRA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = 'dd/mm/yyyy'
    end
    object qryParcCAL_TIPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CAL_TIPO'
      Calculated = True
    end
    object qryParcCODGRUPOCNAB: TFloatField
      FieldName = 'CODGRUPOCNAB'
    end
    object qryParcVLRPRESTACAO: TFloatField
      FieldName = 'VLRPRESTACAO'
      DisplayFormat = '###,##0.00'
    end
    object qryParcIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
    end
    object qryParcCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryParcIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
  end
  object dsParc: TwwDataSource
    AutoEdit = False
    DataSet = qryParc
    Left = 251
    Top = 288
  end
  object qryLookMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MOECODIGO, MOEDESC, MOESIGLA,'
      '   MOEPERIODICIDADE, MOEINATIVO,'
      '   FLGPERCVALOR, DATAINICIO, DATAFIM'
      'FROM'
      '   MOEDA'
      'ORDER BY'
      '   MOESIGLA')
    ValidateWithMask = True
    Left = 48
    Top = 336
    object StringField1: TStringField
      DisplayLabel = 'Moeda'
      DisplayWidth = 6
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object FloatField1: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object StringField2: TStringField
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Visible = False
    end
    object qryLookMoedaMOEPERIODICIDADE: TStringField
      FieldName = 'MOEPERIODICIDADE'
      Origin = 'BASEDADOS.MOEDA.MOEPERIODICIDADE'
      FixedChar = True
      Size = 1
    end
    object qryLookMoedaMOEINATIVO: TStringField
      FieldName = 'MOEINATIVO'
      Origin = 'BASEDADOS.MOEDA.MOEINATIVO'
      FixedChar = True
      Size = 1
    end
    object qryLookMoedaFLGPERCVALOR: TStringField
      FieldName = 'FLGPERCVALOR'
      Origin = 'BASEDADOS.MOEDA.FLGPERCVALOR'
      FixedChar = True
      Size = 1
    end
    object qryLookMoedaDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'BASEDADOS.MOEDA.DATAINICIO'
    end
    object qryLookMoedaDATAFIM: TDateTimeField
      FieldName = 'DATAFIM'
      Origin = 'BASEDADOS.MOEDA.DATAFIM'
    end
  end
  object updParc: TUpdateSQL
    ModifySQL.Strings = (
      'update PARCFINANCIMOV'
      'set'
      '  IDPARCFINANCIMOV = :IDPARCFINANCIMOV,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  IDCONDPAGIMOVEL = :IDCONDPAGIMOVEL,'
      '  VLRPRESTACAO = :VLRPRESTACAO,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  NUMPARCELA = :NUMPARCELA,'
      '  FLGTIPOLANC = :FLGTIPOLANC,'
      '  DATALANCINTEGRA = :DATALANCINTEGRA,'
      '  FLGLANCINTEGRA = :FLGLANCINTEGRA,'
      '  IDINDCORRECAO = :IDINDCORRECAO'
      'where'
      '  IDPARCFINANCIMOV = :OLD_IDPARCFINANCIMOV')
    InsertSQL.Strings = (
      'insert into PARCFINANCIMOV'
      
        '  (IDPARCFINANCIMOV, CODDOCUMENTO, IDCONDPAGIMOVEL, VLRPRESTACAO' +
        ', DATAVENCIMENTO, '
      
        '   NUMPARCELA, FLGTIPOLANC, DATALANCINTEGRA, FLGLANCINTEGRA, IDI' +
        'NDCORRECAO)'
      'values'
      
        '  (:IDPARCFINANCIMOV, :CODDOCUMENTO, :IDCONDPAGIMOVEL, :VLRPREST' +
        'ACAO, :DATAVENCIMENTO, '
      
        '   :NUMPARCELA, :FLGTIPOLANC, :DATALANCINTEGRA, :FLGLANCINTEGRA,' +
        ' :IDINDCORRECAO)')
    DeleteSQL.Strings = (
      'delete from PARCFINANCIMOV'
      'where'
      '  IDPARCFINANCIMOV = :OLD_IDPARCFINANCIMOV')
    Left = 251
    Top = 309
  end
  object qryAlteradoresLanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   LD.CODDOCUMENTO, LD.NUMLANCTO,'
      '   LD.CODALTERADOR, LD.PLNCODIGO,'
      '   LD.DATALANCTO, LD.VALOR, LD.VALOROUTRAMOEDA,'
      '   LD.DEBCRE, LD.OPERACAO, LD.HISTORICOCOMPL,'
      '   A.DESCRICAO'
      'FROM'
      '   LANCTODOCUM LD, TIPOALTERADOR A,'
      '   ( SELECT MAX(DATALANCTO) AS ULTBAIXA'
      '       FROM LANCTODOCUM'
      '      WHERE CODDOCUMENTO = :PCODDOCUMENTO'
      '        AND ESTORNO IS NULL '
      '        AND RTRIM(OPERACAO) = '#39'5'#39' ) BX'
      'WHERE'
      '   ( LD.CODDOCUMENTO =:PCODDOCUMENTO )'
      '   AND ( LD.CODALTERADOR = A.CODALTERADOR )'
      '   AND ( RTRIM(LD.OPERACAO) = '#39'4'#39' )'
      '   AND ( LD.ESTORNO IS NULL )'
      '   AND ((BX.ULTBAIXA IS NULL) OR (LD.DATALANCTO > BX.ULTBAIXA))'
      '   AND ( LD.CODALTERADOR = :PALTMULTA OR'
      '         LD.CODALTERADOR = :PALTJUROS OR'
      '         LD.CODALTERADOR = :PALTCORR )'
      ''
      'ORDER BY'
      '   LD.DATALANCTO, A.DESCRICAO'
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 282
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PALTMULTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PALTJUROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PALTCORR'
        ParamType = ptUnknown
      end>
    object qryAlteradoresLancDESCRICAO: TStringField
      DisplayLabel = 'Tipo do Alterador'
      DisplayWidth = 18
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryAlteradoresLancHISTORICOCOMPL: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 27
      FieldName = 'HISTORICOCOMPL'
      Size = 60
    end
    object qryAlteradoresLancVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qryAlteradoresLancDATALANCTO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATALANCTO'
    end
    object qryAlteradoresLancCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object qryAlteradoresLancNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Visible = False
    end
    object qryAlteradoresLancCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Visible = False
    end
    object qryAlteradoresLancPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryAlteradoresLancVALOROUTRAMOEDA: TFloatField
      FieldName = 'VALOROUTRAMOEDA'
      Visible = False
    end
    object qryAlteradoresLancDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Visible = False
      Size = 1
    end
    object qryAlteradoresLancOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Visible = False
      Size = 2
    end
  end
  object dsAlteradoresLanc: TwwDataSource
    DataSet = qryAlteradoresLanc
    Left = 48
    Top = 294
  end
  object qryUpdateMensagensCnab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   MENSAGENSCNAB'
      'SET'
      '   MENSAGEM1 = :PMENSAGEM1,'
      '   MENSAGEM2 = :PMENSAGEM2,'
      '   MENSAGEM3 = :PMENSAGEM3,'
      '   MENSAGEM4 = :PMENSAGEM4,'
      '   MENSAGEM5 = :PMENSAGEM5,'
      '   MENSAGEM6 = :PMENSAGEM6,'
      '   MENSAGEM7 = :PMENSAGEM7,'
      '   MENSAGEM8 = :PMENSAGEM8,'
      '   MENSAGEM9 = :PMENSAGEM9'
      'WHERE'
      '   CODDOCUMENTO = :pCODDOCUMENTO'
      ' ')
    ValidateWithMask = True
    Left = 273
    Top = 333
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PMENSAGEM1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PMENSAGEM2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PMENSAGEM3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PMENSAGEM4'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PMENSAGEM5'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PMENSAGEM6'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PMENSAGEM7'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PMENSAGEM8'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PMENSAGEM9'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pCODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object cdsContratoXMulta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 521
    Top = 25
    object cdsContratoXMultaIDCONTRATOXMULTA: TFloatField
      FieldName = 'IDCONTRATOXMULTA'
    end
    object cdsContratoXMultaIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object cdsContratoXMultaIDINDCORRECAO: TFloatField
      FieldName = 'IDINDCORRECAO'
    end
    object cdsContratoXMultaMOEDAJUROS: TFloatField
      FieldName = 'MOEDAJUROS'
    end
    object cdsContratoXMultaMOEDAMULTA: TFloatField
      FieldName = 'MOEDAMULTA'
    end
    object cdsContratoXMultaFLGINDETERMINADO: TStringField
      FieldName = 'FLGINDETERMINADO'
      FixedChar = True
      Size = 1
    end
    object cdsContratoXMultaVLRMULTA: TFloatField
      FieldName = 'VLRMULTA'
    end
    object cdsContratoXMultaPERCMULTA: TFloatField
      FieldName = 'PERCMULTA'
    end
    object cdsContratoXMultaVLRJUROS: TFloatField
      FieldName = 'VLRJUROS'
    end
    object cdsContratoXMultaPERCJUROS: TFloatField
      FieldName = 'PERCJUROS'
    end
    object cdsContratoXMultaPERIODOJUROS: TStringField
      FieldName = 'PERIODOJUROS'
      FixedChar = True
      Size = 1
    end
    object cdsContratoXMultaFLGJUROSPROPORC: TStringField
      FieldName = 'FLGJUROSPROPORC'
      FixedChar = True
      Size = 1
    end
    object cdsContratoXMultaDATAINI: TDateTimeField
      FieldName = 'DATAINI'
    end
    object cdsContratoXMultaDATAFIM: TDateTimeField
      FieldName = 'DATAFIM'
    end
    object cdsContratoXMultaMESREFCORRECAO: TFloatField
      FieldName = 'MESREFCORRECAO'
    end
    object cdsContratoXMultaDIASTOLERANCIA: TFloatField
      FieldName = 'DIASTOLERANCIA'
    end
    object cdsContratoXMultaDIASREPASSE: TFloatField
      FieldName = 'DIASREPASSE'
    end
    object cdsContratoXMultaFLGTIPODIATOLERA: TStringField
      FieldName = 'FLGTIPODIATOLERA'
      FixedChar = True
      Size = 1
    end
    object cdsContratoXMultaFLGTIPODIAREPASS: TStringField
      FieldName = 'FLGTIPODIAREPASS'
      FixedChar = True
      Size = 1
    end
    object cdsContratoXMultaTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object cdsContratoXMultaTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
  end
  object dsContratoXMulta: TwwDataSource
    DataSet = cdsContratoXMulta
    Left = 521
    Top = 41
  end
end
