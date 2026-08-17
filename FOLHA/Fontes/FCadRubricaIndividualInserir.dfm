inherited frmCadRubricaIndividualInserir: TfrmCadRubricaIndividualInserir
  Left = 64
  Top = 0
  Anchors = []
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Cadastro de Rubrica'
  ClientHeight = 684
  ClientWidth = 1210
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1210
    Height = 645
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 1208
      Height = 62
      Align = alTop
      Caption = 'Assistido'
      TabOrder = 0
      object Label4: TLabel
        Left = 12
        Top = 14
        Width = 45
        Height = 13
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 117
        Top = 14
        Width = 28
        Height = 13
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbMatriculaAssistido: TLabel
        Left = 12
        Top = 30
        Width = 55
        Height = 13
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbNomeAssistido: TLabel
        Left = 117
        Top = 30
        Width = 118
        Height = 13
        Caption = 'Nome do Favorecido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 63
      Width = 1208
      Height = 581
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 1
      object grpRegraPA: TGroupBox
        Left = 1
        Top = 1
        Width = 1206
        Height = 269
        Align = alTop
        Caption = ' Informações para Cálculo '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object lblValorPA: TLabel
          Left = 8
          Top = 58
          Width = 109
          Height = 13
          Caption = 'Valor / Percentual '
        end
        object lblRegraPA: TLabel
          Left = 140
          Top = 58
          Width = 110
          Height = 13
          Caption = 'Regra para Cálculo'
        end
        object Label3: TLabel
          Left = 8
          Top = 14
          Width = 96
          Height = 13
          Caption = 'Tipo de Rubrica:'
        end
        object lblRubOutros: TLabel
          Left = 10
          Top = 185
          Width = 116
          Height = 13
          Caption = 'Rubrica a Processar'
        end
        object sbtnRemRubOutros: TSpeedButton
          Tag = 3
          Left = 576
          Top = 198
          Width = 23
          Height = 22
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
            305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
            005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
            B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
            B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
            B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
            B0557777FF577777F7F500000E055550805577777F7555575755500000555555
            05555777775555557F5555000555555505555577755555557555}
          NumGlyphs = 2
          OnClick = sbtnRemRubOutrosClick
        end
        object Label5: TLabel
          Left = 612
          Top = 185
          Width = 174
          Height = 13
          Caption = 'Rubrica a Processar no Abono'
        end
        object sbtnRemRubAbonoOutros: TSpeedButton
          Tag = 7
          Left = 1241
          Top = 197
          Width = 23
          Height = 22
          Anchors = [akTop, akRight]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
            305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
            005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
            B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
            B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
            B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
            B0557777FF577777F7F500000E055550805577777F7555575755500000555555
            05555777775555557F5555000555555505555577755555557555}
          NumGlyphs = 2
          OnClick = sbtnRemRubAbonoOutrosClick
        end
        object lblRubFavOutros: TLabel
          Left = 9
          Top = 227
          Width = 215
          Height = 13
          Caption = 'Rubrica de Pagamento do Favorecido'
        end
        object sbtnRemRubFavOutros: TSpeedButton
          Tag = 4
          Left = 576
          Top = 241
          Width = 23
          Height = 22
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
            305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
            005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
            B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
            B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
            B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
            B0557777FF577777F7F500000E055550805577777F7555575755500000555555
            05555777775555557F5555000555555505555577755555557555}
          NumGlyphs = 2
          OnClick = sbtnRemRubFavOutrosClick
        end
        object Label6: TLabel
          Left = 612
          Top = 228
          Width = 273
          Height = 13
          Caption = 'Rubrica de Pagamento de Abono ao Favorecido'
        end
        object sbtnRemRubAbonoFavOutros: TSpeedButton
          Tag = 8
          Left = 1242
          Top = 241
          Width = 23
          Height = 22
          Anchors = [akTop, akRight]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
            305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
            005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
            B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
            B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
            B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
            B0557777FF577777F7F500000E055550805577777F7555575755500000555555
            05555777775555557F5555000555555505555577755555557555}
          NumGlyphs = 2
          OnClick = sbtnRemRubAbonoFavOutrosClick
        end
        object Label21: TLabel
          Left = 640
          Top = 58
          Width = 83
          Height = 13
          Caption = 'Plano Contábil'
        end
        object dbreValor: TDBRealEdit
          Left = 8
          Top = 74
          Width = 100
          Height = 20
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00000000')
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 8
          NumberFormat = fNumber
          Signal = False
          DataField = 'VALORRUBRICA'
          DataSource = dsDet
        end
        object dblcRegraPA: TwwDBLookupCombo
          Left = 140
          Top = 74
          Width = 461
          Height = 21
          DropDownAlignment = taRightJustify
          Selected.Strings = (
            'NOMEREGRA'#9'100'#9'Regra'#9'F'
            'IDREGRA'#9'10'#9'Código'#9'F'
            'DESCREGRA'#9'50'#9'Tipo'#9'F')
          DataField = 'IDREGRACALCULO'
          DataSource = dsDet
          LookupTable = qryRegra
          LookupField = 'IDREGRA'
          Options = [loColLines, loRowLines, loTitles]
          DropDownWidth = 320
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnChange = dblcRegraPAChange
          OnExit = dblcRegraPAExit
        end
        object fcsbtnRubXPA: TfcShapeBtn
          Left = 472
          Top = 10
          Width = 121
          Height = 44
          Caption = 'Associa rubricas '#13#10'de exceção'
          Color = clAqua
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          Shape = bsRoundRect
          TabOrder = 2
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
          OnClick = fcsbtnRubXPAClick
        end
        object cbTipoRubrica: TComboBox
          Left = 8
          Top = 33
          Width = 297
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 3
          OnChange = cbTipoRubricaChange
          Items.Strings = (
            ''
            'Pensão alimentícia'
            'Outras rubricas')
        end
        object dbrgrpPermanentePA: TDBRadioGroup
          Left = 9
          Top = 102
          Width = 98
          Height = 76
          Caption = ' Permanente '
          DataField = 'FLGPERMANENTE'
          DataSource = dsDet
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Items.Strings = (
            '  Sim'
            '  Não')
          ParentFont = False
          TabOrder = 4
          TabStop = True
          Values.Strings = (
            '1'
            '0')
          OnChange = dbrgrpPermanentePAChange
          OnClick = dbrgrpPermanentePAClick
        end
        object grpParcelas: TGroupBox
          Left = 139
          Top = 102
          Width = 205
          Height = 77
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          object lblParcelasPA: TLabel
            Left = 27
            Top = 16
            Width = 41
            Height = 13
            Caption = 'Parcelas'
          end
          object lblProcPA: TLabel
            Left = 7
            Top = 35
            Width = 61
            Height = 13
            Caption = 'Processadas'
          end
          object Label1: TLabel
            Left = 14
            Top = 58
            Width = 56
            Height = 13
            Caption = 'Sequêncial '
          end
          object spedParcelas: TwwDBSpinEdit
            Left = 95
            Top = 7
            Width = 61
            Height = 21
            Increment = 1
            DataField = 'PARCELAS'
            DataSource = dsDet
            TabOrder = 0
            UnboundDataType = wwDefault
            OnChange = spedParcelasChange
          end
          object spedNumOcorrenciasPA: TwwDBSpinEdit
            Left = 94
            Top = 30
            Width = 61
            Height = 21
            Increment = 1
            DataField = 'NUMOCORRENCIAS'
            DataSource = dsDet
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object dbeSequencialPA: TDBEdit
            Left = 94
            Top = 53
            Width = 60
            Height = 21
            DataField = 'SEQRUBRICAINDIV'
            DataSource = dsDet
            ReadOnly = True
            TabOrder = 2
          end
        end
        object grpMesReferencia: TGroupBox
          Left = 379
          Top = 103
          Width = 207
          Height = 39
          Caption = ' Mês/Ano de Referência '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          object cmb_mesref: TComboBox
            Left = 12
            Top = 12
            Width = 104
            Height = 19
            Style = csOwnerDrawFixed
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
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
              'Dezembro'
              'Abono Anual')
          end
          object spn_anoref: TSpinEdit
            Left = 119
            Top = 12
            Width = 63
            Height = 22
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 4
            MaxValue = 0
            MinValue = 0
            ParentFont = False
            TabOrder = 1
            Value = 0
          end
        end
        object grpPeriodoPA: TGroupBox
          Left = 615
          Top = 103
          Width = 580
          Height = 77
          Caption = ' Processamento '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          object lblDePA: TLabel
            Left = 9
            Top = 21
            Width = 14
            Height = 13
            Caption = 'De'
          end
          object lblAte: TLabel
            Left = 6
            Top = 46
            Width = 16
            Height = 13
            Caption = 'Até'
          end
          object lblUltMesPA: TLabel
            Left = 186
            Top = 15
            Width = 56
            Height = 26
            Alignment = taRightJustify
            Caption = 'Último Mês Processado'
            WordWrap = True
          end
          object dbdtInicio: TCMDateTimePicker
            Left = 31
            Top = 17
            Width = 97
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAINICIO'
            DataSource = dsDet
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
            OnChange = dbdtInicioChange
            OnExit = dbdtInicioChange
          end
          object dbdtFinal: TCMDateTimePicker
            Left = 31
            Top = 42
            Width = 98
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAFINAL'
            DataSource = dsDet
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
            UnboundDataType = wwDTEdtDate
            OnExit = dbdtFinalExit
          end
          object fcsbtnEstado: TfcShapeBtn
            Left = 417
            Top = 15
            Width = 119
            Height = 26
            Caption = 'SUSPENSA'
            Color = clRed
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            Shape = bsRoundRect
            TabOrder = 2
            TextOptions.Alignment = taCenter
            TextOptions.VAlignment = vaVCenter
            OnClick = fcsbtnEstadoClick
          end
          object dbUltmesProcPalim: TDBEdit
            Left = 252
            Top = 17
            Width = 89
            Height = 21
            DataField = 'ULTMESPREPARO'
            DataSource = dsDet
            ReadOnly = True
            TabOrder = 3
          end
        end
        object dblcRubricaProcesssarAbono: TwwDBLookupCombo
          Left = 612
          Top = 199
          Width = 624
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F')
          DataField = 'IDRUBRICA13'
          DataSource = dsDet
          LookupTable = qryRubProcessarAbono
          LookupField = 'IDPROVENTO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 10
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnChange = dblcRubricaProcesssarAbonoChange
          OnExit = dblcRubricaProcesssarAbonoExit
        end
        object dblcRubricaFavPA: TwwDBLookupCombo
          Left = 10
          Top = 244
          Width = 564
          Height = 21
          Cursor = crDrag
          AutoSize = False
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F')
          DataField = 'RUBRICAPROVENTOPA'
          DataSource = dsDet
          LookupTable = qryRubPagFavorecido
          LookupField = 'IDPROVENTO'
          Options = [loTitles]
          TabOrder = 9
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dblcRubricaFavAbonoPA: TwwDBLookupCombo
          Left = 615
          Top = 243
          Width = 621
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F')
          DataField = 'IDRUBRICAPROVENTO13'
          DataSource = dsDet
          LookupTable = qryRubPagAbono
          LookupField = 'IDPROVENTO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 11
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object gbxControlaSaldo: TGroupBox
          Left = 970
          Top = 7
          Width = 233
          Height = 82
          TabOrder = 12
          object Label10: TLabel
            Left = 38
            Top = 33
            Width = 71
            Height = 13
            Caption = 'Saldo Inicial'
          end
          object Label11: TLabel
            Left = 13
            Top = 57
            Width = 98
            Height = 13
            Caption = 'Saldo acumulado'
          end
          object dbcboxControlaSaldo: TDBCheckBox
            Left = 7
            Top = 9
            Width = 130
            Height = 17
            Caption = 'Controla Saldo'
            DataField = 'FLGCONTROLASALDO'
            DataSource = dsDet
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = dbcboxControlaSaldoClick
          end
          object dbredSaldoInicial: TDBRealEdit
            Left = 114
            Top = 29
            Width = 100
            Height = 20
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '0,00')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRSALDOINICIAL'
            DataSource = dsDet
          end
          object dbredSaldoAcumulado: TDBRealEdit
            Left = 114
            Top = 53
            Width = 100
            Height = 20
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '0,00')
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRTOTALPROC'
            DataSource = dsDet
          end
        end
        object grpMesCompetencia: TGroupBox
          Left = 379
          Top = 141
          Width = 207
          Height = 39
          Caption = 'Mês/Ano de Reembolso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          Visible = False
          object cmb_mesComp: TComboBox
            Left = 12
            Top = 13
            Width = 104
            Height = 19
            Style = csOwnerDrawFixed
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
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
              'Dezembro'
              'Abono Anual')
          end
          object spn_anoComp: TSpinEdit
            Left = 119
            Top = 12
            Width = 63
            Height = 22
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 4
            MaxValue = 0
            MinValue = 0
            ParentFont = False
            TabOrder = 1
            Value = 0
          end
        end
        object dblcRubricaDesconto: TwwDBLookupCombo
          Left = 9
          Top = 202
          Width = 564
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição'#9'F')
          DataField = 'IDRUBRICA'
          DataSource = dsDet
          LookupTable = qryRubProcessar
          LookupField = 'IDPROVENTO'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 8
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnChange = dblcRubricaDescontoChange
          OnCloseUp = dblcRubricaDescontoCloseUp
          OnExit = dblcRubricaDescontoExit
        end
        object fcsbtnObservacoes: TfcShapeBtn
          Left = 600
          Top = 10
          Width = 121
          Height = 44
          Caption = 'Observações'
          Color = clAqua
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          NumGlyphs = 0
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          Shape = bsRoundRect
          TabOrder = 14
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
          OnClick = fcsbtnObservacoesClick
        end
        object cbxPLANOCONTABIL: TwwDBLookupCombo
          Left = 644
          Top = 74
          Width = 305
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'50'#9'NOME'#9'F')
          DataField = 'IDPLANOCONTABIL'
          DataSource = dsDet
          LookupTable = qryPlanoContabil
          LookupField = 'IDPLANOPREV'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 15
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
      end
      object gbOpocesOutras: TGroupBox
        Left = 1
        Top = 270
        Width = 1206
        Height = 127
        Align = alTop
        TabOrder = 1
        object lblSituacaoaJ: TLabel
          Left = 1189
          Top = 9
          Width = 149
          Height = 13
          Caption = 'Situação da Ação Judicial'
          Visible = False
        end
        object lblobservacao: TLabel
          Left = 369
          Top = 51
          Width = 75
          Height = 13
          Caption = 'Observações'
          Visible = False
        end
        object lblAcaoJud: TLabel
          Left = 369
          Top = 9
          Width = 77
          Height = 13
          Caption = 'Ação Judicial'
        end
        object sbtnAcaoJud: TSpeedButton
          Tag = 3
          Left = 935
          Top = 24
          Width = 23
          Height = 22
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
            305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
            005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
            B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
            B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
            B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
            B0557777FF577777F7F500000E055550805577777F7555575755500000555555
            05555777775555557F5555000555555505555577755555557555}
          NumGlyphs = 2
          OnClick = sbtnAcaoJudClick
        end
        object dbcboxUtilizadaAbono: TDBCheckBox
          Left = 4
          Top = 8
          Width = 253
          Height = 17
          Caption = 'Utilizada no Abono Anual'
          DataField = 'FLGUSAABONO'
          DataSource = dsDet
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbcboxUtilizadaAtencipAbonoFUNFEC: TDBCheckBox
          Left = 4
          Top = 57
          Width = 269
          Height = 17
          Caption = 'Utilizada na Antecipação de Abono FUNCEF'
          DataField = 'FLGANTECIPABONO'
          DataSource = dsDet
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbcboxUtilizadaAtencipAbonoINSS: TDBCheckBox
          Left = 4
          Top = 33
          Width = 269
          Height = 17
          Caption = 'Utilizada na Antecipação de Abono INSS'
          DataField = 'FLGANTECIPAABONOINSS'
          DataSource = dsDet
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object cboSituacaoAJ: TComboBox
          Left = 1191
          Top = 26
          Width = 148
          Height = 19
          Style = csOwnerDrawFixed
          ItemHeight = 13
          TabOrder = 5
          Visible = False
          OnChange = cboSituacaoAJChange
          Items.Strings = (
            ''
            'Em Liminar'
            'Ganha'
            'Perdida')
        end
        object mmobservacao: TMemo
          Left = 368
          Top = 64
          Width = 898
          Height = 58
          Anchors = [akLeft, akRight, akBottom]
          ScrollBars = ssVertical
          TabOrder = 6
          Visible = False
          OnChange = mmobservacaoChange
        end
        object dbcboxRubricaResgate: TDBCheckBox
          Left = 5
          Top = 82
          Width = 269
          Height = 17
          Caption = 'Rubrica de Resgate'
          DataField = 'FLGRUBRICARESGATE'
          DataSource = dsDet
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dblcAcaoJud: TwwDBLookupCombo
          Left = 368
          Top = 28
          Width = 564
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NUMEROPROCESSO'#9'30'#9'Número do Processo'#9'F'
            'DATAINICIO'#9'10'#9'Início'#9'F'
            'DATAFINAL'#9'10'#9'Término'#9'F'
            'SITUACAO'#9'20'#9'Situação'#9'F')
          DataField = 'IDPROCJUD'
          DataSource = dsDet
          LookupTable = qryAcaoJud
          LookupField = 'IDPROCJUD'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnChange = dblcAcaoJudChange
          OnCloseUp = dblcAcaoJudCloseUp
          OnExit = dblcAcaoJudExit
        end
        object dbcboxTemAcao: TDBCheckBox
          Left = 4
          Top = 106
          Width = 269
          Height = 17
          Caption = 'Possui Ação Judicial'
          DataField = 'FLGPOSSUIACJUD'
          DataSource = dsDet
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object gbOpocesPA: TGroupBox
        Left = 1
        Top = 397
        Width = 1206
        Height = 64
        Align = alTop
        TabOrder = 2
        object lblNumProcInss: TLabel
          Left = 947
          Top = 15
          Width = 97
          Height = 13
          Caption = 'Num. Proc. INSS'
          Enabled = False
        end
        object dbchkBasePA: TDBCheckBox
          Left = 6
          Top = 9
          Width = 244
          Height = 17
          Caption = 'Forma base de cálculo de outras PA'#39's'
          DataField = 'FLGBASEPA'
          DataSource = dsDet
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbchkAbonoPA: TDBCheckBox
          Left = 6
          Top = 39
          Width = 193
          Height = 17
          Caption = 'Utilizada no Abono Anual'
          DataField = 'FLGUSAABONO'
          DataSource = dsDet
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbchkAntecipAbonoPA: TDBCheckBox
          Left = 619
          Top = 39
          Width = 283
          Height = 17
          Caption = 'Utilizada na Antecipação de Abono FUNCEF'
          DataField = 'FLGANTECIPABONO'
          DataSource = dsDet
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object cbAntecipaAbonoINSS: TDBCheckBox
          Left = 619
          Top = 11
          Width = 307
          Height = 17
          Caption = 'Utilizada na Antecipação de Abono INSS'
          DataField = 'FLGANTECIPAABONOINSS'
          DataSource = dsDet
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbcboxCPMF: TDBCheckBox
          Left = 283
          Top = 39
          Width = 244
          Height = 17
          Caption = 'Calcular CPMF quando possui IR Total'
          DataField = 'FLGCALCULACPMF'
          DataSource = dsDet
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbcboxRetroagePA: TDBCheckBox
          Left = 283
          Top = 9
          Width = 306
          Height = 17
          Hint = 
            'Marque para considerar os valores retroativos referentes a meses' +
            ' anteriores à data início da PA'
          Caption = 'Considera valores antes da data início da PA'
          DataField = 'FLGRETROACAO'
          DataSource = dsDet
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbedtNumProcInss: TDBEdit
          Left = 1052
          Top = 11
          Width = 142
          Height = 21
          DataField = 'NUMPROCINSS'
          DataSource = dsDet
          Enabled = False
          TabOrder = 6
        end
      end
      object gbxFavorecido: TGroupBox
        Left = 1
        Top = 461
        Width = 1206
        Height = 136
        Align = alTop
        Caption = 'Informações do Favorecido'
        TabOrder = 3
        object lblCPFOutros: TLabel
          Left = 12
          Top = 14
          Width = 52
          Height = 13
          Caption = 'CPF/CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblNomeFavOutros: TLabel
          Left = 115
          Top = 14
          Width = 99
          Height = 13
          Caption = 'Nome do Favorecido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbDocumentoFavorecido: TLabel
          Left = 10
          Top = 30
          Width = 69
          Height = 13
          Caption = 'CPF / CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbNomeFavorecido: TLabel
          Left = 117
          Top = 30
          Width = 118
          Height = 13
          Caption = 'Nome do Favorecido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPortFormaOutros: TLabel
          Left = 10
          Top = 90
          Width = 325
          Height = 18
          AutoSize = False
          Caption = 'Contas/Caixas x Forma de Pagto (em branco se arquivo eletrônico)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object sbtnAddFav: TSpeedButton
          Left = 893
          Top = 19
          Width = 23
          Height = 23
          Anchors = [akTop, akRight]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333333333333333333333333333333333333333333333FF333333333333
            3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
            E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
            E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
            E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
            000033333373FF77777733333330003333333333333777333333333333333333
            3333333333333333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
          OnClick = sbtnAddFavClick
        end
        object sbtnRemFav: TSpeedButton
          Left = 917
          Top = 19
          Width = 22
          Height = 22
          Anchors = [akTop, akRight]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
            305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
            005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
            B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
            B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
            B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
            B0557777FF577777F7F500000E055550805577777F7555575755500000555555
            05555777775555557F5555000555555505555577755555557555}
          NumGlyphs = 2
          OnClick = sbtnRemFavClick
        end
        object Label45: TLabel
          Left = 10
          Top = 50
          Width = 145
          Height = 13
          Caption = 'Relação de Dependência'
        end
        object lblDesc_RelacaoDepen: TLabel
          Left = 414
          Top = 50
          Width = 212
          Height = 13
          Caption = 'Informar a descrição da dependência'
          Visible = False
        end
        object btnAlimentados: TButton
          Left = 608
          Top = 98
          Width = 647
          Height = 31
          Anchors = [akLeft, akRight, akBottom]
          Caption = 'Alimentados vinculados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnAlimentadosClick
        end
        object dblkupPortFormaPA: TwwDBLookupCombo
          Left = 12
          Top = 107
          Width = 590
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO2'#9'60'#9'Descrição'#9'F')
          DataField = 'CODPORTFORMA'
          DataSource = dsDet
          LookupTable = qryPortadorforma
          LookupField = 'CODPORTFORMA'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DBGrauParentesco: TwwDBComboBox
          Left = 12
          Top = 67
          Width = 392
          Height = 21
          ShowButton = True
          Style = csOwnerDrawVariable
          MapList = True
          AllowClearKey = False
          DataField = 'RELACAODEPEN'
          DataSource = dsDet
          DropDownCount = 9
          ItemHeight = 0
          Items.Strings = (
            '01 - Cônjuge'#9'01'
            
              '02 - Companheiro(a) com o(a) qual tenha filho ou viva há mais de' +
              ' 5 (cinco) '#13#10'anos ou possua declaração de união estável'#9'02'
            '03 - Filho(a) ou enteado(a)'#9'03'
            
              '06 - Irmão(ã), neto(a) ou bisneto(a) sem arrimo dos pais, do(a) ' +
              'qual detenha a '#13#10'guarda judicial'#9'06'
            '09 - Pais, avós e bisavós'#9'09'
            '10 - Menor pobre do qual detenha a guarda judicial'#9'10'
            
              '11 - A pessoa absolutamente incapaz, da qual seja tutor ou curad' +
              'or'#9'11'
            '12 - Ex-cônjuge'#9'12'
            '99 - Agregado/Outros'#9'99')
          Sorted = False
          TabOrder = 2
          UnboundDataType = wwDefault
          OnChange = DBGrauParentescoChange
        end
        object dbedtDesc_RelacaoDepen: TDBEdit
          Left = 414
          Top = 67
          Width = 232
          Height = 21
          DataField = 'DESC_RELACAODEPEN'
          DataSource = dsDet
          MaxLength = 30
          TabOrder = 3
          Visible = False
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 645
    Width = 1210
    inherited tb97Fundo: TToolbar97
      Left = 368
      DockPos = 368
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 166
      end
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 81
        Width = 85
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 371
    Top = 451
    TargetsData = (
      1
      3
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'Filter'
        0))
  end
  object dsDet: TwwDataSource
    AutoEdit = False
    DataSet = qryDet
    OnDataChange = dsDetDataChange
    Left = 332
    Top = 13
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBRICAINDIV'
      'set'
      '  FLGUSAABONO = :FLGUSAABONO,'
      '  FLGANTECIPABONO = :FLGANTECIPABONO,'
      '  IDTITULAR = :IDTITULAR,'
      '  DATAINICIO = :DATAINICIO,'
      '  FLGBASEPA = :FLGBASEPA,'
      '  FLGANTECIPAABONOINSS = :FLGANTECIPAABONOINSS,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  NUMOCORRENCIAS = :NUMOCORRENCIAS,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  SEQRUBRICAINDIV = :SEQRUBRICAINDIV,'
      '  IDFAVORECIDO = :IDFAVORECIDO,'
      '  IDREGRACALCULO = :IDREGRACALCULO,'
      '  VALORRUBRICA = :VALORRUBRICA,'
      '  ANOMESINICIO = :ANOMESINICIO,'
      '  FLGPERMANENTE = :FLGPERMANENTE,'
      '  PARCELAS = :PARCELAS,'
      '  FLGPERCENT = :FLGPERCENT,'
      '  FLGTPRUBMANUT = :FLGTPRUBMANUT,'
      '  FLGPENSAOALIM = :FLGPENSAOALIM,'
      '  RUBRICAPROVENTOPA = :RUBRICAPROVENTOPA,'
      '  DATAFINAL = :DATAFINAL,'
      '  ANOMESREF = :ANOMESREF,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  FLGDESATIVADO = :FLGDESATIVADO,'
      '  FLGUSADO = :FLGUSADO,'
      '  FLGCALCULACPMF = :FLGCALCULACPMF,'
      '  NUMPROCINSS = :NUMPROCINSS,'
      '  FLGRETROACAO = :FLGRETROACAO,'
      '  IDRUBRICA13 = :IDRUBRICA13,'
      '  IDRUBRICAPROVENTO13 = :IDRUBRICAPROVENTO13,'
      '  IDSEQINTERNOFB = :IDSEQINTERNOFB,'
      '  FLGCONTROLASALDO = :FLGCONTROLASALDO,'
      '  FLGRUBRICARESGATE = :FLGRUBRICARESGATE,'
      '  VLRSALDOINICIAL = :VLRSALDOINICIAL,'
      '  VLRTOTALPROC = :VLRTOTALPROC,'
      '  MESCOMPREEM = :MESCOMPREEM,'
      '  SITUACAOAJ  = :SITUACAOAJ,'
      '  OBSERVACAO  = :OBSERVACAO,'
      '  ULTMESPREPARO = :ULTMESPREPARO,'
      '  IDPLANOCONTABIL = :IDPLANOCONTABIL,'
      '  RELACAODEPEN =  :RELACAODEPEN,'
      '  IDPROCJUD = :IDPROCJUD,'
      '  FLGPOSSUIACJUD = :FLGPOSSUIACJUD,'
      '  DESC_RELACAODEPEN = :DESC_RELACAODEPEN '
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  SEQRUBRICAINDIV = :OLD_SEQRUBRICAINDIV'
      ' ')
    InsertSQL.Strings = (
      'insert into RUBRICAINDIV'
      
        '  (FLGUSAABONO, FLGANTECIPABONO, IDTITULAR, DATAINICIO, FLGBASEP' +
        'A, FLGANTECIPAABONOINSS,'
      
        '   IDPESSOA, IDEMPRESA, NUMOCORRENCIAS, IDRUBRICA, SEQRUBRICAIND' +
        'IV, IDFAVORECIDO,'
      
        '   IDREGRACALCULO, VALORRUBRICA, ANOMESINICIO, FLGPERMANENTE, PA' +
        'RCELAS,'
      
        '   FLGPERCENT, FLGTPRUBMANUT, FLGPENSAOALIM, RUBRICAPROVENTOPA, ' +
        'DATAFINAL,'
      
        '   ANOMESREF, CODPORTFORMA, FLGDESATIVADO, FLGUSADO, FLGCALCULAC' +
        'PMF, NUMPROCINSS,'
      
        '   FLGRETROACAO, IDRUBRICA13, IDRUBRICAPROVENTO13, IDSEQINTERNOF' +
        'B,'
      
        '   FLGCONTROLASALDO, FLGRUBRICARESGATE, VLRSALDOINICIAL, VLRTOTA' +
        'LPROC, MESCOMPREEM,'
      
        '   SITUACAOAJ,OBSERVACAO, IDPLANOCONTABIL, RELACAODEPEN, IDPROCJ' +
        'UD, FLGPOSSUIACJUD,'
      '  DESC_RELACAODEPEN'
      ')'
      'values'
      
        '  (:FLGUSAABONO, :FLGANTECIPABONO, :IDTITULAR, :DATAINICIO, :FLG' +
        'BASEPA,'
      
        '   :FLGANTECIPAABONOINSS, :IDPESSOA, :IDEMPRESA, :NUMOCORRENCIAS' +
        ', :IDRUBRICA,'
      
        '   :SEQRUBRICAINDIV, :IDFAVORECIDO, :IDREGRACALCULO, :VALORRUBRI' +
        'CA, :ANOMESINICIO,'
      
        '   :FLGPERMANENTE, :PARCELAS, :FLGPERCENT, :FLGTPRUBMANUT, :FLGP' +
        'ENSAOALIM,'
      
        '   :RUBRICAPROVENTOPA, :DATAFINAL, :ANOMESREF, :CODPORTFORMA, :F' +
        'LGDESATIVADO,'
      
        '   :FLGUSADO, :FLGCALCULACPMF, :NUMPROCINSS, :FLGRETROACAO, :IDR' +
        'UBRICA13,'
      '   :IDRUBRICAPROVENTO13, :IDSEQINTERNOFB,'
      
        '   :FLGCONTROLASALDO, :FLGRUBRICARESGATE, :VLRSALDOINICIAL, :VLR' +
        'TOTALPROC, :MESCOMPREEM,'
      
        '   :SITUACAOAJ,:OBSERVACAO,:IDPLANOCONTABIL, :RELACAODEPEN, :IDP' +
        'ROCJUD, :FLGPOSSUIACJUD,'
      '   :DESC_RELACAODEPEN'
      ')'
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from RUBRICAINDIV'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  SEQRUBRICAINDIV = :OLD_SEQRUBRICAINDIV')
    Left = 376
    Top = 15
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    ObjectView = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT   PD.DESCPARCIAL'
      '       , PD.FLGDESCONTO'
      '       , PD.FLGINSS'
      '       , PD.FLGIRRF'
      '       , PD.PRAZO'
      '       , R.FLGUSAABONO'
      '       , R.FLGANTECIPABONO'
      '       , R.IDALIMENTADO'
      '       , R.IDTITULAR'
      '       , R.DATAINICIO'
      '       , R.FLGBASEPA'
      '       , R.FLGANTECIPAABONOINSS'
      '       , R.IDPESSOA'
      '       , R.IDEMPRESA'
      '       , R.NUMOCORRENCIAS'
      '       , PD.CODPROVDESC AS IDMOSTRARUB'
      '       , PD.IDPROVENTO AS IDRUBRICA'
      '       , R.SEQRUBRICAINDIV'
      '       , R.IDFAVORECIDO'
      '       , R.IDREGRACALCULO'
      '       , R.VALORRUBRICA'
      '       , R.ANOMESINICIO'
      '       , R.FLGPERMANENTE'
      '       , R.PARCELAS'
      '       , R.FLGPERCENT'
      '       , R.FLGTPRUBMANUT'
      '       , R.FLGPENSAOALIM'
      '       , R.RUBRICAPROVENTOPA'
      '       , R.DATAFINAL'
      '       , PD1.CODPROVDESC AS IDMOSTRARUB1'
      '       , R.ANOMESREF'
      '       , R.CODPORTFORMA'
      '       , P.NUMDOCUMENTO AS CPFFAVORECIDO'
      '       , P.NOME AS FAVORECIDO'
      '       , PD.DESCRPROVDESC AS DESCRICAO'
      '       , ALIM.NUMDOCUMENTO AS CPFALIMENTADO'
      '       , ALIM.NOME AS ALIMENTADO'
      '       , R.FLGDESATIVADO'
      '       , R.FLGUSADO'
      '       , R.FLGCALCULACPMF'
      '       , R.ULTMESPREPARO'
      '       , PD1.DESCRPROVDESC AS DESCRICAO'
      '       , RG.NOMEREGRA'
      '       , R.FLGCALCULACPMF'
      '       , R.TRGDTINCLUSAO'
      '       , R.TRGUSERINCLUSAO'
      '       , R.NUMPROCINSS'
      '       , R.SITUACAOAJ'
      '       , R.OBSERVACAO'
      '       , R.FLGRETROACAO'
      '       , '#39' '#39' AS NOME'
      '       , R.IDRUBRICA13'
      '       , R.IDRUBRICAPROVENTO13'
      '       , R.IDSEQINTERNOFB'
      '  ,R.FLGCONTROLASALDO'
      '  ,R.FLGRUBRICARESGATE'
      '  ,R.VLRSALDOINICIAL'
      '  ,R.IDPLANOCONTABIL'
      '  ,R.VLRTOTALPROC '
      '  ,PP.NOME AS PLANOCONTABIL'
      '  ,R.RELACAODEPEN'
      '  ,PD.FLGNAOPAGAFAVOREC'
      '  ,R.FLGPOSSUIACJUD'
      ',R.DESC_RELACAODEPEN'
      '    FROM PROVDESC PD,'
      '         PESSOA P,'
      '         PESSOA ALIM,'
      '         PROVDESC PD1,'
      '         REGRA RG,'
      '         PLANPREVCONTABIL PP,'
      '         RUBRICAINDIV R'
      '   WHERE R.IDTITULAR = :IDTITULAR'
      '     AND R.IDPESSOA = :IDPESSOA'
      '     AND R.FLGPENSAOALIM = 1'
      '     AND R.IDEMPRESA = :IDEMPRESA'
      '     AND R.FLGTPRUBMANUT = '#39#39'1'#39#39
      '     AND PD.IDPROVENTO = R.IDRUBRICA'
      '     AND R.IDFAVORECIDO = P.IDPESSOA(+)'
      '     AND R.IDALIMENTADO = ALIM.IDPESSOA(+)'
      '     AND R.RUBRICAPROVENTOPA = PD1.IDPROVENTO(+)'
      '     AND R.IDREGRACALCULO = RG.IDREGRA(+)'
      '     AND R.IDRUBRICA  = : IDRUBRICA'
      '    AND R.SEQRUBRICAINDIV = : SEQRUBRICAINDIV '
      '    AND R.IDPLANOCONTABIL = PP.IDPLANOPREV(+)'
      '    ORDER BY SEQRUBRICAINDIV'
      ' '
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGBASEPA;CheckBox;1;0'
      'FLGUSAABONO;CheckBox;1;0'
      'FLGANTECIPABONO;CheckBox;1;0'
      'FLGPERMANENTE;CheckBox;1;0'
      'FLGDESATIVADO;CheckBox;1;0'
      'FLGUSADO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 288
    Top = 15
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        ParamType = ptUnknown
      end>
  end
  object qryPortadorforma: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODPORTFORMA'
      '     , DESCRICAO'
      '     , CODPORTFORMA || '#39' - '#39' || DESCRICAO AS DESCRICAO2'
      'FROM PORTADORFORMA '
      'WHERE RECPAG = '#39'P'#39
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 443
    Top = 14
  end
  object qryRegra: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.IDREGRA, R.NOMEREGRA, T.DESCREGRA, R.IDTIPOREGRA'
      'FROM REGRA R, TIPOREGRA T'
      'WHERE R.IDTIPOREGRA = T.IDTIPOREGRA'
      'ORDER BY UPPER(R.NOMEREGRA)'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 530
    Top = 14
  end
  object MontaSelectFAV: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Favorecido'
    Colunas.Strings = (
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'CPF/CNPJ Favorecido'
      'Nome do Favorecido')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FORNSERV'
      'EMPRESAFORN')
    CamposChave.Strings = (
      'FORNSERV.IDPESSOA'
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = FORNSERV.IDPESSOA'
      '(PESSOA.IDPESSOA = EMPRESAFORN.IDFORCLI)'
      '(EMPRESAFORN.IDPESSOA = 1)')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 445
    Top = 75
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 582
    Top = 14
  end
  object qryRubProcessar: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO,'
      '       FLGDESCONTO,'
      '       FLGOBRIGAFAVOREC,'
      '       FLGNAOPAGAFAVOREC,'
      '       IDPROVENTO||'#39' - '#39'||DESCRICAO AS DESCRICAO'
      'FROM PROVDESC PD'
      'WHERE FLGDESCONTO = 0'
      'AND FLGTPRUBRICA LIKE '#39'%B%'#39
      'ORDER BY IDPROVENTO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 861
    Top = 10
  end
  object qryRubPagFavorecido: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO,'
      '       FLGDESCONTO,'
      '       FLGOBRIGAFAVOREC,'
      '       IDPROVENTO||'#39' - '#39'||DESCRICAO AS DESCRICAO'
      'FROM PROVDESC PD'
      'WHERE FLGDESCONTO = 0'
      'AND FLGTPRUBRICA LIKE '#39'%B%'#39
      'ORDER BY IDPROVENTO'
      ' ')
    ValidateWithMask = True
    Left = 741
    Top = 7
  end
  object qryRubProcessarAbono: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO,'
      '       FLGDESCONTO,'
      '       FLGOBRIGAFAVOREC,'
      '       IDPROVENTO||'#39' - '#39'||DESCRICAO AS DESCRICAO'
      'FROM PROVDESC PD'
      'WHERE FLGDESCONTO = 0'
      'AND FLGTPRUBRICA LIKE '#39'%B%'#39
      'ORDER BY IDPROVENTO'
      ' ')
    ValidateWithMask = True
    Left = 980
    Top = 14
  end
  object qryRubPagAbono: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROVENTO,'
      '       FLGDESCONTO,'
      '       FLGOBRIGAFAVOREC,'
      '       IDPROVENTO||'#39' - '#39'||DESCRICAO AS DESCRICAO'
      'FROM PROVDESC PD'
      'WHERE FLGDESCONTO = 0'
      'AND FLGTPRUBRICA LIKE '#39'%B%'#39
      'ORDER BY IDPROVENTO'
      ' ')
    ValidateWithMask = True
    Left = 1115
    Top = 15
  end
  object wwQuery1: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      
        'SELECT  0 AS SELECIONA, NUMRECEBIMENTO,     M.IDMOTIVO,         ' +
        'H.MESREFERENCIA,    H.MESCOBRANCA,'
      
        '       H.IDPESSJUR,          H.IDPLANOPREV,      H.IDPESSOA,    ' +
        '     H.IDCONTRIBUICAO,'
      
        '       H.SEQPROPOSTA,        H.FLGDEVOLUCAO,     H.FLGDIVERGENTE' +
        ',    H.FLGCONCESSAO,'
      
        '       H.FLGEVENTO,          H.FLGCALCRESERVA,   H.FLGDESCFOLHA,' +
        '     H.FLGSITFUNDACAO,'
      
        '       H.FLGAPORTE,          H.VALORESPERADO,    H.VALORRECEBIDO' +
        ',    H.VALORCALCULADO,'
      
        '       H.DATAPREVISAORECE,   H.DATARECEBIMENTO,  H.DATAINICIO,  ' +
        '     H.DATAFINAL,'
      
        '       H.IDREGRACALCULO,     H.SITRECEBIMENTO,   H.TIPO,        ' +
        '     H.VALOROP1,'
      '       H.VALOROP2,           H.VALOROP3,         H.IDLOTE,'
      
        '       DECODE(VALORPARARESERVA, NULL, VALORRECEBIDO, VALORPARARE' +
        'SERVA) AS VALORPARARESERVA,'
      
        '       M.DESCRICAO, H.FLGMANUAL, H.CODDOCUMENTOPREV, H.FOLHAORIG' +
        'EM,'
      
        '       0 AS FLGALTERADO, H.CODPORTFORMA,H.IDTIPORECURSO,H.ORIGEM' +
        'RECURSO,T.NOME AS NOMETIPORECURSO, H.IDTITULAR,'
      
        '       (select anodirf from cm.CONTRIBUICAOXANOBASEXPESSOA CAP w' +
        'here CAP.NUMRECEBIMENTO = H.NUMRECEBIMENTO AND ROWNUM = 1) anodi' +
        'rf,'
      '       DECODE(H.PLNCODIGO,NULL,0,1) CONTABILIZA,'
      '       H.FLGIMPORTADO, H.DATAEMISSCOB, H.IDPLANPREVCONTAB,'
      ''
      
        '      (SELECT DECODE(H.IDPLANPREVCONTAB,2,'#39'REG/REPLAN'#39',74,'#39'NOVO ' +
        'PLANO'#39',PN.NOME) AS NOME'
      
        '      from PLANPREVCONTABIL PN WHERE ( H.IDPLANPREVCONTAB= PN.ID' +
        'PLANOPREV))as NomePlano'
      ''
      
        '     --  (SELECT DECODE(CO.IDPLANPREVCONTAB,2,'#39'REG/REPLAN'#39',74,'#39'N' +
        'OVO PLANO'#39',PN.NOME) AS NOME'
      
        '      -- from PLANPREVCONTABIL PN WHERE ( CO.IDPLANPREVCONTAB= P' +
        'N.IDPLANOPREV))as NomePlano'
      ''
      ''
      'FROM   HSTCONTRIBPREV H, MOTIVO M,CM.TIPORECURSO T'
      ''
      'WHERE  (H.IDPESSJUR      = :IDPESSJUR)'
      'AND    (H.IDPLANOPREV    = :IDPLANOPREV)'
      'AND    (H.IDPESSOA       = :IDPESSOA)'
      'AND    (H.IDTITULAR       = :IDTITULAR)'
      ''
      '/*AND    (CO.IDPESSJUR      = H.IDPESSJUR)'
      'AND    (CO.IDPLANOPREV    = H.IDPLANOPREV)'
      'AND    (CO.IDPESSOA       = H.IDPESSOA)'
      'AND    (CO.IDCONTRIBUICAO = H.IDCONTRIBUICAO)'
      '*/'
      ''
      'AND    (H.SEQPROPOSTA    = :SEQPROPOSTA)'
      'AND    (H.IDCONTRIBUICAO = :IDCONTRIBUICAO)'
      'AND    (M.IDMOTIVO     = H.IDMOTIVO)'
      'AND    (T.IDTIPORECURSO (+) = H.IDTIPORECURSO  ) '
      'ORDER BY MESREFERENCIA DESC')
    ControlType.Strings = (
      'FLGDEVOLUCAO;CheckBox;1;0'
      'FLGCALCRESERVA;CheckBox;1;0'
      'FLGDESCFOLHA;CheckBox;0;1'
      'SELECIONA;CheckBox;1;0'
      'CONTABILIZA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 642
    Top = 11
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCONTRIBUICAO'
        ParamType = ptUnknown
      end>
    object qryDetSELECIONA: TFloatField
      DisplayLabel = 'Selecionar'
      DisplayWidth = 10
      FieldName = 'SELECIONA'
    end
    object qryDetCONTABILIZA: TFloatField
      DisplayLabel = 'Contabilizado'
      DisplayWidth = 10
      FieldName = 'CONTABILIZA'
    end
    object qryDetMESREFERENCIA: TStringField
      DisplayLabel = 'Mês de ~Referência'
      DisplayWidth = 7
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryDetMESCOBRANCA: TStringField
      DisplayLabel = 'Mês de ~Cobrança'
      DisplayWidth = 7
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryDetVALORESPERADO: TFloatField
      DisplayLabel = 'Valor ~Esperado'
      DisplayWidth = 10
      FieldName = 'VALORESPERADO'
      DisplayFormat = '#0.00'
    end
    object qryDetVALORRECEBIDO: TFloatField
      DisplayLabel = 'Valor ~Recebido'
      DisplayWidth = 10
      FieldName = 'VALORRECEBIDO'
      DisplayFormat = '#0.00'
    end
    object qryDetDATAPREVISAORECE: TDateTimeField
      DisplayLabel = 'Data ~Prevista'
      DisplayWidth = 10
      FieldName = 'DATAPREVISAORECE'
    end
    object qryDetDATARECEBIMENTO: TDateTimeField
      DisplayLabel = 'Data ~Efetiva'
      DisplayWidth = 10
      FieldName = 'DATARECEBIMENTO'
    end
    object qryDetFLGDEVOLUCAO: TFloatField
      DisplayLabel = 'Devolução'
      DisplayWidth = 10
      FieldName = 'FLGDEVOLUCAO'
    end
    object qryDetFLGCALCRESERVA: TFloatField
      DisplayLabel = 'Alimentou~Reserva'
      DisplayWidth = 10
      FieldName = 'FLGCALCRESERVA'
    end
    object qryDetFLGDESCFOLHA: TFloatField
      DisplayLabel = 'Cobrar Via ~Banco'
      DisplayWidth = 10
      FieldName = 'FLGDESCFOLHA'
    end
    object qryDetVALORPARARESERVA: TFloatField
      DisplayLabel = 'Valor para ~Reserva'
      DisplayWidth = 10
      FieldName = 'VALORPARARESERVA'
    end
    object qryDetDESCRICAO: TStringField
      DisplayLabel = 'Motivo'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryDetORIGEMRECURSO: TStringField
      DisplayLabel = 'Origem do Recurso'
      DisplayWidth = 200
      FieldName = 'ORIGEMRECURSO'
      Size = 200
    end
    object qryDetFLGIMPORTADO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGIMPORTADO'
      Visible = False
    end
    object qryDetIDTITULAR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object qryDetANODIRF: TFloatField
      DisplayLabel = 'Ano DIRF'
      DisplayWidth = 10
      FieldName = 'ANODIRF'
      Visible = False
    end
    object qryDetNOMETIPORECURSO: TStringField
      DisplayWidth = 20
      FieldName = 'NOMETIPORECURSO'
      Visible = False
    end
    object qryDetNUMRECEBIMENTO: TFloatField
      FieldName = 'NUMRECEBIMENTO'
      Visible = False
    end
    object qryDetIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
      Visible = False
    end
    object qryDetIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryDetIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryDetIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDetIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
      Visible = False
    end
    object qryDetSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Visible = False
    end
    object qryDetFLGDIVERGENTE: TFloatField
      FieldName = 'FLGDIVERGENTE'
      Visible = False
    end
    object qryDetFLGCONCESSAO: TFloatField
      FieldName = 'FLGCONCESSAO'
      Visible = False
    end
    object qryDetFLGEVENTO: TFloatField
      FieldName = 'FLGEVENTO'
      Visible = False
    end
    object qryDetFLGSITFUNDACAO: TStringField
      FieldName = 'FLGSITFUNDACAO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryDetFLGAPORTE: TFloatField
      FieldName = 'FLGAPORTE'
      Visible = False
    end
    object qryDetVALORCALCULADO: TFloatField
      FieldName = 'VALORCALCULADO'
      Visible = False
      DisplayFormat = '#0.00'
    end
    object qryDetDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Visible = False
    end
    object qryDetDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
      Visible = False
    end
    object qryDetIDREGRACALCULO: TFloatField
      FieldName = 'IDREGRACALCULO'
      Visible = False
    end
    object qryDetSITRECEBIMENTO: TStringField
      FieldName = 'SITRECEBIMENTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetTIPO: TStringField
      FieldName = 'TIPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetVALOROP1: TFloatField
      FieldName = 'VALOROP1'
      Visible = False
    end
    object qryDetVALOROP2: TFloatField
      FieldName = 'VALOROP2'
      Visible = False
    end
    object qryDetVALOROP3: TFloatField
      FieldName = 'VALOROP3'
      Visible = False
    end
    object qryDetFLGMANUAL: TFloatField
      FieldName = 'FLGMANUAL'
      Visible = False
    end
    object qryDetCODDOCUMENTOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTOPREV'
      Visible = False
    end
    object qryDetFOLHAORIGEM: TStringField
      DisplayWidth = 1
      FieldName = 'FOLHAORIGEM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetIDLOTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLOTE'
      Visible = False
    end
    object qryDetFLGALTERADO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGALTERADO'
      Visible = False
    end
    object qryDetCODPORTFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object qryDetIDTIPORECURSO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPORECURSO'
      Visible = False
    end
    object qryDetDATAEMISSCOB: TDateTimeField
      FieldName = 'DATAEMISSCOB'
    end
    object qryDetNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
    end
    object qryDetIDPLANPREVCONTAB: TFloatField
      FieldName = 'IDPLANPREVCONTAB'
    end
  end
  object qryPlanoContabil: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsDet
    SQL.Strings = (
      'select PC.NOME, PC.IDPLANOPREV'
      'from PARTPREVPLAN PP'
      
        'inner join PLANPREVCONTABIL PC on PP.IDPLANOPREV = PC.IDPLANOPRE' +
        'VPREV'
      'where PC.FLGPROCESSAMENTOFB = '#39'S'#39
      '      and PP.IDPESSOA=:IDPESSOA')
    ValidateWithMask = True
    Left = 1240
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
  end
  object qryDepBenPF: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  DP.IDTITULAR,'
      '        PF.IDPESSOA,'
      '        PF.IDPAIS,'
      #9'PF.NOMEPAI,'
      '        PF.EMAILFUNCEF,'
      '                PF.NOMEMAE,'
      '                PF.DATAMORTE,'
      '                PF.DATANASC,'
      '                PF.SEXO,'
      #9'PF.TIPOSANG,'
      '        PF.ESTCIVIL,'
      '        PF.NUMDEPIRRF,'
      '        PF.NUMDEPSALF,'
      '        PF.NUMDEPTOT,'
      '        PF.FLGISENTOIRRF,'
      '        PF.FLGMOLESTIAGRAVE,'
      '        PF.DATAMOLESTIAGRAVE ,'
      '        PF.IDGRINSTR,'
      '        0 as FORCA_UPDATE'
      'FROM PESSOAFISICA PF, DEPENTIT DP, DEPENTIT DT2'
      'WHERE  (DT2.IDTITULAR = :IDPESSOA)'
      'AND     (DP.IDTITULAR      = DT2.IDPESSOA     )'
      'AND     (DP.IDTITULAR      <> DT2.IDTITULAR   )'
      'AND     (PF.IDPESSOA = DP.IDPESSOA)'
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 1172
    Top = 606
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAcaoJud: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select IDPROCJUD, NUMEROPROCESSO, DATAINICIO, DATAFINAL, SITPROC' +
        'ESSO'
      '  from PROCJUD'
      ' where IDPESSOA = :IDPESSOA'
      '   and DATAINICIO <= :DTBASE'
      '   and (DATAFINAL >= :DTBASE or DATAFINAL is null)'
      '   and (IDPROCJUD = :IDPROCJUD or :IDPROCJUD is null)'
      ' order by DATAINICIO, DATAFINAL, NUMEROPROCESSO')
    ValidateWithMask = True
    Left = 861
    Top = 46
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DTBASE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DTBASE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPROCJUD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPROCJUD'
        ParamType = ptUnknown
      end>
  end
end
