inherited frmPessoa: TfrmPessoa
  Left = 238
  Top = 216
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Banco'
  ClientHeight = 690
  ClientWidth = 1344
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1344
    Height = 604
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 106
      Width = 1342
      Height = 497
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato')
      inherited pgctrlDetalhe: TPageControl
        Width = 1244
        Height = 438
        ActivePage = tbsDocumento
        object tbsDocumento: TTabSheet [0]
          Caption = 'Documentação'
          object PgCtrlPesFisica_Padrao: TPageControl
            Left = 0
            Top = 0
            Width = 1236
            Height = 410
            ActivePage = TbsDocumentos_Padrao
            Align = alClient
            TabOrder = 0
            Visible = False
            object TbsDocumentos_Padrao: TTabSheet
              Caption = 'Documento(s)'
            end
            object TbsDadosPessoais_Padrao: TTabSheet
              Caption = 'Dados Pessoais'
              object BvlDadosNasc_Padrao: TBevel
                Left = 165
                Top = 92
                Width = 131
                Height = 93
                Shape = bsFrame
              end
              object BvlNatur_Padrao: TBevel
                Left = 6
                Top = 92
                Width = 154
                Height = 93
                Shape = bsFrame
              end
              object LblNomePai_Padrao: TLabel
                Left = 6
                Top = 3
                Width = 73
                Height = 13
                Caption = 'Nome do Pai'
              end
              object LblNomeMae_Padrao: TLabel
                Left = 6
                Top = 44
                Width = 79
                Height = 13
                Caption = 'Nome da Mãe'
              end
              object LblNaturalidade_Padrao: TLabel
                Left = 16
                Top = 99
                Width = 73
                Height = 13
                Caption = 'Naturalidade'
              end
              object LblNacionalidade_Padrao: TLabel
                Left = 16
                Top = 140
                Width = 82
                Height = 13
                Caption = 'Nacionalidade'
              end
              object LblDataNasc_Padrao: TLabel
                Left = 172
                Top = 100
                Width = 116
                Height = 13
                Caption = 'Data de Nascimento'
              end
              object LblTipoSang_Padrao: TLabel
                Left = 304
                Top = 158
                Width = 63
                Height = 26
                Caption = 'Tipo Sanguíneo'
                WordWrap = True
              end
              object Label1: TLabel
                Left = 172
                Top = 140
                Width = 118
                Height = 13
                Caption = 'Data de Falecimento'
              end
              object LbVlrlINSS_Padrao: TLabel
                Left = 468
                Top = 4
                Width = 63
                Height = 13
                Caption = 'Valor INSS'
              end
              object LblvlrPensao_Padrao: TLabel
                Left = 468
                Top = 44
                Width = 76
                Height = 13
                Caption = 'Valor Pensão'
              end
              object CkbIsentoIrrf_Padrao: TDBCheckBox
                Left = 304
                Top = 138
                Width = 105
                Height = 17
                Caption = 'Isento de IRRF'
                DataField = 'FLGISENTOIRRF'
                DataSource = dsPessoaFisica
                TabOrder = 3
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object dbrgrpSexo_Padrao: TDBRadioGroup
                Left = 300
                Top = 86
                Width = 114
                Height = 47
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
              object dbrgrpEstCivil_Padrao: TDBRadioGroup
                Left = 234
                Top = 8
                Width = 230
                Height = 76
                Caption = 'Estado Civil'
                Columns = 2
                DataField = 'ESTCIVIL'
                DataSource = dsPessoaFisica
                Items.Strings = (
                  'Solteiro(a)'
                  'Casado(a)'
                  'Divorciado(a)'
                  'Viúvo(a)'
                  'Desquitado'
                  'Separado Judic.'
                  'Outros')
                TabOrder = 8
                TabStop = True
                Values.Strings = (
                  'S'
                  'C'
                  'D'
                  'V'
                  'E'
                  'J'
                  'O')
              end
              object EdtNomePai_Padrao: TwwDBEdit
                Left = 6
                Top = 20
                Width = 224
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
              object EdtNomeMae_Padrao: TwwDBEdit
                Left = 6
                Top = 61
                Width = 224
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
              object CmbNaturalidade_Padrao: TwwDBLookupCombo
                Left = 16
                Top = 116
                Width = 135
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
                DataSource = dsPessoaFisica
                LookupTable = qryNaturalidade_Padrao
                LookupField = 'CODESTADO'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 4
                AutoDropDown = True
                ShowButton = True
                OrderByDisplay = False
                AllowClearKey = False
              end
              object DbedNacionalidade_Padrao: TwwDBEdit
                Left = 16
                Top = 157
                Width = 135
                Height = 21
                Color = clSilver
                DataField = 'NOMENACIONALIDADE'
                DataSource = DsNaturalidade_Padrao
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object EdtTipoSang_Padrao: TwwDBEdit
                Left = 373
                Top = 160
                Width = 37
                Height = 21
                DataField = 'TIPOSANG'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object GpNumDepend_Padrao: TGroupBox
                Left = 418
                Top = 86
                Width = 134
                Height = 99
                Caption = ' Nº Dependentes '
                TabOrder = 7
                object LblDepenIr_Padrao: TLabel
                  Left = 11
                  Top = 21
                  Width = 30
                  Height = 13
                  Caption = 'IRRF'
                end
                object LblDepenSal_Padrao: TLabel
                  Left = 11
                  Top = 41
                  Width = 44
                  Height = 26
                  Caption = 'Salário Família'
                  WordWrap = True
                end
                object LblTotalDepende_Padrao: TLabel
                  Left = 11
                  Top = 76
                  Width = 30
                  Height = 13
                  Caption = 'Total'
                end
                object SpinDepenIr_Padrao: TwwDBSpinEdit
                  Left = 61
                  Top = 17
                  Width = 57
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
                object SpinDepenSal_Padrao: TwwDBSpinEdit
                  Left = 61
                  Top = 43
                  Width = 57
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
                object SpinTotalDepente_Padrao: TwwDBSpinEdit
                  Left = 61
                  Top = 70
                  Width = 57
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
              object EdtDataNasc_Padrao: TCMDateTimePicker
                Left = 170
                Top = 116
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
                ShowButton = True
                TabOrder = 9
              end
              object EdtDataFalec_Padrao: TCMDateTimePicker
                Left = 170
                Top = 156
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAMORTE'
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
                ShowButton = True
                TabOrder = 10
              end
              object EdtvlrPensao_Padrao: TDBRealEdit
                Left = 468
                Top = 59
                Width = 85
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 11
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'VLRPENSAO'
                DataSource = dsPessoaFisica
              end
              object EdtlrlINSS_Padrao: TDBRealEdit
                Left = 468
                Top = 20
                Width = 84
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 12
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'VLRINSS'
                DataSource = dsPessoaFisica
              end
            end
          end
          object PnlDocumentos_Padrao: TPanel
            Left = 0
            Top = 0
            Width = 1236
            Height = 410
            Align = alClient
            TabOrder = 1
            object pnlItemsDoc: TPanel
              Left = 317
              Top = 1
              Width = 172
              Height = 408
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              OnResize = pnlItemsDocResize
              object pnlNomeDoc: TPanel
                Left = 0
                Top = 0
                Width = 172
                Height = 21
                Align = alTop
                TabOrder = 0
                object DBText1: TDBText
                  Left = 10
                  Top = 3
                  Width = 150
                  Height = 17
                  DataField = 'NOMEDOCUMENTO'
                  DataSource = dsDocumento
                end
              end
              object pnlOrgao: TPanel
                Left = 0
                Top = 95
                Width = 172
                Height = 46
                Align = alTop
                TabOrder = 1
                Visible = False
                object lblPdOrgao: TLabel
                  Left = 10
                  Top = 3
                  Width = 81
                  Height = 13
                  Caption = 'Orgão emissor'
                end
                object wwDBEdit1: TwwDBEdit
                  Left = 10
                  Top = 18
                  Width = 148
                  Height = 21
                  DataField = 'ORGAO'
                  DataSource = dsDocumento
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object pnlEmissao: TPanel
                Left = 0
                Top = 187
                Width = 172
                Height = 46
                Align = alTop
                TabOrder = 2
                Visible = False
                object lblPdEmiss: TLabel
                  Left = 10
                  Top = 3
                  Width = 96
                  Height = 13
                  Caption = 'Data da Emissão'
                end
                object CMDateTimePicker2: TCMDateTimePicker
                  Left = 11
                  Top = 18
                  Width = 150
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAEMISSAO'
                  DataSource = dsDocumento
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
              object pnlUF: TPanel
                Left = 0
                Top = 141
                Width = 172
                Height = 46
                Align = alTop
                TabOrder = 3
                Visible = False
                object lblPdUF: TLabel
                  Left = 10
                  Top = 3
                  Width = 130
                  Height = 13
                  Caption = 'Unidade da Federação'
                end
                object dbcmbEstadoDoc: TCMDBLookupCombo
                  Left = 10
                  Top = 18
                  Width = 49
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'CODESTADO'#9'4'#9'UF'
                    'NOMEESTADO'#9'15'#9'Estado'
                    'NOMEPAIS'#9'20'#9'Pais')
                  DataField = 'IDESTADO'
                  DataSource = dsDocumento
                  LookupTable = qryEstado
                  LookupField = 'IDESTADO'
                  Options = [loTitles]
                  Style = csDropDownList
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                  ShowMatchText = True
                  OnChange = dbcmbEstadoDocChange
                end
              end
              object pnlNumDoc: TPanel
                Left = 0
                Top = 21
                Width = 172
                Height = 28
                Align = alTop
                TabOrder = 4
                object edDocNumDocumento: TwwDBEdit
                  Left = 10
                  Top = 3
                  Width = 148
                  Height = 21
                  DataField = 'NUMDOCUMENTO'
                  DataSource = dsDocumento
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                  OnExit = edDocNumDocumentoExit
                end
              end
              object PnlValidade: TPanel
                Left = 0
                Top = 233
                Width = 172
                Height = 46
                Align = alTop
                TabOrder = 5
                Visible = False
                object LblDtValidade: TLabel
                  Left = 10
                  Top = 3
                  Width = 99
                  Height = 13
                  Caption = 'Data de Validade'
                end
                object CMDateTimePicker1: TCMDateTimePicker
                  Left = 11
                  Top = 18
                  Width = 150
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAVALIDADE'
                  DataSource = dsDocumento
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
              object pnlDataHabilitacao: TPanel
                Left = 0
                Top = 325
                Width = 172
                Height = 50
                Align = alTop
                TabOrder = 6
                Visible = False
                object lblDtHabilitacao: TLabel
                  Left = 10
                  Top = 3
                  Width = 160
                  Height = 13
                  Caption = 'Data da primeiro habilitação'
                end
                object CMDateTimePicker38: TCMDateTimePicker
                  Left = 11
                  Top = 18
                  Width = 150
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DTPRIMEIRACNH'
                  DataSource = dsDocumento
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
              object pnlCategoria: TPanel
                Left = 0
                Top = 279
                Width = 172
                Height = 46
                Align = alTop
                TabOrder = 7
                Visible = False
                object lblCategoria: TLabel
                  Left = 10
                  Top = 3
                  Width = 55
                  Height = 13
                  Caption = 'Categoria'
                end
                object edtCategoria: TwwDBEdit
                  Left = 10
                  Top = 18
                  Width = 148
                  Height = 21
                  DataField = 'CATEGCNH'
                  DataSource = dsDocumento
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object pnlPais: TPanel
                Left = 0
                Top = 375
                Width = 172
                Height = 46
                Align = alTop
                TabOrder = 8
                Visible = False
                object Label91: TLabel
                  Left = 10
                  Top = 3
                  Width = 27
                  Height = 13
                  Caption = 'País'
                end
                object dbcmdPais: TCMDBLookupCombo
                  Left = 10
                  Top = 18
                  Width = 151
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEPAIS'#9'20'#9'Pais')
                  DataField = 'IDPAIS'
                  DataSource = dsDocumento
                  LookupTable = qryPais
                  LookupField = 'IDPAIS'
                  Options = [loTitles]
                  Style = csDropDownList
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                  ShowMatchText = True
                  OnChange = dbcmbEstadoDocChange
                end
              end
              object pnlTipoDocumento: TPanel
                Left = 0
                Top = 49
                Width = 172
                Height = 46
                Align = alTop
                Caption = 'pnlTipoDocumento'
                TabOrder = 9
                Visible = False
                object LbTpDocumento: TLabel
                  Left = 10
                  Top = 3
                  Width = 94
                  Height = 13
                  Caption = 'Tipo Documento'
                end
                object dbcmbTipoDocumento: TCMDBLookupCombo
                  Left = 10
                  Top = 18
                  Width = 148
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'10'#9'Tipo'
                    'MASCARA'#9'10'#9'Mascara')
                  DataField = 'IDTIPODOCPESSOAXMASC'
                  DataSource = dsDocumento
                  LookupTable = qryTipoDocumento
                  LookupField = 'IDTIPODOCPESSOAXMASC'
                  Options = [loTitles]
                  Style = csDropDownList
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                  ShowMatchText = True
                  OnChange = dbcmbTipoDocumentoChange
                end
              end
            end
            object pnlFoto: TPanel
              Left = 489
              Top = 1
              Width = 746
              Height = 408
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object Bevel1: TBevel
                Left = 0
                Top = 0
                Width = 2
                Height = 377
                Align = alLeft
                Shape = bsRightLine
              end
              object PnlAssociaFoto_Padrao: TPanel
                Left = 0
                Top = 377
                Width = 746
                Height = 31
                Align = alBottom
                BevelInner = bvRaised
                BevelOuter = bvLowered
                Ctl3D = True
                ParentCtl3D = False
                TabOrder = 0
                OnResize = PnlAssociaFoto_PadraoResize
                object btnAssociarimgPessoa: TButton
                  Left = 30
                  Top = 3
                  Width = 143
                  Height = 26
                  Caption = 'Associar &foto'
                  TabOrder = 0
                  OnClick = btnAssociarimgPessoaClick
                end
              end
              object SbImagePessoa_Padrao: TScrollBox
                Left = 2
                Top = 0
                Width = 744
                Height = 377
                Align = alClient
                BorderStyle = bsNone
                TabOrder = 1
                object imgPessoa1: TImage
                  Left = 0
                  Top = 0
                  Width = 200
                  Height = 250
                  Stretch = True
                end
                object imgPessoa: TDBImage
                  Left = 280
                  Top = 8
                  Width = 197
                  Height = 185
                  BorderStyle = bsNone
                  Center = False
                  DataField = 'IMAGEM'
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 0
                  Visible = False
                end
              end
            end
            object lstDocumentos: TListView
              Left = 1
              Top = 1
              Width = 316
              Height = 408
              Align = alLeft
              Columns = <
                item
                  Caption = 'Documento'
                  Width = 170
                end
                item
                  Caption = 'Número'
                  Width = 140
                end>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ReadOnly = True
              RowSelect = True
              ParentFont = False
              SmallImages = ImageList1
              SortType = stText
              TabOrder = 2
              ViewStyle = vsReport
              OnChange = lstDocumentosChange
              OnDblClick = lstDocumentosDblClick
            end
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'Endereços'
          inherited dbgrdDet: TwwDBGrid
            Width = 1236
            Height = 410
            Selected.Strings = (
              'NOME'#9'20'#9'Local'
              'LOGRADOURO'#9'20'#9'Logradouro'
              'TIPOEND_PADRAO'#9'20'#9'Tipo de Endereço'
              'NUMERO'#9'8'#9'Número'
              'COMPLEMENTO'#9'10'#9'Complemento'
              'BAIRRO'#9'10'#9'Bairro'
              'CEP'#9'10'#9'CEP'
              'NOMECIDADE'#9'20'#9'Cidade'
              'NOMEESTADO'#9'20'#9'Estado'
              'NOMEPAIS'#9'20'#9'Pais')
            DataSource = dsEndereco
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          end
          inherited pnlControlesDet: TPanel
            Width = 1236
            Height = 410
            object lblPdLocal: TLabel
              Left = 14
              Top = 6
              Width = 32
              Height = 13
              Caption = 'Local'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPdLogradouro: TLabel
              Left = 14
              Top = 46
              Width = 65
              Height = 13
              Caption = 'Logradouro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPdComplemento: TLabel
              Left = 15
              Top = 87
              Width = 76
              Height = 13
              Caption = 'Complemento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPdCidade: TLabel
              Left = 15
              Top = 129
              Width = 40
              Height = 13
              Caption = 'Cidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPdEstado: TLabel
              Left = 241
              Top = 129
              Width = 40
              Height = 13
              Caption = 'Estado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPdNumero: TLabel
              Left = 402
              Top = 46
              Width = 44
              Height = 13
              Caption = 'Número'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPdCEP: TLabel
              Left = 402
              Top = 87
              Width = 37
              Height = 13
              Caption = 'C.E.P.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblBairro: TLabel
              Left = 240
              Top = 87
              Width = 34
              Height = 13
              Caption = 'Bairro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPdPais: TLabel
              Left = 403
              Top = 129
              Width = 25
              Height = 13
              Caption = 'Pais'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedNomeEndereco: TDBEdit
              Left = 14
              Top = 19
              Width = 377
              Height = 21
              DataField = 'NOME'
              DataSource = dsEndereco
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dbedLogradouro: TDBEdit
              Left = 14
              Top = 60
              Width = 377
              Height = 21
              DataField = 'LOGRADOURO'
              DataSource = dsEndereco
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object DBEDCOMPLEMENTO: TwwDBEdit
              Left = 15
              Top = 100
              Width = 211
              Height = 21
              DataField = 'COMPLEMENTO'
              DataSource = dsEndereco
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedEstado: TwwDBEdit
              Left = 239
              Top = 142
              Width = 150
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'NOMEESTADO'
              DataSource = dsEndereco
              ReadOnly = True
              TabOrder = 6
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedBairro: TwwDBEdit
              Left = 239
              Top = 100
              Width = 150
              Height = 21
              DataField = 'BAIRRO'
              DataSource = dsEndereco
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object DBNUMERO: TDBEdit
              Left = 402
              Top = 60
              Width = 70
              Height = 21
              DataField = 'NUMERO'
              DataSource = dsEndereco
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object dbedCEP: TwwDBEdit
              Left = 402
              Top = 100
              Width = 70
              Height = 21
              DataField = 'CEP'
              DataSource = dsEndereco
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              UnboundDataType = wwDefault
              UsePictureMask = False
              WantReturns = False
              WordWrap = False
            end
            object dbedPais: TwwDBEdit
              Left = 403
              Top = 142
              Width = 69
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'NOMEPAIS'
              DataSource = dsEndereco
              ReadOnly = True
              TabOrder = 7
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object cmbCidade: TCMDBLookupCombo
              Left = 15
              Top = 142
              Width = 211
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMECIDADE'#9'40'#9'Cidade'
                'CODESTADO'#9'3'#9'Estado')
              DataField = 'IDCIDADES'
              DataSource = dsEndereco
              LookupTable = qryCidade
              LookupField = 'IDCIDADES'
              Options = [loTitles]
              Style = csDropDownList
              ParentFont = False
              TabOrder = 8
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object grpTipoEnd: TGroupBox
              Left = 1039
              Top = 0
              Width = 197
              Height = 410
              Align = alRight
              Caption = 'Tipos'
              TabOrder = 9
              object chkTipoEndereco: TCheckListBox
                Left = 10
                Top = 18
                Width = 119
                Height = 114
                OnClickCheck = chkTipoEnderecoClickCheck
                BorderStyle = bsNone
                Color = clBtnFace
                Ctl3D = True
                ItemHeight = 22
                Items.Strings = (
                  'Comercial'
                  'Residencial'
                  'Entrega'
                  'Cobrança'
                  'Correspondência')
                ParentCtl3D = False
                Style = lbOwnerDrawFixed
                TabOrder = 0
              end
            end
          end
        end
        object tbsTelefone: TTabSheet
          Caption = 'Telefones'
          object dbgTelefone: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1236
            Height = 410
            Selected.Strings = (
              'NUMERO'#9'10'#9'NUMERO'
              'DDD'#9'5'#9'DDD'
              'DDI'#9'4'#9'DDI'
              'TComercial'#9'3'#9'Com'
              'TParticular'#9'3'#9'Part'
              'TFax'#9'3'#9'Fax'
              'TCelular'#9'3'#9'Cel'
              'TRecado'#9'3'#9'Rec')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsTelefone
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
            TabOrder = 1
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
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 1236
            Height = 410
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblDDI: TLabel
              Left = 25
              Top = 8
              Width = 23
              Height = 13
              Caption = 'DDI'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblDDD: TLabel
              Left = 77
              Top = 8
              Width = 28
              Height = 13
              Caption = 'DDD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblNumTelefone: TLabel
              Left = 128
              Top = 8
              Width = 44
              Height = 13
              Caption = 'Número'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEDDDI: TDBEdit
              Left = 25
              Top = 24
              Width = 40
              Height = 21
              DataField = 'DDI'
              DataSource = dsTelefone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBEDDDD: TDBEdit
              Left = 77
              Top = 24
              Width = 40
              Height = 21
              DataField = 'DDD'
              DataSource = dsTelefone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object DBEDNUMERO: TwwDBEdit
              Left = 128
              Top = 24
              Width = 121
              Height = 21
              DataField = 'NUMERO'
              DataSource = dsTelefone
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
            object GroupBox4: TGroupBox
              Left = 23
              Top = 60
              Width = 226
              Height = 112
              Caption = 'Tipo de Telefone'
              TabOrder = 3
              object chkTipoTelefone: TCheckListBox
                Left = 8
                Top = 18
                Width = 215
                Height = 71
                BorderStyle = bsNone
                Color = clBtnFace
                Columns = 2
                Ctl3D = False
                ItemHeight = 22
                Items.Strings = (
                  'Comercial'
                  'Particular'
                  'Fax'
                  'Celular'
                  'Recado')
                ParentCtl3D = False
                Style = lbOwnerDrawFixed
                TabOrder = 0
                OnClick = chkTipoTelefoneClick
              end
            end
            object GroupBox5: TGroupBox
              Left = 264
              Top = 9
              Width = 277
              Height = 163
              Caption = 'Contatos'
              TabOrder = 4
              object dbgTelefoneRamal: TwwDBGrid
                Left = 9
                Top = 39
                Width = 253
                Height = 115
                Selected.Strings = (
                  'NOME'#9'20'#9'Contato'
                  'RAMAL'#9'5'#9'Ramal')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                DataSource = dsRamal
                Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                ParentShowHint = False
                ShowHint = False
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
                OnExit = dbgContatoRamalExit
                OnKeyDown = dbgTelefoneRamalKeyDown
                IndicatorColor = icBlack
              end
              object dblcContato: TCMDBLookupCombo
                Left = 75
                Top = 81
                Width = 121
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'25'#9'Nome'
                  'CARGO'#9'10'#9'Cargo')
                DataField = 'NOME'
                DataSource = dsRamal
                LookupTable = qryContato
                LookupField = 'NOME'
                Options = [loTitles]
                Style = csDropDownList
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = False
                ShowMatchText = True
                OnCloseUp = dblcContatoCloseUp
              end
              object DBNavigator1: TDBNavigator
                Left = 9
                Top = 15
                Width = 100
                Height = 20
                DataSource = dsRamal
                VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit]
                Ctl3D = True
                Hints.Strings = (
                  ' '
                  'Anterior'
                  'Próximo'
                  ' '
                  'Vincular'
                  'Desvincular'
                  'Editar')
                ParentCtl3D = False
                ParentShowHint = False
                ConfirmDelete = False
                ShowHint = True
                TabOrder = 2
              end
            end
          end
        end
        object tbsContato: TTabSheet
          Caption = 'Contatos'
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 1236
            Height = 410
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object mnbm: TLabel
              Left = 14
              Top = 97
              Width = 34
              Height = 13
              Caption = 'Cargo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPdeMail: TLabel
              Left = 14
              Top = 51
              Width = 35
              Height = 13
              Caption = 'E-mail'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPdNome: TLabel
              Left = 14
              Top = 6
              Width = 33
              Height = 13
              Caption = 'Nome'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPdSetor: TLabel
              Left = 207
              Top = 97
              Width = 31
              Height = 13
              Caption = 'Setor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblNasc: TLabel
              Left = 207
              Top = 51
              Width = 67
              Height = 13
              Caption = 'Nascimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblObs: TLabel
              Left = 14
              Top = 142
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
            object dbedcontatoemail: TDBEdit
              Left = 14
              Top = 65
              Width = 173
              Height = 21
              DataField = 'EMAIL'
              DataSource = dsContato
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object DBEdit2: TDBEdit
              Left = 14
              Top = 112
              Width = 173
              Height = 21
              DataField = 'CARGO'
              DataSource = dsContato
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object DBEdit3: TDBEdit
              Left = 207
              Top = 112
              Width = 121
              Height = 21
              DataField = 'SETOR'
              DataSource = dsContato
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object GroupBox6: TGroupBox
              Left = 348
              Top = 9
              Width = 190
              Height = 163
              Caption = 'Telefones'
              TabOrder = 6
              object dbgContatoRamal: TwwDBGrid
                Left = 8
                Top = 39
                Width = 164
                Height = 115
                Selected.Strings = (
                  'NUMERO'#9'10'#9'Telefone'
                  'RAMAL'#9'5'#9'Ramal')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                DataSource = dsRamal
                Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                ParentShowHint = False
                ShowHint = False
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
                OnExit = dbgContatoRamalExit
                OnKeyDown = dbgContatoRamalKeyDown
                IndicatorColor = icBlack
              end
              object DBNavigator2: TDBNavigator
                Left = 9
                Top = 15
                Width = 100
                Height = 20
                DataSource = dsRamal
                VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit]
                Ctl3D = True
                Hints.Strings = (
                  ' '
                  'Anterior'
                  'Próximo'
                  ' '
                  'Vincular'
                  'Desvincular'
                  'Editar')
                ParentCtl3D = False
                ParentShowHint = False
                ConfirmDelete = False
                ShowHint = True
                TabOrder = 1
              end
            end
            object dblcTelefone: TCMDBLookupCombo
              Left = 381
              Top = 99
              Width = 121
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NUMERO'#9'10'#9'Número'#9'No')
              DataField = 'NUMERO'
              DataSource = dsRamal
              LookupTable = qryTelefone
              LookupField = 'NUMERO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
              ShowMatchText = True
              OnCloseUp = dblcTelefoneCloseUp
            end
            object DBMemo1: TDBMemo
              Left = 14
              Top = 156
              Width = 314
              Height = 54
              DataField = 'OBS'
              DataSource = dsContato
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object dbedContatoNome: TDBEdit
              Left = 14
              Top = 20
              Width = 314
              Height = 21
              DataField = 'NOME'
              DataSource = dsContato
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBDateEdit2: TCMDateTimePicker
              Left = 208
              Top = 66
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'NASCIMENTO'
              DataSource = dsContato
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
          end
          object dbgContato: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1236
            Height = 410
            Selected.Strings = (
              'NOME'#9'25'#9'Nome'
              'CARGO'#9'10'#9'Cargo'#9'No'
              'SETOR'#9'10'#9'Setor'#9'No'
              'Telefone'#9'20'#9'Telefone')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsContato
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
        end
      end
      inherited Dock973: TDock97
        Width = 1334
        inherited tb97BotoesDetalhe: TToolbar97
          DockableTo = [dpTop]
        end
        object tb97TituloDetalhe: TToolbar97
          Left = 79
          Top = 0
          Caption = 'tb97TituloDetalhe'
          DockPos = 79
          TabOrder = 1
          object dbedPaiDetalhe: TwwDBEdit
            Left = 0
            Top = 1
            Width = 300
            Height = 22
            BorderStyle = bsNone
            Color = clGray
            Ctl3D = False
            DataField = 'NOME'
            DataSource = dsEndereco
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
      end
      inherited Dock974: TDock97
        Left = 1248
        Height = 438
        inherited tb97Detalhe: TToolbar97
          Visible = False
          inherited bbtnOkDet: TBitBtn
            TabOrder = 1
          end
          inherited bbtnCancelarDet: TBitBtn
            TabOrder = 0
          end
        end
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 1342
      Height = 105
      BevelOuter = bvRaised
      ParentShowHint = False
      object lblNome: TLabel
        Left = 152
        Top = 8
        Width = 85
        Height = 13
        Caption = 'Nome Fantasia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDocumento: TLabel
        Left = 16
        Top = 8
        Width = 5
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelRAZAOSOCIAL: TLabel
        Left = 16
        Top = 54
        Width = 76
        Height = 13
        Caption = 'Razão Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEMail: TLabel
        Left = 452
        Top = 8
        Width = 35
        Height = 13
        Caption = 'E-mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPdGrupo: TLabel
        Left = 455
        Top = 55
        Width = 35
        Height = 13
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 756
        Top = 66
        Width = 24
        Height = 24
        Hint = 'Escolhe o grupo a que pertence o registro'
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
          FFF0000000003333333BFBFBFBF0FFF000003333333FFFFFFF00000000003333
          333BFBFBF0FBFBFB00003333333F00000FF0000000003333333B0FFF0000FFF0
          00003333333F00000FF0000000003333330BFBFBF0FBFBFB000033333010FFFF
          FF0000000000333330180BFBFBF0FFF000003333301180FFFFF0000000003333
          0811190BFBFBFBFB0000333307719990FFFFFFFF0000333077FF999903333333
          000033077FFFF0003333333300003077FFF00333333333330000077FFF033333
          33333333000007FFF093333333333333000030FF093333333333333300003300
          33333333333333330000}
        OnClick = SpeedButton1Click
      end
      object LblHomePage_Padrao: TLabel
        Left = 586
        Top = 8
        Width = 66
        Height = 13
        Caption = 'Home Page'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblMsg: TLabel
        Left = 779
        Top = 20
        Width = 19
        Height = 13
        Caption = 'xxx'
        Color = 10395294
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentColor = False
        ParentFont = False
        Visible = False
      end
      object dbedNomeFantasia: TDBEdit
        Left = 152
        Top = 23
        Width = 289
        Height = 21
        Ctl3D = True
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnExit = dbedNomeFantasiaExit
      end
      object dbedDocumento: TwwDBEdit
        Left = 16
        Top = 23
        Width = 129
        Height = 21
        DataField = 'NUMDOCUMENTO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbedDocumentoExit
      end
      object dbedRazaoSocial: TDBEdit
        Left = 16
        Top = 68
        Width = 425
        Height = 21
        DataField = 'RAZAOSOCIAL'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object dbedemail: TwwDBEdit
        Left = 452
        Top = 23
        Width = 131
        Height = 21
        CharCase = ecLowerCase
        DataField = 'EMAIL'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edDBGrupo: TwwDBEdit
        Left = 452
        Top = 68
        Width = 302
        Height = 21
        DataField = 'NOMEGRUPO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnChange = edDBGrupoChange
        OnKeyDown = edDBGrupoKeyDown
        OnCheckValue = edDBGrupoCheckValue
      end
      object DbeHomePage_Padrao: TwwDBEdit
        Left = 586
        Top = 23
        Width = 189
        Height = 21
        CharCase = ecLowerCase
        DataField = 'HOMEPAGE'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1344
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 276
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
      end
      object sbtnFisJur: TToolbarButton97
        Left = 180
        Top = 0
        Width = 96
        Height = 41
        AllowAllUp = True
        DropdownCombo = True
        Caption = '&Física/Jurídica'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333FFF33F333FF3F330E0330FFFCCFCC33777FF7F3377F7730EEE030FFFC
          CFCC377777F7F33773770EEE0000FFFFFCCF777777773F33377FEEE0BFBF0FFF
          FCCF7777333373F337730E0BFBFBF0FFCCFF77733333373F77F330BFBFBFBF0F
          CCFF37F333333F7F773330FBFBFB0B0FFFFF37F3F33F737FFFFF30B0BF0FB000
          000037F73F73F777777730FB0BF0FB0FFFFF373F73F73F7F333F330030BF0F0F
          FF993F77373F737F3377CC33330BF00FFF9977FFF373F77F3F77CC993330009F
          99FF7777F337777F77F333993330F99F99FF3F77FF37F773773F993CC330FFF9
          9F9977F77F37F3377F77993CC330FFF99F997737733733377377}
        ImageIndex = 9
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        Visible = False
        OnClick = sbtnFisJurClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 651
    Width = 1344
    inherited tb97Fundo: TToolbar97
      Left = 610
      DockPos = 610
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 441
      DockPos = 441
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 681
    Top = 70
    TargetsData = (
      1
      4
      (
        ''
        'Items'
        0)
      (
        ''
        'Hints'
        0)
      (
        ''
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited dsDet: TwwDataSource
    Left = 402
    Top = 3
  end
  inherited ds: TwwDataSource
    Left = 584
    Top = 3
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  IDIMAGEM = :IDIMAGEM,'
      '  NOME = :NOME,'
      '  TIPO = :TIPO,'
      '  RAZAOSOCIAL = :RAZAOSOCIAL,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  EMAIL = :EMAIL,'
      '  IDGRUPO = :IDGRUPO,'
      '  IDENDCOMERCIAL = :IDENDCOMERCIAL,'
      '  IDENDRESIDENCIAL = :IDENDRESIDENCIAL,'
      '  IDENDENTREGA = :IDENDENTREGA,'
      '  IDENDCOBRANCA = :IDENDCOBRANCA,'
      '  IDENDCORRESP = :IDENDCORRESP,'
      '  HOMEPAGE = :HOMEPAGE,'
      '  IDMODULORESPON  = :IDMODULORESPON'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (IDPESSOA, IDIMAGEM, NOME, TIPO, RAZAOSOCIAL, NUMDOCUMENTO, '
      'IDDOCUMENTO, '
      
        '   EMAIL, IDGRUPO, IDENDCOMERCIAL, IDENDRESIDENCIAL, IDENDENTREG' +
        'A, '
      'IDENDCOBRANCA, '
      '   IDENDCORRESP, HOMEPAGE, IDMODULORESPON)'
      'values'
      
        '  (:IDPESSOA, :IDIMAGEM, :NOME, :TIPO, :RAZAOSOCIAL, :NUMDOCUMEN' +
        'TO, '
      ':IDDOCUMENTO, '
      '   :EMAIL, :IDGRUPO, :IDENDCOMERCIAL, :IDENDRESIDENCIAL, '
      ':IDENDENTREGA, '
      '   :IDENDCOBRANCA, :IDENDCORRESP, :HOMEPAGE, :IDMODULORESPON)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 614
    Top = 3
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Banco'
      'Razão Social'
      'Documento')
    Tabelas.Strings = (
      'PESSOA'
      'BANCO')
    CamposChave.Strings = (
      'BANCO.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '18')
    Left = 435
    Top = 3
  end
  inherited ImlPadrao: TImageList
    Left = 705
    Top = 32
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
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
      000000FFFF000000000000FFFF000000000000FFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF00000000
      000000000000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF000000000000FFFF
      0000FFFF00000000000000000000FFFF000000000000FFFF000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      000000000000C6C6C600FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600FFFFFF00C6C6C6000000000000FFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C60000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C6C6C600FF000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C600FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C600FFFFFF00C6C6C600FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00000000000000000000000000000000000000
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
      0000000000008484000084840000848400008484000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000084000000FF00000084000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000000000000000000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      84000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000848484008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      0000000000000000000000000000000000000000000084848400FFFF00008484
      0000848400000000000000000000848400008484000084840000848400008484
      00008484000000000000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0084848400000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      00008400000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      0000840000000000000000000000000000000000000084848400FFFF00008484
      0000FFFFFF00FFFFFF00FFFFFF00000000008484000084840000848400008484
      00008484000000000000000000000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      00008400000000000000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084840000848400008484
      000084840000848400000000000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      00008400000084000000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000848400008484
      000084840000848400000000000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF000000000000000000000000008484840000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      00008400000084000000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00000000008484
      000084840000848400000000000000000000848484000000FF00000084000000
      FF00000084000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00000084000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      00008400000084000000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF000000000084840000FFFFFF00FFFFFF00FFFFFF000000
      000084840000848400000000000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00848484000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      000084000000840000008400000000000000FFFFFF00FFFFFF00840000008400
      00008400000084000000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF00848400008484000084840000FFFFFF00FFFFFF000000
      000084840000848400000000000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000FFFFFF00FFFFFF00840000008400000000000000FFFFFF00FFFFFF008400
      0000840000008400000000000000000000000000000084848400FFFF00008484
      0000848400008484000084840000848400008484000084840000FFFFFF00FFFF
      FF008484000000000000000000000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      0000FFFFFF00FFFFFF00000000008400000000000000FFFFFF00FFFFFF008400
      0000840000000000000000000000000000000000000084848400FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      00008484000000000000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008400
      000084000000000000000000000000000000000000000000000084848400FFFF
      0000FFFF00008484000084840000848400008484000084840000848400008484
      0000000000000000000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      840000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000084848400FF00
      0000FF00000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      0000000000000000000000000000000000000000000000000000000000008484
      840084848400FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      8400848484000000FF000000FF000000FF000000FF000000FF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FF000000FF000000FF000000FF000000FF000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000FFFF0000FFFF008484840084848400000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000000000000000000000000000000000000000840000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000084000000
      8400000084000000840000008400FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000840000008400000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000FFFF0000FFFF000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF0000008400FFFFFF00FFFFFF00FF000000FFFF
      FF00000000000000000000000000000000000000840000008400000084000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000FFFF0000FFFF0000FFFF008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000008400FF000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000008400000084000000
      840000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF000000000000000000000000000000000000FFFF0000FF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000FFFFFF008484840084848400000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000084000000
      0000FFFF000000000000FFFF0000000000000000000084840000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000000000FF
      FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF000000FF000000
      0000FFFFFF00FFFFFF000000FF000000FF0000008400FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000FFFFFF00FFFF
      FF00FFFFFF0084848400848484000000000000000000000000000000000000FF
      FF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF00FFFF
      FF00FFFFFF00000000000000FF000000FF0000008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000FFFFFF008484
      840084848400000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      840000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF008484
      840084848400000000000000000000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000848484000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF00848484008484840084848400000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400848484000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000084008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      84000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFE00000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFF800000000000FFFFC00000000000
      E007800000000000F00F802000000000F81F003100000000FC3F001100000000
      FE7F003B00000000FFFF007F00000000FFFF007F00000000FFFF00FF00000000
      FFFF007F00000000FFFF80FF00000000FFFFFFFFFFFFFFFFF83FF83FF83FF83F
      E00FE00FE00FE00FC007C007C007C00786038003800380038103800380038003
      0081000100010001004100010001008102210001000100810211000100010101
      001100010001008180038003800382838003800380038023C007C007C007C007
      E00FE00FE00FE00FF83FF83FF83FF83FFEFFFF1FFFFFFF9FBC3DFC0FFF9FFE1F
      CC33F00FFE1FF81FC003E00FF81FE00FC007E007E00FE00FC00FF007E00F6007
      C007C003C0073007C003C001800710030000C00000038001C003E0012001C500
      E001E0071000CA81E003F0030401D507C003F0012007CA9FCC33F803801FD53F
      BEFDFC0FC1FFEA7FFEFFFE3FFFFFF0FF00000000000000000000000000000000
      000000000000}
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      ' PESSOA.IDPESSOA ,'
      ' PESSOA.IDIMAGEM,'
      ' PESSOA.NOME ,'
      ' PESSOA.TIPO ,'
      ' PESSOA.RAZAOSOCIAL ,'
      ' PESSOA.NUMDOCUMENTO ,'
      ' PESSOA.IDDOCUMENTO ,'
      ' PESSOA.EMAIL ,'
      ' PESSOA.IDGRUPO,'
      ' PESSOA.IDENDCOMERCIAL,'
      ' PESSOA.IDENDRESIDENCIAL,'
      ' PESSOA.IDENDENTREGA,'
      ' PESSOA.IDENDCOBRANCA,'
      ' PESSOA.IDENDCORRESP,'
      ' G.NOME AS NOMEGRUPO,'
      ' PESSOA.HOMEPAGE,'
      ' PESSOA.IDMODULORESPON,'
      ' MODULO.NOMEMODULO'
      ''
      'FROM PESSOA, PESSOA g, MODULO'
      'WHERE ( PESSOA.IDPESSOA =:IdPessoa )  AND'
      '      ( PESSOA.IDGRUPO = G.IDPESSOA(+) ) AND'
      '      ( PESSOA.IDMODULORESPON = MODULO.IDMODULO(+) )'
      ' '
      ' ')
    UpdateMode = upWhereKeyOnly
    PictureMasks.Strings = (
      'NOMEGRUPO'#9'*@'#9'T'#9'F')
    Left = 553
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      OnChange = qryNOMEChange
      Size = 60
    end
    object qryTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'PESSOA.TIPO'
      Size = 1
    end
    object qryRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'PESSOA.NUMDOCUMENTO'
      Size = 18
    end
    object qryIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'PESSOA.IDDOCUMENTO'
    end
    object qryEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'PESSOA.EMAIL'
      Size = 100
    end
    object qryIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'PESSOA.IDGRUPO'
    end
    object qryIDIMAGEM: TFloatField
      FieldName = 'IDIMAGEM'
      Origin = 'PESSOA.IDIMAGEM'
    end
    object qryNOMEGRUPO: TStringField
      FieldName = 'NOMEGRUPO'
      Size = 60
    end
    object qryIDENDCOMERCIAL: TFloatField
      FieldName = 'IDENDCOMERCIAL'
    end
    object qryIDENDRESIDENCIAL: TFloatField
      FieldName = 'IDENDRESIDENCIAL'
    end
    object qryIDENDENTREGA: TFloatField
      FieldName = 'IDENDENTREGA'
    end
    object qryIDENDCOBRANCA: TFloatField
      FieldName = 'IDENDCOBRANCA'
    end
    object qryIDENDCORRESP: TFloatField
      FieldName = 'IDENDCORRESP'
    end
    object qryHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 250
    end
    object qryIDMODULORESPON: TFloatField
      FieldName = 'IDMODULORESPON'
    end
    object qryNOMEMODULO: TStringField
      FieldName = 'NOMEMODULO'
      FixedChar = True
      Size = 50
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 348
  end
  object updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update "BANCO"'
      'set'
      '  NUMBANCO = :NUMBANCO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into "BANCO"'
      '  (IDPESSOA, NUMBANCO)'
      'values'
      '  (:IDPESSOA, :NUMBANCO)')
    DeleteSQL.Strings = (
      'delete from "BANCO"'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 745
    Top = 552
  end
  object qrySubTipo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BANCO.IDPESSOA , BANCO.NUMBANCO'
      'FROM BANCO'
      'WHERE ( BANCO.IDPESSOA =:IdPessoa )')
    UpdateObject = updSubTipo
    ValidateWithMask = True
    Left = 217
    Top = 543
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
  end
  object dsSubTipo: TwwDataSource
    AutoEdit = False
    DataSet = qrySubTipo
    Left = 745
    Top = 484
  end
  object dsPessoaFisica: TwwDataSource
    AutoEdit = False
    DataSet = qryPessoaFisica
    Left = 745
    Top = 9
  end
  object updPessoaFisica: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOAFISICA'
      'set'
      '  VLRINSS = :VLRINSS,'
      '  VLRPENSAO = :VLRPENSAO,'
      '  IDCIDADES = :IDCIDADES,'
      '  PERCIRRFJUD = :PERCIRRFJUD,'
      '  STATUSPROCJUD = :STATUSPROCJUD,'
      '  DATACONCLIMINAR = :DATACONCLIMINAR,'
      '  DATACONCJULG = :DATACONCJULG,'
      '  VLRTOTCOMPIR = :VLRTOTCOMPIR,'
      '  VLRPARCCOMPIR = :VLRPARCCOMPIR,'
      '  INICIOCOMPIR = :INICIOCOMPIR,'
      '  VLRENQUADRAMENTO = :VLRENQUADRAMENTO,'
      '  INICIOINVALIDEZ = :INICIOINVALIDEZ,'
      '  FIMINVALIDEZ = :FIMINVALIDEZ,'
      '  FLGDESTCC = :FLGDESTCC,'
      '  IDSINDICATO = :IDSINDICATO,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODESTADO = :CODESTADO,'
      '  IDPAIS = :IDPAIS,'
      '  IDFONTRECR = :IDFONTRECR,'
      '  IDGRINSTR = :IDGRINSTR,'
      '  IDPROFISS = :IDPROFISS,'
      '  NOMEPAI = :NOMEPAI,'
      '  NOMEMAE = :NOMEMAE,'
      '  DATAMORTE = :DATAMORTE,'
      '  DATANASC = :DATANASC,'
      '  SEXO = :SEXO,'
      '  TIPOSANG = :TIPOSANG,'
      '  ESTCIVIL = :ESTCIVIL,'
      '  NUMDEPIRRF = :NUMDEPIRRF,'
      '  NUMDEPSALF = :NUMDEPSALF,'
      '  NUMDEPTOT = :NUMDEPTOT,'
      '  FLGISENTOIRRF = :FLGISENTOIRRF,'
      '  IDESTADO = :IDESTADO,'
      '  CORPESSOA = :CORPESSOA,'
      '  FLGDEFICIENTE = :FLGDEFICIENTE,'
      '  FLGMOLESTIAGRAVE = :FLGMOLESTIAGRAVE,'
      '  DATAMOLESTIAGRAVE = :DATAMOLESTIAGRAVE,'
      '  FLGSOMAIRSUPINSS = :FLGSOMAIRSUPINSS'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOAFISICA'
      
        '  (VLRINSS, VLRPENSAO, IDCIDADES, PERCIRRFJUD, STATUSPROCJUD, DA' +
        'TACONCLIMINAR, '
      
        '   DATACONCJULG, VLRTOTCOMPIR, VLRPARCCOMPIR, INICIOCOMPIR, VLRE' +
        'NQUADRAMENTO, '
      
        '   INICIOINVALIDEZ, FIMINVALIDEZ, FLGDESTCC, IDSINDICATO, IDPESS' +
        'OA, CODESTADO, '
      
        '   IDPAIS, IDFONTRECR, IDGRINSTR, IDPROFISS, NOMEPAI, NOMEMAE, D' +
        'ATAMORTE, '
      
        '   DATANASC, SEXO, TIPOSANG, ESTCIVIL, NUMDEPIRRF, NUMDEPSALF, N' +
        'UMDEPTOT, '
      
        '   FLGISENTOIRRF, IDESTADO, CORPESSOA, FLGDEFICIENTE, FLGMOLESTI' +
        'AGRAVE, '
      '   DATAMOLESTIAGRAVE, FLGSOMAIRSUPINSS)'
      'values'
      
        '  (:VLRINSS, :VLRPENSAO, :IDCIDADES, :PERCIRRFJUD, :STATUSPROCJU' +
        'D, :DATACONCLIMINAR, '
      
        '   :DATACONCJULG, :VLRTOTCOMPIR, :VLRPARCCOMPIR, :INICIOCOMPIR, ' +
        ':VLRENQUADRAMENTO, '
      
        '   :INICIOINVALIDEZ, :FIMINVALIDEZ, :FLGDESTCC, :IDSINDICATO, :I' +
        'DPESSOA, '
      
        '   :CODESTADO, :IDPAIS, :IDFONTRECR, :IDGRINSTR, :IDPROFISS, :NO' +
        'MEPAI, '
      
        '   :NOMEMAE, :DATAMORTE, :DATANASC, :SEXO, :TIPOSANG, :ESTCIVIL,' +
        ' :NUMDEPIRRF, '
      
        '   :NUMDEPSALF, :NUMDEPTOT, :FLGISENTOIRRF, :IDESTADO, :CORPESSO' +
        'A, :FLGDEFICIENTE, '
      '   :FLGMOLESTIAGRAVE, :DATAMOLESTIAGRAVE, :FLGSOMAIRSUPINSS)')
    DeleteSQL.Strings = (
      'delete from PESSOAFISICA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 745
    Top = 100
  end
  object qryPessoaFisica: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   VLRINSS, VLRPENSAO, IDCIDADES, PERCIRRFJUD, STATUSPROCJUD, DA' +
        'TACONCLIMINAR, DATACONCJULG,'
      
        '   VLRTOTCOMPIR, VLRPARCCOMPIR, INICIOCOMPIR, VLRENQUADRAMENTO, ' +
        'INICIOINVALIDEZ, FIMINVALIDEZ,'
      
        '   FLGDESTCC, IDSINDICATO, IDPESSOA, CODESTADO, IDPAIS, IDFONTRE' +
        'CR, IDGRINSTR, IDPROFISS, NOMEPAI,'
      
        '   NOMEMAE, DATAMORTE, DATANASC, SEXO, TIPOSANG, ESTCIVIL, NUMDE' +
        'PIRRF, NUMDEPSALF, NUMDEPTOT,'
      
        '   FLGISENTOIRRF, IDESTADO, CORPESSOA, FLGDEFICIENTE, FLGMOLESTI' +
        'AGRAVE, DATAMOLESTIAGRAVE,'
      '   FLGSOMAIRSUPINSS'
      'FROM'
      '   PESSOAFISICA'
      'WHERE'
      '   ( PESSOAFISICA.IDPESSOA =:IdPessoa )'
      ''
      ''
      '')
    UpdateObject = updPessoaFisica
    ValidateWithMask = True
    Left = 289
    Top = 628
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
    object qryPessoaFisicaVLRINSS: TFloatField
      FieldName = 'VLRINSS'
      Origin = 'BASEDADOS.PESSOAFISICA.VLRINSS'
    end
    object qryPessoaFisicaVLRPENSAO: TFloatField
      FieldName = 'VLRPENSAO'
      Origin = 'BASEDADOS.PESSOAFISICA.VLRPENSAO'
    end
    object qryPessoaFisicaIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
      Origin = 'BASEDADOS.PESSOAFISICA.IDCIDADES'
    end
    object qryPessoaFisicaPERCIRRFJUD: TFloatField
      FieldName = 'PERCIRRFJUD'
      Origin = 'BASEDADOS.PESSOAFISICA.PERCIRRFJUD'
    end
    object qryPessoaFisicaSTATUSPROCJUD: TFloatField
      FieldName = 'STATUSPROCJUD'
      Origin = 'BASEDADOS.PESSOAFISICA.STATUSPROCJUD'
    end
    object qryPessoaFisicaDATACONCLIMINAR: TDateTimeField
      FieldName = 'DATACONCLIMINAR'
      Origin = 'BASEDADOS.PESSOAFISICA.DATACONCLIMINAR'
    end
    object qryPessoaFisicaDATACONCJULG: TDateTimeField
      FieldName = 'DATACONCJULG'
      Origin = 'BASEDADOS.PESSOAFISICA.DATACONCJULG'
    end
    object qryPessoaFisicaVLRTOTCOMPIR: TFloatField
      FieldName = 'VLRTOTCOMPIR'
      Origin = 'BASEDADOS.PESSOAFISICA.VLRTOTCOMPIR'
    end
    object qryPessoaFisicaVLRPARCCOMPIR: TFloatField
      FieldName = 'VLRPARCCOMPIR'
      Origin = 'BASEDADOS.PESSOAFISICA.VLRPARCCOMPIR'
    end
    object qryPessoaFisicaINICIOCOMPIR: TStringField
      FieldName = 'INICIOCOMPIR'
      Origin = 'BASEDADOS.PESSOAFISICA.INICIOCOMPIR'
      FixedChar = True
      Size = 7
    end
    object qryPessoaFisicaVLRENQUADRAMENTO: TFloatField
      FieldName = 'VLRENQUADRAMENTO'
      Origin = 'BASEDADOS.PESSOAFISICA.VLRENQUADRAMENTO'
    end
    object qryPessoaFisicaINICIOINVALIDEZ: TDateTimeField
      FieldName = 'INICIOINVALIDEZ'
      Origin = 'BASEDADOS.PESSOAFISICA.INICIOINVALIDEZ'
    end
    object qryPessoaFisicaFIMINVALIDEZ: TDateTimeField
      FieldName = 'FIMINVALIDEZ'
      Origin = 'BASEDADOS.PESSOAFISICA.FIMINVALIDEZ'
    end
    object qryPessoaFisicaFLGDESTCC: TFloatField
      FieldName = 'FLGDESTCC'
      Origin = 'BASEDADOS.PESSOAFISICA.FLGDESTCC'
    end
    object qryPessoaFisicaIDSINDICATO: TFloatField
      FieldName = 'IDSINDICATO'
      Origin = 'BASEDADOS.PESSOAFISICA.IDSINDICATO'
    end
    object qryPessoaFisicaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOAFISICA.IDPESSOA'
    end
    object qryPessoaFisicaCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Origin = 'BASEDADOS.PESSOAFISICA.CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryPessoaFisicaIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'BASEDADOS.PESSOAFISICA.IDPAIS'
    end
    object qryPessoaFisicaIDFONTRECR: TFloatField
      FieldName = 'IDFONTRECR'
      Origin = 'BASEDADOS.PESSOAFISICA.IDFONTRECR'
    end
    object qryPessoaFisicaIDGRINSTR: TFloatField
      FieldName = 'IDGRINSTR'
      Origin = 'BASEDADOS.PESSOAFISICA.IDGRINSTR'
    end
    object qryPessoaFisicaIDPROFISS: TFloatField
      FieldName = 'IDPROFISS'
      Origin = 'BASEDADOS.PESSOAFISICA.IDPROFISS'
    end
    object qryPessoaFisicaNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      Origin = 'BASEDADOS.PESSOAFISICA.NOMEPAI'
      Size = 50
    end
    object qryPessoaFisicaNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      Origin = 'BASEDADOS.PESSOAFISICA.NOMEMAE'
      Size = 50
    end
    object qryPessoaFisicaDATAMORTE: TDateTimeField
      FieldName = 'DATAMORTE'
      Origin = 'BASEDADOS.PESSOAFISICA.DATAMORTE'
    end
    object qryPessoaFisicaDATANASC: TDateTimeField
      FieldName = 'DATANASC'
      Origin = 'BASEDADOS.PESSOAFISICA.DATANASC'
    end
    object qryPessoaFisicaSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'BASEDADOS.PESSOAFISICA.SEXO'
      FixedChar = True
      Size = 1
    end
    object qryPessoaFisicaTIPOSANG: TStringField
      FieldName = 'TIPOSANG'
      Origin = 'BASEDADOS.PESSOAFISICA.TIPOSANG'
      Size = 3
    end
    object qryPessoaFisicaESTCIVIL: TStringField
      FieldName = 'ESTCIVIL'
      Origin = 'BASEDADOS.PESSOAFISICA.ESTCIVIL'
      FixedChar = True
      Size = 1
    end
    object qryPessoaFisicaNUMDEPIRRF: TFloatField
      FieldName = 'NUMDEPIRRF'
      Origin = 'BASEDADOS.PESSOAFISICA.NUMDEPIRRF'
    end
    object qryPessoaFisicaNUMDEPSALF: TFloatField
      FieldName = 'NUMDEPSALF'
      Origin = 'BASEDADOS.PESSOAFISICA.NUMDEPSALF'
    end
    object qryPessoaFisicaNUMDEPTOT: TFloatField
      FieldName = 'NUMDEPTOT'
      Origin = 'BASEDADOS.PESSOAFISICA.NUMDEPTOT'
    end
    object qryPessoaFisicaFLGISENTOIRRF: TFloatField
      FieldName = 'FLGISENTOIRRF'
      Origin = 'BASEDADOS.PESSOAFISICA.FLGISENTOIRRF'
    end
    object qryPessoaFisicaIDESTADO: TFloatField
      FieldName = 'IDESTADO'
      Origin = 'BASEDADOS.PESSOAFISICA.IDESTADO'
    end
    object qryPessoaFisicaCORPESSOA: TFloatField
      FieldName = 'CORPESSOA'
      Origin = 'BASEDADOS.PESSOAFISICA.CORPESSOA'
    end
    object qryPessoaFisicaFLGDEFICIENTE: TFloatField
      FieldName = 'FLGDEFICIENTE'
      Origin = 'BASEDADOS.PESSOAFISICA.FLGDEFICIENTE'
    end
    object qryPessoaFisicaFLGMOLESTIAGRAVE: TFloatField
      FieldName = 'FLGMOLESTIAGRAVE'
      Origin = 'BASEDADOS.PESSOAFISICA.FLGMOLESTIAGRAVE'
    end
    object qryPessoaFisicaDATAMOLESTIAGRAVE: TDateTimeField
      FieldName = 'DATAMOLESTIAGRAVE'
      Origin = 'BASEDADOS.PESSOAFISICA.DATAMOLESTIAGRAVE'
    end
    object qryPessoaFisicaFLGSOMAIRSUPINSS: TFloatField
      FieldName = 'FLGSOMAIRSUPINSS'
      Origin = 'BASEDADOS.PESSOAFISICA.FLGSOMAIRSUPINSS'
    end
  end
  object ImageList1: TImageList
    Left = 745
    Top = 439
    Bitmap = {
      494C010102000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
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
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      8400000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      8400848484000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      8400848484000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF000000008001800100000000
      0001000100000000000100010000000000010001000000000001000100000000
      0001000300000000000100000000000000010000000000000001000000000000
      00010000000000000003000000000000F39FF80000000000F01FF80000000000
      F03FFD0500000000FFFFFF8F0000000000000000000000000000000000000000
      000000000000}
  end
  object qryTelefone: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryTelefoneCalcFields
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT TELENDPESS.IDTELEFONE , '
      ' ENDPESS.IDPESSOA , '
      ' TELENDPESS.IDENDERECO , '
      ' TELENDPESS.DDI , TELENDPESS.DDD , '
      ' TELENDPESS.NUMERO , '
      ' TELENDPESS.TIPO'
      'FROM TELENDPESS , ENDPESS'
      'WHERE '
      ' ( ENDPESS.IDPESSOA =:IdPessoa )'
      ' AND'
      '( TELENDPESS.IDENDERECO = ENDPESS.IDENDERECO )')
    UpdateObject = updTelefone
    ValidateWithMask = True
    Left = 369
    Top = 377
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
    object qryTelefoneDDD: TStringField
      DisplayWidth = 5
      FieldName = 'DDD'
      Origin = 'TELENDPESS.DDD'
      Size = 5
    end
    object qryTelefoneDDI: TStringField
      DisplayWidth = 4
      FieldName = 'DDI'
      Origin = 'TELENDPESS.DDI'
      Size = 4
    end
    object qryTelefoneTComercial: TStringField
      DisplayLabel = 'Com'
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = 'TComercial'
      Calculated = True
    end
    object qryTelefoneTParticular: TStringField
      DisplayLabel = 'Part'
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = 'TParticular'
      Calculated = True
    end
    object qryTelefoneTFax: TStringField
      DisplayLabel = 'Fax'
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = 'TFax'
      Calculated = True
    end
    object qryTelefoneTCelular: TStringField
      DisplayLabel = 'Cel'
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = 'TCelular'
      Calculated = True
    end
    object qryTelefoneTRecado: TStringField
      DisplayLabel = 'Rec'
      DisplayWidth = 3
      FieldKind = fkCalculated
      FieldName = 'TRecado'
      Calculated = True
    end
    object qryTelefoneIDTELEFONE: TFloatField
      FieldName = 'IDTELEFONE'
      Origin = 'TELENDPESS.IDTELEFONE'
      Visible = False
    end
    object qryTelefoneIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'ENDPESS.IDPESSOA'
      Visible = False
    end
    object qryTelefoneIDENDERECO: TFloatField
      FieldName = 'IDENDERECO'
      Origin = 'TELENDPESS.IDENDERECO'
      Visible = False
    end
    object qryTelefoneTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TELENDPESS.TIPO'
      Visible = False
      Size = 5
    end
    object qryTelefoneNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'TELENDPESS.NUMERO'
    end
  end
  object updTelefone: TUpdateSQL
    ModifySQL.Strings = (
      'update TELENDPESS'
      'set'
      '  IDTELEFONE = :IDTELEFONE,'
      '  IDENDERECO = :IDENDERECO,'
      '  DDI = :DDI,'
      '  DDD = :DDD,'
      '  NUMERO = :NUMERO,'
      '  TIPO = :TIPO'
      'where'
      '  IDTELEFONE = :OLD_IDTELEFONE')
    InsertSQL.Strings = (
      'insert into TELENDPESS'
      '  (IDTELEFONE, IDENDERECO, DDI, DDD, NUMERO, TIPO)'
      'values'
      '  (:IDTELEFONE, :IDENDERECO, :DDI, :DDD, :NUMERO, :TIPO)')
    DeleteSQL.Strings = (
      'delete from TELENDPESS'
      'where'
      '  IDTELEFONE = :OLD_IDTELEFONE')
    Left = 745
    Top = 235
  end
  object dsTelefone: TwwDataSource
    AutoEdit = False
    DataSet = qryTelefone
    OnDataChange = dsTelefoneDataChange
    Left = 745
    Top = 326
  end
  object dsEndereco: TwwDataSource
    AutoEdit = False
    DataSet = qryEndereco
    OnDataChange = dsEnderecoDataChange
    Left = 745
    Top = 462
  end
  object updEndereco: TUpdateSQL
    ModifySQL.Strings = (
      'update ENDPESS'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDENDERECO = :IDENDERECO,'
      '  IDCIDADES = :IDCIDADES,'
      '  LOGRADOURO = :LOGRADOURO,'
      '  NUMERO = :NUMERO,'
      '  COMPLEMENTO = :COMPLEMENTO,'
      '  BAIRRO = :BAIRRO,'
      '  CIDADE = :CIDADE,'
      '  NOME = :NOME,'
      '  CEP = :CEP'
      'where'
      '  IDENDERECO = :OLD_IDENDERECO')
    InsertSQL.Strings = (
      'insert into ENDPESS'
      
        '  (IDPESSOA, IDENDERECO, IDCIDADES, LOGRADOURO, NUMERO, COMPLEME' +
        'NTO, BAIRRO, '
      '   CIDADE, NOME, CEP)'
      'values'
      
        '  (:IDPESSOA, :IDENDERECO, :IDCIDADES, :LOGRADOURO, :NUMERO, :CO' +
        'MPLEMENTO, '
      '   :BAIRRO, :CIDADE, :NOME, :CEP)')
    DeleteSQL.Strings = (
      'delete from ENDPESS'
      'where'
      '  IDENDERECO = :OLD_IDENDERECO')
    Left = 745
    Top = 394
  end
  object qryEndereco: TwwQuery
    CachedUpdates = True
    BeforeDelete = qryEnderecoBeforeDelete
    OnCalcFields = qryEnderecoCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ENDPESS.IDPESSOA ,'
      '  ENDPESS.IDENDERECO ,'
      '  ENDPESS.IDCIDADES ,'
      '  ENDPESS.LOGRADOURO ,'
      '  ENDPESS.NUMERO ,'
      '  ENDPESS.COMPLEMENTO ,'
      '  ENDPESS.BAIRRO ,'
      '  ENDPESS.CIDADE ,'
      '  ENDPESS.NOME ,'
      '  ENDPESS.CEP ,'
      '  ENDPESS.IDCIDADES,'
      '  C.NOME AS NOMECIDADE,'
      '  E.NOMEESTADO,'
      '  P.NOMEPAIS'
      'FROM'
      '  ENDPESS,'
      '  CIDADES C,'
      '  ESTADO E,'
      '  PAIS P'
      'WHERE'
      ' (E.IDPAIS = P.IDPAIS(+)) AND'
      ' (E.IDESTADO(+) = C.IDESTADO) AND'
      ' (C.IDCIDADES(+) = ENDPESS.IDCIDADES ) AND'
      ' ( ENDPESS.IDPESSOA = :IdPessoa )'
      ' ')
    UpdateMode = upWhereKeyOnly
    UpdateObject = updEndereco
    ValidateWithMask = True
    Left = 225
    Top = 587
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
    object qryEnderecoNOME: TStringField
      DisplayLabel = 'Local'
      DisplayWidth = 20
      FieldName = 'NOME'
      Origin = 'ENDPESS.NOME'
      Size = 40
    end
    object qryEnderecoLOGRADOURO: TStringField
      DisplayLabel = 'Logradouro'
      DisplayWidth = 20
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object qryEnderecoTIPOEND_PADRAO: TStringField
      DisplayLabel = 'Tipo de Endereço'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'TIPOEND_PADRAO'
      Size = 60
      Calculated = True
    end
    object qryEnderecoNUMERO: TStringField
      DisplayLabel = 'Número'
      DisplayWidth = 8
      FieldName = 'NUMERO'
      Origin = 'ENDPESS.NUMERO'
      Size = 8
    end
    object qryEnderecoCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      DisplayWidth = 10
      FieldName = 'COMPLEMENTO'
      Origin = 'ENDPESS.COMPLEMENTO'
    end
    object qryEnderecoBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 10
      FieldName = 'BAIRRO'
      Origin = 'ENDPESS.BAIRRO'
    end
    object qryEnderecoCEP: TStringField
      DisplayWidth = 10
      FieldName = 'CEP'
      Origin = 'ENDPESS.CEP'
      Size = 8
    end
    object qryEnderecoNOMECIDADE: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 20
      FieldName = 'NOMECIDADE'
      Size = 50
    end
    object qryEnderecoNOMEESTADO: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 20
      FieldName = 'NOMEESTADO'
      Size = 30
    end
    object qryEnderecoNOMEPAIS: TStringField
      DisplayLabel = 'Pais'
      DisplayWidth = 20
      FieldName = 'NOMEPAIS'
      Size = 30
    end
    object qryEnderecoCIDADE: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 10
      FieldName = 'CIDADE'
      Origin = 'ENDPESS.CIDADE'
      Visible = False
    end
    object qryEnderecoIDPESSOA: TFloatField
      DisplayWidth = 15
      FieldName = 'IDPESSOA'
      Origin = 'ENDPESS.IDPESSOA'
      Visible = False
    end
    object qryEnderecoIDENDERECO: TFloatField
      DisplayWidth = 15
      FieldName = 'IDENDERECO'
      Origin = 'ENDPESS.IDENDERECO'
      Visible = False
    end
    object qryEnderecoIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
      Origin = 'ENDPESS.IDCIDADES'
      Visible = False
      OnChange = qryEnderecoIDCIDADESChange
    end
  end
  object qryContato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT '
      '   CONTATOPESS.IDCONTATO , '
      '   ENDPESS.IDPESSOA , '
      '   CONTATOPESS.IDENDERECO , '
      '   CONTATOPESS.NOME , '
      '   CONTATOPESS.EMAIL , '
      '   CONTATOPESS.CARGO , '
      '   CONTATOPESS.SETOR,'
      '   CONTATOPESS.NASCIMENTO,'
      '   CONTATOPESS.OBS'
      'FROM CONTATOPESS , ENDPESS'
      'WHERE '
      '  ( ENDPESS.IDPESSOA =:IdPessoa )'
      ' AND'
      ' ( CONTATOPESS.IDENDERECO = ENDPESS.IDENDERECO )')
    UpdateObject = updContato
    ValidateWithMask = True
    Left = 377
    Top = 616
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
    object qryContatoIDCONTATO: TFloatField
      FieldName = 'IDCONTATO'
      Origin = 'CONTATOPESS.IDCONTATO'
    end
    object qryContatoIDENDERECO: TFloatField
      FieldName = 'IDENDERECO'
      Origin = 'CONTATOPESS.IDENDERECO'
    end
    object qryContatoEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'CONTATOPESS.EMAIL'
      Size = 40
    end
    object qryContatoCARGO: TStringField
      FieldName = 'CARGO'
      Origin = 'CONTATOPESS.CARGO'
      Size = 30
    end
    object qryContatoSETOR: TStringField
      FieldName = 'SETOR'
      Origin = 'CONTATOPESS.SETOR'
      Size = 30
    end
    object qryContatoTelefone: TStringField
      FieldKind = fkLookup
      FieldName = 'Telefone'
      LookupDataSet = qryRamal
      LookupKeyFields = 'IDCONTATO'
      LookupResultField = 'NUMERO'
      KeyFields = 'IDCONTATO'
      Lookup = True
    end
    object qryContatoNASCIMENTO: TDateTimeField
      FieldName = 'NASCIMENTO'
      Origin = 'CONTATOPESS.NASCIMENTO'
    end
    object qryContatoOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'CONTATOPESS.OBS'
      BlobType = ftMemo
      Size = 500
    end
    object qryContatoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'CONTATOPESS.NOME'
      Size = 50
    end
    object qryContatoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.ENDPESS".IDPESSOA'
    end
  end
  object updContato: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTATOPESS'
      'set'
      '  IDCONTATO = :IDCONTATO,'
      '  IDENDERECO = :IDENDERECO,'
      '  NOME = :NOME,'
      '  EMAIL = :EMAIL,'
      '  CARGO = :CARGO,'
      '  SETOR = :SETOR,'
      '  NASCIMENTO = :NASCIMENTO,'
      '  OBS = :OBS'
      'where'
      '  IDCONTATO = :OLD_IDCONTATO')
    InsertSQL.Strings = (
      'insert into CONTATOPESS'
      
        '  (IDCONTATO, IDENDERECO, NOME, EMAIL, CARGO, SETOR, NASCIMENTO,' +
        ' OBS)'
      'values'
      
        '  (:IDCONTATO, :IDENDERECO, :NOME, :EMAIL, :CARGO, :SETOR, :NASC' +
        'IMENTO, '
      '   :OBS)')
    DeleteSQL.Strings = (
      'delete from CONTATOPESS'
      'where'
      '  IDCONTATO = :OLD_IDCONTATO')
    Left = 745
    Top = 348
  end
  object dsContato: TwwDataSource
    AutoEdit = False
    DataSet = qryContato
    Left = 745
    Top = 303
  end
  object qryRamal: TwwQuery
    CachedUpdates = True
    AfterInsert = qryRamalAfterInsert
    OnUpdateError = qryRamalUpdateError
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT '
      ' TELCONTATO.IDTELCONTATO,'
      ' TELCONTATO.IDCONTATO , '
      ' TELCONTATO.IDTELEFONE , '
      ' TELCONTATO.RAMAL , '
      ' TELENDPESS.NUMERO , '
      ' CONTATOPESS.NOME'
      'FROM CONTATOPESS , ENDPESS ,TELCONTATO , TELENDPESS'
      'WHERE '
      ' ( ENDPESS.IDPESSOA =:IdPessoa )'
      ' AND'
      ' ( TELCONTATO.IDCONTATO = CONTATOPESS.IDCONTATO )'
      '  AND'
      ' ( TELCONTATO.IDTELEFONE = TELENDPESS.IDTELEFONE )'
      '  AND'
      ' ( CONTATOPESS.IDENDERECO = ENDPESS.IDENDERECO )'
      '  AND'
      ' ( TELENDPESS.IDENDERECO = ENDPESS.IDENDERECO )')
    UpdateObject = updRamal
    ControlType.Strings = (
      'NUMERO;CustomEdit;dblcTelefone'
      'NOME;CustomEdit;dblcContato')
    ValidateWithMask = True
    Left = 321
    Top = 475
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
    object qryRamalIDCONTATO: TFloatField
      FieldName = 'IDCONTATO'
      Origin = 'TELCONTATO.IDCONTATO'
    end
    object qryRamalIDTELEFONE: TFloatField
      FieldName = 'IDTELEFONE'
      Origin = 'TELCONTATO.IDTELEFONE'
    end
    object qryRamalRAMAL: TStringField
      FieldName = 'RAMAL'
      Origin = 'TELCONTATO.RAMAL'
    end
    object qryRamalNUMERO: TStringField
      DisplayWidth = 20
      FieldName = 'NUMERO'
      Origin = 'TELENDPESS.NUMERO'
    end
    object qryRamalNOME: TStringField
      FieldName = 'NOME'
      Origin = 'CONTATOPESS.NOME'
      Size = 50
    end
    object qryRamalIDTELCONTATO: TFloatField
      FieldName = 'IDTELCONTATO'
      Origin = 'TELCONTATO.IDTELCONTATO'
    end
  end
  object updRamal: TUpdateSQL
    ModifySQL.Strings = (
      'update TELCONTATO'
      'set'
      '  IDTELCONTATO = :IDTELCONTATO,'
      '  IDCONTATO = :IDCONTATO,'
      '  IDTELEFONE = :IDTELEFONE,'
      '  RAMAL = :RAMAL'
      'where'
      '  IDTELCONTATO = :OLD_IDTELCONTATO')
    InsertSQL.Strings = (
      'insert into TELCONTATO'
      '  (IDTELCONTATO, IDCONTATO, IDTELEFONE, RAMAL)'
      'values'
      '  (:IDTELCONTATO, :IDCONTATO, :IDTELEFONE, :RAMAL)')
    DeleteSQL.Strings = (
      'delete from TELCONTATO'
      'where'
      '  IDTELCONTATO = :OLD_IDTELCONTATO')
    Left = 745
    Top = 507
  end
  object dsRamal: TwwDataSource
    DataSet = qryRamal
    Left = 745
    Top = 258
  end
  object qryDocumento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' TIPODOCPESSOA.IDDOCUMENTO, '
      ' TIPODOCPESSOA.NOMEDOCUMENTO , '
      ' TIPODOCPESSOA.MASCARA, '
      ' TIPODOCPESSOA.OBRIGAUF , '
      ' TIPODOCPESSOA.OBRIGAORGAO , '
      ' TIPODOCPESSOA.OBRIGAEMISSAO ,'
      ' DOCPESSOA.IDPESSOA,'
      ' DOCPESSOA.IDIMAGEM ,'
      ' DOCPESSOA.IDPAIS ,'
      ' DOCPESSOA.IDESTADO ,'
      ' DOCPESSOA.NUMDOCUMENTO,'
      ' DOCPESSOA.ORGAO ,'
      ' DOCPESSOA.DATAEMISSAO,'
      ' TIPODOCPESSOA.FLGOBRIGAVALIDADE,'
      ' DOCPESSOA.DATAVALIDADE, '
      ' DOCPESSOA.DTPRIMEIRACNH, '
      '  DOCPESSOA.CATEGCNH,'
      ' TIPODOCPESSOA.OBRIGAPRMHAB, '
      ' TIPODOCPESSOA.OBRIGACATG'
      ' ,TIPODOCPESSOA.EXIBEUF   '
      ' ,TIPODOCPESSOA.EXIBEORGAO   '
      ' ,TIPODOCPESSOA.EXIBEEMISSAO   '
      ' ,TIPODOCPESSOA.EXIBEVALIDADE   '
      ' ,TIPODOCPESSOA.EXIBEPRMHAB   '
      ' ,TIPODOCPESSOA.EXIBECATG   '
      ' ,TIPODOCPESSOA.EXIBEPAIS   '
      ' ,TIPODOCPESSOA.OBRIGAPAIS'
      ' ,DOCPESSOA.IDTIPODOCPESSOAXMASC'
      ' ,TIPODOCPESSOA.FLGMULTIPLAMASCARA'
      'FROM DOCPESSOA, TIPODOCPESSOA'
      'WHERE'
      '  ( DOCPESSOA.IDPESSOA=:IdPessoa ) '
      'AND'
      '  (( TIPODOCPESSOA.FISICAJURIDICA=:IdFisicaJuridica) OR'
      '  ( TIPODOCPESSOA.FISICAJURIDICA='#39'A'#39'))'
      'AND'
      '  ( TIPODOCPESSOA.IDDOCUMENTO=DOCPESSOA.IDDOCUMENTO)'
      ' ')
    UpdateObject = updDocumento
    PictureMasks.Strings = (
      'DATAEMISSAO'#9'#[#]/#[#]/##[##]'#9'T'#9'F')
    ValidateWithMask = True
    Left = 257
    Top = 349
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IdFisicaJuridica'
        ParamType = ptUnknown
        Value = 'F'
      end>
    object qryDocumentoIDDOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDDOCUMENTO'
    end
    object qryDocumentoNOMEDOCUMENTO: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEDOCUMENTO'
      Size = 30
    end
    object qryDocumentoMASCARA: TStringField
      DisplayWidth = 30
      FieldName = 'MASCARA'
      Size = 30
    end
    object qryDocumentoOBRIGAUF: TStringField
      DisplayWidth = 1
      FieldName = 'OBRIGAUF'
      Size = 1
    end
    object qryDocumentoOBRIGAORGAO: TStringField
      DisplayWidth = 1
      FieldName = 'OBRIGAORGAO'
      Size = 1
    end
    object qryDocumentoOBRIGAEMISSAO: TStringField
      DisplayWidth = 1
      FieldName = 'OBRIGAEMISSAO'
      Size = 1
    end
    object qryDocumentoIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
    end
    object qryDocumentoIDIMAGEM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMAGEM'
    end
    object qryDocumentoIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
    end
    object qryDocumentoNUMDOCUMENTO: TStringField
      DisplayWidth = 18
      FieldName = 'NUMDOCUMENTO'
      Size = 18
    end
    object qryDocumentoORGAO: TStringField
      DisplayWidth = 30
      FieldName = 'ORGAO'
      Size = 30
    end
    object qryDocumentoDATAEMISSAO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DATAEMISSAO'
    end
    object qryDocumentoIDESTADO: TFloatField
      FieldName = 'IDESTADO'
      Origin = 'DOCPESSOA.IDESTADO'
    end
    object qryDocumentoFLGOBRIGAVALIDADE: TStringField
      FieldName = 'FLGOBRIGAVALIDADE'
      Origin = 'BASEDADOS.TIPODOCPESSOA.FLGOBRIGAVALIDADE'
      FixedChar = True
      Size = 1
    end
    object qryDocumentoDATAVALIDADE: TDateTimeField
      FieldName = 'DATAVALIDADE'
    end
    object qryDocumentoCATEGCNH: TStringField
      FieldName = 'CATEGCNH'
      Size = 2
    end
    object qryDocumentoOBRIGAPRMHAB: TStringField
      FieldName = 'OBRIGAPRMHAB'
      Size = 1
    end
    object qryDocumentoOBRIGACATG: TStringField
      FieldName = 'OBRIGACATG'
      Size = 1
    end
    object qryDocumentoDTPRIMEIRACNH: TDateTimeField
      FieldName = 'DTPRIMEIRACNH'
    end
    object qryDocumentoEXIBEUF: TStringField
      FieldName = 'EXIBEUF'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEUF'
      Size = 2
    end
    object qryDocumentoEXIBEORGAO: TStringField
      FieldName = 'EXIBEORGAO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEORGAO'
      Size = 2
    end
    object qryDocumentoEXIBEEMISSAO: TStringField
      FieldName = 'EXIBEEMISSAO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEEMISSAO'
      Size = 2
    end
    object qryDocumentoEXIBEVALIDADE: TStringField
      FieldName = 'EXIBEVALIDADE'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEVALIDADE'
      Size = 2
    end
    object qryDocumentoEXIBEPRMHAB: TStringField
      FieldName = 'EXIBEPRMHAB'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEPRMHAB'
      Size = 2
    end
    object qryDocumentoEXIBECATG: TStringField
      FieldName = 'EXIBECATG'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBECATG'
      Size = 2
    end
    object qryDocumentoEXIBEPAIS: TStringField
      FieldName = 'EXIBEPAIS'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEPAIS'
      Size = 2
    end
    object qryDocumentoOBRIGAPAIS: TStringField
      FieldName = 'OBRIGAPAIS'
      Origin = 'BASEDADOS.TIPODOCPESSOA.OBRIGAPAIS'
      Size = 2
    end
    object qryDocumentoIDTIPODOCPESSOAXMASC: TFloatField
      FieldName = 'IDTIPODOCPESSOAXMASC'
      Origin = 'BASEDADOS.DOCPESSOA.IDTIPODOCPESSOAXMASC'
    end
    object qryDocumentoFLGMULTIPLAMASCARA: TStringField
      FieldName = 'FLGMULTIPLAMASCARA'
      Origin = 'BASEDADOS.TIPODOCPESSOA.FLGMULTIPLAMASCARA'
      FixedChar = True
      Size = 1
    end
  end
  object dsDocumento: TwwDataSource
    DataSet = qryDocumento
    OnStateChange = dsDocumentoStateChange
    Left = 105
    Top = 453
  end
  object updDocumento: TUpdateSQL
    ModifySQL.Strings = (
      'update DOCPESSOA'
      'set'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDIMAGEM = :IDIMAGEM,'
      '  IDPAIS = :IDPAIS,'
      '  IDESTADO = :IDESTADO,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  ORGAO = :ORGAO,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  DATAVALIDADE = :DATAVALIDADE,'
      '  DTPRIMEIRACNH = :DTPRIMEIRACNH,'
      '  CATEGCNH = :CATEGCNH'
      'where'
      '  IDDOCUMENTO = :OLD_IDDOCUMENTO and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into DOCPESSOA'
      
        '  (IDDOCUMENTO, IDPESSOA, IDIMAGEM, IDPAIS, IDESTADO, NUMDOCUMEN' +
        'TO, ORGAO, '
      '   DATAEMISSAO, DATAVALIDADE,DTPRIMEIRACNH,CATEGCNH)'
      'values'
      
        '  (:IDDOCUMENTO, :IDPESSOA, :IDIMAGEM, :IDPAIS, :IDESTADO, :NUMD' +
        'OCUMENTO, '
      '   :ORGAO, :DATAEMISSAO, :DATAVALIDADE,:DTPRIMEIRACNH,:CATEGCNH)')
    DeleteSQL.Strings = (
      'delete from DOCPESSOA'
      'where'
      '  IDDOCUMENTO = :OLD_IDDOCUMENTO and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 177
    Top = 359
  end
  object qryEscolhePessoa: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 225
    Top = 478
    object qryEscolhePessoaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
    end
    object qryEscolhePessoaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryEscolhePessoaRAZAOSOCIAL: TStringField
      DisplayLabel = 'Razão Social'
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryEscolhePessoaNUMDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'NUMDOCUMENTO'
      Origin = 'PESSOA.NUMDOCUMENTO'
      Size = 18
    end
  end
  object dsEscolhePessoa: TwwDataSource
    DataSet = qryEscolhePessoa
    Left = 745
    Top = 620
  end
  object Pessoa: TPessoa
    MudaCaption = True
    TipoPessoa = tpJuridica
    SubTipo = stBanco
    MostraFoto = True
    UsaPessoaFisica = False
    FormControls.BotaoFisFur = sbtnFisJur
    FormControls.PainelMestre = pnlMestre
    FormControls.PainelFoto = pnlFoto
    FormControls.LabelDocumento = lblDocumento
    FormControls.LabelNome = lblNome
    FormControls.CampoDocum = qryNUMDOCUMENTO
    SaveModuloRespon = False
    ObrigaDocumento = True
    OnChangePessoa = PessoaChangePessoa
    Left = 363
    Top = 3
  end
  object OpenPictureDialog1: TOpenPictureDialog
    DefaultExt = '*.bmp'
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Options = [ofExtensionDifferent, ofPathMustExist]
    Left = 745
    Top = 416
  end
  object qryImagem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      ' IMAGENS.IDIMAGEM , '
      ' IMAGENS.IMAGEM , '
      ' IMAGENS.DESCRIMAGEM'
      'FROM IMAGENS, PESSOA'
      'WHERE '
      ' (PESSOA.IDPESSOA = :IdPessoa)'
      ' AND'
      '( IMAGENS.IDIMAGEM = PESSOA.IDIMAGEM )'
      '')
    UpdateObject = updImagem
    ValidateWithMask = True
    Left = 225
    Top = 442
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
    object qryImagemIDIMAGEM: TFloatField
      FieldName = 'IDIMAGEM'
      Origin = 'IMAGENS.IDIMAGEM'
    end
    object qryImagemIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      Origin = 'IMAGENS.IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qryImagemDESCRIMAGEM: TStringField
      FieldName = 'DESCRIMAGEM'
      Origin = 'IMAGENS.DESCRIMAGEM'
      Size = 50
    end
  end
  object updImagem: TUpdateSQL
    ModifySQL.Strings = (
      'update IMAGENS'
      'set'
      '  IDIMAGEM = :IDIMAGEM,'
      '  IMAGEM = :IMAGEM,'
      '  DESCRIMAGEM = :DESCRIMAGEM'
      'where'
      '  IDIMAGEM = :OLD_IDIMAGEM')
    InsertSQL.Strings = (
      'insert into IMAGENS'
      '  (IDIMAGEM, IMAGEM, DESCRIMAGEM)'
      'values'
      '  (:IDIMAGEM, :IMAGEM, :DESCRIMAGEM)')
    DeleteSQL.Strings = (
      'delete from IMAGENS'
      'where'
      '  IDIMAGEM = :OLD_IDIMAGEM')
    Left = 745
    Top = 190
  end
  object updImagensDoc: TUpdateSQL
    ModifySQL.Strings = (
      'update IMAGENS'
      'set'
      '  IDIMAGEM = :IDIMAGEM,'
      '  IMAGEM = :IMAGEM,'
      '  DESCRIMAGEM = :DESCRIMAGEM'
      'where'
      '  IDIMAGEM = :OLD_IDIMAGEM')
    InsertSQL.Strings = (
      'insert into IMAGENS'
      '  (IDIMAGEM, IMAGEM, DESCRIMAGEM)'
      'values'
      '  (:IDIMAGEM, :IMAGEM, :DESCRIMAGEM)')
    DeleteSQL.Strings = (
      'delete from IMAGENS'
      'where'
      '  IDIMAGEM = :OLD_IDIMAGEM')
    Left = 809
    Top = 481
  end
  object qryImagensDoc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IMAGENS.IDIMAGEM, '
      ' IMAGENS.IMAGEM , '
      ' IMAGENS.DESCRIMAGEM'
      'FROM IMAGENS, DOCPESSOA ,  PESSOA'
      'WHERE '
      ' ( PESSOA.IDPESSOA =:IdPessoa )'
      ' AND'
      ' ( DOCPESSOA.IDIMAGEM = IMAGENS.IDIMAGEM )'
      ' AND'
      ' ( DOCPESSOA.IDPESSOA = PESSOA.IDPESSOA )')
    UpdateObject = updImagensDoc
    ValidateWithMask = True
    Left = 225
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
    object qryImagensDocIDIMAGEM: TFloatField
      FieldName = 'IDIMAGEM'
      Origin = 'IMAGENS.IDIMAGEM'
    end
    object qryImagensDocIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      Origin = 'IMAGENS.IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qryImagensDocDESCRIMAGEM: TStringField
      FieldName = 'DESCRIMAGEM'
      Origin = 'IMAGENS.DESCRIMAGEM'
      Size = 50
    end
  end
  object dsImagem: TwwDataSource
    DataSet = qryImagem
    OnDataChange = dsImagemDataChange
    Left = 745
    Top = 213
  end
  object dsImagensDoc: TwwDataSource
    DataSet = qryImagensDoc
    Left = 745
    Top = 371
  end
  object qryTipoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TIPODOCPESSOA.IDDOCUMENTO , '
      ' TIPODOCPESSOA.NOMEDOCUMENTO , '
      ' TIPODOCPESSOA.IDREGRA , '
      ' TIPODOCPESSOA.FISICAJURIDICA , '
      ' TIPODOCPESSOA.MASCARA , '
      ' TIPODOCPESSOA.DOCCHAVE , '
      ' TIPODOCPESSOA.OBRIGAUF , '
      ' TIPODOCPESSOA.OBRIGAORGAO , '
      ' TIPODOCPESSOA.OBRIGAEMISSAO,'
      ' TIPODOCPESSOA.OBRIGAPRMHAB, '
      ' TIPODOCPESSOA.OBRIGACATG,'
      ' TIPODOCPESSOA.FLGOBRIGAVALIDADE,'
      ' TIPODOCPESSOA.OBRIGAPRMHAB, '
      ' TIPODOCPESSOA.OBRIGACATG'
      ' ,TIPODOCPESSOA.EXIBEUF   '
      ' ,TIPODOCPESSOA.EXIBEORGAO   '
      ' ,TIPODOCPESSOA.EXIBEEMISSAO   '
      ' ,TIPODOCPESSOA.EXIBEVALIDADE   '
      ' ,TIPODOCPESSOA.EXIBEPRMHAB   '
      ' ,TIPODOCPESSOA.EXIBECATG   '
      ' ,TIPODOCPESSOA.EXIBEPAIS   '
      ' ,TIPODOCPESSOA.OBRIGAPAIS'
      ' ,TIPODOCPESSOA.FLGMULTIPLAMASCARA'
      'FROM TIPODOCPESSOA'
      'WHERE '
      '   ( TIPODOCPESSOA.FISICAJURIDICA =:IdFisicaJuridica ) OR'
      '   ( TIPODOCPESSOA.FISICAJURIDICA = '#39'A'#39')')
    ValidateWithMask = True
    Left = 97
    Top = 569
    ParamData = <
      item
        DataType = ftString
        Name = 'IdFisicaJuridica'
        ParamType = ptUnknown
      end>
    object qryTipoDocIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.IDDOCUMENTO'
    end
    object qryTipoDocNOMEDOCUMENTO: TStringField
      FieldName = 'NOMEDOCUMENTO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.NOMEDOCUMENTO'
      Size = 30
    end
    object qryTipoDocIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.TIPODOCPESSOA.IDREGRA'
    end
    object qryTipoDocFISICAJURIDICA: TStringField
      FieldName = 'FISICAJURIDICA'
      Origin = 'BASEDADOS.TIPODOCPESSOA.FISICAJURIDICA'
      FixedChar = True
      Size = 1
    end
    object qryTipoDocMASCARA: TStringField
      FieldName = 'MASCARA'
      Origin = 'BASEDADOS.TIPODOCPESSOA.MASCARA'
      FixedChar = True
      Size = 30
    end
    object qryTipoDocDOCCHAVE: TStringField
      FieldName = 'DOCCHAVE'
      Origin = 'BASEDADOS.TIPODOCPESSOA.DOCCHAVE'
      FixedChar = True
      Size = 1
    end
    object qryTipoDocOBRIGAUF: TStringField
      FieldName = 'OBRIGAUF'
      Origin = 'BASEDADOS.TIPODOCPESSOA.OBRIGAUF'
      FixedChar = True
      Size = 1
    end
    object qryTipoDocOBRIGAORGAO: TStringField
      FieldName = 'OBRIGAORGAO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.OBRIGAORGAO'
      FixedChar = True
      Size = 1
    end
    object qryTipoDocOBRIGAEMISSAO: TStringField
      FieldName = 'OBRIGAEMISSAO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.OBRIGAEMISSAO'
      FixedChar = True
      Size = 1
    end
    object qryTipoDocFLGOBRIGAVALIDADE: TStringField
      FieldName = 'FLGOBRIGAVALIDADE'
      Origin = 'BASEDADOS.TIPODOCPESSOA.FLGOBRIGAVALIDADE'
      FixedChar = True
      Size = 1
    end
    object qryTipoDocOBRIGACATG: TStringField
      FieldName = 'OBRIGACATG'
      Size = 1
    end
    object qryTipoDocOBRIGAPRMHAB: TStringField
      FieldName = 'OBRIGAPRMHAB'
      Size = 1
    end
    object qryTipoDocOBRIGAPRMHAB_1: TStringField
      FieldName = 'OBRIGAPRMHAB_1'
      Origin = 'BASEDADOS.TIPODOCPESSOA.OBRIGAPRMHAB'
      Size = 1
    end
    object qryTipoDocOBRIGACATG_1: TStringField
      FieldName = 'OBRIGACATG_1'
      Origin = 'BASEDADOS.TIPODOCPESSOA.OBRIGACATG'
      Size = 1
    end
    object qryTipoDocEXIBEUF: TStringField
      FieldName = 'EXIBEUF'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEUF'
      Size = 2
    end
    object qryTipoDocEXIBEORGAO: TStringField
      FieldName = 'EXIBEORGAO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEORGAO'
      Size = 2
    end
    object qryTipoDocEXIBEEMISSAO: TStringField
      FieldName = 'EXIBEEMISSAO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEEMISSAO'
      Size = 2
    end
    object qryTipoDocEXIBEVALIDADE: TStringField
      FieldName = 'EXIBEVALIDADE'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEVALIDADE'
      Size = 2
    end
    object qryTipoDocEXIBEPRMHAB: TStringField
      FieldName = 'EXIBEPRMHAB'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEPRMHAB'
      Size = 2
    end
    object qryTipoDocEXIBECATG: TStringField
      FieldName = 'EXIBECATG'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBECATG'
      Size = 2
    end
    object qryTipoDocEXIBEPAIS: TStringField
      FieldName = 'EXIBEPAIS'
      Origin = 'BASEDADOS.TIPODOCPESSOA.EXIBEPAIS'
      Size = 2
    end
    object qryTipoDocOBRIGAPAIS: TStringField
      FieldName = 'OBRIGAPAIS'
      Origin = 'BASEDADOS.TIPODOCPESSOA.OBRIGAPAIS'
      Size = 2
    end
    object qryTipoDocFLGMULTIPLAMASCARA: TStringField
      FieldName = 'FLGMULTIPLAMASCARA'
      Origin = 'BASEDADOS.TIPODOCPESSOA.FLGMULTIPLAMASCARA'
      FixedChar = True
      Size = 1
    end
  end
  object MSGrupo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Razão Social')
    Tabelas.Strings = (
      'PESSOA')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'PESSOA.NOME')
    Filtro.Strings = (
      'PESSOA.TIPO = '#39'J'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '40'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 697
    Top = 93
  end
  object qryEstado: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  E.IDESTADO,'
      '  E.CODESTADO , '
      '  E.NOMEESTADO , '
      '  P.IDPAIS , '
      '  P.NOMEPAIS,'
      '  P.MASCARACPOSTAL'
      'FROM '
      '  ESTADO E, '
      '  PAIS P'
      'WHERE '
      '  ( E.IDPAIS = P.IDPAIS )'
      'ORDER BY E.NOMEESTADO')
    ValidateWithMask = True
    Left = 225
    Top = 260
    object qryEstadoIDESTADO: TFloatField
      FieldName = 'IDESTADO'
      Origin = 'BASEDADOS.ESTADO.IDESTADO'
    end
    object qryEstadoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Origin = 'BASEDADOS.ESTADO.CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryEstadoNOMEESTADO: TStringField
      FieldName = 'NOMEESTADO'
      Origin = 'BASEDADOS.ESTADO.NOMEESTADO'
      Size = 30
    end
    object qryEstadoIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'BASEDADOS.PAIS.IDPAIS'
    end
    object qryEstadoNOMEPAIS: TStringField
      FieldName = 'NOMEPAIS'
      Origin = 'BASEDADOS.PAIS.NOMEPAIS'
      Size = 30
    end
    object qryEstadoMASCARACPOSTAL: TStringField
      FieldName = 'MASCARACPOSTAL'
      Origin = 'BASEDADOS.PAIS.MASCARACPOSTAL'
    end
  end
  object qryCidade: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  C.IDCIDADES,'
      '  C.NOME AS NOMECIDADE,'
      '  E.CODESTADO , '
      '  E.NOMEESTADO , '
      '  P.IDPAIS , '
      '  P.NOMEPAIS,'
      '  P.MASCARACPOSTAL'
      'FROM '
      '  CIDADES C,'
      '  ESTADO E, '
      '  PAIS P'
      'WHERE '
      '  ( C.IDESTADO = E.IDESTADO) AND'
      '  ( E.IDPAIS = P.IDPAIS )'
      'ORDER BY C.NOME')
    ValidateWithMask = True
    Left = 225
    Top = 405
    object qryCidadeNOMECIDADE: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 40
      FieldName = 'NOMECIDADE'
      Origin = '"CM.CIDADES".NOME'
      Size = 50
    end
    object qryCidadeCODESTADO: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Origin = 'ESTADO.CODESTADO'
      Size = 3
    end
    object qryCidadeIDCIDADES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCIDADES'
      Origin = '"CM.CIDADES".IDCIDADES'
      Visible = False
    end
    object qryCidadeNOMEESTADO: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEESTADO'
      Origin = 'ESTADO.NOMEESTADO'
      Visible = False
      Size = 30
    end
    object qryCidadeIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
      Origin = '"CM.PAIS".IDPAIS'
      Visible = False
    end
    object qryCidadeNOMEPAIS: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEPAIS'
      Origin = '"CM.PAIS".NOMEPAIS'
      Visible = False
      Size = 30
    end
  end
  object dsCidade: TwwDataSource
    DataSet = qryCidade
    OnStateChange = dsDocumentoStateChange
    Left = 745
    Top = 167
  end
  object qryNaturalidade_Padrao: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        ' ESTADO.CODESTADO, ESTADO.NOMEESTADO, ESTADO.IDPAIS, PAIS.NOMEPA' +
        'IS, PAIS.NOMENACIONALIDADE'
      'FROM'
      '  ESTADO, PAIS'
      'WHERE'
      ' ( ESTADO.IDPAIS = PAIS.IDPAIS )'
      'ORDER BY'
      ' ESTADO.NOMEESTADO'
      '')
    ValidateWithMask = True
    Left = 745
    Top = 122
    object qryNaturalidade_PadraoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Origin = 'ESTADO.CODESTADO'
      Size = 3
    end
    object qryNaturalidade_PadraoNOMEESTADO: TStringField
      FieldName = 'NOMEESTADO'
      Origin = 'ESTADO.NOMEESTADO'
      Size = 30
    end
    object qryNaturalidade_PadraoIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'ESTADO.IDPAIS'
    end
    object qryNaturalidade_PadraoNOMEPAIS: TStringField
      FieldName = 'NOMEPAIS'
      Origin = 'PAIS.NOMEPAIS'
      Size = 30
    end
    object qryNaturalidade_PadraoNOMENACIONALIDADE: TStringField
      FieldName = 'NOMENACIONALIDADE'
      Origin = 'PAIS.NOMENACIONALIDADE'
      Size = 30
    end
  end
  object DsNaturalidade_Padrao: TwwDataSource
    DataSet = qryNaturalidade_Padrao
    Left = 745
    Top = 145
  end
  object qryTipoDocOficial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select coddocumento, iddocumento, sigladocumento from tipodocofi' +
        'cial '
      '')
    ValidateWithMask = True
    Left = 104
    Top = 381
  end
  object qQueryAux: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT F.*, S.IDSITFUNC, S.DESCRICAO '
      'FROM FUNCIONARIO F, SITFUNC S'
      'WHERE S.IDSITFUNC = F.IDSITFUNC'
      '  AND S.TIPOSIT  IN ('#39'A'#39', '#39'F'#39')'
      '  AND F.IDPESSOA = :IDPESSOA')
    ValidateWithMask = True
    Left = 97
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryPais: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT P.IDPAIS, P.NOMEPAIS, P.CODINTERNACIONAL'
      '  FROM PAIS P'
      ' WHERE P.CODINTERNACIONAL IS NOT NULL'
      ' ORDER BY P.NOMEPAIS')
    ValidateWithMask = True
    Left = 97
    Top = 320
    object qryPaisIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'BASEDADOS.PAIS.IDPAIS'
    end
    object qryPaisNOMEPAIS: TStringField
      FieldName = 'NOMEPAIS'
      Origin = 'BASEDADOS.PAIS.NOMEPAIS'
      Size = 30
    end
    object qryPaisCODINTERNACIONAL: TStringField
      FieldName = 'CODINTERNACIONAL'
      Origin = 'BASEDADOS.PAIS.CODINTERNACIONAL'
      Size = 3
    end
  end
  object qryTipoDocumento: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT '
      ' TX.IDTIPODOCPESSOAXMASC, '
      ' TX.IDDOCUMENTO, '
      ' TX.NOME, TX.MASCARA '
      'FROM '
      '    TIPODOCPESSOAXMASC TX '
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 105
    Top = 512
  end
end
