inherited frmExecRecalculoDocumentoMT: TfrmExecRecalculoDocumentoMT
  Left = 133
  Top = 114
  Caption = 'Recálculo de Documentos'
  ClientHeight = 411
  ClientWidth = 771
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 771
    Height = 372
    inherited PagControle: TPageControl
      Width = 769
      Height = 370
      ActivePage = TabSheet2
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 761
          Caption = 'Documento para Recálculo [ Seleção ]'
        end
        object Label22: TLabel
          Left = 16
          Top = 77
          Width = 92
          Height = 13
          Caption = 'Tipo de Receita'
        end
        object Label3: TLabel
          Left = 248
          Top = 77
          Width = 103
          Height = 13
          Caption = 'Credor / Debitado'
        end
        object Label16: TLabel
          Left = 160
          Top = 39
          Width = 73
          Height = 13
          Caption = 'Nº do Boleto'
        end
        object Label5: TLabel
          Left = 16
          Top = 37
          Width = 101
          Height = 13
          Caption = 'Nº do Documento'
        end
        object Label15: TLabel
          Left = 16
          Top = 265
          Width = 74
          Height = 13
          Caption = 'Competência'
        end
        object lblDataVencimento: TLabel
          Left = 280
          Top = 265
          Width = 75
          Height = 13
          Caption = 'Data Lancto.'
        end
        object Label2: TLabel
          Left = 376
          Top = 265
          Width = 76
          Height = 13
          Caption = 'Data Vencto.'
        end
        object Label11: TLabel
          Left = 472
          Top = 265
          Width = 102
          Height = 13
          Caption = 'Data Última Baixa'
        end
        object Label1: TLabel
          Left = 592
          Top = 265
          Width = 66
          Height = 13
          Caption = 'Saldo Atual'
        end
        object Label8: TLabel
          Left = 16
          Top = 314
          Width = 217
          Height = 13
          Caption = 'Usuário responsável pelo Lançamento'
        end
        object Label4: TLabel
          Left = 488
          Top = 314
          Width = 40
          Height = 13
          Caption = 'Origem'
        end
        object Label12: TLabel
          Left = 656
          Top = 314
          Width = 80
          Height = 13
          Caption = 'Data Inclusão'
        end
        object Label72: TLabel
          Left = 392
          Top = 39
          Width = 49
          Height = 13
          Caption = 'Contrato'
        end
        object DBedtTipoRecDes: TDBEdit
          Left = 16
          Top = 91
          Width = 225
          Height = 21
          DataField = 'DESCCUSTORECIMO'
          DataSource = dsDocumento
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit1: TDBEdit
          Left = 248
          Top = 91
          Width = 137
          Height = 21
          DataField = 'NF_FORCLI'
          DataSource = dsDocumento
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit6: TDBEdit
          Left = 387
          Top = 91
          Width = 347
          Height = 21
          DataField = 'RS_FORCLI'
          DataSource = dsDocumento
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 160
          Top = 52
          Width = 225
          Height = 21
          DataField = 'NOSSONUMERO'
          DataSource = dsDocumento
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit10: TDBEdit
          Left = 16
          Top = 51
          Width = 112
          Height = 21
          DataField = 'DOC_CAPCAR'
          DataSource = dsDocumento
          ReadOnly = True
          TabOrder = 4
        end
        object pcLancamento: TPageControl
          Left = 16
          Top = 126
          Width = 721
          Height = 135
          ActivePage = tbsLancamentos
          TabOrder = 5
          object tbsLancamentos: TTabSheet
            Caption = 'Lançamentos'
            object DBgrdReajuste: TwwDBGrid
              Left = 0
              Top = 0
              Width = 713
              Height = 107
              Selected.Strings = (
                'IMOVEL_EXTENSO'#9'44'#9'Imovel'
                'IMOCODIGO'#9'15'#9'Código'
                'CONTRATO_EXTENSO'#9'40'#9'Contrato'
                'VALOR_LANC'#9'13'#9'Valor')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = False
              Align = alClient
              DataSource = dsLancamentos
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              KeyOptions = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'Small Fonts'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              UseTFields = False
              IndicatorColor = icBlack
            end
          end
          object tbsAlteradores: TTabSheet
            Caption = 'Alteradores'
            ImageIndex = 1
            object wwDBGrid1: TwwDBGrid
              Left = 0
              Top = 0
              Width = 713
              Height = 107
              Selected.Strings = (
                'DESCRICAO'#9'47'#9'Alterador'#9'F'
                'DEBCRE'#9'17'#9'Tipo'#9'F'
                'VALOR'#9'13'#9'Valor'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = False
              Align = alClient
              DataSource = dsAlteradoresDoc
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              KeyOptions = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'Small Fonts'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              UseTFields = False
              IndicatorColor = icBlack
            end
          end
        end
        object dbEdtMesCompetencia: TDBEdit
          Left = 16
          Top = 279
          Width = 185
          Height = 21
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit12: TDBEdit
          Left = 200
          Top = 279
          Width = 65
          Height = 21
          DataField = 'ANOCOMPETENCIA'
          DataSource = dsDocumento
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit16: TDBEdit
          Left = 280
          Top = 279
          Width = 81
          Height = 21
          DataField = 'DATALANCAMENTO'
          DataSource = dsDocumento
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit17: TDBEdit
          Left = 376
          Top = 279
          Width = 81
          Height = 21
          DataField = 'DATAVENCIMENTO'
          DataSource = dsDocumento
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit18: TDBEdit
          Left = 472
          Top = 279
          Width = 105
          Height = 21
          DataField = 'DATA_BAIXA'
          DataSource = dsDocumento
          ReadOnly = True
          TabOrder = 10
        end
        object DBEdit9: TDBEdit
          Left = 592
          Top = 279
          Width = 145
          Height = 21
          Color = 12648447
          DataField = 'VALOR_LIQUIDO'
          DataSource = dsDocumento
          ReadOnly = True
          TabOrder = 11
        end
        object DBedtNomeExtenso: TDBEdit
          Left = 136
          Top = 328
          Width = 337
          Height = 21
          DataField = 'NF_USUARIO'
          DataSource = dsDocumento
          ReadOnly = True
          TabOrder = 12
        end
        object DBedtNomeUsuario: TDBEdit
          Left = 16
          Top = 328
          Width = 121
          Height = 21
          DataField = 'LOGIN_USUARIO'
          DataSource = dsDocumento
          ReadOnly = True
          TabOrder = 13
        end
        object DBedtOrigem: TDBEdit
          Left = 488
          Top = 328
          Width = 153
          Height = 21
          ReadOnly = True
          TabOrder = 14
        end
        object DBEdit19: TDBEdit
          Left = 656
          Top = 328
          Width = 81
          Height = 21
          DataField = 'TRGDTINCLUSAO'
          DataSource = dsDocumento
          ReadOnly = True
          TabOrder = 15
        end
        object DBEdit2: TDBEdit
          Left = 392
          Top = 53
          Width = 341
          Height = 21
          DataField = 'CONTRATO_EXTENSO'
          DataSource = dsDocumento
          ReadOnly = True
          TabOrder = 16
        end
        object btnBuscaDocumento: TBitBtn
          Left = 130
          Top = 51
          Width = 24
          Height = 22
          Hint = 'Busca um documento'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 17
          OnClick = btnBuscaDocumentoClick
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
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 761
          Caption = 'Documento para Recálculo [ Dados para o cálculo ]'
        end
        object Label21: TLabel
          Left = 149
          Top = 43
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
        object grpMulta: TGroupBox
          Left = 149
          Top = 125
          Width = 460
          Height = 65
          Caption = ' Multa'
          TabOrder = 0
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
          object DBcboMoedaMulta: TwwDBLookupCombo
            Left = 144
            Top = 32
            Width = 137
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOESIGLA'#9'6'#9'Moeda')
            LookupTable = cdsMoedaMulta
            LookupField = 'MOECODIGO'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object edtVlrMulta: TRealEdit
            Left = 16
            Top = 32
            Width = 113
            Height = 21
            TabStop = False
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
          object edtPercentMulta: TRealEdit
            Left = 312
            Top = 32
            Width = 121
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,0000')
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = False
          end
        end
        object grpMora: TGroupBox
          Left = 149
          Top = 192
          Width = 460
          Height = 65
          Caption = ' Juros de Mora '
          TabOrder = 1
          TabStop = True
          object Label17: TLabel
            Left = 16
            Top = 18
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object Label18: TLabel
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
          object Label29: TLabel
            Left = 312
            Top = 18
            Width = 62
            Height = 13
            Caption = 'Percentual'
          end
          object Label30: TLabel
            Left = 289
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
          object Label31: TLabel
            Left = 144
            Top = 18
            Width = 39
            Height = 13
            Caption = 'Moeda'
          end
          object DBedtMoedaMora: TwwDBLookupCombo
            Left = 144
            Top = 32
            Width = 137
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOESIGLA'#9'6'#9'Moeda')
            LookupTable = cdsMoedaJuros
            LookupField = 'MOECODIGO'
            Style = csDropDownList
            DropDownCount = 6
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object edtVlrMora: TRealEdit
            Left = 16
            Top = 32
            Width = 113
            Height = 21
            TabStop = False
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
          object edtPercentMora: TRealEdit
            Left = 312
            Top = 32
            Width = 121
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,0000')
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = False
          end
        end
        object grpPeriodicidadeMora: TGroupBox
          Left = 149
          Top = 259
          Width = 460
          Height = 65
          TabOrder = 2
          TabStop = True
          object Label19: TLabel
            Left = 16
            Top = 18
            Width = 78
            Height = 13
            Caption = 'Periodicidade'
          end
          object dbCboPeriodicidade: TwwDBComboBox
            Left = 16
            Top = 32
            Width = 137
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = False
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Mensal'#9'M'
              'Diária'#9'D')
            Sorted = False
            TabOrder = 0
            UnboundDataType = wwDefault
          end
          object chkMoraProporc: TCheckBox
            Left = 176
            Top = 34
            Width = 205
            Height = 17
            Caption = 'Mora proporcional ao nº de dias'
            TabOrder = 1
          end
        end
        object edtDataVencimento: TCMDateTimePicker
          Left = 263
          Top = 41
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
          TabOrder = 3
        end
        object GroupBox17: TGroupBox
          Left = 149
          Top = 66
          Width = 460
          Height = 57
          Caption = 'Correção Monetária'
          TabOrder = 4
          object Label13: TLabel
            Left = 16
            Top = 15
            Width = 36
            Height = 13
            Caption = 'Índice'
          end
          object Label46: TLabel
            Left = 162
            Top = 32
            Width = 96
            Height = 13
            Caption = 'Utilizar indice de'
          end
          object Label55: TLabel
            Left = 306
            Top = 32
            Width = 112
            Height = 13
            Caption = 'mes(es) anterior(es)'
          end
          object cboIndiceReajuste: TCMDBLookupCombo
            Left = 16
            Top = 28
            Width = 139
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOESIGLA'#9'10'#9'Sigla'#9'F'
              'FLGPERCVALOR'#9'1'#9'Tipo'#9'F')
            LookupTable = cdsMoedaCM
            LookupField = 'MOECODIGO'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object SpinMesesAnteriores: TSpinEdit
            Left = 260
            Top = 28
            Width = 44
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
        end
      end
      object tbsMensagens: TTabSheet
        Caption = 'tbsMensagens'
        ImageIndex = 2
        TabVisible = False
        object fcLabel2: TfcLabel
          Left = 0
          Top = 0
          Width = 421
          Height = 24
          Align = alTop
          Caption = 'Documento para Recálculo [ Mensagens ]'
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
        object pnlAlienacao: TPanel
          Left = 3
          Top = 26
          Width = 746
          Height = 303
          BevelOuter = bvNone
          TabOrder = 0
          Visible = False
          object Label6: TLabel
            Left = 20
            Top = 248
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
          object Label9: TLabel
            Left = 71
            Top = 268
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
          object Label10: TLabel
            Left = 71
            Top = 284
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
          object Label14: TLabel
            Left = 262
            Top = 284
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
          object Label20: TLabel
            Left = 262
            Top = 268
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
          object Label23: TLabel
            Left = 434
            Top = 284
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
          object Label47: TLabel
            Left = 434
            Top = 268
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
          object GroupBox1: TGroupBox
            Left = 19
            Top = 19
            Width = 705
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
              Width = 617
              Height = 21
              MaxLength = 69
              TabOrder = 0
              Text = 'Cálculos Válidos até: <dataval>'
            end
            object edtln2: TEdit
              Left = 71
              Top = 45
              Width = 617
              Height = 21
              MaxLength = 69
              TabOrder = 1
              Text = 'Não receber após: <dataval>'
            end
            object edtln4: TEdit
              Left = 71
              Top = 87
              Width = 617
              Height = 21
              MaxLength = 69
              TabOrder = 3
              Text = 'Parcela Nr.: <parc>      Valor Original: <vo>'
            end
            object edtln5: TEdit
              Left = 71
              Top = 108
              Width = 617
              Height = 21
              MaxLength = 69
              TabOrder = 4
              Text = 'Correção Monetária: <cm>'
            end
            object edtln6: TEdit
              Left = 71
              Top = 129
              Width = 617
              Height = 21
              MaxLength = 69
              TabOrder = 5
              Text = 'Juros: <juros>'
            end
            object edtln7: TEdit
              Left = 71
              Top = 150
              Width = 617
              Height = 21
              MaxLength = 69
              TabOrder = 6
              Text = 'Multa:<multa>'
            end
            object edtln3: TEdit
              Left = 71
              Top = 66
              Width = 617
              Height = 21
              MaxLength = 69
              TabOrder = 2
            end
            object edtln8: TEdit
              Left = 71
              Top = 171
              Width = 617
              Height = 21
              MaxLength = 69
              TabOrder = 7
            end
            object edtln9: TEdit
              Left = 71
              Top = 192
              Width = 617
              Height = 21
              MaxLength = 69
              TabOrder = 8
            end
          end
        end
        object pnlAdminImob: TPanel
          Left = 3
          Top = 25
          Width = 746
          Height = 303
          BevelOuter = bvNone
          TabOrder = 1
          Visible = False
          object Label52: TLabel
            Left = 20
            Top = 248
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
          object Label53: TLabel
            Left = 71
            Top = 269
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
          object Label54: TLabel
            Left = 71
            Top = 285
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
          object Label56: TLabel
            Left = 262
            Top = 285
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
          object Label57: TLabel
            Left = 262
            Top = 269
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
          object Label58: TLabel
            Left = 434
            Top = 269
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
          object GroupBox2: TGroupBox
            Left = 19
            Top = 20
            Width = 705
            Height = 226
            Caption = 'Mensagem do Boleto'
            TabOrder = 0
            object Label41: TLabel
              Left = 15
              Top = 28
              Width = 47
              Height = 13
              Caption = 'Linha 1:'
            end
            object Label42: TLabel
              Left = 15
              Top = 49
              Width = 47
              Height = 13
              Caption = 'Linha 2:'
            end
            object Label43: TLabel
              Left = 15
              Top = 70
              Width = 47
              Height = 13
              Caption = 'Linha 3:'
            end
            object Label44: TLabel
              Left = 15
              Top = 91
              Width = 47
              Height = 13
              Caption = 'Linha 4:'
            end
            object Label45: TLabel
              Left = 15
              Top = 112
              Width = 47
              Height = 13
              Caption = 'Linha 5:'
            end
            object Label48: TLabel
              Left = 15
              Top = 133
              Width = 47
              Height = 13
              Caption = 'Linha 6:'
            end
            object Label49: TLabel
              Left = 15
              Top = 154
              Width = 47
              Height = 13
              Caption = 'Linha 7:'
            end
            object Label50: TLabel
              Left = 15
              Top = 175
              Width = 47
              Height = 13
              Caption = 'Linha 8:'
            end
            object Label51: TLabel
              Left = 15
              Top = 196
              Width = 47
              Height = 13
              Caption = 'Linha 9:'
            end
            object Edit1: TEdit
              Left = 71
              Top = 24
              Width = 617
              Height = 21
              MaxLength = 69
              TabOrder = 0
              Text = 'Cálculos Válidos até: <dataval>'
            end
            object Edit2: TEdit
              Left = 71
              Top = 45
              Width = 617
              Height = 21
              MaxLength = 69
              TabOrder = 1
              Text = 'Não receber após: <dataval>'
            end
            object Edit3: TEdit
              Left = 71
              Top = 87
              Width = 617
              Height = 21
              MaxLength = 69
              TabOrder = 3
              Text = 'Valor Original: <vo>'
            end
            object Edit4: TEdit
              Left = 71
              Top = 108
              Width = 617
              Height = 21
              MaxLength = 69
              TabOrder = 4
              Text = 'Correção Monetária: <cm>'
            end
            object Edit5: TEdit
              Left = 71
              Top = 129
              Width = 617
              Height = 21
              MaxLength = 69
              TabOrder = 5
              Text = 'Juros: <juros>'
            end
            object Edit6: TEdit
              Left = 71
              Top = 150
              Width = 617
              Height = 21
              MaxLength = 69
              TabOrder = 6
              Text = 'Multa:<multa>'
            end
            object Edit7: TEdit
              Left = 71
              Top = 66
              Width = 617
              Height = 21
              MaxLength = 69
              TabOrder = 2
            end
            object Edit8: TEdit
              Left = 71
              Top = 171
              Width = 617
              Height = 21
              MaxLength = 69
              TabOrder = 7
            end
            object Edit9: TEdit
              Left = 71
              Top = 192
              Width = 617
              Height = 21
              MaxLength = 69
              TabOrder = 8
            end
          end
        end
      end
      object tbsDadosCalculados: TTabSheet
        Caption = 'tbsDadosCalculados'
        ImageIndex = 3
        TabVisible = False
        object fcLabel3: TfcLabel
          Left = 0
          Top = 0
          Width = 761
          Height = 24
          Align = alTop
          Caption = 'Documento para Recálculo [ Valores Calculados ]'
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
        object GroupBox3: TGroupBox
          Left = 8
          Top = 48
          Width = 449
          Height = 310
          TabOrder = 0
          object Label64: TLabel
            Left = 24
            Top = 20
            Width = 67
            Height = 13
            Caption = 'Vencimento'
          end
          object Label62: TLabel
            Left = 140
            Top = 20
            Width = 77
            Height = 13
            Caption = 'Valor Original'
          end
          object Label65: TLabel
            Left = 257
            Top = 20
            Width = 84
            Height = 13
            Caption = 'Dias de Atraso'
          end
          object Label68: TLabel
            Left = 357
            Top = 20
            Width = 48
            Height = 13
            Caption = 'Nº Inad.'
          end
          object Label67: TLabel
            Left = 24
            Top = 68
            Width = 64
            Height = 13
            Caption = 'Pagamento'
          end
          object Label66: TLabel
            Left = 140
            Top = 60
            Width = 63
            Height = 13
            Caption = 'Valor Pago'
          end
          object lblProporcao: TLabel
            Left = 257
            Top = 68
            Width = 43
            Height = 13
            Caption = '% Pago'
          end
          object Label59: TLabel
            Left = 15
            Top = 145
            Width = 112
            Height = 13
            Caption = 'Correção Monetária'
          end
          object Label61: TLabel
            Left = 96
            Top = 176
            Width = 31
            Height = 13
            Caption = 'Juros'
          end
          object Label60: TLabel
            Left = 95
            Top = 209
            Width = 32
            Height = 13
            Caption = 'Multa'
          end
          object Label69: TLabel
            Left = 94
            Top = 252
            Width = 33
            Height = 13
            Caption = 'Saldo'
          end
          object edtVencto: TCMDateTimePicker
            Left = 24
            Top = 36
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
            TabOrder = 0
          end
          object edtVO: TRealEdit
            Left = 140
            Top = 36
            Width = 105
            Height = 21
            TabStop = False
            Alignment = taRightJustify
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
          object edtDias: TRealEdit
            Left = 257
            Top = 36
            Width = 84
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Lines.Strings = (
              '      0')
            ReadOnly = True
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object edtInad: TRealEdit
            Left = 355
            Top = 36
            Width = 45
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Lines.Strings = (
              '      0')
            ReadOnly = True
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object edtDataPagto: TCMDateTimePicker
            Left = 24
            Top = 84
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
          object edtVlrPago: TRealEdit
            Left = 140
            Top = 84
            Width = 105
            Height = 21
            TabStop = False
            Alignment = taRightJustify
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
          object redtProporcao: TRealEdit
            Left = 257
            Top = 84
            Width = 84
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,0000')
            ReadOnly = True
            TabOrder = 6
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = False
          end
          object GroupBox5: TGroupBox
            Left = 136
            Top = 120
            Width = 129
            Height = 161
            Caption = ' Até o pagamento '
            TabOrder = 7
            object edtCM: TRealEdit
              Left = 12
              Top = 20
              Width = 105
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 0
              WordWrap = False
              OnExit = edtCMExit
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object edtMulta: TRealEdit
              Left = 12
              Top = 84
              Width = 105
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 2
              WordWrap = False
              OnExit = edtCMExit
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object edtJuros: TRealEdit
              Left = 12
              Top = 52
              Width = 105
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 1
              WordWrap = False
              OnExit = edtCMExit
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object edtSaldoDoc: TRealEdit
              Left = 12
              Top = 129
              Width = 105
              Height = 21
              TabStop = False
              Alignment = taRightJustify
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
          object GroupBox6: TGroupBox
            Left = 269
            Top = 120
            Width = 129
            Height = 161
            Caption = ' Diferença '
            TabOrder = 8
            object edtCMDif: TRealEdit
              Left = 12
              Top = 20
              Width = 105
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 0
              WordWrap = False
              OnExit = edtCMExit
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object edtMultaDif: TRealEdit
              Left = 12
              Top = 84
              Width = 105
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 2
              WordWrap = False
              OnExit = edtCMExit
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object edtJurosDif: TRealEdit
              Left = 12
              Top = 52
              Width = 105
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 1
              WordWrap = False
              OnExit = edtCMExit
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object edtTotal: TRealEdit
              Left = 12
              Top = 129
              Width = 105
              Height = 21
              TabStop = False
              Alignment = taRightJustify
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
        end
        object GroupBox4: TGroupBox
          Left = 455
          Top = 48
          Width = 297
          Height = 310
          TabOrder = 1
          object Label63: TLabel
            Left = 17
            Top = 124
            Width = 168
            Height = 13
            Caption = 'Alteradores a serem lançados'
          end
          object wwDBEdit1: TwwDBEdit
            Left = 16
            Top = 140
            Width = 233
            Height = 21
            Color = clMenu
            DataField = 'ALTERADOR_CM'
            DataSource = dsAlteradores
            ReadOnly = True
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit3: TwwDBEdit
            Left = 16
            Top = 172
            Width = 233
            Height = 21
            Color = clMenu
            DataField = 'ALTERADOR_JUROS'
            DataSource = dsAlteradores
            ReadOnly = True
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit2: TwwDBEdit
            Left = 16
            Top = 204
            Width = 233
            Height = 21
            Color = clMenu
            DataField = 'ALTERADOR_MULTA'
            DataSource = dsAlteradores
            ReadOnly = True
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 4
        TabVisible = False
        object Label70: TLabel
          Left = 29
          Top = 29
          Width = 212
          Height = 13
          Caption = 'Alteradores existentes no Documento'
        end
        object fcLabel4: TfcLabel
          Left = 0
          Top = 0
          Width = 761
          Height = 24
          Align = alTop
          Caption = 'Documento para Recálculo [ Dados para o Documento ]'
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
        object Label7: TLabel
          Left = 28
          Top = 135
          Width = 228
          Height = 13
          Caption = 'Conta-Caixa X Forma de Cobrança Atual'
        end
        object DBgrdAlteradoresLanc: TwwDBGrid
          Left = 28
          Top = 43
          Width = 557
          Height = 89
          Selected.Strings = (
            'DESCRICAO'#9'18'#9'Tipo do Alterador'#9'F'
            'HISTORICOCOMPL'#9'27'#9'Histórico'#9'F'
            'VALOR'#9'10'#9'Valor'#9'F'
            'DATALANCTO'#9'10'#9'Data'#9'F')
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
          Left = 597
          Top = 75
          Width = 148
          Height = 33
          Caption = 'Excluir Alterador(es)'
          ModalResult = 1
          TabOrder = 1
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
        object GroupBox7: TGroupBox
          Left = 28
          Top = 179
          Width = 557
          Height = 85
          Caption = ' Nova Forma de Cobrança '
          TabOrder = 2
          TabStop = True
          object Label71: TLabel
            Left = 24
            Top = 64
            Width = 439
            Height = 13
            Caption = 
              'Alterando a forma de Recebimento estará gerando um novo NOSSONUM' +
              'ERO'
          end
          object DBcboPortadorForma: TwwDBLookupCombo
            Left = 24
            Top = 18
            Width = 505
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
            LookupTable = cdsPortadorForma
            LookupField = 'CODPORTFORMA'
            Style = csDropDownList
            DropDownWidth = 113
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
            OnChange = DBcboPortadorFormaChange
          end
          object chkBoleto: TCheckBox
            Left = 25
            Top = 42
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
            TabOrder = 1
          end
          object cbDataProgramada: TCheckBox
            Left = 278
            Top = 42
            Width = 265
            Height = 17
            Caption = 'Altera a Data Programada do documento'
            TabOrder = 2
          end
        end
        object GroupBox8: TGroupBox
          Left = 29
          Top = 272
          Width = 426
          Height = 82
          Caption = ' Descrição do Evento '
          TabOrder = 3
          object Panel1: TPanel
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
        object gbAviso: TGroupBox
          Left = 453
          Top = 272
          Width = 132
          Height = 82
          Caption = ' Aviso Programado '
          TabOrder = 4
          object Label80: TLabel
            Left = 84
            Top = 48
            Width = 24
            Height = 13
            Caption = 'dias'
          end
          object spnDiasAviso: TwwDBSpinEdit
            Left = 27
            Top = 44
            Width = 53
            Height = 21
            Increment = 1
            MaxValue = 99
            MinValue = 1
            Value = 1
            MaxLength = 2
            TabOrder = 0
            UnboundDataType = wwDefault
          end
          object cbAviso: TCheckBox
            Left = 8
            Top = 24
            Width = 113
            Height = 17
            Caption = 'Gera Aviso com'
            TabOrder = 1
          end
        end
        object DBedtPortadorForma: TDBEdit
          Left = 28
          Top = 149
          Width = 557
          Height = 21
          DataField = 'PORTADOR_FORMA'
          DataSource = dsDocumento
          ReadOnly = True
          TabOrder = 5
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 372
    Width = 771
    inherited tb97Fundo: TToolbar97
      Left = 356
      inherited btnConfirmar: TfcShapeBtn
        OnClick = btnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object MS_Documento: TMontaSelect
    Template.IdConsulta = 83
    Caption = 'Seleciona'
    Colunas.Strings = (
      'VW.NOME_MESTRE'
      'VW.NOME_IMOVEL'
      'VW.CONNUMERO'
      'VW.CONNOME'
      'VW.DESCCUSTORECIMO'
      'VW.VALOR_LANC'
      'VW.PREVISTO'
      'VW.EFETIVO'
      'VW.ANOCOMPETENCIA'
      'VW.MESCOMPETENCIA'
      'VW.DATAVENCIMENTO'
      'VW.DATALANCAMENTO'
      'VW.DATA_BAIXA'
      'VW.TRGDTINCLUSAO'
      'VW.NF_FORCLI'
      'VW.LOGIN_USUARIO'
      'VW.PORTADOR_FORMA'
      'VW.NOSSONUMERO'
      'VW.DOC_CAPCAR'
      
        'DECODE(VW.FLGORIGEMLANC, '#39'D'#39', '#39'Lançamento de Dívidas'#39', '#39'F'#39', '#39'Fol' +
        'ha de Aluguéis'#39', '#39'I'#39', '#39'Imp. Prestação de Contas'#39', '#39'L'#39', '#39'Lançamen' +
        'to Individual'#39', '#39'P'#39', '#39'Prestação de Contas'#39', '#39'R'#39', '#39'Folha de Remun' +
        'erações'#39', '#39'T'#39', '#39'Lançamento com Rateio'#39', '#39'V'#39', '#39'Lançamento de Prev' +
        'isão'#39')')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'N'
      'N'
      'N'
      'N'
      'D'
      'D'
      'D'
      'D'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Imóvel'
      'Nº Contrato'
      'Contrato'
      'Tipo Receita / Despesa'
      'Valor do Lançamento'
      'Valor Total Previsto'
      'Valor Total Efetivo'
      'Competência (Ano)'
      'Competência (Mês)'
      'Data Vencimento'
      'Data Lançamento'
      'Data de Baixa'
      'Data de Inclusão'
      'Favorecido / Debitado'
      'Usuário'
      'Conta-Caixa'
      'Nº Boleto'
      'Nº Documento'
      'Origem')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'VWLANCAMENTO VW')
    CamposChave.Strings = (
      'VW.IDLANCIMOVEL'
      'VW.CODDOCUMENTO'
      'VW.PLNCODIGO'
      'VW.NODOCUMENTO'
      'VW.IDPESSOA'
      'VW.CODTIPIMOVEL'
      'VW.IDDOCUMENTO'
      'VW.RECPAG'
      'VW.STATUS_DOC')
    Filtro.Strings = (
      'VW.RECPAG = '#39'R'#39
      'VW.FLGINTEGRADO IS NULL'
      'VW.CODDOCUMENTO IS NOT NULL'
      
        '( (RTRIM(VW.STATUS_DOC) <> '#39'2'#39') OR ((RTRIM(VW.STATUS_DOC) = '#39'2'#39')' +
        ' AND (VW.DATA_BAIXA > VW.DATALIMITE)) )')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      '0000'
      '00'
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      ''
      ''
      ''
      ''
      '#0'
      '')
    Larguras.Strings = (
      '20'
      '20'
      '10'
      '20'
      '15'
      '10'
      '10'
      '10'
      '5'
      '4'
      '10'
      '10'
      '10'
      '10'
      '20'
      '10'
      '20'
      '12'
      '18'
      '25')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
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
    LookupSQL.Strings = (
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
      '')
    LookupCampoChave.Strings = (
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
      '')
    LookupCampoExibe.Strings = (
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
      '')
    Left = 464
    Top = 8
  end
  object cdsDocumento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEncargos'
    OnCalcFields = cdsDocumentoCalcFields
    Left = 544
    Top = 22
  end
  object dsDocumento: TDataSource
    DataSet = cdsDocumento
    Left = 541
    Top = 7
  end
  object cdsAlteradoresDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEncargos'
    OnCalcFields = cdsDocumentoCalcFields
    Left = 704
    Top = 22
  end
  object dsAlteradoresDoc: TDataSource
    DataSet = cdsAlteradoresDoc
    Left = 704
    Top = 8
  end
  object cdsLancamentos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEncargos'
    OnCalcFields = cdsDocumentoCalcFields
    Left = 640
    Top = 14
  end
  object dsLancamentos: TDataSource
    DataSet = cdsLancamentos
    Left = 613
    Top = 15
  end
  object cdsContratoImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEncargos'
    OnCalcFields = cdsDocumentoCalcFields
    Left = 696
    Top = 278
  end
  object cdsUltimaBaixa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEncargos'
    OnCalcFields = cdsDocumentoCalcFields
    Left = 696
    Top = 302
  end
  object cdsTotInadimplencia: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEncargos'
    OnCalcFields = cdsDocumentoCalcFields
    Left = 696
    Top = 318
  end
  object cdsEncargos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEncargos'
    Left = 688
    Top = 254
  end
  object cdsAlteradores: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEncargos'
    OnCalcFields = cdsDocumentoCalcFields
    Left = 616
    Top = 86
  end
  object dsAlteradores: TDataSource
    DataSet = cdsAlteradores
    Left = 620
    Top = 103
  end
  object cdsAlteradoresLanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEncargos'
    OnCalcFields = cdsDocumentoCalcFields
    Left = 504
    Top = 110
  end
  object dsAlteradoresLanc: TDataSource
    DataSet = cdsAlteradoresLanc
    Left = 501
    Top = 87
  end
  object cdsPortadorForma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEncargos'
    OnCalcFields = cdsDocumentoCalcFields
    Left = 616
    Top = 278
  end
  object cdsMoedaCM: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEncargos'
    OnCalcFields = cdsDocumentoCalcFields
    Left = 56
    Top = 86
  end
  object cdsMoedaMulta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEncargos'
    OnCalcFields = cdsDocumentoCalcFields
    Left = 56
    Top = 142
  end
  object cdsMoedaJuros: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEncargos'
    OnCalcFields = cdsDocumentoCalcFields
    Left = 56
    Top = 38
  end
end
