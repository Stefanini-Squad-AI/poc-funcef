inherited frmExecRepactuacao: TfrmExecRepactuacao
  Left = 554
  Top = 213
  HelpContext = 1350011
  Caption = 'Repactuação Contratual'
  ClientHeight = 447
  ClientWidth = 698
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 698
    Height = 365
    inherited lblTitulo: TfcLabel
      Left = 0
      Top = 0
      Width = 698
      Align = alTop
      Caption = 'Repactuação Contratual [ Seleção ]'
    end
    object nbRepactua: TNotebook
      Left = 0
      Top = 24
      Width = 698
      Height = 341
      Align = alClient
      TabOrder = 0
      OnPageChanged = nbRepactuaPageChanged
      object TPage
        Left = 0
        Top = 0
        Caption = 'Selecao'
        object gbContrato: TGroupBox
          Left = 17
          Top = 8
          Width = 664
          Height = 98
          Caption = 'Contrato'
          TabOrder = 0
          object Label3: TLabel
            Left = 14
            Top = 54
            Width = 61
            Height = 13
            Caption = 'Comprador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          inline molProposta1: TmolProposta
            Left = 6
            Top = 12
            Width = 651
            Height = 40
            inherited Label1: TLabel
              Width = 44
              Caption = 'Número'
            end
            inherited Label2: TLabel
              Width = 58
              Caption = 'Descrição'
            end
            inherited edtNomProp: TEdit
              Width = 481
            end
            inherited btnBuscaProp: TBitBtn
              Left = 594
              OnClick = molProposta1btnBuscaPropClick
            end
            inherited btnLimpaProp: TBitBtn
              Left = 618
              OnClick = molProposta1btnLimpaPropClick
            end
          end
          object edtComprador: TEdit
            Left = 14
            Top = 70
            Width = 587
            Height = 21
            TabStop = False
            Enabled = False
            TabOrder = 1
          end
        end
        object gbInicio: TGroupBox
          Left = 16
          Top = 238
          Width = 217
          Height = 57
          Caption = 'Início da Repactuação'
          TabOrder = 1
          object Label5: TLabel
            Left = 9
            Top = 15
            Width = 24
            Height = 13
            Caption = 'Mês'
          end
          object Label6: TLabel
            Left = 150
            Top = 15
            Width = 23
            Height = 13
            Caption = 'Ano'
          end
          object cboMes: TComboBox
            Left = 9
            Top = 29
            Width = 135
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnChange = cboMesChange
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
          object DBspnAno: TwwDBSpinEdit
            Left = 150
            Top = 29
            Width = 59
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
            OnChange = cboMesChange
          end
        end
        object btnContinua1: TfcShapeBtn
          Left = 590
          Top = 305
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
        object GroupBox2: TGroupBox
          Left = 16
          Top = 115
          Width = 665
          Height = 118
          Caption = 'Condições de Pagamento'
          TabOrder = 3
          object dbgCondPag: TwwDBGrid
            Left = 14
            Top = 17
            Width = 634
            Height = 90
            Selected.Strings = (
              'CHKREPACTUA'#9'3'#9#9'F'
              'VLRFINANC'#9'14'#9'Valor Financiado'#9'T'
              'DATAVENCIMENTO'#9'12'#9'  Vencimento'#9'T'
              'NUMPARCELAS'#9'7'#9'Nr. Parc'#9'T'
              'CAL_INTERVALO'#9'9'#9'Intervalo'#9'F'
              'CAL_PERTAXA'#9'18'#9'Juros'#9'F'
              'DSCINDCORR'#9'10'#9'Correção'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoSearchOwnerForm, ecoDisableDateTimePicker]
            DataSource = dsCondPag
            KeyOptions = []
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            OnCalcCellColors = dbgParcCalcCellColors
            OnDblClick = dbgCondPagDblClick
            IndicatorColor = icBlack
            OnTopRowChanged = dbgParcTopRowChanged
          end
        end
        object GroupBox3: TGroupBox
          Left = 410
          Top = 238
          Width = 92
          Height = 57
          Caption = 'Condições'
          TabOrder = 4
          object Label4: TLabel
            Left = 9
            Top = 14
            Width = 68
            Height = 13
            Caption = 'Resultantes'
          end
          object DBSpnQtde: TwwDBSpinEdit
            Left = 22
            Top = 29
            Width = 43
            Height = 21
            Increment = 1
            Value = 1
            TabOrder = 0
            UnboundDataType = wwDefault
          end
        end
        object rgTipoRepactua: TRadioGroup
          Left = 512
          Top = 239
          Width = 169
          Height = 56
          Caption = 'Tipo de Repactuação'
          ItemIndex = 0
          Items.Strings = (
            'Acordo com Comprador'
            'Ajustes Internos')
          TabOrder = 5
        end
        object cbContabiliza: TCheckBox
          Left = 17
          Top = 315
          Width = 273
          Height = 17
          Caption = 'Contabiliza a operação'
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
        object GroupBox5: TGroupBox
          Left = 241
          Top = 238
          Width = 161
          Height = 57
          Caption = 'Data da Repactuação'
          TabOrder = 7
          object edDataRepactua: TCMDateTimePicker
            Left = 25
            Top = 29
            Width = 101
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
            UnboundDataType = wwDTEdtDate
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Saldo'
        object Label9: TLabel
          Left = 14
          Top = 250
          Width = 85
          Height = 13
          Caption = 'Saldo Devedor'
        end
        object Label8: TLabel
          Left = 14
          Top = 292
          Width = 90
          Height = 13
          Caption = 'Total em Atraso'
        end
        object Label7: TLabel
          Left = 145
          Top = 292
          Width = 67
          Height = 13
          Caption = 'Novo Saldo'
        end
        object Label17: TLabel
          Left = 144
          Top = 250
          Width = 104
          Height = 13
          Caption = 'Total a Repactuar'
        end
        object dbgParc: TwwDBGrid
          Left = 0
          Top = 27
          Width = 698
          Height = 214
          Selected.Strings = (
            'CHKREPACTUA'#9'3'#9#9'F'
            'NUMPARCELA'#9'7'#9'Parcela'#9'T'
            'DATAVENCIMENTO'#9'11'#9' Vencimento'#9'T'
            'CAL_TIPO'#9'22'#9'Tipo'#9'T'
            'VLRPRESTACAO'#9'15'#9'Valor Prestação'#9'T'
            'DATAPAGAMENTO'#9'11'#9' Pagamento'#9'T'
            'VLRPAGO'#9'12'#9'Valor Pago'#9'T'
            'VLRDEVIDO'#9'12'#9'Valor Devido'#9'T'
            'VLRRESIDUOATUALI'#9'11'#9'Resíduo Final'#9'T')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoSearchOwnerForm, ecoDisableDateTimePicker]
          Align = alTop
          DataSource = dsParc
          KeyOptions = []
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = dbgParcCalcCellColors
          OnDblClick = dbgParcDblClick
          IndicatorColor = icBlack
          OnTopRowChanged = dbgParcTopRowChanged
        end
        object edTotSaldoDev: TDBRealEdit
          Left = 14
          Top = 265
          Width = 113
          Height = 21
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
        object edTotAtraso: TDBRealEdit
          Left = 14
          Top = 307
          Width = 113
          Height = 21
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
        object edNovoSaldo: TDBRealEdit
          Left = 145
          Top = 307
          Width = 113
          Height = 21
          Alignment = taRightJustify
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
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 698
          Height = 27
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Parcelas em Atraso a Incorporar ao Saldo Devedor'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          object btnInverteSelecao: TBitBtn
            Left = 3
            Top = 3
            Width = 21
            Height = 20
            Hint = 'Inverte a seleção de parcelas'
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
          object btnMarcaTodasParcelas: TBitBtn
            Left = 24
            Top = 3
            Width = 21
            Height = 20
            Hint = 'Seleciona todas as parcelas'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btnMarcaTodasParcelasClick
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
        object btnContinua2: TfcShapeBtn
          Left = 590
          Top = 305
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
          TabOrder = 6
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinua2Click
        end
        object btnCancela2: TfcShapeBtn
          Left = 492
          Top = 305
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
          TabOrder = 5
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnCancela2Click
        end
        object edTotRepac: TDBRealEdit
          Left = 144
          Top = 265
          Width = 113
          Height = 21
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
        object GroupBox6: TGroupBox
          Left = 280
          Top = 248
          Width = 361
          Height = 48
          Caption = 'Alterador de desconto para liquidar documentos em aberto'
          TabOrder = 8
          object DBcboAlterador: TwwDBLookupCombo
            Left = 14
            Top = 18
            Width = 329
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            LookupTable = dtmLookImobiliario.qryLookAlteradorXTipoImo
            LookupField = 'CODALTERADOR'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Operacoes'
        object Label18: TLabel
          Left = 400
          Top = 33
          Width = 107
          Height = 13
          Caption = 'Valor da Operação'
        end
        object Label1: TLabel
          Left = 247
          Top = 292
          Width = 61
          Height = 13
          Caption = 'Descontos'
        end
        object Label19: TLabel
          Left = 146
          Top = 292
          Width = 65
          Height = 13
          Caption = 'Acréscimos'
        end
        object Label20: TLabel
          Left = 348
          Top = 292
          Width = 67
          Height = 13
          Caption = 'Novo Saldo'
        end
        object Label21: TLabel
          Left = 12
          Top = 77
          Width = 69
          Height = 13
          Caption = 'Observação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 9
          Top = 292
          Width = 80
          Height = 13
          Caption = 'Saldo anterior'
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 698
          Height = 27
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Operações de Acréscimos e Descontos'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        inline molTipoOperacao: TmolTipoOperacao
          Left = 5
          Top = 32
          Width = 385
          Height = 39
          TabOrder = 1
          inherited Label5: TLabel
            Left = 6
          end
          inherited btnBuscaTipoOper: TBitBtn
            OnClick = molTipoOperacao1btnBuscaTipoOperClick
          end
          inherited btnLimpaTipoOper: TBitBtn
            Left = 351
          end
        end
        object Panel5: TPanel
          Left = 11
          Top = 134
          Width = 670
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Operações Selecionadas'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          TabStop = True
          object btnAplicaOperacao: TBitBtn
            Left = 0
            Top = 2
            Width = 81
            Height = 25
            Caption = 'Aplicar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ModalResult = 1
            ParentFont = False
            TabOrder = 0
            OnClick = btnAplicaOperacaoClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
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
            Margin = 10
            NumGlyphs = 2
          end
          object btnExcluiOperacao: TBitBtn
            Left = 81
            Top = 2
            Width = 81
            Height = 25
            Caption = 'Excluir'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ModalResult = 1
            ParentFont = False
            TabOrder = 1
            OnClick = btnExcluiOperacaoClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888009191900
              88888887788888778F88887991919191088888788888888878F8879919191919
              108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
              19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
              19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
              190878F877787778887887917F919F71908887F88788878887F8879919191919
              1088878F88888888878888799191919108888878FF88888F7888888779999977
              8888888778FFFF77888888888777778888888888877777888888}
            Margin = 10
            NumGlyphs = 2
          end
        end
        object edtValorOperacao: TDBRealEdit
          Left = 400
          Top = 48
          Width = 113
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
        object wwDBGrid1: TwwDBGrid
          Left = 10
          Top = 160
          Width = 671
          Height = 125
          Selected.Strings = (
            'DESC_TIPOOPER'#9'60'#9'Descrição'#9'F'
            'FLGTIPOOPER'#9'5'#9'Tipo'#9'F'
            'VLROPERACAO'#9'10'#9'Valor'#9'F'
            'OBSERVACAO'#9'200'#9'Observação'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsRepCondImovXOper
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 4
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = dbgParcCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = dbgParcTopRowChanged
        end
        object edTotDesc: TDBRealEdit
          Left = 247
          Top = 307
          Width = 79
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '      0,00')
          TabOrder = 5
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object edtTotAcres: TDBRealEdit
          Left = 146
          Top = 307
          Width = 79
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '      0,00')
          TabOrder = 6
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object fcShapeBtn1: TfcShapeBtn
          Left = 492
          Top = 305
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
          TabOrder = 7
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnCancela2Click
        end
        object btnContinua4: TfcShapeBtn
          Left = 590
          Top = 305
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
          TabOrder = 8
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinua4Click
        end
        object edtNovoSaldoOper: TDBRealEdit
          Left = 348
          Top = 307
          Width = 113
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 9
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object memObservacao: TMemo
          Left = 10
          Top = 92
          Width = 670
          Height = 39
          TabOrder = 10
        end
        object edtSaldoAnterior: TDBRealEdit
          Left = 9
          Top = 307
          Width = 113
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 11
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Condicoes'
        object btnContinua3: TfcShapeBtn
          Left = 590
          Top = 305
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
          OnClick = btnContinua3Click
        end
        object btnCancela3: TfcShapeBtn
          Left = 492
          Top = 305
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
          OnClick = btnCancela2Click
        end
        object GroupBox1: TGroupBox
          Left = 8
          Top = 4
          Width = 673
          Height = 189
          Caption = 'Nova Condição de Pagamento'
          TabOrder = 3
          object Label10: TLabel
            Left = 13
            Top = 18
            Width = 85
            Height = 13
            Caption = 'Saldo Devedor'
          end
          object Label11: TLabel
            Left = 13
            Top = 59
            Width = 91
            Height = 13
            Caption = 'Indice Correção'
          end
          object Label12: TLabel
            Left = 119
            Top = 59
            Width = 90
            Height = 13
            Caption = 'Indice Projeção'
          end
          object Label13: TLabel
            Left = 229
            Top = 18
            Width = 100
            Height = 13
            Caption = 'Próx. Vencimento'
          end
          object Label14: TLabel
            Left = 450
            Top = 18
            Width = 50
            Height = 13
            Caption = 'Parcelas'
          end
          object Label16: TLabel
            Left = 242
            Top = 58
            Width = 31
            Height = 13
            Caption = 'Juros'
          end
          object Label46: TLabel
            Left = 103
            Top = 107
            Width = 96
            Height = 13
            Caption = 'Utilizar indice de'
          end
          object Label47: TLabel
            Left = 103
            Top = 123
            Width = 112
            Height = 13
            Caption = 'mes(es) anterior(es)'
          end
          object lblPerProj: TLabel
            Left = 13
            Top = 99
            Width = 77
            Height = 13
            Caption = 'CM Projetada'
          end
          object lblPerProj2: TLabel
            Left = 80
            Top = 118
            Width = 10
            Height = 13
            Caption = '%'
          end
          object lblPeriod: TLabel
            Left = 365
            Top = 58
            Width = 78
            Height = 13
            Caption = 'Periodicidade'
          end
          object lblJurCarencia: TLabel
            Left = 487
            Top = 90
            Width = 154
            Height = 13
            Caption = 'o período sem amortização'
          end
          object Label2: TLabel
            Left = 339
            Top = 18
            Width = 103
            Height = 13
            Caption = 'Próx. Amortização'
          end
          object Label15: TLabel
            Left = 339
            Top = 78
            Width = 10
            Height = 13
            Caption = '%'
          end
          object Label23: TLabel
            Left = 119
            Top = 18
            Width = 91
            Height = 13
            Caption = 'Início Condição'
          end
          object edSaldoDev: TDBRealEdit
            Left = 13
            Top = 33
            Width = 98
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '      0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object dblcbIndCorr: TCMDBLookupCombo
            Left = 13
            Top = 74
            Width = 98
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOESIGLA'#9'10'#9'Sigla'#9'F'
              'FLGPERCVALOR'#9'1'#9'Tipo'#9'F')
            LookupTable = qryMoeda
            LookupField = 'MOECODIGO'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 6
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcbIndProj: TCMDBLookupCombo
            Left = 119
            Top = 74
            Width = 101
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOESIGLA'#9'10'#9'Sigla'#9'F'
              'FLGPERCVALOR'#9'1'#9'Tipo'#9'F')
            LookupTable = qryMoeda
            LookupField = 'MOECODIGO'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 7
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object cmDtVencto: TCMDateTimePicker
            Left = 229
            Top = 33
            Width = 101
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
            UnboundDataType = wwDTEdtDate
          end
          object dbedtParc: TDBRealEdit
            Left = 450
            Top = 33
            Width = 50
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0')
            TabOrder = 4
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
          end
          object dbEdtJuros: TDBRealEdit
            Left = 240
            Top = 74
            Width = 97
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,0000000000')
            TabOrder = 8
            WordWrap = False
            IntDigits = 14
            DecDigits = 10
            NumberFormat = fNumber
            Signal = False
          end
          object dbedtMesRefReajuste: TwwDBSpinEdit
            Left = 202
            Top = 103
            Width = 33
            Height = 21
            Increment = 1
            MaxValue = 9
            TabOrder = 12
            UnboundDataType = wwDefault
          end
          object edtPerProj: TDBRealEdit
            Left = 13
            Top = 114
            Width = 65
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,000000')
            TabOrder = 11
            WordWrap = False
            IntDigits = 10
            DecDigits = 6
            NumberFormat = fNumber
            Signal = False
          end
          object dbcbPerJur: TwwDBComboBox
            Left = 359
            Top = 74
            Width = 84
            Height = 21
            ShowButton = True
            Style = csDropDownList
            MapList = True
            AllowClearKey = False
            DropDownCount = 5
            ItemHeight = 13
            Items.Strings = (
              'Mensal'#9'M'
              'Anual Simples'#9'A'
              'Anual Composto'#9'C')
            Sorted = False
            TabOrder = 9
            UnboundDataType = wwDefault
          end
          object gbIntervalo: TGroupBox
            Left = 508
            Top = 16
            Width = 152
            Height = 44
            Caption = 'Periodicidade Parcela'
            TabOrder = 5
            object dbspnPeriodo: TwwDBSpinEdit
              Left = 11
              Top = 18
              Width = 37
              Height = 21
              Increment = 1
              TabOrder = 0
              UnboundDataType = wwDefault
            end
            object dbcbPerParc: TwwDBComboBox
              Left = 56
              Top = 18
              Width = 89
              Height = 21
              ShowButton = True
              Style = csDropDownList
              MapList = True
              AllowClearKey = False
              DropDownCount = 5
              ItemHeight = 13
              Items.Strings = (
                'Mês'#9'M'
                'Ano'#9'A')
              Sorted = False
              TabOrder = 1
              UnboundDataType = wwDefault
            end
          end
          object GroupBox4: TGroupBox
            Left = 5
            Top = 140
            Width = 639
            Height = 40
            Caption = 'Forma de Calculo'
            TabOrder = 13
            object dbcbFormaCalculo: TwwDBComboBox
              Left = 9
              Top = 15
              Width = 621
              Height = 21
              ShowButton = True
              Style = csDropDownList
              MapList = True
              AllowClearKey = True
              AutoDropDown = True
              ShowMatchText = True
              DropDownCount = 6
              DropDownWidth = 640
              ItemHeight = 0
              Items.Strings = (
                
                  'Correção Mensal sobre Saldo Devedor, Parcela calculada sobre sal' +
                  'do devedor por parcelas restantes'#9'18'
                'FIXA - Sem juros e sem correção'#9'9'
                
                  'JUROS MENSAL - Atualização mensal da parcela, sem alteração do s' +
                  'aldo devedor'#9'19'
                
                  'JUROS MENSAL - Corrige Saldo Dev. COMPOSTO mensal, Juros sobre S' +
                  'aldo Dev. COMPOSTO e Parcela'#9'11'
                
                  'JUROS MENSAL - Sobre Saldo Dev. e Parcela, com correção e recalc' +
                  'ulo anual'#9'6'
                
                  'PRICE - Corrige Saldo Dev. anual, Incorpora resíduo, Recalculo a' +
                  'nual da Parcela'#9'1'
                
                  'PRICE - Corrige Saldo Dev. anual, Não incorpora resíduo, Recalcu' +
                  'lo anual da parcela'#9'4'
                
                  'PRICE - Corrige Saldo Dev. mensal, parcela fixa com indice proje' +
                  'tado'#9'10'
                'PRICE - Corrige Saldo Dev. mensal, recalculo anual da Parcela'#9'2'
                
                  'PRICE - Corrige Saldo Dev. mensal, Sem Recalculo, com Correção a' +
                  'nual da Parcela'#9'14'
                
                  'PRICE - Corrige Saldo Dev. mensal, Sem Recalculo, com Correção n' +
                  'a Parcela'#9'3'
                'SAC - Calcula Juros e Correção mensal sobre o Saldo Devedor'#9'16'
                'SAC - Calcula Juros sobre a Parcela com geração de resíduo'#9'17'
                
                  'SAC - Corrige Saldo Dev. anual, Calcula juros sobre Saldo Devedo' +
                  'r, Recalculo anual da Parcela'#9'12'
                
                  'SAC - Não Corrige Saldo Dev., Calcula Juros sobre a Parcela, Rec' +
                  'alculo anual da Parcela'#9'8')
              Sorted = True
              TabOrder = 0
              UnboundDataType = wwDefault
            end
          end
          object dbcbJurosCarencia: TDBCheckBox
            Left = 466
            Top = 73
            Width = 193
            Height = 17
            Caption = 'Gera parcela de Juros durante'
            TabOrder = 10
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object cmdtAmortiz: TCMDateTimePicker
            Left = 339
            Top = 33
            Width = 101
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
            UnboundDataType = wwDTEdtDate
          end
          object cmDataIni: TCMDateTimePicker
            Left = 119
            Top = 33
            Width = 101
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
            UnboundDataType = wwDTEdtDate
          end
        end
        object Panel4: TPanel
          Left = 11
          Top = 201
          Width = 670
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Condições Resultantes'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          TabStop = True
          object bbAplicar: TBitBtn
            Left = 0
            Top = 2
            Width = 81
            Height = 25
            Caption = 'Aplicar'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ModalResult = 1
            ParentFont = False
            TabOrder = 0
            OnClick = bbAplicarClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
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
            Margin = 10
            NumGlyphs = 2
          end
          object bbExcluir: TBitBtn
            Left = 81
            Top = 2
            Width = 81
            Height = 25
            Caption = 'Excluir'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ModalResult = 1
            ParentFont = False
            TabOrder = 1
            OnClick = bbExcluirClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888009191900
              88888887788888778F88887991919191088888788888888878F8879919191919
              108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
              19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
              19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
              190878F877787778887887917F919F71908887F88788878887F8879919191919
              1088878F88888888878888799191919108888878FF88888F7888888779999977
              8888888778FFFF77888888888777778888888888877777888888}
            Margin = 10
            NumGlyphs = 2
          end
        end
        object DBgrdAlteradoresLanc: TwwDBGrid
          Left = 10
          Top = 228
          Width = 671
          Height = 73
          Selected.Strings = (
            'VLRFINANC'#9'13'#9'Saldo Devedor'
            'DATAVENCIMENTO'#9'13'#9'Vencimento'
            'NUMPARCELAS'#9'8'#9'Nr. Parc'
            'INTERVALO'#9'8'#9'Intervalo'
            'PERPARC'#9'4'#9'Per'
            'JUROS'#9'10'#9'Juros'
            'DSCINDCORR'#9'11'#9'Correção'
            'DSCINDPROJ'#9'10'#9'Projeção'
            'MESREFREAJUSTE'#9'10'#9'Mes Referencia de Reajuste'
            'DSCFORMACALCULO'#9'128'#9'Forma de Calculo'
            'DATAINIAMORTIZ'#9'18'#9'Prox. Amortização')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsCondResult
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 4
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = dbgParcCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = dbgParcTopRowChanged
        end
        object chkNovaCondPag: TCheckBox
          Left = 13
          Top = 314
          Width = 404
          Height = 17
          Caption = 'Gera nova condição de pagamento independente das anteriores'
          TabOrder = 5
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 414
    Width = 698
  end
  inherited Panel2: TPanel
    Top = 365
    Width = 698
    inherited lblProgress: TLabel
      Width = 86
      Caption = 'Processando...'
    end
    inherited lblContador: TLabel
      Left = 588
    end
    inherited ProgressBar: TProgressBar
      Width = 665
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
  object qryParc: TwwQuery
    Tag = 5
    CachedUpdates = True
    OnCalcFields = qryParcCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '-- QUERY REESCRITA EM TEMPO DE DESENVOLVIMENTO'
      ''
      'SELECT'
      '     (0) AS CHKREPACTUA,'
      '     PF.IDPARCFINANCIMOV,'
      '     PF.IDCONDPAGIMOVEL,'
      '     CP.IDCONTRATOIMOVEL,'
      '     CI.FLGTIPOCONTRATO,'
      '     IM.CODTIPIMOVEL AS CODTIPIMOVEL,'
      '     PF.CODDOCUMENTO,'
      ''
      
        '     DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || '#39'/'#39' |' +
        '| TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA,'
      
        '     DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENTO)' +
        ' AS DATAVENCIMENTO,'
      
        '     DECODE(NVL(PF.FLGRESIDUOINCORP,'#39'N'#39'),'#39'N'#39',PF.VLRRESIDUOATUALI' +
        ',0) AS VLRRESIDUOATUALI,'
      ''
      '     PF.VLRPRESTACAO, PF.VLRAMORTIZACAO,'
      ''
      '     PF.VLRJUROS,'
      '     PF.FLGTIPOLANC,'
      '     PF.FLGLANCINTEGRA,'
      '     PF.DATAPAGAMENTO,'
      '     PF.VLRPAGO AS VLRPAGO,'
      '     PF.VLRPRESTCORRIG,'
      '     PF.VLRMULTACORRIG,'
      '     PF.VLRJUROSCORRIG,'
      ''
      
        '     ROUND( ( NVL(PF.VLRPRESTCORRIG,0) + NVL(PF.VLRMULTACORRIG,0' +
        ') + NVL(PF.VLRJUROSCORRIG,0) ), 2) AS VLRDEVIDO'
      ''
      'FROM'
      '     PARCFINANCIMOV PF,'
      '     CONDPAGIMOVEL  CP,'
      '     CONTRATOIMOVEL CI,'
      ''
      '     ( SELECT CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL,'
      '              I.CODTIPIMOVEL AS CODTIPIMOVEL'
      '       FROM'
      '              CONTRATOXIMOVEL CXI,'
      '              IMOVEL I,'
      '              IMOVEL M'
      '       WHERE'
      '              CXI.IDIMOVEL = I.IDIMOVEL AND'
      '              I.IDIMOVELMESTRE = M.IDIMOVEL'
      '       GROUP BY CXI.IDCONTRATOIMOVEL, I.CODTIPIMOVEL ) IM,'
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
      '         AND   B.DATAINI       = A.DATAINI ) CPFINAL'
      ''
      'WHERE'
      '         (PF.FLGTIPOLANC IN (2,3,5,6,7,8,9))'
      
        '     AND (PF.FLGCONCILIADO IS NULL OR PF.FLGCONCILIADO IN('#39'N'#39','#39'P' +
        #39') )'
      '     AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)'
      '     AND (CP.IDCONTRATOIMOVEL = IM.IDCONTRATOIMOVEL(+))'
      '     AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      '     AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL)'
      
        '     AND ( (:pIDCONDPAGIMOVEL IS NULL) OR (CP.IDCONDPAGIMOVEL = ' +
        ':pIDCONDPAGIMOVEL) )'
      
        '     AND ( (:pDTFIM IS NULL) OR (PF.DATAVENCIMENTO <= TO_DATE(:p' +
        'DTFIM,'#39'DD/MM/YYYY'#39')) )'
      ''
      'ORDER BY PF.DATAVENCIMENTO'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updParc
    ControlType.Strings = (
      'CHKREPACTUA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 475
    Top = 274
    ParamData = <
      item
        DataType = ftString
        Name = 'pIDCONDPAGIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pIDCONDPAGIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDTFIM'
        ParamType = ptUnknown
      end>
    object qryParcIDPARCFINANCIMOV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPARCFINANCIMOV'
    end
    object qryParcIDCONDPAGIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryParcIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryParcNUMPARCELA: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Parc'
      DisplayWidth = 5
      FieldName = 'NUMPARCELA'
      Size = 81
    end
    object qryParcDATAVENCIMENTO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      DisplayWidth = 18
      FieldName = 'DATAVENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = 'dd/mm/yyyy'
    end
    object qryParcVLRPRESTACAO: TFloatField
      DisplayLabel = 'Valor Prestação'
      DisplayWidth = 10
      FieldName = 'VLRPRESTACAO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryParcFLGTIPOLANC: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGTIPOLANC'
    end
    object qryParcDATAPAGAMENTO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Pagamento'
      DisplayWidth = 18
      FieldName = 'DATAPAGAMENTO'
    end
    object qryParcVLRPAGO: TFloatField
      DisplayLabel = 'Valor Pago'
      DisplayWidth = 10
      FieldName = 'VLRPAGO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryParcVLRDEVIDO: TFloatField
      DisplayLabel = 'Valor Devido'
      DisplayWidth = 10
      FieldName = 'VLRDEVIDO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryParcCAL_TIPO: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'CAL_TIPO'
      Calculated = True
    end
    object qryParcVLRJUROS: TFloatField
      DisplayLabel = 'Juros Financ'
      FieldName = 'VLRJUROS'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryParcVLRRESIDUOATUALI: TFloatField
      DisplayLabel = 'Resíduo Final'
      FieldName = 'VLRRESIDUOATUALI'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryParcCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryParcFLGLANCINTEGRA: TFloatField
      FieldName = 'FLGLANCINTEGRA'
    end
    object qryParcVLRPRESTCORRIG: TFloatField
      FieldName = 'VLRPRESTCORRIG'
    end
    object qryParcVLRMULTACORRIG: TFloatField
      FieldName = 'VLRMULTACORRIG'
    end
    object qryParcVLRJUROSCORRIG: TFloatField
      FieldName = 'VLRJUROSCORRIG'
    end
    object qryParcCHKREPACTUA: TFloatField
      FieldName = 'CHKREPACTUA'
    end
    object qryParcCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryParcVLRAMORTIZACAO: TFloatField
      FieldName = 'VLRAMORTIZACAO'
    end
    object qryParcFLGTIPOCONTRATO: TStringField
      FieldName = 'FLGTIPOCONTRATO'
      FixedChar = True
      Size = 1
    end
  end
  object dsParc: TwwDataSource
    AutoEdit = False
    DataSet = qryParc
    Left = 476
    Top = 259
  end
  object updParc: TUpdateSQL
    ModifySQL.Strings = (
      'update CONDPAGIMOVEL'
      'set'
      '  IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL,'
      '  IDCONDPAGIMOVEL = :IDCONDPAGIMOVEL,'
      '  INDCORRECAO = :INDCORRECAO,'
      '  IDINDCORRPROJ = :IDINDCORRPROJ,'
      '  VLRFINANC = :VLRFINANC,'
      '  FLGREAJMENSAL = :FLGREAJMENSAL,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  DATAINI = :DATAINI,'
      '  DATAFIM = :DATAFIM,'
      '  PRAZO = :PRAZO,'
      '  PERIODO = :PERIODO,'
      '  TAXAJUROS = :TAXAJUROS,'
      '  PERIODOTAXA = :PERIODOTAXA,'
      '  NUMPARCELAS = :NUMPARCELAS,'
      '  TIPOCONDPAG = :TIPOCONDPAG,'
      '  IDCONDINICIAL = :IDCONDINICIAL'
      'where'
      '  IDCONDPAGIMOVEL = :OLD_IDCONDPAGIMOVEL')
    InsertSQL.Strings = (
      'insert into CONDPAGIMOVEL'
      
        '  (IDCONTRATOIMOVEL, IDCONDPAGIMOVEL, INDCORRECAO, IDINDCORRPROJ' +
        ', VLRFINANC, '
      
        '   FLGREAJMENSAL, DATAVENCIMENTO, DATAINI, DATAFIM, PRAZO, PERIO' +
        'DO, TAXAJUROS, '
      '   PERIODOTAXA, NUMPARCELAS, TIPOCONDPAG, IDCONDINICIAL)'
      'values'
      
        '  (:IDCONTRATOIMOVEL, :IDCONDPAGIMOVEL, :INDCORRECAO, :IDINDCORR' +
        'PROJ, :VLRFINANC, '
      
        '   :FLGREAJMENSAL, :DATAVENCIMENTO, :DATAINI, :DATAFIM, :PRAZO, ' +
        ':PERIODO, '
      
        '   :TAXAJUROS, :PERIODOTAXA, :NUMPARCELAS, :TIPOCONDPAG, :IDCOND' +
        'INICIAL)')
    DeleteSQL.Strings = (
      'delete from CONDPAGIMOVEL'
      'where'
      '  IDCONDPAGIMOVEL = :OLD_IDCONDPAGIMOVEL')
    Left = 475
    Top = 245
  end
  object qryMoeda: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    MOECODIGO,'
      '    MOESIGLA,'
      '    MOEDESC,'
      '    FLGPERCVALOR'
      'FROM'
      '    MOEDA'
      'WHERE'
      '    (MOEINATIVO = '#39'A'#39')'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 645
    Top = 250
    object qryMoedaMOESIGLA: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Origin = 'BASEDADOS.MOEDA.MOESIGLA'
      Size = 10
    end
    object qryMoedaFLGPERCVALOR: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 1
      FieldName = 'FLGPERCVALOR'
      Origin = 'BASEDADOS.MOEDA.FLGPERCVALOR'
      FixedChar = True
      Size = 1
    end
    object qryMoedaMOEDESC: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
      Visible = False
    end
    object qryMoedaMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
      Visible = False
    end
  end
  object qryCondPag: TwwQuery
    Tag = 5
    CachedUpdates = True
    OnCalcFields = qryCondPagCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      (0) AS CHKREPACTUA,'
      '      CP.IDCONTRATOIMOVEL,'
      '      CP.IDCONDPAGIMOVEL,'
      '      CP.IDCONDINICIAL,'
      '      CP.IDREPACTUA,'
      '      CP.DATAVENCIMENTO,'
      '      CP.DATAINIAMORTIZ,'
      '      CP.NUMPARCELAS,'
      '      CP.VLRFINANC,'
      '      CP.PRAZO,'
      '      CP.PERIODO,'
      '      CP.TAXAJUROS,'
      '      CP.PERIODOTAXA,'
      '      CP.FLGJURCARENCIA,'
      '      CP.MESREFREAJUSTE,'
      '      CPI.DATAVENCIMENTO AS DATAVENCTOINICIAL,'
      '      CI.CONDATAASSINATURA,'
      '      M.MOESIGLA AS DSCINDCORR,'
      '      I.CODTIPIMOVEL'
      ' FROM'
      '      CONDPAGIMOVEL CP,'
      '      CONDPAGIMOVEL CPI,'
      '      CONTRATOIMOVEL CI,'
      '      MOEDA M,'
      
        '      ( SELECT CXI.IDCONTRATOIMOVEL, MAX(I.CODTIPIMOVEL) AS CODT' +
        'IPIMOVEL'
      '          FROM CONTRATOXIMOVEL CXI,'
      '               IMOVEL I'
      '         WHERE CXI.IDIMOVEL = I.IDIMOVEL'
      '           AND CXI.IDCONTRATOIMOVEL = :pIDCONTRATOIMOVEL'
      '         GROUP BY CXI.IDCONTRATOIMOVEL ) I      '
      'WHERE'
      '      ( CP.TIPOCONDPAG IN('#39'P'#39','#39'R'#39','#39'S'#39') )'
      '  AND ( CP.IDREPACTUA IS NULL )'
      '  AND ( CP.IDCONTRATOIMOVEL = I.IDCONTRATOIMOVEL )'
      '  AND ( CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL )'
      '  AND ( CP.IDCONDINICIAL = CPI.IDCONDPAGIMOVEL )'
      '  AND ( CP.INDCORRECAO = M.MOECODIGO(+))'
      
        '  AND ( (:pIDCONTRATOIMOVEL IS NULL) OR (CI.IDCONTRATOIMOVEL = :' +
        'pIDCONTRATOIMOVEL) )'
      ''
      'ORDER BY CP.DATAVENCIMENTO'
      '')
    UpdateObject = updCondPag
    ControlType.Strings = (
      'CHKREPACTUA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 557
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryCondPagVLRFINANC: TFloatField
      DisplayLabel = 'Valor Financiado'
      DisplayWidth = 10
      FieldName = 'VLRFINANC'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.VLRFINANC'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryCondPagNUMPARCELAS: TFloatField
      DisplayLabel = '                      Nr. Parcelas'
      DisplayWidth = 10
      FieldName = 'NUMPARCELAS'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.NUMPARCELAS'
      Visible = False
    end
    object qryCondPagIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryCondPagIDCONDPAGIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDPAGIMOVEL'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.IDCONDPAGIMOVEL'
      Visible = False
    end
    object qryCondPagPRAZO: TStringField
      FieldName = 'PRAZO'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.PRAZO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCondPagPERIODO: TFloatField
      FieldName = 'PERIODO'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.PERIODO'
      Visible = False
    end
    object qryCondPagTAXAJUROS: TFloatField
      FieldName = 'TAXAJUROS'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.TAXAJUROS'
      Visible = False
    end
    object qryCondPagPERIODOTAXA: TStringField
      FieldName = 'PERIODOTAXA'
      Origin = 'BASEDADOS.CONDPAGIMOVEL.PERIODOTAXA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCondPagDATAVENCIMENTO: TDateTimeField
      Alignment = taCenter
      FieldName = 'DATAVENCIMENTO'
    end
    object qryCondPagCHKREPACTUA: TFloatField
      FieldName = 'CHKREPACTUA'
    end
    object qryCondPagIDREPACTUA: TFloatField
      FieldName = 'IDREPACTUA'
    end
    object qryCondPagIDCONDINICIAL: TFloatField
      FieldName = 'IDCONDINICIAL'
    end
    object qryCondPagCONDATAASSINATURA: TDateTimeField
      FieldName = 'CONDATAASSINATURA'
    end
    object qryCondPagCAL_INTERVALO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CAL_INTERVALO'
      Calculated = True
    end
    object qryCondPagCAL_PERTAXA: TStringField
      FieldKind = fkCalculated
      FieldName = 'CAL_PERTAXA'
      Calculated = True
    end
    object qryCondPagDSCINDCORR: TStringField
      FieldName = 'DSCINDCORR'
      Size = 10
    end
    object qryCondPagDATAVENCTOINICIAL: TDateTimeField
      FieldName = 'DATAVENCTOINICIAL'
    end
    object qryCondPagMESREFREAJUSTE: TFloatField
      FieldName = 'MESREFREAJUSTE'
    end
    object qryCondPagFLGJURCARENCIA: TStringField
      FieldName = 'FLGJURCARENCIA'
      FixedChar = True
      Size = 1
    end
    object qryCondPagDATAINIAMORTIZ: TDateTimeField
      FieldName = 'DATAINIAMORTIZ'
    end
    object qryCondPagCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
  end
  object qryAlteradores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   LD.CODDOCUMENTO, LD.NUMLANCTO,'
      '   LD.CODALTERADOR, LD.PLNCODIGO,'
      '   LD.DATALANCTO, LD.VALOR, LD.VALOROUTRAMOEDA,'
      '   LD.DEBCRE, LD.OPERACAO, LD.HISTORICOCOMPL,'
      ''
      '   A.DESCRICAO'
      'FROM'
      '   LANCTODOCUM LD, TIPOALTERADOR A'
      'WHERE'
      '   ( LD.CODDOCUMENTO =:PCODDOCUMENTO )'
      '   AND ( LD.OPERACAO = '#39'4 '#39' )'
      '   AND ( LD.CODALTERADOR = A.CODALTERADOR )'
      'ORDER BY'
      '   LD.DATALANCTO, A.DESCRICAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 645
    Top = 238
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCODDOCUMENTO'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryAlteradoresDESCRICAO: TStringField
      DisplayLabel = 'Tipo do Alterador'
      DisplayWidth = 18
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryAlteradoresHISTORICOCOMPL: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 27
      FieldName = 'HISTORICOCOMPL'
      Size = 60
    end
    object qryAlteradoresVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qryAlteradoresDATALANCTO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATALANCTO'
    end
    object qryAlteradoresCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object qryAlteradoresNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Visible = False
    end
    object qryAlteradoresCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Visible = False
    end
    object qryAlteradoresPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryAlteradoresVALOROUTRAMOEDA: TFloatField
      FieldName = 'VALOROUTRAMOEDA'
      Visible = False
    end
    object qryAlteradoresDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Visible = False
      Size = 1
    end
    object qryAlteradoresOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Visible = False
      Size = 2
    end
  end
  object qryUpdParc: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PARCFINANCIMOV'
      '   SET FLGCONCILIADO  = :PFLGCONCILIADO,'
      '       FLGLANCINTEGRA = :PFLGLANCINTEGRA,'
      '       VLRPRESTCORRIG = NULL,'
      '       VLRMULTACORRIG = NULL,'
      '       VLRJUROSCORRIG = NULL,'
      '       IDREPACTUA     = :PIDREPACTUA'
      ''
      ' WHERE IDPARCFINANCIMOV = :PIDPARCFINANCIMOV'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 402
    Top = 234
    ParamData = <
      item
        DataType = ftString
        Name = 'PFLGCONCILIADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGLANCINTEGRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDREPACTUA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPARCFINANCIMOV'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPARCFINANCIMOV'
    end
    object FloatField2: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object FloatField3: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object StringField1: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Parc'
      DisplayWidth = 5
      FieldName = 'NUMPARCELA'
      Size = 81
    end
    object DateTimeField1: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      DisplayWidth = 18
      FieldName = 'DATAVENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = 'dd/mm/yyyy'
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Valor Prestação'
      DisplayWidth = 10
      FieldName = 'VLRPRESTACAO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object FloatField5: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGTIPOLANC'
    end
    object DateTimeField2: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Pagamento'
      DisplayWidth = 18
      FieldName = 'DATAPAGAMENTO'
    end
    object FloatField6: TFloatField
      DisplayLabel = 'Valor Pago'
      DisplayWidth = 10
      FieldName = 'VLRPAGO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object FloatField7: TFloatField
      DisplayLabel = 'Valor Devido'
      DisplayWidth = 10
      FieldName = 'VLRDEVIDO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object StringField2: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'CAL_TIPO'
      Calculated = True
    end
    object FloatField8: TFloatField
      DisplayLabel = 'Juros Financ'
      FieldName = 'VLRJUROS'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object FloatField9: TFloatField
      DisplayLabel = 'Resíduo Final'
      FieldName = 'VLRRESIDUOATUALI'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object qryInsCondRepactua: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO CONDPAGIMOVEL'
      '('
      'IDCONDPAGIMOVEL,  IDCONTRATOIMOVEL,   INDCORRECAO,'
      'VLRFINANC,        DATAINI,            PRAZO,'
      'PERIODO,          TAXAJUROS,          PERIODOTAXA,'
      'NUMPARCELAS,      PERINDPROJ,         IDINDCORRPROJ,'
      'DATAVENCIMENTO,   TIPOCONDPAG,        IDCONDINICIAL,'
      'FORMACALCULO,     MESREFREAJUSTE,     DATAINIAMORTIZ,'
      'FLGJURCARENCIA'
      ''
      ')'
      'VALUES'
      '('
      ':PIDCONDPAGIMOVEL, :PIDCONTRATOIMOVEL, :PINDCORRECAO,'
      ':PVLRFINANC,       :PDATAINI,          :PPRAZO,'
      ':PPERIODO,         :PTAXAJUROS,        :PPERIODOTAXA,'
      ':PNUMPARCELAS,     :PPERINDPROJ,       :PIDINDCORRPROJ,'
      ':PDATAVENCIMENTO,  :PTIPOCONDPAG,      :PIDCONDINICIAL,'
      ':PFORMACALCULO,    :PMESREFREAJUSTE,   :PDATAINIAMORTIZ,'
      ':PFLGJURCARENCIA'
      ''
      ')'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 317
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONDPAGIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PINDCORRECAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRFINANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PPRAZO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPERIODO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PTAXAJUROS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PPERIODOTAXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PNUMPARCELAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PPERINDPROJ'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDINDCORRPROJ'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAVENCIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PTIPOCONDPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDCONDINICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFORMACALCULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESREFREAJUSTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINIAMORTIZ'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGJURCARENCIA'
        ParamType = ptUnknown
      end>
  end
  object dsCondPag: TwwDataSource
    AutoEdit = False
    DataSet = qryCondPag
    Left = 557
    Top = 252
  end
  object updCondPag: TUpdateSQL
    ModifySQL.Strings = (
      'update CONDPAGIMOVEL'
      'set'
      '  IDREPACTUA = :IDREPACTUA'
      'where'
      '  IDCONDPAGIMOVEL = :OLD_IDCONDPAGIMOVEL')
    DeleteSQL.Strings = (
      '')
    Left = 557
    Top = 239
  end
  object qryInsRepactua: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO REPCONDPAGIMOV'
      '('
      'IDREPACTUA,  DATAREPACTUA,'
      'VLRSALDOANT, VLRINCORPORADO, PLNCODIGO, TIPOREPACTUA'
      ')'
      'VALUES'
      '('
      ':PIDREPACTUA,  :PDATAREPACTUA,'
      ':PVLRSALDOANT, :PVLRINCORPORADO, :PPLNCODIGO, :PTIPOREPACTUA'
      ')'
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 325
    Top = 211
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDREPACTUA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAREPACTUA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRSALDOANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PVLRINCORPORADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PPLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PTIPOREPACTUA'
        ParamType = ptUnknown
      end>
  end
  object qryCondResult: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    (0) AS IDCONTRATOIMOVEL,'
      '    (0) AS IDCONDRESULT,'
      '    (0) AS VLRFINANC,'
      
        '    TO_DATE(TO_CHAR(SYSDATE,'#39'DD/MM/YYYY'#39'),'#39'DD/MM/YYYY'#39') AS DATAV' +
        'ENCIMENTO,'
      
        '    TO_DATE(TO_CHAR(SYSDATE,'#39'DD/MM/YYYY'#39'),'#39'DD/MM/YYYY'#39') AS DATAI' +
        'NIAMORTIZ,'
      
        '    TO_DATE(TO_CHAR(SYSDATE,'#39'DD/MM/YYYY'#39'),'#39'DD/MM/YYYY'#39') AS DATAI' +
        'NI,'
      '    (0) AS NUMPARCELAS,'
      '    (0) AS INTERVALO,'
      '    '#39' '#39' AS PERPARC,'
      '    (0) AS INDCORR,'
      '    (0) AS INDPROJ,'
      '    '#39'          '#39' AS DSCINDCORR,'
      '    '#39'          '#39' AS DSCINDPROJ,'
      '    (0) AS JUROS,'
      '    '#39' '#39' AS PERJUROS,'
      '    (0) AS FORMACALCULO,'
      
        '    '#39'                                                           ' +
        '                                                                ' +
        '     '#39' AS DSCFORMACALCULO,'
      '    (0) AS PERPROJ,'
      '    '#39' '#39' AS FLGJURCARENCIA,'
      '    (0) AS MESREFREAJUSTE'
      'FROM  DUAL'
      'WHERE 1=2'
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
      ' '
      ' ')
    UpdateObject = updCondResult
    ValidateWithMask = True
    Left = 216
    Top = 257
    object qryCondResultVLRFINANC: TFloatField
      DisplayLabel = 'Saldo Devedor'
      DisplayWidth = 13
      FieldName = 'VLRFINANC'
      DisplayFormat = '#,##0.00'
    end
    object qryCondResultDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 13
      FieldName = 'DATAVENCIMENTO'
    end
    object qryCondResultNUMPARCELAS: TFloatField
      DisplayLabel = 'Nr. Parc'
      DisplayWidth = 8
      FieldName = 'NUMPARCELAS'
    end
    object qryCondResultINTERVALO: TFloatField
      DisplayLabel = 'Intervalo'
      DisplayWidth = 8
      FieldName = 'INTERVALO'
    end
    object qryCondResultPERPARC: TStringField
      DisplayLabel = 'Per'
      DisplayWidth = 4
      FieldName = 'PERPARC'
      FixedChar = True
      Size = 1
    end
    object qryCondResultJUROS: TFloatField
      DisplayLabel = 'Juros'
      DisplayWidth = 10
      FieldName = 'JUROS'
      DisplayFormat = '#0.0000%'
    end
    object qryCondResultDSCINDCORR: TStringField
      DisplayLabel = 'Correção'
      DisplayWidth = 11
      FieldName = 'DSCINDCORR'
      FixedChar = True
      Size = 10
    end
    object qryCondResultDSCINDPROJ: TStringField
      DisplayLabel = 'Projeção'
      DisplayWidth = 10
      FieldName = 'DSCINDPROJ'
      FixedChar = True
      Size = 10
    end
    object qryCondResultMESREFREAJUSTE: TFloatField
      DisplayLabel = 'Mes Referencia de Reajuste'
      DisplayWidth = 10
      FieldName = 'MESREFREAJUSTE'
    end
    object qryCondResultDSCFORMACALCULO: TStringField
      DisplayLabel = 'Forma de Calculo'
      DisplayWidth = 128
      FieldName = 'DSCFORMACALCULO'
      FixedChar = True
      Size = 128
    end
    object qryCondResultDATAINIAMORTIZ: TDateTimeField
      DisplayLabel = 'Prox. Amortização'
      DisplayWidth = 18
      FieldName = 'DATAINIAMORTIZ'
    end
    object qryCondResultINDCORR: TFloatField
      DisplayLabel = 'Corr'
      DisplayWidth = 10
      FieldName = 'INDCORR'
      Visible = False
    end
    object qryCondResultINDPROJ: TFloatField
      DisplayLabel = 'Proj'
      DisplayWidth = 10
      FieldName = 'INDPROJ'
      Visible = False
    end
    object qryCondResultPERJUROS: TStringField
      FieldName = 'PERJUROS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCondResultIDCONDRESULT: TFloatField
      FieldName = 'IDCONDRESULT'
      Visible = False
    end
    object qryCondResultIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryCondResultFORMACALCULO: TFloatField
      DisplayLabel = 'Forma de Calculo'
      FieldName = 'FORMACALCULO'
      Visible = False
    end
    object qryCondResultPERPROJ: TFloatField
      DisplayLabel = 'CM Projetada'
      FieldName = 'PERPROJ'
      Visible = False
    end
    object qryCondResultFLGJURCARENCIA: TStringField
      FieldName = 'FLGJURCARENCIA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCondResultDATAINI: TDateTimeField
      FieldName = 'DATAINI'
      Visible = False
    end
  end
  object dsCondResult: TwwDataSource
    AutoEdit = False
    DataSet = qryCondResult
    Left = 223
    Top = 228
  end
  object updCondResult: TUpdateSQL
    Left = 215
    Top = 230
  end
  object qryRepCondImovxOper: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDREPACTUA,'
      '     IDTIPOCUSTORECIMO,'
      '     FLGTIPOOPER,'
      
        '     '#39'                                                          ' +
        '  '#39' AS DESC_TIPOOPER,'
      '     VLROPERACAO,'
      '     OBSERVACAO,'
      '    LANCNUMLAN'
      'FROM'
      '     REPCONDIMOVXOPER'
      'WHERE'
      '     IDREPACTUA = -1'
      ''
      ' '
      ' ')
    UpdateObject = updRepCondImovXOper
    ValidateWithMask = True
    Left = 51
    Top = 194
    object qryRepCondImovxOperFLGTIPOOPER: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 5
      FieldName = 'FLGTIPOOPER'
      FixedChar = True
      Size = 1
    end
    object qryRepCondImovxOperVLROPERACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VLROPERACAO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object qryRepCondImovxOperOBSERVACAO: TStringField
      DisplayLabel = 'Observação'
      DisplayWidth = 200
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object qryRepCondImovxOperIDREPACTUA: TFloatField
      FieldName = 'IDREPACTUA'
      Visible = False
    end
    object qryRepCondImovxOperIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Visible = False
    end
    object qryRepCondImovxOperDESC_TIPOOPER: TStringField
      FieldName = 'DESC_TIPOOPER'
      FixedChar = True
      Size = 60
    end
    object qryRepCondImovxOperLANCNUMLAN: TFloatField
      FieldName = 'LANCNUMLAN'
    end
  end
  object dsRepCondImovXOper: TDataSource
    DataSet = qryRepCondImovxOper
    Left = 56
    Top = 216
  end
  object updRepCondImovXOper: TUpdateSQL
    ModifySQL.Strings = (
      'update REPCONDIMOVXOPER'
      'set'
      '  IDREPACTUA   = :IDREPACTUA,'
      '  LANCNUMLAN = :LANCNUMLAN'
      'where'
      '  IDREPACTUA = :OLD_IDREPACTUA and'
      '  IDTIPOCUSTORECIMO = :OLD_IDTIPOCUSTORECIMO')
    InsertSQL.Strings = (
      'insert into REPCONDIMOVXOPER'
      '  (IDREPACTUA, IDTIPOCUSTORECIMO, FLGTIPOOPER,'
      'VLROPERACAO,  OBSERVACAO, LANCNUMLAN)'
      'values'
      '  (:IDREPACTUA, :IDTIPOCUSTORECIMO, :FLGTIPOOPER,'
      ':VLROPERACAO,  :OBSERVACAO,  :LANCNUMLAN)')
    DeleteSQL.Strings = (
      'delete from REPCONDIMOVXOPER'
      'where'
      '  IDREPACTUA = :OLD_IDREPACTUA and'
      '  IDTIPOCUSTORECIMO = :OLD_IDTIPOCUSTORECIMO')
    Left = 59
    Top = 245
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
    Left = 616
    Top = 144
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
end
