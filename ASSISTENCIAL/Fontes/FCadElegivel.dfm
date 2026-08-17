inherited frmCadElegivel: TfrmCadElegivel
  Left = 32
  Top = 52
  BorderIcons = [biMinimize, biMaximize, biHelp]
  Caption = 'Elegivel'
  ClientHeight = 493
  ClientWidth = 737
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 737
    Height = 407
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 58
      Width = 727
      Height = 344
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Dados Funcionais'
        'Planos Previdenciários'
        'Dados Pessoais'
        'Contas Bancárias'
        'Fundações')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        'dbgrdElegivel'
        'dbgrdPlanosPrev'
        ''
        'dbgrdContaBancaria'
        'dbgrdFundacoes')
      inherited pgctrlDetalhe: TPageControl
        Width = 629
        Height = 285
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 621
            Height = 257
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 621
            Height = 257
            inherited pnlItemsDoc: TPanel
              Height = 255
            end
            inherited pnlFoto: TPanel
              Width = 131
              Height = 255
              inherited Bevel1: TBevel
                Height = 224
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 224
                Width = 136
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 134
                Height = 224
              end
            end
            inherited lstDocumentos: TListView
              Height = 255
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 621
            Height = 257
            inherited grpTipoEnd: TGroupBox
              Left = 424
              Height = 257
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 621
            Height = 257
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited dbgTelefone: TwwDBGrid
            Width = 621
            Height = 257
          end
          inherited Panel1: TPanel
            Width = 621
            Height = 257
          end
        end
        inherited tbsContato: TTabSheet
          inherited Panel2: TPanel
            Width = 621
            Height = 257
          end
          inherited dbgContato: TwwDBGrid
            Width = 621
            Height = 257
          end
        end
        object tbsElegivel: TTabSheet
          Caption = 'Dados Funcionais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          object dbgrdElegivel: TwwDBGrid
            Left = 0
            Top = 0
            Width = 621
            Height = 257
            Selected.Strings = (
              'PATROCINADORA'#9'25'#9'Patrocinadora'
              'FILIAL'#9'25'#9'Filial'
              'CODCENTROCUSTO'#9'13'#9'Centro de Custo'
              'MATRICULA'#9'11'#9'Matrícula'
              'DATAADMISSAO'#9'8'#9'Data de ~Admissão'
              'SITFUNC'#9'11'#9'Situação na Patrocinadora'
              'PARTICIPPREVID'#9'12'#9'Participante ~Previdenciário ?'
              'PARTICIPASSIST'#9'10'#9'Participante ~Assistencial ?'
              'SALTOTAL'#9'10'#9'Salário'
              'NIVEL'#9'5'#9'Nível')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsElegPatro
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object pnlControlesElegivel: TPanel
            Left = 0
            Top = 0
            Width = 621
            Height = 257
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object GroupBox8: TGroupBox
              Left = 6
              Top = 1
              Width = 253
              Height = 120
              TabOrder = 0
              object lblPatro: TLabel
                Left = 6
                Top = 10
                Width = 80
                Height = 13
                Caption = 'Patrocinadora'
              end
              object lblSitFunc: TLabel
                Left = 6
                Top = 80
                Width = 152
                Height = 13
                Caption = 'Situação na Patrocinadora'
              end
              object Labelfilial: TLabel
                Left = 6
                Top = 44
                Width = 27
                Height = 13
                Caption = 'Filial'
              end
              object dblkpcmbPatro: TwwDBLookupCombo
                Left = 5
                Top = 22
                Width = 238
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'Patrocinadora')
                DataField = 'IDPESSJUR'
                DataSource = dsElegPatro
                LookupTable = qryPatro
                LookupField = 'IDPESSOA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = dblkpcmbPatroCloseUp
              end
              object dblkpcmbSitPatro: TwwDBLookupCombo
                Left = 6
                Top = 92
                Width = 238
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'30'#9'Situação do Funcionário')
                DataField = 'IDSITFUNC'
                DataSource = dsElegPatro
                LookupTable = qrySitFunc
                LookupField = 'IDSITFUNC'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = dblkpcmbSitPatroCloseUp
              end
              object cmbfilial: TwwDBLookupCombo
                Left = 6
                Top = 56
                Width = 238
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'NOME')
                DataField = 'IDESTAB'
                DataSource = dsElegPatro
                LookupTable = qryfilial
                LookupField = 'IDPESSOA'
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = cmbfilialCloseUp
              end
            end
            object GroupBox9: TGroupBox
              Left = 6
              Top = 121
              Width = 253
              Height = 126
              TabOrder = 1
              object lblCargo: TLabel
                Left = 9
                Top = 45
                Width = 34
                Height = 13
                Caption = 'Cargo'
              end
              object Label15: TLabel
                Left = 9
                Top = 9
                Width = 92
                Height = 13
                Caption = 'Centro de Custo'
              end
              object Label43: TLabel
                Left = 9
                Top = 84
                Width = 32
                Height = 13
                Caption = 'Nível'
              end
              object dblkpcmbCargo: TwwDBLookupCombo
                Left = 9
                Top = 58
                Width = 238
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'TITULO'#9'30'#9'Cargo')
                DataField = 'IDCARGOEXT'
                DataSource = dsElegPatro
                LookupTable = qryCargo
                LookupField = 'IDCARGOEXT'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
              object dblkpcmbCCusto: TwwDBLookupCombo
                Left = 9
                Top = 22
                Width = 238
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'Centro de Custo')
                DataField = 'CODCENTROCUSTO'
                DataSource = dsElegPatro
                LookupTable = qryCCusto
                LookupField = 'CODCENTROCUSTO'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
              object wwDBEdit6: TwwDBEdit
                Left = 9
                Top = 96
                Width = 121
                Height = 21
                DataField = 'NIVEL'
                DataSource = dsElegPatro
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
            object GroupBox10: TGroupBox
              Left = 270
              Top = 1
              Width = 328
              Height = 120
              TabOrder = 2
              object lblMatricula: TLabel
                Left = 9
                Top = 18
                Width = 55
                Height = 13
                Caption = 'Matrícula'
              end
              object Label13: TLabel
                Left = 9
                Top = 60
                Width = 103
                Height = 13
                Caption = 'Data de Admissão'
              end
              object lblDataDemissao: TLabel
                Left = 146
                Top = 60
                Width = 104
                Height = 13
                Caption = 'Data de Demissão'
              end
              object Label14: TLabel
                Left = 146
                Top = 18
                Width = 133
                Height = 13
                Caption = 'Salário de Participação'
              end
              object dbedMatricula: TDBEdit
                Left = 9
                Top = 33
                Width = 121
                Height = 21
                DataField = 'MATRICULA'
                DataSource = dsElegPatro
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object dbdtAdesao: TCMDateTimePicker
                Left = 9
                Top = 75
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAADMISSAO'
                DataSource = dsElegPatro
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
              object dbDataDemissao: TCMDateTimePicker
                Left = 146
                Top = 75
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATADEMISSAO'
                DataSource = dsElegPatro
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
                TabOrder = 3
              end
              object dbedSalario: TDBEdit
                Left = 146
                Top = 33
                Width = 112
                Height = 21
                DataField = 'SALTOTAL'
                DataSource = dsElegPatro
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
            end
            object GroupBox11: TGroupBox
              Left = 270
              Top = 121
              Width = 219
              Height = 126
              TabOrder = 3
              object Label41: TLabel
                Left = 10
                Top = 10
                Width = 152
                Height = 13
                Caption = 'Tempo de Serviço Anterior'
                WordWrap = True
              end
              object Label24: TLabel
                Left = 10
                Top = 54
                Width = 141
                Height = 28
                AutoSize = False
                Caption = 'Tempo de Contribuição Não Creditado'
                WordWrap = True
              end
              object Label37: TLabel
                Left = 138
                Top = 87
                Width = 36
                Height = 13
                Caption = 'meses'
              end
              object Label42: TLabel
                Left = 138
                Top = 32
                Width = 36
                Height = 13
                Caption = 'meses'
              end
              object dbedTempoServAnterior: TwwDBEdit
                Left = 10
                Top = 24
                Width = 121
                Height = 21
                DataField = 'TEMPOSERVANTERIOR'
                DataSource = dsElegPatro
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbedTempoNaoCreditado: TwwDBEdit
                Left = 10
                Top = 80
                Width = 121
                Height = 21
                Color = clSilver
                DataField = 'TEMPONAOCREDITADO'
                DataSource = dsElegPatro
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
            object bbtnOpcoes: TBitBtn
              Left = 504
              Top = 132
              Width = 80
              Height = 27
              Hint = 'Verificar Regra de Concessão do Benefício'
              Cancel = True
              Caption = '&Opções'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnClick = bbtnOpcoesClick
              Glyph.Data = {
                42010000424D4201000000000000760000002800000011000000110000000100
                040000000000CC00000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDD0000000DDDDDDDDDDDDDDDDD0000000D00000DDDDD00000D0000000D0FF
                F0DDDDD0FFF0D0000000D0FFF0DDDDD0FFF0D0000000D00000DD0DD00000D000
                0000DDD0DDD0F0DDD0DDD0000000DDD0DD0FFF0DD0DDD0000000DDD000FFFFF0
                00DDD0000000DDDDDD0FFF0DDDDDD0000000DDDDDDD0F0DDDDDDD0000000DDDD
                DDDD0DDDDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDD0FFF0DDDDDD000
                0000DDDDDD0FFF0DDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDDDDDDDD
                DDDDD0000000}
            end
          end
        end
        object tbsPlanosPrev: TTabSheet
          Caption = 'Planos Previdenciários'
          object dbgrdPlanosPrev: TwwDBGrid
            Left = 0
            Top = 0
            Width = 621
            Height = 257
            Selected.Strings = (
              'PLANO'#9'28'#9'Plano'#9'No'
              'SITPART'#9'16'#9'Situação na Fundação'#9'No'
              'SITPLANO'#9'13'#9'Situação no Plano'#9'No'
              'INSCRICAONUMERO'#9'8'#9'Número de ~Inscrição'#9'No'
              'INSCRICAODATA'#9'10'#9'Data de ~Inscrição'#9'No'
              'REQUERIMENTODATA'#9'10'#9'Data de ~Requerimento'#9'No'
              'INSCRICAOTIPO'#9'1'#9'Tipo de ~Inscrição'#9'No'
              'SALINSCRICAO'#9'10'#9'Salário na Inscrição'#9'No')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsPlanosPrev
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object pnlControlesPlanos: TPanel
            Left = 0
            Top = 0
            Width = 621
            Height = 257
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 1
            object grpInscricao: TGroupBox
              Left = 6
              Top = 3
              Width = 319
              Height = 184
              TabOrder = 0
              object Label17: TLabel
                Left = 9
                Top = 15
                Width = 118
                Height = 13
                Caption = 'Plano Previdenciário'
              end
              object Label23: TLabel
                Left = 9
                Top = 72
                Width = 219
                Height = 13
                Caption = 'Situação do Participante na Fundação'
              end
              object Label2: TLabel
                Left = 9
                Top = 126
                Width = 195
                Height = 13
                Caption = 'Situação do Participante no Plano'
              end
              object dblkpcmbPlano: TwwDBLookupCombo
                Left = 9
                Top = 30
                Width = 304
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'50'#9'Plano Previdenciário')
                DataField = 'IDPLANOPREV'
                DataSource = dsPlanosPrev
                LookupTable = qryPlanPrev
                LookupField = 'IDPLANOPREV'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = dblkpcmbPlanoCloseUp
              end
              object dblkpcmbSitPart: TwwDBLookupCombo
                Left = 9
                Top = 87
                Width = 304
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'50'#9'Situação do Participante na Fundação')
                DataField = 'IDSITPART'
                DataSource = dsPlanosPrev
                LookupTable = qrySitPart
                LookupField = 'IDSITPART'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = dblkpcmbSitPartCloseUp
              end
              object dblkpcmbSitPlanoPrev: TwwDBLookupCombo
                Left = 9
                Top = 141
                Width = 304
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'50'#9'Situação do Participante no Plano')
                DataField = 'IDSITPLANOPREV'
                DataSource = dsPlanosPrev
                LookupTable = qrySitPlanoPrev
                LookupField = 'IDSITPLANOPREV'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = dblkpcmbSitPlanoPrevCloseUp
              end
            end
            object dbrgrpTipoInsc: TDBRadioGroup
              Left = 332
              Top = 138
              Width = 280
              Height = 49
              Caption = 'Tipo de Inscrição'
              Columns = 2
              DataField = 'INSCRICAOTIPO'
              DataSource = dsPlanosPrev
              Items.Strings = (
                'Fundador'
                'Não Fundador'
                'Retardatário'
                'Outros')
              TabOrder = 3
              TabStop = True
              Values.Strings = (
                'F'
                'N'
                'R'
                'O')
            end
            object GroupBox1: TGroupBox
              Left = 336
              Top = 66
              Width = 280
              Height = 61
              TabOrder = 2
              object Label21: TLabel
                Left = 148
                Top = 15
                Width = 102
                Height = 13
                Caption = 'Data de Inscrição'
              end
              object Label18: TLabel
                Left = 6
                Top = 15
                Width = 132
                Height = 13
                Caption = 'Data de Requerimento '
              end
              object dbdtInscricao: TCMDateTimePicker
                Left = 148
                Top = 28
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'INSCRICAODATA'
                DataSource = dsPlanosPrev
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
                TabOrder = 1
              end
              object dbdtRequerimento: TCMDateTimePicker
                Left = 6
                Top = 28
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'REQUERIMENTODATA'
                DataSource = dsPlanosPrev
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
                TabOrder = 0
              end
            end
            object bbtnContribuicoes: TBitBtn
              Left = 486
              Top = 195
              Width = 139
              Height = 42
              Hint = 'Editar Contribuições do Participante neste Plano'
              Caption = '&Contribuições'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnClick = bbtnContribuicoesClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
                000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
                00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
                F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
                0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
                FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
                FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
                0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
                00333377737FFFFF773333303300000003333337337777777333}
              NumGlyphs = 2
            end
            object GroupBox2: TGroupBox
              Left = 338
              Top = 3
              Width = 148
              Height = 58
              TabOrder = 1
              object Label20: TLabel
                Left = 7
                Top = 12
                Width = 118
                Height = 13
                Caption = 'Número de Inscrição'
              end
              object dbedInscNumero: TwwDBEdit
                Left = 7
                Top = 27
                Width = 121
                Height = 21
                DataField = 'INSCRICAONUMERO'
                DataSource = dsPlanosPrev
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
            object gpDataCancelamento: TGroupBox
              Left = 6
              Top = 188
              Width = 157
              Height = 61
              TabOrder = 5
              object Label35: TLabel
                Left = 12
                Top = 15
                Width = 130
                Height = 13
                Caption = 'Data de Cancelamento'
              end
              object dbDataCancelamento: TCMDateTimePicker
                Left = 12
                Top = 28
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATACANCELAMENTO'
                DataSource = dsPlanosPrev
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
                TabOrder = 0
              end
            end
            object gpDataManutencao: TGroupBox
              Left = 168
              Top = 188
              Width = 157
              Height = 61
              TabOrder = 6
              object Label34: TLabel
                Left = 16
                Top = 15
                Width = 120
                Height = 13
                Caption = 'Data de Manutenção'
              end
              object dbDataInicioManut: TCMDateTimePicker
                Left = 16
                Top = 28
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAINICIOMANUT'
                DataSource = dsPlanosPrev
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
                TabOrder = 0
              end
            end
            object GroupBox7: TGroupBox
              Left = 330
              Top = 189
              Width = 148
              Height = 61
              TabOrder = 7
              object Label36: TLabel
                Left = 7
                Top = 12
                Width = 133
                Height = 13
                Caption = 'Salário de Participação'
              end
              object wwDBEdit5: TwwDBEdit
                Left = 7
                Top = 27
                Width = 121
                Height = 21
                Color = clSilver
                DataField = 'SALPARTICIPACAO'
                DataSource = dsPlanosPrev
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
          end
        end
        object tbsPessFis: TTabSheet
          Caption = 'Dados Pessoais'
          object pnlPessFis: TPanel
            Left = 0
            Top = 0
            Width = 621
            Height = 257
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object DBCheckBox1: TDBCheckBox
              Left = 6
              Top = 212
              Width = 112
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Isento de IRRF'
              DataField = 'FLGISENTOIRRF'
              DataSource = dsPessoaFisica
              TabOrder = 6
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbrgrpSexo: TDBRadioGroup
              Left = 3
              Top = 96
              Width = 121
              Height = 64
              Caption = 'Sexo'
              DataField = 'SEXO'
              DataSource = dsPessoaFisica
              Items.Strings = (
                'Masculino'
                'Feminino')
              TabOrder = 2
              TabStop = True
              Values.Strings = (
                'M'
                'F')
            end
            object dbrgrpEstCivil: TDBRadioGroup
              Left = 270
              Top = 96
              Width = 130
              Height = 130
              Caption = 'Estado Civil'
              DataField = 'ESTCIVIL'
              DataSource = dsPessoaFisica
              Items.Strings = (
                'Solteiro(a)'
                'Casado(a)'
                'Divorciado(a)'
                'Viúvo(a)'
                'Outros')
              TabOrder = 4
              TabStop = True
              Values.Strings = (
                'S'
                'C'
                'D'
                'V'
                'O')
            end
            object grpFiliacao: TGroupBox
              Left = 3
              Top = -3
              Width = 355
              Height = 97
              TabOrder = 0
              object Label25: TLabel
                Left = 6
                Top = 15
                Width = 73
                Height = 13
                Caption = 'Nome do Pai'
              end
              object Label26: TLabel
                Left = 6
                Top = 54
                Width = 79
                Height = 13
                Caption = 'Nome da Mãe'
              end
              object wwDBEdit2: TwwDBEdit
                Left = 6
                Top = 27
                Width = 340
                Height = 21
                DataField = 'NOMEPAI'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object wwDBEdit3: TwwDBEdit
                Left = 6
                Top = 66
                Width = 340
                Height = 21
                DataField = 'NOMEMAE'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
            object grpNaturalidade: TGroupBox
              Left = 360
              Top = -3
              Width = 208
              Height = 97
              TabOrder = 1
              object Label27: TLabel
                Left = 12
                Top = 15
                Width = 73
                Height = 13
                Caption = 'Naturalidade'
              end
              object Label28: TLabel
                Left = 12
                Top = 54
                Width = 82
                Height = 13
                Caption = 'Nacionalidade'
              end
              object dblkpcmbNaturalidade: TwwDBLookupCombo
                Left = 12
                Top = 27
                Width = 184
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOMEESTADO'#9'30'#9'Natural de')
                DataField = 'CODESTADO'
                DataSource = frmPessoa.dsPessoaFisica
                LookupTable = qryNaturalidade
                LookupField = 'CODESTADO'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = dblkpcmbNaturalidadeCloseUp
              end
              object dbedNacionalidade: TwwDBEdit
                Left = 12
                Top = 66
                Width = 181
                Height = 21
                Color = clSilver
                DataField = 'NOMENACIONALIDADE'
                DataSource = dsNaturalidade
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
            object grpDataNasc: TGroupBox
              Left = 126
              Top = 96
              Width = 139
              Height = 130
              TabOrder = 3
              object Label29: TLabel
                Left = 12
                Top = 12
                Width = 116
                Height = 13
                Caption = 'Data de Nascimento'
              end
              object Label30: TLabel
                Left = 12
                Top = 54
                Width = 92
                Height = 13
                Caption = 'Tipo Sanguíneo'
              end
              object wwDBEdit4: TwwDBEdit
                Left = 12
                Top = 69
                Width = 88
                Height = 21
                DataField = 'TIPOSANG'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbdtNasc: TCMDateTimePicker
                Left = 12
                Top = 27
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATANASC'
                DataSource = dsPessoaFisica
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
                TabOrder = 0
              end
            end
            object grpDependentes: TGroupBox
              Left = 405
              Top = 96
              Width = 163
              Height = 130
              TabOrder = 5
              object Label31: TLabel
                Left = 9
                Top = 12
                Width = 108
                Height = 13
                Caption = 'Nº Dep. para IRRF'
              end
              object Label32: TLabel
                Left = 9
                Top = 48
                Width = 146
                Height = 13
                Caption = 'Nº Dep. para Sal. Família'
              end
              object Label33: TLabel
                Left = 9
                Top = 87
                Width = 145
                Height = 13
                Caption = 'Nº Total de Dependentes'
              end
              object wwDBSpinEdit1: TwwDBSpinEdit
                Left = 9
                Top = 27
                Width = 121
                Height = 21
                Increment = 1
                MaxValue = 100
                DataField = 'NUMDEPIRRF'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                UnboundDataType = wwDefault
              end
              object wwDBSpinEdit2: TwwDBSpinEdit
                Left = 9
                Top = 63
                Width = 121
                Height = 21
                Increment = 1
                MaxValue = 100
                DataField = 'NUMDEPSALF'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                UnboundDataType = wwDefault
              end
              object wwDBSpinEdit3: TwwDBSpinEdit
                Left = 9
                Top = 102
                Width = 121
                Height = 21
                Increment = 1
                MaxValue = 100
                DataField = 'NUMDEPTOT'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                UnboundDataType = wwDefault
              end
            end
          end
        end
        object tbsContaBancaria: TTabSheet
          Caption = 'Contas Bancárias'
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 621
            Height = 257
            Align = alClient
            TabOrder = 1
            object GroupBoxBanco: TGroupBox
              Left = 18
              Top = 10
              Width = 351
              Height = 117
              TabOrder = 0
              object Label38: TLabel
                Left = 15
                Top = 65
                Width = 47
                Height = 13
                Caption = 'Agência'
              end
              object Label39: TLabel
                Left = 15
                Top = 19
                Width = 37
                Height = 13
                Caption = 'Banco'
              end
              object dblkpcmbAgencia: TwwDBLookupCombo
                Left = 15
                Top = 78
                Width = 300
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'AGENCIA'#9'60'#9'Agência')
                DataField = 'IDAGENCIA'
                DataSource = dsContaBancaria
                LookupTable = qryAgencia
                LookupField = 'IDPESSOA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = dblkpcmbAgenciaCloseUp
                OnEnter = dblkpcmbAgenciaEnter
              end
              object dblkpcmbBanco: TwwDBLookupCombo
                Left = 15
                Top = 32
                Width = 300
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'BANCO'#9'60'#9'Banco')
                LookupTable = qryBanco
                LookupField = 'BANCO'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = dblkpcmbBancoCloseUp
              end
            end
            object GroupBoxConta: TGroupBox
              Left = 18
              Top = 137
              Width = 349
              Height = 96
              TabOrder = 1
              object Label40: TLabel
                Left = 15
                Top = 16
                Width = 86
                Height = 13
                Caption = 'Conta Corrente'
              end
              object dbedContaCorrente: TwwDBEdit
                Left = 15
                Top = 29
                Width = 300
                Height = 21
                DataField = 'CONTACORRENTE'
                DataSource = dsContaBancaria
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbcbFlgContaPref: TDBCheckBox
                Left = 15
                Top = 66
                Width = 184
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Conta Preferencial'
                DataField = 'FLGCONTAPREF'
                DataSource = dsContaBancaria
                TabOrder = 1
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
            end
          end
          object dbgrdContaBancaria: TwwDBGrid
            Left = 0
            Top = 0
            Width = 621
            Height = 257
            Selected.Strings = (
              'BANCO'#9'23'#9'Banco'
              'AGENCIA'#9'29'#9'Agência'
              'CONTACORRENTE'#9'17'#9'Conta Corrente'
              'FLGCONTAPREF'#9'13'#9'Conta Preferencial')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsContaBancaria
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object tbshtFundacao: TTabSheet
          Caption = 'Fundações'
          object dbgrdFundacoes: TwwDBGrid
            Left = 0
            Top = 0
            Width = 621
            Height = 257
            Selected.Strings = (
              'NOME'#9'60'#9'Fundação'
              'NUMINSC'#9'15'#9'Número de Inscrição')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsfundacoes
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 621
            Height = 257
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblfund: TLabel
              Left = 40
              Top = 40
              Width = 57
              Height = 13
              Caption = 'Fundação'
            end
            object lblinsc: TLabel
              Left = 40
              Top = 104
              Width = 118
              Height = 13
              Caption = 'Número de Inscrição'
            end
            object dblkpcmbFundacao: TwwDBLookupCombo
              Left = 40
              Top = 56
              Width = 265
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME')
              DataField = 'IDFUNDACAO'
              DataSource = dsfundacoes
              LookupTable = qryfundacao
              LookupField = 'IDPESSOA'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = dblkpcmbFundacaoCloseUp
            end
            object dbedinsc: TDBEdit
              Left = 40
              Top = 120
              Width = 121
              Height = 21
              DataField = 'NUMINSC'
              DataSource = dsfundacoes
              TabOrder = 1
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 719
      end
      inherited Dock974: TDock97
        Left = 633
        Height = 285
      end
    end
    inherited pnlMestre: TPanel
      Width = 727
      Height = 53
      inherited lblNome: TLabel
        Width = 33
        Caption = 'Nome'
      end
      inherited lblDocumento: TLabel
        Width = 24
        Caption = 'CPF'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 737
  end
  inherited Dock971: TDock97
    Top = 454
    Width = 737
    inherited tb97Fundo: TToolbar97
      Left = 567
      DockPos = 567
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 399
      DockPos = 399
      inherited bbtnCancelar: TBitBtn
        Caption = 'Cancel'
      end
    end
  end
  inherited qry: TwwQuery
    Left = 532
    Top = 13
    Data = {
      56657220322E302C514245202D20496E74656772612056697375616C20446174
      6162617365204275696C6465722C302C2031302C20313630302C20313136342C
      2C2C2C2C0D0A202C202C202D2044697374696E637420262051756F74652C2C2C
      2C2C0D0A20202020312C202D204E756D626572206F66205461626C65732C2D31
      2C202D312C203830382C203630302C203830302C203236382C2C2C2C0D0A5045
      53534F412C504553534F412C32302C2031302C203430342C203235352C2C2C2C
      2C0D0A20202032312C202D204E756D626572206F6620436F6C756D6E732C2C2C
      2C2C2C0D0A4E4F4D452C504553534F412C202020202020202020202020202020
      20202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D6265
      72206F662043726974657269612C2C2C2C2C2C0D0A5449504F2C504553534F41
      2C20202020202020202020202020202020202020312C20202020202C202C2C2C
      0D0A20202020202C202D204E756D626572206F662043726974657269612C2C2C
      2C2C2C0D0A4944504553534F412C504553534F412C2020202020202020202020
      2020202020202020312C20202020202C202C2C2C0D0A20202020312C202D204E
      756D626572206F662043726974657269612C2C2C2C2C2C0D0A3D3A4964506573
      736F612C20202020362C2C2C2C2C2C0D0A52415A414F534F4349414C2C504553
      534F412C20202020202020202020202020202020202020312C20202020202C20
      2C2C2C0D0A20202020202C202D204E756D626572206F66204372697465726961
      2C2C2C2C2C2C0D0A4E554D444F43554D454E544F2C504553534F412C20202020
      202020202020202020202020202020312C20202020202C202C2C2C0D0A202020
      20202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A
      4944444F43554D454E544F2C504553534F412C20202020202020202020202020
      202020202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D
      626572206F662043726974657269612C2C2C2C2C2C0D0A454D41494C2C504553
      534F412C20202020202020202020202020202020202020312C20202020202C20
      2C2C2C0D0A20202020202C202D204E756D626572206F66204372697465726961
      2C2C2C2C2C2C0D0A4944475255504F2C504553534F412C202020202020202020
      20202020202020202020312C20202020202C202C2C2C0D0A20202020202C202D
      204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A464C47434C
      49454E54452C504553534F412C20202020202020202020202020202020202020
      312C20202020202C202C2C2C0D0A20202020202C202D204E756D626572206F66
      2043726974657269612C2C2C2C2C2C0D0A464C47504154524F43494E41444F52
      412C504553534F412C20202020202020202020202020202020202020312C2020
      2020202C202C2C2C0D0A20202020202C202D204E756D626572206F6620437269
      74657269612C2C2C2C2C2C0D0A464C4742414E434F2C504553534F412C202020
      20202020202020202020202020202020312C20202020202C202C2C2C0D0A2020
      2020202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D
      0A464C4753494E44494341544F2C504553534F412C2020202020202020202020
      2020202020202020312C20202020202C202C2C2C0D0A20202020202C202D204E
      756D626572206F662043726974657269612C2C2C2C2C2C0D0A464C4752455350
      4F4E534156454C2C504553534F412C2020202020202020202020202020202020
      2020312C20202020202C202C2C2C0D0A20202020202C202D204E756D62657220
      6F662043726974657269612C2C2C2C2C2C0D0A464C47544552434549524F2C50
      4553534F412C20202020202020202020202020202020202020312C2020202020
      2C202C2C2C0D0A20202020202C202D204E756D626572206F6620437269746572
      69612C2C2C2C2C2C0D0A464C47464F524E534552562C504553534F412C202020
      20202020202020202020202020202020312C20202020202C202C2C2C0D0A2020
      2020202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D
      0A464C4746554E43494F4E4152494F2C504553534F412C202020202020202020
      20202020202020202020312C20202020202C202C2C2C0D0A20202020202C202D
      204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A464C474553
      5452414E474549524F2C504553534F412C202020202020202020202020202020
      20202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D6265
      72206F662043726974657269612C2C2C2C2C2C0D0A464C474147454E4349412C
      504553534F412C20202020202020202020202020202020202020312C20202020
      202C202C2C2C0D0A20202020202C202D204E756D626572206F66204372697465
      7269612C2C2C2C2C2C0D0A464C4746554E444143414F2C504553534F412C2020
      2020202020202020202020202020202020312C20202020202C202C2C2C0D0A20
      202020202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C
      0D0A464C47444550454E44454E54452C504553534F412C202020202020202020
      20202020202020202020312C20202020202C202C2C2C0D0A20202020202C202D
      204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A464C47454C
      45474956454C2C504553534F412C202020202020202020202020202020202020
      20312C20202020202C202C2C2C0D0A20202020202C202D204E756D626572206F
      662043726974657269612C2C2C2C2C2C0D0A20202020202C202D204E756D6265
      72206F66204A6F696E732C2C2C2C2C2C0D0A0D0A2253454C4543542053746174
      656D656E74220D0A2C2C2C2C2C2C2C0D0A53454C45435409504553534F412E22
      4E4F4D4522202C20504553534F412E225449504F22202C200D0A09504553534F
      412E224944504553534F4122202C200D0A09504553534F412E2252415A414F53
      4F4349414C22202C200D0A09504553534F412E224E554D444F43554D454E544F
      22202C200D0A09504553534F412E224944444F43554D454E544F22202C205045
      53534F412E22454D41494C22202C200D0A09504553534F412E22494447525550
      4F22202C20504553534F412E22464C47434C49454E544522202C200D0A095045
      53534F412E22464C47504154524F43494E41444F524122202C200D0A09504553
      534F412E22464C4742414E434F22202C200D0A09504553534F412E22464C4753
      494E44494341544F22202C200D0A09504553534F412E22464C47524553504F4E
      534156454C22202C200D0A09504553534F412E22464C47544552434549524F22
      202C200D0A09504553534F412E22464C47464F524E5345525622202C200D0A09
      504553534F412E22464C4746554E43494F4E4152494F22202C200D0A09504553
      534F412E22464C4745535452414E474549524F22202C200D0A09504553534F41
      2E22464C474147454E43494122202C200D0A09504553534F412E22464C474655
      4E444143414F22202C200D0A09504553534F412E22464C47444550454E44454E
      544522202C200D0A09504553534F412E2C2C2C2C2C2C2C0D0A22464C47454C45
      474956454C220D0A46524F4D0922504553534F412220504553534F410D0A5748
      455245092820504553534F412E224944504553534F4122203D3A496450657373
      6F6120292C2C2C2C2C2C2C0D0A}
  end
  inherited dsDet: TwwDataSource
    Left = 274
    Top = 1
  end
  inherited upd: TUpdateSQL
    InsertSQL.Strings = (
      'insert into "PESSOA"'
      
        '  (IDPESSOA,NOME, TIPO, RAZAOSOCIAL, NUMDOCUMENTO, IDDOCUMENTO, ' +
        'EMAIL, IDGRUPO, '
      
        '   FLGCLIENTE, FLGPATROCINADORA, FLGBANCO, FLGSINDICATO, FLGRESP' +
        'ONSAVEL, '
      
        '   FLGTERCEIRO, FLGFORNSERV, FLGFUNCIONARIO, FLGESTRANGEIRO, FLG' +
        'AGENCIA, '
      '   FLGFUNDACAO, FLGDEPENDENTE, FLGELEGIVEL)'
      'values'
      
        '  (:IDPESSOA,:NOME, :TIPO, :RAZAOSOCIAL, :NUMDOCUMENTO, :IDDOCUM' +
        'ENTO, :EMAIL, :IDGRUPO, '
      
        '   :FLGCLIENTE, :FLGPATROCINADORA, :FLGBANCO, :FLGSINDICATO, :FL' +
        'GRESPONSAVEL, '
      
        '   :FLGTERCEIRO, :FLGFORNSERV, :FLGFUNCIONARIO, :FLGESTRANGEIRO,' +
        ' :FLGAGENCIA, '
      '   :FLGFUNDACAO, :FLGDEPENDENTE, :FLGELEGIVEL)')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NOME'
      'ELEGPATRO.MATRICULA'
      'PESSJUR.NOME')
    Descricao.Strings = (
      'Nome do Elegível'
      'Matrícula'
      'Patrocinadora')
    Tabelas.Strings = (
      'ELEGIVEL'
      'PESSOA'
      'ELEGPATRO'
      'PESSOA PESSJUR')
    CamposChave.Strings = (
      'ELEGIVEL.IDPESSOA'
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR')
    Filtro.Strings = (
      'PESSOA.FLGELEGIVEL=1'
      'PESSOA.IDPESSOA=ELEGIVEL.IDPESSOA'
      'ELEGIVEL.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PESSJUR.IDPESSOA')
    Left = 336
    Top = 2
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 663
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 358
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object qryElegPatro: TwwQuery [12]
    CachedUpdates = True
    AfterInsert = qryElegPatroAfterInsert
    BeforePost = qryElegPatroBeforePost
    AfterPost = qryElegPatroAfterPost
    AfterScroll = qryElegPatroAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ELEGPATRO."IDPESSJUR" ,'
      ' ELEGPATRO."IDPESSOA" ,'
      ' ELEGPATRO."IDSITFUNC" ,'
      ' ELEGPATRO."CODCENTROCUSTO" ,'
      ' ELEGPATRO."IDCARGOEXT" ,'
      ' ELEGPATRO."MATRICULA" ,'
      ' ELEGPATRO."DATAADMISSAO" ,'
      ' ELEGPATRO."SALTOTAL" ,'
      ' ELEGPATRO."PARTICIPPREVID" ,'
      ' ELEGPATRO."PARTICIPASSIST" ,'
      ' ELEGPATRO."IDEMPRESAPROP" ,'
      ' ELEGPATRO."NIVEL",'
      ' ELEGPATRO."IDESTAB",'
      ' ELEGPATRO."TEMPONAOCREDITADO",'
      ' ELEGPATRO."TEMPOSERVANTERIOR",'
      ' ELEGPATRO."DATADEMISSAO",'
      ' P."NOME" AS PATROCINADORA,'
      ' SITFUNC."DESCRICAO" AS SITFUNC,'
      ' FILIAL.NOME FILIAL'
      'FROM "ELEGPATRO" ELEGPATRO, "PESSOA" P, "SITFUNC" SITFUNC,'
      'PESSOA FILIAL'
      'WHERE ELEGPATRO."IDPESSOA" = :IDPESSOA   AND'
      '      P."IDPESSOA" = ELEGPATRO."IDPESSJUR"  AND'
      '      ELEGPATRO."IDSITFUNC" = SITFUNC."IDSITFUNC"(+) AND'
      '      FILIAL.IDPESSOA(+) = ELEGPATRO.IDESTAB')
    UpdateObject = updElegPatro
    ControlType.Strings = (
      'PARTICIPPREVID;CheckBox;1;0'
      'PARTICIPASSIST;CheckBox;1;0')
    ValidateWithMask = True
    Left = 68
    Top = 91
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryElegPatroPATROCINADORA: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 25
      FieldName = 'PATROCINADORA'
      Size = 60
    end
    object qryElegPatroFILIAL: TStringField
      DisplayLabel = 'Filial'
      DisplayWidth = 25
      FieldName = 'FILIAL'
      Size = 60
    end
    object qryElegPatroCODCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 13
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryElegPatroMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 11
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryElegPatroDATAADMISSAO: TDateTimeField
      DisplayLabel = 'Data de ~Admissão'
      DisplayWidth = 8
      FieldName = 'DATAADMISSAO'
    end
    object qryElegPatroSITFUNC: TStringField
      DisplayLabel = 'Situação na Patrocinadora'
      DisplayWidth = 11
      FieldName = 'SITFUNC'
      Size = 35
    end
    object qryElegPatroPARTICIPPREVID: TFloatField
      DisplayLabel = 'Participante ~Previdenciário ?'
      DisplayWidth = 12
      FieldName = 'PARTICIPPREVID'
    end
    object qryElegPatroPARTICIPASSIST: TFloatField
      DisplayLabel = 'Participante ~Assistencial ?'
      DisplayWidth = 10
      FieldName = 'PARTICIPASSIST'
    end
    object qryElegPatroSALTOTAL: TFloatField
      DisplayLabel = 'Salário'
      DisplayWidth = 10
      FieldName = 'SALTOTAL'
    end
    object qryElegPatroNIVEL: TStringField
      DisplayLabel = 'Nível'
      DisplayWidth = 5
      FieldName = 'NIVEL'
      Size = 15
    end
    object qryElegPatroIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryElegPatroIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryElegPatroIDSITFUNC: TFloatField
      FieldName = 'IDSITFUNC'
      Visible = False
    end
    object qryElegPatroIDCARGOEXT: TFloatField
      FieldName = 'IDCARGOEXT'
      Visible = False
    end
    object qryElegPatroIDEMPRESAPROP: TFloatField
      FieldName = 'IDEMPRESAPROP'
      Visible = False
    end
    object qryElegPatroIDESTAB: TFloatField
      FieldName = 'IDESTAB'
      Visible = False
    end
    object qryElegPatroTEMPONAOCREDITADO: TFloatField
      FieldName = 'TEMPONAOCREDITADO'
      Visible = False
    end
    object qryElegPatroTEMPOSERVANTERIOR: TFloatField
      FieldName = 'TEMPOSERVANTERIOR'
      Visible = False
    end
    object qryElegPatroDATADEMISSAO: TDateTimeField
      FieldName = 'DATADEMISSAO'
      Visible = False
    end
  end
  object dsElegPatro: TwwDataSource [13]
    DataSet = qryElegPatro
    OnStateChange = dsElegPatroStateChange
    Left = 145
    Top = 180
  end
  object qryPatro: TwwQuery [14]
    AfterScroll = qryPatroAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA,P.NOME, PT.IDREGRAMATRICULA,'
      ' NUMOPCOES              ,'
      ' NOMEVALORBASE1    ,     '
      ' NOMEVALORBASE2     ,    '
      ' NOMEVALORBASE3      ,   '
      ' FLGOBRIGAOP1           ,'
      ' FLGOBRIGAOP2           ,'
      ' FLGOBRIGAOP3           ,'
      ' FLGEDITAOP1            ,'
      ' FLGEDITAOP2            ,'
      ' FLGEDITAOP3            ,'
      ' IDREGRACALCOP1     ,    '
      ' IDREGRACALCOP2      ,   '
      ' IDREGRACALCOP3       ,  '
      ' IDREGRAVALIDAOP1     ,  '
      ' IDREGRAVALIDAOP2      , '
      ' IDREGRAVALIDAOP3       '
      'FROM PESSOA P, PATRO PT'
      'WHERE P.FLGPATROCINADORA = 1 AND'
      '               P.IDPESSOA = PT.IDPESSOA')
    ValidateWithMask = True
    Left = 289
    Top = 443
  end
  object qrySitFunc: TwwQuery [15]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITFUNC,DESCRICAO'
      'FROM SITFUNC'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 447
    Top = 3
  end
  object qryCargo: TwwQuery [16]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCARGOEXT, TITULO'
      'FROM   CARGOEXT'
      'ORDER BY TITULO')
    ValidateWithMask = True
    Left = 700
    Top = 322
  end
  object qryCCusto: TwwQuery [17]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CENTCUST."IDEMPRESA" , '
      ' CENTCUST."CODCENTROCUSTO" , '
      ' CENTCUST."IDUSUARIOINCLUSAO" , '
      ' CENTCUST."NOME" , '
      ' CENTCUST."STATUSGRUPOCDC" , '
      ' CENTCUST."RESPONSAVEL" , '
      ' CENTCUST."CODREDUZIDO" , '
      ' CENTCUST."ATIVO"'
      'FROM "CENTCUST" CENTCUST'
      'WHERE CENTCUST.IDEMPRESA = :IDEMPRESA')
    ValidateWithMask = True
    Left = 668
    Top = 361
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object updElegPatro: TUpdateSQL [18]
    ModifySQL.Strings = (
      'update "CM"."ELEGPATRO"'
      'set'
      '  IDSITFUNC = :IDSITFUNC,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDCARGOEXT = :IDCARGOEXT,'
      '  MATRICULA = :MATRICULA,'
      '  DATAADMISSAO = :DATAADMISSAO,'
      '  SALTOTAL = :SALTOTAL,'
      '  PARTICIPPREVID = :PARTICIPPREVID,'
      '  PARTICIPASSIST = :PARTICIPASSIST,'
      '  IDEMPRESAPROP = :IDEMPRESAPROP,'
      '  NIVEL = :NIVEL,'
      '  IDESTAB = :IDESTAB,'
      '  TEMPONAOCREDITADO = :TEMPONAOCREDITADO,'
      '  TEMPOSERVANTERIOR = :TEMPOSERVANTERIOR'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into "CM"."ELEGPATRO"'
      '  (IDPESSJUR, IDPESSOA, IDSITFUNC, CODCENTROCUSTO, IDCARGOEXT, '
      'MATRICULA, '
      '   DATAADMISSAO, SALTOTAL, PARTICIPPREVID, PARTICIPASSIST, '
      'IDEMPRESAPROP, '
      '   NIVEL, IDESTAB, TEMPONAOCREDITADO, TEMPOSERVANTERIOR)'
      'values'
      
        '  (:IDPESSJUR, :IDPESSOA, :IDSITFUNC, :CODCENTROCUSTO, :IDCARGOE' +
        'XT, '
      ':MATRICULA, '
      '   :DATAADMISSAO, :SALTOTAL, :PARTICIPPREVID, :PARTICIPASSIST, '
      ':IDEMPRESAPROP, '
      '   :NIVEL, :IDESTAB, :TEMPONAOCREDITADO, :TEMPOSERVANTERIOR)')
    DeleteSQL.Strings = (
      'delete from "CM"."ELEGPATRO"'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 142
    Top = 98
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update "ELEGIVEL"'
      'set'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into "ELEGIVEL"'
      '  (IDPESSOA)'
      'values'
      '  (:IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from "ELEGIVEL"'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 623
    Top = 47
  end
  inherited qrySubTipo: TwwQuery
    SQL.Strings = (
      'SELECT ELEGIVEL."IDPESSOA"'
      'FROM "ELEGIVEL" ELEGIVEL'
      'WHERE ELEGIVEL."IDPESSOA" = :IDPESSOA')
    Left = 560
    Top = 56
    Data = {
      56657220322E302C514245202D20496E74656772612056697375616C20446174
      6162617365204275696C6465722C302C2031302C20313630302C20313136342C
      2C2C2C2C0D0A202C202C202D2044697374696E637420262051756F74652C2C2C
      2C2C0D0A20202020312C202D204E756D626572206F66205461626C65732C2D31
      2C202D312C203436332C203333322C203435352C203132332C2C2C2C0D0A4241
      4E434F2C42414E434F2C32302C2031302C203133302C203133352C2C2C2C2C0D
      0A20202020322C202D204E756D626572206F6620436F6C756D6E732C2C2C2C2C
      2C0D0A4944504553534F412C42414E434F2C2020202020202020202020202020
      2020202020312C20202020202C202C2C2C0D0A20202020312C202D204E756D62
      6572206F662043726974657269612C2C2C2C2C2C0D0A3D3A4964506573736F61
      2C20202020362C2C2C2C2C2C0D0A4E554D42414E434F2C42414E434F2C202020
      20202020202020202020202020202020312C20202020202C202C2C2C0D0A2020
      2020202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D
      0A20202020202C202D204E756D626572206F66204A6F696E732C2C2C2C2C2C0D
      0A0D0A2253454C4543542053746174656D656E74220D0A2C2C2C2C2C2C2C0D0A
      53454C4543540942414E434F2E224944504553534F4122202C2042414E434F2E
      224E554D42414E434F220D0A46524F4D092242414E434F222042414E434F0D0A
      574845524509282042414E434F2E224944504553534F4122203D3A4964506573
      736F6120292C2C2C2C2C2C2C0D0A}
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  inherited dsSubTipo: TwwDataSource
    Left = 679
    Top = 41
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 590
    Top = 111
  end
  inherited updPessoaFisica: TUpdateSQL
    ModifySQL.Strings = (
      'update "PESSOAFISICA"'
      'set'
      '  CODESTADO = :CODESTADO,'
      '  IDPAIS = :IDPAIS,'
      '  IDGRINSTR = :IDGRINSTR,'
      '  IDPROFISS = :IDPROFISS,'
      '  NOMEPAI = :NOMEPAI,'
      '  NOMEMAE = :NOMEMAE,'
      '  DATAMORTE = :DATAMORTE,'
      '  DATANASC = :DATANASC,'
      '  SEXO = :SEXO,'
      '  TIPOSANG = :TIPOSANG,'
      '  ESTCIVIL = :ESTCIVIL,'
      '  FLGISENTOIRRF = :FLGISENTOIRRF,'
      '  NUMDEPIRRF = :NUMDEPIRRF,'
      '  NUMDEPSALF = :NUMDEPSALF,'
      '  NUMDEPTOT = :NUMDEPTOT'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into "PESSOAFISICA"'
      
        '  (IDPESSOA, CODESTADO, IDPAIS, IDGRINSTR, IDPROFISS, NOMEPAI, N' +
        'OMEMAE, '
      
        '   DATAMORTE, DATANASC, SEXO, TIPOSANG, ESTCIVIL, FLGISENTOIRRF,' +
        ' NUMDEPIRRF, '
      '   NUMDEPSALF, NUMDEPTOT)'
      'values'
      
        '  (:IDPESSOA, :CODESTADO, :IDPAIS, :IDGRINSTR, :IDPROFISS, :NOME' +
        'PAI, :NOMEMAE, '
      
        '   :DATAMORTE, :DATANASC, :SEXO, :TIPOSANG, :ESTCIVIL, :FLGISENT' +
        'OIRRF, '
      '   :NUMDEPIRRF, :NUMDEPSALF, :NUMDEPTOT)')
    Left = 632
    Top = 104
  end
  inherited qryPessoaFisica: TwwQuery
    AfterInsert = qryPessoaFisicaAfterInsert
    SQL.Strings = (
      'SELECT PESSOAFISICA."IDPESSOA" , '
      ' PESSOAFISICA."CODESTADO" , '
      ' PESSOAFISICA."IDPAIS" , '
      ' PESSOAFISICA."IDFONTRECR" , '
      ' PESSOAFISICA."IDGRINSTR" , '
      ' PESSOAFISICA."IDPROFISS" , '
      ' PESSOAFISICA."NOMEPAI" , '
      ' PESSOAFISICA."NOMEMAE" , '
      ' PESSOAFISICA."DATAMORTE" , '
      ' PESSOAFISICA."DATANASC" , '
      ' PESSOAFISICA."SEXO" , '
      ' PESSOAFISICA."TIPOSANG" , '
      ' PESSOAFISICA."ESTCIVIL" , '
      ' PESSOAFISICA."NUMDEPIRRF",'
      ' PESSOAFISICA."NUMDEPIRRF" as NUMDEPIRRF_PADRAO,'
      ' PESSOAFISICA."NUMDEPSALF", '
      ' PESSOAFISICA."NUMDEPSALF" as NUMDEPSALF_PADRAO, '
      ' PESSOAFISICA."NUMDEPTOT", '
      ' PESSOAFISICA."NUMDEPTOT" as NUMDEPTOT_PADRAO, '
      ' PESSOAFISICA."FLGISENTOIRRF",'
      ' PESSOAFISICA."FLGISENTOIRRF" as FLGISENTOIRRF_PADRAO'
      'FROM "PESSOAFISICA" PESSOAFISICA'
      'WHERE ( PESSOAFISICA."IDPESSOA" =:IdPessoa )')
    Left = 698
    Top = 104
  end
  inherited ImageList1: TImageList
    Left = 273
    Top = 83
    Bitmap = {
      494C010103000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001001000000000000010
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
      0000000000000000000000000000000000000000104210421042104210421042
      1042104210421042104210421042104200000000104210421042104210421042
      1042104210421042104210421042104200000000186318631863186318631863
      1863186318631863186318630000000000000000000000000000000000000000
      0000000000000000000000000000000000001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000000000
      0000000000000000000000000000104200000000186300000000000000000000
      0000000000000000000018631863000000000000000000000000000000000000
      00000000000000000000000000000000000018630000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000104200000000000018630000FF7FFF7FFF7F
      FF7FFF7FFF7F0000000000001863186300000000000000000000000000000000
      00000000000000000000000000000000000018630000FF7F1000100010001000
      FF7F0000FF7F00000000FF7F00001042000018630000FF7F1000100010001000
      FF7F0000FF7F00000000FF7F0000104200000000000000000000000000000000
      000000000000FF7F0000FF7F0000186300000000000000000000000000000000
      00000000000000000000000000000000000018630000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000104200000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000FF7F00000000186300000000000000000000000000000000
      00000000000000000000000000000000000018630000FF7F0000004000400000
      FF7F00000000FF7F0000FF7F00001042000018630000FF7F0000004000400000
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000FF7F00000000FF7F0000
      0000FF7FFF7FFF7F0000FF7F0000186300000000000000000000000000000000
      00000000000000000000000000000000000018630000FF7F0000004000400000
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7F0000004000400000
      00000000000000000000000000000000104200000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000FF7F0000186300000000000000000000000000000000
      00000000000000000000000000000000000018630000FF7F0000000000000000
      FF7F0000000000000000FF7F00001042000018630000FF7F0000000000001042
      000000001042104210420000000010420000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      00000000000000000000000000000000000018630000FF7FFF7F10421042FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00001042000018630000FF7FFF7F104200001042
      0000104218631042104210420000104200000000007C00000000FF7F00000000
      000000000000FF7F000000000000007C00000000000000000000000000000000
      0000000000000000000000000000000000001863000000000000000000000000
      0000000000000000000000000000104200001863000000000000000000001042
      00001042FF7F1042104210420000104200000000007C0000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000007C00000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186300000000
      000000000000104218631863186300000000186318631863186318630000FF7F
      0000000010421042104200000000FF7F0000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186300000000
      000000000000104200000000000000000000000000000000000000000000FF7F
      FF7F00000000000000000000FF7FFF7F0000000000000000FF7F000000000000
      FF7F00000000FF7FFF7F0000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186300000000
      0000000000001042000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186318631863
      1863186318630000000000000000000000000000000000000000000000000000
      000010420000FF7F00001042000000000000000000000000FF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010420000104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF800700008001800100030000
      0001000100010000000100018010000000010001000000000001000100000000
      0001000380000000000100008000000000010000000000000001000000000000
      00010000000000000003000000000000F39FF800C0010000F01FF800C0010000
      F03FFD05C0070000FFFFFF8FE3FF000000000000000000000000000000000000
      000000000000}
  end
  inherited qryTelefone: TwwQuery
    Left = 475
    Top = 242
    Data = {
      56657220322E302C514245202D20496E74656772612056697375616C20446174
      6162617365204275696C6465722C302C2031302C20313630302C20313136342C
      2C2C2C2C0D0A202C202C202D2044697374696E637420262051756F74652C2C2C
      2C2C0D0A20202020322C202D204E756D626572206F66205461626C65732C2D31
      2C202D312C203830382C203630302C203830302C203238392C2C2C2C0D0A434D
      2E54454C454E44504553532C54454C454E44504553532C32302C2031302C2031
      33302C203133352C2C2C2C2C0D0A434D2E454E44504553532C454E4450455353
      2C3135302C2032302C203236302C203134352C2C2C2C2C0D0A20202020372C20
      2D204E756D626572206F6620436F6C756D6E732C2C2C2C2C2C0D0A494454454C
      45464F4E452C54454C454E44504553532C202020202020202020202020202020
      20202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D6265
      72206F662043726974657269612C2C2C2C2C2C0D0A4944504553534F412C454E
      44504553532C20202020202020202020202020202020202020312C2020202020
      2C202C2C2C0D0A20202020312C202D204E756D626572206F6620437269746572
      69612C2C2C2C2C2C0D0A3D3A4964506573736F612C20202020362C2C2C2C2C2C
      0D0A4944454E44455245434F2C54454C454E44504553532C2020202020202020
      2020202020202020202020312C20202020202C202C2C2C0D0A20202020202C20
      2D204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A4444492C
      54454C454E44504553532C20202020202020202020202020202020202020312C
      20202020202C202C2C2C0D0A20202020202C202D204E756D626572206F662043
      726974657269612C2C2C2C2C2C0D0A4444442C54454C454E44504553532C2020
      2020202020202020202020202020202020312C20202020202C202C2C2C0D0A20
      202020202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C
      0D0A4E554D45524F2C54454C454E44504553532C202020202020202020202020
      20202020202020312C20202020202C202C2C2C0D0A20202020202C202D204E75
      6D626572206F662043726974657269612C2C2C2C2C2C0D0A5449504F2C54454C
      454E44504553532C20202020202020202020202020202020202020312C202020
      20202C202C2C2C0D0A20202020202C202D204E756D626572206F662043726974
      657269612C2C2C2C2C2C0D0A20202020312C202D204E756D626572206F66204A
      6F696E732C2C2C2C2C2C0D0A4944454E44455245434F2C54454C454E44504553
      532C4944454E44455245434F2C454E44504553532C202020202020202020202C
      202020202020202020202C2C0D0A0D0A2253454C4543542053746174656D656E
      74220D0A2C2C2C2C2C2C2C0D0A53454C4543540954454C454E44504553532E22
      494454454C45464F4E4522202C200D0A09454E44504553532E22494450455353
      4F4122202C200D0A0954454C454E44504553532E224944454E44455245434F22
      202C200D0A0954454C454E44504553532E2244444922202C2054454C454E4450
      4553532E2244444422202C200D0A0954454C454E44504553532E224E554D4552
      4F22202C200D0A0954454C454E44504553532E225449504F220D0A46524F4D09
      22434D222E2254454C454E4450455353222054454C454E4450455353202C2022
      434D222E22454E44504553532220454E44504553530D0A574845524509282054
      454C454E44504553532E4944454E44455245434F203D20454E44504553532E49
      44454E44455245434F20290D0A0909414E440D0A09280D0A092820454E445045
      53532E224944504553534F4122203D3A4964506573736F6120290D0A09292C2C
      2C2C2C2C2C0D0A}
  end
  inherited updTelefone: TUpdateSQL
    Top = 186
  end
  inherited dsTelefone: TwwDataSource
    Left = 662
    Top = 210
  end
  inherited dsEndereco: TwwDataSource
    Left = 614
  end
  inherited updEndereco: TUpdateSQL
    Left = 567
  end
  inherited qryEndereco: TwwQuery
    Left = 609
    Top = 189
  end
  inherited qryContato: TwwQuery
    Left = 517
    Top = 208
    Data = {
      56657220322E302C514245202D20496E74656772612056697375616C20446174
      6162617365204275696C6465722C302C2031302C20313630302C20313136342C
      2C2C2C2C0D0A202C202C202D2044697374696E637420262051756F74652C2C2C
      2C2C0D0A20202020322C202D204E756D626572206F66205461626C65732C2D31
      2C202D312C203830382C203630302C203830302C203331302C2C2C2C0D0A434D
      2E434F4E5441544F504553532C434F4E5441544F504553532C32302C2032302C
      203133302C203134352C2C2C2C2C0D0A434D2E454E44504553532C454E445045
      53532C3135302C2032302C203236302C203134352C2C2C2C2C0D0A2020202037
      2C202D204E756D626572206F6620436F6C756D6E732C2C2C2C2C2C0D0A494443
      4F4E5441544F2C434F4E5441544F504553532C20202020202020202020202020
      202020202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D
      626572206F662043726974657269612C2C2C2C2C2C0D0A4944504553534F412C
      454E44504553532C20202020202020202020202020202020202020312C202020
      20202C202C2C2C0D0A20202020312C202D204E756D626572206F662043726974
      657269612C2C2C2C2C2C0D0A3D3A4964506573736F612C20202020362C2C2C2C
      2C2C0D0A4944454E44455245434F2C434F4E5441544F504553532C2020202020
      2020202020202020202020202020312C20202020202C202C2C2C0D0A20202020
      202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A4E
      4F4D452C434F4E5441544F504553532C20202020202020202020202020202020
      202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D626572
      206F662043726974657269612C2C2C2C2C2C0D0A454D41494C2C434F4E544154
      4F504553532C20202020202020202020202020202020202020312C2020202020
      2C202C2C2C0D0A20202020202C202D204E756D626572206F6620437269746572
      69612C2C2C2C2C2C0D0A434152474F2C434F4E5441544F504553532C20202020
      202020202020202020202020202020312C20202020202C202C2C2C0D0A202020
      20202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A
      5345544F522C434F4E5441544F504553532C2020202020202020202020202020
      2020202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D62
      6572206F662043726974657269612C2C2C2C2C2C0D0A20202020312C202D204E
      756D626572206F66204A6F696E732C2C2C2C2C2C0D0A4944454E44455245434F
      2C434F4E5441544F504553532C4944454E44455245434F2C454E44504553532C
      202020202020202020202C202020202020202020202C2C0D0A0D0A2253454C45
      43542053746174656D656E74220D0A2C2C2C2C2C2C2C0D0A53454C4543540943
      4F4E5441544F504553532E224944434F4E5441544F22202C200D0A09454E4450
      4553532E224944504553534F4122202C200D0A09434F4E5441544F504553532E
      224944454E44455245434F22202C200D0A09434F4E5441544F504553532E224E
      4F4D4522202C200D0A09434F4E5441544F504553532E22454D41494C22202C20
      0D0A09434F4E5441544F504553532E22434152474F22202C200D0A09434F4E54
      41544F504553532E225345544F52220D0A46524F4D0922434D222E22434F4E54
      41544F504553532220434F4E5441544F50455353202C2022434D222E22454E44
      504553532220454E44504553530D0A5748455245092820434F4E5441544F5045
      53532E4944454E44455245434F203D20454E44504553532E4944454E44455245
      434F20290D0A0909414E440D0A09280D0A092820454E44504553532E22494450
      4553534F4122203D3A4964506573736F6120290D0A09292C2C2C2C2C2C2C0D0A}
  end
  inherited updContato: TUpdateSQL
    Left = 583
    Top = 256
  end
  inherited dsContato: TwwDataSource
    Left = 644
  end
  inherited qryRamal: TwwQuery
    Left = 612
    Top = 281
    Data = {
      56657220322E302C514245202D20496E74656772612056697375616C20446174
      6162617365204275696C6465722C302C20302C20313630302C20313136342C2C
      2C2C2C0D0A202C202C202D2044697374696E637420262051756F74652C2C2C2C
      2C0D0A20202020342C202D204E756D626572206F66205461626C65732C2D312C
      202D312C203830382C203630302C203830302C203333312C2C2C2C0D0A434D2E
      434F4E5441544F504553532C434F4E5441544F504553532C3135322C2031372C
      203236322C203134322C2C2C2C2C0D0A434D2E454E44504553532C454E445045
      53532C3335312C2037362C203436312C203230312C2C2C2C2C0D0A434D2E5445
      4C434F4E5441544F2C54454C434F4E5441544F2C31312C2039382C203132332C
      203232332C2C2C2C2C0D0A434D2E54454C454E44504553532C54454C454E4450
      4553532C3134372C203135392C203235372C203238342C2C2C2C2C0D0A202020
      20362C202D204E756D626572206F6620436F6C756D6E732C2C2C2C2C2C0D0A49
      44434F4E5441544F2C54454C434F4E5441544F2C202020202020202020202020
      20202020202020312C20202020202C202C2C2C0D0A20202020202C202D204E75
      6D626572206F662043726974657269612C2C2C2C2C2C0D0A494454454C45464F
      4E452C54454C434F4E5441544F2C202020202020202020202020202020202020
      20312C20202020202C202C2C2C0D0A20202020202C202D204E756D626572206F
      662043726974657269612C2C2C2C2C2C0D0A52414D414C2C54454C434F4E5441
      544F2C20202020202020202020202020202020202020312C20202020202C202C
      2C2C0D0A20202020202C202D204E756D626572206F662043726974657269612C
      2C2C2C2C2C0D0A4E554D45524F2C54454C454E44504553532C20202020202020
      202020202020202020202020312C20202020202C202C2C2C0D0A20202020202C
      202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A4E4F4D
      452C434F4E5441544F504553532C202020202020202020202020202020202020
      20312C20202020202C202C2C2C0D0A20202020202C202D204E756D626572206F
      662043726974657269612C2C2C2C2C2C0D0A4944504553534F412C454E445045
      53532C20202020202020202020202020202020202020202C20202020202C202C
      2C2C0D0A20202020312C202D204E756D626572206F662043726974657269612C
      2C2C2C2C2C0D0A3D3A4964506573736F612C20202020362C2C2C2C2C2C0D0A20
      202020342C202D204E756D626572206F66204A6F696E732C2C2C2C2C2C0D0A49
      44434F4E5441544F2C54454C434F4E5441544F2C4944434F4E5441544F2C434F
      4E5441544F504553532C202020202020202020202C202020202020202020202C
      2C0D0A494454454C45464F4E452C54454C434F4E5441544F2C494454454C4546
      4F4E452C54454C454E44504553532C202020202020202020202C202020202020
      202020202C2C0D0A4944454E44455245434F2C434F4E5441544F504553532C49
      44454E44455245434F2C454E44504553532C202020202020202020202C202020
      202020202020202C2C0D0A4944454E44455245434F2C54454C454E4450455353
      2C4944454E44455245434F2C454E44504553532C202020202020202020202C20
      2020202020202020202C2C0D0A0D0A2253454C4543542053746174656D656E74
      220D0A2C2C2C2C2C2C2C0D0A53454C4543540954454C434F4E5441544F2E2249
      44434F4E5441544F22202C200D0A0954454C434F4E5441544F2E22494454454C
      45464F4E4522202C200D0A0954454C434F4E5441544F2E2252414D414C22202C
      200D0A0954454C454E44504553532E224E554D45524F22202C200D0A09434F4E
      5441544F504553532E224E4F4D45220D0A46524F4D0922434D222E22434F4E54
      41544F504553532220434F4E5441544F50455353202C2022434D222E22454E44
      504553532220454E4450455353202C200D0A0922434D222E2254454C434F4E54
      41544F222054454C434F4E5441544F202C2022434D222E2254454C454E445045
      5353222054454C454E44504553530D0A574845524509282054454C434F4E5441
      544F2E4944434F4E5441544F203D20434F4E5441544F504553532E4944434F4E
      5441544F20290D0A0909414E440D0A09282054454C434F4E5441544F2E494454
      454C45464F4E45203D2054454C454E44504553532E494454454C45464F4E4520
      290D0A0909414E440D0A092820434F4E5441544F504553532E4944454E444552
      45434F203D20454E44504553532E4944454E44455245434F20290D0A0909414E
      440D0A09282054454C454E44504553532E4944454E44455245434F203D20454E
      44504553532E4944454E44455245434F20290D0A0909414E440D0A09280D0A09
      2820454E44504553532E222C2C2C2C2C2C2C0D0A4944504553534F4122203D3A
      4964506573736F6120290D0A09292C2C2C2C2C2C2C0D0A}
  end
  inherited updRamal: TUpdateSQL
    Left = 507
    Top = 281
  end
  inherited dsRamal: TwwDataSource
    Left = 654
    Top = 323
  end
  inherited qryDocumento: TwwQuery
    Left = 697
    Top = 416
  end
  inherited dsDocumento: TwwDataSource
    Left = 640
    Top = 384
  end
  inherited updDocumento: TUpdateSQL
    Left = 539
    Top = 280
  end
  inherited qryEscolhePessoa: TwwQuery
    Left = 364
    Top = 43
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 423
    Top = 52
  end
  inherited Pessoa: TPessoa
    TipoPessoa = tpFisica
    SubTipo = stElegivel
    OnChangeSubtipo = PessoaChangeSubtipo
    OnSaveSubtipo = PessoaSaveSubtipo
    Left = 300
    Top = 8
  end
  inherited OpenPictureDialog1: TOpenPictureDialog
    Left = 330
    Top = 456
  end
  inherited updImagensDoc: TUpdateSQL
    Left = 124
    Top = 431
  end
  inherited qryImagensDoc: TwwQuery
    Left = 24
    Top = 432
  end
  inherited dsImagem: TwwDataSource
    Left = 695
    Top = 23
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 214
    Top = 439
  end
  inherited qryTipoDoc: TwwQuery
    Left = 646
    Top = 352
  end
  inherited qryEstado: TwwQuery
    Left = 464
    Top = 47
    Data = {
      56657220322E302C514245202D20496E74656772612056697375616C20446174
      6162617365204275696C6465722C302C2031302C20313630302C20313136342C
      2C2C2C2C0D0A202C202C202D2044697374696E637420262051756F74652C2C2C
      2C2C0D0A20202020322C202D204E756D626572206F66205461626C65732C2D31
      2C202D312C203531382C203339352C203531302C203136392C2C2C2C0D0A4553
      5441444F2C45535441444F2C32302C2031302C203133372C203133352C2C2C2C
      2C0D0A504149532C504149532C3135372C2031302C203333312C203133352C2C
      2C2C2C0D0A20202020342C202D204E756D626572206F6620436F6C756D6E732C
      2C2C2C2C2C0D0A434F4445535441444F2C45535441444F2C2020202020202020
      2020202020202020202020312C20202020202C202C2C2C0D0A20202020202C20
      2D204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A4E4F4D45
      45535441444F2C45535441444F2C202020202020202020202020202020202020
      36352C20202020202C202C2C312C0D0A20202020202C202D204E756D62657220
      6F662043726974657269612C2C2C2C2C2C0D0A4944504149532C504149532C20
      202020202020202020202020202020202020312C20202020202C202C2C2C0D0A
      20202020202C202D204E756D626572206F662043726974657269612C2C2C2C2C
      2C0D0A4E4F4D45504149532C504149532C202020202020202020202020202020
      20202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D6265
      72206F662043726974657269612C2C2C2C2C2C0D0A20202020312C202D204E75
      6D626572206F66204A6F696E732C2C2C2C2C2C0D0A4944504149532C45535441
      444F2C4944504149532C504149532C202020202020202020202C202020202020
      202020202C2C0D0A0D0A2253454C4543542053746174656D656E74220D0A2C2C
      2C2C2C2C2C0D0A53454C4543540945535441444F2E22434F4445535441444F22
      202C200D0A0945535441444F2E224E4F4D4545535441444F22202C2050414953
      2E2249445041495322202C200D0A09504149532E224E4F4D4550414953220D0A
      46524F4D092245535441444F222045535441444F202C20225041495322205041
      49530D0A574845524509282045535441444F2E494450414953203D2050414953
      2E49445041495320290D0A4F524445522042590D0A0945535441444F2E224E4F
      4D4545535441444F222C2C2C2C2C2C2C0D0A}
  end
  object qryPlanosPrev: TwwQuery
    CachedUpdates = True
    AfterInsert = qryPlanosPrevAfterInsert
    BeforePost = qryPlanosPrevBeforePost
    AfterPost = qryPlanosPrevAfterPost
    AfterScroll = qryPlanosPrevAfterScroll
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT PARTPREVPLAN."IDPESSJUR" , '
      ' PARTPREVPLAN."SEQPROPOSTA" , '
      ' PARTPREVPLAN."IDPLANOPREV" , '
      ' PARTPREVPLAN."IDPESSOA" , '
      ' PARTPREVPLAN."IDSITPART" , '
      ' PARTPREVPLAN."IDSITPLANOPREV" , '
      ' PARTPREVPLAN."REQUERIMENTODATA" , '
      ' PARTPREVPLAN."INSCRICAONUMERO" , '
      ' PARTPREVPLAN."INSCRICAODATA" , '
      ' PARTPREVPLAN."INSCRICAOTIPO" , '
      ' PARTPREVPLAN."SALINSCRICAO" ,'
      ' PARTPREVPLAN."SALPARTICIPACAO" , '
      ' PARTPREVPLAN."DATACANCELAMENTO" , '
      ' PARTPREVPLAN."DATAINICIOMANUT" , '
      ' PL."NOME" AS PLANO,'
      ' SITPART."DESCRICAO" AS SITPART,'
      ' SITPLANO."DESCRICAO" AS SITPLANO'
      'FROM "PARTPREVPLAN" PARTPREVPLAN, "PLANPREV" PL, '
      '           "SITPART" SITPART, "SITPLANOPREV" SITPLANO'
      'WHERE PARTPREVPLAN."IDPESSOA" = :IDPESSOA   AND'
      '      PARTPREVPLAN."IDPLANOPREV" = PL."IDPLANOPREV"  AND'
      '      PARTPREVPLAN."IDSITPART" = SITPART."IDSITPART" AND'
      '      PARTPREVPLAN."IDSITPLANOPREV" = SITPLANO."IDSITPLANOPREV"')
    UpdateObject = updPlanosPrev
    ValidateWithMask = True
    Left = 224
    Top = 70
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsPlanosPrev: TwwDataSource
    DataSet = qryPlanosPrev
    Left = 211
    Top = 113
  end
  object updPlanosPrev: TUpdateSQL
    ModifySQL.Strings = (
      'update "PARTPREVPLAN"'
      'set'
      '  IDSITPART = :IDSITPART,'
      '  IDSITPLANOPREV = :IDSITPLANOPREV,'
      '  REQUERIMENTODATA = :REQUERIMENTODATA,'
      '  INSCRICAONUMERO = :INSCRICAONUMERO,'
      '  INSCRICAODATA = :INSCRICAODATA,'
      '  INSCRICAOTIPO = :INSCRICAOTIPO,'
      '  SALINSCRICAO = :SALINSCRICAO'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    InsertSQL.Strings = (
      'insert into "PARTPREVPLAN"'
      '  (IDPESSJUR, IDPESSOA, IDPLANOPREV, IDSITPART, IDSITPLANOPREV, '
      'REQUERIMENTODATA, '
      '   INSCRICAONUMERO, INSCRICAODATA, INSCRICAOTIPO, SALINSCRICAO)'
      'values'
      
        '  (:IDPESSJUR, :IDPESSOA, :IDPLANOPREV, :IDSITPART, :IDSITPLANOP' +
        'REV, '
      ':REQUERIMENTODATA, '
      
        '   :INSCRICAONUMERO, :INSCRICAODATA, :INSCRICAOTIPO, :SALINSCRIC' +
        'AO)')
    DeleteSQL.Strings = (
      'delete from "PARTPREVPLAN"'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    Left = 368
    Top = 111
  end
  object qryPlanPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLANPREV."IDPLANOPREV" , '
      ' PLANPREV."IDFUNDACAO" , '
      ' PLANPREV."NOME" , '
      ' PLANPREV."IDREGRAADMISSAO" , '
      ' PLANPREV."TPPLANOPREV",'
      ' PLANPREV."FLGAUTONUMINSC",'
      ' PLANPREV."NUMINSCINICIAL",'
      ' PP."FLGATIVO"'
      'FROM "PLANPREV" PLANPREV,'
      '           "PLANPREVPATRO" PP'
      'WHERE PP."IDPESSJUR" = :IDPESSJUR AND'
      '               PP."IDPLANOPREV" = PLANPREV."IDPLANOPREV" AND'
      '               PLANPREV."TPPLANOPREV" = '#39'F'#39
      '')
    ValidateWithMask = True
    Left = 175
    Top = 412
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qrySitPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITPART,DESCRICAO'
      'FROM SITPART'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 516
    Top = 194
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 565
    Top = 432
  end
  object qryDepen: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DEPENDENTE."IDPESSOA"'
      'FROM "CM"."DEPENDENTE" DEPENDENTE'
      'WHERE DEPENDENTE."IDPESSOA" = :IDPESSOA')
    UpdateObject = updDepen
    ValidateWithMask = True
    Left = 37
    Top = 34
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updDepen: TUpdateSQL
    ModifySQL.Strings = (
      'update "CM"."DEPENDENTE"'
      'set'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into "CM"."DEPENDENTE"'
      '  (IDPESSOA)'
      'values'
      '  (:IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from "CM"."DEPENDENTE"'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 91
    Top = 34
  end
  object qryDepenTit: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DEPENTIT."IDTITULAR" , '
      ' DEPENTIT."IDPESSOA" , '
      ' DEPENTIT."IDDEPENDENCIA" , '
      ' DEPENTIT."NUMSEQUENCIA" , '
      ' DEPENTIT."FLGCONTAIMPOSTOR" , '
      ' DEPENTIT."FLGCONTASALARIOF" , '
      ' DEPENTIT."FLGBENEFICIARIO"'
      'FROM "CM"."DEPENTIT" DEPENTIT'
      'WHERE DEPENTIT."IDPESSOA" = :IDPESSOA AND'
      '              DEPENTIT."IDTITULAR" = DEPENTIT."IDPESSOA"')
    UpdateObject = updDepentit
    ValidateWithMask = True
    Left = 154
    Top = 33
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updDepentit: TUpdateSQL
    ModifySQL.Strings = (
      'update "CM"."DEPENTIT"'
      'set'
      '  IDDEPENDENCIA = :IDDEPENDENCIA,'
      '  NUMSEQUENCIA = :NUMSEQUENCIA,'
      '  FLGCONTAIMPOSTOR = :FLGCONTAIMPOSTOR,'
      '  FLGCONTASALARIOF = :FLGCONTASALARIOF,'
      '  FLGBENEFICIARIO = :FLGBENEFICIARIO'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into "CM"."DEPENTIT"'
      '  (IDTITULAR, IDPESSOA, IDDEPENDENCIA, NUMSEQUENCIA, '
      'FLGCONTAIMPOSTOR, '
      '   FLGCONTASALARIOF, FLGBENEFICIARIO)'
      'values'
      '  (:IDTITULAR, :IDPESSOA, :IDDEPENDENCIA, :NUMSEQUENCIA, '
      ':FLGCONTAIMPOSTOR, '
      '   :FLGCONTASALARIOF, :FLGBENEFICIARIO)')
    DeleteSQL.Strings = (
      'delete from "CM"."DEPENTIT"'
      'where'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 216
    Top = 36
  end
  object qryGrava: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 674
    Top = 331
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 602
    Top = 424
  end
  object qrySitPlanoPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITPLANOPREV, DESCRICAO'
      'FROM SITPLANOPREV'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 648
    Top = 269
  end
  object dsNaturalidade: TwwDataSource
    DataSet = qryNaturalidade
    Left = 331
    Top = 106
  end
  object qryNaturalidade: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ESTADO."CODESTADO" , '
      ' ESTADO."NOMEESTADO" , PAIS."IDPAIS" , '
      ' PAIS."NOMEPAIS", PAIS."NOMENACIONALIDADE"'
      'FROM "ESTADO" ESTADO , "PAIS" PAIS'
      'WHERE ( ESTADO.IDPAIS = PAIS.IDPAIS )'
      'ORDER BY'
      ' ESTADO."NOMEESTADO"'
      '')
    ValidateWithMask = True
    Left = 292
    Top = 100
  end
  object qryContaBancaria: TwwQuery
    CachedUpdates = True
    AfterInsert = qryContaBancariaAfterInsert
    BeforePost = qryContaBancariaBeforePost
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT CONTABANCARIA."IDCBANCARIA",'
      '               CONTABANCARIA."CONTACORRENTE",'
      '               CONTABANCARIA."IDAGENCIA",'
      '               CONTABANCARIA."FLGCONTAPREF",'
      '               CONTABANCARIA."IDPESSOA",'
      '               AGENCIA."NOME" AS AGENCIA,'
      '               BANCO."NOME" AS BANCO'
      'FROM "CONTABANCARIA" CONTABANCARIA, "PESSOA" AGENCIA,'
      '           "PESSOA" BANCO, "AGENCIABANCARIA" AGENCIABANCARIA'
      'WHERE CONTABANCARIA."IDPESSOA" = :IDPESSOA AND'
      
        '               CONTABANCARIA."IDAGENCIA" = AGENCIA."IDPESSOA" AN' +
        'D'
      
        '               CONTABANCARIA."IDAGENCIA"  = AGENCIABANCARIA."IDP' +
        'ESSOA" AND'
      '               AGENCIABANCARIA."IDBANCO" =  BANCO."IDPESSOA" '
      '')
    UpdateObject = updContaBancaria
    ControlType.Strings = (
      'FLGCONTAPREF;CheckBox;1;0')
    ValidateWithMask = True
    Left = 352
    Top = 60
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsContaBancaria: TwwDataSource
    DataSet = qryContaBancaria
    Left = 407
    Top = 97
  end
  object updContaBancaria: TUpdateSQL
    ModifySQL.Strings = (
      'update "CM"."CONTABANCARIA"'
      'set'
      '  CONTACORRENTE = :CONTACORRENTE,'
      '  IDAGENCIA = :IDAGENCIA,'
      '  FLGCONTAPREF = :FLGCONTAPREF'
      'where'
      '  IDCBANCARIA = :OLD_IDCBANCARIA and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into "CM"."CONTABANCARIA"'
      
        '  (IDCBANCARIA, CONTACORRENTE, IDAGENCIA, FLGCONTAPREF, IDPESSOA' +
        ')'
      'values'
      '  (:IDCBANCARIA, :CONTACORRENTE, :IDAGENCIA, :FLGCONTAPREF, '
      ':IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from "CM"."CONTABANCARIA"'
      'where'
      '  IDCBANCARIA = :OLD_IDCBANCARIA and'
      '  CONTACORRENTE = :OLD_CONTACORRENTE and'
      '  IDAGENCIA = :OLD_IDAGENCIA and'
      '  FLGCONTAPREF = :OLD_FLGCONTAPREF and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 504
    Top = 101
  end
  object qryAgencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  AGENCIABANCARIA.IDPESSOA,'
      '               AGENCIA.NOME AS AGENCIA'
      'FROM AGENCIABANCARIA, PESSOA AGENCIA'
      'WHERE AGENCIABANCARIA.IDPESSOA  = AGENCIA.IDPESSOA AND'
      '               AGENCIABANCARIA.IDBANCO=:pIdBanco'
      '')
    ValidateWithMask = True
    Left = 697
    Top = 271
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdBanco'
        ParamType = ptUnknown
      end>
  end
  object qryBanco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BANCO.IDPESSOA, PESSOA.NOME AS BANCO'
      'FROM BANCO, PESSOA'
      'WHERE BANCO.IDPESSOA = PESSOA.IDPESSOA ')
    ValidateWithMask = True
    Left = 579
    Top = 188
  end
  object qryfilial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME, IDPESSOA '
      'FROM PESSOA WHERE '
      'PESSOA.FLGFILIALPESSOA = 1 AND'
      'PESSOA.IDPESSOA IN '
      '(SELECT IDFILIALPESSOA FROM FILIALPESSOA)'
      'AND PESSOA.IDGRUPO =  :IDPESSOA')
    ValidateWithMask = True
    Left = 454
    Top = 444
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dspatro: TwwDataSource
    AutoEdit = False
    Left = 258
    Top = 444
  end
  object qryfundacao: TwwQuery
    BeforeOpen = qryfundacaoBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME , IDPESSOA '
      'FROM PESSOA'
      'WHERE IDPESSOA IN'
      '(SELECT IDPESSOA FROM FUNDACAO)'
      'AND IDPESSOA NOT IN'
      '(SELECT IDFUNDACAO FROM PESSOAXFUND '
      'WHERE IDPESSOA  =  :IDPESSOA)')
    ValidateWithMask = True
    Left = 78
    Top = 451
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsfundacoes: TwwDataSource
    DataSet = qryfundacoes
    OnStateChange = dsfundacoesStateChange
    Left = 349
    Top = 428
  end
  object qryfundacoes: TwwQuery
    CachedUpdates = True
    AfterInsert = qryfundacoesAfterInsert
    BeforePost = qryfundacoesBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME , NUMINSC ,IDFUNDACAO , '
      'PESSOAXFUND.IDPESSOA'
      'FROM PESSOA , PESSOAXFUND'
      'WHERE '
      'PESSOAXFUND.IDFUNDACAO = PESSOA.IDPESSOA'
      'AND PESSOAXFUND.IDPESSOA = :IDPESSOA')
    UpdateObject = updfundacoes
    ValidateWithMask = True
    Left = 506
    Top = 438
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updfundacoes: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOAXFUND'
      'set'
      '  NUMINSC = :NUMINSC'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDFUNDACAO = :OLD_IDFUNDACAO')
    InsertSQL.Strings = (
      'insert into PESSOAXFUND'
      '  (IDPESSOA , IDFUNDACAO ,NUMINSC)'
      'values'
      '  ( :IDPESSOA ,  :IDFUNDACAO ,:NUMINSC)')
    DeleteSQL.Strings = (
      'delete from PESSOAXFUND'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDFUNDACAO = :OLD_IDFUNDACAO')
    Left = 387
    Top = 431
  end
  object qryGrava2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 693
    Top = 375
  end
end
