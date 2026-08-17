inherited frmMovContratoConfissao: TfrmMovContratoConfissao
  Left = 220
  Top = 60
  HelpContext = 640016
  Caption = 'Confissão de Dívida'
  ClientHeight = 532
  ClientWidth = 827
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 827
    Height = 493
    inherited PagControle: TPageControl
      Width = 825
      Height = 491
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 817
          Caption = 'Confissão de Dívidas [Seleção]'
        end
        object grbContrato: TGroupBox
          Left = 4
          Top = 23
          Width = 807
          Height = 172
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label5: TLabel
            Left = 16
            Top = 58
            Width = 54
            Height = 13
            Caption = 'Locatário'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label1: TLabel
            Left = 16
            Top = 95
            Width = 84
            Height = 13
            Caption = 'Administradora'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 16
            Top = 131
            Width = 78
            Height = 13
            Caption = 'Responsável '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 16
            Top = 17
            Width = 67
            Height = 13
            Caption = 'Nº Contrato'
          end
          object Label21: TLabel
            Left = 147
            Top = 17
            Width = 103
            Height = 13
            Caption = 'Nome do Contrato'
          end
          object edtLocatario: TEdit
            Left = 16
            Top = 72
            Width = 600
            Height = 21
            Enabled = False
            TabOrder = 0
          end
          object edtResponsavel: TEdit
            Left = 16
            Top = 145
            Width = 600
            Height = 21
            Enabled = False
            TabOrder = 1
          end
          object edtAdministradora: TEdit
            Left = 16
            Top = 109
            Width = 600
            Height = 21
            Enabled = False
            TabOrder = 2
          end
          object edtConNumero: TEdit
            Left = 16
            Top = 33
            Width = 129
            Height = 21
            Enabled = False
            TabOrder = 3
          end
          object edtConNome: TEdit
            Left = 144
            Top = 33
            Width = 473
            Height = 21
            Enabled = False
            TabOrder = 4
          end
          object BitBtn1: TBitBtn
            Left = 624
            Top = 31
            Width = 24
            Height = 22
            Hint = 'Busca um Contrato'
            TabOrder = 5
            OnClick = BitBtn1Click
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
          object BitBtn2: TBitBtn
            Left = 648
            Top = 31
            Width = 24
            Height = 22
            Hint = 'Limpa a seleção de Contrato'
            TabOrder = 6
            OnClick = BitBtn2Click
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
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
          end
        end
        object GroupBox2: TGroupBox
          Left = 4
          Top = 195
          Width = 807
          Height = 227
          Caption = 'Parcelas Inadimplentes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Label22: TLabel
            Left = 592
            Top = 196
            Width = 88
            Height = 18
            AutoSize = False
            Caption = 'Saldo Devedor'
            WordWrap = True
          end
          object Label4: TLabel
            Left = 28
            Top = 196
            Width = 127
            Height = 15
            AutoSize = False
            Caption = 'Valores atualizado até '
            WordWrap = True
          end
          object edtSaldo: TRealEdit
            Left = 686
            Top = 191
            Width = 104
            Height = 21
            Alignment = taRightJustify
            Color = 12648447
            Enabled = False
            Lines.Strings = (
              '0,00')
            ReadOnly = True
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edtData: TEdit
            Left = 163
            Top = 193
            Width = 97
            Height = 21
            Color = 12648447
            Enabled = False
            ReadOnly = True
            TabOrder = 1
          end
          object grdParcelas: TwwDBGrid
            Left = 2
            Top = 15
            Width = 803
            Height = 167
            Selected.Strings = (
              'SELECAO'#9'1'#9'    '
              'CODDOCUMENTO'#9'8'#9'Documento'
              'DATAVENCIMENTO'#9'10'#9'Vencimento'
              'TIPORECEITA'#9'20'#9'Tipo de Receita'
              'VALOR'#9'9'#9'Valor'
              'ALT'#9'9'#9'Alteradores'
              'JUR'#9'9'#9'Juros'
              'MUL'#9'9'#9'Multa'
              'COR'#9'9'#9'Correção'
              'SALDO'#9'15'#9'Valor Devido')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
            Align = alTop
            BorderStyle = bsNone
            DataSource = dsParcInamp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 2
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            OnCalcCellColors = grdParcelasCalcCellColors
            OnDblClick = grdParcelasDblClick
            IndicatorColor = icBlack
            OnTopRowChanged = grdParcelasTopRowChanged
          end
        end
        object gbPeriodoReajuste: TGroupBox
          Left = 423
          Top = 424
          Width = 156
          Height = 58
          Caption = ' Condições'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object Label72: TLabel
            Left = 14
            Top = 14
            Width = 68
            Height = 13
            Caption = 'Resultantes'
          end
          object DBSpnQtde: TwwDBSpinEdit
            Left = 16
            Top = 30
            Width = 37
            Height = 21
            Increment = 1
            MaxValue = 1000
            MinValue = 1
            Value = 1
            DataField = 'PERIODOREAJUSTE'
            TabOrder = 0
            UnboundDataType = wwDefault
          end
        end
        object GroupBox4: TGroupBox
          Left = 287
          Top = 424
          Width = 137
          Height = 58
          Caption = ' Data da Confissão '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object edtDataConfissao: TCMDateTimePicker
            Left = 21
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
            TabOrder = 0
            OnExit = edtDataConfissaoExit
          end
        end
        object GroupBox3: TGroupBox
          Left = 4
          Top = 424
          Width = 281
          Height = 58
          Caption = 'Início da Confissão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object Label15: TLabel
            Left = 16
            Top = 14
            Width = 44
            Height = 13
            Caption = 'Mês     '
          end
          object Label3: TLabel
            Left = 205
            Top = 14
            Width = 23
            Height = 13
            Caption = 'Ano'
          end
          object cboMes: TComboBox
            Left = 16
            Top = 30
            Width = 179
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
            Left = 204
            Top = 30
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
            OnChange = cboMesChange
          end
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 817
          Caption = 'Confissão de Dívidas [Operações]'
        end
        object Label14: TLabel
          Left = 556
          Top = 90
          Width = 30
          Height = 13
          Caption = 'Valor'
        end
        object Label13: TLabel
          Left = 50
          Top = 135
          Width = 69
          Height = 13
          Caption = 'Observação'
        end
        object Label6: TLabel
          Left = 49
          Top = 355
          Width = 80
          Height = 13
          Caption = 'Saldo anterior'
        end
        object Label19: TLabel
          Left = 186
          Top = 355
          Width = 65
          Height = 13
          Caption = 'Acréscimos'
        end
        object Label8: TLabel
          Left = 287
          Top = 355
          Width = 61
          Height = 13
          Caption = 'Descontos'
        end
        object Label20: TLabel
          Left = 388
          Top = 355
          Width = 67
          Height = 13
          Caption = 'Novo Saldo'
        end
        object Panel4: TPanel
          Left = 47
          Top = 191
          Width = 545
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = '          Operações Selecionadas'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          TabStop = True
          object bbtnInsereAlterador: TBitBtn
            Left = 2
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
            OnClick = bbtnInsereAlteradorClick
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
          object btnExcluiAlterador: TBitBtn
            Left = 83
            Top = 2
            Width = 81
            Height = 25
            Caption = 'Excluir'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = btnExcluiAlteradorClick
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
        object Panel1: TPanel
          Left = 47
          Top = 55
          Width = 547
          Height = 27
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
          TabOrder = 4
          TabStop = True
        end
        object memObservacao: TMemo
          Left = 50
          Top = 149
          Width = 544
          Height = 35
          MaxLength = 200
          TabOrder = 2
        end
        inline molTipoOperacao: TmolTipoOperacao
          Left = 45
          Top = 89
          Width = 454
          Height = 45
          inherited Label5: TLabel
            Left = 6
          end
          inherited edtTipoOperacao: TEdit
            Left = 6
            Width = 380
          end
          inherited btnBuscaTipoOper: TBitBtn
            Left = 391
            OnClick = molTipoOperacaobtnBuscaTipoOperClick
          end
          inherited btnLimpaTipoOper: TBitBtn
            Left = 415
            OnClick = molTipoOperacaobtnLimpaTipoOperClick
          end
        end
        object edtValorOperacao: TDBRealEdit
          Left = 498
          Top = 106
          Width = 90
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
        object edtSaldoAnterior: TDBRealEdit
          Left = 49
          Top = 370
          Width = 113
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 5
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object edtTotAcres: TDBRealEdit
          Left = 186
          Top = 370
          Width = 98
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
        object edTotDesc: TDBRealEdit
          Left = 287
          Top = 370
          Width = 98
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '      0,00')
          TabOrder = 7
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object edtNovoSaldoOper: TDBRealEdit
          Left = 388
          Top = 370
          Width = 113
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 8
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object wwDBGrid1: TwwDBGrid
          Left = 46
          Top = 223
          Width = 545
          Height = 125
          Selected.Strings = (
            'DESC_TIPOOPER'#9'45'#9'Descrição'#9'F'
            'FLGTIPOOPER'#9'5'#9'Tipo'#9'F'
            'VLROPERACAO'#9'10'#9'Valor'#9'F'
            'OBSERVACAO'#9'200'#9'Observação'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsConfissaoXOper
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 9
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
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 2
        TabVisible = False
        object fcLabel2: TfcLabel
          Left = 0
          Top = 0
          Width = 817
          Height = 24
          Align = alTop
          Caption = 'Confissão de Dívidas [Condição ]'
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
        object GroupBox5: TGroupBox
          Left = 16
          Top = 40
          Width = 721
          Height = 328
          Caption = 'Nova Condição de Pagamento'
          TabOrder = 0
          object Label10: TLabel
            Left = 13
            Top = 18
            Width = 85
            Height = 13
            Caption = 'Saldo Devedor'
          end
          object Label23: TLabel
            Left = 119
            Top = 18
            Width = 91
            Height = 13
            Caption = 'Início Condição'
          end
          object Label9: TLabel
            Left = 229
            Top = 18
            Width = 100
            Height = 13
            Caption = 'Próx. Vencimento'
          end
          object Label11: TLabel
            Left = 339
            Top = 18
            Width = 103
            Height = 13
            Caption = 'Próx. Amortização'
          end
          object Label12: TLabel
            Left = 450
            Top = 18
            Width = 50
            Height = 13
            Caption = 'Parcelas'
          end
          object Label16: TLabel
            Left = 13
            Top = 65
            Width = 91
            Height = 13
            Caption = 'Indice Correção'
          end
          object Label17: TLabel
            Left = 279
            Top = 65
            Width = 31
            Height = 13
            Caption = 'Juros'
          end
          object Label46: TLabel
            Left = 119
            Top = 65
            Width = 96
            Height = 13
            Caption = 'Utilizar indice de'
          end
          object lblPeriod: TLabel
            Left = 402
            Top = 65
            Width = 78
            Height = 13
            Caption = 'Periodicidade'
          end
          object Label47: TLabel
            Left = 119
            Top = 83
            Width = 112
            Height = 13
            Caption = 'mes(es) anterior(es)'
          end
          object Label18: TLabel
            Left = 495
            Top = 65
            Width = 32
            Height = 13
            Caption = 'Multa'
          end
          object Label24: TLabel
            Left = 375
            Top = 82
            Width = 10
            Height = 13
            Caption = '%'
          end
          object Label25: TLabel
            Left = 595
            Top = 82
            Width = 10
            Height = 13
            Caption = '%'
          end
          object edSaldoDev: TDBRealEdit
            Left = 13
            Top = 33
            Width = 98
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
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
            OnExit = cmDataIniExit
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
            OnExit = cmDtVenctoExit
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
            OnExit = cmdtAmortizExit
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
          object gbIntervalo: TGroupBox
            Left = 512
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
          object dblcbIndCorr: TCMDBLookupCombo
            Left = 13
            Top = 80
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
          object dbEdtJuros: TDBRealEdit
            Left = 277
            Top = 80
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
            Left = 234
            Top = 80
            Width = 33
            Height = 21
            Increment = 1
            MaxValue = 9
            TabOrder = 7
            UnboundDataType = wwDefault
          end
          object dbcbPerJur: TwwDBComboBox
            Left = 396
            Top = 80
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
          object dbEdtMulta: TDBRealEdit
            Left = 493
            Top = 80
            Width = 97
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,0000000000')
            TabOrder = 10
            WordWrap = False
            IntDigits = 14
            DecDigits = 10
            NumberFormat = fNumber
            Signal = False
          end
          object Panel2: TPanel
            Left = 11
            Top = 109
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
            TabOrder = 11
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
            Top = 144
            Width = 671
            Height = 176
            Selected.Strings = (
              'SALDODEVEDOR'#9'12'#9'Saldo Devedor'
              'PROXVENCTO'#9'12'#9'Vencimento'
              'PARCELAS'#9'7'#9'Nr.Parc '
              'PRAZO'#9'10'#9'Intervalo'
              'PERIODO'#9'10'#9'Per'
              'TAXAJUROS'#9'10'#9'Juros'
              'DSCINDCORR'#9'10'#9'Correção'
              'MESREFREAJUSTE'#9'10'#9'Mes Ref.'
              'TAXAMULTA'#9'10'#9'Multa'
              'PERIODOTAXA'#9'12'#9'Per . Juros')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsCondResult
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 12
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
        end
        object Panel3: TPanel
          Left = 0
          Top = 432
          Width = 817
          Height = 49
          Align = alBottom
          TabOrder = 1
          object lblProgress: TLabel
            Left = 16
            Top = 10
            Width = 86
            Height = 13
            Caption = 'Processando...'
            Visible = False
          end
          object lblContador: TLabel
            Left = 588
            Top = 10
            Width = 93
            Height = 13
            Alignment = taRightJustify
            Caption = '00000 de 00000'
            Visible = False
          end
          object ProgressBar: TProgressBar
            Left = 16
            Top = 24
            Width = 665
            Height = 16
            Min = 0
            Max = 100
            Step = 1
            TabOrder = 0
            Visible = False
          end
        end
        object MemErro: TMemo
          Left = 18
          Top = 373
          Width = 719
          Height = 35
          Enabled = False
          MaxLength = 200
          TabOrder = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 493
    Width = 827
    inherited tb97Fundo: TToolbar97
      Left = 412
      inherited btnConfirmar: TfcShapeBtn
        OnClick = btnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      3
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object qryParcInamp: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '    (0) as SELECAO, DD.CODDOCUMENTO, DD.DATAVENCIMENTO ,TC.DESCC' +
        'USTORECIMO as TipoReceita, '
      
        '   (SELECT /*+ INDEX (L,XIE8989LANCTODOCUM)*/ SUM(L.VALOR) AS  V' +
        'ALOR'
      '      FROM LANCTODOCUM L'
      '     WHERE RTRIM(L.OPERACAO) = '#39'2'#39' '
      '       AND L.CODDOCUMENTO    = DD.CODDOCUMENTO) VALOR, '
      ''
      
        '   (SELECT /*+ INDEX (L,XIE101LANCTODOCUM) INDEX(T,XIE3TIPOIMOVE' +
        'L)*/ SUM(L.VALOR) AS JUR'
      '      FROM LANCTODOCUM L, TIPOIMOVEL T'
      '     WHERE L.CODALTERADOR = T.CODALTJUROS'
      '       AND L.CODDOCUMENTO = DD.CODDOCUMENTO) JUR, '
      '   '
      
        '   (SELECT /*+ INDEX (L,XIE101LANCTODOCUM) INDEX(T,XIE2TIPOIMOVE' +
        'L)*/ SUM(L.VALOR) AS MUL'
      '      FROM LANCTODOCUM L, TIPOIMOVEL T'
      '     WHERE L.CODALTERADOR = T.CODALTMULTA  '
      '       AND L.CODDOCUMENTO = DD.CODDOCUMENTO) MUL,    '
      '         '
      
        '   (SELECT /*+ INDEX (L,XIE101LANCTODOCUM) INDEX(T,XIE1TIPOIMOVE' +
        'L)*/ SUM(L.VALOR) AS COR'
      '      FROM LANCTODOCUM L, TIPOIMOVEL T'
      '     WHERE L.CODALTERADOR = T.CODALTCORRMON'
      '       AND L.CODDOCUMENTO = DD.CODDOCUMENTO) COR,'
      '  (To_Number(DD.TOT_RECEBER) - To_Number(DD.RECEBIDO)) as SALDO,'
      '   DD.TOT_RECEBER , DD.RECEBIDO,'
      '   (SELECT SUM(L.VALOR) AS ALT'
      '      FROM LANCTODOCUM L'
      '     WHERE  RTRIM(L.OPERACAO) = '#39'4'#39' AND L.PLNCODIGO > 0'
      '       AND L.CODDOCUMENTO = DD.CODDOCUMENTO) ALT,'
      '    C.IDCONTRATOIMOVEL'
      ''
      '   FROM CONTRATOIMOVEL C,  TIPOCUSTORECIMOV  TC ,'
      ''
      '(SELECT'
      '      LI.CODDOCUMENTO,'
      '      LI.IDCONTRATOIMOVEL,'
      '      LI.DATAVENCIMENTO,'
      '      LI.DATALIMITE,'
      '      LI.CODTIPIMOVEL,'
      '      LI.IDTIPOCUSTORECIMO ,'
      '      SUM('
      
        '          DECODE(RTRIM(LD.OPERACAO),  '#39'1'#39', DECODE(D.RECPAG, '#39'R'#39',' +
        'DECODE(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)),' +
        ' 0), 0) +'
      
        '          DECODE(RTRIM(LD.OPERACAO),  '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39',' +
        'DECODE(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)),' +
        ' 0), 0) +'
      
        '          DECODE(RTRIM(LD.OPERACAO),  '#39'3'#39', DECODE(D.RECPAG, '#39'R'#39',' +
        'DECODE(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)),' +
        ' 0), 0) +'
      
        '          DECODE(RTRIM(LD.OPERACAO),  '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39',' +
        'DECODE(LD.DEBCRE, '#39'D'#39', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, L' +
        'D.VALOR * (-1)'
      '* LI.VLRLANCRECEB / TRD.VALOR), 0), 0)'
      '      ) AS TOT_RECEBER,'
      '      NVL(SUM('
      
        '        DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', LD' +
        '.VALOR, 0), 0)'
      '* LI.VLRLANCRECEB / TRD.VALOR'
      '        ),0) AS RECEBIDO'
      
        '    FROM DOCUMENTO D, LANCTODOCUM LD, LANCAMENTOSIMOVEL LI, TIPO' +
        'IMOVEL T, CONTRATOIMOVEL C,'
      
        '         (SELECT L.CODDOCUMENTO, DECODE(L.VALOR, 0, 1, L.VALOR) ' +
        'AS VALOR'
      '            FROM LANCTODOCUM L'
      '           WHERE RTRIM(L.OPERACAO) = '#39'1'#39' OR'
      '                 RTRIM(L.OPERACAO) = '#39'2'#39' OR'
      '                 RTRIM(L.OPERACAO) = '#39'3'#39') TRD'
      '   WHERE'
      '         (C.IDCONTRATOIMOVEL = :pIDCONTRATOIMOVEL)'
      '     AND ( D.RECPAG = '#39'R'#39')'
      
        '     AND ( C.FLGTIPOCONTRATO IN ('#39'L'#39','#39'D'#39') OR LI.IDCONTRATOIMOVEL' +
        ' IS NULL )'
      '     AND ( LD.ESTORNO IS NULL )'
      '     AND ( LI.FLGESTORNADO IS NULL )'
      '     AND ( LI.CODDOCUMENTO NOT IN ( SELECT CC.IDDOCUMENTO'
      '                                      FROM CONCILIADOC CC'
      '                                     WHERE CC.FLGTIPO = '#39'A'#39
      
        '                                       AND CC.IDPARCFINANCIMOV I' +
        'S NULL'
      '                                       AND DATA <= SYSDATE ) )'
      ''
      '     AND ( D.DATAVENCTO <= SYSDATE )'
      '     AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )'
      '     AND ( D.CODDOCUMENTO  = LD.CODDOCUMENTO )'
      '     AND ( D.CODDOCUMENTO  = TRD.CODDOCUMENTO )'
      '     AND ( D.STATUS <> 2 )'
      '     AND ( LI.CODTIPIMOVEL = T.CODTIPIMOVEL )'
      '     AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) )'
      
        '   --  AND (  LD.DATALANCTO > TO_DATE('#39'31/12/2004'#39','#39'DD/MM/YYYY'#39')' +
        ')'
      
        'GROUP BY  LI.CODDOCUMENTO,  LI.IDCONTRATOIMOVEL,LI.DATAVENCIMENT' +
        'O,'
      '      LI.DATALIMITE, LI.CODTIPIMOVEL,  LI.IDTIPOCUSTORECIMO'
      '      ) DD'
      'WHERE  ( DD.IDCONTRATOIMOVEL = :pIDCONTRATOIMOVEL)'
      '   AND ( DD.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      '   AND ( DD.IDTIPOCUSTORECIMO = TC.IDTIPOCUSTORECIMO )'
      '   AND ( DD.IDTIPOCUSTORECIMO <> 196)'
      
        '   AND ( (To_Number(DD.TOT_RECEBER) - To_Number(DD.RECEBIDO)) > ' +
        '0)'
      'order by DD.DATAVENCIMENTO'
      ''
      ' ')
    UpdateObject = UpdParcInamp
    ControlType.Strings = (
      'SELECAO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 522
    Top = 231
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryParcInampSELECAO: TFloatField
      DisplayLabel = '    '
      DisplayWidth = 1
      FieldName = 'SELECAO'
    end
    object qryParcInampCODDOCUMENTO: TFloatField
      DisplayLabel = 'Documento'
      DisplayWidth = 8
      FieldName = 'CODDOCUMENTO'
    end
    object qryParcInampDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 10
      FieldName = 'DATAVENCIMENTO'
    end
    object qryParcInampTIPORECEITA: TStringField
      DisplayLabel = 'Tipo de Receita'
      DisplayWidth = 20
      FieldName = 'TIPORECEITA'
      Size = 60
    end
    object qryParcInampVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 9
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
    object qryParcInampALT: TFloatField
      DisplayLabel = 'Alteradores'
      DisplayWidth = 9
      FieldName = 'ALT'
    end
    object qryParcInampJUR: TFloatField
      DisplayLabel = 'Juros'
      DisplayWidth = 9
      FieldName = 'JUR'
    end
    object qryParcInampMUL: TFloatField
      DisplayLabel = 'Multa'
      DisplayWidth = 9
      FieldName = 'MUL'
    end
    object qryParcInampCOR: TFloatField
      DisplayLabel = 'Correção'
      DisplayWidth = 9
      FieldName = 'COR'
    end
    object qryParcInampSALDO: TFloatField
      DisplayLabel = 'Valor Devido'
      DisplayWidth = 15
      FieldName = 'SALDO'
      DisplayFormat = '#,##0.00'
    end
    object qryParcInampIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryParcInampRECEBIDO: TFloatField
      DisplayWidth = 10
      FieldName = 'RECEBIDO'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryParcInampTOT_RECEBER: TFloatField
      DisplayWidth = 10
      FieldName = 'TOT_RECEBER'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
  end
  object dsParcInamp: TwwDataSource
    AutoEdit = False
    DataSet = qryParcInamp
    Left = 518
    Top = 321
  end
  object qryContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' PL.NOME AS LOCATARIO, '
      ' PR.NOME AS RESPONSAVEL, '
      ' PA.NOME AS ADMINISTRADORA,'
      ' C.IDCONTRATOIMOVEL,'
      ' C.CONDATAASSINATURA,'
      ' I.CODTIPIMOVEL,'
      ' C.CONNUMERO,'
      ' C.CONNOME,'
      ' C.IDCONTRATOIMOVEL,'
      ' C.CODPORTFORMA,'
      ' C.IDLOCATARIO'
      'FROM PESSOA PR,       '
      '     PESSOA PL,    '
      '     PESSOA PA,    '
      '     CONTRATOIMOVEL C,'
      '     CONTRATOXIMOVEL CI,'
      '     IMOVEL I'
      'WHERE (C.IDRESPONSAVEL = PR.IDPESSOA(+))'
      ' AND  (C.IDLOCATARIO = PL.IDPESSOA(+))'
      ' AND  (C.Idadminimovel = PA.IDPESSOA(+))'
      ' AND  (C.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      ' AND  (CI.IDIMOVEL = I.IDIMOVEL)'
      ' AND  (C.FLGSTATUS = '#39'V'#39')'
      ' AND  (C.IDCONTRATOIMOVEL = :pIDCONTRATOIMOVEL)'
      ''
      ''
      ''
      ' ')
    ControlType.Strings = (
      'SELECAO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 436
    Top = 7
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryContratoLOCATARIO: TStringField
      FieldName = 'LOCATARIO'
      Size = 60
    end
    object qryContratoRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Size = 60
    end
    object qryContratoADMINISTRADORA: TStringField
      FieldName = 'ADMINISTRADORA'
      Size = 60
    end
    object qryContratoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryContratoCONDATAASSINATURA: TDateTimeField
      FieldName = 'CONDATAASSINATURA'
    end
    object qryContratoCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryContratoCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryContratoCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 100
    end
    object qryContratoIDCONTRATOIMOVEL_1: TFloatField
      FieldName = 'IDCONTRATOIMOVEL_1'
    end
    object qryContratoCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object qryContratoIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
    end
  end
  object qryParamImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from PARAMIMOVEL')
    ControlType.Strings = (
      'SELECAO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 364
    Top = 7
    object qryParamImovelIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDPESSOA'
    end
    object qryParamImovelCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'BASEDADOS.PARAMIMOVEL.CODCENTRORESPON'
      FixedChar = True
      Size = 10
    end
    object qryParamImovelUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'BASEDADOS.PARAMIMOVEL.UNIDNEGOC'
    end
    object qryParamImovelCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'BASEDADOS.PARAMIMOVEL.CODPORTFORMA'
    end
    object qryParamImovelFLGINTEGRACONTAB: TFloatField
      FieldName = 'FLGINTEGRACONTAB'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGINTEGRACONTAB'
    end
    object qryParamImovelFLGINTEGRACAPCAR: TFloatField
      FieldName = 'FLGINTEGRACAPCAR'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGINTEGRACAPCAR'
    end
    object qryParamImovelFLGINTEGRAGESTAO: TFloatField
      FieldName = 'FLGINTEGRAGESTAO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGINTEGRAGESTAO'
    end
    object qryParamImovelFLGINTEGRAATIVO: TFloatField
      FieldName = 'FLGINTEGRAATIVO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGINTEGRAATIVO'
    end
    object qryParamImovelFLGUSASCIMOVEL: TFloatField
      FieldName = 'FLGUSASCIMOVEL'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGUSASCIMOVEL'
    end
    object qryParamImovelFLGUSASCLOCATARIO: TFloatField
      FieldName = 'FLGUSASCLOCATARIO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGUSASCLOCATARIO'
    end
    object qryParamImovelFLGALIMENTAALTER: TFloatField
      FieldName = 'FLGALIMENTAALTER'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGALIMENTAALTER'
    end
    object qryParamImovelFLGALIMENTADATA: TStringField
      FieldName = 'FLGALIMENTADATA'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGALIMENTADATA'
      FixedChar = True
      Size = 1
    end
    object qryParamImovelFLGALIMENTADEPREC: TFloatField
      FieldName = 'FLGALIMENTADEPREC'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGALIMENTADEPREC'
    end
    object qryParamImovelPRAZOAVISO: TFloatField
      FieldName = 'PRAZOAVISO'
      Origin = 'BASEDADOS.PARAMIMOVEL.PRAZOAVISO'
    end
    object qryParamImovelFLGAUTORESCISAO: TFloatField
      FieldName = 'FLGAUTORESCISAO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGAUTORESCISAO'
    end
    object qryParamImovelFLGMESPOSTERIOR: TFloatField
      FieldName = 'FLGMESPOSTERIOR'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGMESPOSTERIOR'
    end
    object qryParamImovelFLGCONCATENAANO: TFloatField
      FieldName = 'FLGCONCATENAANO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGCONCATENAANO'
    end
    object qryParamImovelFLGSUGERECONTRATO: TFloatField
      FieldName = 'FLGSUGERECONTRATO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGSUGERECONTRATO'
    end
    object qryParamImovelFLGEXIBELABELCOBR: TFloatField
      FieldName = 'FLGEXIBELABELCOBR'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGEXIBELABELCOBR'
    end
    object qryParamImovelFLGINTEGRARECEB: TFloatField
      FieldName = 'FLGINTEGRARECEB'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGINTEGRARECEB'
    end
    object qryParamImovelFLGGERATXADMIN: TFloatField
      FieldName = 'FLGGERATXADMIN'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGGERATXADMIN'
    end
    object qryParamImovelNOMEVLRAQUISICAO: TStringField
      FieldName = 'NOMEVLRAQUISICAO'
      Origin = 'BASEDADOS.PARAMIMOVEL.NOMEVLRAQUISICAO'
      Size = 30
    end
    object qryParamImovelFLGINTEGRAPAG: TFloatField
      FieldName = 'FLGINTEGRAPAG'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGINTEGRAPAG'
    end
    object qryParamImovelFLGINTEGRAFOLHA: TFloatField
      FieldName = 'FLGINTEGRAFOLHA'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGINTEGRAFOLHA'
    end
    object qryParamImovelQTDEMESPREVFOLHA: TFloatField
      FieldName = 'QTDEMESPREVFOLHA'
      Origin = 'BASEDADOS.PARAMIMOVEL.QTDEMESPREVFOLHA'
    end
    object qryParamImovelPROXNUMCONTRATO: TFloatField
      FieldName = 'PROXNUMCONTRATO'
      Origin = 'BASEDADOS.PARAMIMOVEL.PROXNUMCONTRATO'
    end
    object qryParamImovelFLGOBRIGATIVIDADE: TFloatField
      FieldName = 'FLGOBRIGATIVIDADE'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGOBRIGATIVIDADE'
    end
    object qryParamImovelFLGVENCDIAUTIL: TFloatField
      FieldName = 'FLGVENCDIAUTIL'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGVENCDIAUTIL'
    end
    object qryParamImovelFLGTOLERACOMPL: TFloatField
      FieldName = 'FLGTOLERACOMPL'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGTOLERACOMPL'
    end
    object qryParamImovelFLGREAVALMERCADO: TFloatField
      FieldName = 'FLGREAVALMERCADO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGREAVALMERCADO'
    end
    object qryParamImovelFLGOBRIGACONTRATO: TFloatField
      FieldName = 'FLGOBRIGACONTRATO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGOBRIGACONTRATO'
    end
    object qryParamImovelFLGCOMISSAOALT: TFloatField
      FieldName = 'FLGCOMISSAOALT'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGCOMISSAOALT'
    end
    object qryParamImovelFLGLANCRESCINDIDO: TFloatField
      FieldName = 'FLGLANCRESCINDIDO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGLANCRESCINDIDO'
    end
    object qryParamImovelFLGOBRIGAALTTIPO: TFloatField
      FieldName = 'FLGOBRIGAALTTIPO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGOBRIGAALTTIPO'
    end
    object qryParamImovelFLGINTEGRAORCAMEN: TFloatField
      FieldName = 'FLGINTEGRAORCAMEN'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGINTEGRAORCAMEN'
    end
    object qryParamImovelIDTCUSTORECIMOCOM: TFloatField
      FieldName = 'IDTCUSTORECIMOCOM'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDTCUSTORECIMOCOM'
    end
    object qryParamImovelFLGUSAAP: TFloatField
      FieldName = 'FLGUSAAP'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGUSAAP'
    end
    object qryParamImovelIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDPROGRAMA'
    end
    object qryParamImovelIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDEMPRESA'
    end
    object qryParamImovelCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'BASEDADOS.PARAMIMOVEL.CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object qryParamImovelFLGREEMBOLSOAUT: TFloatField
      FieldName = 'FLGREEMBOLSOAUT'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGREEMBOLSOAUT'
    end
    object qryParamImovelFLGLANCPAGENCERRA: TFloatField
      FieldName = 'FLGLANCPAGENCERRA'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGLANCPAGENCERRA'
    end
    object qryParamImovelFLGLANCRECENCERRA: TFloatField
      FieldName = 'FLGLANCRECENCERRA'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGLANCRECENCERRA'
    end
    object qryParamImovelFLGALUGUELZERO: TFloatField
      FieldName = 'FLGALUGUELZERO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGALUGUELZERO'
    end
    object qryParamImovelFLGCONSIDERARESP: TFloatField
      FieldName = 'FLGCONSIDERARESP'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGCONSIDERARESP'
    end
    object qryParamImovelFLGFILTRAREAJUSTE: TFloatField
      FieldName = 'FLGFILTRAREAJUSTE'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGFILTRAREAJUSTE'
    end
    object qryParamImovelFLGFILTRAENCERRA: TFloatField
      FieldName = 'FLGFILTRAENCERRA'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGFILTRAENCERRA'
    end
    object qryParamImovelFLGDIAUTILAP: TStringField
      FieldName = 'FLGDIAUTILAP'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGDIAUTILAP'
      FixedChar = True
      Size = 1
    end
    object qryParamImovelFLGALTERAEVENTO: TFloatField
      FieldName = 'FLGALTERAEVENTO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGALTERAEVENTO'
    end
    object qryParamImovelFLGEVENTOUSUARIO: TFloatField
      FieldName = 'FLGEVENTOUSUARIO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGEVENTOUSUARIO'
    end
    object qryParamImovelFLGPARTPIM: TFloatField
      FieldName = 'FLGPARTPIM'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGPARTPIM'
    end
    object qryParamImovelFLGPARTPDES: TFloatField
      FieldName = 'FLGPARTPDES'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGPARTPDES'
    end
    object qryParamImovelFLGPARIM: TFloatField
      FieldName = 'FLGPARIM'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGPARIM'
    end
    object qryParamImovelFLGPARCON: TFloatField
      FieldName = 'FLGPARCON'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGPARCON'
    end
    object qryParamImovelFLGPARTDTPIM: TFloatField
      FieldName = 'FLGPARTDTPIM'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGPARTDTPIM'
    end
    object qryParamImovelFLGPARTDIM: TFloatField
      FieldName = 'FLGPARTDIM'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGPARTDIM'
    end
    object qryParamImovelFLGPARTDCON: TFloatField
      FieldName = 'FLGPARTDCON'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGPARTDCON'
    end
    object qryParamImovelIDPESSOALOC: TFloatField
      FieldName = 'IDPESSOALOC'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDPESSOALOC'
    end
    object qryParamImovelIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDLOCALIZACAO'
    end
    object qryParamImovelIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDCLASSEBEM'
    end
    object qryParamImovelFLGMULTITIPO: TFloatField
      FieldName = 'FLGMULTITIPO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGMULTITIPO'
    end
    object qryParamImovelIDSITUACAO: TFloatField
      FieldName = 'IDSITUACAO'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDSITUACAO'
    end
    object qryParamImovelIDRECALIENACAO: TFloatField
      FieldName = 'IDRECALIENACAO'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDRECALIENACAO'
    end
    object qryParamImovelIDDESPAQUISICAO: TFloatField
      FieldName = 'IDDESPAQUISICAO'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDDESPAQUISICAO'
    end
    object qryParamImovelFLGHISTCONTDIFAP: TFloatField
      FieldName = 'FLGHISTCONTDIFAP'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGHISTCONTDIFAP'
    end
    object qryParamImovelIDRECAMORTEXTRA: TFloatField
      FieldName = 'IDRECAMORTEXTRA'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDRECAMORTEXTRA'
    end
    object qryParamImovelIDRECPROJECAO: TFloatField
      FieldName = 'IDRECPROJECAO'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDRECPROJECAO'
    end
    object qryParamImovelIDRECAVISTA: TFloatField
      FieldName = 'IDRECAVISTA'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDRECAVISTA'
    end
    object qryParamImovelIDRECSINAL: TFloatField
      FieldName = 'IDRECSINAL'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDRECSINAL'
    end
    object qryParamImovelIDRECCORRECAO: TFloatField
      FieldName = 'IDRECCORRECAO'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDRECCORRECAO'
    end
    object qryParamImovelIDRECJUROS: TFloatField
      FieldName = 'IDRECJUROS'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDRECJUROS'
    end
    object qryParamImovelIDRECAMORTIZACAO: TFloatField
      FieldName = 'IDRECAMORTIZACAO'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDRECAMORTIZACAO'
    end
    object qryParamImovelCODALTJUROS: TFloatField
      FieldName = 'CODALTJUROS'
      Origin = 'BASEDADOS.PARAMIMOVEL.CODALTJUROS'
    end
    object qryParamImovelCODALTCORRECAO: TFloatField
      FieldName = 'CODALTCORRECAO'
      Origin = 'BASEDADOS.PARAMIMOVEL.CODALTCORRECAO'
    end
    object qryParamImovelCODALTMULTA: TFloatField
      FieldName = 'CODALTMULTA'
      Origin = 'BASEDADOS.PARAMIMOVEL.CODALTMULTA'
    end
    object qryParamImovelFLGNUMPROPOSTA: TFloatField
      FieldName = 'FLGNUMPROPOSTA'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGNUMPROPOSTA'
    end
    object qryParamImovelCODTIPIMOVELOBRA: TStringField
      FieldName = 'CODTIPIMOVELOBRA'
      Origin = 'BASEDADOS.PARAMIMOVEL.CODTIPIMOVELOBRA'
      Size = 5
    end
    object qryParamImovelIDRECPERDAS: TFloatField
      FieldName = 'IDRECPERDAS'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDRECPERDAS'
    end
    object qryParamImovelFLGINTCAFCONT: TFloatField
      FieldName = 'FLGINTCAFCONT'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGINTCAFCONT'
    end
    object qryParamImovelFLGDIARIO: TStringField
      FieldName = 'FLGDIARIO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGDIARIO'
      FixedChar = True
      Size = 1
    end
    object qryParamImovelMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
      Origin = 'BASEDADOS.PARAMIMOVEL.MESCOMPETENCIA'
    end
    object qryParamImovelANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
      Origin = 'BASEDADOS.PARAMIMOVEL.ANOCOMPETENCIA'
    end
    object qryParamImovelFLGUSAINVESTIMOB: TStringField
      FieldName = 'FLGUSAINVESTIMOB'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGUSAINVESTIMOB'
      FixedChar = True
      Size = 1
    end
    object qryParamImovelFLGLANCRECINATIVO: TFloatField
      FieldName = 'FLGLANCRECINATIVO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGLANCRECINATIVO'
    end
    object qryParamImovelMESBLOQLANCTO: TFloatField
      FieldName = 'MESBLOQLANCTO'
      Origin = 'BASEDADOS.PARAMIMOVEL.MESBLOQLANCTO'
    end
    object qryParamImovelIDTCUSTORECIMOALU: TFloatField
      FieldName = 'IDTCUSTORECIMOALU'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDTCUSTORECIMOALU'
    end
    object qryParamImovelFLGLANCPAGINATIVO: TStringField
      FieldName = 'FLGLANCPAGINATIVO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGLANCPAGINATIVO'
      FixedChar = True
      Size = 1
    end
    object qryParamImovelFLGAVISORESPON: TStringField
      FieldName = 'FLGAVISORESPON'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGAVISORESPON'
      FixedChar = True
      Size = 1
    end
    object qryParamImovelFLGAVISOENCALUG: TStringField
      FieldName = 'FLGAVISOENCALUG'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGAVISOENCALUG'
      FixedChar = True
      Size = 1
    end
    object qryParamImovelFLGAVISOREVALUG: TStringField
      FieldName = 'FLGAVISOREVALUG'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGAVISOREVALUG'
      FixedChar = True
      Size = 1
    end
    object qryParamImovelFLGAVISOREAALUG: TStringField
      FieldName = 'FLGAVISOREAALUG'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGAVISOREAALUG'
      FixedChar = True
      Size = 1
    end
    object qryParamImovelFLGAVISO: TStringField
      FieldName = 'FLGAVISO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGAVISO'
      FixedChar = True
      Size = 1
    end
    object qryParamImovelDIASAVISO: TFloatField
      FieldName = 'DIASAVISO'
      Origin = 'BASEDADOS.PARAMIMOVEL.DIASAVISO'
    end
    object qryParamImovelFLGAVISOENCSEGUR: TStringField
      FieldName = 'FLGAVISOENCSEGUR'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGAVISOENCSEGUR'
      FixedChar = True
      Size = 1
    end
    object qryParamImovelFLGAVISOENCFIANCA: TStringField
      FieldName = 'FLGAVISOENCFIANCA'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGAVISOENCFIANCA'
      FixedChar = True
      Size = 1
    end
    object qryParamImovelTIPOIMOVELPATRO: TStringField
      FieldName = 'TIPOIMOVELPATRO'
      Origin = 'BASEDADOS.PARAMIMOVEL.TIPOIMOVELPATRO'
      Size = 5
    end
    object qryParamImovelIDGRUPOREGRA: TFloatField
      FieldName = 'IDGRUPOREGRA'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDGRUPOREGRA'
    end
    object qryParamImovelFLGAVISOCOBR: TStringField
      FieldName = 'FLGAVISOCOBR'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGAVISOCOBR'
      FixedChar = True
      Size = 1
    end
    object qryParamImovelDIASAVISOCOBR: TFloatField
      FieldName = 'DIASAVISOCOBR'
      Origin = 'BASEDADOS.PARAMIMOVEL.DIASAVISOCOBR'
    end
    object qryParamImovelFLGPREVFOLHA: TFloatField
      FieldName = 'FLGPREVFOLHA'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGPREVFOLHA'
    end
    object qryParamImovelIDOPERATUALCM: TFloatField
      FieldName = 'IDOPERATUALCM'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDOPERATUALCM'
    end
    object qryParamImovelIDOPERATUALJUROS: TFloatField
      FieldName = 'IDOPERATUALJUROS'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDOPERATUALJUROS'
    end
    object qryParamImovelIDOPERPROVPER: TFloatField
      FieldName = 'IDOPERPROVPER'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDOPERPROVPER'
    end
    object qryParamImovelIDOPERATUALMULTA: TFloatField
      FieldName = 'IDOPERATUALMULTA'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDOPERATUALMULTA'
    end
    object qryParamImovelFLGLANCFORACOMP: TStringField
      FieldName = 'FLGLANCFORACOMP'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGLANCFORACOMP'
      FixedChar = True
      Size = 1
    end
    object qryParamImovelIDOPERPROVREC: TFloatField
      FieldName = 'IDOPERPROVREC'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDOPERPROVREC'
    end
    object qryParamImovelFLGLOGORELAT: TStringField
      FieldName = 'FLGLOGORELAT'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGLOGORELAT'
      FixedChar = True
      Size = 1
    end
    object qryParamImovelIDCARTACOBRANCA3: TFloatField
      FieldName = 'IDCARTACOBRANCA3'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDCARTACOBRANCA3'
    end
    object qryParamImovelIDCARTACOBRANCA2: TFloatField
      FieldName = 'IDCARTACOBRANCA2'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDCARTACOBRANCA2'
    end
    object qryParamImovelIDCARTACOBRANCA1: TFloatField
      FieldName = 'IDCARTACOBRANCA1'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDCARTACOBRANCA1'
    end
    object qryParamImovelIDCARTACOBRANCA4: TFloatField
      FieldName = 'IDCARTACOBRANCA4'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDCARTACOBRANCA4'
    end
    object qryParamImovelFLGCALCINADIMP: TStringField
      FieldName = 'FLGCALCINADIMP'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGCALCINADIMP'
      FixedChar = True
      Size = 1
    end
    object qryParamImovelIDREGRAMULTA: TFloatField
      FieldName = 'IDREGRAMULTA'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDREGRAMULTA'
    end
    object qryParamImovelFLGBLOQRECALUGUEL: TFloatField
      FieldName = 'FLGBLOQRECALUGUEL'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGBLOQRECALUGUEL'
    end
    object qryParamImovelFLGATUALDATAPROG: TFloatField
      FieldName = 'FLGATUALDATAPROG'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGATUALDATAPROG'
    end
    object qryParamImovelFLGTIPODATAPROG: TStringField
      FieldName = 'FLGTIPODATAPROG'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGTIPODATAPROG'
      FixedChar = True
      Size = 1
    end
    object qryParamImovelIDOPERABONOMULTA: TFloatField
      FieldName = 'IDOPERABONOMULTA'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDOPERABONOMULTA'
    end
    object qryParamImovelIDOPERABONOJUROS: TFloatField
      FieldName = 'IDOPERABONOJUROS'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDOPERABONOJUROS'
    end
    object qryParamImovelIDOPERABONOCM: TFloatField
      FieldName = 'IDOPERABONOCM'
      Origin = 'BASEDADOS.PARAMIMOVEL.IDOPERABONOCM'
    end
    object qryParamImovelFLGINDMESANTERIOR: TFloatField
      FieldName = 'FLGINDMESANTERIOR'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGINDMESANTERIOR'
    end
    object qryParamImovelMASCARACOMPL: TStringField
      FieldName = 'MASCARACOMPL'
      Origin = 'BASEDADOS.PARAMIMOVEL.MASCARACOMPL'
      FixedChar = True
      Size = 15
    end
    object qryParamImovelFLGREGEVENTO: TFloatField
      FieldName = 'FLGREGEVENTO'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGREGEVENTO'
    end
    object qryParamImovelFLGBLOQDTLANC: TFloatField
      FieldName = 'FLGBLOQDTLANC'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGBLOQDTLANC'
    end
    object qryParamImovelFLGUSAUNIDADE: TFloatField
      FieldName = 'FLGUSAUNIDADE'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGUSAUNIDADE'
    end
    object qryParamImovelDTULTFECH: TDateTimeField
      FieldName = 'DTULTFECH'
      Origin = 'BASEDADOS.PARAMIMOVEL.DTULTFECH'
    end
    object qryParamImovelFLGAUTCOD: TStringField
      FieldName = 'FLGAUTCOD'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGAUTCOD'
      Size = 1
    end
    object qryParamImovelFLGVALCOD: TStringField
      FieldName = 'FLGVALCOD'
      Origin = 'BASEDADOS.PARAMIMOVEL.FLGVALCOD'
      Size = 1
    end
  end
  object UpdParcInamp: TUpdateSQL
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
    Left = 518
    Top = 273
  end
  object qryConfissaoXOper: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT     '
      '    IDCONFISSAODIVIDA,'
      '    IDTIPOCUSTORECIMO,'
      '    FLGTIPOOPER,'
      '    VLROPERACAO,'
      '    OBSERVACAO,'
      '    LANCNUMLAN,'
      '    IDMODULO,'
      
        '    '#39'                                                           ' +
        ' '#39' AS DESC_TIPOOPER'
      'FROM'
      '     CONFISSAOXOPER'
      'WHERE'
      '     IDCONFISSAODIVIDA = -1'
      ''
      ' '
      ' ')
    UpdateObject = upConfissaoXOper
    ValidateWithMask = True
    Left = 218
    Top = 226
    object qryConfissaoXOperDESC_TIPOOPER: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 45
      FieldName = 'DESC_TIPOOPER'
      FixedChar = True
      Size = 60
    end
    object qryConfissaoXOperFLGTIPOOPER: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 5
      FieldName = 'FLGTIPOOPER'
      FixedChar = True
      Size = 1
    end
    object qryConfissaoXOperVLROPERACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VLROPERACAO'
      DisplayFormat = '#,##0.00'
    end
    object qryConfissaoXOperOBSERVACAO: TStringField
      DisplayLabel = 'Observação'
      DisplayWidth = 200
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object qryConfissaoXOperIDCONFISSAODIVIDA: TFloatField
      FieldName = 'IDCONFISSAODIVIDA'
      Visible = False
    end
    object qryConfissaoXOperIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Visible = False
    end
    object qryConfissaoXOperLANCNUMLAN: TFloatField
      FieldName = 'LANCNUMLAN'
      Visible = False
    end
    object qryConfissaoXOperIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Visible = False
    end
  end
  object dsConfissaoXOper: TDataSource
    DataSet = qryConfissaoXOper
    Left = 215
    Top = 312
  end
  object upConfissaoXOper: TUpdateSQL
    ModifySQL.Strings = (
      'update cm.confissaoxoper'
      '   set idconfissaodivida = :idconfissaodivida,'
      '       idtipocustorecimo = :idtipocustorecimo,'
      '       flgtipooper = :flgtipooper,'
      '       vlroperacao = :vlroperacao,'
      '       observacao = :observacao,'
      '       idmodulo = :idmodulo'
      ' where idconfissaodivida = :idconfissaodivida'
      '   and idtipocustorecimo = :idtipocustorecimo')
    InsertSQL.Strings = (
      'insert into cm.confissaoxoper'
      
        '  (idconfissaodivida, idtipocustorecimo, flgtipooper, vlroperaca' +
        'o, observacao, '
      ' idmodulo)'
      'values'
      
        '  ( :idconfissaodivida, :idtipocustorecimo, :flgtipooper, :vlrop' +
        'eracao, '
      '    :observacao,  :idmodulo)')
    DeleteSQL.Strings = (
      'delete cm.confissaoxoper'
      ' where idconfissaodivida = :idconfissaodivida'
      '   and idtipocustorecimo = :idtipocustorecimo')
    Left = 218
    Top = 269
  end
  object dsCondResult: TwwDataSource
    AutoEdit = False
    DataSet = qryCondResult
    Left = 599
    Top = 323
  end
  object updCondResult: TUpdateSQL
    Left = 599
    Top = 278
  end
  object qryCondResult: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT (0) AS IDCONDRESULT ,  '
      '       (0) AS IDCONFISSAODIVIDA    ,  '
      '       (0) AS SALDODEVEDOR         ,'
      
        '       TO_DATE(TO_CHAR(SYSDATE,'#39'DD/MM/YYYY'#39'),'#39'DD/MM/YYYY'#39') AS IN' +
        'ICIOCONFISSAO      ,  '
      
        '       TO_DATE(TO_CHAR(SYSDATE,'#39'DD/MM/YYYY'#39'),'#39'DD/MM/YYYY'#39') AS PR' +
        'OXVENCTO           ,  '
      
        '       TO_DATE(TO_CHAR(SYSDATE,'#39'DD/MM/YYYY'#39'),'#39'DD/MM/YYYY'#39') AS PR' +
        'OXAMORTIZACAO      ,'
      '       (0) AS PARCELAS             ,  '
      '       (0) AS PERIODO              ,  '
      '        '#39'          '#39' AS PRAZO       ,'
      '       (0) AS INDCORRECAO          ,  '
      '       '#39'          '#39' AS DSCINDCORR  ,'
      '       (0) AS MESREFREAJUSTE       ,  '
      '       (0) AS TAXAJUROS            ,'
      '         '#39'          '#39' AS PERIODOTAXA,  '
      '       (0) AS TAXAMULTA            ,  '
      '       (0) AS IDMODULO    '
      'FROM  DUAL'
      'WHERE 1=2'
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
    Left = 600
    Top = 233
    object qryCondResultSALDODEVEDOR: TFloatField
      DisplayLabel = 'Saldo Devedor'
      DisplayWidth = 12
      FieldName = 'SALDODEVEDOR'
      DisplayFormat = '#,##0.00'
    end
    object qryCondResultPROXVENCTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 12
      FieldName = 'PROXVENCTO'
    end
    object qryCondResultPARCELAS: TFloatField
      DisplayLabel = 'Nr.Parc '
      DisplayWidth = 7
      FieldName = 'PARCELAS'
    end
    object qryCondResultPRAZO: TStringField
      DisplayLabel = 'Intervalo'
      DisplayWidth = 10
      FieldName = 'PRAZO'
      FixedChar = True
      Size = 10
    end
    object qryCondResultPERIODO: TFloatField
      DisplayLabel = 'Per'
      DisplayWidth = 10
      FieldName = 'PERIODO'
    end
    object qryCondResultTAXAJUROS: TFloatField
      DisplayLabel = 'Juros'
      DisplayWidth = 10
      FieldName = 'TAXAJUROS'
    end
    object qryCondResultDSCINDCORR: TStringField
      DisplayLabel = 'Correção'
      DisplayWidth = 10
      FieldName = 'DSCINDCORR'
      FixedChar = True
      Size = 10
    end
    object qryCondResultMESREFREAJUSTE: TFloatField
      DisplayLabel = 'Mes Ref.'
      DisplayWidth = 10
      FieldName = 'MESREFREAJUSTE'
    end
    object qryCondResultTAXAMULTA: TFloatField
      DisplayLabel = 'Multa'
      DisplayWidth = 10
      FieldName = 'TAXAMULTA'
    end
    object qryCondResultPERIODOTAXA: TStringField
      DisplayLabel = 'Per . Juros'
      DisplayWidth = 12
      FieldName = 'PERIODOTAXA'
      FixedChar = True
      Size = 10
    end
    object qryCondResultIDMODULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryCondResultINDCORRECAO: TFloatField
      DisplayWidth = 10
      FieldName = 'INDCORRECAO'
      Visible = False
    end
    object qryCondResultIDCONDRESULT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDRESULT'
      Visible = False
    end
    object qryCondResultIDCONFISSAODIVIDA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONFISSAODIVIDA'
      Visible = False
    end
    object qryCondResultINICIOCONFISSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'INICIOCONFISSAO'
      Visible = False
    end
    object qryCondResultPROXAMORTIZACAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'PROXAMORTIZACAO'
      Visible = False
    end
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
    Left = 5
    Top = 122
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
  object qryBaixaContraAlterador: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * '
      'FROM BAIXACONTRAALTERADOR B'
      'WHERE B.CODTIPIMOVEL = :CODTIPIMOVEL AND'
      '               B.ACRESDECRES  = :ACRESDECRES AND'
      '               B.IDMODULO = 64 ')
    ControlType.Strings = (
      'SELECAO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 540
    Top = 7
    ParamData = <
      item
        DataType = ftString
        Name = 'CODTIPIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ACRESDECRES'
        ParamType = ptUnknown
      end>
    object qryBaixaContraAlteradorIDBAIXACONTRA: TFloatField
      FieldName = 'IDBAIXACONTRA'
      Origin = 'BASEDADOS.BAIXACONTRAALTERADOR.IDBAIXACONTRA'
    end
    object qryBaixaContraAlteradorACRESDECRES: TStringField
      FieldName = 'ACRESDECRES'
      Origin = 'BASEDADOS.BAIXACONTRAALTERADOR.ACRESDECRES'
      FixedChar = True
      Size = 1
    end
    object qryBaixaContraAlteradorCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = 'BASEDADOS.BAIXACONTRAALTERADOR.CODTIPIMOVEL'
      Size = 5
    end
    object qryBaixaContraAlteradorCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Origin = 'BASEDADOS.BAIXACONTRAALTERADOR.CODALTERADOR'
    end
    object qryBaixaContraAlteradorIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'BASEDADOS.BAIXACONTRAALTERADOR.IDMODULO'
    end
  end
  object qryConfissaoXDoc: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.IDCONFISSAODIVIDA, CODDOCUMENTO,'
      '       TIPO,IDMODULO    , idcondresult'
      'FROM     CONFISSAOXDOCUMENTO C'
      'WHERE C.IDCONFISSAODIVIDA = 0')
    UpdateObject = upConfissaoXDoc
    ValidateWithMask = True
    Left = 127
    Top = 226
    object qryConfissaoXDocIDCONFISSAODIVIDA: TFloatField
      FieldName = 'IDCONFISSAODIVIDA'
      Origin = 'BASEDADOS.CONFISSAOXDOCUMENTO.IDCONFISSAODIVIDA'
    end
    object qryConfissaoXDocCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.CONFISSAOXDOCUMENTO.CODDOCUMENTO'
    end
    object qryConfissaoXDocTIPO: TFloatField
      FieldName = 'TIPO'
      Origin = 'BASEDADOS.CONFISSAOXDOCUMENTO.TIPO'
    end
    object qryConfissaoXDocIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'BASEDADOS.CONFISSAOXDOCUMENTO.IDMODULO'
    end
    object qryConfissaoXDocIDCONDRESULT: TFloatField
      FieldName = 'IDCONDRESULT'
      Origin = 'BASEDADOS.CONFISSAOXDOCUMENTO.IDCONDRESULT'
    end
  end
  object updLancamento: TUpdateSQL
    ModifySQL.Strings = (
      'update LANCAMENTOSIMOVEL'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDIMOVEL = :IDIMOVEL,'
      '  IDTIPOCUSTORECIMO = :IDTIPOCUSTORECIMO,'
      '  IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL,'
      '  DATALANCAMENTO = :DATALANCAMENTO,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  ANOREFERENCIA = :ANOREFERENCIA,'
      '  MESCOMPETENCIA = :MESCOMPETENCIA,'
      '  ANOCOMPETENCIA = :ANOCOMPETENCIA,'
      '  RECPAG = :RECPAG,'
      '  VLRLANCOMRECEB = :VLRLANCOMRECEB,'
      '  VLRLANCRECEB = :VLRLANCRECEB,'
      '  MOEDARECEB = :MOEDARECEB,'
      '  IDFORCLI = :IDFORCLI,'
      '  FLGAGRUPAR = :FLGAGRUPAR,'
      '  FLGAGRUPADO = :FLGAGRUPADO,'
      '  FLGTIPOLANCAMENTO = :FLGTIPOLANCAMENTO,'
      '  FLGINTEGRADO = :FLGINTEGRADO,'
      '  FLGORIGEMLANC = :FLGORIGEMLANC,'
      '  IDUSUARIOSISTEMA = :IDUSUARIOSISTEMA,'
      '  VLRJUROS = :VLRJUROS,'
      '  VLRMULTA = :VLRMULTA,'
      '  VLRCORRECAOMON = :VLRCORRECAOMON,'
      '  VLRCOMISSAO = :VLRCOMISSAO,'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  NODOCUMENTO = :NODOCUMENTO,'
      '  IDPROGRAMA = :IDPROGRAMA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  DATALIMITE = :DATALIMITE,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  IDMODULO = :IDMODULO,'
      '  DTINICTBDIARIA = :DTINICTBDIARIA,'
      '  DTFIMCTBDIARIA = :DTFIMCTBDIARIA,'
      '  CODTIPIMOVEL = :CODTIPIMOVEL'
      'where'
      '  IDLANCIMOVEL = :OLD_IDLANCIMOVEL'
      ' ')
    InsertSQL.Strings = (
      'insert into LANCAMENTOSIMOVEL'
      '  (IDLANCIMOVEL, IDPESSOA, IDIMOVEL, IDTIPOCUSTORECIMO, '
      'IDCONTRATOIMOVEL, '
      '   DATALANCAMENTO, DATAVENCIMENTO, DATAEMISSAO, MESREFERENCIA, '
      'ANOREFERENCIA, '
      '   MESCOMPETENCIA, ANOCOMPETENCIA, RECPAG, VLRLANCOMRECEB, '
      'VLRLANCRECEB, '
      '   MOEDARECEB, IDFORCLI, FLGAGRUPAR, FLGAGRUPADO, '
      'FLGTIPOLANCAMENTO, FLGINTEGRADO, '
      '   FLGORIGEMLANC, IDUSUARIOSISTEMA, VLRJUROS, VLRMULTA, '
      'VLRCORRECAOMON, '
      '   VLRCOMISSAO, IDDOCUMENTO, NODOCUMENTO, IDPROGRAMA, '
      'IDEMPRESA, CODCENTROCUSTO, '
      '   DATALIMITE, CODPORTFORMA, IDMODULO, DTINICTBDIARIA, '
      'DTFIMCTBDIARIA, CODTIPIMOVEL)'
      'values'
      '  (:IDLANCIMOVEL, :IDPESSOA, :IDIMOVEL, :IDTIPOCUSTORECIMO,'
      ':IDCONTRATOIMOVEL,'
      '   :DATALANCAMENTO, :DATAVENCIMENTO, :DATAEMISSAO,'
      ':MESREFERENCIA, :ANOREFERENCIA,'
      '   :MESCOMPETENCIA, :ANOCOMPETENCIA, :RECPAG, :VLRLANCOMRECEB,'
      ':VLRLANCRECEB,'
      '   :MOEDARECEB, :IDFORCLI, :FLGAGRUPAR, :FLGAGRUPADO,'
      ':FLGTIPOLANCAMENTO,'
      '   :FLGINTEGRADO, :FLGORIGEMLANC, :IDUSUARIOSISTEMA, :VLRJUROS,'
      ':VLRMULTA,'
      '   :VLRCORRECAOMON, :VLRCOMISSAO, :IDDOCUMENTO, :NODOCUMENTO,'
      ':IDPROGRAMA,'
      '   :IDEMPRESA, :CODCENTROCUSTO, :DATALIMITE, :CODPORTFORMA,'
      ':IDMODULO,'
      '   :DTINICTBDIARIA, :DTFIMCTBDIARIA, :CODTIPIMOVEL)'
      ' ')
    DeleteSQL.Strings = (
      'delete from LANCAMENTOSIMOVEL'
      'where'
      '  IDLANCIMOVEL = :OLD_IDLANCIMOVEL')
    Left = 682
    Top = 278
  end
  object qryLancamento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   '#39'                                                            ' +
        '                       '#39' AS CONTRATO,'
      
        '   '#39'                                                            ' +
        '                                                               '#39 +
        ' AS IMOVEL,'
      ''
      '   IDLANCIMOVEL,'
      '   IDPESSOA,'
      '   IDIMOVEL,'
      '   CODTIPIMOVEL,'
      '   IDTIPOCUSTORECIMO,'
      '   IDCONTRATOIMOVEL,'
      ''
      '   DATALANCAMENTO, DATAVENCIMENTO, DATAEMISSAO,'
      ''
      '   MESREFERENCIA, ANOREFERENCIA,'
      '   MESCOMPETENCIA, ANOCOMPETENCIA,'
      ''
      '   RECPAG,'
      '   VLRLANCOMRECEB, VLRLANCRECEB,'
      '   MOEDARECEB,'
      ''
      '   IDFORCLI,'
      ''
      '   FLGAGRUPAR, FLGAGRUPADO,'
      '   FLGTIPOLANCAMENTO,'
      '   FLGINTEGRADO,'
      ''
      '   FLGORIGEMLANC, IDUSUARIOSISTEMA,'
      ''
      '   VLRJUROS, VLRMULTA, VLRCORRECAOMON, VLRCOMISSAO,'
      ''
      '   IDDOCUMENTO, NODOCUMENTO,'
      ''
      '   IDPROGRAMA, IDEMPRESA, CODCENTROCUSTO,'
      ''
      '   DATALIMITE, CODPORTFORMA,'
      '   IDMODULO,'
      '   DTINICTBDIARIA, DTFIMCTBDIARIA,'
      '   IDCONFISSAODIVIDA'
      ''
      'FROM'
      '   LANCAMENTOSIMOVEL'
      ''
      'WHERE'
      '   IDLANCIMOVEL = 0'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updLancamento
    ValidateWithMask = True
    Left = 682
    Top = 234
    object qryLancamentoCONTRATO: TStringField
      DisplayLabel = 'Contrato'
      DisplayWidth = 83
      FieldName = 'CONTRATO'
      FixedChar = True
      Size = 83
    end
    object qryLancamentoIMOVEL: TStringField
      DisplayLabel = 'Imóvel'
      DisplayWidth = 123
      FieldName = 'IMOVEL'
      FixedChar = True
      Size = 123
    end
    object qryLancamentoMESCOMPETENCIA: TFloatField
      DisplayLabel = 'Mês'
      DisplayWidth = 10
      FieldName = 'MESCOMPETENCIA'
    end
    object qryLancamentoANOCOMPETENCIA: TFloatField
      DisplayLabel = 'Ano'
      DisplayWidth = 10
      FieldName = 'ANOCOMPETENCIA'
    end
    object qryLancamentoDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 18
      FieldName = 'DATAVENCIMENTO'
    end
    object qryLancamentoDATALIMITE: TDateTimeField
      DisplayLabel = 'Limite'
      DisplayWidth = 18
      FieldName = 'DATALIMITE'
    end
    object qryLancamentoVLRLANCRECEB: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VLRLANCRECEB'
    end
    object qryLancamentoIDDOCUMENTO: TFloatField
      DisplayLabel = 'ID Documento'
      DisplayWidth = 10
      FieldName = 'IDDOCUMENTO'
    end
    object qryLancamentoNODOCUMENTO: TFloatField
      DisplayLabel = 'Nr. Documento'
      DisplayWidth = 10
      FieldName = 'NODOCUMENTO'
    end
    object qryLancamentoDTINICTBDIARIA: TDateTimeField
      DisplayLabel = 'Início Ctb Diária'
      DisplayWidth = 18
      FieldName = 'DTINICTBDIARIA'
    end
    object qryLancamentoDTFIMCTBDIARIA: TDateTimeField
      DisplayLabel = 'Término Ctb Diária'
      DisplayWidth = 18
      FieldName = 'DTFIMCTBDIARIA'
    end
    object qryLancamentoCODTIPIMOVEL: TStringField
      DisplayWidth = 5
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryLancamentoDATAEMISSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAEMISSAO'
    end
    object qryLancamentoIDLANCIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLANCIMOVEL'
      Visible = False
    end
    object qryLancamentoIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryLancamentoIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object qryLancamentoIDTIPOCUSTORECIMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCUSTORECIMO'
      Visible = False
    end
    object qryLancamentoIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryLancamentoDATALANCAMENTO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATALANCAMENTO'
      Visible = False
    end
    object qryLancamentoMESREFERENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'MESREFERENCIA'
      Visible = False
    end
    object qryLancamentoANOREFERENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'ANOREFERENCIA'
      Visible = False
    end
    object qryLancamentoRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryLancamentoVLRLANCOMRECEB: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRLANCOMRECEB'
      Visible = False
    end
    object qryLancamentoMOEDARECEB: TFloatField
      DisplayWidth = 10
      FieldName = 'MOEDARECEB'
      Visible = False
    end
    object qryLancamentoIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object qryLancamentoFLGAGRUPAR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGAGRUPAR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryLancamentoFLGAGRUPADO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGAGRUPADO'
      Visible = False
    end
    object qryLancamentoFLGTIPOLANCAMENTO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTIPOLANCAMENTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryLancamentoFLGINTEGRADO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGINTEGRADO'
      Visible = False
    end
    object qryLancamentoFLGORIGEMLANC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGORIGEMLANC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryLancamentoIDUSUARIOSISTEMA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDUSUARIOSISTEMA'
      Visible = False
    end
    object qryLancamentoVLRJUROS: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRJUROS'
      Visible = False
    end
    object qryLancamentoVLRMULTA: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRMULTA'
      Visible = False
    end
    object qryLancamentoVLRCORRECAOMON: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRCORRECAOMON'
      Visible = False
    end
    object qryLancamentoVLRCOMISSAO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRCOMISSAO'
      Visible = False
    end
    object qryLancamentoIDPROGRAMA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROGRAMA'
      Visible = False
    end
    object qryLancamentoIDEMPRESA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object qryLancamentoCODCENTROCUSTO: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryLancamentoCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object qryLancamentoIDMODULO: TFloatField
      FieldName = 'IDMODULO'
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
    Left = 751
    Top = 280
  end
  object qryRateio: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUBSTR(DECODE(I.IDIMOVELPAI,'
      '                     NULL,'
      '                     IM.IMONOME || '#39' - '#39' || I.IMONOME,'
      '                     '
      '                     DECODE(I.IMONOME,'
      '                            NULL,'
      '                            IM.IMONOME || '#39' - '#39' || IP.IMONOME,'
      '                            '
      
        '                            IM.IMONOME || '#39' - '#39' || IP.IMONOME ||' +
        ' '#39' - '#39' ||'
      '                            I.IMONOME)),              1,'
      '              100) AS IMOVEL_EXTENSO,       '
      '       I.IMOCODIGO,'
      '       I.CODTIPIMOVEL,       '
      '       0 AS GXIPERCENTRATEIO,       '
      '       CXI.CONNUMERO,'
      '       CXI.CONNOME,'
      '       CXI.IDLOCATARIO,'
      '       0                    AS VALOR,'
      '       0                    AS VLR_PARCELA,'
      '       CXI.IDCONTRATOIMOVEL,       '
      '       DECODE(CXI.FLGRATEIO,'
      '              NULL,'
      '              100,              '
      '              DECODE(CXI.FLGRATEIO,'
      '                     0,'
      '                     100,                     '
      '                     DECODE(CXI.CIMPERCENTRATEIO,'
      '                            NULL,'
      '                            0,'
      
        '                            CXI.CIMPERCENTRATEIO))) AS PERCENT_R' +
        'ATEIO,       '
      '       CXI.CIMDESCRICAO,       '
      '       I.IMOAREA,'
      '       I.IDIMOVEL,       '
      '       I.IMOFRACAOIDEAL'
      '  FROM IMOVEL I,'
      '       IMOVEL IM,'
      '       IMOVEL IP,       '
      '       (SELECT C.IDCONTRATOIMOVEL,'
      '               CXI.IDIMOVEL,'
      '               CXI.FLGRATEIO,'
      '               CXI.CIMPERCENTRATEIO,               '
      '               C.CONNUMERO,'
      '               C.CONNOME,'
      '               C.IDLOCATARIO,               '
      '               CXI.CIMDESCRICAO        '
      '          FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI        '
      
        '         WHERE C.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL        ' +
        '      '
      '           ) CXI'
      ' WHERE (I.IDPESSOA = 1)      '
      '   AND ((CXI.IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL))      '
      '   AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)      '
      '   AND (I.IDIMOVELPAI = IP.IDIMOVEL(+))      '
      '   AND (I.IDIMOVEL = CXI.IDIMOVEL(+))'
      '')
    UpdateObject = updRateio
    ValidateWithMask = True
    Left = 748
    Top = 235
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryRateioIMOCODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object qryRateioIMOVEL_EXTENSO: TStringField
      DisplayLabel = 'Imóvel '
      DisplayWidth = 37
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryRateioCODTIPIMOVEL: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 6
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
    object qryRateio_CONTRATOEXTENSO: TStringField
      DisplayLabel = 'Contrato'
      DisplayWidth = 23
      FieldKind = fkCalculated
      FieldName = '_CONTRATOEXTENSO'
      Size = 83
      Calculated = True
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
    object qryRateioIDLOCATARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLOCATARIO'
      Visible = False
    end
    object qryRateioVLR_PARCELA: TFloatField
      DisplayWidth = 10
      FieldName = 'VLR_PARCELA'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryRateioIMOAREA: TFloatField
      DisplayWidth = 10
      FieldName = 'IMOAREA'
      Visible = False
    end
    object qryRateioIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object qryRateioIMOFRACAOIDEAL: TFloatField
      DisplayWidth = 10
      FieldName = 'IMOFRACAOIDEAL'
      Visible = False
    end
    object qryRateioCIMDESCRICAO: TStringField
      FieldName = 'CIMDESCRICAO'
      Size = 60
    end
  end
  object cdsBloqueioImob: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 705
    Top = 113
  end
  object qryConfissaoDivida: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCONFISSAODIVIDA ,'
      '       IDCONTRATOIMOVEL ,'
      '       MESCONFISSAO     ,'
      '       ANOCONFISSAO     ,'
      '       DATACONFISSAO    ,'
      '       CONDRESULTANTES  ,'
      '       VLRSALDO         ,'
      '       IDMODULO         ,'
      'plncodigo_oper '
      'FROM CONFISSAODIVIDA C'
      'WHERE IDCONFISSAODIVIDA = 0')
    UpdateObject = upConfissaoDivida
    ValidateWithMask = True
    Left = 34
    Top = 226
    object qryConfissaoDividaIDCONFISSAODIVIDA: TFloatField
      FieldName = 'IDCONFISSAODIVIDA'
      Origin = 'BASEDADOS.CONFISSAODIVIDA.IDCONFISSAODIVIDA'
    end
    object qryConfissaoDividaIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'BASEDADOS.CONFISSAODIVIDA.IDCONTRATOIMOVEL'
    end
    object qryConfissaoDividaMESCONFISSAO: TFloatField
      FieldName = 'MESCONFISSAO'
      Origin = 'BASEDADOS.CONFISSAODIVIDA.MESCONFISSAO'
    end
    object qryConfissaoDividaANOCONFISSAO: TFloatField
      FieldName = 'ANOCONFISSAO'
      Origin = 'BASEDADOS.CONFISSAODIVIDA.ANOCONFISSAO'
    end
    object qryConfissaoDividaDATACONFISSAO: TDateTimeField
      FieldName = 'DATACONFISSAO'
      Origin = 'BASEDADOS.CONFISSAODIVIDA.DATACONFISSAO'
    end
    object qryConfissaoDividaCONDRESULTANTES: TFloatField
      FieldName = 'CONDRESULTANTES'
      Origin = 'BASEDADOS.CONFISSAODIVIDA.CONDRESULTANTES'
    end
    object qryConfissaoDividaVLRSALDO: TFloatField
      FieldName = 'VLRSALDO'
      Origin = 'BASEDADOS.CONFISSAODIVIDA.VLRSALDO'
    end
    object qryConfissaoDividaIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'BASEDADOS.CONFISSAODIVIDA.IDMODULO'
    end
    object qryConfissaoDividaPLNCODIGO_OPER: TFloatField
      FieldName = 'PLNCODIGO_OPER'
    end
  end
  object qryConfissaoXCond: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCONDRESULT ,'
      '  IDCONFISSAODIVIDA ,'
      '  SALDODEVEDOR      ,'
      '  INICIOCONFISSAO   ,'
      '  PROXVENCTO        ,'
      '  PROXAMORTIZACAO   ,'
      '  PARCELAS          ,'
      '  PERIODO           ,'
      '  PRAZO             ,'
      '  INDCORRECAO       ,'
      '  MESREFREAJUSTE    ,'
      '  TAXAJUROS         ,'
      '  PERIODOTAXA       ,'
      '  TAXAMULTA         ,'
      '  IDMODULO         '
      'FROM CONFISSAOXCONDICAO'
      'WHERE IDCONFISSAODIVIDA = 0')
    UpdateObject = upConfissaoXCond
    ValidateWithMask = True
    Left = 430
    Top = 226
    object qryConfissaoXCondIDCONDRESULT: TFloatField
      FieldName = 'IDCONDRESULT'
      Origin = 'BASEDADOS.CONFISSAOXCONDICAO.IDCONDRESULT'
    end
    object qryConfissaoXCondIDCONFISSAODIVIDA: TFloatField
      FieldName = 'IDCONFISSAODIVIDA'
      Origin = 'BASEDADOS.CONFISSAOXCONDICAO.IDCONFISSAODIVIDA'
    end
    object qryConfissaoXCondSALDODEVEDOR: TFloatField
      FieldName = 'SALDODEVEDOR'
      Origin = 'BASEDADOS.CONFISSAOXCONDICAO.SALDODEVEDOR'
    end
    object qryConfissaoXCondINICIOCONFISSAO: TDateTimeField
      FieldName = 'INICIOCONFISSAO'
      Origin = 'BASEDADOS.CONFISSAOXCONDICAO.INICIOCONFISSAO'
    end
    object qryConfissaoXCondPROXVENCTO: TDateTimeField
      FieldName = 'PROXVENCTO'
      Origin = 'BASEDADOS.CONFISSAOXCONDICAO.PROXVENCTO'
    end
    object qryConfissaoXCondPROXAMORTIZACAO: TDateTimeField
      FieldName = 'PROXAMORTIZACAO'
      Origin = 'BASEDADOS.CONFISSAOXCONDICAO.PROXAMORTIZACAO'
    end
    object qryConfissaoXCondPARCELAS: TFloatField
      FieldName = 'PARCELAS'
      Origin = 'BASEDADOS.CONFISSAOXCONDICAO.PARCELAS'
    end
    object qryConfissaoXCondPERIODO: TFloatField
      FieldName = 'PERIODO'
      Origin = 'BASEDADOS.CONFISSAOXCONDICAO.PERIODO'
    end
    object qryConfissaoXCondINDCORRECAO: TFloatField
      FieldName = 'INDCORRECAO'
      Origin = 'BASEDADOS.CONFISSAOXCONDICAO.INDCORRECAO'
    end
    object qryConfissaoXCondMESREFREAJUSTE: TFloatField
      FieldName = 'MESREFREAJUSTE'
      Origin = 'BASEDADOS.CONFISSAOXCONDICAO.MESREFREAJUSTE'
    end
    object qryConfissaoXCondTAXAJUROS: TFloatField
      FieldName = 'TAXAJUROS'
      Origin = 'BASEDADOS.CONFISSAOXCONDICAO.TAXAJUROS'
    end
    object qryConfissaoXCondTAXAMULTA: TFloatField
      FieldName = 'TAXAMULTA'
      Origin = 'BASEDADOS.CONFISSAOXCONDICAO.TAXAMULTA'
    end
    object qryConfissaoXCondIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'BASEDADOS.CONFISSAOXCONDICAO.IDMODULO'
    end
    object qryConfissaoXCondPRAZO: TStringField
      FieldName = 'PRAZO'
      Origin = 'BASEDADOS.CONFISSAOXCONDICAO.PRAZO'
      Size = 1
    end
    object qryConfissaoXCondPERIODOTAXA: TStringField
      FieldName = 'PERIODOTAXA'
      Origin = 'BASEDADOS.CONFISSAOXCONDICAO.PERIODOTAXA'
      Size = 1
    end
  end
  object upConfissaoXCond: TUpdateSQL
    ModifySQL.Strings = (
      '')
    InsertSQL.Strings = (
      'insert into cm.confissaoxcondicao'
      
        '  (idcondresult, idconfissaodivida, saldodevedor, inicioconfissa' +
        'o, proxvencto, '
      
        'proxamortizacao, parcelas, periodo, prazo, indcorrecao, mesrefre' +
        'ajuste, taxajuros, '
      'periodotaxa, taxamulta, idmodulo)'
      'values'
      
        '  (:idcondresult, :idconfissaodivida, :saldodevedor, :inicioconf' +
        'issao, '
      
        ':proxvencto, :proxamortizacao, :parcelas, :periodo, :prazo, :ind' +
        'correcao, '
      
        ':mesrefreajuste, :taxajuros, :periodotaxa, :taxamulta, :idmodulo' +
        ')')
    DeleteSQL.Strings = (
      '')
    Left = 430
    Top = 269
  end
  object upConfissaoDivida: TUpdateSQL
    ModifySQL.Strings = (
      'update cm.confissaodivida'
      '   set idconfissaodivida = :idconfissaodivida,'
      '       idcontratoimovel = :idcontratoimovel,'
      '       mesconfissao = :mesconfissao,'
      '       anoconfissao = :anoconfissao,'
      '       dataconfissao = :dataconfissao,'
      '       condresultantes = :condresultantes,'
      '       vlrsaldo = :vlrsaldo,'
      '       idmodulo = :idmodulo,'
      '       plncodigo_oper = :plncodigo_oper'
      ' where idconfissaodivida = :old_idconfissaodivida')
    InsertSQL.Strings = (
      'insert into cm.confissaodivida'
      
        '  (idconfissaodivida, idcontratoimovel, mesconfissao, anoconfiss' +
        'ao, dataconfissao, '
      'condresultantes, vlrsaldo, idmodulo, PLNCODIGO_OPER)'
      'values'
      
        '  (:idconfissaodivida, :idcontratoimovel, :mesconfissao, :anocon' +
        'fissao, '
      
        ':dataconfissao, :condresultantes, :vlrsaldo, :idmodulo, :PLNCODI' +
        'GO_OPER)')
    Left = 33
    Top = 270
  end
  object upConfissaoXDoc: TUpdateSQL
    InsertSQL.Strings = (
      'insert into cm.confissaoxdocumento'
      '  (idconfissaodivida, coddocumento, tipo, idmodulo,idcondresult)'
      'values'
      
        '  (:idconfissaodivida, :coddocumento, :tipo, :idmodulo,:idcondre' +
        'sult)')
    Left = 128
    Top = 274
  end
  object qryConfissaoxOperacao: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT     '
      '    IDCONFISSAODIVIDA,'
      '    IDTIPOCUSTORECIMO,'
      '    FLGTIPOOPER,'
      '    VLROPERACAO,'
      '    OBSERVACAO,'
      '    IDMODULO , Lancnumlan'
      'FROM'
      '     CONFISSAOXOPER'
      'WHERE'
      '     IDCONFISSAODIVIDA = 0'
      ''
      ' '
      ' ')
    UpdateObject = upConfissaoxOperacao
    ValidateWithMask = True
    Left = 324
    Top = 226
    object qryConfissaoxOperacaoIDCONFISSAODIVIDA: TFloatField
      FieldName = 'IDCONFISSAODIVIDA'
      Origin = 'BASEDADOS.CONFISSAOXOPER.IDCONFISSAODIVIDA'
    end
    object qryConfissaoxOperacaoIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Origin = 'BASEDADOS.CONFISSAOXOPER.IDTIPOCUSTORECIMO'
    end
    object qryConfissaoxOperacaoFLGTIPOOPER: TStringField
      FieldName = 'FLGTIPOOPER'
      Origin = 'BASEDADOS.CONFISSAOXOPER.FLGTIPOOPER'
      FixedChar = True
      Size = 1
    end
    object qryConfissaoxOperacaoVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS.CONFISSAOXOPER.VLROPERACAO'
    end
    object qryConfissaoxOperacaoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.CONFISSAOXOPER.OBSERVACAO'
      Size = 200
    end
    object qryConfissaoxOperacaoIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'BASEDADOS.CONFISSAOXOPER.IDMODULO'
    end
    object qryConfissaoxOperacaoLANCNUMLAN: TFloatField
      FieldName = 'LANCNUMLAN'
      Origin = 'BASEDADOS.CONFISSAOXOPER.LANCNUMLAN'
    end
  end
  object upConfissaoxOperacao: TUpdateSQL
    ModifySQL.Strings = (
      'update cm.confissaoxoper'
      '   set idconfissaodivida = :idconfissaodivida,'
      '       idtipocustorecimo = :idtipocustorecimo,'
      '       flgtipooper = :flgtipooper,'
      '       vlroperacao = :vlroperacao,'
      '       observacao = :observacao,'
      '       idmodulo = :idmodulo,'
      '       lancnumlan = :lancnumlan'
      ' where idconfissaodivida = :idconfissaodivida'
      '   and idtipocustorecimo = :old_idtipocustorecimo')
    InsertSQL.Strings = (
      'insert into cm.confissaoxoper'
      
        '(idconfissaodivida, idtipocustorecimo, flgtipooper, vlroperacao,' +
        ' observacao, '
      'lancnumlan, idmodulo)'
      'values'
      
        '(:idconfissaodivida, :idtipocustorecimo, :flgtipooper, :vlropera' +
        'cao, :observacao, '
      ':lancnumlan, :idmodulo) ')
    DeleteSQL.Strings = (
      'delete cm.confissaoxoper'
      ' where idconfissaodivida = :idconfissaodivida'
      '   and idtipocustorecimo = :idtipocustorecimo')
    Left = 319
    Top = 269
  end
  object qryTipoCustoRecImov: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT FLGTIPOOPER FROM TIPOCUSTORECIMOV C'
      'WHERE C.IDTIPOCUSTORECIMO = :IDTIPOCUSTORECIMO')
    ValidateWithMask = True
    Left = 365
    Top = 362
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOCUSTORECIMO'
        ParamType = ptUnknown
      end>
    object qryTipoCustoRecImovFLGTIPOOPER: TStringField
      FieldName = 'FLGTIPOOPER'
      Origin = 'BASEDADOS.TIPOCUSTORECIMOV.FLGTIPOOPER'
      FixedChar = True
      Size = 1
    end
  end
end
