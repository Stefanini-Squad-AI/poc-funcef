inherited frmCadContratoImovelMT: TfrmCadContratoImovelMT
  Left = 352
  Top = 109
  HelpContext = 640065
  Caption = 'Cadastro de Contratos de Locação'
  ClientHeight = 513
  ClientWidth = 836
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label46: TLabel [0]
    Left = 456
    Top = 250
    Width = 95
    Height = 13
    Caption = 'Próxima Revisão'
  end
  inherited pnlFundo: TPanel
    Width = 836
    Height = 427
    inherited pnlMestre: TPanel
      Width = 834
      Height = 52
      object Label1: TLabel
        Left = 14
        Top = 4
        Width = 114
        Height = 13
        Caption = 'Número do Contrato'
      end
      object Label4: TLabel
        Left = 154
        Top = 4
        Width = 103
        Height = 13
        Caption = 'Nome do Contrato'
      end
      object DBedtNumeroContrato: TDBEdit2
        Left = 14
        Top = 18
        Width = 121
        Height = 21
        DataField = 'CONNUMERO'
        DataSource = ds
        TabOrder = 0
      end
      object DBedtNomeContrato: TDBEdit2
        Left = 154
        Top = 18
        Width = 544
        Height = 21
        DataField = 'CONNOME'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 53
      Width = 834
      Height = 373
      Tabs.Strings = (
        'Geral'
        'Imóveis'
        'Valor Futuro'
        'Descontos'
        'Datas'
        'Cobrança/Reajuste'
        'Multa/Juros'
        'Obs'
        'Eventos'
        'Fiança'
        'Fiadores'
        'Complemento'
        'Tributos'
        'Confissão de Dívida')
      OnChanging = nil
      detdbGrids.Strings = (
        ''
        'dbgrdDet'
        'dbgrdVlrAno'
        'dbgrdContratoXDesc'
        ''
        ''
        'dbgrdMulta'
        ''
        'dbgrdEvento'
        ''
        'dbgrdFiador'
        ''
        'dbgrdTributos'
        'dbgrdParcelasConfissao')
      inherited pgctrlDetalhe: TPageControl
        Width = 736
        Height = 314
        ActivePage = tbsEventos
        TabOrder = 2
        object tbsGeral: TTabSheet [0]
          Caption = 'Geral'
          ImageIndex = 1
          object Label19: TLabel
            Left = 479
            Top = 11
            Width = 100
            Height = 13
            Caption = 'Valor do Contrato'
          end
          object Label20: TLabel
            Left = 593
            Top = 11
            Width = 39
            Height = 13
            Caption = 'Moeda'
          end
          object Label55: TLabel
            Left = 479
            Top = 54
            Width = 61
            Height = 13
            Caption = 'Tx. Admin.'
          end
          object lblMarca: TLabel
            Left = 16
            Top = 142
            Width = 107
            Height = 13
            Caption = 'Marca ou Franquia'
          end
          object Label65: TLabel
            Left = 384
            Top = 142
            Width = 54
            Height = 13
            Caption = 'Atividade'
          end
          object Label66: TLabel
            Left = 593
            Top = 51
            Width = 84
            Height = 13
            Caption = 'Vagas locadas'
          end
          object Bevel2: TBevel
            Left = 16
            Top = 200
            Width = 671
            Height = 2
            Shape = bsTopLine
          end
          object lblSituacao: TLabel
            Left = 382
            Top = 214
            Width = 113
            Height = 13
            Caption = 'Situação Contratual'
          end
          object lblPerc: TLabel
            Left = 558
            Top = 71
            Width = 10
            Height = 13
            Caption = '%'
          end
          object lblTipoContrato: TLabel
            Left = 479
            Top = 97
            Width = 96
            Height = 13
            Caption = 'Tipo de Contrato'
          end
          object DBedtValorContrato: TDBRealEdit
            Left = 479
            Top = 25
            Width = 102
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '')
            TabOrder = 1
            WordWrap = False
            IntDigits = 15
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'CONVLRAJUSTADO'
            DataSource = ds
          end
          object DBcboMoedaContrato: TwwDBLookupCombo
            Left = 593
            Top = 25
            Width = 94
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOESIGLA'#9'6'#9'Moeda')
            DataField = 'MOECODIGO'
            DataSource = ds
            LookupTable = cdsMoeda
            LookupField = 'MOECODIGO'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = DBcboMoedaContratoChange
          end
          object DBcboMarca: TwwDBLookupCombo
            Left = 16
            Top = 156
            Width = 345
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MRCNOME'#9'40'#9'Marca')
            DataField = 'IDMARCA'
            DataSource = ds
            LookupTable = cdsMarcas
            LookupField = 'IDMARCA'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 5
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object DBcboAtividade: TwwDBLookupCombo
            Left = 382
            Top = 156
            Width = 305
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'ATVDESCRICAO'#9'45'#9'Atividade')
            DataField = 'IDATIVIDADE'
            DataSource = ds
            LookupTable = cdsAtividade
            LookupField = 'IDATIVIDADE'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 6
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object DBchkCobrancaAuto: TDBCheckBox
            Left = 16
            Top = 229
            Width = 289
            Height = 17
            Caption = 'Gerar Cobrança na Folha de Aluguéis'
            DataField = 'FLGCOBRANCAAUTO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          inline molLocatario1: TmolLocatario
            Left = 8
            Top = 8
            Width = 457
            inherited edtLocatario: TEdit
              Width = 367
            end
            inherited btnBuscaLocatario: TBitBtn
              Left = 374
            end
            inherited btnLimpaLocatario: TBitBtn
              Left = 398
            end
            inherited btnAbrePessoa: TBitBtn
              Left = 422
            end
          end
          object DBSpnVagas: TwwDBSpinEdit
            Left = 593
            Top = 66
            Width = 94
            Height = 21
            BiDiMode = bdLeftToRight
            Increment = 1
            MaxValue = 150
            DataField = 'CONQUANTVAGAS'
            DataSource = ds
            ParentBiDiMode = False
            TabOrder = 4
            UnboundDataType = wwDefault
          end
          object dblcSitContratual: TwwDBLookupCombo
            Left = 382
            Top = 228
            Width = 305
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F')
            DataField = 'IDSITCONTIMOB'
            DataSource = ds
            LookupTable = cdsSitContImob
            LookupField = 'IDSITCONTIMOB'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 8
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object dbEdtTaxaAdmin: TDBRealEdit
            Left = 479
            Top = 68
            Width = 73
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 3
            WordWrap = False
            IntDigits = 8
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'CONTAXAADMIN'
            DataSource = ds
          end
          inline molAdministradora1: TmolAdministradora
            Left = 8
            Top = 52
            Width = 457
            TabOrder = 9
            inherited edtAdministradora: TEdit
              Width = 367
            end
            inherited btnBuscaAdministradora: TBitBtn
              Left = 374
            end
            inherited btnLimpaAdministradora: TBitBtn
              Left = 398
            end
            inherited btnAbrePessoa: TBitBtn
              Left = 422
            end
          end
          inline MolResponsavel1: TmolResponsavel
            Left = 8
            Top = 96
            Width = 457
            TabOrder = 10
            inherited Label5: TLabel
              Width = 74
              Caption = 'Responsável'
            end
            inherited edtResponsavel: TEdit
              Width = 368
            end
            inherited btnBuscaResponsavel: TBitBtn
              Left = 375
            end
            inherited btnLimpaResponsavel: TBitBtn
              Left = 399
            end
            inherited btnAbrePessoa: TBitBtn
              Left = 423
            end
          end
          object dblkTipoContrato: TwwDBLookupCombo
            Left = 479
            Top = 112
            Width = 208
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'66'#9'DESCRICAO'#9'F')
            DataField = 'IDTIPOCONTRIMOB'
            DataSource = ds
            LookupTable = cdsTipoContrato
            LookupField = 'IDTIPOCONTRIMOB'
            DropDownWidth = 208
            TabOrder = 11
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'Imóveis'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 728
            Height = 286
            PictureMasks.Strings = (
              'CIMVLRALUGUEL'#9'###,###,#0.00'#9'T'#9'T'
              'CIMVLRAJUSTADO'#9'###,###,#0.00'#9'T'#9'T')
            Selected.Strings = (
              'DSC_MESTRE'#9'20'#9'Imóvel Mestre'#9'F'
              'DSC_IMOVEL'#9'20'#9'Imóvel'#9'F'
              'CODTIPIMOVEL'#9'14'#9'Tipo Imóvel'#9'F'
              'CIMVLRAJUSTADO'#9'15'#9'Aluguel Atual'#9'F'
              'CIMVLRALUGUEL'#9'15'#9'Aluguel Anterior'#9'F'
              'CIMDESCRICAO'#9'20'#9'Descrição'#9'F'
              'IMOCODIGO'#9'12'#9'Código Imóvel'#9'F'
              'CIMPERCENTRATEIO'#9'10'#9'Perc. Rateio'#9'F'
              'CIMDTINI'#9'18'#9'Início Vigência'#9'F'
              'CIMDTFIM'#9'18'#9'Término Vigência'#9'F')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap, dgShowFooter]
            TitleButtons = True
            UseTFields = False
            OnTitleButtonClick = dbgrdEventoTitleButtonClick
            OnUpdateFooter = dbgrdDetUpdateFooter
            FooterHeight = 30
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 728
            Height = 286
            object Label52: TLabel
              Left = 24
              Top = 48
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object Label35: TLabel
              Left = 24
              Top = 94
              Width = 142
              Height = 13
              Caption = 'Valor do Aluguel Anterior'
            end
            object Label51: TLabel
              Left = 280
              Top = 94
              Width = 127
              Height = 13
              Caption = 'Valor do Aluguel Atual'
            end
            object Label39: TLabel
              Left = 520
              Top = 94
              Width = 39
              Height = 13
              Caption = 'Moeda'
            end
            object Label40: TLabel
              Left = 216
              Top = 149
              Width = 103
              Height = 13
              Caption = 'Percentual Rateio'
            end
            object Label33: TLabel
              Left = 310
              Top = 167
              Width = 10
              Height = 13
              Caption = '%'
            end
            object Label41: TLabel
              Left = 45
              Top = 172
              Width = 121
              Height = 13
              Caption = 'para vários contratos'
            end
            inline molImovelAtivo1: TmolImovelAtivo
              Left = 16
              Top = 4
              Width = 633
              inherited edtImovel: TEdit
                Width = 576
              end
              inherited btnBuscaImovel: TBitBtn
                Left = 584
                OnClick = molImovelAtivo1btnBuscaImovelClick
              end
              inherited btnLimpaImovel: TBitBtn
                Left = 608
              end
            end
            object DBedtDescricaoImovel: TDBEdit2
              Left = 24
              Top = 62
              Width = 625
              Height = 21
              DataField = 'CIMDESCRICAO'
              DataSource = dsDet
              TabOrder = 1
            end
            object edtMoeda: TEdit
              Left = 520
              Top = 108
              Width = 129
              Height = 21
              Enabled = False
              TabOrder = 4
            end
            object DBchkRateio: TDBCheckBox
              Left = 24
              Top = 157
              Width = 177
              Height = 17
              Caption = 'Rateia o aluguel do imóvel'
              DataField = 'FLGRATEIO'
              DataSource = dsDet
              TabOrder = 5
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = DBchkRateioClick
            end
            object dbEdtPercentRateio: TDBRealEdit
              Left = 215
              Top = 164
              Width = 90
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 6
              WordWrap = False
              IntDigits = 8
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'CIMPERCENTRATEIO'
              DataSource = dsDet
            end
            object dbedtVlrAluguelAnt: TDBRealEdit
              Left = 23
              Top = 109
              Width = 146
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '20.681,52')
              TabOrder = 2
              WordWrap = False
              IntDigits = 8
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'CIMVLRALUGUEL'
              DataSource = dsDet
            end
            object dbedtVlrAluguelAtual: TDBRealEdit
              Left = 279
              Top = 109
              Width = 146
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '21.987,58')
              TabOrder = 3
              WordWrap = False
              IntDigits = 8
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'CIMVLRAJUSTADO'
              DataSource = dsDet
            end
            object GroupBox16: TGroupBox
              Left = 352
              Top = 144
              Width = 297
              Height = 65
              Caption = 'Período de Vigência'
              TabOrder = 7
              object Label84: TLabel
                Left = 168
                Top = 18
                Width = 59
                Height = 13
                Caption = 'Data Final'
              end
              object Label83: TLabel
                Left = 24
                Top = 18
                Width = 66
                Height = 13
                Caption = 'Data Inicial'
              end
              object DBedtDataFinalVigencia: TCMDateTimePicker
                Left = 168
                Top = 32
                Width = 113
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'CIMDTFIM'
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
              end
              object DBedtDataInicioVigencia: TCMDateTimePicker
                Left = 24
                Top = 32
                Width = 113
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'CIMDTINI'
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
              end
            end
          end
        end
        object tbsValorFuturo: TTabSheet
          Caption = 'Valor Futuro'
          ImageIndex = 3
          object dbgrdVlrAno: TwwDBGrid
            Left = 0
            Top = 0
            Width = 728
            Height = 286
            ControlType.Strings = (
              'FLGCORRIGE;CheckBox;S;N')
            Selected.Strings = (
              'DSC_MESTRE'#9'37'#9'Imóvel Mestre'
              'DSC_IMOVEL'#9'28'#9'Imóvel'
              'ANOINICIO'#9'9'#9'Ano Início'
              'VALOR'#9'14'#9'Novo Valor'
              'FLGCORRIGE'#9'3'#9'Cor.')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsVlrAno
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = True
            OnTitleButtonClick = dbgrdEventoTitleButtonClick
            OnDblClick = dbgrdDetDblClick
            IndicatorColor = icBlack
            FooterHeight = 30
          end
          object pnlVlrAno: TPanel
            Left = 0
            Top = 0
            Width = 728
            Height = 286
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            inline molImovelAtivo2: TmolImovelAtivo
              Left = 24
              Top = 20
              Width = 529
              inherited edtImovel: TEdit
                Width = 441
              end
              inherited btnBuscaImovel: TBitBtn
                Left = 448
              end
              inherited btnLimpaImovel: TBitBtn
                Left = 472
              end
            end
            object GroupBox6: TGroupBox
              Left = 32
              Top = 72
              Width = 153
              Height = 73
              Caption = ' Início de Cobrança '
              TabOrder = 1
              object Label54: TLabel
                Left = 40
                Top = 20
                Width = 23
                Height = 13
                Caption = 'Ano'
              end
              object DBspnAno: TwwDBSpinEdit
                Left = 40
                Top = 36
                Width = 65
                Height = 21
                Increment = 1
                DataField = 'ANOINICIO'
                DataSource = dsVlrAno
                TabOrder = 0
                UnboundDataType = wwDefault
              end
            end
            object GroupBox7: TGroupBox
              Left = 272
              Top = 72
              Width = 201
              Height = 73
              Caption = ' Novo Valor '
              TabOrder = 2
              object dbedtVlrAno: TDBRealEdit
                Left = 23
                Top = 36
                Width = 146
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '2.000,00')
                TabOrder = 0
                WordWrap = False
                IntDigits = 8
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'VALOR'
                DataSource = dsVlrAno
              end
            end
            object dbchkCorrigeVlrAno: TDBCheckBox
              Left = 32
              Top = 160
              Width = 337
              Height = 17
              Caption = 'Reajusta o valor informado até o início da cobrança'
              DataField = 'FLGCORRIGE'
              DataSource = dsVlrAno
              TabOrder = 3
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
        end
        object tbsDescontos: TTabSheet
          Caption = 'Descontos'
          ImageIndex = 10
          object dbgrdContratoXDesc: TwwDBGrid
            Left = 0
            Top = 0
            Width = 728
            Height = 286
            ControlType.Strings = (
              'FLGCORRIGE;CheckBox;S;N'
              'DATAINICIO;CustomEdit;CMDateTimePicker1')
            PictureMasks.Strings = (
              'PERDESCONTO'#9'#,##0.0000'#9'T'#9'T'
              'VLRDESCONTO'#9'#,##0.00'#9'T'#9'T')
            Selected.Strings = (
              'DATAINICIO'#9'12'#9'Data Inicial'
              'DATAFIM'#9'13'#9'Data Final'
              'DESCRICAO'#9'38'#9'Alterador'
              'PERDESCONTO'#9'10'#9'Percentual'
              'VLRDESCONTO'#9'10'#9'Valor fixo'
              'MOESIGLA'#9'18'#9'Moeda'
              'OBSERVACAO'#9'60'#9'Observação')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsContratoXDesc
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = True
            OnTitleButtonClick = dbgrdEventoTitleButtonClick
            OnDblClick = dbgrdDetDblClick
            IndicatorColor = icBlack
            FooterHeight = 30
          end
          object pnlContratoXDesc: TPanel
            Left = 0
            Top = 0
            Width = 728
            Height = 286
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object lblObsAlt: TLabel
              Left = 16
              Top = 153
              Width = 77
              Height = 13
              Caption = 'Observação: '
            end
            object GroupBox8: TGroupBox
              Left = 336
              Top = 16
              Width = 321
              Height = 130
              Caption = 'Valor do desconto'
              TabOrder = 2
              TabStop = True
              object Label74: TLabel
                Left = 100
                Top = 96
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
              object Label75: TLabel
                Left = 16
                Top = 18
                Width = 54
                Height = 13
                Caption = 'Valor fixo'
              end
              object Label76: TLabel
                Left = 16
                Top = 82
                Width = 62
                Height = 13
                Caption = 'Percentual'
              end
              object Label77: TLabel
                Left = 16
                Top = 59
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
              object Label78: TLabel
                Left = 175
                Top = 18
                Width = 39
                Height = 13
                Caption = 'Moeda'
              end
              object dbedtPercDesc: TDBRealEdit
                Left = 16
                Top = 96
                Width = 81
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,1000')
                TabOrder = 2
                WordWrap = False
                IntDigits = 3
                DecDigits = 4
                NumberFormat = fNumber
                Signal = False
                DataField = 'PERDESCONTO'
                DataSource = dsContratoXDesc
              end
              object dbedtValorDesc: TDBRealEdit
                Left = 16
                Top = 32
                Width = 145
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
                DataField = 'VLRDESCONTO'
                DataSource = dsContratoXDesc
              end
              object dblkpMoedaDesc: TwwDBLookupCombo
                Left = 175
                Top = 32
                Width = 129
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'MOESIGLA'#9'6'#9'Sigla'#9'F')
                DataField = 'MOECODIGO'
                DataSource = dsContratoXDesc
                LookupTable = cdsMoedaDesc
                LookupField = 'MOECODIGO'
                Style = csDropDownList
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
                OnCloseUp = dblkpMoedaDescCloseUp
              end
            end
            object GroupBox11: TGroupBox
              Left = 16
              Top = 16
              Width = 297
              Height = 65
              Caption = 'Período de Vencimento'
              TabOrder = 0
              object Label73: TLabel
                Left = 16
                Top = 18
                Width = 66
                Height = 13
                Caption = 'Data Inicial'
              end
              object Label79: TLabel
                Left = 168
                Top = 18
                Width = 59
                Height = 13
                Caption = 'Data Final'
              end
              object dtpckrDtInicial: TCMDateTimePicker
                Left = 16
                Top = 32
                Width = 113
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAINICIO'
                DataSource = dsContratoXDesc
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
              object dtpckrDtFinal: TCMDateTimePicker
                Left = 168
                Top = 32
                Width = 113
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAFIM'
                DataSource = dsContratoXDesc
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
            object GroupBox12: TGroupBox
              Left = 16
              Top = 89
              Width = 297
              Height = 57
              Caption = 'Alterador'
              TabOrder = 1
              object dblkpAlterador: TwwDBLookupCombo
                Left = 12
                Top = 22
                Width = 269
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'35'#9'Descrição'#9'F')
                DataField = 'CODALTERADOR'
                DataSource = dsContratoXDesc
                LookupTable = cdsAlteradorXTipoImovel
                LookupField = 'CODALTERADOR'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = True
                OnCloseUp = dblkpAlteradorCloseUp
              end
            end
            object dbmemObservacao: TDBMemo
              Left = 16
              Top = 168
              Width = 297
              Height = 57
              DataField = 'OBSERVACAO'
              DataSource = dsContratoXDesc
              MaxLength = 60
              TabOrder = 3
            end
          end
        end
        object tbsDatas: TTabSheet
          Caption = 'Datas'
          ImageIndex = 2
          object Label6: TLabel
            Left = 16
            Top = 10
            Width = 109
            Height = 13
            Caption = 'Data de Assinatura'
          end
          object Label7: TLabel
            Left = 152
            Top = 10
            Width = 105
            Height = 13
            Caption = 'Início da Vigência'
          end
          object Label8: TLabel
            Left = 520
            Top = 10
            Width = 99
            Height = 13
            Caption = 'Término Vigência'
          end
          object Bevel3: TBevel
            Left = 16
            Top = 56
            Width = 617
            Height = 3
            Shape = bsTopLine
          end
          object Bevel1: TBevel
            Left = 16
            Top = 112
            Width = 617
            Height = 3
            Shape = bsTopLine
          end
          object Label45: TLabel
            Left = 520
            Top = 122
            Width = 82
            Height = 13
            Caption = 'Aviso Revisão'
          end
          object Label44: TLabel
            Left = 384
            Top = 122
            Width = 95
            Height = 13
            Caption = 'Próxima Revisão'
          end
          object Label43: TLabel
            Left = 152
            Top = 122
            Width = 90
            Height = 13
            Caption = 'Aviso Denúncia'
          end
          object Label9: TLabel
            Left = 16
            Top = 122
            Width = 92
            Height = 13
            Caption = 'Limite Denúncia'
          end
          object Label42: TLabel
            Left = 16
            Top = 66
            Width = 106
            Height = 13
            Caption = 'Início da Carência'
          end
          object Label3: TLabel
            Left = 152
            Top = 66
            Width = 92
            Height = 13
            Caption = 'Fim da Carência'
          end
          object Label63: TLabel
            Left = 520
            Top = 66
            Width = 103
            Height = 13
            Caption = 'Solic.de Rescisão'
          end
          object DBedtDataAssinatura: TCMDateTimePicker
            Left = 16
            Top = 24
            Width = 113
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'CONDATAASSINATURA'
            DataSource = ds
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
          object DBedtDataInicio: TCMDateTimePicker
            Left = 152
            Top = 24
            Width = 113
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'CONDATAINICIO'
            DataSource = ds
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
          object DBchkIndeterminado: TDBCheckBox
            Left = 312
            Top = 24
            Width = 177
            Height = 21
            Caption = 'Em Negociação'
            DataField = 'FLGINDETERMINADO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnClick = DBchkIndeterminadoClick
          end
          object DBedtDataFim: TCMDateTimePicker
            Left = 520
            Top = 24
            Width = 113
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'CONDATAFIM'
            DataSource = ds
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
            OnExit = DBedtDataFimExit
          end
          object DBedtDataAvRenegoc: TCMDateTimePicker
            Left = 520
            Top = 136
            Width = 113
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'CONDATAAVRENEGOC'
            DataSource = ds
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
            TabOrder = 4
          end
          object DBedtDataRenegoc: TCMDateTimePicker
            Left = 384
            Top = 136
            Width = 113
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'CONDATARENEGOC'
            DataSource = ds
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
            TabOrder = 5
          end
          object DBedtDataAvisoDenuncia: TCMDateTimePicker
            Left = 152
            Top = 136
            Width = 113
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'CONDATAAVDENUNCIA'
            DataSource = ds
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
            TabOrder = 6
          end
          object DBedtDataDenuncia: TCMDateTimePicker
            Left = 16
            Top = 136
            Width = 113
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'CONDATADENUNCIA'
            DataSource = ds
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
            TabOrder = 7
          end
          object DBedtDataIniCarencia: TCMDateTimePicker
            Left = 16
            Top = 80
            Width = 113
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'CONDATAINICAREN'
            DataSource = ds
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
            TabOrder = 8
          end
          object DBedtDataFimCarencia: TCMDateTimePicker
            Left = 152
            Top = 80
            Width = 113
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'CONDATACARENCIA'
            DataSource = ds
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
            TabOrder = 9
          end
          object CMDateTimePicker2: TCMDateTimePicker
            Left = 520
            Top = 80
            Width = 113
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'CONDATASOLRESC'
            DataSource = ds
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
            TabOrder = 10
          end
        end
        object tbsCobranca: TTabSheet
          Caption = 'Cobrança / Reajuste'
          ImageIndex = 4
          object Label21: TLabel
            Left = 8
            Top = 140
            Width = 211
            Height = 13
            Caption = 'Tipo de Receita referente ao Aluguel'
          end
          object Label22: TLabel
            Left = 8
            Top = 180
            Width = 111
            Height = 13
            Caption = 'Forma de Cobrança'
          end
          object Label53: TLabel
            Left = 8
            Top = 219
            Width = 195
            Height = 13
            Caption = 'Mensagem do Boleto de Cobrança'
          end
          object Bevel4: TBevel
            Left = 395
            Top = 10
            Width = 9
            Height = 246
            Shape = bsLeftLine
          end
          object DBcboTipoRecCusto: TwwDBLookupCombo
            Left = 8
            Top = 154
            Width = 369
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCCUSTORECIMO'#9'60'#9'DESCCUSTORECIMO')
            DataField = 'IDTIPOCUSTORECIMO'
            DataSource = ds
            LookupTable = cdsTipoCustoRec
            LookupField = 'IDTIPOCUSTORECIMO'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 3
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = True
          end
          object DBcboPortadorForma: TwwDBLookupCombo
            Left = 8
            Top = 194
            Width = 369
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Descrição'#9'F'
              'FLGATIVO'#9'1'#9'Ativo'#9'F')
            DataField = 'CODPORTFORMA'
            DataSource = ds
            LookupTable = cdsPortadorForma
            LookupField = 'CODPORTFORMA'
            Options = [loColLines, loTitles]
            Style = csDropDownList
            TabOrder = 4
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = True
          end
          object DBrdgCompetencia: TDBRadioGroup
            Left = 117
            Top = 79
            Width = 259
            Height = 54
            Caption = ' Mês de Competência do Aluguel '
            Columns = 2
            DataField = 'FLGCOMPETALUGUEL'
            DataSource = ds
            Items.Strings = (
              'o mês Anterior'
              'o mês Corrente'
              'o mês Posterior')
            TabOrder = 2
            Values.Strings = (
              'A'
              'C'
              'P')
          end
          object grpReajuste: TGroupBox
            Left = 416
            Top = 90
            Width = 265
            Height = 167
            Caption = 'Indice de Reajuste '
            TabOrder = 7
            TabStop = True
            object Label14: TLabel
              Left = 19
              Top = 16
              Width = 36
              Height = 13
              Caption = 'Índice'
            end
            object Label15: TLabel
              Left = 20
              Top = 58
              Width = 78
              Height = 13
              Caption = 'Periodicidade'
            end
            object Label34: TLabel
              Left = 74
              Top = 76
              Width = 37
              Height = 13
              Caption = 'Meses'
            end
            object Label72: TLabel
              Left = 247
              Top = 31
              Width = 10
              Height = 13
              Caption = '%'
            end
            object Image2: TImage
              Left = 143
              Top = 31
              Width = 18
              Height = 18
              AutoSize = True
              Picture.Data = {
                07544269746D61704E010000424D4E0100000000000076000000280000001200
                0000120000000100040000000000D80000000000000000000000100000001000
                0000000000000000800000800000008080008000000080008000808000008080
                8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF00888888888888888888000000888888877777888888000000888888000007
                8888880000008888880FFF078888880000008888880FFF078888880000008888
                880FFF078888880000008877770FFF077777780000008000000FFF0000007800
                000080FFFFFFFFFFFFF07800000080FFFFFFFFFFFFF07800000080FFFFFFFFFF
                FFF0780000008000000FFF000000880000008888880FFF078888880000008888
                880FFF078888880000008888880FFF078888880000008888880FFF0788888800
                0000888888000008888888000000888888888888888888000000}
              Transparent = True
            end
            object DBcboIndiceReajuste: TwwDBLookupCombo
              Left = 19
              Top = 30
              Width = 118
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOESIGLA'#9'6'#9'Moeda')
              DataField = 'CONINDICEREAJUSTE'
              DataSource = ds
              LookupTable = cdsMoeda
              LookupField = 'MOECODIGO'
              Style = csDropDownList
              DropDownCount = 4
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object DBspnPeriodicidadeReajuste: TwwDBSpinEdit
              Left = 20
              Top = 72
              Width = 49
              Height = 21
              Increment = 1
              DataField = 'CONPERREAJUSTE'
              DataSource = ds
              TabOrder = 2
              UnboundDataType = wwDefault
            end
            object DBRealEdit3: TDBRealEdit
              Left = 169
              Top = 28
              Width = 73
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,0000')
              TabOrder = 1
              WordWrap = False
              IntDigits = 8
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
              DataField = 'CONPERCREAJUSTE'
              DataSource = ds
            end
            object DBrdgMesReferencia: TDBRadioGroup
              Left = 19
              Top = 103
              Width = 230
              Height = 52
              Caption = ' Usar o Índice '
              DataField = 'CONMESREFREAJUSTE'
              DataSource = ds
              Items.Strings = (
                'referente ao mês anterior'
                'referente ao mês do reajuste')
              TabOrder = 3
              Values.Strings = (
                'A'
                'C')
            end
          end
          object DBcboMsgBoleto: TwwDBLookupCombo
            Left = 8
            Top = 233
            Width = 369
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MSGDESCRICAO'#9'60'#9'Descrição'#9'F')
            DataField = 'IDMSGBOLETO'
            DataSource = ds
            LookupTable = cdsMsgBoleto
            LookupField = 'IDMSGBOLETO'
            Style = csDropDownList
            DropDownCount = 5
            DropDownWidth = 8
            TabOrder = 5
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = True
          end
          object grpVencPrincipal: TGroupBox
            Left = 8
            Top = 6
            Width = 367
            Height = 67
            Caption = ' Vencimento '
            TabOrder = 0
            object Label12: TLabel
              Left = 71
              Top = 26
              Width = 9
              Height = 24
              Caption = 'º'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBspnVencimento: TwwDBSpinEdit
              Left = 22
              Top = 27
              Width = 45
              Height = 21
              Increment = 1
              MaxValue = 31
              MinValue = 1
              Value = 1
              DataField = 'CONDIAVENCIMENTO'
              DataSource = ds
              TabOrder = 0
              UnboundDataType = wwDefault
            end
            object DBrdgTipoDiaVenc: TDBRadioGroup
              Left = 148
              Top = 8
              Width = 141
              Height = 52
              DataField = 'FLGTIPODIAVENC'
              DataSource = ds
              Items.Strings = (
                'Dia do mês'
                'Dia útil')
              TabOrder = 1
              Values.Strings = (
                'C'
                'U')
            end
          end
          object GroupBox3: TGroupBox
            Left = 8
            Top = 79
            Width = 103
            Height = 54
            Caption = ' Periodicidade '
            TabOrder = 1
            object Label68: TLabel
              Left = 58
              Top = 25
              Width = 36
              Height = 13
              Caption = 'meses'
            end
            object DBspnPeriodicidade: TwwDBSpinEdit
              Left = 10
              Top = 21
              Width = 41
              Height = 21
              Increment = 1
              MaxValue = 99
              MinValue = 1
              Value = 1
              DataField = 'CONPERALUGUEL'
              DataSource = ds
              MaxLength = 2
              TabOrder = 0
              UnboundDataType = wwDefault
            end
          end
          object GroupBox5: TGroupBox
            Left = 416
            Top = 6
            Width = 265
            Height = 78
            Caption = ' Datas para Reajuste '
            TabOrder = 6
            TabStop = True
            object Label50: TLabel
              Left = 19
              Top = 16
              Width = 60
              Height = 13
              Caption = 'Data-Base'
            end
            object Label11: TLabel
              Left = 145
              Top = 16
              Width = 94
              Height = 13
              Caption = 'Data do Próximo'
            end
            object DBedtUltReajuste: TCMDateTimePicker
              Left = 19
              Top = 30
              Width = 97
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'CONDATAREAJUSTE'
              DataSource = ds
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
            object DBedtProxReajuste: TCMDateTimePicker
              Left = 145
              Top = 30
              Width = 97
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'CONPROXREAJUSTE'
              DataSource = ds
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
            object chkSemReajuste: TCheckBox
              Left = 19
              Top = 56
              Width = 225
              Height = 15
              Caption = 'O contrato não será reajustado'
              TabOrder = 2
            end
          end
        end
        object tbsMulta: TTabSheet
          Caption = 'Multa / Juros'
          ImageIndex = 5
          object pnlMulta: TPanel
            Left = 0
            Top = 0
            Width = 728
            Height = 182
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object dbgrdMulta: TwwDBGrid
              Left = 0
              Top = 0
              Width = 728
              Height = 182
              ControlType.Strings = (
                'FLGINDETERMINADO;CheckBox;S;N'
                'FLGJUROSPROPORC;CheckBox;S;N')
              Selected.Strings = (
                'DATAINI'#9'10'#9'Data Início'#9'F'
                'DATAFIM'#9'10'#9'Data Fim'#9'F'
                'FLGINDETERMINADO'#9'12'#9'Indeterminado'#9'F'
                'DESCCUSTORECIMO'#9'25'#9'Receita'#9'F'
                'DSCINDCORR'#9'12'#9'Ind. Correção'#9'F'
                'MESREFCORRECAO'#9'11'#9'Mês Correção'#9'F'
                'VLRMULTA'#9'8'#9'Vlr. Multa'#9'F'
                'DSCMOEMULTA'#9'11'#9'Moeda Multa'#9'F'
                'PERCMULTA'#9'7'#9'Multa'#9'F'
                'VLRJUROS'#9'8'#9'Vlr. Juros'#9'F'
                'DSCMOEJUROS'#9'10'#9'Moeda Juros'#9'F'
                'PERCJUROS'#9'6'#9'Juros'#9'F'
                'DSCPERIODOJUROS'#9'6'#9'Período Juros'#9'F'
                'FLGJUROSPROPORC'#9'11'#9'Proporcionais'#9'F'
                'DIASTOLERANCIA'#9'13'#9'Dias Tolerância'#9'F'
                'DSCTIPODIATOLERA'#9'13'#9'Tipo Dia Tolerância'#9'F'
                'DIASREPASSE'#9'11'#9'Dias Repasse'#9'F'
                'DSCTIPODIAREPASS'#9'13'#9'Tipo Dia Repasse'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsMulta
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = True
              UseTFields = False
              OnTitleButtonClick = dbgrdEventoTitleButtonClick
              OnDblClick = dbgrdDetDblClick
              IndicatorColor = icBlack
              OnUpdateFooter = dbgrdDetUpdateFooter
              FooterHeight = 30
            end
            object pnlDetMulta: TPanel
              Left = 0
              Top = 0
              Width = 728
              Height = 182
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object lbltiporeceita: TLabel
                Left = 16
                Top = 10
                Width = 92
                Height = 13
                Caption = 'Tipo de Receita'
              end
              object GroupBox18: TGroupBox
                Left = 415
                Top = 109
                Width = 279
                Height = 70
                Caption = 'Vigência'
                TabOrder = 4
                object lblviginicio: TLabel
                  Left = 9
                  Top = 14
                  Width = 66
                  Height = 13
                  Caption = 'Data Inicial'
                end
                object lblvigfim: TLabel
                  Left = 133
                  Top = 14
                  Width = 59
                  Height = 13
                  Caption = 'Data Final'
                end
                object edDataIniVigencia: TCMDateTimePicker
                  Left = 9
                  Top = 28
                  Width = 96
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAINI'
                  DataSource = dsMulta
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
                object edDataFimVigencia: TCMDateTimePicker
                  Left = 133
                  Top = 28
                  Width = 96
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAFIM'
                  DataSource = dsMulta
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
                object cbDataFimIndeterminada: TDBCheckBox
                  Left = 9
                  Top = 50
                  Width = 162
                  Height = 17
                  Caption = 'Data Final Indeterminada'
                  DataField = 'FLGINDETERMINADO'
                  DataSource = dsMulta
                  TabOrder = 2
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                  OnClick = cbDataFimIndeterminadaClick
                end
              end
              object grpMulta: TGroupBox
                Left = 17
                Top = 30
                Width = 391
                Height = 51
                Caption = ' Multa por atraso '
                TabOrder = 0
                TabStop = True
                object Label13: TLabel
                  Left = 341
                  Top = 26
                  Width = 14
                  Height = 16
                  Caption = '%'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label16: TLabel
                  Left = 16
                  Top = 11
                  Width = 30
                  Height = 13
                  Caption = 'Valor'
                end
                object Label17: TLabel
                  Left = 273
                  Top = 11
                  Width = 62
                  Height = 13
                  Caption = 'Percentual'
                end
                object Label18: TLabel
                  Left = 252
                  Top = 26
                  Width = 18
                  Height = 16
                  Caption = 'ou'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label24: TLabel
                  Left = 120
                  Top = 11
                  Width = 39
                  Height = 13
                  Caption = 'Moeda'
                end
                object DBedtPercentMulta: TDBRealEdit
                  Left = 273
                  Top = 24
                  Width = 64
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 2
                  WordWrap = False
                  IntDigits = 7
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'PERCMULTA'
                  DataSource = dsMulta
                end
                object DBedtVlrMulta: TDBRealEdit
                  Left = 16
                  Top = 24
                  Width = 97
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '10,00')
                  TabOrder = 0
                  WordWrap = False
                  IntDigits = 15
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRMULTA'
                  DataSource = dsMulta
                end
                object DBcboMoedaMulta: TwwDBLookupCombo
                  Left = 120
                  Top = 24
                  Width = 129
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'MOESIGLA'#9'10'#9'Sigla'#9'F'
                    'FLGPERCVALOR'#9'1'#9'Tipo'#9'F')
                  DataField = 'MOEDAMULTA'
                  DataSource = dsMulta
                  LookupTable = cdsMoeda
                  LookupField = 'MOECODIGO'
                  Options = [loTitles]
                  Style = csDropDownList
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
              end
              object GroupBox4: TGroupBox
                Left = 17
                Top = 82
                Width = 212
                Height = 98
                Caption = 'Dias de Limite'
                TabOrder = 1
                object Label25: TLabel
                  Left = 7
                  Top = 12
                  Width = 61
                  Height = 13
                  Caption = 'Tolerância'
                end
                object Label26: TLabel
                  Left = 114
                  Top = 12
                  Width = 50
                  Height = 13
                  Caption = 'Repasse'
                end
                object Bevel5: TBevel
                  Left = 106
                  Top = 13
                  Width = 7
                  Height = 80
                  Shape = bsLeftLine
                end
                object DBspnDiaTolerancia: TwwDBSpinEdit
                  Left = 9
                  Top = 26
                  Width = 49
                  Height = 21
                  Increment = 1
                  MaxValue = 31
                  DataField = 'DIASTOLERANCIA'
                  DataSource = dsMulta
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  OnChange = DBspnDiaToleranciaChange
                end
                object DBrdgTipoDiaTolera: TDBRadioGroup
                  Left = 9
                  Top = 47
                  Width = 91
                  Height = 45
                  DataField = 'FLGTIPODIATOLERA'
                  DataSource = dsMulta
                  Enabled = False
                  Items.Strings = (
                    'Dias'
                    'Dias úteis')
                  TabOrder = 1
                  Values.Strings = (
                    'C'
                    'U')
                end
                object DBspnDiaRepasse: TwwDBSpinEdit
                  Left = 114
                  Top = 26
                  Width = 49
                  Height = 21
                  Increment = 1
                  MaxValue = 31
                  DataField = 'DIASREPASSE'
                  DataSource = dsMulta
                  TabOrder = 2
                  UnboundDataType = wwDefault
                  OnChange = DBspnDiaRepasseChange
                end
                object DBrdgTipoDiaRepasse: TDBRadioGroup
                  Left = 114
                  Top = 47
                  Width = 91
                  Height = 45
                  DataField = 'FLGTIPODIAREPASS'
                  DataSource = dsMulta
                  Enabled = False
                  Items.Strings = (
                    'Dias'
                    'Dias úteis')
                  TabOrder = 3
                  Values.Strings = (
                    'C'
                    'U')
                end
              end
              object GroupBox17: TGroupBox
                Left = 233
                Top = 82
                Width = 175
                Height = 99
                Caption = 'Correção Monetária'
                TabOrder = 2
                object Label27: TLabel
                  Left = 7
                  Top = 15
                  Width = 36
                  Height = 13
                  Caption = 'Índice'
                end
                object Label28: TLabel
                  Left = 8
                  Top = 53
                  Width = 96
                  Height = 13
                  Caption = 'Utilizar indice de'
                end
                object Label29: TLabel
                  Left = 8
                  Top = 67
                  Width = 112
                  Height = 13
                  Caption = 'mes(es) anterior(es)'
                end
                object dblcbIndCM: TCMDBLookupCombo
                  Left = 6
                  Top = 29
                  Width = 163
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'MOESIGLA'#9'10'#9'Sigla'#9'F'
                    'FLGPERCVALOR'#9'1'#9'Tipo'#9'F')
                  DataField = 'IDINDCORRECAO'
                  DataSource = dsMulta
                  LookupTable = cdsMoeda
                  LookupField = 'MOECODIGO'
                  Options = [loTitles]
                  Style = csDropDownList
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                  OnChange = dblcbIndCMChange
                end
                object dbSpinMesesAnteriores: TwwDBSpinEdit
                  Left = 125
                  Top = 57
                  Width = 44
                  Height = 21
                  Increment = 1
                  MaxValue = 9
                  DataField = 'MESREFCORRECAO'
                  DataSource = dsMulta
                  Enabled = False
                  TabOrder = 1
                  UnboundDataType = wwDefault
                end
              end
              object grpMora: TGroupBox
                Left = 415
                Top = 0
                Width = 279
                Height = 106
                Caption = ' Juros de Mora '
                TabOrder = 3
                TabStop = True
                object Label30: TLabel
                  Left = 11
                  Top = 13
                  Width = 30
                  Height = 13
                  Caption = 'Valor'
                end
                object Label31: TLabel
                  Left = 121
                  Top = 63
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
                object Label56: TLabel
                  Left = 51
                  Top = 49
                  Width = 62
                  Height = 13
                  Caption = 'Percentual'
                end
                object lblOu: TLabel
                  Left = 20
                  Top = 63
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
                object lblmoedajuros: TLabel
                  Left = 145
                  Top = 13
                  Width = 39
                  Height = 13
                  Caption = 'Moeda'
                end
                object lblperiodjuros: TLabel
                  Left = 145
                  Top = 49
                  Width = 78
                  Height = 13
                  Caption = 'Periodicidade'
                end
                object DBedtVlrMora: TDBRealEdit
                  Left = 11
                  Top = 27
                  Width = 105
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '    ,00')
                  TabOrder = 0
                  WordWrap = False
                  IntDigits = 15
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRJUROS'
                  DataSource = dsMulta
                end
                object DBedtPercentMora: TDBRealEdit
                  Left = 51
                  Top = 63
                  Width = 65
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,0000')
                  TabOrder = 2
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 4
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'PERCJUROS'
                  DataSource = dsMulta
                end
                object DBedtMoedaMora: TwwDBLookupCombo
                  Left = 145
                  Top = 27
                  Width = 123
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'MOESIGLA'#9'10'#9'Sigla'#9'F'
                    'FLGPERCVALOR'#9'1'#9'Tipo'#9'F')
                  DataField = 'MOEDAJUROS'
                  DataSource = dsMulta
                  LookupTable = cdsMoeda
                  LookupField = 'MOECODIGO'
                  Options = [loTitles]
                  Style = csDropDownList
                  DropDownCount = 6
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object dblcPeriodicidade: TwwDBComboBox
                  Left = 145
                  Top = 63
                  Width = 123
                  Height = 21
                  ShowButton = True
                  Style = csDropDownList
                  MapList = True
                  AllowClearKey = False
                  DataField = 'PERIODOJUROS'
                  DataSource = dsMulta
                  DropDownCount = 5
                  ItemHeight = 13
                  Items.Strings = (
                    'Diária'#9'D'
                    'Mensal'#9'M')
                  Sorted = False
                  TabOrder = 3
                  UnboundDataType = wwDefault
                end
                object cbcbMoraProporc: TDBCheckBox
                  Left = 12
                  Top = 85
                  Width = 205
                  Height = 17
                  Caption = 'Mora proporcional ao nº de dias'
                  DataField = 'FLGJUROSPROPORC'
                  DataSource = dsMulta
                  TabOrder = 4
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
              end
              object DBcboTipoRecDes: TwwDBLookupCombo
                Left = 112
                Top = 6
                Width = 296
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'60'#9'DESCCUSTORECIMO'#9'F')
                DataField = 'IDTIPOCUSTORECIMO'
                DataSource = dsMulta
                LookupTable = cdsTipoCustoRec
                LookupField = 'IDTIPOCUSTORECIMO'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 5
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
            end
          end
          object pnlMultaRescisoria: TPanel
            Left = 0
            Top = 182
            Width = 728
            Height = 104
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object gbRegra: TGroupBox
              Left = 13
              Top = 3
              Width = 463
              Height = 43
              Caption = 'Regra de Calculo da Multa Rescisória '
              ParentShowHint = False
              ShowHint = False
              TabOrder = 0
              object sbHelpRegra: TSpeedButton
                Left = 424
                Top = 14
                Width = 23
                Height = 22
                Flat = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  8888888888FFFFF8888888888000008888888888F777778FF888888004444400
                  888888877888F8778F888874447F7444088888788887FF8878F8874444FFF444
                  408887F88877788887F88744447F74444088878888878888878F7C4444444444
                  44087F888888F888887F7C44444F844444087F888887F888887F7C44444F8444
                  44087F8888878FF8887F7C444448FF4444087F888FF877FF887F7C44FF448FF4
                  440878F877F8877F887887C4FF848FF4408887F877FFF77887F887C44FFFFF84
                  4088878F877777888788887CC4FFF44408888878FF77788F788888877CCCCC77
                  8888888778FFFF77888888888777778888888888877777888888}
                NumGlyphs = 2
                OnClick = sbHelpRegraClick
              end
              object dblcRegra: TwwDBLookupCombo
                Left = 6
                Top = 15
                Width = 410
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOMEREGRA'#9'60'#9'Nome da Regra'#9'F')
                DataField = 'IDREGRARES'
                DataSource = ds
                LookupTable = cdsRegra
                LookupField = 'IDREGRA'
                DropDownWidth = 281
                TabOrder = 0
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = True
              end
            end
            object GroupBox10: TGroupBox
              Left = 13
              Top = 50
              Width = 321
              Height = 47
              Caption = 'Multa Rescisória'
              TabOrder = 1
              object Label67: TLabel
                Left = 8
                Top = 23
                Width = 47
                Height = 13
                Caption = 'Calcular'
              end
              object Label71: TLabel
                Left = 118
                Top = 21
                Width = 35
                Height = 16
                Caption = '% ou'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label70: TLabel
                Left = 188
                Top = 23
                Width = 125
                Height = 13
                Caption = 'meses conforme regra'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBRealEdit1: TDBRealEdit
                Left = 56
                Top = 19
                Width = 59
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 0
                WordWrap = False
                IntDigits = 3
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'PERMULTARESC'
                DataSource = ds
              end
              object DBRealEdit2: TDBRealEdit
                Left = 155
                Top = 19
                Width = 29
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0')
                TabOrder = 1
                WordWrap = False
                IntDigits = 3
                DecDigits = 0
                NumberFormat = fNumber
                Signal = False
                DataField = 'QTDEMULTARESC'
                DataSource = ds
              end
            end
            object GroupBox9: TGroupBox
              Left = 486
              Top = 3
              Width = 209
              Height = 43
              Caption = 'Verificar Multa Rescisória'
              TabOrder = 2
              object edtMultaRes: TDBRealEdit
                Left = 20
                Top = 16
                Width = 113
                Height = 21
                Alignment = taRightJustify
                Color = clInactiveCaptionText
                Lines.Strings = (
                  '0,00')
                TabOrder = 0
                WordWrap = False
                IntDigits = 3
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
              end
              object btnCalcMulta: TBitBtn
                Left = 151
                Top = 15
                Width = 24
                Height = 22
                Hint = 'Calcula valor da multa'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = btnCalcMultaClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
                  73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
                  0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
                  0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                  0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
                  0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
                  0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
                  0333337F777777737F333308888888880333337F333333337F33330888888888
                  03333373FFFFFFFF733333700000000073333337777777773333}
                NumGlyphs = 2
              end
            end
          end
        end
        object tbsObs: TTabSheet
          Caption = 'Obs'
          ImageIndex = 6
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 728
            Height = 154
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 728
              Height = 27
              Align = alTop
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = 'Observações'
              Color = clNavy
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object DBmemContrato: TwwDBRichEdit
              Left = 0
              Top = 27
              Width = 728
              Height = 127
              ScrollBars = ssVertical
              Align = alClient
              AutoURLDetect = True
              DataField = 'CONDESCRICAO'
              DataSource = ds
              MaxLength = 1750
              PrintJobName = 'Delphi 5'
              TabOrder = 1
              PopupOptions = [rpoPopupEdit, rpoPopupCut, rpoPopupCopy, rpoPopupPaste, rpoPopupFont]
              EditorCaption = 'Edit Rich Text'
              EditorPosition.Left = 0
              EditorPosition.Top = 0
              EditorPosition.Width = 0
              EditorPosition.Height = 0
              MeasurementUnits = muCentimeters
              PrintMargins.Top = 1
              PrintMargins.Bottom = 1
              PrintMargins.Left = 1
              PrintMargins.Right = 1
              RichEditVersion = 2
              Data = {
                830000007B5C727466315C616E73695C616E7369637067313235325C64656666
                305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
                4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
                5C706172645C625C66305C667331342044426D656D436F6E747261746F5C7061
                720D0A7D0D0A00}
            end
          end
          object pnlCidade: TPanel
            Left = 0
            Top = 154
            Width = 728
            Height = 132
            Align = alBottom
            BorderStyle = bsSingle
            TabOrder = 1
            object GroupBox14: TGroupBox
              Left = 8
              Top = 3
              Width = 641
              Height = 61
              Caption = ' Local de Cobrança '
              TabOrder = 0
              object Label47: TLabel
                Left = 8
                Top = 17
                Width = 27
                Height = 13
                Caption = 'País'
              end
              object Label48: TLabel
                Left = 247
                Top = 17
                Width = 40
                Height = 13
                Caption = 'Estado'
              end
              object Label49: TLabel
                Left = 326
                Top = 16
                Width = 40
                Height = 13
                Caption = 'Cidade'
              end
              object DBcboPais: TwwDBLookupCombo
                Left = 8
                Top = 33
                Width = 233
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOMEPAIS'#9'30'#9'NOMEPAIS')
                DataField = 'IDPAIS'
                DataSource = ds
                LookupTable = cdsPais
                LookupField = 'IDPAIS'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
                OnCloseUp = DBcboPaisCloseUp
              end
              object DBcboEstado: TwwDBLookupCombo
                Left = 247
                Top = 33
                Width = 73
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'CODESTADO'#9'3'#9'CODESTADO')
                DataField = 'CODESTADO'
                DataSource = ds
                LookupTable = cdsEstado
                LookupField = 'CODESTADO'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
                OnCloseUp = DBcboEstadoCloseUp
              end
              object DBcboCidade: TwwDBLookupCombo
                Left = 325
                Top = 32
                Width = 297
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'50'#9'NOME')
                DataField = 'IDCIDADES'
                DataSource = ds
                LookupTable = cdsCidade
                LookupField = 'IDCIDADES'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
            end
            object gbUsuarioInclusao: TGroupBox
              Left = 8
              Top = 67
              Width = 641
              Height = 57
              Caption = ' Usuário Inclusão '
              TabOrder = 1
              object Label81: TLabel
                Left = 16
                Top = 16
                Width = 28
                Height = 13
                Caption = 'Data'
              end
              object Label82: TLabel
                Left = 200
                Top = 16
                Width = 33
                Height = 13
                Caption = 'Nome'
              end
              object DBEdit1: TDBEdit
                Left = 16
                Top = 31
                Width = 177
                Height = 21
                DataField = 'TRGDTINCLUSAO'
                DataSource = ds
                TabOrder = 0
              end
              object DBEdit2: TDBEdit
                Left = 200
                Top = 31
                Width = 129
                Height = 21
                DataField = 'TRGUSERINCLUSAO'
                DataSource = ds
                TabOrder = 1
              end
              object DBEdit3: TDBEdit
                Left = 328
                Top = 31
                Width = 294
                Height = 21
                DataField = 'USUARIO'
                DataSource = ds
                TabOrder = 2
              end
            end
          end
        end
        object tbsEventos: TTabSheet
          Caption = 'Eventos'
          ImageIndex = 7
          object Panel5: TPanel
            Left = 0
            Top = 124
            Width = 728
            Height = 162
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 10
            TabOrder = 1
            object gbEvento: TGroupBox
              Left = 10
              Top = 10
              Width = 708
              Height = 142
              Align = alClient
              Caption = 'Descrição do Evento'
              Enabled = False
              TabOrder = 0
              object Panel7: TPanel
                Left = 2
                Top = 15
                Width = 704
                Height = 125
                Align = alClient
                BevelOuter = bvNone
                BorderWidth = 7
                TabOrder = 0
                object DBMemo1: TDBMemo
                  Left = 7
                  Top = 7
                  Width = 690
                  Height = 111
                  Align = alClient
                  DataField = 'EVIDESCRICAO'
                  DataSource = dsEvento
                  MaxLength = 2000
                  TabOrder = 0
                end
              end
            end
          end
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 728
            Height = 124
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object dbgrdEvento: TwwDBGrid2
              Left = 0
              Top = 0
              Width = 728
              Height = 124
              ControlType.Strings = (
                'FLGAVISO;CheckBox;S;N')
              Selected.Strings = (
                'EVIDATA'#9'10'#9'Data'#9'T'
                'NUMPROCESSO'#9'15'#9'Nº Processo'#9'F'
                'EVICABECALHO'#9'31'#9'Histórico'#9'T'
                'EVIVLRANTERIOR'#9'12'#9'Valor Anterior'#9'T'
                'EVIVLRAJUSTADO'#9'12'#9'Valor Corrigido'#9'T'
                'EVIPERCENT'#9'7'#9'Reajuste'#9'T'
                'DSC_INDICE'#9'8'#9'Indice'#9'T'
                'EVIDATAPROX'#9'10'#9'Próximo'#9'T'
                'FLGAVISO'#9'5'#9'Aviso'#9'F'
                'DIASAVISO'#9'6'#9'Dias'#9'F'
                'NOMEUSUARIO'#9'29'#9'Usuário'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsEvento
              KeyOptions = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
              TabOrder = 1
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = True
              UseTFields = False
              OnTitleButtonClick = dbgrdEventoTitleButtonClick
              IndicatorColor = icBlack
            end
            object Panel10: TPanel
              Left = 0
              Top = 0
              Width = 728
              Height = 124
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object Label2: TLabel
                Left = 18
                Top = 6
                Width = 90
                Height = 13
                Caption = 'Data do Evento'
              end
              object Label5: TLabel
                Left = 246
                Top = 6
                Width = 61
                Height = 13
                Caption = 'Cabeçalho'
              end
              object Label10: TLabel
                Left = 18
                Top = 55
                Width = 78
                Height = 13
                Caption = 'Valor Anterior'
              end
              object Label23: TLabel
                Left = 156
                Top = 55
                Width = 63
                Height = 13
                Caption = 'Valor Atual'
              end
              object Label32: TLabel
                Left = 292
                Top = 55
                Width = 62
                Height = 13
                Caption = 'Percentual'
              end
              object Label36: TLabel
                Left = 380
                Top = 55
                Width = 89
                Height = 13
                Caption = 'Próximo Evento'
              end
              object Label57: TLabel
                Left = 148
                Top = 5
                Width = 71
                Height = 13
                Caption = 'Nº Processo'
              end
              object DBedtDataEvento: TCMDateTimePicker
                Left = 18
                Top = 20
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'EVIDATA'
                DataSource = dsEvento
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
              object DBedtCabEvento: TDBEdit
                Left = 246
                Top = 20
                Width = 388
                Height = 21
                DataField = 'EVICABECALHO'
                DataSource = dsEvento
                TabOrder = 1
              end
              object DBedtVlrAnterior: TDBEdit
                Left = 18
                Top = 70
                Width = 121
                Height = 21
                DataField = 'EVIVLRANTERIOR'
                DataSource = dsEvento
                TabOrder = 2
              end
              object DBedtVlrAjustado: TDBEdit
                Left = 156
                Top = 70
                Width = 121
                Height = 21
                DataField = 'EVIVLRAJUSTADO'
                DataSource = dsEvento
                TabOrder = 3
              end
              object DBedtPercent: TDBEdit
                Left = 290
                Top = 70
                Width = 73
                Height = 21
                DataField = 'EVIPERCENT'
                DataSource = dsEvento
                TabOrder = 4
              end
              object DBedtDataProx: TCMDateTimePicker
                Left = 379
                Top = 69
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'EVIDATAPROX'
                DataSource = dsEvento
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
                TabOrder = 5
              end
              object GroupBox13: TGroupBox
                Left = 505
                Top = 50
                Width = 129
                Height = 67
                Caption = 'Aviso Programado'
                TabOrder = 6
                TabStop = True
                object Label80: TLabel
                  Left = 84
                  Top = 43
                  Width = 24
                  Height = 13
                  Caption = 'dias'
                end
                object wwDBSpinEdit1: TwwDBSpinEdit
                  Left = 27
                  Top = 39
                  Width = 53
                  Height = 21
                  Increment = 1
                  MaxValue = 99
                  MinValue = 1
                  Value = 1
                  DataField = 'DIASAVISO'
                  DataSource = dsEvento
                  MaxLength = 2
                  TabOrder = 0
                  UnboundDataType = wwDefault
                end
                object cbAvisoEvento: TDBCheckBox
                  Left = 8
                  Top = 18
                  Width = 113
                  Height = 17
                  Caption = 'Gera Aviso com'
                  DataField = 'FLGAVISO'
                  DataSource = dsEvento
                  TabOrder = 1
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
              end
              object DBedtNumProcesso: TDBEdit
                Left = 146
                Top = 20
                Width = 93
                Height = 21
                DataField = 'NUMPROCESSO'
                DataSource = dsEvento
                TabOrder = 7
              end
            end
          end
        end
        object tbsFianca: TTabSheet
          Caption = 'Fiança'
          ImageIndex = 8
          object Label64: TLabel
            Left = 16
            Top = 154
            Width = 75
            Height = 13
            Caption = 'Observações'
          end
          object DBrdgTipoFianca: TDBRadioGroup
            Left = 16
            Top = 8
            Width = 265
            Height = 74
            Caption = ' Tipo de Fiança '
            Columns = 2
            DataField = 'FLGFIANCA'
            DataSource = ds
            Items.Strings = (
              'Fiador'
              'Fiança Bancária'
              'Outra (especificar)'
              'Seguro Fiança'
              'Depósito Bancário'
              'Não há')
            TabOrder = 0
            TabStop = True
            Values.Strings = (
              'A'
              'F'
              'O'
              'S'
              'D'
              'N')
          end
          object GroupBox1: TGroupBox
            Left = 288
            Top = 8
            Width = 361
            Height = 74
            Caption = ' Datas da Fiança '
            TabOrder = 1
            object Label37: TLabel
              Left = 130
              Top = 21
              Width = 99
              Height = 13
              Caption = 'Término Validade'
            end
            object Label38: TLabel
              Left = 243
              Top = 21
              Width = 99
              Height = 13
              Caption = 'Aviso de Término'
            end
            object Label59: TLabel
              Left = 16
              Top = 21
              Width = 87
              Height = 13
              Caption = 'Início Validade'
            end
            object DBedtTerminoFianca: TCMDateTimePicker
              Left = 130
              Top = 35
              Width = 105
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'CONDATAFIANCAFIM'
              DataSource = ds
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
            object DBedtAvisoFianca: TCMDateTimePicker
              Left = 243
              Top = 35
              Width = 105
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'CONDATAFIANCAAV'
              DataSource = ds
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
            end
            object DBedtDataIniFianca: TCMDateTimePicker
              Left = 16
              Top = 35
              Width = 105
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'CONDATAFIANCAINI'
              DataSource = ds
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
          object GroupBox2: TGroupBox
            Left = 16
            Top = 88
            Width = 633
            Height = 61
            Caption = ' Seguro-fiança / Fiança Bancária '
            TabOrder = 2
            object Label60: TLabel
              Left = 456
              Top = 18
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label61: TLabel
              Left = 16
              Top = 18
              Width = 55
              Height = 13
              Caption = 'Nº Banco'
            end
            object Label62: TLabel
              Left = 89
              Top = 18
              Width = 37
              Height = 13
              Caption = 'Banco'
            end
            object DBedtNumBanco: TDBEdit
              Left = 16
              Top = 32
              Width = 73
              Height = 21
              DataField = 'NUMBANCO'
              DataSource = dsBanco
              Enabled = False
              TabOrder = 0
            end
            object DBcboBanco: TwwDBLookupCombo
              Left = 89
              Top = 32
              Width = 353
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Nome'#9'F')
              DataField = 'CONBANCOFIANCA'
              DataSource = ds
              LookupTable = cdsBanco
              LookupField = 'IDPESSOA'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
            object dbedtVlrFianca: TDBRealEdit
              Left = 456
              Top = 32
              Width = 161
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 8
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'CONVLRFIANCA'
              DataSource = ds
            end
          end
          object dbmemObsFianca: TwwDBRichEdit
            Left = 16
            Top = 168
            Width = 633
            Height = 65
            ScrollBars = ssVertical
            AutoURLDetect = True
            DataField = 'CONOBSFIANCA'
            DataSource = ds
            MaxLength = 1750
            PrintJobName = 'Delphi 5'
            TabOrder = 3
            PopupOptions = [rpoPopupEdit, rpoPopupCut, rpoPopupCopy, rpoPopupPaste, rpoPopupFont]
            EditorCaption = 'Edit Rich Text'
            EditorPosition.Left = 0
            EditorPosition.Top = 0
            EditorPosition.Width = 0
            EditorPosition.Height = 0
            MeasurementUnits = muCentimeters
            PrintMargins.Top = 1
            PrintMargins.Bottom = 1
            PrintMargins.Left = 1
            PrintMargins.Right = 1
            RichEditVersion = 2
            Data = {
              840000007B5C727466315C616E73695C616E7369637067313235325C64656666
              305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
              4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
              5C706172645C625C66305C667331342064626D656D4F62734669616E63615C70
              61720D0A7D0D0A00}
          end
        end
        object tbsFiadores: TTabSheet
          Caption = 'Fiadores'
          ImageIndex = 9
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 729
            Height = 286
            Align = alClient
            TabOrder = 0
            inline molFiador1: TmolFiador
              Left = 91
              Top = 72
              Width = 446
              inherited edtFiador: TEdit
                Width = 377
              end
              inherited btnBuscaFiador: TBitBtn
                Left = 384
              end
              inherited btnLimpaFiador: TBitBtn
                Left = 408
              end
            end
          end
          object dbgrdFiador: TwwDBGrid2
            Left = 0
            Top = 0
            Width = 729
            Height = 286
            Selected.Strings = (
              'NF_FIADOR'#9'46'#9'Nome / Nome Fantasia'#9'T'
              'RS_FIADOR'#9'48'#9'Razão Social'#9'T')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsFiador
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = True
            UseTFields = False
            OnTitleButtonClick = dbgrdEventoTitleButtonClick
            IndicatorColor = icBlack
          end
        end
        object tbsComplemento: TTabSheet
          Caption = 'Complemento'
          ImageIndex = 11
          inline molArvoreCompl1: TmolArvoreCompl
            Width = 728
            Height = 286
            inherited dxTreeListDados: TdxTreeList
              Width = 728
              Height = 286
              inherited TreeListConteudo: TdxTreeListColumn
                Width = 394
              end
              inherited TreeListIdOutroDado: TdxTreeListColumn
                Width = 124
              end
              inherited TreeListAnaSint: TdxTreeListColumn
                Width = 124
              end
              inherited TreeListTipoDado: TdxTreeListColumn
                Width = 124
              end
              inherited TreeListOpcao: TdxTreeListColumn
                Width = 124
              end
              inherited TreeListOutroDadoXImovel: TdxTreeListColumn
                Width = 124
              end
              inherited TreeListImovel: TdxTreeListColumn
                Width = 124
              end
              inherited TreeListContrato: TdxTreeListColumn
                Width = 124
              end
            end
          end
        end
        object tsTributos: TTabSheet
          Caption = 'Tributos'
          ImageIndex = 12
          object dbgrdTributos: TwwDBGrid2
            Left = 0
            Top = 84
            Width = 728
            Height = 202
            Selected.Strings = (
              'DSC_MESTRE'#9'30'#9'Imóvel Mestre'#9'F'
              'IMOCODIGO'#9'15'#9'Cód. Imóvel'#9'F'
              'IMONOME'#9'30'#9'Imóvel'#9'F'
              'ANO'#9'10'#9'Ano'#9'F'
              'DESCENCARGO'#9'20'#9'Encargo'#9'F'
              'DESCSITUACAO'#9'20'#9'Situação'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsHISTPAGENCIMOV
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = True
            UseTFields = False
            OnTitleButtonClick = dbgrdEventoTitleButtonClick
            IndicatorColor = icBlack
          end
          object pnlTributos_Item: TPanel
            Left = 0
            Top = 84
            Width = 728
            Height = 202
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
            object Label58: TLabel
              Left = 8
              Top = 45
              Width = 23
              Height = 13
              Caption = 'Ano'
            end
            object Label69: TLabel
              Left = 132
              Top = 46
              Width = 48
              Height = 13
              Caption = 'Encargo'
            end
            object Label85: TLabel
              Left = 430
              Top = 46
              Width = 51
              Height = 13
              Caption = 'Situação'
            end
            object Label93: TLabel
              Left = 8
              Top = 7
              Width = 38
              Height = 13
              Caption = 'Imóvel'
            end
            object dblcTributos_Encargo: TwwDBLookupCombo
              Left = 131
              Top = 60
              Width = 292
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCENCARGO'#9'30'#9'Encargos'#9'F')
              DataField = 'IDENCARGO'
              DataSource = dsHISTPAGENCIMOV
              LookupTable = cdsENCARGOIMOV
              LookupField = 'IDENCARGO'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblcTributos_Situacao: TwwDBLookupCombo
              Left = 430
              Top = 60
              Width = 292
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCSITUACAO'#9'30'#9'Situação'#9'F')
              DataField = 'IDSITUACAO'
              DataSource = dsHISTPAGENCIMOV
              LookupTable = cdsSITPAGENCIMOV
              LookupField = 'IDSITUACAO'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dbseTributos_Ano: TwwDBSpinEdit
              Left = 8
              Top = 60
              Width = 113
              Height = 21
              Increment = 1
              MaxValue = 9999
              MinValue = 1899
              Value = 1899
              DataField = 'ANO'
              DataSource = dsHISTPAGENCIMOV
              TabOrder = 1
              UnboundDataType = wwDefault
            end
            object dblcTributos_Imovel: TwwDBLookupCombo
              Left = 8
              Top = 22
              Width = 714
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DSC_IMOVEL'#9'50'#9'Imóvel'#9'F')
              DataField = 'IDIMOVEL'
              DataSource = dsHISTPAGENCIMOV
              LookupTable = cdsImovel
              LookupField = 'IDIMOVEL'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 0
              Visible = False
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object edtImovel: TEdit
              Left = 8
              Top = 22
              Width = 661
              Height = 21
              Enabled = False
              ReadOnly = True
              TabOrder = 4
            end
            object btnBuscaImovel: TBitBtn
              Left = 672
              Top = 22
              Width = 24
              Height = 22
              Hint = 'Busca um Imóvel'
              TabOrder = 5
              OnClick = btnBuscaImovelClick
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
            object btnLimpaImovel: TBitBtn
              Left = 696
              Top = 22
              Width = 24
              Height = 22
              Hint = 'Limpa a seleção de Imóvel'
              TabOrder = 6
              OnClick = btnLimpaImovelClick
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
          object pnlTributos_Parametros: TPanel
            Left = 0
            Top = 0
            Width = 728
            Height = 84
            Align = alTop
            TabOrder = 0
            object Label87: TLabel
              Left = 8
              Top = 2
              Width = 60
              Height = 13
              Caption = 'Ano Início'
            end
            object Label88: TLabel
              Left = 92
              Top = 2
              Width = 46
              Height = 13
              Caption = 'Ano Fim'
            end
            object Label89: TLabel
              Left = 175
              Top = 2
              Width = 81
              Height = 13
              Caption = 'Código Imóvel'
            end
            object Label90: TLabel
              Left = 297
              Top = 2
              Width = 74
              Height = 13
              Caption = 'Nome Imóvel'
            end
            object Label91: TLabel
              Left = 8
              Top = 42
              Width = 48
              Height = 13
              Caption = 'Encargo'
            end
            object Label92: TLabel
              Left = 296
              Top = 42
              Width = 51
              Height = 13
              Caption = 'Situação'
            end
            object edtTributos_Filtro_CodigoImovel: TEdit
              Left = 175
              Top = 16
              Width = 113
              Height = 21
              TabOrder = 2
              OnKeyPress = edtTributos_Filtro_CodigoImovelKeyPress
            end
            object edtTributos_Filtro_NomeImovel: TEdit
              Left = 297
              Top = 16
              Width = 424
              Height = 21
              TabOrder = 3
            end
            object cbTributos_Filtro_Encargo: TComboBox
              Left = 8
              Top = 56
              Width = 281
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 4
            end
            object cbTributos_Filtro_Situacao: TComboBox
              Left = 296
              Top = 56
              Width = 281
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 5
            end
            object btnTributos_Filtro_Procurar: TBitBtn
              Left = 584
              Top = 51
              Width = 137
              Height = 25
              Caption = 'Procurar'
              TabOrder = 6
              OnClick = btnTributos_Filtro_ProcurarClick
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
                840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FFFF
                FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFF
                FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
                0000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF0000008400FF00
                FF00FF00FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFF
                FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00000084000000
                8400FF00FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FF000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00000084000000
                840000008400FF00FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF00
                0000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF000000
                8400000084000000840000000000000000000000000000000000FFFFFF00FFFF
                FF00FFFFFF00FF000000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
                FF000000840000000000FFFF0000FF00FF00FFFF0000FF00FF00000000008484
                0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
                FF0000000000FFFF0000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF000000
                0000FFFFFF00FFFFFF00FFFFFF008484840084848400FF00FF00FF00FF00FF00
                FF0000000000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF00FFFF00000000
                0000FFFFFF008484840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF0000000000FFFF0000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF000000
                000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF0000000000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF00FFFF00000000
                0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF0000000000FF00FF00FFFF0000FF00FF00FFFF000000000000FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF0000000000000000000000000000000000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            end
            object edtTributos_Filtro_AnoFim: TwwDBSpinEdit
              Left = 91
              Top = 16
              Width = 79
              Height = 21
              Increment = 1
              MaxValue = 9999
              MinValue = 1899
              TabOrder = 1
              UnboundDataType = wwDefault
            end
            object edtTributos_Filtro_AnoInicio: TwwDBSpinEdit
              Left = 7
              Top = 16
              Width = 79
              Height = 21
              Increment = 1
              MaxValue = 9999
              MinValue = 1899
              TabOrder = 0
              UnboundDataType = wwDefault
            end
          end
        end
        object tbsConfissaoDivida: TTabSheet
          Caption = 'Confissão de Dívida'
          ImageIndex = 13
          object Label86: TLabel
            Left = 7
            Top = 1
            Width = 157
            Height = 13
            Caption = 'Início Confissão de Dívida '
          end
          object Label94: TLabel
            Left = 213
            Top = 1
            Width = 67
            Height = 13
            Caption = 'Nr.Parcelas'
          end
          object Label95: TLabel
            Left = 301
            Top = 1
            Width = 93
            Height = 13
            Caption = 'Valor Confissao '
          end
          object Label96: TLabel
            Left = 437
            Top = 1
            Width = 78
            Height = 13
            Caption = 'Total a Pagar'
          end
          object DBEdit5: TDBEdit
            Left = 301
            Top = 18
            Width = 93
            Height = 21
            DataField = 'VLRSALDO'
            DataSource = dsConfissaoDivida
            Enabled = False
            TabOrder = 1
            OnChange = DBEdit5Change
          end
          object dbConfissaoDivida: TwwDBLookupCombo
            Left = 8
            Top = 18
            Width = 153
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DATACONFISSAO'#9'18'#9'DATACONFISSAO'#9'F'
              'IDCONFISSAODIVIDA'#9'10'#9'IDCONFISSAODIVIDA'#9'F'
              'IDCONTRATOIMOVEL'#9'10'#9'IDCONTRATOIMOVEL'#9'F'
              'MESCONFISSAO'#9'10'#9'MESCONFISSAO'#9'F'
              'ANOCONFISSAO'#9'10'#9'ANOCONFISSAO'#9'F'
              'CONDRESULTANTES'#9'10'#9'CONDRESULTANTES'#9'F'
              'VLRSALDO'#9'10'#9'VLRSALDO'#9'F'
              'IDMODULO'#9'10'#9'IDMODULO'#9'F'
              'PLNCODIGO_OPER'#9'10'#9'PLNCODIGO_OPER'#9'F')
            LookupTable = cdsConfissaoDivida
            LookupField = 'DATACONFISSAO'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object edtNumParcelas: TEdit
            Left = 216
            Top = 18
            Width = 65
            Height = 21
            Enabled = False
            TabOrder = 2
            Text = 'edtNumParcelas'
          end
          object dbgrdParcelasConfissao: TwwDBGrid
            Left = 0
            Top = 48
            Width = 728
            Height = 238
            Selected.Strings = (
              'CODDOCUMENTO'#9'10'#9'Documento'#9'F'
              'DATAVENCIMENTO'#9'18'#9'Vencimento'#9'F'
              'VALOR'#9'10'#9'Valor'#9'F'
              'Alterador'#9'10'#9'Alterador'#9'F'
              'JUR'#9'10'#9'Juros'#9'F'
              'MUL'#9'10'#9'Multa'#9'F'
              'COR'#9'10'#9'Correção'#9'F'
              'SALDO'#9'10'#9'Valor Devido'#9'F'
              'RECEBIDO'#9'10'#9'Baixado'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alBottom
            BorderStyle = bsNone
            DataSource = dsParcelasConfissao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 3
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
          object edtTotalPagar: TEdit
            Left = 440
            Top = 18
            Width = 121
            Height = 21
            Enabled = False
            TabOrder = 4
            Text = '0'
          end
        end
      end
      inherited Dock974: TDock97 [1]
        Left = 740
        Height = 314
      end
      inherited Dock973: TDock97 [2]
        Width = 826
        inherited tb97BotoesDetalhe: TToolbar97
          Left = 4
          DockPos = 4
        end
        object cbContratoVigente: TCheckBox
          Left = 475
          Top = 7
          Width = 196
          Height = 17
          Caption = 'Exibir apenas imóveis vigentes'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = cbContratoVigenteClick
        end
        object btnRateioArea: TBitBtn
          Left = 104
          Top = 2
          Width = 119
          Height = 26
          Caption = '&Rateio por Área'
          Default = True
          Enabled = False
          TabOrder = 2
          OnClick = btnRateioAreaClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            77777777777777777777700000000000000766444444444444406E6666666666
            66406E60F0F0F067F0406E666666666666406E60F0F0F0F0F0406E6666666666
            66406E077777776666406E0FFFFFF76666406E000000006666406EEEEEEEEEEE
            EE60766666666666666777777777777777777777777777777777}
          Margin = 2
          Spacing = 3
        end
        object btnRateioValorCtbl: TBitBtn
          Left = 235
          Top = 2
          Width = 171
          Height = 26
          Caption = '&Rateio por Valor Contábil'
          Default = True
          Enabled = False
          TabOrder = 3
          OnClick = btnRateioValorCtblClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            77777777777777777777700000000000000766444444444444406E6666666666
            66406E60F0F0F067F0406E666666666666406E60F0F0F0F0F0406E6666666666
            66406E077777776666406E0FFFFFF76666406E000000006666406EEEEEEEEEEE
            EE60766666666666666777777777777777777777777777777777}
          Margin = 2
          Spacing = 3
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 836
    object lblVigencia: TLabel [0]
      Left = 559
      Top = 10
      Width = 198
      Height = 24
      Alignment = taRightJustify
      Caption = 'Vigente / Encerrado'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Visible = False
    end
    inherited Toolbar971: TToolbar97
      object sbtnImovel: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Imóvel'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 3
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = sbtnImovelClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 474
    Width = 836
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      8
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        'Twwdbgrid'
        'Selected.strings[0]'
        0)
      (
        'TTabControlDetalhe'
        'Tabs'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 430
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 368
  end
  inherited Cds: TCMClientDataSet
    ProviderName = 'DataSetProvider1'
    Left = 433
    Top = 35
    object CdsCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object CdsCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object CdsCONBANCOFIANCA: TFloatField
      FieldName = 'CONBANCOFIANCA'
    end
    object CdsCONDATAASSINATURA: TDateTimeField
      FieldName = 'CONDATAASSINATURA'
    end
    object CdsCONDATAAVDENUNCIA: TDateTimeField
      FieldName = 'CONDATAAVDENUNCIA'
    end
    object CdsCONDATAAVRENEGOC: TDateTimeField
      FieldName = 'CONDATAAVRENEGOC'
    end
    object CdsCONDATACARENCIA: TDateTimeField
      FieldName = 'CONDATACARENCIA'
    end
    object CdsCONDATADENUNCIA: TDateTimeField
      FieldName = 'CONDATADENUNCIA'
    end
    object CdsCONDATAFIANCAAV: TDateTimeField
      FieldName = 'CONDATAFIANCAAV'
    end
    object CdsCONDATAFIANCAFIM: TDateTimeField
      FieldName = 'CONDATAFIANCAFIM'
    end
    object CdsCONDATAFIANCAINI: TDateTimeField
      FieldName = 'CONDATAFIANCAINI'
    end
    object CdsCONDATAFIM: TDateTimeField
      FieldName = 'CONDATAFIM'
    end
    object CdsCONDATAINICAREN: TDateTimeField
      FieldName = 'CONDATAINICAREN'
    end
    object CdsCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
    end
    object CdsCONDATAREAJUSTE: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
    end
    object CdsCONDATARENEGOC: TDateTimeField
      FieldName = 'CONDATARENEGOC'
    end
    object CdsCONDESCRICAO: TMemoField
      FieldName = 'CONDESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object CdsCONDIASREPASSE: TFloatField
      FieldName = 'CONDIASREPASSE'
    end
    object CdsCONDIASTOLERANCIA: TFloatField
      FieldName = 'CONDIASTOLERANCIA'
    end
    object CdsCONDIAVENCIMENTO: TFloatField
      FieldName = 'CONDIAVENCIMENTO'
    end
    object CdsCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
    end
    object CdsCONMESREFREAJUSTE: TStringField
      FieldName = 'CONMESREFREAJUSTE'
      FixedChar = True
      Size = 1
    end
    object CdsCONMOEDAMORA: TFloatField
      FieldName = 'CONMOEDAMORA'
    end
    object CdsCONMOEDAMULTA: TFloatField
      FieldName = 'CONMOEDAMULTA'
    end
    object CdsCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 100
    end
    object CdsCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object CdsCONPERALUGUEL: TFloatField
      FieldName = 'CONPERALUGUEL'
    end
    object CdsCONPERCENTMORA: TFloatField
      FieldName = 'CONPERCENTMORA'
    end
    object CdsCONPERCENTMULTA: TFloatField
      FieldName = 'CONPERCENTMULTA'
    end
    object CdsCONPERMORA: TStringField
      FieldName = 'CONPERMORA'
      FixedChar = True
      Size = 1
    end
    object CdsCONPERREAJUSTE: TFloatField
      FieldName = 'CONPERREAJUSTE'
    end
    object CdsCONPROXREAJUSTE: TDateTimeField
      FieldName = 'CONPROXREAJUSTE'
    end
    object CdsCONQUANTVAGAS: TFloatField
      FieldName = 'CONQUANTVAGAS'
    end
    object CdsCONTAXAADMIN: TFloatField
      FieldName = 'CONTAXAADMIN'
      DisplayFormat = '##0.00%'
      EditFormat = '##0.00%'
    end
    object CdsCONVLRAJUSTADO: TFloatField
      FieldName = 'CONVLRAJUSTADO'
    end
    object CdsCONVLRFIANCA: TFloatField
      FieldName = 'CONVLRFIANCA'
    end
    object CdsCONVLRMORA: TFloatField
      FieldName = 'CONVLRMORA'
    end
    object CdsCONVLRMULTA: TFloatField
      FieldName = 'CONVLRMULTA'
    end
    object CdsCONVLRTOTAL: TFloatField
      FieldName = 'CONVLRTOTAL'
    end
    object CdsFLGCOBRANCAAUTO: TFloatField
      FieldName = 'FLGCOBRANCAAUTO'
    end
    object CdsFLGCOMPETALUGUEL: TStringField
      FieldName = 'FLGCOMPETALUGUEL'
      FixedChar = True
      Size = 1
    end
    object CdsFLGFIANCA: TStringField
      FieldName = 'FLGFIANCA'
      FixedChar = True
      Size = 1
    end
    object CdsFLGINDETERMINADO: TStringField
      FieldName = 'FLGINDETERMINADO'
      FixedChar = True
      Size = 1
    end
    object CdsFLGMORAPROPORC: TFloatField
      FieldName = 'FLGMORAPROPORC'
    end
    object CdsFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      FixedChar = True
      Size = 1
    end
    object CdsFLGTIPOCONTRATO: TStringField
      FieldName = 'FLGTIPOCONTRATO'
      FixedChar = True
      Size = 1
    end
    object CdsFLGTIPODIATOLERA: TStringField
      FieldName = 'FLGTIPODIATOLERA'
      FixedChar = True
      Size = 1
    end
    object CdsFLGTIPODIAVENC: TStringField
      FieldName = 'FLGTIPODIAVENC'
      FixedChar = True
      Size = 1
    end
    object CdsIDADMINIMOVEL: TFloatField
      FieldName = 'IDADMINIMOVEL'
    end
    object CdsIDATIVIDADE: TFloatField
      FieldName = 'IDATIVIDADE'
    end
    object CdsIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
    end
    object CdsIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object CdsIDINDCORRECAO: TFloatField
      FieldName = 'IDINDCORRECAO'
    end
    object CdsIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
    end
    object CdsIDMARCA: TFloatField
      FieldName = 'IDMARCA'
    end
    object CdsIDMSGBOLETO: TFloatField
      FieldName = 'IDMSGBOLETO'
    end
    object CdsIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object CdsIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object CdsIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object CdsIDSITCONTIMOB: TFloatField
      FieldName = 'IDSITCONTIMOB'
    end
    object CdsIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
    end
    object CdsMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object CdsPERALUGUELIDEAL: TFloatField
      FieldName = 'PERALUGUELIDEAL'
    end
    object CdsPERCTXJURMERC: TFloatField
      FieldName = 'PERCTXJURMERC'
    end
    object CdsPERITXJURMERC: TStringField
      FieldName = 'PERITXJURMERC'
      FixedChar = True
      Size = 1
    end
    object CdsVLRCONTABIL: TFloatField
      FieldName = 'VLRCONTABIL'
    end
    object CdsVLRPRESENTE: TFloatField
      FieldName = 'VLRPRESENTE'
    end
    object CdsVLRPROPOSTA: TFloatField
      FieldName = 'VLRPROPOSTA'
    end
    object CdsDSC_ADMINISTRADORA: TStringField
      FieldName = 'DSC_ADMINISTRADORA'
      Size = 60
    end
    object CdsDSC_LOCATARIO: TStringField
      FieldName = 'DSC_LOCATARIO'
      Size = 60
    end
    object CdsDSC_RESPONSAVEL: TStringField
      FieldName = 'DSC_RESPONSAVEL'
      Size = 60
    end
    object CdsCONOBSFIANCA: TMemoField
      FieldName = 'CONOBSFIANCA'
      BlobType = ftMemo
      Size = 2000
    end
    object CdsFLGTIPOALUGUEL: TStringField
      FieldName = 'FLGTIPOALUGUEL'
      FixedChar = True
      Size = 1
    end
    object CdsCONDATASOLRESC: TDateTimeField
      FieldName = 'CONDATASOLRESC'
    end
    object CdsIDREGRARES: TFloatField
      FieldName = 'IDREGRARES'
    end
    object CdsPERMULTARESC: TFloatField
      FieldName = 'PERMULTARESC'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object CdsQTDEMULTARESC: TFloatField
      FieldName = 'QTDEMULTARESC'
      DisplayFormat = '##'
      EditFormat = '##'
    end
    object CdsCONPERCREAJUSTE: TFloatField
      FieldName = 'CONPERCREAJUSTE'
      DisplayFormat = '##0.0000'
      EditFormat = '##0.0000'
    end
    object CdsTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object CdsTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object CdsUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 60
    end
    object CdsIDTIPOCONTRIMOB: TFloatField
      FieldName = 'IDTIPOCONTRIMOB'
    end
  end
  inherited MontaSelect: TMontaSelect
    Left = 320
    Top = 7
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 372
    Top = 47
  end
  inherited dsDet: TwwDataSource
    AutoEdit = True
    DataSet = cdsImovel
    Left = 470
  end
  object dsEvento: TwwDataSource
    AutoEdit = False
    DataSet = cdsEvento
    Left = 582
    Top = 1
  end
  object cdsEvento: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDEVENTOIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDCONTRATOIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDUSUARIO'
        DataType = ftFloat
      end
      item
        Name = 'IDCONTRATOLOJA'
        DataType = ftFloat
      end
      item
        Name = 'EVIDATAPROX'
        DataType = ftDateTime
      end
      item
        Name = 'EVICABECALHO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'EVIDESCRICAO'
        DataType = ftMemo
        Size = 2000
      end
      item
        Name = 'EVIDATA'
        DataType = ftDateTime
      end
      item
        Name = 'FLGTIPOEVENTO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'EVIPERCENT'
        DataType = ftFloat
      end
      item
        Name = 'EVIINDICEREAJUSTE'
        DataType = ftFloat
      end
      item
        Name = 'EVIVLRANTERIOR'
        DataType = ftFloat
      end
      item
        Name = 'EVIVLRAJUSTADO'
        DataType = ftFloat
      end
      item
        Name = 'CODDOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'FLGAVISO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DIASAVISO'
        DataType = ftFloat
      end
      item
        Name = 'USUARIO_EXTENSO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DSC_INDICE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NOMEUSUARIO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NUMPROCESSO'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <>
    IndexFieldNames = 'EVIDATA'
    Params = <>
    StoreDefs = True
    Left = 582
    Top = 39
    object cdsEventoIDEVENTOIMOVEL: TFloatField
      FieldName = 'IDEVENTOIMOVEL'
    end
    object cdsEventoIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsEventoEVIDATA: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data'
      FieldName = 'EVIDATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsEventoEVICABECALHO: TStringField
      FieldName = 'EVICABECALHO'
      Size = 60
    end
    object cdsEventoIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
    end
    object cdsEventoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object cdsEventoFLGTIPOEVENTO: TStringField
      FieldName = 'FLGTIPOEVENTO'
      Size = 2
    end
    object cdsEventoEVIVLRANTERIOR: TFloatField
      DisplayLabel = 'Valor Anterior'
      FieldName = 'EVIVLRANTERIOR'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object cdsEventoEVIVLRAJUSTADO: TFloatField
      DisplayLabel = 'Valor Corrigido'
      FieldName = 'EVIVLRAJUSTADO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object cdsEventoEVIDATAPROX: TDateTimeField
      DisplayLabel = 'Próximo'
      FieldName = 'EVIDATAPROX'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsEventoEVIPERCENT: TFloatField
      DisplayLabel = 'Reajuste'
      FieldName = 'EVIPERCENT'
      DisplayFormat = '##0.00%'
      EditFormat = '##0.00%'
    end
    object cdsEventoEVIINDICEREAJUSTE: TFloatField
      FieldName = 'EVIINDICEREAJUSTE'
    end
    object cdsEventoIDCONTRATOLOJA: TFloatField
      FieldName = 'IDCONTRATOLOJA'
    end
    object cdsEventoDSC_INDICE: TStringField
      DisplayLabel = 'Indice'
      DisplayWidth = 10
      FieldName = 'DSC_INDICE'
      FixedChar = True
      Size = 10
    end
    object cdsEventoFLGAVISO: TStringField
      FieldName = 'FLGAVISO'
      FixedChar = True
      Size = 1
    end
    object cdsEventoDIASAVISO: TFloatField
      FieldName = 'DIASAVISO'
    end
    object cdsEventoNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
    end
    object cdsEventoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object cdsEventoUSUARIO_EXTENSO: TStringField
      FieldName = 'USUARIO_EXTENSO'
      Size = 100
    end
    object cdsEventoNUMPROCESSO: TStringField
      FieldName = 'NUMPROCESSO'
      Size = 30
    end
    object cdsEventoEVIDESCRICAO: TMemoField
      FieldName = 'EVIDESCRICAO'
      BlobType = ftMemo
    end
  end
  object dsFiador: TwwDataSource
    AutoEdit = False
    DataSet = cdsFiador
    Left = 641
    Top = 1
  end
  object cdsFiador: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDCONTRATOIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDAVALISTA'
        DataType = ftFloat
      end
      item
        Name = 'NF_FIADOR'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'RS_FIADOR'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 641
    Top = 7
    object cdsFiadorIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object cdsFiadorIDAVALISTA: TFloatField
      FieldName = 'IDAVALISTA'
    end
    object cdsFiadorNF_FIADOR: TStringField
      DisplayLabel = 'Nome / Nome Fantasia'
      FieldName = 'NF_FIADOR'
      Size = 60
    end
    object cdsFiadorRS_FIADOR: TStringField
      DisplayLabel = 'Razão Social'
      FieldName = 'RS_FIADOR'
      Size = 60
    end
  end
  object cdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 737
    Top = 256
    object cdsMoedaMOESIGLA: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 6
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object cdsMoedaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object cdsMoedaMOEDESC: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'MOEDESC'
      Visible = False
    end
    object cdsMoedaMOEPERIODICIDADE: TStringField
      FieldName = 'MOEPERIODICIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsMoedaFLGPERCVALOR: TStringField
      FieldName = 'FLGPERCVALOR'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object cdsMarcas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 737
    Top = 271
    object cdsMarcasMRCNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'MRCNOME'
      Size = 40
    end
    object cdsMarcasIDMARCA: TFloatField
      FieldName = 'IDMARCA'
      Visible = False
    end
  end
  object cdsPais: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 737
    Top = 283
    Data = {
      5C0100009619E0BD010000001800000009000100000003000000270106494450
      4149530800040000000000084E4F4D4550414953010049000000010005574944
      5448020002001E00114E4F4D454E4143494F4E414C4944414445010049000000
      0100055749445448020002001E0011434F44524543454954414645444552414C
      080004000000000010434F44494E5445524E4143494F4E414C01004900000001
      000557494454480200020003000E4D41534341524143504F5354414C01004900
      000001000557494454480200020014000D5452474454494E434C5553414F0800
      0800000000000F54524755534552494E434C5553414F01004900000001000557
      49445448020002001E0009434F4452454749414F08000400000000000100044C
      434944040001000908000000000401000000000000F03F0642726173696C0A42
      726173696C6569726100000000000024400342524100ECE93581ABCC4202434D}
    object cdsPaisNOMEPAIS: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'NOMEPAIS'
      Size = 30
    end
    object cdsPaisIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Visible = False
    end
  end
  object cdsEstado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 737
    Top = 296
    object cdsEstadoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object cdsEstadoIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object cdsEstadoNOMEESTADO: TStringField
      FieldName = 'NOMEESTADO'
      Size = 30
    end
    object cdsEstadoIDESTADO: TFloatField
      FieldName = 'IDESTADO'
    end
  end
  object cdsAtividade: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 737
    Top = 309
    object cdsAtividadeATVDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'ATVDESCRICAO'
      Size = 60
    end
    object cdsAtividadeIDATIVIDADE: TFloatField
      FieldName = 'IDATIVIDADE'
      Visible = False
    end
  end
  object cdsImovel: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDCONTRATOIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'CIMVLRALUGUEL'
        DataType = ftFloat
      end
      item
        Name = 'CIMVLRAJUSTADO'
        DataType = ftFloat
      end
      item
        Name = 'FLGRATEIO'
        DataType = ftFloat
      end
      item
        Name = 'CIMPERCENTRATEIO'
        DataType = ftFloat
      end
      item
        Name = 'CIMDESCRICAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CODTIPIMOVEL'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'IMOCODIGO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CIMDTINI'
        DataType = ftDateTime
      end
      item
        Name = 'CIMDTFIM'
        DataType = ftDateTime
      end
      item
        Name = 'DSC_IMOVEL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DSC_MESTRE'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 472
    Top = 39
    object cdsImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsImovelIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object cdsImovelCIMVLRALUGUEL: TFloatField
      FieldName = 'CIMVLRALUGUEL'
      DisplayFormat = '###,###,#0.00'
    end
    object cdsImovelCIMVLRAJUSTADO: TFloatField
      FieldName = 'CIMVLRAJUSTADO'
      DisplayFormat = '###,###,#0.00'
    end
    object cdsImovelFLGRATEIO: TFloatField
      FieldName = 'FLGRATEIO'
    end
    object cdsImovelCIMPERCENTRATEIO: TFloatField
      FieldName = 'CIMPERCENTRATEIO'
    end
    object cdsImovelCIMDESCRICAO: TStringField
      FieldName = 'CIMDESCRICAO'
      Size = 60
    end
    object cdsImovelCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object cdsImovelIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object cdsImovelCIMDTFIM: TDateTimeField
      FieldName = 'CIMDTFIM'
    end
    object cdsImovelDSC_IMOVEL: TStringField
      FieldName = 'DSC_IMOVEL'
      Size = 60
    end
    object cdsImovelDSC_MESTRE: TStringField
      FieldName = 'DSC_MESTRE'
      Size = 60
    end
    object cdsImovelCIMDTINI: TDateTimeField
      FieldName = 'CIMDTINI'
    end
  end
  object Query1: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      
        'SELECT C.CODESTADO,         C.CODPORTFORMA,     C.CONBANCOFIANCA' +
        ',   C.CONDATAASSINATURA,'
      
        '                C.CONDATAAVDENUNCIA, C.CONDATAAVRENEGOC, C.CONDA' +
        'TACARENCIA,  C.CONDATADENUNCIA,'
      
        '                C.CONDATAFIANCAAV,   C.CONDATAFIANCAFIM, C.CONDA' +
        'TAFIANCAINI, C.CONDATAFIM,'
      
        '                C.CONDATAINICAREN,   C.CONDATAINICIO,    C.CONDA' +
        'TAREAJUSTE,  C.CONDATARENEGOC,'
      
        '                C.CONDESCRICAO,      C.CONDIASREPASSE,   C.CONDI' +
        'ASTOLERANCIA,C.CONDIAVENCIMENTO,'
      
        '                C.CONINDICEREAJUSTE, C.CONMESREFREAJUSTE,C.CONMO' +
        'EDAMORA,     C.CONMOEDAMULTA,'
      
        '                C.CONNOME,           C.CONNUMERO,        C.CONOB' +
        'SFIANCA,     C.CONPERALUGUEL,'
      
        '                C.CONPERCENTMORA,    C.CONPERCENTMULTA,  C.CONPE' +
        'RMORA,       C.CONPERREAJUSTE,'
      
        '                C.CONPROXREAJUSTE,   C.CONQUANTVAGAS,    C.CONTA' +
        'XAADMIN,     C.CONVLRAJUSTADO,'
      
        '                C.CONVLRFIANCA,      C.CONVLRMORA,       C.CONVL' +
        'RMULTA,      C.CONVLRTOTAL,'
      
        '                C.FLGCOBRANCAAUTO,   C.FLGCOMPETALUGUEL, C.FLGFI' +
        'ANCA,        C.FLGINDETERMINADO,'
      
        '                C.FLGMORAPROPORC,    C.FLGSTATUS,        C.FLGTI' +
        'POCONTRATO,  C.FLGTIPODIATOLERA,'
      
        '                C.FLGTIPODIAVENC,    C.IDADMINIMOVEL,    C.IDATI' +
        'VIDADE,      C.IDCIDADES,'
      
        '                C.IDCONTRATOIMOVEL,  C.IDINDCORRECAO,    C.IDLOC' +
        'ATARIO,      C.IDMARCA,'
      
        '                C.IDMSGBOLETO,       C.IDPAIS,           C.IDPES' +
        'SOA,         C.IDRESPONSAVEL,'
      
        '                C.IDSITCONTIMOB,     C.IDTIPOCUSTORECIMO,C.MOECO' +
        'DIGO,        C.PERALUGUELIDEAL,'
      
        '                C.PERCTXJURMERC,     C.PERITXJURMERC,    C.VLRCO' +
        'NTABIL,      C.VLRPRESENTE,'
      
        '                C.VLRPROPOSTA,       C.FLGTIPOALUGUEL,   C.CONDA' +
        'TASOLRESC,   C.IDREGRARES,'
      
        '                C.PERMULTARESC,      C.QTDEMULTARESC,    C.CONPE' +
        'RCREAJUSTE,'
      '                A.NOME            AS DSC_ADMINISTRADORA,'
      '                L.NOME            AS DSC_LOCATARIO,'
      '                R.NOME            AS DSC_RESPONSAVEL,'
      
        '                C.TRGDTINCLUSAO, C.TRGUSERINCLUSAO, U.NOME AS US' +
        'UARIO,'
      '                C.IDTIPOCONTRIMOB'
      '           FROM CONTRATOIMOVEL C,'
      '                ADMINIMOVEL AC, PESSOA A,'
      '                LOCATARIO   LC, PESSOA L,'
      '                RESPONSAVEL RC, PESSOA R,'
      '                PESSOA U'
      '          WHERE C.IDADMINIMOVEL  = AC.IDADMINIMOVEL(+)'
      '            AND AC.IDADMINIMOVEL = A.IDPESSOA(+)'
      '            AND C.IDLOCATARIO    = LC.IDLOCATARIO(+)'
      '            AND LC.IDLOCATARIO   = L.IDPESSOA(+)'
      '            AND C.IDRESPONSAVEL  = RC.IDRESPONSAVEL(+)'
      '            AND SUBSTR(C.TRGUSERINCLUSAO,3,30) = U.IDPESSOA(+)'
      '            AND RC.IDRESPONSAVEL = R.IDPESSOA(+)'
      '            AND ROWNUM < 2'
      ''
      '/*'
      'SELECT L.*,'
      '       '#39' '#39' AS DSC_IMOVEL,'
      '       '#39' '#39' AS DSC_MESTRE,'
      '       '#39' '#39' AS CODTIPIMOVEL,'
      '       '#39' '#39' AS IMOCODIGO'
      ' FROM CONTRATOXIMOVEL L'
      '*/'
      ''
      ''
      ''
      ''
      ' ')
    Left = 429
    Top = 100
  end
  object cdsTipoCustoRec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 737
    Top = 321
    object cdsTipoCustoRecDESCCUSTORECIMO: TStringField
      DisplayLabel = 'Receita / Despesa'
      DisplayWidth = 60
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object cdsTipoCustoRecIDTIPOCUSTORECIMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCUSTORECIMO'
      Visible = False
    end
    object cdsTipoCustoRecRECCUSTO: TStringField
      DisplayWidth = 1
      FieldName = 'RECCUSTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object cdsPortadorForma: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 737
    Top = 335
    Data = {
      823300009619E0BD01000000180000003900430000000300000076070C434F44
      504F5254464F524D41080004000000000005504C414E4F080004000000000009
      554E49444E45474F4308000400000000000B434F44535542434F4E5441080004
      00000000000D494454454D504C43484551554508000400000000000849445045
      53534F410800040000000000094944454D505245534108000400000000000850
      4C41434F4E544101004900000002000753554254595045020049000A00466978
      656443686172000557494454480200020012000E434F4443454E54524F435553
      544F01004900000002000753554254595045020049000A004669786564436861
      7200055749445448020002000A000A434F44424C4F5143484508000400000000
      000B434F44504F525441444F52080004000000000008434F44464F524D410800
      0400000000000652454350414701004900000002000753554254595045020049
      000A00466978656443686172000557494454480200020001000B4C414E434146
      494E414E4301004900000002000753554254595045020049000A004669786564
      436861720005574944544802000200010005444D414953080004000000000011
      49445553554152494F494E434C5553414F080004000000000009444553435249
      43414F01004900000001000557494454480200020032000F4E554D454D505245
      534142414E434F01004900000001000557494454480200020014000B4E4F5353
      4F4E554D45524F01004900000001000557494454480200020014000B4A55524F
      53504F5244494108000400000000000D5052415A4F50524F544553544F080004
      00000000000F434F4E54524F4C4552454D455353410800040000000000104441
      5441434F4E545252454D45535341080008000000000011434F44415251554956
      4F52454D4553534108000400000000000E504154484152515549564F52454D01
      00490000000100055749445448020002003C000E504154484152515549564F52
      45540100490000000100055749445448020002003C000C434F445449504F5041
      47544F08000400000000000D434F44464F524D41504147544F08000400000000
      000D464C47454D495445415649534F0100490000000200075355425459504502
      0049000A00466978656443686172000557494454480200020001000A4E554D52
      415A414F434301004900000001000557494454480200020014000F4C4F544554
      52414E534D495353414F0800040000000000094445534346494E414E01004900
      00000100055749445448020002003C000D5452474454494E434C5553414F0800
      0800000000000F54524755534552494E434C5553414F01004900000001000557
      49445448020002001E0011464C47434845515545444946455249444F01004900
      000002000753554254595045020049000A004669786564436861720005574944
      544802000200010010464C47434F4E544142454D495343485101004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      000200010011504C41434F4E5441434F4E544142434851010049000000020007
      53554254595045020049000A0046697865644368617200055749445448020002
      0012000E504C414E4F434F4E5441424348510800040000000000084944464F52
      434C4908000400000000000E4944434F4E464947424152524153080004000000
      00000F44494153454D414E414C414E43544F0100490000000100055749445448
      020002000A000F4449415355544549534C414E43544F08000400000000000C46
      4C474F425249474146415601004900000002000753554254595045020049000A
      004669786564436861720005574944544802000200010011464C47434F4E5452
      4F4C4143484551554501004900000002000753554254595045020049000A0046
      6978656443686172000557494454480200020001000A434F44434F5252455350
      01004900000001000557494454480200020014000B56414C4F524D4158494D4F
      08000400000000000F434F44464F524D415047544F414C540800040000000000
      08534551504147544F080004000000000008444D414953414C54080004000000
      00000E464C47555341414C54454E56494F080004000000000010464C474D454E
      534147454D564552534F080004000000000009434F44544950444F4308000400
      000000000C464C47454E43434F4E544153010049000000020007535542545950
      45020049000A00466978656443686172000557494454480200020001000F464C
      47464C4F415441525142414E4301004900000002000753554254595045020049
      000A00466978656443686172000557494454480200020001000F464C47444154
      41544445424352454401004900000002000753554254595045020049000A0046
      69786564436861720005574944544802000200010008464C47415449564F0100
      4900000002000753554254595045020049000A00466978656443686172000557
      4944544802000200010014464C474F42534552564F4252494741544F52494101
      004900000002000753554254595045020049000A004669786564436861720005
      57494454480200020001000100044C4349440400010009080000005011051054
      550555505505555555010000000000405D400000000000804540000000000000
      F03F083231323931323031000000000000084000000000000053400152014E00
      000000308912411B434546202D20494D4F42202D2053454D2046494E414E4345
      49524F0000000000000000000000000000000000F43FC569C1CC4208434D3330
      333639320153014E005011051054550555505505555555010000000000005D40
      0000000000804540000000000000F03F06313131323033000000000000204000
      00000000001C400152015300000000308912412F53616E74616E6465722D436F
      6E746120496E76657374696D656E746F2D4372E96469746F204175746F6DE174
      69636F0000000000000000000000000000000000B8373543C1CC4208434D3330
      333639320153014E005011051054550555505505555555010000000000805D40
      0000000000804540000000000000F03F083131313230313031000000000000F0
      3F0000000000001C40015201530000000030891241314242202D20436F6D6572
      6369616C2053756C2F4446202D203432313039352D3620204372656469746F20
      4175746F6D6174000000000000000000000000000000000080A8C79FC1CC4208
      434D3330333639320153014E0050110500405105555015055555550100000000
      00805E400000000000804540000000000000F03F0A3131313233303031303100
      00000000000840000000000080494001520153000000000000F03F0000000030
      89124117434546202D20205369636F62202D20323420686F7261731032343538
      3030333030303330313030300938323030313636333300000000000035400000
      000000000000000000000000000000B0C544D4C2CC4208434D33303336393200
      000000000034400153014E005011050040110555501505555555010000000000
      C05E400000000000804540000000000000F03F0A313131323330303130310000
      0000000008400000000000804940015201530000000000000040000000003089
      124116434546202D205369636F62202D20343820686F72617310323435383030
      3330303033303130303009383230303136363037000000000000104000000000
      0000F0BF0000000000000000000000000000000000547B45D4C2CC4208434D33
      303336393200000000000034400153014E005011050054150555505505555555
      010000000000005F400000000000804540000000000000F03F0A313131323330
      303130310000000000000840000000000000204001520153000000000000F03F
      000000003089124116434546202D204F6E206C696E6520323420686F72617300
      0000000000F0BF00000000000000000000000000000000002CD545D4C2CC4208
      434D3330333639320153014E0050110510545505555055055555550100000000
      00C05F400000000000804540000000000000F03F043131323200000000000008
      4000000000000053400152014E000000003089124126434546202D20494D4F42
      2D53454D2046494E414E432D20414E4F5320414E544552494F52455300000000
      00000000000000000000000000F45E9E74C3CC4208434D333033363932015301
      4E005011050054150555505505555555010000000000805F4000000000008045
      40000000000000F03F0A31313132333030313031000000000000084000000000
      0000204001520153000000000000F03F000000003089124119434546202D2020
      4F6E206C696E65202D20323420686F726173000000000000F0BF000000000000
      0000000000000000000000D8DFD06EC3CC4208434D3330333639320153014E00
      5011051054150555505505555555010000000000C06040000000000080454000
      0000000000F03F0A313131323330303630310000000000002440000000000000
      20400152015300000000308912412243414958412046696E616E6369616D656E
      746F2046475453202D204F6E206C696E65000000000000F0BF00000000000000
      000000000000000000008CBF7044C4CC4208434D3330333639320153014E0050
      1105105415055550550555555501000000000020614000000000008045400000
      00000000F03F0831313132333030380000000000002840000000000000204001
      520153000000004089124132434546202D2020417272656E64616D656E746F20
      466572726F62616E202D20206372656469746F206175746F6D617469636F0000
      00000000F0BF00000000000000000000000000000000009CDCA5EAC5CC420843
      4D3330333639360153014E005011051054150555505505555555010000000000
      4061400000000000804540000000000000F03F08313131323330303500000000
      000022400000000000001C4001520153000000004089124132436566202D2043
      6F72706F726174652043656E746572202D20436F6E746120496E76657374696D
      656E746F202D2043726564000000000000F0BF00000000000000000000000000
      00000000C8C2A5CCC7CC4208434D3330333639360153014E0050110510545505
      555015055515540100000000008061400000000000804540000000000000F03F
      063131313230350000000000002E400000000000005540015201530000000030
      8912412E53616E74616E6465722052656E61697373616E636520434349202D20
      4372E96469746F204175746F6DE17469636F0000000000000000000000000000
      000000405377E6C9CC4208434D33303336393200000000000034400153014E00
      00000000806040014E005011051044110555501505551555010000000000A061
      400000000000804540000000000000F03F063131313230340000000000002C40
      00000000000055400152015300000000308912412353616E74616E6465722052
      656E61697373616E63652031332E3030312E3336382D32200134000000000000
      0040000000000000F0BF00000000000000000000000000000000005C7877E6C9
      CC4208434D33303336393200000000000034400153014E000000000080604000
      5011051054550555505505555554010000000000006240000000000080454000
      0000000000F03F0A313131323330303130310000000000000840000000000080
      55400152015300000000308912412B434546202D20436F72706F726174652043
      656E746572202D20456E636F6E74726F20646520436F6E746173000000000000
      000000000000000000000050BFEBF0C9CC4208434D3330333639320153014E01
      5300501105004415055550550555555401000000000040624000000000008045
      40000000000000F03F0A31313132333030313031000000000000084000000000
      0000564001520153000000000000F03F000000003089124129434546202D2043
      6F6272616EE76120456C6574726F6E696361202D204F7574726F732043616E61
      6973093832303031363630330000000000002040000000000000000000000000
      000000000088E1C4C1CACC4208434D3330333639320153014E014E0050110500
      4415055550550555555401000000000060624000000000008045400000000000
      00F03F0A31313132333030313031000000000000084000000000000056400152
      0153000000000000F03F000000003089124132434546202D20436F6272616EE7
      6120456C6574726F6E696361202D20436F6D70656E7361E7E36F20456C657472
      6F6E696361093832303031363630330000000000002040000000000000000000
      0000000000000000FC15C7C1CACC4208434D3330333639320153014E014E0050
      1105004415055550550555555501000000000080624000000000008045400000
      00000000F03F0A31313132333030313031000000000000084000000000000056
      4001520153000000000000F03F00000000308912412C434546202D20436F6272
      616EE76120456C6574726F6E696361202D204E6F205072F37072696F2042616E
      636F093832303031363630330000000000002040000000000000000000000000
      0000000000B84AC7C1CACC4208434D3330333639320153014E00501105004415
      0555505505555554010000000000A062400000000000804540000000000000F0
      3F0A313131323330303130310000000000000840000000000000564001520153
      000000000000F03F000000003089124124434546202D20436F6272616EE76120
      456C6574726F6E696361202D204C6F7465726963610938323030313636303300
      0000000000204000000000000000000000000000000000003889C7C1CACC4208
      434D3330333639320153014E014E005011050044150555505505555554010000
      000000C062400000000000804540000000000000F03F0A313131323330303130
      310000000000000840000000000000564001520153000000000000F03F000000
      003089124131434546202D20436F6272616EE76120456C6574726F6E69636120
      2D20436F6D70656E732E20436F6E76656E63696F6E616C093832303031363630
      3300000000000020400000000000000000000000000000000000C09CC7C1CACC
      4208434D3330333639320153014E014E00501105004415055550550555555501
      0000000000E062400000000000804540000000000000F03F0A31313132333030
      3130310000000000000840000000000000564001520153000000000000F03F00
      0000003089124127434546202D20436F6272616EE76120456C6574726F6E6963
      61202D20456D20436172746F72696F0938323030313636303300000000000020
      400000000000000000000000000000000000DCC1C7C1CACC4208434D33303336
      39320153014E0050110500441505555055055555550100000000000063400000
      000000804540000000000000F03F0A3131313233303031303100000000000008
      40000000000000564001520153000000000000F03F00000000308912412C4345
      46202D20436F6272616EE76120456C6574726F6E6963612D20436F7272657370
      2E2042616E636172696F09383230303136363033000000000000204000000000
      000000000000000000000000008846C9C1CACC4208434D333033363932015301
      4E00501105004415055550550555555501000000000020634000000000008045
      40000000000000F03F0A31313132333030313031000000000000084000000000
      00C05540015201530000000000000040000000003089124127434546202D2043
      6F6272616EE76120456C6574726F6E696361202D204348204C6F746572696361
      0938323030313636303300000000000020400000000000000000000000000000
      00000050F6C9C1CACC4208434D3330333639320153014E005011050044150555
      5055055555540100000000004063400000000000804540000000000000F03F0A
      3131313233303031303100000000000008400000000000C05540015201530000
      00000000004000000000308912412C434546202D20436F6272616EE76120456C
      6574726F6E696361204348202D204F7574726F732043616E6169730938323030
      313636303300000000000020400000000000000000000000000000000000F0FF
      CAC1CACC4208434D3330333639320153014E014E005011050044150555505505
      5555540100000000006063400000000000804540000000000000F03F0A313131
      3233303031303100000000000008400000000000C05540015201530000000000
      000040000000003089124130434546202D20436F6272616EE76120456C657472
      6F6E696361204348202D20436F72726573702E2042616E636172696F09383230
      30313636303300000000000020400000000000000000000000000000000000CC
      05CBC1CACC4208434D3330333639320153014E014E0050110500441505555055
      055555540100000000008063400000000000804540000000000000F03F0A3131
      313233303031303100000000000008400000000000C055400152015300000000
      00000040000000003089124131434546202D20436F6272616EE76120456C6574
      726F6E696361204348202D20436F6D702E20436F6E76656E63696F6E616C0938
      3230303136363033000000000000204000000000000000000000000000000000
      00C007CBC1CACC4208434D3330333639320153014E014E005011050044150555
      505505555554010000000000A063400000000000804540000000000000F03F0A
      3131313233303031303100000000000008400000000000C05540015201530000
      00000000004000000000308912412F434546202D20436F6272616EE76120456C
      6574726F6E696361204348202D20436F6D702E20456C6574726F6E6963610938
      3230303136363033000000000000204000000000000000000000000000000000
      00B409CBC1CACC4208434D3330333639320153014E014E005011050044150555
      505505555554010000000000C063400000000000804540000000000000F03F0A
      3131313233303031303100000000000008400000000000C05540015201530000
      00000000004000000000308912412A434546202D20436F6272616EE76120456C
      6574726F6E696361204348202D20456D20436172746F72696F09383230303136
      363033000000000000204000000000000000000000000000000000009C0DCBC1
      CACC4208434D3330333639320153014E014E0050110500441505555055055555
      55010000000000E063400000000000804540000000000000F03F0A3131313233
      303031303100000000000008400000000000C055400152015300000000000000
      4000000000308912412F434546202D20436F6272616EE76120456C6574726F6E
      696361204348202D204E6F2050726F7072696F2042616E636F09383230303136
      36303300000000000020400000000000000000000000000000000000900FCBC1
      CACC4208434D3330333639320153014E00501105104415055550150555555501
      00000000000064400000000000804540000000000000F03F0A31313132333030
      313031000000000000084000000000008049400152015300000000DAC8264117
      434546202D205349434F4220456D7072E97374696D6F730136000000000000F0
      BF0000000000000000000000000000000000608147D5CBCC4208434D37343636
      303500000000000036400153014E005011051054150555505505555554010000
      0000006064400000000000804540000000000000F03F06313131323137000000
      000000184000000000008055400152015300000000308912412442616E636F20
      53616E74616E646572202D20456E636F6E74726F20646520436F6E7461730000
      00000000F0BF0000000000000000000000000000000000702EE803CCCC420843
      4D3330333639320153014E015300501105105415055550550555555401000000
      00008064400000000000804540000000000000F03F0631313132303300000000
      0000204000000000008055400152015300000000308912412842616E636F2053
      616E74616E64657220434349202D20456E636F6E74726F20646520436F6E7461
      73000000000000F0BF0000000000000000000000000000000000907CE803CCCC
      4208434D3330333639320153014E015300501105105415055550550555155501
      0000000000C064400000000000804540000000000000F03F0831313132303130
      31000000000000F03F0000000000001C40015201530000000030891241244261
      6E636F20646F2042726173696C202D204372656469746F204175746F6D617469
      636F000000000000F0BF000000000000000000000000000000000040C1FD0DCC
      CC4208434D3330333639320153014E0000000000405740005011051054150555
      5055055555550100000000000065400000000000804540000000000000F03F0A
      3131313233303031303200000000000030400000000000001C40015201530000
      000030891241324345462D436F72706F7261746520426C6F717565696F204A75
      64696369616C2D4372E96469746F204175746F6D617469636F000000000000F0
      BF000000000000000000000000000000000078F0E094CDCC4208434D33303336
      39320153014E0050110510541505555015055515550100000000006065400000
      000000804540000000000000F03F063131313230360000000000003240000000
      00004056400152015300000000308912411C53616E74616E64657220416E6772
      612031332E3030322E3235342D39000000000000F0BF00000000000000000000
      00000000000000F00A868ECECC4208434D333033363932000000000000344001
      53014E0000000000A06040005011051054150555501505551555010000000000
      8065400000000000804540000000000000F03F06313131323037000000000000
      334000000000008056400152015300000000308912411B53616E74616E646572
      204361626F2031332E3030322E3235352D36000000000000F0BF000000000000
      0000000000000000000000AC3F868ECECC4208434D3330333639320000000000
      0034400153014E0000000000C060400050110510541505555055055555550100
      00000000E065400000000000804540000000000000F03F0A3131313233303031
      3031000000000000084000000000008057400152015300000000308912413243
      4546202D20436F72706F726174652043656E7465722D46696E616E632E204861
      6269746163696F6E616C202D2046475453000000000000F0BF00000000000000
      00000000000000000000FC2F828CD0CC4208434D3330333639320153014E0050
      1105105415055550550555555501000000000000664000000000008045400000
      00000000F03F0A3131313233303031303100000000000008400000000000C057
      40015201530000000030891241324345462D20436F72706F726174652043656E
      7465722D46696E616E632E2048616269746163202D20456D7072E97374696D6F
      000000000000F0BF000000000000000000000000000000000014A9828CD0CC42
      08434D3330333639320153014E00501105105415055550550555555500000000
      00002066400000000000804540000000000000F03F0A31313132333030313031
      000000000000084000000000004057400152015300000000308912412F434546
      202D20436F72706F726174652043656E746572202D204648202D205265637572
      736F732050726F7072696F73000000000000F0BF000000000000000000000000
      0000000000C4DF828CD0CC4208434D3330333639320153014E01530050110510
      5415055550550555551401000000000060664000000000008045400000000000
      00F03F08313131323130303100000000000035400000000000001C4001520153
      00000000308912411C425241444553434F2D204372656469746F204175746F6D
      617469636F000000000000F0BF00000000000000000000000000000000004C2E
      228CD3CC4208434D3330333639320153014E014E015300501105105415055550
      55055555550100000000008066400000000000804540000000000000F03F0831
      3131323130303200000000000036400000000000001C40015201530000000030
      89124121425241444553434F20434349202D204372656469746F204175746F6D
      617469636F000000000000F0BF0000000000000000000000000000000000385B
      228CD3CC4208434D3330333639320153014E0050110510541505555055055555
      55010000000000A066400000000000804540000000000000F03F083131313231
      30303300000000000037400000000000001C4001520153000000003089124129
      425241444553434F2052454E41495353414E4345202D204372656469746F2041
      75746F6D617469636F000000000000F0BF000000000000000000000000000000
      000064A7228CD3CC4208434D3330333639320153014E00501105105415055550
      5505555555010000000000C066400000000000804540000000000000F03F0831
      3131323130303400000000000038400000000000001C40015201530000000030
      8912412D425241444553434F2052454E41495353414E434520434349202D2043
      72656469746F204175746F6D617469636F000000000000F0BF00000000000000
      0000000000000000000038D8228CD3CC4208434D3330333639320153014E0050
      11051054150555505505555555010000000000E0664000000000008045400000
      00000000F03F08313131323130303500000000000039400000000000001C4001
      520153000000003089124124425241444553434F20414E475241202D20204372
      656469746F204175746F6D617469636F000000000000F0BF0000000000000000
      00000000000000000060FB228CD3CC4208434D3330333639320153014E005011
      051054150515505505555555010000000000E067400000000000804540000000
      000000F03F0A3131313233303031303100000000000008400000000000805540
      0152015300000000308912412C434546202D20456E636F6E74726F2064652043
      6F6E746173202D20504741202D205265636562696D656E746F000000000000F0
      BF0000000000000000000000000000000026504741202D20456E636F6E74726F
      20646520436F6E746173202D205265636562696D656E746F00C0AA975CD4CC42
      08434D3330333639320153014E00501105101455555540555555555501000000
      0000001C400000000000804540000000000000F03F0A31313132333030313031
      000000000000084000000000000014400152015300000000A02BF3400C434546
      202D2020536976617400000000000000000054BF3C15B0CC4207434D37383532
      32014E0050110510145555554055555555550100000000000020400000000000
      804540000000000000F03F0A3131313233303031303100000000000008400000
      0000000018400152015300000000A02BF3400A434546202D2020444F43000000
      00000000000094DE3C15B0CC4207434D3738353232014E005011051044550555
      4055555555540100000000000022400000000000804540000000000000F03F0A
      3131313233303031303100000000000008400000000000001C40015201530000
      0000A02BF34019434546202D20204372656469746F204175746F6D617469636F
      0A2020202020202020202000000000000000000000000000000000008C093D15
      B0CC4207434D3738353232014E014E0050110510145555554055555555550100
      000000000024400000000000804540000000000000F03F0A3131313233303031
      3031000000000000084000000000000020400152015300000000A02BF3400E43
      4546202D20204F6E206C696E65000000000000000000D8263D15B0CC4207434D
      3738353232014E00501105101051555540554555555501000000000000324000
      00000000804540000000000000F03F0A31313132333030313031000000000000
      084000000000008048400152015300000000308912410B434546202D20536963
      6F7611323435383030332E303030333031303031000000000000000000000000
      0000F03F00FC04AEEAB2CC4208434D333033363932014E015300501105104011
      00554015455555550100000000000034400000000000804540000000000000F0
      3F0A313131323330303130310000000000000840000000000080494001520153
      00000000308912410B434546202D205369636F62103234353830303330303033
      30313030300A38323030303338383237000000000099C0400000000000002040
      25433A5C546F74616C507265765C436F6E746173206120526563656265725C52
      656D6573736125433A5C546F74616C507265765C436F6E746173206120526563
      656265725C5265746F726E6F000000000000000000000000000000000058C6AE
      EAB2CC4208434D333033363932014E0000000000003440015300501105101455
      5555405505555555010000000000804C400000000000804540000000000000F0
      3F0A3131313233303031303100000000000008400000000000004D4001520153
      000000003089124112434546202D20436574697020446F632031340000000000
      0000000040B703C0B4CC4208434D333033363932014E0153014E005011051054
      550555505505555555010000000000804D400000000000804540000000000000
      F03F083131313230313031000000000000F03F0000000000001C400152015300
      000000308912411C4242202D204372E96469746F204175746F6DE17469636F20
      494E53530000000000000000000000000000000000902963A2B5CC4208434D33
      30333639320153014E0050110510145555555055055555550100000000000053
      400000000000804540000000000000F03F063131313231370000000000001840
      0000000000004D400152015300000000308912411853616E74616E646572202D
      20436574697020446F63203134000000000000000000844F5F6CB7CC4208434D
      3330333639320153014E00501105101455555550550555555501000000000080
      53400000000000804540000000000000F03F0631313132313700000000000018
      4000000000000018400152015300000000308912411053616E74616E64657220
      202D20444F4300000000000000000094765F6CB7CC4208434D33303336393201
      53014E0050110510145555555055055555550100000000000054400000000000
      804540000000000000F03F063131313231370000000000001840000000000000
      1C400152015300000000308912411E53616E74616E646572202D204372656469
      746F204175746F6D617469636F00000000000000000050AB5F6CB7CC4208434D
      3330333639320153014E00501105105455055550550555555501000000000080
      55400000000000804540000000000000F03F0831313132333030340000000000
      0014400000000000001C400152015300000000308912412C434546202D20436C
      75626520496D6F62696C69E172696F202D204372656469746F204175746F6DE1
      7469636F00000000000000000000000000000000000C3A5DDBB9CC4208434D33
      30333639320153014E005011051054555555505505555555010000000000C055
      400000000000804540000000000000F03F0A3131313233303031303100000000
      00001440000000000040524001520153000000003089124120434546202D2043
      6C75626520496D6F62696C69E172696F202D204368657175650098765DDBB9CC
      4208434D3330333639320153014E005011051054555555505505555555010000
      0000000056400000000000804540000000000000F03F0A313131323330303130
      31000000000000144000000000008048400152015300000000308912411F4345
      46202D20436C75626520496D6F62696C69E172696F202D205369636F76006CA7
      5DDBB9CC4208434D3330333639320153014E0050410550545505555055455555
      550100000000008056400000000000004440000000000000F03F000000000000
      F03F000000000000084000000000000053400152014E32434546202D20436F72
      706F726174652043656E746572202D20303330303033303130302D31202D2053
      454D2046494E414E43000000000000000000000000000000000054460469BDCC
      420E43415247415F4C454F4E4152444F01530050015550545555555055455555
      55010000000000C056400000000000804540000000000000F03F000000000000
      F03F0A3131313233303031303101520153135349434F56202D20456D7072E973
      74696D6F730054460469BDCC420E43415247415F4C454F4E4152444F01530050
      0155505455555550554555555501000000000080584000000000008045400000
      00000000F03F000000000000F03F0A3131313233303031303101520153285349
      434F56202D20436F6E76656E696F2036303435202D20466F6C68612041737369
      737469646F730054460469BDCC420E43415247415F4C454F4E4152444F015300
      5011051054550555505500555555010000000000405740000000000080454000
      0000000000F03F063131313231380000000000001C400000000000001C400152
      015300000000308912413242616E636F20497461FA20436F6E74612054657263
      656972697A616461202D204372E96469746F204175746F6DE17469636F000000
      000000000000000000000000000060836C8ABDCC4208434D3330333639320553
      6578746100000000000000400153014E00501105004011005550550555554001
      0000000000005A400000000000804540000000000000F03F0A31313132333030
      3130310000000000000840000000000080484001520153000000000000F03F00
      00000030891241205369636F76202D20456D7072657374696D6F20436F6E7665
      6E696F203630303204363030320A383230303030383934340000000000109D40
      000000000000494003433A5C03433A5C00000000000000000000000000000000
      001CDEDC99BDCC4208434D3330333639320153014E014E014E01430050110500
      40110015505505555555010000000000405A4000000000008045400000000000
      00F03F0A31313132333030313031000000000000084000000000008048400152
      0153000000000000F03F0000000030891241275369636F76202D20436F6E7472
      69627569633F6F20466163756C746174697661202D203630333404363033340A
      383230303030383934340000000000003D40000000000000494019433A5C544F
      54414C505245565C464143554C54415449564F5319433A5C544F54414C505245
      565C464143554C54415449564F53000000000000000000000000000000002453
      49434F56202D20434F4252414E634120464143554C54415449564F53202D2036
      303334008888829CBDCC4208434D3330333639320153014E0050110510541505
      55505505555555010000000000805A400000000000804540000000000000F03F
      0A31313132333030313031000000000000084000000000000020400152015300
      0000003089124129436172746120436F6272616EE761202D20436F6E74726962
      7569E7E36F20466163756C746174697661000000000000F0BF00000000000000
      000000000000000000002C38849CBDCC4208434D3330333639320153014E0050
      11051044510515501505555555010000000000C05A4000000000008045400000
      00000000F03F0A31313132333030313031000000000000084000000000008049
      40015201530000000030891241205369636F62202D20436F6E747269627569E7
      E36F20466163756C746174697661033633310000000000107540000000000000
      00000000000000000000205349434F42202D20434F4E545249425549E7E34F20
      464143554C544154495641004CE5899CBDCC4208434D33303336393200000000
      000034400153014E005011051050110455505505555555010000000000405B40
      0000000000804540000000000000F03F0A313131323330303130310000000000
      00084000000000008048400152015300000000308912411B434546202D205369
      636F76202D20436F6E76EA6E696F203630373404363037340000000000606440
      000000000000494018543A5C7573695C544F54414C505245565C52656D657373
      6100000000000000000000000000000000008C7D76D1BECC4208434D33303336
      39320153014E}
    object cdsPortadorFormaDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsPortadorFormaFLGATIVO: TStringField
      DisplayLabel = 'Ativo'
      DisplayWidth = 1
      FieldName = 'FLGATIVO'
      FixedChar = True
      Size = 1
    end
    object cdsPortadorFormaCODPORTFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
  end
  object cdsCidade: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 737
    Top = 349
    object cdsCidadeIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
    end
    object cdsCidadeCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object cdsCidadeIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object cdsCidadeNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsCidadeCODMUNICIPIO: TStringField
      FieldName = 'CODMUNICIPIO'
      Size = 10
    end
    object cdsCidadeIDESTADO: TFloatField
      FieldName = 'IDESTADO'
    end
  end
  object cdsMsgBoleto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 737
    Top = 363
    object cdsMsgBoletoMSGDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'MSGDESCRICAO'
      Size = 60
    end
    object cdsMsgBoletoIDMSGBOLETO: TFloatField
      FieldName = 'IDMSGBOLETO'
      Visible = False
    end
  end
  object cdsSitContImob: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 737
    Top = 376
    object cdsSitContImobDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsSitContImobIDSITCONTIMOB: TFloatField
      FieldName = 'IDSITCONTIMOB'
      Visible = False
    end
  end
  object cdsBanco: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 737
    Top = 391
    object cdsBancoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsBancoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object cdsBancoNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object cdsBancoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
  end
  object dsBanco: TwwDataSource
    AutoEdit = False
    DataSet = cdsBanco
    Left = 739
    Top = 405
  end
  object dsVlrAno: TwwDataSource
    AutoEdit = False
    DataSet = cdsVlrAno
    Left = 526
    Top = 1
  end
  object cdsVlrAno: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DSC_MESTRE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DSC_IMOVEL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IDCONTRATOXVLRANO'
        DataType = ftFloat
      end
      item
        Name = 'IDCONTRATOIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'ANOINICIO'
        DataType = ftFloat
      end
      item
        Name = 'FLGCORRIGE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 526
    Top = 39
    object cdsVlrAnoDSC_MESTRE: TStringField
      DisplayLabel = 'Imóvel Mestre'
      DisplayWidth = 37
      FieldName = 'DSC_MESTRE'
      Size = 60
    end
    object cdsVlrAnoDSC_IMOVEL: TStringField
      DisplayLabel = 'Imóvel'
      DisplayWidth = 28
      FieldName = 'DSC_IMOVEL'
      Size = 60
    end
    object cdsVlrAnoANOINICIO: TFloatField
      DisplayLabel = 'Ano Início'
      DisplayWidth = 9
      FieldName = 'ANOINICIO'
    end
    object cdsVlrAnoVALOR: TFloatField
      DisplayLabel = 'Novo Valor'
      DisplayWidth = 14
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,###,##0.00'
      EditFormat = '###,###,###,###,##0.00'
    end
    object cdsVlrAnoFLGCORRIGE: TStringField
      DisplayLabel = 'Cor.'
      DisplayWidth = 3
      FieldName = 'FLGCORRIGE'
      FixedChar = True
      Size = 1
    end
    object cdsVlrAnoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object cdsVlrAnoIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object cdsVlrAnoIDCONTRATOXVLRANO: TFloatField
      FieldName = 'IDCONTRATOXVLRANO'
      Visible = False
    end
  end
  object cdsRegra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 740
    Top = 418
    object cdsRegraNOMEREGRA: TStringField
      DisplayLabel = 'Nome da Regra'
      DisplayWidth = 60
      FieldName = 'NOMEREGRA'
      Size = 60
    end
    object cdsRegraIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Visible = False
    end
    object cdsRegraDESCRICAOREGRA: TMemoField
      FieldName = 'DESCRICAOREGRA'
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsContratoXDesc: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDCONTRATOXDESC'
        DataType = ftFloat
      end
      item
        Name = 'CODALTERADOR'
        DataType = ftFloat
      end
      item
        Name = 'IDCONTRATOIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VLRDESCONTO'
        DataType = ftFloat
      end
      item
        Name = 'PERDESCONTO'
        DataType = ftFloat
      end
      item
        Name = 'DATAINICIO'
        DataType = ftDateTime
      end
      item
        Name = 'DATAFIM'
        DataType = ftDateTime
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 717
    Top = 8
    object cdsContratoXDescDATAINICIO: TDateTimeField
      DisplayLabel = 'Data Inicial'
      DisplayWidth = 12
      FieldName = 'DATAINICIO'
    end
    object cdsContratoXDescDATAFIM: TDateTimeField
      DisplayLabel = 'Data Final'
      DisplayWidth = 13
      FieldName = 'DATAFIM'
    end
    object cdsContratoXDescDESCRICAO: TStringField
      DisplayLabel = 'Alterador'
      DisplayWidth = 38
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object cdsContratoXDescPERDESCONTO: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 10
      FieldName = 'PERDESCONTO'
      DisplayFormat = '#,##0.0000%'
    end
    object cdsContratoXDescVLRDESCONTO: TFloatField
      DisplayLabel = 'Valor fixo'
      DisplayWidth = 10
      FieldName = 'VLRDESCONTO'
      DisplayFormat = '#,##0.00'
    end
    object cdsContratoXDescMOESIGLA: TStringField
      DisplayLabel = 'Moeda'
      DisplayWidth = 18
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object cdsContratoXDescOBSERVACAO: TStringField
      DisplayLabel = 'Observação'
      DisplayWidth = 60
      FieldName = 'OBSERVACAO'
      Size = 60
    end
    object cdsContratoXDescIDCONTRATOXDESC: TFloatField
      DisplayLabel = 'Id. Contrato x Desconto'
      DisplayWidth = 10
      FieldName = 'IDCONTRATOXDESC'
      Visible = False
    end
    object cdsContratoXDescCODALTERADOR: TFloatField
      DisplayLabel = 'Cod. Alterador'
      DisplayWidth = 10
      FieldName = 'CODALTERADOR'
      Visible = False
    end
    object cdsContratoXDescIDCONTRATOIMOVEL: TFloatField
      DisplayLabel = 'Id. Contrato'
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object cdsContratoXDescMOECODIGO: TFloatField
      DisplayLabel = 'Cód. Moeda'
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
  end
  object dsContratoXDesc: TwwDataSource
    AutoEdit = False
    DataSet = cdsContratoXDesc
    Left = 715
    Top = 57
  end
  object cdsAlteradorXTipoImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 693
    Top = 212
    object cdsAlteradorXTipoImovelCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object cdsAlteradorXTipoImovelCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
    end
    object cdsAlteradorXTipoImovelDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object cdsAlteradorXTipoImovelACRESDECRES: TStringField
      FieldName = 'ACRESDECRES'
      FixedChar = True
      Size = 1
    end
    object cdsAlteradorXTipoImovelRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object cdsAlteradorXTipoImovelCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 45
    end
  end
  object dsAlteradorXTipoImovel: TwwDataSource
    DataSet = cdsAlteradorXTipoImovel
    Left = 616
    Top = 363
  end
  object cdsMoedaDesc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 673
    Top = 335
    object cdsMoedaDescMOESIGLA: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 6
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object cdsMoedaDescMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object cdsMoedaDescMOEDESC: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'MOEDESC'
      Visible = False
    end
    object cdsMoedaDescMOEPERIODICIDADE: TStringField
      FieldName = 'MOEPERIODICIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsMoedaDescFLGPERCVALOR: TStringField
      FieldName = 'FLGPERCVALOR'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object dtsMoeda: TwwDataSource
    DataSet = cdsMoeda
    Left = 664
    Top = 367
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Constraints = True
    Left = 501
    Top = 68
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      
        'SELECT CX.IDIMOVEL, CX.IDCONTRATOIMOVEL, CX.CIMVLRALUGUEL, CX.CI' +
        'MVLRAJUSTADO, CX.FLGRATEIO, CX.CIMPERCENTRATEIO,'
      
        '       CX.CIMDESCRICAO, I.CODTIPIMOVEL, I.IMOCODIGO, CX.CIMDTINI' +
        ', CX.CIMDTFIM, I.IMONOME AS DSC_IMOVEL,'
      '       IM.IMONOME AS DSC_MESTRE'
      'FROM CONTRATOXIMOVEL CX, IMOVEL I, IMOVEL IM'
      'WHERE CX.IDIMOVEL      = I.IDIMOVEL'
      '  AND I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'ORDER BY DSC_MESTRE, DSC_IMOVEL'
      ' ')
    ClientDataSet = cdsImovel
    Left = 480
    Top = 80
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      'SELECT E.IDEVENTOIMOVEL, E.IDIMOVEL,       E.IDCONTRATOIMOVEL,'
      '       E.IDUSUARIO,      E.IDCONTRATOLOJA, E.EVIDATAPROX,     '
      '       E.EVICABECALHO,   E.EVIDESCRICAO,   E.EVIDATA,         '
      '       E.FLGTIPOEVENTO,  E.EVIPERCENT,     E.EVIINDICEREAJUSTE,'
      '       E.EVIVLRANTERIOR, E.EVIVLRAJUSTADO, E.CODDOCUMENTO,     '
      '       E.FLGAVISO,       E.DIASAVISO,                          '
      
        '       RTRIM(U.NOMEUSUARIO)||'#39#39' - '#39#39'||PU.NOME AS USUARIO_EXTENSO' +
        ','
      '       M.MOESIGLA AS DSC_INDICE,'
      '       U.NOMEUSUARIO, E.NUMPROCESSO'
      'FROM EVENTOIMOVEL E,'
      '     PESSOA PU,        '
      '     USUARIOSISTEMA U, '
      '     MOEDA M           '
      'WHERE E.EVIINDICEREAJUSTE = M.MOECODIGO(+) '
      '  AND E.IDUSUARIO = U.IDUSUARIO(+)'
      '  AND U.IDUSUARIO = PU.IDPESSOA(+)'
      '  '
      '  and 1=2'
      'ORDER BY E.EVIDATA'
      ' ')
    ClientDataSet = cdsEvento
    Left = 637
    Top = 67
  end
  object CdsCondPagImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = CdsCondPagImovelCalcFields
    Left = 793
    Top = 3
    object CdsCondPagImovelcal_tipo: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'cal_tipo'
      Calculated = True
    end
    object CdsCondPagImovelNOME: TStringField
      DisplayLabel = 'Forma de cálculo'
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object CdsCondPagImovelDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Início'
      DisplayWidth = 10
      FieldName = 'DATAVENCIMENTO'
    end
    object CdsCondPagImovelVLRFINANC: TFloatField
      DisplayLabel = 'Valor '
      DisplayWidth = 13
      FieldName = 'VLRFINANC'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object CdsCondPagImovelNUMPARCELAS: TFloatField
      DisplayLabel = 'Nº Parc'
      DisplayWidth = 7
      FieldName = 'NUMPARCELAS'
    end
    object CdsCondPagImovelMESREFREAJUSTE: TFloatField
      DisplayLabel = 'Usa Indice Mes Anterior'
      DisplayWidth = 19
      FieldName = 'MESREFREAJUSTE'
    end
    object CdsCondPagImovelDATACARENCIA: TDateTimeField
      DisplayLabel = 'Carência'
      DisplayWidth = 18
      FieldName = 'DATACARENCIA'
    end
    object CdsCondPagImovelCODESTADO: TStringField
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object CdsCondPagImovelCODFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODFORMA'
      Visible = False
    end
    object CdsCondPagImovelCODPORTFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object CdsCondPagImovelCONDATACARENCIA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'CONDATACARENCIA'
      Visible = False
    end
    object CdsCondPagImovelCONDATAFIM: TDateTimeField
      DisplayWidth = 18
      FieldName = 'CONDATAFIM'
      Visible = False
    end
    object CdsCondPagImovelCONDATAINICAREN: TDateTimeField
      DisplayWidth = 18
      FieldName = 'CONDATAINICAREN'
      Visible = False
    end
    object CdsCondPagImovelCONDATAINICIO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'CONDATAINICIO'
      Visible = False
    end
    object CdsCondPagImovelCONDIASREPASSE: TFloatField
      DisplayWidth = 10
      FieldName = 'CONDIASREPASSE'
      Visible = False
    end
    object CdsCondPagImovelCONDIASTOLERANCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'CONDIASTOLERANCIA'
      Visible = False
    end
    object CdsCondPagImovelCONNOME: TStringField
      DisplayWidth = 60
      FieldName = 'CONNOME'
      Visible = False
      Size = 60
    end
    object CdsCondPagImovelCONNUMERO: TStringField
      DisplayWidth = 20
      FieldName = 'CONNUMERO'
      Visible = False
    end
    object CdsCondPagImovelDATAFIM: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAFIM'
      Visible = False
    end
    object CdsCondPagImovelDATAINI: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAINI'
      Visible = False
    end
    object CdsCondPagImovelDATAINIAMORTIZ: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAINIAMORTIZ'
      Visible = False
    end
    object CdsCondPagImovelDIAVENCIMENTO: TStringField
      DisplayWidth = 2
      FieldName = 'DIAVENCIMENTO'
      Visible = False
      Size = 2
    end
    object CdsCondPagImovelFLGTIPODIATOLERA: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTIPODIATOLERA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsCondPagImovelIDCIDADES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCIDADES'
      Visible = False
    end
    object CdsCondPagImovelIDCONDPAGIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDPAGIMOVEL'
      Visible = False
    end
    object CdsCondPagImovelIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object CdsCondPagImovelIDFORMACALCIMOB: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORMACALCIMOB'
      Visible = False
    end
    object CdsCondPagImovelIDLOCATARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLOCATARIO'
      Visible = False
    end
    object CdsCondPagImovelIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
      Visible = False
    end
    object CdsCondPagImovelMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object CdsCondPagImovelMOECODIGOCORRENTE: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGOCORRENTE'
      Visible = False
    end
    object CdsCondPagImovelMOESIGLA: TStringField
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Visible = False
      Size = 10
    end
    object CdsCondPagImovelPERIODO: TFloatField
      DisplayWidth = 10
      FieldName = 'PERIODO'
      Visible = False
    end
    object CdsCondPagImovelPERIODOREAJUSTE: TFloatField
      DisplayWidth = 10
      FieldName = 'PERIODOREAJUSTE'
      Visible = False
    end
    object CdsCondPagImovelPERIODOTAXA: TStringField
      DisplayWidth = 1
      FieldName = 'PERIODOTAXA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsCondPagImovelPRAZO: TStringField
      DisplayWidth = 1
      FieldName = 'PRAZO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsCondPagImovelTAXAJUROS: TFloatField
      DisplayWidth = 10
      FieldName = 'TAXAJUROS'
      Visible = False
    end
    object CdsCondPagImovelTIPOCONDPAG: TStringField
      DisplayWidth = 1
      FieldName = 'TIPOCONDPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsCondPagImovelINDCORRECAO: TFloatField
      FieldName = 'INDCORRECAO'
    end
    object CdsCondPagImovelPERINDPROJ: TFloatField
      FieldName = 'PERINDPROJ'
    end
  end
  object dsCondPagImovel: TDataSource
    DataSet = CdsCondPagImovel
    Left = 793
    Top = 55
  end
  object sqlDescCondicional: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '    0 as IDCONDPAGIMOVEL'
      'FROM'
      '    DUAL'
      'WHERE'
      '    1 = 2'
      '')
    ClientDataSet = cdsDescCondicional
    Left = 269
    Top = 71
  end
  object cdsDescCondicional: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 237
    Top = 76
  end
  object CMSqlParams3: TCMSqlParams
    SQL.Strings = (
      '   SELECT'
      '       FC.NOME,'
      '       CI.IDCONTRATOIMOVEL,'
      '       CI.IDCIDADES,'
      '       CI.IDPAIS,'
      '       CI.CONDIASTOLERANCIA,'
      '       CI.CONDIASREPASSE,'
      '       CI.CODESTADO,'
      '       CI.FLGTIPODIATOLERA,'
      '       CI.IDLOCATARIO,'
      '       CI.CODPORTFORMA,'
      '       CI.CONNUMERO,'
      '       CI.CONNOME,'
      '       CI.MOECODIGO AS MOECODIGOCORRENTE,'
      '       CI.CONDATAINICAREN,'
      '       CI.CONDATACARENCIA,'
      '       CI.CONDATAINICIO,'
      '       CI.CONDATAFIM,'
      '       MC.MOECODIGO,'
      '       MC.MOESIGLA,'
      '       NVL(PF.CODFORMA,0) AS CODFORMA,'
      '       CP.IDCONDPAGIMOVEL,'
      '       CP.IDFORMACALCIMOB,'
      '       CP.VLRFINANC,'
      '       CP.DATAINI,'
      '       CP.PRAZO,'
      '       CP.PERIODO,'
      '       CP.TAXAJUROS,'
      '       CP.PERIODOTAXA,'
      '       CP.NUMPARCELAS,'
      '       CP.DATAFIM,'
      '       CP.DATAVENCIMENTO,'
      '       TO_CHAR(CP.DATAVENCIMENTO,  '#39'DD'#39'  ) AS DIAVENCIMENTO,'
      '       CP.TIPOCONDPAG,'
      '       CP.MESREFREAJUSTE,'
      '       CP.DATACARENCIA,'
      '       CP.DATAINIAMORTIZ,'
      '       CP.PERIODOREAJUSTE,'
      '       CP.INDCORRECAO,'
      '       CP.PERINDPROJ'
      '   FROM'
      '       CONDPAGIMOVEL CP,'
      '       CONTRATOIMOVEL CI,'
      '       MOEDA MC,'
      '       PORTADORFORMA PF,'
      '       FORMACALCIMOB FC'
      '   WHERE'
      '       CI.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL'
      '   AND MC.MOECODIGO(+)     = CP.INDCORRECAO'
      '   AND CI.CODPORTFORMA     = PF.CODPORTFORMA'
      '   AND FC.IDFORMACALCIMOB  = CP.IDFORMACALCIMOB'
      '   AND CI.FLGTIPOCONTRATO  =   '#39'D'#39)
    ClientDataSet = CdsCondPagImovel
    Left = 794
    Top = 38
  end
  object cdsMulta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsMultaAfterScroll
    Left = 373
    Top = 43
    object cdsMultaDATAINI: TDateTimeField
      FieldName = 'DATAINI'
    end
    object cdsMultaDATAFIM: TDateTimeField
      FieldName = 'DATAFIM'
    end
    object cdsMultaFLGINDETERMINADO: TStringField
      FieldName = 'FLGINDETERMINADO'
      FixedChar = True
      Size = 1
    end
    object cdsMultaDSCINDCORR: TStringField
      FieldName = 'DSCINDCORR'
      Size = 10
    end
    object cdsMultaMESREFCORRECAO: TFloatField
      FieldName = 'MESREFCORRECAO'
    end
    object cdsMultaVLRMULTA: TFloatField
      FieldName = 'VLRMULTA'
      DisplayFormat = '#,##0.00'
    end
    object cdsMultaDSCMOEMULTA: TStringField
      FieldName = 'DSCMOEMULTA'
      Size = 10
    end
    object cdsMultaPERCMULTA: TFloatField
      FieldName = 'PERCMULTA'
    end
    object cdsMultaVLRJUROS: TFloatField
      FieldName = 'VLRJUROS'
      DisplayFormat = '#,##0.00'
    end
    object cdsMultaDSCMOEJUROS: TStringField
      FieldName = 'DSCMOEJUROS'
      Size = 10
    end
    object cdsMultaPERCJUROS: TFloatField
      FieldName = 'PERCJUROS'
    end
    object cdsMultaDSCPERIODOJUROS: TStringField
      FieldName = 'DSCPERIODOJUROS'
      Size = 6
    end
    object cdsMultaFLGJUROSPROPORC: TStringField
      FieldName = 'FLGJUROSPROPORC'
      FixedChar = True
      Size = 1
    end
    object cdsMultaDIASTOLERANCIA: TFloatField
      FieldName = 'DIASTOLERANCIA'
    end
    object cdsMultaDSCTIPODIATOLERA: TStringField
      FieldName = 'DSCTIPODIATOLERA'
      Size = 13
    end
    object cdsMultaDIASREPASSE: TFloatField
      FieldName = 'DIASREPASSE'
    end
    object cdsMultaDSCTIPODIAREPASS: TStringField
      FieldName = 'DSCTIPODIAREPASS'
      Size = 13
    end
    object cdsMultaIDCONTRATOXMULTA: TFloatField
      FieldName = 'IDCONTRATOXMULTA'
    end
    object cdsMultaIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object cdsMultaIDINDCORRECAO: TFloatField
      FieldName = 'IDINDCORRECAO'
    end
    object cdsMultaMOEDAJUROS: TFloatField
      FieldName = 'MOEDAJUROS'
    end
    object cdsMultaMOEDAMULTA: TFloatField
      FieldName = 'MOEDAMULTA'
    end
    object cdsMultaPERIODOJUROS: TStringField
      FieldName = 'PERIODOJUROS'
      FixedChar = True
      Size = 1
    end
    object cdsMultaFLGTIPODIATOLERA: TStringField
      FieldName = 'FLGTIPODIATOLERA'
      FixedChar = True
      Size = 1
    end
    object cdsMultaFLGTIPODIAREPASS: TStringField
      FieldName = 'FLGTIPODIAREPASS'
      FixedChar = True
      Size = 1
    end
    object cdsMultaIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
    end
    object cdsMultaTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object cdsMultaTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object cdsMultaDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
  end
  object dsMulta: TwwDataSource
    DataSet = cdsMulta
    Left = 374
    Top = 79
  end
  object CMSqlParams4: TCMSqlParams
    SQL.Strings = (
      
        '--SELECT MJ.IDTIPOCUSTORECIMO,       MJ.IDCONTRATOXMULTA,      M' +
        'J.IDCONTRATOIMOVEL,'
      
        '--       MJ.IDINDCORRECAO,           M.MOESIGLA AS DSCINDCORR, M' +
        'J.MOEDAJUROS,'
      
        '--       MP.MOESIGLA AS DSCMOEJUROS, MJ.MOEDAMULTA,            M' +
        'D.MOESIGLA AS DSCMOEMULTA,'
      
        '--       MJ.FLGINDETERMINADO,        MJ.VLRMULTA,              M' +
        'J.PERCMULTA,'
      
        '--       MJ.VLRJUROS,                MJ.PERCJUROS,             M' +
        'J.PERIODOJUROS,'
      
        '--       MJ.FLGJUROSPROPORC,         MJ.DATAINI,               M' +
        'J.DATAFIM,'
      
        '--       MJ.MESREFCORRECAO,          MJ.DIASTOLERANCIA,        M' +
        'J.DIASREPASSE,'
      
        '--       MJ.FLGTIPODIATOLERA,        MJ.FLGTIPODIAREPASS,      M' +
        'J.TRGDTINCLUSAO,'
      '--       MJ.TRGUSERINCLUSAO,         TR.DESCCUSTORECIMO,'
      
        '--       DECODE(MJ.PERIODOJUROS,'#39'D'#39','#39'Diário'#39','#39'M'#39','#39'Mensal'#39','#39#39') AS' +
        ' DSCPERIODOJUROS,'
      
        '--       DECODE(MJ.FLGTIPODIATOLERA,'#39'C'#39','#39'Dias Corridos'#39','#39'U'#39','#39'Dia' +
        's Úteis'#39','#39#39') AS DSCTIPODIATOLERA,'
      
        '--       DECODE(MJ.FLGTIPODIAREPASS,'#39'C'#39','#39'Dias Corridos'#39','#39'U'#39','#39'Dia' +
        's Úteis'#39','#39#39') AS DSCTIPODIAREPASS'
      
        '--FROM CONTRATOXMULTA MJ, MOEDA M, MOEDA MP, MOEDA MD, TIPOCUSTO' +
        'RECIMOV TR'
      '--WHERE 1=1'
      '--  AND MJ.IDCONTRATOIMOVEL = '#39'717'#39
      '--  AND ( TR.IDTIPOCUSTORECIMO(+) = MJ.IDTIPOCUSTORECIMO )'
      '--  AND ( M.MOECODIGO(+)          = MJ.IDINDCORRECAO )'
      '--  AND ( MP.MOECODIGO(+)         = MJ.MOEDAJUROS )'
      '--  AND ( MD.MOECODIGO(+)         = MJ.MOEDAMULTA )'
      ''
      'select * from portadorforma where recpag = '#39'R'#39)
    ClientDataSet = cdsPortadorForma
    Left = 555
    Top = 109
  end
  object cdsTipoContrato: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 505
    Top = 367
    object cdsTipoContratoDESCRICAO: TStringField
      DisplayWidth = 66
      FieldName = 'DESCRICAO'
      Size = 68
    end
    object cdsTipoContratoSIGLA: TStringField
      DisplayWidth = 5
      FieldName = 'SIGLA'
      Visible = False
      FixedChar = True
      Size = 5
    end
    object cdsTipoContratoNOME: TStringField
      DisplayWidth = 55
      FieldName = 'NOME'
      Visible = False
      Size = 60
    end
    object cdsTipoContratoIDTIPOCONTRIMOB: TFloatField
      FieldName = 'IDTIPOCONTRIMOB'
      Visible = False
    end
  end
  object dsTipoContrato: TwwDataSource
    DataSet = cdsTipoContrato
    Left = 560
    Top = 363
  end
  object sqlContratoXDesc: TCMSqlParams
    SQL.Strings = (
      'SELECT X.IDCONTRATOXDESC,'
      '       X.CODALTERADOR,'
      '       X.IDCONTRATOIMOVEL,'
      '       X.MOECODIGO,'
      '       X.VLRDESCONTO,'
      '       X.PERDESCONTO,'
      '       X.DATAINICIO,'
      '       X.DATAFIM,'
      '       X.OBSERVACAO,'
      '       M.MOESIGLA,'
      '       T.DESCRICAO'
      'FROM   CONTRATOXDESC X,'
      '       MOEDA M,'
      '       TIPOALTERADOR T'
      'WHERE  X.MOECODIGO    = M.MOECODIGO (+)'
      '  AND  X.CODALTERADOR = T.CODALTERADOR'
      'ORDER BY X.DATAINICIO, T.DESCRICAO')
    Left = 696
    Top = 116
  end
  object cmspHISTPAGENCIMOV: TCMSqlParams
    SQL.Strings = (
      'SELECT IM.IMONOME AS DSC_MESTRE,'
      '       I.IMOCODIGO,'
      '       I.IMONOME,'
      '       HPEI.ANO, '
      '       EIV.DESCENCARGO,'
      '       SPAM.DESCSITUACAO,'
      '       HPEI.IDENCARGO,'
      '       HPEI.IDSITUACAO,'
      '       CI.CIMDTINI,'
      '       CI.CIMDTFIM,'
      '       HPEI.IDIMOVEL'
      '  FROM CONTRATOXIMOVEL CI'
      ' INNER JOIN HISTPAGENCIMOV HPEI'
      '    ON (HPEI.IDIMOVEL = CI.IDIMOVEL)'
      ' INNER JOIN ENCARGOIMOV EIV'
      '    ON (EIV.IDENCARGO = HPEI.IDENCARGO)'
      ' INNER JOIN SITPAGENCIMOV SPAM  '
      '    ON (SPAM.IDSITUACAO = HPEI.IDSITUACAO)'
      ' INNER JOIN IMOVEL I'
      '    ON (I.IDIMOVEL = HPEI.IDIMOVEL)'
      ' INNER JOIN IMOVEL IM'
      '    ON (IM.IDIMOVEL = I.IDIMOVELMESTRE)'
      ' WHERE CI.IDCONTRATOIMOVEL = 0'
      ''
      ' ')
    Left = 10
    Top = 366
  end
  object cdsHISTPAGENCIMOV: TCMClientDataSet
    Aggregates = <>
    Params = <>
    BeforeInsert = cdsHISTPAGENCIMOVBeforeInsert
    Left = 490
    Top = 199
    object cdsHISTPAGENCIMOVDSC_MESTRE: TStringField
      FieldName = 'DSC_MESTRE'
      ProviderFlags = []
      Size = 100
    end
    object cdsHISTPAGENCIMOVIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsHISTPAGENCIMOVIMONOME: TStringField
      FieldName = 'IMONOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsHISTPAGENCIMOVANO: TFloatField
      FieldName = 'ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsHISTPAGENCIMOVDESCENCARGO: TStringField
      FieldName = 'DESCENCARGO'
      ProviderFlags = []
      Size = 30
    end
    object cdsHISTPAGENCIMOVDESCSITUACAO: TStringField
      FieldName = 'DESCSITUACAO'
      ProviderFlags = []
      Size = 30
    end
    object cdsHISTPAGENCIMOVIDENCARGO: TFloatField
      FieldName = 'IDENCARGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsHISTPAGENCIMOVIDSITUACAO: TFloatField
      FieldName = 'IDSITUACAO'
    end
    object cdsHISTPAGENCIMOVCIMDTINI: TDateTimeField
      FieldName = 'CIMDTINI'
    end
    object cdsHISTPAGENCIMOVCIMDTFIM: TDateTimeField
      FieldName = 'CIMDTFIM'
    end
    object cdsHISTPAGENCIMOVIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
  end
  object dsHISTPAGENCIMOV: TwwDataSource
    AutoEdit = False
    DataSet = cdsHISTPAGENCIMOV
    Left = 120
    Top = 385
  end
  object cdsENCARGOIMOV: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 351
    Top = 219
    object cdsENCARGOIMOVDESCENCARGO: TStringField
      DisplayLabel = 'Encargos'
      DisplayWidth = 30
      FieldName = 'DESCENCARGO'
      Size = 30
    end
    object cdsENCARGOIMOVIDENCARGO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDENCARGO'
      Visible = False
    end
  end
  object cdsSITPAGENCIMOV: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 75
    Top = 387
    object cdsSITPAGENCIMOVDESCSITUACAO: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 30
      FieldName = 'DESCSITUACAO'
      Size = 30
    end
    object cdsSITPAGENCIMOVIDSITUACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITUACAO'
      Visible = False
    end
  end
  object sqlENCARGOIMOV: TCMSqlParams
    SQL.Strings = (
      'SELECT EI.IDENCARGO,'
      '       EI.DESCENCARGO '
      '  FROM ENCARGOIMOV EI')
    Left = 111
    Top = 375
  end
  object sqlSITPAGENCIMOV: TCMSqlParams
    SQL.Strings = (
      'SELECT SPI.IDSITUACAO,'
      '       SPI.DESCSITUACAO '
      '  FROM SITPAGENCIMOV SPI')
    Left = 403
    Top = 219
  end
  object cdsHISTPAGENCIMOV_Validacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 470
    Top = 371
  end
  object dsHISTPAGENCIMOV_Validacao: TwwDataSource
    AutoEdit = False
    DataSet = cdsHISTPAGENCIMOV_Validacao
    Left = 64
    Top = 401
  end
  object msImovelTributo: TMontaSelect
    Template.IdConsulta = 101
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'DECODE(I.FLGATIVO, '#39'1'#39', '#39'Ativo'#39', '#39'Inativo'#39')'
      'I.IMOCODIGO'
      'T.CODTIPIMOVEL'
      'M.MRCNOME'
      'I.IMONOMEENDERECO'
      'I.IMOLOGRADOURO'
      'I.IMOBAIRRO'
      'C.NOME'
      'C.UF'
      'DECODE(I.FLGSTATUSOCUPACAO,'#39'O'#39','#39'OCUPADO'#39','#39'DESOCUPADO'#39')')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Nome do Imóvel'
      'Status'
      'Código'
      'Tipo do Imóvel'
      'Marca / Franquia'
      'Nome Endereço'
      'Logradouro'
      'Bairro'
      'Cidade'
      'UF'
      'Ocupação')
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
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL IM'
      'MARCAS M'
      'TIPOIMOVEL T'
      'CIDADES C'
      'CONTRATOXIMOVEL CI')
    CamposChave.Strings = (
      'IM.IDIMOVEL'
      'I.IDIMOVEL'
      'IM.IMONOME'
      'I.IMONOME'
      'I.CODTIPIMOVEL'
      'I.IDCARTEIRAINVEST'
      'T.DESCTIPOIMOVEL'
      'I.IMOCODIGO'
      'I.IMOAREA'
      'I.FLGTIPOIMOVEL'
      'I.CODSUBCONTA'
      'I.FLGSTATUS')
    Filtro.Strings = (
      'I.IDMARCA = M.IDMARCA (+)'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'I.CODTIPIMOVEL = T.CODTIPIMOVEL(+)'
      'I.IDCIDADES = C.IDCIDADES(+)'
      'I.FLGTIPOIMOVEL IN (0,1)'
      'CI.IDIMOVEL = I.IDIMOVEL')
    Mascaras.Strings = (
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
    Larguras.Strings = (
      '30'
      '30'
      '7'
      '16'
      '6'
      '20'
      '20'
      '30'
      '15'
      '50'
      '3'
      '16')
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
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = True
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
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
      '')
    Left = 320
    Top = 40
  end
  object dsParcelasConfissao: TDataSource
    DataSet = qryParcelasConfissao
    Left = 293
    Top = 386
  end
  object dsConfissaoDivida: TDataSource
    DataSet = cdsConfissaoDivida
    Left = 397
    Top = 370
  end
  object cdsConfissaoDivida: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 405
    Top = 327
    object cdsConfissaoDividaDATACONFISSAO: TDateTimeField
      FieldName = 'DATACONFISSAO'
    end
    object cdsConfissaoDividaIDCONFISSAODIVIDA: TFloatField
      FieldName = 'IDCONFISSAODIVIDA'
    end
    object cdsConfissaoDividaIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object cdsConfissaoDividaMESCONFISSAO: TFloatField
      FieldName = 'MESCONFISSAO'
    end
    object cdsConfissaoDividaANOCONFISSAO: TFloatField
      FieldName = 'ANOCONFISSAO'
    end
    object cdsConfissaoDividaCONDRESULTANTES: TFloatField
      FieldName = 'CONDRESULTANTES'
    end
    object cdsConfissaoDividaVLRSALDO: TFloatField
      FieldName = 'VLRSALDO'
      DisplayFormat = '#,##0.00'
    end
    object cdsConfissaoDividaIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object cdsConfissaoDividaPLNCODIGO_OPER: TFloatField
      FieldName = 'PLNCODIGO_OPER'
    end
  end
  object qryAlterador: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NVL(( SELECT  SUM(VALOR) AS ALT '
      'FROM LANCTODOCUM L                      '
      
        'WHERE  OPERACAO = 4 AND PLNCODIGO > 0 AND L.DEBCRE = '#39'D'#39' AND cod' +
        'documento = :pcoddocumento'
      'GROUP BY CODDOCUMENTO),0)'
      '-'
      'NVL((SELECT  SUM(VALOR) AS ALT '
      'FROM LANCTODOCUM L                      '
      
        'WHERE  OPERACAO = 4 AND PLNCODIGO > 0 AND L.DEBCRE = '#39'C'#39' AND cod' +
        'documento = :pcoddocumento'
      '),0) TOTAL'
      'FROM DUAL')
    Left = 365
    Top = 268
    ParamData = <
      item
        DataType = ftString
        Name = 'pcoddocumento'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pcoddocumento'
        ParamType = ptUnknown
      end>
    object qryAlteradorTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object updParcelasConfissao: TUpdateSQL
    ModifySQL.Strings = (
      '')
    InsertSQL.Strings = (
      'insert into PLANOPATROXIMOVEL'
      '  (VALOR)'
      'values'
      '  (:VALOR)')
    DeleteSQL.Strings = (
      'delete from PLANOPATROXIMOVEL'
      'where'
      '  PATRO = :OLD_PATRO')
    Left = 288
    Top = 336
  end
  object qryParcelasConfissao: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryParcelasConfissaoCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '            DD.CODDOCUMENTO, DD.DATAVENCIMENTO , APROP.VALOR,'
      '            NVL(JUROS.JUR,0) AS JUR , NVL(MULTA.MUL,0) AS MUL ,'
      '            NVL(CORRECAO.COR,0)AS COR,'
      
        '           (TO_NUMBER(DD.TOT_RECEBER) - TO_NUMBER(DD.RECEBIDO)) ' +
        'AS SALDO,'
      
        '            DD.TOT_RECEBER , DD.RECEBIDO,   NVL(ALTERADOR.ALT,0)' +
        ' AS ALT,'
      '            CD.IDCONFISSAODIVIDA'
      '         FROM CONTRATOIMOVEL C ,CONFISSAOXDOCUMENTO CD ,'
      '         (SELECT CODDOCUMENTO, SUM(VALOR) AS  VALOR'
      '          FROM LANCTODOCUM'
      '          WHERE  OPERACAO = 2'
      '          GROUP BY CODDOCUMENTO) APROP,'
      '         (SELECT CODDOCUMENTO, SUM(VALOR) AS COR'
      '          FROM LANCTODOCUM , TIPOIMOVEL T'
      '          WHERE  CODALTERADOR = T.CODALTCORRMON'
      '          GROUP BY CODDOCUMENTO) CORRECAO,'
      '         (SELECT CODDOCUMENTO, SUM(VALOR) AS MUL'
      '          FROM LANCTODOCUM , TIPOIMOVEL T'
      '          WHERE  CODALTERADOR = T.CODALTMULTA'
      '          GROUP BY CODDOCUMENTO) MULTA,'
      '         (SELECT CODDOCUMENTO, SUM(VALOR) AS JUR'
      '          FROM LANCTODOCUM , TIPOIMOVEL T'
      '          WHERE  CODALTERADOR = T.CODALTJUROS'
      '          GROUP BY CODDOCUMENTO) JUROS,'
      '         (SELECT CODDOCUMENTO, SUM(VALOR) AS ALT'
      '          FROM LANCTODOCUM'
      '          WHERE  OPERACAO = 4 AND PLNCODIGO > 0'
      '          GROUP BY CODDOCUMENTO'
      '          ) ALTERADOR,'
      '         (SELECT                                 '
      '               LI.CODDOCUMENTO,      LI.IDCONTRATOIMOVEL, '
      '               LI.DATAVENCIMENTO,    LI.DATALIMITE,'
      '               LI.CODTIPIMOVEL,      LI.IDTIPOCUSTORECIMO , '
      '               SUM(                                         '
      
        '                   DECODE(RTRIM(LD.OPERACAO),  '#39'1'#39', DECODE(D.REC' +
        'PAG, '#39'R'#39',DECODE(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB' +
        ' * (-1)), 0), 0) + '
      
        '                   DECODE(RTRIM(LD.OPERACAO),  '#39'2'#39', DECODE(D.REC' +
        'PAG, '#39'R'#39',DECODE(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB' +
        ' * (-1)), 0), 0) +'
      
        '                   DECODE(RTRIM(LD.OPERACAO),  '#39'3'#39', DECODE(D.REC' +
        'PAG, '#39'R'#39',DECODE(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB' +
        ' * (-1)), 0), 0) + '
      
        '                   DECODE(RTRIM(LD.OPERACAO),  '#39'4'#39', DECODE(D.REC' +
        'PAG, '#39'R'#39',DECODE(LD.DEBCRE, '#39'D'#39', LD.VALOR * LI.VLRLANCRECEB / TRD' +
        '.VALOR, LD.VALOR * (-1) '
      '          * LI.VLRLANCRECEB / TRD.VALOR), 0), 0)           '
      '               ) AS TOT_RECEBER,'
      '               NVL(SUM(                                    '
      
        '                 DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG' +
        ', '#39'R'#39', LD.VALOR, 0), 0)  '
      
        '         * LI.VLRLANCRECEB / TRD.VALOR                          ' +
        '                             '
      '                 ),0) AS RECEBIDO'
      
        '             FROM DOCUMENTO D, LANCTODOCUM LD, LANCAMENTOSIMOVEL' +
        ' LI, TIPOIMOVEL T,CONTRATOIMOVEL C,'
      
        '                  (SELECT CODDOCUMENTO, DECODE(VALOR, 0, 1, VALO' +
        'R) AS VALOR  '
      
        '                     FROM LANCTODOCUM                           ' +
        '             '
      '                    WHERE RTRIM(OPERACAO) = '#39'1'#39' OR'
      
        '                          RTRIM(OPERACAO) = '#39'2'#39' OR              ' +
        '           '
      
        '                          RTRIM(OPERACAO) = '#39'3'#39') TRD            ' +
        '           '
      
        '            WHERE                                               ' +
        '             '
      '                  ( D.RECPAG = '#39'R'#39')'
      
        '              AND ( C.FLGTIPOCONTRATO IN ('#39'L'#39','#39'D'#39') OR LI.IDCONTR' +
        'ATOIMOVEL IS NULL ) '
      
        '              AND ( LD.ESTORNO IS NULL )                        ' +
        '                        '
      
        '              AND ( LI.FLGESTORNADO IS NULL )                   ' +
        '                        '
      '              AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )'
      
        '              AND ( D.CODDOCUMENTO  = LD.CODDOCUMENTO )         ' +
        '                        '
      
        '              AND ( D.CODDOCUMENTO  = TRD.CODDOCUMENTO )        ' +
        '                        '
      
        '              AND ( LI.CODTIPIMOVEL = T.CODTIPIMOVEL )          ' +
        '                        '
      
        '              AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) ' +
        ')'
      
        '         GROUP BY  LI.CODDOCUMENTO,  LI.IDCONTRATOIMOVEL,LI.DATA' +
        'VENCIMENTO,             '
      
        '               LI.DATALIMITE, LI.CODTIPIMOVEL,  LI.IDTIPOCUSTORE' +
        'CIMO                    '
      
        '               ) DD                                             ' +
        '                        '
      '         WHERE  ( C.IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL)'
      
        '            AND ( C.IDCONTRATOIMOVEL(+)  = DD.IDCONTRATOIMOVEL )' +
        '                        '
      
        '            AND DD.CODDOCUMENTO = CORRECAO.CODDOCUMENTO(+)      ' +
        '                        '
      
        '            AND DD.CODDOCUMENTO =  MULTA.CODDOCUMENTO(+)        ' +
        '                        '
      '            AND DD.CODDOCUMENTO = JUROS.CODDOCUMENTO(+)'
      
        '            AND DD.CODDOCUMENTO = APROP.CODDOCUMENTO(+)         ' +
        '                        '
      
        '            AND DD.CODDOCUMENTO = ALTERADOR.CODDOCUMENTO(+)     ' +
        '                        '
      
        '            AND DD.CODDOCUMENTO = CD.CODDOCUMENTO               ' +
        '                        '
      '            AND CD.TIPO = 1'
      '            AND CD.IDCONFISSAODIVIDA = :PIDCONFISSAODIVIDA'
      
        '         GROUP BY DD.CODDOCUMENTO, CORRECAO.COR, MULTA.MUL ,JURO' +
        'S.JUR ,APROP.VALOR,     '
      
        '            DD.TOT_RECEBER,   DD.RECEBIDO ,   DD.DATAVENCIMENTO ' +
        ',                       '
      '            ALTERADOR.ALT,CD.IDCONFISSAODIVIDA'
      '                                                              '
      
        '        UNION                                                   ' +
        '                        '
      
        '         SELECT   LI.NODOCUMENTO AS CODDOCUMENTO, LI.DATAVENCIME' +
        'NTO , SUM(LI.VLRLANCRECEB) AS VALOR,'
      
        '         NVL(LI.VLRJUROS,0) AS JUR ,  NVL(LI.VLRMULTA,0) AS MUL ' +
        ', (0) AS COR, SUM(LI.VLRLANCRECEB)  AS SALDO,'
      
        '         SUM(LI.VLRLANCRECEB) AS TOT_RECEBER , (0) AS SALDO ,   ' +
        '(0) AS ALT, CD.IDCONFISSAODIVIDA '
      
        '         FROM LANCAMENTOSIMOVEL LI , CONTRATOIMOVEL C ,CONFISSAO' +
        'XDOCUMENTO CD '
      '         WHERE     LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL '
      '         AND  LI.NODOCUMENTO = CD.CODDOCUMENTO'
      '         AND  LI.CODDOCUMENTO IS NULL  '
      '         AND  CD.TIPO = 1 '
      '         AND  CD.IDCONFISSAODIVIDA = :PIDCONFISSAODIVIDA'
      
        '         GROUP BY LI.NODOCUMENTO  ,LI.DATAVENCIMENTO,LI.VLRJUROS' +
        ',LI.VLRMULTA,CD.IDCONFISSAODIVIDA'
      '         ORDER BY DATAVENCIMENTO'
      ' ')
    UpdateObject = updParcelasConfissao
    ValidateWithMask = True
    Left = 290
    Top = 283
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDCONFISSAODIVIDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDCONFISSAODIVIDA'
        ParamType = ptUnknown
      end>
    object qryParcelasConfissaoCODDOCUMENTO: TFloatField
      DisplayLabel = 'Documento'
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
    end
    object qryParcelasConfissaoDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 18
      FieldName = 'DATAVENCIMENTO'
    end
    object qryParcelasConfissaoVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
    object qryParcelasConfissaoAlterador: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Alterador'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object qryParcelasConfissaoJUR: TFloatField
      DisplayLabel = 'Juros'
      DisplayWidth = 10
      FieldName = 'JUR'
      DisplayFormat = '#,##0.00'
    end
    object qryParcelasConfissaoMUL: TFloatField
      DisplayLabel = 'Multa'
      DisplayWidth = 10
      FieldName = 'MUL'
      DisplayFormat = '#,##0.00'
    end
    object qryParcelasConfissaoCOR: TFloatField
      DisplayLabel = 'Correção'
      DisplayWidth = 10
      FieldName = 'COR'
      DisplayFormat = '#,##0.00'
    end
    object qryParcelasConfissaoSALDO: TFloatField
      DisplayLabel = 'Valor Devido'
      DisplayWidth = 10
      FieldName = 'SALDO'
      DisplayFormat = '#,##0.00'
    end
    object qryParcelasConfissaoRECEBIDO: TFloatField
      DisplayLabel = 'Baixado'
      DisplayWidth = 10
      FieldName = 'RECEBIDO'
      DisplayFormat = '#,##0.00'
    end
    object qryParcelasConfissaoTOT_RECEBER: TFloatField
      DisplayLabel = 'Valor Devido'
      DisplayWidth = 10
      FieldName = 'TOT_RECEBER'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryParcelasConfissaoALT: TFloatField
      DisplayWidth = 10
      FieldName = 'ALT'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryParcelasConfissaoIDCONFISSAODIVIDA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONFISSAODIVIDA'
      Visible = False
    end
  end
  object qryVerificaContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CXI.IDCONTRATOIMOVEL, I.IDIMOVEL, I.IMOCODIGO, I.IMONOME,' +
        ' CI.CONNUMERO, CXI.CIMDTINI, CXI.CIMDTFIM'
      '  FROM IMOVEL I,'
      '       CONTRATOIMOVEL CI,'
      '       CONTRATOXIMOVEL CXI'
      ''
      ' WHERE I.IDIMOVEL = CXI.IDIMOVEL'
      '   AND CXI.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL'
      '   AND I.IDIMOVEL = :IDIMOVEL'
      '   AND CXI.IDCONTRATOIMOVEL <> :IDCONTRATOIMOVEL'
      '   AND CI.FLGSTATUS = '#39'V'#39'  '
      '   '
      
        '   AND ( (:CIMDTINICIO <= CXI.CIMDTINI  AND :CIMDTFIM >= CXI.CIM' +
        'DTFIM )  or'
      
        '         (:CIMDTINICIO >= CXI.CIMDTINI  AND :CIMDTFIM <= CXI.CIM' +
        'DTFIM )  or'
      
        '         (:CIMDTINICIO between CXI.CIMDTINI  AND CXI.CIMDTFIM) o' +
        'r'
      '         (:CIMDTFIM between CXI.CIMDTINI  AND CXI.CIMDTFIM) '
      '       )'
      'AND TO_DATE( :CIMDTFIM) >= TO_DATE(SYSDATE,'#39'DD/MM/YY'#39')'
      '')
    ValidateWithMask = True
    Left = 633
    Top = 425
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CIMDTINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CIMDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CIMDTINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CIMDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CIMDTINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CIMDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CIMDTFIM'
        ParamType = ptUnknown
      end>
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 201
    Top = 371
  end
end
