inherited FrmCadDepJudicial: TFrmCadDepJudicial
  Left = 405
  Top = 3
  HelpContext = 180030
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Ação Judicial de Imposto de Renda'
  ClientHeight = 693
  ClientWidth = 793
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 137
    Width = 793
    Height = 517
    inherited pnlMestre: TPanel
      Width = 791
      Height = 295
      object pnlRestoMestre: TPanel
        Left = 0
        Top = 75
        Width = 791
        Height = 220
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 2
        object Panel5: TPanel
          Left = 1
          Top = 87
          Width = 789
          Height = 74
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object gbInfVara: TGroupBox
            Left = 0
            Top = 0
            Width = 336
            Height = 74
            Align = alLeft
            TabOrder = 0
            object lbCodVara: TLabel
              Left = 8
              Top = 7
              Width = 57
              Height = 13
              Caption = 'Cód. Vara'
            end
            object lbNomeVara: TLabel
              Left = 80
              Top = 7
              Width = 81
              Height = 13
              Caption = 'Nome da Vara'
            end
            object edCodVara: TEdit
              Left = 6
              Top = 20
              Width = 67
              Height = 21
              MaxLength = 2
              TabOrder = 0
            end
            object edNomeVara: TEdit
              Left = 77
              Top = 20
              Width = 250
              Height = 21
              TabOrder = 1
            end
          end
          object gbInfSecao: TGroupBox
            Left = 336
            Top = 0
            Width = 404
            Height = 74
            Align = alLeft
            TabOrder = 1
            object lbCodSecao: TLabel
              Left = 7
              Top = 7
              Width = 67
              Height = 13
              Caption = 'Cód. Seção'
            end
            object lbUfSecao: TLabel
              Left = 81
              Top = 7
              Width = 57
              Height = 13
              Caption = 'UF Seção'
            end
            object lbNomeSecao: TLabel
              Left = 147
              Top = 7
              Width = 91
              Height = 13
              Caption = 'Nome da Seção'
            end
            object Label4: TLabel
              Left = 37
              Top = 48
              Width = 40
              Height = 13
              Caption = 'Cidade'
            end
            object edCodSecao: TEdit
              Left = 6
              Top = 20
              Width = 67
              Height = 21
              MaxLength = 2
              TabOrder = 0
            end
            object edNomeSecao: TEdit
              Left = 146
              Top = 20
              Width = 250
              Height = 21
              TabOrder = 2
            end
            object cmbUF: TDBLookupComboBox
              Left = 81
              Top = 20
              Width = 61
              Height = 21
              DataField = 'UFSECAO'
              DataSource = dsMestre
              KeyField = 'CODESTADO'
              ListField = 'CODESTADO'
              ListSource = dsEstado
              TabOrder = 1
              OnExit = cmbUFExit
            end
            object cmbCidade: TDBLookupComboBox
              Left = 81
              Top = 45
              Width = 316
              Height = 21
              DataField = 'IDCIDADES'
              DataSource = dsMestre
              KeyField = 'IDCIDADES'
              ListField = 'NOME'
              ListSource = DsCidade
              TabOrder = 3
              OnExit = cmbUFExit
            end
          end
        end
        object Panel1: TPanel
          Left = 1
          Top = 1
          Width = 789
          Height = 86
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Panel4: TPanel
            Left = 232
            Top = 0
            Width = 530
            Height = 86
            BevelOuter = bvNone
            TabOrder = 1
            object gbxbanco: TGroupBox
              Left = 113
              Top = 0
              Width = 395
              Height = 86
              Caption = 'Informações Bancárias'
              TabOrder = 1
              object lbBanco: TLabel
                Left = 5
                Top = 12
                Width = 37
                Height = 13
                Caption = 'Banco'
              end
              object lbAgencia: TLabel
                Left = 201
                Top = 10
                Width = 47
                Height = 13
                Caption = 'Agência'
              end
              object lbConta: TLabel
                Left = 5
                Top = 46
                Width = 86
                Height = 13
                Caption = 'Conta Corrente'
              end
              object lbOperacao: TLabel
                Left = 202
                Top = 46
                Width = 56
                Height = 13
                Caption = 'Operação'
              end
              object dblkBanco: TwwDBLookupCombo
                Left = 5
                Top = 24
                Width = 190
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'Banco'#9'F')
                LookupTable = qryBanco
                LookupField = 'IDPESSOA'
                TabOrder = 0
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = dblkBancoCloseUp
                OnExit = dblkBancoExit
              end
              object dblkAgencia: TwwDBLookupCombo
                Left = 200
                Top = 24
                Width = 190
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'Agência'#9'F')
                LookupTable = qryAgencia
                LookupField = 'IDPESSOA'
                TabOrder = 1
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = dblkAgenciaCloseUp
                OnExit = dblkAgenciaExit
              end
              object dblkConta: TwwDBLookupCombo
                Left = 5
                Top = 58
                Width = 190
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'CONTACORRENTE'#9'15'#9'Conta Corrente'#9'F')
                LookupTable = qryConta
                LookupField = 'IDCBANCARIA'
                TabOrder = 2
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = False
              end
              object cmbOperacao: TComboBox
                Left = 200
                Top = 59
                Width = 190
                Height = 21
                ItemHeight = 13
                TabOrder = 3
                Items.Strings = (
                  '001 - Conta Corrente'
                  '002 - Conta Corrente Pessoa Física'
                  '003 - Conta Corrente Pessoa Jurídica'
                  '004 - Depósito Judicial'
                  '013 - Conta de Poupança'
                  '022 - Conta Caderneta Pessoa Jurídica'
                  '635 - Dépósito Judicial IR')
              end
            end
            object gbDatas: TGroupBox
              Left = 1
              Top = 0
              Width = 111
              Height = 86
              TabOrder = 0
              object lbDataInicio: TLabel
                Left = 8
                Top = 7
                Width = 65
                Height = 13
                Caption = 'Data Início'
              end
              object lbDataFim: TLabel
                Left = 8
                Top = 43
                Width = 59
                Height = 13
                Caption = 'Data Final'
              end
              object dbdtInicio: TCMDateTimePicker
                Left = 8
                Top = 20
                Width = 96
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAINICIO'
                DataSource = dsMestre
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
              object DBedtDataFinal: TCMDateTimePicker
                Left = 8
                Top = 56
                Width = 96
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAFINAL'
                DataSource = dsMestre
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
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 233
            Height = 86
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 232
              Height = 39
              BevelOuter = bvNone
              TabOrder = 0
              object gbNumProc: TGroupBox
                Left = 0
                Top = 0
                Width = 132
                Height = 39
                Align = alLeft
                Caption = 'Nº do Processo'
                TabOrder = 0
                object edNumProc: TEdit
                  Left = 6
                  Top = 13
                  Width = 118
                  Height = 21
                  MaxLength = 30
                  TabOrder = 0
                end
              end
              object gbxPercentual: TGroupBox
                Left = 132
                Top = 0
                Width = 98
                Height = 39
                Align = alLeft
                Caption = 'Percentual'
                TabOrder = 1
                object Label3: TLabel
                  Left = 81
                  Top = 18
                  Width = 10
                  Height = 13
                  Caption = '%'
                end
                object edtPercAcao: TRealEdit
                  Left = 8
                  Top = 14
                  Width = 71
                  Height = 20
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 0
                  WordWrap = False
                  OnExit = edtPercAcaoExit
                  IntDigits = 10
                  DecDigits = 6
                  NumberFormat = fNumber
                  Signal = False
                end
              end
            end
            object gbStatus: TGroupBox
              Left = 1
              Top = 41
              Width = 229
              Height = 45
              Caption = 'Status da Ação'
              TabOrder = 1
              object cboStatusAcao: TComboBox
                Left = 7
                Top = 16
                Width = 215
                Height = 21
                ItemHeight = 13
                TabOrder = 0
                Items.Strings = (
                  'Ação Judicial em Antecipação de Tutela (Em Liminar)'
                  'Ação Judicial Decisão Definitiva a favor do Contribuinte (Ganha)'
                  'Ação Judicial Julgada Perdida')
              end
            end
          end
        end
        object pnlDARF: TPanel
          Left = 1
          Top = 161
          Width = 789
          Height = 58
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object GroupBox1: TGroupBox
            Left = 1
            Top = 1
            Width = 336
            Height = 47
            Caption = 'Código IRRF - Receita p/ DARF'
            TabOrder = 0
            object dblkDARF: TwwDBLookupCombo
              Left = 7
              Top = 18
              Width = 314
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Código DARF'#9'F')
              LookupTable = qryIRRFDARF
              LookupField = 'CODNATUREZA'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnChange = dblkDARFChange
              OnCloseUp = dblkDARFCloseUp
              OnExit = dblkDARFExit
            end
          end
        end
      end
      object pnlInfPessoa: TPanel
        Left = 0
        Top = 0
        Width = 791
        Height = 43
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvNone
        TabOrder = 0
        object lbNome: TLabel
          Left = 8
          Top = 4
          Width = 33
          Height = 13
          Caption = 'Nome'
        end
        object lbMatricula: TLabel
          Left = 350
          Top = 4
          Width = 55
          Height = 13
          Caption = 'Matrícula'
        end
        object lbCpf: TLabel
          Left = 478
          Top = 4
          Width = 24
          Height = 13
          Caption = 'CPF'
        end
        object lbSitNaFund: TLabel
          Left = 605
          Top = 4
          Width = 129
          Height = 13
          Caption = 'Situação na Fundação'
        end
        object dbedNome: TDBEdit
          Left = 8
          Top = 17
          Width = 334
          Height = 21
          Color = clGray
          DataField = 'NOME'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object dbedMatricula: TDBEdit
          Left = 350
          Top = 17
          Width = 121
          Height = 21
          Color = clGray
          DataField = 'MATRICULA'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbedCPF: TDBEdit
          Left = 478
          Top = 17
          Width = 121
          Height = 21
          Color = clGray
          DataField = 'NUMDOCUMENTO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object edSitNaFund: TEdit
          Left = 605
          Top = 17
          Width = 135
          Height = 21
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
      end
      object PnlAcaoJudicial: TPanel
        Left = 0
        Top = 43
        Width = 791
        Height = 32
        Align = alTop
        TabOrder = 1
        object lblAutorAcao: TLabel
          Left = 385
          Top = 9
          Width = 47
          Height = 13
          Caption = 'Autor:   '
        end
        object Label2: TLabel
          Left = 228
          Top = 8
          Width = 42
          Height = 13
          Caption = 'Classe:'
        end
        object Panel7: TPanel
          Left = 1
          Top = 1
          Width = 208
          Height = 30
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 6
            Top = 8
            Width = 63
            Height = 13
            Caption = 'Tipo Ação:'
          end
          object cmbTipoOAcao: TComboBox
            Left = 73
            Top = 4
            Width = 136
            Height = 21
            Color = clWhite
            ItemHeight = 13
            TabOrder = 0
            OnChange = cmbTipoOAcaoChange
            Items.Strings = (
              'Correção de Tabela de IRRF'
              'Bitributação'
              'Equacionamento')
          end
        end
        object edAutorAcao: TEdit
          Left = 424
          Top = 5
          Width = 233
          Height = 21
          Enabled = False
          TabOrder = 2
        end
        object cbxFazdeposito: TCheckBox
          Left = 664
          Top = 8
          Width = 112
          Height = 17
          Caption = 'Efetua depósito'
          TabOrder = 3
          OnClick = cbxFazdepositoClick
        end
        object edtClasse: TEdit
          Left = 272
          Top = 5
          Width = 97
          Height = 21
          TabOrder = 1
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 296
      Width = 791
      Height = 220
      inherited pgctrlDetalhe: TPageControl
        Width = 693
        Height = 161
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 685
            Height = 133
            Selected.Strings = (
              'FLGATIVA'#9'10'#9'Regra Ativa'
              'NOMEREGRA'#9'60'#9'Regra'
              'DESCRICAO'#9'60'#9'Rubrica Normal'
              'DESCRICAO_1'#9'60'#9'Rubrica de Abono')
          end
          inherited pnlControlesDet: TPanel
            Width = 685
            Height = 133
            object lbRegra: TLabel
              Left = 1
              Top = 2
              Width = 89
              Height = 13
              Caption = 'Nome da Regra'
            end
            object lbRubricas: TLabel
              Left = 332
              Top = 2
              Width = 88
              Height = 13
              Caption = 'Rubrica Normal'
            end
            object lblRubAbono: TLabel
              Left = 332
              Top = 39
              Width = 103
              Height = 13
              Caption = 'Rubrica de Abono'
            end
            object lblOrdem: TLabel
              Left = 8
              Top = 79
              Width = 83
              Height = 13
              Caption = 'Ordem Cálculo'
            end
            object dblkRegra: TwwDBLookupCombo
              Left = 1
              Top = 15
              Width = 323
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'30'#9'Nome da Regra'#9'F')
              DataField = 'IDREGRA'
              DataSource = dsDet
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = dblkRegraCloseUp
            end
            object dblkRubricas: TwwDBLookupCombo
              Left = 330
              Top = 15
              Width = 310
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'60'#9'Rubrica Normal'#9'F')
              DataField = 'IDRUBRICA'
              DataSource = dsDet
              LookupTable = qryRubricas
              LookupField = 'IDPROVENTO'
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object DBCheckBox1: TDBCheckBox
              Left = 10
              Top = 53
              Width = 97
              Height = 17
              Caption = 'Regra  Ativa'
              DataField = 'FLGATIVA'
              DataSource = dsDet
              TabOrder = 2
              ValueChecked = '0'
              ValueUnchecked = '1'
            end
            object dblkRubAbono: TwwDBLookupCombo
              Left = 330
              Top = 52
              Width = 310
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'60'#9'Rubrica de Abono'#9'F')
              DataField = 'IDRUBRICAABONO'
              DataSource = dsDet
              LookupTable = qryRubricaAbono
              LookupField = 'IDPROVENTO'
              TabOrder = 3
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object dbedtOrdem: TDBEdit
              Left = 8
              Top = 95
              Width = 121
              Height = 21
              DataField = 'ORDEMCALCULO'
              DataSource = dsDet
              TabOrder = 4
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 783
      end
      inherited Dock974: TDock97
        Left = 697
        Height = 161
        inherited tb97Detalhe: TToolbar97
          inherited bbtnOkDet: TBitBtn
            Height = 24
            Margin = 6
          end
          inherited bbtnCancelarDet: TBitBtn
            Top = 24
            Height = 24
            Margin = 6
            Spacing = 4
          end
          inherited bbtnVoltarDet: TBitBtn
            Top = 48
            Height = 24
            Margin = 6
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 793
  end
  inherited Dock971: TDock97
    Top = 654
    Width = 793
  end
  object gbxAcaoLote: TGroupBox [3]
    Left = 0
    Top = 47
    Width = 793
    Height = 90
    Align = alTop
    TabOrder = 3
    object pnlProcessoLote: TPanel
      Left = 4
      Top = 25
      Width = 769
      Height = 61
      BevelOuter = bvNone
      TabOrder = 0
      object lblAcaoLote: TLabel
        Left = 7
        Top = -2
        Width = 709
        Height = 13
        Caption = 
          'Para Operações em Lote, informar o Nº do Processo, selecionar o ' +
          'arquivo (quando necessário) e depois acionar a operação.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object gbxNumProc: TGroupBox
        Left = 5
        Top = 17
        Width = 196
        Height = 39
        Caption = 'Nº do Processo'
        TabOrder = 0
        object edtNumProc: TEdit
          Left = 6
          Top = 13
          Width = 183
          Height = 21
          TabOrder = 0
        end
      end
      object gbxArquivo: TGroupBox
        Left = 206
        Top = 17
        Width = 429
        Height = 39
        Caption = 'Selecione o Arquivo'
        TabOrder = 1
        object edtArquivo: TEdit
          Left = 6
          Top = 13
          Width = 387
          Height = 21
          TabOrder = 0
        end
        object bbtnBuscaArquivo: TBitBtn
          Left = 396
          Top = 11
          Width = 25
          Height = 23
          TabOrder = 1
          OnClick = bbtnBuscaArquivoClick
          Glyph.Data = {
            4E010000424D4E01000000000000760000002800000012000000120000000100
            040000000000D800000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
            FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
            0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
            870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
            FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
            0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
            DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
        end
      end
    end
    object chkProcessoLote: TCheckBox
      Left = 16
      Top = 0
      Width = 193
      Height = 17
      Caption = 'Processar Operações em Lote'
      TabOrder = 1
      OnClick = chkProcessoLoteClick
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 992
    Top = 0
    TargetsData = (
      1
      4
      (
        'TRealEdit'
        'Text'
        0)
      (
        ''
        'Filter'
        0)
      (
        ''
        'Title'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 560
    Top = 288
  end
  inherited ds: TwwDataSource
    Left = 312
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update DEPENTIT'
      'set'
      '  IDTITULAR = :IDTITULAR,'
      '  IDPESSOA = :IDPESSOA,'
      '  MATRICULA = :MATRICULA'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into DEPENTIT'
      '  (IDTITULAR, IDPESSOA, MATRICULA)'
      'values'
      '  (:IDTITULAR, :IDPESSOA, :MATRICULA)')
    DeleteSQL.Strings = (
      'delete from DEPENTIT'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 280
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'V.MATRICULA'
      'V.MATRICULADEP'
      'V.NUMDOCUMENTO'
      'V.NOME'
      'R.NOMEREGRA'
      'P.NUMEROPROCESSO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Mat. do Titular'
      'Mat. do Dependente'
      'CPF'
      'Nome'
      'Regra'
      'Número do Processo')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'S'
      'S'
      'N')
    Tabelas.Strings = (
      'VWPARTICIPDEPEN V'
      'PROCJUD P'
      'DETPROCJUD D'
      'REGRA R')
    CamposChave.Strings = (
      'P.IDPESSOA'
      'P.IDPROCJUD')
    Filtro.Strings = (
      '  (P.IDPROCJUD = D.IDPROCJUD(+))'
      '  (V.IDPESSOA = P.IDPESSOA)'
      '  (D.IDREGRA = R.IDREGRA(+))')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '15'
      '18'
      '60'
      '30'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
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
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 360
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 952
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 416
    Top = 28
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  P.IDPESSOA,'
      '  DT.IDTITULAR,'
      '  P.NUMDOCUMENTO,'
      '  P.NOME,'
      '  DT.MATRICULA'
      ''
      'FROM'
      '  PESSOA P,'
      '  DEPENTIT DT'
      ''
      'WHERE'
      '  DT.IDPESSOA = :IDPESSOA  AND'
      '  DT.IDPESSOA = P.IDPESSOA'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 248
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 480
    Top = 16
  end
  object qryEstado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODESTADO, IDESTADO'
      ''
      'FROM'
      '  ESTADO'
      ''
      'ORDER BY'
      '  CODESTADO ASC'
      ' ')
    ValidateWithMask = True
    Left = 488
    Top = 280
    object qryEstadoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Origin = 'BASEDADOS.ESTADO.CODESTADO'
      FixedChar = True
      Size = 3
    end
    object fltfldEstadoIDESTADO: TFloatField
      FieldName = 'IDESTADO'
    end
  end
  object dsEstado: TwwDataSource
    AutoEdit = False
    DataSet = qryEstado
    Left = 488
    Top = 264
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 160
    Top = 288
  end
  object qryMestre: TwwQuery
    CachedUpdates = True
    AfterOpen = qryMestreAfterOpen
    BeforePost = qryMestreBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  *'
      ''
      'FROM'
      '  PROCJUD'
      ''
      'WHERE'
      '  IDPROCJUD = :IDPROCJUD '
      ''
      ' '
      ' ')
    UpdateObject = updMestre
    ValidateWithMask = True
    Left = 576
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPROCJUD'
        ParamType = ptUnknown
      end>
    object qryMestreIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'CBS.PROCJUD.IDPESSOA'
    end
    object qryMestreIDPROCJUD: TFloatField
      FieldName = 'IDPROCJUD'
      Origin = 'CBS.PROCJUD.IDPROCJUD'
    end
    object qryMestreIDBANCO: TFloatField
      FieldName = 'IDBANCO'
      Origin = 'CBS.PROCJUD.IDBANCO'
    end
    object qryMestreIDAGENCIABANCARIA: TFloatField
      FieldName = 'IDAGENCIABANCARIA'
      Origin = 'CBS.PROCJUD.IDAGENCIABANCARIA'
    end
    object qryMestreIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
      Origin = 'CBS.PROCJUD.IDCBANCARIA'
    end
    object qryMestreCODOPERACAO: TStringField
      FieldName = 'CODOPERACAO'
      Origin = 'CBS.PROCJUD.CODOPERACAO'
      Size = 3
    end
    object qryMestreCODVARA: TStringField
      FieldName = 'CODVARA'
      Origin = 'CBS.PROCJUD.CODVARA'
      Size = 2
    end
    object qryMestreNOMEVARA: TStringField
      FieldName = 'NOMEVARA'
      Origin = 'CBS.PROCJUD.NOMEVARA'
      Size = 25
    end
    object qryMestreCODSECAO: TStringField
      FieldName = 'CODSECAO'
      Origin = 'CBS.PROCJUD.CODSECAO'
      Size = 2
    end
    object qryMestreUFSECAO: TStringField
      FieldName = 'UFSECAO'
      Origin = 'CBS.PROCJUD.UFSECAO'
      Size = 2
    end
    object qryMestreAUTORACAO: TStringField
      FieldName = 'AUTORACAO'
      Origin = 'CBS.PROCJUD.AUTORACAO'
      Size = 50
    end
    object qryMestreDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'CBS.PROCJUD.DATAINICIO'
    end
    object qryMestreDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
      Origin = 'CBS.PROCJUD.DATAFINAL'
    end
    object qryMestreSITPROCESSO: TFloatField
      FieldName = 'SITPROCESSO'
      Origin = 'CBS.PROCJUD.SITPROCESSO'
    end
    object qryMestreNUMEROPROCESSO: TStringField
      FieldName = 'NUMEROPROCESSO'
      Origin = 'BASEDADOS.PROCJUD.NUMEROPROCESSO'
      Size = 30
    end
    object qryMestreTIPOACAO: TFloatField
      FieldName = 'TIPOACAO'
      Origin = 'BASEDADOS.PROCJUD.TIPOACAO'
    end
    object qryMestrePERCACAO: TFloatField
      FieldName = 'PERCACAO'
      Origin = 'BASEDADOS.PROCJUD.IDPROCJUD'
    end
    object qryMestreFLGFAZDEPOSITO: TFloatField
      FieldName = 'FLGFAZDEPOSITO'
      Origin = 'BASEDADOS.PROCJUD.FLGFAZDEPOSITO'
    end
    object qryMestreNOMESECAO: TStringField
      FieldName = 'NOMESECAO'
      Origin = 'BASEDADOS.PROCJUD.NOMESECAO'
      Size = 25
    end
    object qryMestreCLASSEACAO: TStringField
      FieldName = 'CLASSEACAO'
      Origin = 'BASEDADOS.PROCJUD.CLASSEACAO'
    end
    object qryMestreCODIRRFDARF: TStringField
      FieldName = 'CODIRRFDARF'
      Origin = 'BASEDADOS.PROCJUD.CODIRRFDARF'
    end
    object qryMestreIIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
      Origin = 'CBS.PROCJUD.IDCIDADES'
    end
  end
  object dsMestre: TwwDataSource
    DataSet = qryMestre
    Left = 528
    Top = 1
  end
  object updMestre: TUpdateSQL
    ModifySQL.Strings = (
      'update PROCJUD'
      'set'
      '  IDAGENCIABANCARIA = :IDAGENCIABANCARIA,'
      '  NUMEROPROCESSO = :NUMEROPROCESSO,'
      '  IDCBANCARIA = :IDCBANCARIA,'
      '  CODSECAO = :CODSECAO,'
      '  UFSECAO = :UFSECAO,'
      '  AUTORACAO = :AUTORACAO,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAFINAL = :DATAFINAL,'
      '  SITPROCESSO = :SITPROCESSO,'
      '  IDBANCO = :IDBANCO,'
      '  CODOPERACAO = :CODOPERACAO,'
      '  CODVARA = :CODVARA,'
      '  NOMEVARA = :NOMEVARA,'
      '  TIPOACAO = :TIPOACAO,'
      '  PERCACAO = :PERCACAO,'
      '  FLGFAZDEPOSITO = :FLGFAZDEPOSITO,'
      '  NOMESECAO = :NOMESECAO,'
      '  CLASSEACAO = :CLASSEACAO,'
      '  CODIRRFDARF = :CODIRRFDARF,'
      '  IDCIDADES = :IDCIDADES'
      'where'
      '  IDPROCJUD = :OLD_IDPROCJUD and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PROCJUD'
      '  (IDPROCJUD, IDPESSOA, IDAGENCIABANCARIA, NUMEROPROCESSO, '
      'IDCBANCARIA, '
      '   CODSECAO, UFSECAO, AUTORACAO, DATAINICIO, DATAFINAL, '
      'SITPROCESSO, IDBANCO, '
      '   CODOPERACAO, CODVARA, NOMEVARA, TIPOACAO, PERCACAO, '
      'FLGFAZDEPOSITO, '
      '   NOMESECAO, CLASSEACAO, CODIRRFDARF, IDCIDADES)'
      'values'
      '  (:IDPROCJUD, :IDPESSOA, :IDAGENCIABANCARIA, :NUMEROPROCESSO, '
      ':IDCBANCARIA, '
      '   :CODSECAO, :UFSECAO, :AUTORACAO, :DATAINICIO, :DATAFINAL, '
      ':SITPROCESSO, '
      '   :IDBANCO, :CODOPERACAO, :CODVARA, :NOMEVARA, :TIPOACAO, '
      ':PERCACAO, :FLGFAZDEPOSITO, '
      '   :NOMESECAO, :CLASSEACAO, :CODIRRFDARF, :IDCIDADES)')
    DeleteSQL.Strings = (
      'delete from PROCJUD'
      'where'
      '  IDPROCJUD = :OLD_IDPROCJUD and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 632
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  D.IDPESSOA,'
      '  D.IDPROCJUD,'
      '  D.IDREGRA,'
      '  R.NOMEREGRA,'
      '  D.IDRUBRICA,'
      '  P.DESCRICAO,'
      '  P2.DESCRICAO,'
      '  D.FLGATIVA,'
      '  D.IDRUBRICAABONO,'
      '  D.ORDEMCALCULO'
      'FROM'
      '  REGRA R,'
      '  DETPROCJUD D,'
      '  PROVDESC P,'
      '  PROVDESC P2'
      ''
      'WHERE'
      '  D.IDPROCJUD = :IDPROCJUD   AND'
      '  D.IDPESSOA  = :IDPESSOA    AND'
      '  R.IDREGRA   = D.IDREGRA    AND'
      '  D.IDRUBRICA = P.IDPROVENTO AND'
      '  D.IDRUBRICAABONO = P2.IDPROVENTO'
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
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGATIVA;CheckBox;0;1')
    ValidateWithMask = True
    Left = 560
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPROCJUD'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryBanco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  B.IDPESSOA,'
      '  B.NUMBANCO||'#39#39' - '#39#39'||P.NOME AS NOME'
      ''
      'FROM'
      '  PESSOA P,'
      '  BANCO B'
      ''
      'WHERE '
      '  P.IDPESSOA = B.IDPESSOA'
      ''
      'ORDER BY'
      '  NOME'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 400
    Top = 288
  end
  object qryAgencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  A.IDPESSOA,'
      '  A.IDBANCO,'
      '  A.NUMAGENCIA||'#39' - '#39'||P.NOME AS NOME'
      ''
      'FROM'
      '  AGENCIABANCARIA A,'
      '  PESSOA P'
      ''
      'WHERE'
      '  A.IDBANCO  = :IDBANCO AND'
      '  A.IDPESSOA = P.IDPESSOA'
      ''
      'ORDER BY'
      '  A.NUMAGENCIA'
      ' ')
    ValidateWithMask = True
    Left = 400
    Top = 276
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDBANCO'
        ParamType = ptUnknown
      end>
  end
  object qryConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDCBANCARIA,'
      '  CONTACORRENTE'
      ''
      'FROM'
      '  CONTABANCARIA'
      ''
      'WHERE'
      '  IDAGENCIA = :IDAGENCIA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 400
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDAGENCIA'
        ParamType = ptUnknown
      end>
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  R.IDREGRA,'
      '  R.NOMEREGRA,'
      '  R.IDTIPOREGRA'
      'FROM'
      '  REGRA R,'
      '  TIPOACAOXREGRA T'
      ''
      'WHERE'
      '  R.IDREGRA  = T.IDREGRA AND'
      '  T.TIPOACAO = :PTIPOACAO'
      ''
      'ORDER BY'
      '  UPPER(NOMEREGRA)'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 320
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PTIPOACAO'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update DETPROCJUD'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPROCJUD = :IDPROCJUD,'
      '  IDREGRA = :IDREGRA,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  FLGATIVA = :FLGATIVA,'
      '  IDRUBRICAABONO = :IDRUBRICAABONO,'
      '  ORDEMCALCULO = :ORDEMCALCULO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPROCJUD = :OLD_IDPROCJUD and'
      '  IDREGRA = :OLD_IDREGRA')
    InsertSQL.Strings = (
      'insert into DETPROCJUD'
      '  (IDPESSOA, IDPROCJUD, IDREGRA, IDRUBRICA, FLGATIVA, '
      'IDRUBRICAABONO, ORDEMCALCULO)'
      'values'
      '  (:IDPESSOA, :IDPROCJUD, :IDREGRA, :IDRUBRICA, :FLGATIVA, '
      ':IDRUBRICAABONO, :ORDEMCALCULO)')
    DeleteSQL.Strings = (
      'delete from DETPROCJUD'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPROCJUD = :OLD_IDPROCJUD and'
      '  IDREGRA = :OLD_IDREGRA')
    Left = 560
    Top = 264
  end
  object qryAuxDet: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 160
    Top = 276
  end
  object qryRubricas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPROVENTO,'
      '  IDPROVENTO||'#39' - '#39'||DESCRICAO AS DESCRICAO'
      ''
      'FROM'
      '  PROVDESC'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 240
    Top = 276
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      #9'COUNT(*) AS QTDREGRA'
      'FROM '
      #9'REGRA R'
      'where'
      #9'IDTIPOREGRA = :TIPO'
      ' ')
    ValidateWithMask = True
    Left = 160
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptUnknown
      end>
  end
  object MS1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'VW.MATRICULA'
      'VW.MATRICULADEP'
      'VW.NUMDOCUMENTO'
      'VW.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Mat. do Titular'
      'Mat. do Dependente'
      'CPF'
      'Nome')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'S')
    Tabelas.Strings = (
      'VWPARTICIPDEPEN VW')
    CamposChave.Strings = (
      'VW.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '15'
      '18'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 408
  end
  object qryRubricaAbono: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 240
    Top = 264
  end
  object dialog: TOpenDialog
    Title = 'Arquivo de Entrada'
    Left = 748
    Top = 144
  end
  object qryClone: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 758
    Top = 275
  end
  object qryAuxConta: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 196
    Top = 332
  end
  object qryIRRFDARF: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT NULL AS CODNATUREZA, '#39#39' AS DESCRICAO, '#39#39' AS NOME FROM DUA' +
        'L UNION ALL'
      
        'SELECT CODNATUREZA, DESCRICAO, CODNATUREZA ||'#39' - '#39'|| DESCRICAO A' +
        'S NOME'
      'FROM NATURENDIMENTO'
      'WHERE CODNATUREZA = '#39'7431'#39' ')
    ValidateWithMask = True
    Left = 272
    Top = 363
  end
  object DsCidade: TwwDataSource
    AutoEdit = False
    DataSet = QryCidade
    Left = 568
    Top = 340
  end
  object QryCidade: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT'#9'C.IDCIDADES,'
      '        C.NOME,      '
      '        C.UF,'
      '        C.CODESTADO,'
      '        C.CODMUNICIPIO,'
      '        C.CODMUNICIPIOIBGE'
      '        '
      '   FROM CIDADES C'
      '        '
      'WHERE C.CODESTADO = :CODESTADO'
      '    '
      '  ORDER BY C.NOME')
    ValidateWithMask = True
    Left = 584
    Top = 356
    ParamData = <
      item
        DataType = ftString
        Name = 'CODESTADO'
        ParamType = ptUnknown
      end>
    object fltfldQryCidadeIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
    end
    object QryCidadeNOME: TStringField
      FieldName = 'NOME'
    end
    object QryCidadeCODESTADO: TStringField
      FieldName = 'CODESTADO'
    end
    object QryCidadeCODMUNICIPIO: TStringField
      FieldName = 'CODMUNICIPIO'
    end
    object QryCidadeCODMUNICIPIOIBGE: TStringField
      FieldName = 'CODMUNICIPIOIBGE'
    end
  end
end
