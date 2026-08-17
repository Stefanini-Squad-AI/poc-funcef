inherited frmExecConfissaoDivida: TfrmExecConfissaoDivida
  Left = 91
  Top = 110
  HelpContext = 640088
  Caption = 'Confissão de Dívidas'
  ClientHeight = 522
  ClientWidth = 767
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 767
    Height = 483
    inherited PagControle: TPageControl
      Width = 765
      Height = 481
      ActivePage = TabSheet1
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 757
          Caption = 'Confissão de Dívidas [ Seleção ]'
        end
        object Label11: TLabel
          Left = 16
          Top = 191
          Width = 85
          Height = 13
          Caption = 'Tipo de Imóvel'
        end
        object Label14: TLabel
          Left = 242
          Top = 191
          Width = 206
          Height = 13
          Caption = 'Alterador para liquidação de débitos'
        end
        inline molLocatario1: TmolLocatario
          Left = 8
          Top = 48
          Width = 561
          inherited edtLocatario: TEdit
            Width = 473
          end
          inherited btnBuscaLocatario: TBitBtn
            Left = 480
            OnClick = molLocatario1btnBuscaLocatarioClick
          end
          inherited btnLimpaLocatario: TBitBtn
            Left = 504
          end
          inherited btnAbrePessoa: TBitBtn
            Left = 528
          end
        end
        object gbPeriodo: TGroupBox
          Left = 16
          Top = 108
          Width = 545
          Height = 69
          Caption = ' Datas '
          TabOrder = 1
          object Label1: TLabel
            Left = 400
            Top = 24
            Width = 105
            Height = 13
            Caption = 'Data da Confissão'
          end
          object Label2: TLabel
            Left = 16
            Top = 24
            Width = 84
            Height = 13
            Caption = 'Período Inicial'
          end
          object Label4: TLabel
            Left = 152
            Top = 24
            Width = 77
            Height = 13
            Caption = 'Período Final'
          end
          object edtPeriodoIni: TCMDateTimePicker
            Left = 16
            Top = 42
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
          object edtPeriodoFim: TCMDateTimePicker
            Left = 152
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
            TabOrder = 1
          end
          object edtDataConfissao: TCMDateTimePicker
            Left = 402
            Top = 40
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
            TabOrder = 2
          end
        end
        object gbObservacao: TGroupBox
          Left = 16
          Top = 240
          Width = 545
          Height = 89
          Caption = 'Observações do Evento'
          TabOrder = 3
          object Panel8: TPanel
            Left = 2
            Top = 15
            Width = 541
            Height = 72
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 5
            TabOrder = 0
            object memObs: TMemo
              Left = 5
              Top = 5
              Width = 531
              Height = 62
              Align = alClient
              TabOrder = 0
            end
          end
        end
        object cboTipoImovel: TwwDBLookupCombo
          Left = 16
          Top = 206
          Width = 217
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOIMOVEL'#9'60'#9'Descrição'#9'F')
          LookupTable = cdsTipoImovel
          LookupField = 'CODTIPIMOVEL'
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object edtAlteradorConfissao: TDBEdit
          Left = 240
          Top = 206
          Width = 319
          Height = 21
          Color = clBtnShadow
          DataField = 'ALTERADOR_CONFISSAO'
          DataSource = dsTipoImovel
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 757
          Caption = 'Confissão de Dívidas [ Débitos e Operações]'
        end
        object Panel2: TPanel
          Left = 0
          Top = 24
          Width = 757
          Height = 252
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 757
            Height = 27
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Débitos existentes'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object btnInverteSelecao: TBitBtn
              Left = 703
              Top = 2
              Width = 26
              Height = 23
              Hint = 'Inverte a Seleção'
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
            object btnMarcaTodos: TBitBtn
              Left = 729
              Top = 2
              Width = 26
              Height = 23
              Hint = 'Seleciona Todos'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = btnMarcaTodosClick
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
          object dbgDebitos: TwwDBGrid
            Left = 0
            Top = 27
            Width = 757
            Height = 225
            ControlType.Strings = (
              'FLGESCOLHA;CheckBox;1;0')
            Selected.Strings = (
              'FLGESCOLHA'#9'3'#9' '
              'NOME_EXTENSO'#9'36'#9'Contrato'
              'CODDOCUMENTO'#9'10'#9'Documento'
              'DATAVENCTO'#9'10'#9'Vencimento'
              'DATALIMITE'#9'10'#9'Data Limite'
              'TOT_RECEBER'#9'10'#9'A Receber'
              'DATABAIXA'#9'11'#9'Data de Baixa'
              'TOT_RECEBIDO'#9'10'#9'Recebido'
              'CORRECAO'#9'10'#9'Correção'
              'JUROS'#9'10'#9'Juros'
              'MULTA'#9'10'#9'Multa'
              'DIFERENCA'#9'10'#9'Diferença')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
            Align = alClient
            DataSource = dsDocumentos
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap, dgShowFooter]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = dbgDebitosCalcCellColors
            OnDblClick = dbgDebitosDblClick
            IndicatorColor = icBlack
            OnTopRowChanged = dbgDebitosTopRowChanged
            OnUpdateFooter = dbgDebitosUpdateFooter
            FooterHeight = 23
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 276
          Width = 757
          Height = 195
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 757
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
          object pnlControlesDet: TPanel
            Left = 0
            Top = 58
            Width = 667
            Height = 137
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Label5: TLabel
              Left = 26
              Top = 10
              Width = 56
              Height = 13
              Caption = 'Operação'
            end
            object Label10: TLabel
              Left = 526
              Top = 11
              Width = 107
              Height = 13
              Caption = 'Valor da Operação'
              FocusControl = DBEdit5
            end
            object Label36: TLabel
              Left = 198
              Top = 52
              Width = 69
              Height = 13
              Caption = 'Observação'
              FocusControl = DBMemo1
            end
            object DBEdit5: TDBEdit
              Left = 526
              Top = 27
              Width = 109
              Height = 21
              DataField = 'VLROPERACAO'
              DataSource = dsConfissaoOper
              TabOrder = 3
            end
            object DBMemo1: TDBMemo
              Left = 198
              Top = 68
              Width = 438
              Height = 67
              DataField = 'OBSERVACAO'
              DataSource = dsConfissaoOper
              TabOrder = 5
            end
            object chkDescCondicional: TDBCheckBox
              Left = 30
              Top = 56
              Width = 153
              Height = 17
              Caption = 'Desconto Condicional'
              DataField = 'FLGDESCCONDIC'
              DataSource = dsConfissaoOper
              TabOrder = 4
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBRadioGroup1: TDBRadioGroup
              Left = 334
              Top = 11
              Width = 185
              Height = 38
              Caption = ' Tipo '
              Columns = 2
              DataField = 'FLGTIPO'
              DataSource = dsConfissaoOper
              Items.Strings = (
                'Acréscimo'
                'Desconto')
              ReadOnly = True
              TabOrder = 2
              Values.Strings = (
                'A'
                'D')
            end
            object cboTipoOper: TwwDBLookupCombo
              Left = 26
              Top = 26
              Width = 297
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCUSTORECIMO'#9'60'#9'Operação'#9'F')
              DataField = 'IDTIPOCUSTORECIMO'
              DataSource = dsConfissaoOper
              LookupTable = cdsTipoOper
              LookupField = 'IDTIPOCUSTORECIMO'
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = cboTipoOperCloseUp
            end
            object dbgrdDet: TwwDBGrid
              Left = 0
              Top = 0
              Width = 667
              Height = 137
              Selected.Strings = (
                'DESCCUSTORECIMO'#9'24'#9'Operação'
                'DESCTIPO'#9'19'#9'Tipo'
                'VLROPERACAO'#9'15'#9'Valor da Operação'
                'DESCCOND'#9'3'#9'Condicional')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsConfissaoOper
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              OnCalcCellColors = dbgDebitosCalcCellColors
              IndicatorColor = icBlack
              OnTopRowChanged = dbgDebitosTopRowChanged
            end
          end
          object Dock974: TDock97
            Left = 667
            Top = 58
            Width = 90
            Height = 137
            AllowDrag = False
            BoundLines = [blLeft]
            Position = dpRight
            object tb97Detalhe: TToolbar97
              Left = 0
              Top = 0
              Caption = 'tb97Detalhe'
              DockPos = 0
              TabOrder = 0
              object bbtnOkDet: TBitBtn
                Left = 0
                Top = 0
                Width = 85
                Height = 27
                Caption = 'OK'
                TabOrder = 0
                OnClick = bbtnOkDetClick
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
                NumGlyphs = 2
              end
              object bbtnCancelarDet: TBitBtn
                Left = 0
                Top = 27
                Width = 85
                Height = 27
                Cancel = True
                Caption = 'Cancelar'
                TabOrder = 1
                OnClick = bbtnCancelarDetClick
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
                NumGlyphs = 2
                Spacing = -1
              end
              object bbtnVoltarDet: TBitBtn
                Left = 0
                Top = 54
                Width = 85
                Height = 27
                Cancel = True
                Caption = '&Voltar'
                TabOrder = 2
                OnClick = bbtnVoltarDetClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
                  FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                  FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                  FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                  FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                  FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
                  C8807FF7777777777FF700000000000000007777777777777777333333333333
                  3333333333333333333333333333333333333333333333333333}
                NumGlyphs = 2
              end
            end
          end
          object Dock973: TDock97
            Left = 0
            Top = 27
            Width = 757
            Height = 31
            AllowDrag = False
            BoundLines = [blTop, blBottom, blLeft, blRight]
            object tb97BotoesDetalhe: TToolbar97
              Left = 0
              Top = 0
              Caption = 'tb97BotoesDetalhe'
              DockPos = 0
              TabOrder = 0
              object sbtnInsDet: TToolbarButton97
                Left = 0
                Top = 0
                Width = 25
                Height = 25
                Hint = 'Inserir'
                AllowAllUp = True
                ImageIndex = 0
                Images = ImlPadrao
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnInsDetClick
              end
              object sbtnAltDet: TToolbarButton97
                Left = 25
                Top = 0
                Width = 25
                Height = 25
                Hint = 'Alterar'
                AllowAllUp = True
                ImageIndex = 1
                Images = ImlPadrao
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnAltDetClick
              end
              object sbtnExcluiDet: TToolbarButton97
                Left = 50
                Top = 0
                Width = 25
                Height = 25
                Hint = 'Excluir'
                AllowAllUp = True
                ImageIndex = 2
                Images = ImlPadrao
                ParentShowHint = False
                ShowHint = True
                OnClick = sbtnExcluiDetClick
              end
            end
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 2
        TabVisible = False
        object fcLabel2: TfcLabel
          Left = 0
          Top = 0
          Width = 757
          Height = 24
          Align = alTop
          Caption = 'Confissão de Dívidas [ Dados para o Contrato ]'
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
        object pgctrlDetalhe: TPageControl
          Left = 0
          Top = 24
          Width = 757
          Height = 447
          ActivePage = tbsObs
          Align = alClient
          TabOrder = 0
          OnChange = pgctrlDetalheChange
          object tbsGeral: TTabSheet
            Caption = 'Geral'
            ImageIndex = 1
            object Label19: TLabel
              Left = 479
              Top = 67
              Width = 100
              Height = 13
              Caption = 'Valor do Contrato'
            end
            object Label20: TLabel
              Left = 593
              Top = 67
              Width = 39
              Height = 13
              Caption = 'Moeda'
            end
            object Label55: TLabel
              Left = 479
              Top = 110
              Width = 61
              Height = 13
              Caption = 'Tx. Admin.'
            end
            object Label58: TLabel
              Left = 593
              Top = 110
              Width = 79
              Height = 13
              Caption = 'Dias Repasse'
            end
            object Bevel2: TBevel
              Left = 16
              Top = 300
              Width = 672
              Height = 2
              Shape = bsTopLine
            end
            object Label57: TLabel
              Left = 480
              Top = 156
              Width = 113
              Height = 13
              Caption = 'Situação Contratual'
            end
            object lblPerc: TLabel
              Left = 558
              Top = 127
              Width = 10
              Height = 13
              Caption = '%'
            end
            object Label35: TLabel
              Left = 16
              Top = 20
              Width = 114
              Height = 13
              Caption = 'Número do Contrato'
            end
            object Label37: TLabel
              Left = 156
              Top = 20
              Width = 103
              Height = 13
              Caption = 'Nome do Contrato'
            end
            object DBedtValorContrato: TDBRealEdit
              Left = 479
              Top = 81
              Width = 102
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 5
              WordWrap = False
              IntDigits = 15
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'CONVLRAJUSTADO'
              DataSource = dsContrato
            end
            object DBcboMoedaContrato: TwwDBLookupCombo
              Left = 593
              Top = 81
              Width = 94
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOESIGLA'#9'6'#9'Moeda')
              DataField = 'MOECODIGO'
              DataSource = dsContrato
              LookupTable = cdsMoeda
              LookupField = 'MOECODIGO'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object DBchkCobrancaAuto: TDBCheckBox
              Left = 16
              Top = 321
              Width = 289
              Height = 17
              Caption = 'Gerar Cobrança na Folha de Aluguéis'
              DataField = 'FLGCOBRANCAAUTO'
              DataSource = dsContrato
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 9
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            inline molLocatario2: TmolLocatario
              Left = 16
              Top = 64
              Width = 457
              TabOrder = 2
              inherited Label5: TLabel
                Left = 0
              end
              inherited edtLocatario: TEdit
                Left = 0
                Width = 367
              end
              inherited btnBuscaLocatario: TBitBtn
                Left = 374
                Visible = False
              end
              inherited btnLimpaLocatario: TBitBtn
                Left = 398
                Visible = False
              end
              inherited btnAbrePessoa: TBitBtn
                Left = 422
                Visible = False
              end
            end
            object DBspnDiasRepasse: TwwDBSpinEdit
              Left = 593
              Top = 124
              Width = 83
              Height = 21
              BiDiMode = bdLeftToRight
              Increment = 1
              MaxValue = 31
              DataField = 'CONDIASREPASSE'
              DataSource = dsContrato
              ParentBiDiMode = False
              TabOrder = 8
              UnboundDataType = wwDefault
            end
            object dblcSitContratual: TwwDBLookupCombo
              Left = 480
              Top = 170
              Width = 208
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'60'#9'Descrição'#9'F')
              DataField = 'IDSITCONTIMOB'
              DataSource = dsContrato
              LookupTable = cdsSitContImob
              LookupField = 'IDSITCONTIMOB'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 10
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dbEdtTaxaAdmin: TDBRealEdit
              Left = 479
              Top = 124
              Width = 73
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 7
              WordWrap = False
              IntDigits = 8
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'CONTAXAADMIN'
              DataSource = dsContrato
            end
            inline molAdministradora1: TmolAdministradora
              Left = 16
              Top = 108
              Width = 457
              TabOrder = 3
              inherited Label5: TLabel
                Left = 0
              end
              inherited edtAdministradora: TEdit
                Left = 0
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
              Left = 16
              Top = 152
              Width = 457
              TabOrder = 4
              inherited Label5: TLabel
                Left = 0
                Width = 154
                Caption = 'Responsável pelo Contrato'
              end
              inherited edtResponsavel: TEdit
                Left = 0
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
            object DBedtNumeroContrato: TDBEdit2
              Left = 16
              Top = 34
              Width = 121
              Height = 21
              DataField = 'CONNUMERO'
              DataSource = dsContrato
              TabOrder = 0
            end
            object DBedtNomeContrato: TDBEdit2
              Left = 156
              Top = 34
              Width = 531
              Height = 21
              DataField = 'CONNOME'
              DataSource = dsContrato
              TabOrder = 1
            end
            object GroupBox2: TGroupBox
              Left = 16
              Top = 208
              Width = 673
              Height = 73
              Caption = ' Datas '
              TabOrder = 11
              object Label6: TLabel
                Left = 16
                Top = 20
                Width = 109
                Height = 13
                Caption = 'Data de Assinatura'
              end
              object Label7: TLabel
                Left = 152
                Top = 20
                Width = 105
                Height = 13
                Caption = 'Início da Vigência'
              end
              object Label8: TLabel
                Left = 280
                Top = 20
                Width = 99
                Height = 13
                Caption = 'Término Vigência'
              end
              object Label44: TLabel
                Left = 400
                Top = 20
                Width = 95
                Height = 13
                Caption = 'Próxima Revisão'
              end
              object Label45: TLabel
                Left = 536
                Top = 20
                Width = 82
                Height = 13
                Caption = 'Aviso Revisão'
              end
              object DBedtDataAssinatura: TCMDateTimePicker
                Left = 16
                Top = 36
                Width = 113
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'CONDATAASSINATURA'
                DataSource = dsContrato
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
                Top = 36
                Width = 113
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'CONDATAINICIO'
                DataSource = dsContrato
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
              object DBedtDataFim: TCMDateTimePicker
                Left = 280
                Top = 36
                Width = 113
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'CONDATAFIM'
                DataSource = dsContrato
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
              object DBedtDataRenegoc: TCMDateTimePicker
                Left = 400
                Top = 36
                Width = 113
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'CONDATARENEGOC'
                DataSource = dsContrato
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
              object DBedtDataAvRenegoc: TCMDateTimePicker
                Left = 536
                Top = 36
                Width = 113
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'CONDATAAVRENEGOC'
                DataSource = dsContrato
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
            end
          end
          object tbsDet: TTabSheet
            Caption = 'Imóveis'
            object wwDBGrid1: TwwDBGrid
              Left = 0
              Top = 0
              Width = 749
              Height = 419
              Selected.Strings = (
                'DSC_MESTRE'#9'25'#9'Imóvel Mestre'#9'F'
                'DSC_IMOVEL'#9'25'#9'Imóvel'#9'F'
                'CODTIPIMOVEL'#9'14'#9'Tipo Imóvel'#9'F'
                'CIMDESCRICAO'#9'22'#9'Descrição'#9'F'
                'IMOCODIGO'#9'12'#9'Código Imóvel'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dscontratoXImovel
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
              OnCalcCellColors = dbgDebitosCalcCellColors
              IndicatorColor = icBlack
              OnTopRowChanged = dbgDebitosTopRowChanged
              FooterHeight = 30
            end
          end
          object TabSheet3: TTabSheet
            Caption = 'Condição de Pagamento'
            ImageIndex = 8
            object Panel5: TPanel
              Left = 0
              Top = 0
              Width = 750
              Height = 217
              BevelOuter = bvNone
              TabOrder = 0
              object Dock972: TDock97
                Left = 660
                Top = 31
                Width = 90
                Height = 186
                AllowDrag = False
                BoundLines = [blLeft]
                Position = dpRight
                object Toolbar971: TToolbar97
                  Left = 0
                  Top = 0
                  Caption = 'tb97Detalhe'
                  DockPos = 0
                  TabOrder = 0
                  object btnOkCond: TBitBtn
                    Left = 0
                    Top = 0
                    Width = 85
                    Height = 27
                    Caption = 'OK'
                    TabOrder = 0
                    OnClick = btnOkCondClick
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
                    NumGlyphs = 2
                  end
                  object btnCancelCond: TBitBtn
                    Left = 0
                    Top = 27
                    Width = 85
                    Height = 27
                    Cancel = True
                    Caption = 'Cancelar'
                    TabOrder = 1
                    OnClick = btnCancelCondClick
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
                    NumGlyphs = 2
                    Spacing = -1
                  end
                  object btnVoltarCOnd: TBitBtn
                    Left = 0
                    Top = 54
                    Width = 85
                    Height = 27
                    Cancel = True
                    Caption = '&Voltar'
                    TabOrder = 2
                    OnClick = btnVoltarCOndClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000010000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                      33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
                      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                      FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
                      C8807FF7777777777FF700000000000000007777777777777777333333333333
                      3333333333333333333333333333333333333333333333333333}
                    NumGlyphs = 2
                  end
                end
              end
              object Dock975: TDock97
                Left = 0
                Top = 0
                Width = 750
                Height = 31
                AllowDrag = False
                BoundLines = [blTop, blBottom, blLeft, blRight]
                object Toolbar972: TToolbar97
                  Left = 0
                  Top = 0
                  Caption = 'tb97BotoesDetalhe'
                  DockPos = 0
                  TabOrder = 0
                  object btnInsCond: TToolbarButton97
                    Left = 0
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Inserir'
                    AllowAllUp = True
                    ImageIndex = 0
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = btnInsCondClick
                  end
                  object btnAltCond: TToolbarButton97
                    Left = 25
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Alterar'
                    AllowAllUp = True
                    ImageIndex = 1
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = btnAltCondClick
                  end
                  object btnDelCond: TToolbarButton97
                    Left = 50
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Excluir'
                    AllowAllUp = True
                    ImageIndex = 2
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = btnDelCondClick
                  end
                end
              end
              object Panel9: TPanel
                Left = 0
                Top = 31
                Width = 660
                Height = 186
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 2
                object pnlCondicao: TPanel
                  Left = 0
                  Top = 0
                  Width = 660
                  Height = 178
                  Align = alTop
                  BevelOuter = bvNone
                  Enabled = False
                  TabOrder = 0
                  object lblJurCarencia: TLabel
                    Left = 486
                    Top = 107
                    Width = 154
                    Height = 13
                    Caption = 'o período sem amortização'
                  end
                  object lblPeriod: TLabel
                    Left = 569
                    Top = 48
                    Width = 78
                    Height = 13
                    Caption = 'Periodicidade'
                  end
                  object Label32: TLabel
                    Left = 553
                    Top = 67
                    Width = 10
                    Height = 13
                    Caption = '%'
                  end
                  object lblJuros: TLabel
                    Left = 460
                    Top = 47
                    Width = 31
                    Height = 13
                    Caption = 'Juros'
                  end
                  object lblNumParc: TLabel
                    Left = 460
                    Top = 4
                    Width = 50
                    Height = 13
                    Caption = 'Parcelas'
                  end
                  object Label64: TLabel
                    Left = 352
                    Top = 47
                    Width = 86
                    Height = 13
                    Caption = '1ª Amortização'
                  end
                  object Label34: TLabel
                    Left = 352
                    Top = 4
                    Width = 83
                    Height = 13
                    Caption = '1º Vencimento'
                  end
                  object Label23: TLabel
                    Left = 245
                    Top = 4
                    Width = 100
                    Height = 13
                    Caption = 'Término Carência'
                  end
                  object lblPerProj2: TLabel
                    Left = 310
                    Top = 64
                    Width = 10
                    Height = 13
                    Caption = '%'
                  end
                  object lblPerProj: TLabel
                    Left = 243
                    Top = 47
                    Width = 77
                    Height = 13
                    Caption = 'CM Projetada'
                  end
                  object Label33: TLabel
                    Left = 139
                    Top = 109
                    Width = 112
                    Height = 13
                    Caption = 'mes(es) anterior(es)'
                  end
                  object Label46: TLabel
                    Left = 139
                    Top = 94
                    Width = 96
                    Height = 13
                    Caption = 'Utilizar indice de'
                  end
                  object lblIndCorrec: TLabel
                    Left = 139
                    Top = 47
                    Width = 91
                    Height = 13
                    Caption = 'Indice Correção'
                  end
                  object Label15: TLabel
                    Left = 139
                    Top = 4
                    Width = 96
                    Height = 13
                    Caption = 'Valor Financiado'
                  end
                  object GroupBox1: TGroupBox
                    Left = 3
                    Top = 124
                    Width = 646
                    Height = 43
                    Caption = ' Forma de Cálculo '
                    TabOrder = 0
                    object cboFormaCalculo: TwwDBLookupCombo
                      Left = 16
                      Top = 16
                      Width = 614
                      Height = 21
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'NOME'#9'60'#9'Nome'#9'F')
                      DataField = 'IDFORMACALCIMOB'
                      DataSource = dsCondPagImovel
                      LookupTable = cdsFormaCalcImob
                      LookupField = 'IDFORMACALCIMOB'
                      TabOrder = 0
                      AutoDropDown = False
                      ShowButton = True
                      AllowClearKey = False
                    end
                  end
                  object dbcbJurosCarencia: TDBCheckBox
                    Left = 465
                    Top = 91
                    Width = 192
                    Height = 17
                    Caption = 'Gera parcela de Juros durante'
                    DataField = 'FLGJURCARENCIA'
                    DataSource = dsCondPagImovel
                    TabOrder = 1
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                  end
                  object gbPeriodoReajuste: TGroupBox
                    Left = 351
                    Top = 85
                    Width = 99
                    Height = 41
                    Caption = ' Per. Reajuste '
                    TabOrder = 2
                    object Label72: TLabel
                      Left = 54
                      Top = 19
                      Width = 36
                      Height = 13
                      Caption = 'meses'
                    end
                    object wwDBSpinEdit1: TwwDBSpinEdit
                      Left = 13
                      Top = 15
                      Width = 37
                      Height = 21
                      Increment = 1
                      DataField = 'PERIODOREAJUSTE'
                      DataSource = dsCondPagImovel
                      TabOrder = 0
                      UnboundDataType = wwDefault
                    end
                  end
                  object dbcbPerJur: TwwDBComboBox
                    Left = 568
                    Top = 63
                    Width = 79
                    Height = 21
                    ShowButton = True
                    Style = csDropDownList
                    MapList = True
                    AllowClearKey = False
                    DataField = 'PERIODOTAXA'
                    DataSource = dsCondPagImovel
                    DropDownCount = 5
                    ItemHeight = 13
                    Items.Strings = (
                      'Mensal'#9'M'
                      'Anual Simples'#9'A'
                      'Anual Composto'#9'C')
                    Sorted = False
                    TabOrder = 3
                    UnboundDataType = wwDefault
                  end
                  object edtJuros: TDBRealEdit
                    Left = 460
                    Top = 63
                    Width = 92
                    Height = 21
                    Alignment = taRightJustify
                    Lines.Strings = (
                      '0,0000000000')
                    TabOrder = 4
                    WordWrap = False
                    IntDigits = 14
                    DecDigits = 10
                    NumberFormat = fNumber
                    Signal = False
                    DataField = 'TAXAJUROS'
                    DataSource = dsCondPagImovel
                  end
                  object gbIntervalo: TGroupBox
                    Left = 518
                    Top = 3
                    Width = 129
                    Height = 44
                    Caption = 'Periodicidade Parc.'
                    TabOrder = 5
                    object dbspnPeriodo: TwwDBSpinEdit
                      Left = 14
                      Top = 18
                      Width = 37
                      Height = 21
                      Increment = 1
                      DataField = 'PERIODO'
                      DataSource = dsCondPagImovel
                      TabOrder = 0
                      UnboundDataType = wwDefault
                    end
                    object dbcbPerParc: TwwDBComboBox
                      Left = 57
                      Top = 18
                      Width = 63
                      Height = 21
                      ShowButton = True
                      Style = csDropDownList
                      MapList = True
                      AllowClearKey = False
                      DataField = 'PRAZO'
                      DataSource = dsCondPagImovel
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
                  object edtNumParc: TDBRealEdit
                    Left = 460
                    Top = 21
                    Width = 50
                    Height = 21
                    Alignment = taRightJustify
                    Lines.Strings = (
                      '0')
                    TabOrder = 6
                    WordWrap = False
                    IntDigits = 10
                    DecDigits = 0
                    NumberFormat = iNumber
                    Signal = False
                    DataField = 'NUMPARCELAS'
                    DataSource = dsCondPagImovel
                  end
                  object edtDataAmortiz: TCMDateTimePicker
                    Left = 352
                    Top = 63
                    Width = 96
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAINIAMORTIZ'
                    DataSource = dsCondPagImovel
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
                  object edDataIniParc: TCMDateTimePicker
                    Left = 352
                    Top = 21
                    Width = 96
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATAVENCIMENTO'
                    DataSource = dsCondPagImovel
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
                  object edDataCarencia: TCMDateTimePicker
                    Left = 245
                    Top = 21
                    Width = 96
                    Height = 21
                    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                    CalendarAttributes.Font.Color = clWindowText
                    CalendarAttributes.Font.Height = -11
                    CalendarAttributes.Font.Name = 'MS Sans Serif'
                    CalendarAttributes.Font.Style = []
                    ButtonStyle = cbsCustom
                    DataField = 'DATACARENCIA'
                    DataSource = dsCondPagImovel
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
                  object edtPerProj: TDBRealEdit
                    Left = 243
                    Top = 63
                    Width = 65
                    Height = 21
                    Alignment = taRightJustify
                    Lines.Strings = (
                      '0,000000')
                    TabOrder = 10
                    WordWrap = False
                    IntDigits = 10
                    DecDigits = 6
                    NumberFormat = fNumber
                    Signal = False
                    DataField = 'PERINDPROJ'
                    DataSource = dsCondPagImovel
                  end
                  object dbedtMesRefReajuste: TwwDBSpinEdit
                    Left = 243
                    Top = 89
                    Width = 33
                    Height = 21
                    Increment = 1
                    MaxValue = 9
                    DataField = 'MESREFREAJUSTE'
                    DataSource = dsCondPagImovel
                    TabOrder = 11
                    UnboundDataType = wwDefault
                  end
                  object dblcIndCorrec: TCMDBLookupCombo
                    Left = 139
                    Top = 63
                    Width = 97
                    Height = 21
                    DropDownAlignment = taLeftJustify
                    Selected.Strings = (
                      'MOESIGLA'#9'10'#9'Sigla'#9'F'
                      'FLGPERCVALOR'#9'1'#9'Tipo'#9'F')
                    DataField = 'INDCORRECAO'
                    DataSource = dsCondPagImovel
                    LookupTable = cdsMoeda
                    LookupField = 'MOECODIGO'
                    Options = [loTitles]
                    Style = csDropDownList
                    TabOrder = 12
                    AutoDropDown = True
                    ShowButton = True
                    AllowClearKey = True
                    ShowMatchText = True
                  end
                  object edValParc: TDBRealEdit
                    Left = 139
                    Top = 21
                    Width = 97
                    Height = 21
                    Alignment = taRightJustify
                    Lines.Strings = (
                      '1.000,00')
                    TabOrder = 13
                    WordWrap = False
                    IntDigits = 10
                    DecDigits = 2
                    NumberFormat = fNumber
                    Signal = False
                    DataField = 'VLRFINANC'
                    DataSource = dsCondPagImovel
                  end
                  object dbrgTipoCond: TDBRadioGroup
                    Left = 3
                    Top = 4
                    Width = 129
                    Height = 104
                    Caption = 'Tipo de Pagamento'
                    DataField = 'TIPOCONDPAG'
                    DataSource = dsCondPagImovel
                    Items.Strings = (
                      'A Vista'
                      'Parcelamento')
                    TabOrder = 14
                    Values.Strings = (
                      'V'
                      'P')
                    OnChange = dbrgTipoCondChange
                  end
                end
              end
            end
            object Panel10: TPanel
              Left = 0
              Top = 241
              Width = 403
              Height = 176
              BevelOuter = bvNone
              TabOrder = 1
              object grdCondPag: TwwDBGrid
                Left = 0
                Top = 0
                Width = 403
                Height = 176
                Selected.Strings = (
                  'cal_tipo'#9'20'#9'Tipo'
                  'DATAVENCIMENTO'#9'10'#9'Início'
                  'VLRFINANC'#9'13'#9'Valor '
                  'NUMPARCELAS'#9'7'#9'Nº Parc')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsCondPagImovel
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
            end
            object Panel11: TPanel
              Left = 405
              Top = 241
              Width = 344
              Height = 176
              BevelOuter = bvNone
              TabOrder = 2
              object dbgDescCondic: TwwDBGrid
                Left = 0
                Top = 0
                Width = 344
                Height = 176
                ControlType.Strings = (
                  'IDCONDPAGIMOVEL;CheckBox;1;0'
                  'FLGESCOLHA;CheckBox;1;0')
                Selected.Strings = (
                  'FLGESCOLHA'#9'3'#9' '#9'F'
                  'DESCCUSTORECIMO'#9'24'#9'Operação'#9'F'
                  'VLROPERACAO'#9'15'#9'Valor da Operação'#9'F')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
                Align = alClient
                DataSource = dsOperXCond
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
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
                OnCalcCellColors = dbgDebitosCalcCellColors
                OnDblClick = dbgDescCondicDblClick
                IndicatorColor = icBlack
                OnTopRowChanged = dbgDebitosTopRowChanged
              end
            end
            object Panel12: TPanel
              Left = 0
              Top = 215
              Width = 403
              Height = 27
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = 'Condiçôes'
              Color = clNavy
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
            end
            object Panel13: TPanel
              Left = 405
              Top = 215
              Width = 344
              Height = 27
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = 'Descontos Condicionais'
              Color = clNavy
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
            end
          end
          object tbsCobranca: TTabSheet
            Caption = 'Cobrança'
            ImageIndex = 4
            object Label22: TLabel
              Left = 25
              Top = 25
              Width = 111
              Height = 13
              Caption = 'Forma de Cobrança'
            end
            object Label53: TLabel
              Left = 25
              Top = 80
              Width = 195
              Height = 13
              Caption = 'Mensagem do Boleto de Cobrança'
            end
            object DBcboPortadorForma: TwwDBLookupCombo
              Left = 25
              Top = 39
              Width = 493
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO')
              DataField = 'CODPORTFORMA'
              DataSource = dsContrato
              LookupTable = cdsPortadorForma
              LookupField = 'CODPORTFORMA'
              Style = csDropDownList
              DropDownWidth = 8
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
            end
            object DBcboMsgBoleto: TwwDBLookupCombo
              Left = 25
              Top = 94
              Width = 493
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MSGDESCRICAO'#9'60'#9'Descrição'#9'F')
              DataField = 'IDMSGBOLETO'
              DataSource = dsContrato
              LookupTable = cdsMsgBoleto
              LookupField = 'IDMSGBOLETO'
              Style = csDropDownList
              DropDownCount = 5
              DropDownWidth = 8
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
            end
            object GroupBox14: TGroupBox
              Left = 24
              Top = 147
              Width = 641
              Height = 68
              Caption = ' Local de Cobrança '
              TabOrder = 2
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
                DataSource = dsContrato
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
                DataSource = dsContrato
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
                DataSource = dsContrato
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
          end
          object tbsObs: TTabSheet
            Caption = 'Obs'
            ImageIndex = 6
            object Panel6: TPanel
              Left = 0
              Top = 0
              Width = 749
              Height = 419
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object Panel7: TPanel
                Left = 0
                Top = 0
                Width = 749
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
                Width = 749
                Height = 392
                ScrollBars = ssVertical
                Align = alClient
                AutoURLDetect = True
                DataField = 'CONDESCRICAO'
                DataSource = dsContrato
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
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 483
    Width = 767
    inherited tb97Fundo: TToolbar97
      Left = 327
      inherited btnConfirmar: TfcShapeBtn
        OnClick = btnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 51
    Top = 483
    TargetsData = (
      1
      4
      (
        'TMemo'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  object ImlPadrao: TImageList
    Left = 200
    Top = 479
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008400000084000000840000008400000084000000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000084000000FF00000084000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      0000008400000084000000000000000000000084000000840000008400000084
      0000008400000084000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      84000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000848484008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      00000000000000000000000000000000000000000000000000008484840000FF
      000000840000FFFFFF00FFFFFF00FFFFFF000000000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0084848400000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      00008400000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000008400000084
      00000084000000840000008400000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000084
      000000840000008400000084000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      000000840000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF000000000000000000000000008484840000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF000000000000840000FFFFFF00FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF00000084000000
      FF00000084000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00000084000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00008400000084000000840000FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00848484000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      000084000000840000008400000000000000FFFFFF00FFFFFF00840000008400
      00008400000084000000000000000000000000000000000000008484840000FF
      000000840000008400000084000000840000008400000084000000840000FFFF
      FF00FFFFFF00008400000000000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000FFFFFF00FFFFFF00840000008400000000000000FFFFFF00FFFFFF008400
      00008400000084000000000000000000000000000000000000008484840000FF
      0000008400000084000000840000008400000084000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      0000FFFFFF00FFFFFF00000000008400000000000000FFFFFF00FFFFFF008400
      0000840000000000000000000000000000000000000000000000000000008484
      840000FF000000FF000000840000008400000084000000840000008400000084
      00000084000000000000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000848484008484840000FF000000FF000000FF000000FF000000FF00008484
      8400848484000000000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      840000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000084848400FF00
      0000FF00000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000FF000000FF000000FF000000FF000000FF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FF000000FF000000FF000000FF000000FF000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      E007000000000000F00F000000000000F81F000000000000FC3F000000000000
      FE7F000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FC1FFFFFFFFFFFFFF007F83FF83FF83F
      E003E00FE00FE00FC301C007C007C007C0818003800380038040800380038003
      8020000100010001811000010001008181080001000100818008000100010101
      C001000100010081C001800380038283E003800380038023F007C007C007C007
      FC1FE00FE00FE00FFFFFF83FF83FF83FFEFFFF1FFFFFFF9FBC3DFC0FFF9FFE1F
      CC33F00FFE1FF81FC003E00FF81FE00FC007E007E00FE00FC00FF007E00F6007
      C007C003C0073007C003C001800710030000C00000038001C003E0012001C500
      E001E0071000CA81E003F0030401D507C003F0012007CA9FCC33F803801FD53F
      BEFDFC0FC1FFEA7FFEFFFE3FFFFFF0FF00000000000000000000000000000000
      000000000000}
  end
  object cdsConcilia: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 113
    Top = 331
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'select'
      '       0        AS FLGESCOLHA,'
      '       0        AS CODDOCUMENTO,'
      '       '#39'      '#39' AS COMPETENCIA,'
      '       SYSDATE  AS DATAVENCTO,'
      '       SYSDATE  AS DATALIMITE,'
      '       SYSDATE  AS DATABAIXA,'
      '       0        AS TOT_RECEBIDO,'
      '       0        AS TOT_RECEBER,'
      '       0        AS DIFERENCA,'
      '       0        AS CORRECAO,'
      '       0        AS JUROS,'
      '       0        AS MULTA,'
      '       0        AS IDCONTRATOIMOVEL,'
      
        '       '#39'                                                        ' +
        '                        '#39' AS NOME_EXTENSO'
      '   FROM'
      '       DUAL'
      '   WHERE 1 = 2'
      '')
    ClientDataSet = cdsDocumentos
    Left = 37
    Top = 343
  end
  object cdsContratos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 113
    Top = 379
  end
  object cdsDocumentos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 225
    Top = 323
    object cdsDocumentosFLGESCOLHA: TFloatField
      DisplayLabel = ' '
      DisplayWidth = 3
      FieldName = 'FLGESCOLHA'
    end
    object cdsDocumentosNOME_EXTENSO: TStringField
      DisplayLabel = 'Contrato'
      DisplayWidth = 36
      FieldName = 'NOME_EXTENSO'
      FixedChar = True
      Size = 80
    end
    object cdsDocumentosCODDOCUMENTO: TFloatField
      DisplayLabel = 'Documento'
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
    end
    object cdsDocumentosDATAVENCTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 10
      FieldName = 'DATAVENCTO'
    end
    object cdsDocumentosDATALIMITE: TDateTimeField
      DisplayLabel = 'Data Limite'
      DisplayWidth = 10
      FieldName = 'DATALIMITE'
    end
    object cdsDocumentosTOT_RECEBER: TFloatField
      DisplayLabel = 'A Receber'
      DisplayWidth = 10
      FieldName = 'TOT_RECEBER'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsDocumentosDATABAIXA: TDateTimeField
      DisplayLabel = 'Data de Baixa'
      DisplayWidth = 11
      FieldName = 'DATABAIXA'
    end
    object cdsDocumentosTOT_RECEBIDO: TFloatField
      DisplayLabel = 'Recebido'
      DisplayWidth = 10
      FieldName = 'TOT_RECEBIDO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsDocumentosCORRECAO: TFloatField
      DisplayLabel = 'Correção'
      DisplayWidth = 10
      FieldName = 'CORRECAO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsDocumentosJUROS: TFloatField
      DisplayLabel = 'Juros'
      DisplayWidth = 10
      FieldName = 'JUROS'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsDocumentosMULTA: TFloatField
      DisplayLabel = 'Multa'
      DisplayWidth = 10
      FieldName = 'MULTA'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsDocumentosDIFERENCA: TFloatField
      DisplayLabel = 'Diferença'
      DisplayWidth = 10
      FieldName = 'DIFERENCA'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsDocumentosCOMPETENCIA: TStringField
      FieldName = 'COMPETENCIA'
      Visible = False
      FixedChar = True
      Size = 6
    end
    object cdsDocumentosIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
  end
  object dsDocumentos: TDataSource
    DataSet = cdsDocumentos
    Left = 157
    Top = 285
  end
  object cdsConfDividaImob: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 297
    Top = 331
  end
  object cdsConfDividaImobXContr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 73
    Top = 187
  end
  object cdsConfDividaImobXDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 81
    Top = 275
  end
  object cdsConfDividaImobXOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsConfDividaImobXOperAfterScroll
    Left = 140
    Top = 181
    object cdsConfDividaImobXOperDESCCUSTORECIMO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 24
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object cdsConfDividaImobXOperDESCTIPO: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 19
      FieldName = 'DESCTIPO'
      Size = 10
    end
    object cdsConfDividaImobXOperVLROPERACAO: TFloatField
      DisplayLabel = 'Valor da Operação'
      DisplayWidth = 15
      FieldName = 'VLROPERACAO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsConfDividaImobXOperDESCCOND: TStringField
      DisplayLabel = 'Condicional'
      DisplayWidth = 3
      FieldName = 'DESCCOND'
      Size = 3
    end
    object cdsConfDividaImobXOperFLGESCOLHA: TFloatField
      DisplayLabel = ' '
      DisplayWidth = 3
      FieldName = 'FLGESCOLHA'
      Visible = False
    end
    object cdsConfDividaImobXOperIDCONDPAGIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONDPAGIMOVEL'
      Visible = False
    end
    object cdsConfDividaImobXOperFLGTIPO: TStringField
      FieldName = 'FLGTIPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsConfDividaImobXOperOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
    object cdsConfDividaImobXOperFLGDESCCONDIC: TFloatField
      FieldName = 'FLGDESCCONDIC'
      Visible = False
    end
    object cdsConfDividaImobXOperIDCONFDIVIDAIMOB: TFloatField
      FieldName = 'IDCONFDIVIDAIMOB'
      Visible = False
    end
    object cdsConfDividaImobXOperIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Visible = False
    end
    object cdsConfDividaImobXOperIDCONFDIVIDAXOPER: TFloatField
      FieldName = 'IDCONFDIVIDAXOPER'
      Visible = False
    end
  end
  object dsConfissaoOper: TDataSource
    AutoEdit = False
    DataSet = cdsConfDividaImobXOper
    OnStateChange = dsConfissaoOperStateChange
    Left = 213
    Top = 127
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      '   SELECT'
      '       TCR.DESCCUSTORECIMO,'
      '       CDO.FLGTIPO,'
      
        '       DECODE(CDO.FLGTIPO, '#39'D'#39', '#39'Desconto'#39','#39'Acréscimo'#39') AS DESCT' +
        'IPO,'
      '       CDO.VLROPERACAO,'
      '       CDO.OBSERVACAO,'
      '       CDO.FLGDESCCONDIC,'
      '       DECODE(CDO.FLGDESCCONDIC, 0, '#39'Não'#39','#39'Sim'#39') AS DESCCOND,'
      '       CDO.IDCONFDIVIDAIMOB,'
      '       CDO.IDTIPOCUSTORECIMO,'
      '       CDO.IDCONFDIVIDAXOPER,'
      '       CDO.IDCONDPAGIMOVEL,'
      '       DECODE(CDO.IDCONDPAGIMOVEL,NULL,0,1) AS FLGESCOLHA'
      '   FROM'
      '       CONFDIVIDAIMOB CD,'
      '       CONFDIVIDAIMOBXOPER CDO,'
      '       TIPOCUSTORECIMOV TCR'
      '   WHERE'
      '       CDO.IDCONFDIVIDAIMOB  = CD.IDCONFDIVIDAIMOB'
      '   AND TCR.IDTIPOCUSTORECIMO = CDO.IDTIPOCUSTORECIMO'
      '   AND CD.IDCONTRATORESULT  = 1788'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsConfDividaImobXOper
    Left = 37
    Top = 383
  end
  object cdsTipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 105
    Top = 419
  end
  object cdsContratoImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 233
    Top = 355
  end
  object dsContrato: TDataSource
    DataSet = cdsContratoImovel
    Left = 233
    Top = 399
  end
  object CMSqlParams3: TCMSqlParams
    SQL.Strings = (
      
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
        'UARIO'
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
      '            AND ROWNUM < 2')
    ClientDataSet = cdsContratoImovel
    Left = 37
    Top = 431
  end
  object cdsContratoXImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 337
    Top = 411
  end
  object CMSqlParams4: TCMSqlParams
    SQL.Strings = (
      
        '  SELECT CX.IDIMOVEL,       CX.IDCONTRATOIMOVEL, CX.CIMVLRALUGUE' +
        'L,'
      
        '                 CX.CIMVLRAJUSTADO, CX.FLGRATEIO,        CX.CIMP' +
        'ERCENTRATEIO,'
      
        '                 CX.CIMDESCRICAO,   I.CODTIPIMOVEL,      I.IMOCO' +
        'DIGO,'
      '                 CX.CIMDTINI,    CX.CIMDTFIM,'
      '                 I.IMONOME  AS DSC_IMOVEL,'
      '                 IM.IMONOME AS DSC_MESTRE'
      '          FROM CONTRATOXIMOVEL CX, IMOVEL I, IMOVEL IM'
      '          WHERE CX.IDIMOVEL = I.IDIMOVEL'
      '            AND I.IDIMOVELMESTRE = IM.IDIMOVEL'
      '            and cx.idcontratoimovel = 2846'
      '          ORDER BY DSC_MESTRE, DSC_IMOVEL'
      '')
    ClientDataSet = cdsContratoXImovel
    Left = 229
    Top = 439
  end
  object dscontratoXImovel: TDataSource
    DataSet = cdsContratoXImovel
    Left = 337
    Top = 431
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 665
    Top = 11
  end
  object CdsEventoImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 681
    Top = 371
  end
  object CdsContratoXVlrAno: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 689
    Top = 320
  end
  object CdsContratoXDesc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 689
    Top = 419
  end
  object CdsCondPagImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = CdsCondPagImovelBeforePost
    BeforeDelete = CdsCondPagImovelBeforeDelete
    AfterScroll = CdsCondPagImovelAfterScroll
    OnCalcFields = CdsCondPagImovelCalcFields
    Left = 513
    Top = 371
    object CdsCondPagImovelcal_tipo: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'cal_tipo'
      Calculated = True
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
    object CdsCondPagImovelFORMACALCULO: TFloatField
      DisplayLabel = 'Forma de Cálculo'
      DisplayWidth = 48
      FieldName = 'FORMACALCULO'
      Visible = False
    end
    object CdsCondPagImovelMESREFREAJUSTE: TFloatField
      DisplayLabel = 'Usa Indice Mes Anterior'
      DisplayWidth = 19
      FieldName = 'MESREFREAJUSTE'
      Visible = False
    end
    object CdsCondPagImovelPERINDPROJ: TFloatField
      DisplayLabel = 'CM Projetada'
      DisplayWidth = 15
      FieldName = 'PERINDPROJ'
      Visible = False
    end
    object CdsCondPagImovelDATACARENCIA: TDateTimeField
      DisplayLabel = 'Carência'
      DisplayWidth = 18
      FieldName = 'DATACARENCIA'
      Visible = False
    end
    object CdsCondPagImovelFLGJURCARENCIA: TStringField
      DisplayLabel = 'Juros na Carência'
      DisplayWidth = 1
      FieldName = 'FLGJURCARENCIA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsCondPagImovelIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
      Visible = False
    end
    object CdsCondPagImovelINDCORRECAO: TFloatField
      FieldName = 'INDCORRECAO'
      Visible = False
    end
    object CdsCondPagImovelIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object CdsCondPagImovelFLGSINAL: TStringField
      FieldName = 'FLGSINAL'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsCondPagImovelDATAINI: TDateTimeField
      FieldName = 'DATAINI'
      Visible = False
    end
    object CdsCondPagImovelPRAZO: TStringField
      FieldName = 'PRAZO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsCondPagImovelPERIODO: TFloatField
      FieldName = 'PERIODO'
      Visible = False
    end
    object CdsCondPagImovelTAXAJUROS: TFloatField
      FieldName = 'TAXAJUROS'
      Visible = False
    end
    object CdsCondPagImovelPERIODOTAXA: TStringField
      FieldName = 'PERIODOTAXA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsCondPagImovelATRASOINDCORREC: TFloatField
      FieldName = 'ATRASOINDCORREC'
      Visible = False
    end
    object CdsCondPagImovelATRASOMULTA: TFloatField
      FieldName = 'ATRASOMULTA'
      Visible = False
    end
    object CdsCondPagImovelATRASOTXJUROS: TFloatField
      FieldName = 'ATRASOTXJUROS'
      Visible = False
    end
    object CdsCondPagImovelFLGREAJMENSAL: TStringField
      FieldName = 'FLGREAJMENSAL'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsCondPagImovelIDINDCORRPROJ: TFloatField
      FieldName = 'IDINDCORRPROJ'
      Visible = False
    end
    object CdsCondPagImovelDATAFIM: TDateTimeField
      FieldName = 'DATAFIM'
      Visible = False
    end
    object CdsCondPagImovelTIPOCONDPAG: TStringField
      FieldName = 'TIPOCONDPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsCondPagImovelIDCONDINICIAL: TFloatField
      FieldName = 'IDCONDINICIAL'
      Visible = False
    end
    object CdsCondPagImovelIDREPACTUA: TFloatField
      FieldName = 'IDREPACTUA'
      Visible = False
    end
    object CdsCondPagImovelFLGCMMENSAL: TStringField
      FieldName = 'FLGCMMENSAL'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsCondPagImovelDATAINIAMORTIZ: TDateTimeField
      FieldName = 'DATAINIAMORTIZ'
      Visible = False
    end
    object CdsCondPagImovelPERIODOREAJUSTE: TFloatField
      FieldName = 'PERIODOREAJUSTE'
      Visible = False
    end
    object CdsCondPagImovelIDFORMACALCIMOB: TFloatField
      FieldName = 'IDFORMACALCIMOB'
      Visible = False
    end
    object CdsCondPagImovelNOME: TStringField
      FieldName = 'NOME'
      Visible = False
      Size = 60
    end
  end
  object CdsAvalistaXContrato: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 649
    Top = 323
  end
  object dsCondPagImovel: TDataSource
    AutoEdit = False
    DataSet = CdsCondPagImovel
    OnStateChange = dsCondPagImovelStateChange
    Left = 457
    Top = 391
  end
  object CMSqlParams5: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '       CP.*,'
      '       FC.NOME'
      '   FROM'
      '       CONDPAGIMOVEL CP,'
      '       FORMACALCIMOB FC'
      '   WHERE'
      '       FC.IDFORMACALCIMOB = CP.IDFORMACALCIMOB'
      ''
      ' ')
    ClientDataSet = CdsCondPagImovel
    Left = 453
    Top = 439
  end
  object cdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 609
    Top = 8
  end
  object cdsSitContImob: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 705
    Top = 120
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
  object cdsFormaCalcImob: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 697
    Top = 192
  end
  object cdsTipoCustoRec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 577
    Top = 41
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
    Aggregates = <>
    Params = <>
    Left = 633
    Top = 31
    object cdsPortadorFormaCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object cdsPortadorFormaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object cdsMsgBoleto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 577
    Top = 187
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
  object cdsPais: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 481
    Top = 107
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
    Left = 481
    Top = 176
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
  object cdsCidade: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 585
    Top = 341
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
  object CMSqlParams6: TCMSqlParams
    SQL.Strings = (
      'select * from formacalcimob'
      ''
      ' ')
    ClientDataSet = cdsFormaCalcImob
    Left = 669
    Top = 231
  end
  object cdsTipoImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 577
    Top = 357
  end
  object CMSqlParams7: TCMSqlParams
    SQL.Strings = (
      
        'SELECT TI.CODTIPIMOVEL,      TI.DESCTIPOIMOVEL,  TI.IDGRUPOTERRE' +
        'NO,'
      
        '                 TI.IDGRUPOEDIFICACAO, TI.IDGRUPOINST,     TI.ID' +
        'GRUPOELET,       '
      
        '                 TI.IDGRUPOAR,         TI.IDGRUPOVEICULO,  TI.ID' +
        'GRUPOUTILITARIO, '
      
        '                 TI.IDGRUPOMAQUINA,    TI.IDGRUPOMOVEL,    TI.CO' +
        'DALTMULTA,       '
      
        '                 TI.CODALTJUROS,       TI.CODALTCORRMON,   TI.CO' +
        'DALTMTAL,        '
      
        '                 TI.CODALTJRAL,        TI.CODALTCMAL,      TI.CO' +
        'DIMOVELSPC,      '
      
        '                 TI.IDCARTEIRASPC,     TI.FLGTIPOINTERNO,  TI.CO' +
        'DALTCONFISSAO,   '
      '                 NVL(TI.FLGCTBCONFISSAO,0) AS FLGCTBCONFISSAO,'
      '                 TAM.DESCRICAO  AS ALTERADOR_MULTA,     '
      '                 TAJ.DESCRICAO  AS ALTERADOR_JUROS,     '
      '                 TAR.DESCRICAO  AS ALTERADOR_CORRECAO,  '
      '                 TAM2.DESCRICAO AS ALTERADOR_MULTAAL,   '
      '                 TAJ2.DESCRICAO AS ALTERADOR_JUROSAL,   '
      '                 TAR2.DESCRICAO AS ALTERADOR_CORRECAOAL,'
      '                 TAC.DESCRICAO  AS ALTERADOR_CONFISSAO'
      
        '            FROM TIPOIMOVEL TI, TIPOALTERADOR TAM, TIPOALTERADOR' +
        ' TAJ, TIPOALTERADOR TAR,'
      
        '                 TIPOALTERADOR TAM2, TIPOALTERADOR TAJ2, TIPOALT' +
        'ERADOR TAR2, TIPOALTERADOR TAC'
      '           WHERE TI.CODALTMULTA   = TAM.CODALTERADOR(+)  '
      '             AND TI.CODALTJUROS   = TAJ.CODALTERADOR(+)  '
      '             AND TI.CODALTCORRMON = TAR.CODALTERADOR(+)  '
      '             AND TI.CODALTMTAL    = TAM2.CODALTERADOR(+) '
      '             AND TI.CODALTJRAL    = TAJ2.CODALTERADOR(+) '
      '             AND TI.CODALTCONFISSAO = TAC.CODALTERADOR(+)'
      '             AND TI.CODALTCMAL    = TAR2.CODALTERADOR(+)'
      '           ORDER BY DESCTIPOIMOVEL')
    ClientDataSet = cdsTipoImovel
    Left = 581
    Top = 415
  end
  object dsTipoImovel: TDataSource
    DataSet = cdsTipoImovel
    Left = 565
    Top = 399
  end
  object cdsImovelAluguel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 705
    Top = 51
  end
  object cdsOutroDadoXImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 417
    Top = 291
  end
  object dsOperXCond: TDataSource
    DataSet = cdsConfDividaImobXOper
    Left = 172
    Top = 226
  end
  object cdsContratoxMulta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 417
    Top = 343
  end
end
