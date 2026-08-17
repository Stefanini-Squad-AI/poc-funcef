inherited FrmParamFinancMT: TFrmParamFinancMT
  Left = 240
  Top = 101
  HelpContext = 230005
  Caption = 'Parâmetros do Controle Financeiro'
  ClientHeight = 516
  ClientWidth = 588
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 588
    Height = 430
    object pgcParametros: TPageControl
      Left = 1
      Top = 1
      Width = 586
      Height = 428
      ActivePage = TabSheet1
      Align = alClient
      MultiLine = True
      TabOrder = 0
      object tbsGeral: TTabSheet
        Caption = 'Geral &I'
        object pnlGeral1: TPanel
          Left = 0
          Top = 0
          Width = 578
          Height = 382
          Align = alClient
          BevelOuter = bvLowered
          Enabled = False
          TabOrder = 0
          object Label9: TLabel
            Left = 13
            Top = 190
            Width = 226
            Height = 13
            Caption = 'Data início do Saldo da Disponibilidade'
          end
          object Label4: TLabel
            Left = 13
            Top = 219
            Width = 207
            Height = 13
            Caption = 'Data do Bloqueio da Disponibilidade'
          end
          object lblPeriodDisp: TLabel
            Left = 13
            Top = 243
            Width = 159
            Height = 13
            Caption = 'Intervalo da Disponibilidade'
          end
          object grpIntegracao: TGroupBox
            Left = 16
            Top = 8
            Width = 425
            Height = 58
            Caption = '  Integra com a Contabilidade  '
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 0
            object sbtnSim: TSpeedButton
              Left = 45
              Top = 15
              Width = 101
              Height = 33
              GroupIndex = 1
              Caption = 'Si&m'
              Glyph.Data = {
                16030000424D160300000000000076000000280000003F000000150000000100
                040000000000A002000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                7777777777777777777777777777777777777777777777777770777888888888
                8888887777778888888888888887777778888888888888887770770000000000
                000008888770000000000000008888770000000000000008888070B7B7B70FBF
                BFB7B000070B7B7B70FBFBFB7B000070B7B7B70FBFBFB7B0000070FBFFFF0BFB
                FBFB7B7B770FBFFFF0BFBFBFB7B7B770FBFFFF0BFBFBFB7B7B7077000000BFBF
                BFFFB7B7B77000000BFBFBFFFB7B7B77000000BFBFBFFFB7B7B0707B7B7B0BFB
                FBFBFBFBF707B7B7B0BFBFBFBFBFBF707B7B7B0BFBFBFBFBFBF070BFBFFF0FFF
                FFFFBFBFB70BFBFFF0FFFFFFFBFBFB70BFBFFF0FFFFFFFBFBFB077000000FBFF
                FFFBFFFBF77000000FBFFFFFBFFFBF77000000FBFFFFFBFFFBF070B7B7BF0FF0
                FFFFFFBFF70B7B7BF0FF0FFFFFFBFF70B7B7BF0FF0FFFFFFBFF070FBFFFB0B0F
                FBFBFBFBF70FBFFFB0B0FFBFBFBFBF70FBFFFB0B0FFBFBFBFBF077000000BF0F
                BFFFFFFFF77000000BF0FBFFFFFFFF77000000BF0FBFFFFFFFF0707B7BFB00FB
                FBFBFBFBF707B7BFB00FBFBFBFBFBF707B7BFB00FBFBFBFBFBF070BFBFFF00FF
                BFBF0000070BFBFFF00FFBFBF0000070BFBFFF00FFBFBF0000007700000000FB
                FBF0777777700000000FBFBF0777777700000000FBFBF08888807777777770BF
                BF07777777777777770BFBF07777777777777770BFBF08888880777777770BFB
                F07777777777777770BFBF07777777777777770BFBF088777770777777770FBF
                077777777777777770FBF077777777777777770FBF0887777770777777770BF0
                777777777777777770BF0777777777777777770BF08877777770777777770FB0
                777777777777777770FB0777777777777777770FB08777777770777777777007
                7777777777777777770077777777777777777770087777777770}
              NumGlyphs = 3
              OnClick = sbtnSimClick
            end
            object sbtnNao: TSpeedButton
              Left = 281
              Top = 15
              Width = 101
              Height = 33
              GroupIndex = 1
              Caption = '&Não'
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333FFFFF333333000033333388888833333333333F888888FFF333
                000033338811111188333333338833FFF388FF33000033381119999111833333
                38F338888F338FF30000339119933331111833338F388333383338F300003391
                13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
                33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
                33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
                000039183811193333918338F8F833F83333838F000039118111933339118338
                F3833F83333833830000339111193333391833338F33F8333FF838F300003391
                11833338111833338F338FFFF883F83300003339111888811183333338FF3888
                83FF83330000333399111111993333333388FFFFFF8833330000333333999999
                3333333333338888883333330000333333333333333333333333333333333333
                0000}
              NumGlyphs = 2
              OnClick = sbtnNaoClick
            end
          end
          object grpAlterador: TGroupBox
            Left = 281
            Top = 66
            Width = 384
            Height = 148
            Caption = ' Alteradores para Integração dos Empréstimos no CAP '
            TabOrder = 1
            Visible = False
            object lblJuros: TLabel
              Left = 26
              Top = 18
              Width = 31
              Height = 13
              Caption = 'Juros'
            end
            object lblCorMonet: TLabel
              Left = 26
              Top = 57
              Width = 116
              Height = 13
              Caption = 'Correção Monetária '
            end
            object lblVarCambial: TLabel
              Left = 26
              Top = 96
              Width = 99
              Height = 13
              Caption = 'Variação Cambial'
            end
            object dblcJuros: TwwDBLookupCombo
              Left = 26
              Top = 30
              Width = 331
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'DESCRICAO')
              DataField = 'CODJUROS'
              DataSource = ds
              LookupTable = cdsAlteradorJuros
              LookupField = 'CODALTERADOR'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object dblcCorrecao: TwwDBLookupCombo
              Left = 26
              Top = 69
              Width = 331
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'DESCRICAO')
              DataField = 'CODCORMONET'
              DataSource = ds
              LookupTable = cdsAlteradorCMonetaria
              LookupField = 'CODALTERADOR'
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object dblcVariacao: TwwDBLookupCombo
              Left = 26
              Top = 108
              Width = 331
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'DESCRICAO')
              DataField = 'CODVARCAMBIAL'
              DataSource = ds
              LookupTable = cdsAlteradorVCambial
              LookupField = 'CODALTERADOR'
              TabOrder = 2
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
          end
          object dbcIntDispFinanc: TDBCheckBox
            Left = 13
            Top = 127
            Width = 361
            Height = 17
            Caption = 'Integra com a Disponibilidade Financeira'
            DataField = 'FLGINTDISPFIN'
            DataSource = ds
            TabOrder = 2
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
          end
          object edtDataIniDispFinanc: TCMDateTimePicker
            Left = 252
            Top = 184
            Width = 93
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAINIDISPFINANC'
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
            UnboundDataType = wwDTEdtDate
          end
          object edDataBloqDisp: TCMDateTimePicker
            Left = 252
            Top = 215
            Width = 93
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATABLOQDISPFINAN'
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
            UnboundDataType = wwDTEdtDate
          end
          object DBCheckBox3: TDBCheckBox
            Left = 13
            Top = 146
            Width = 500
            Height = 17
            Caption = 
              'Bloquear o Fluxo de Caixa Orçado, utilizando o bloqueio da dispo' +
              'nibilidade'
            DataField = 'FLGORCXDTDISP'
            DataSource = ds
            TabOrder = 5
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            Visible = False
          end
          object dbckFlgDispDocBx: TDBCheckBox
            Left = 13
            Top = 165
            Width = 388
            Height = 17
            Caption = 'Traz somente Documentos Baixados na Disponibilidade, do CAP'
            DataField = 'FLGDISPDOCBX'
            DataSource = ds
            TabOrder = 6
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object edtIntervaloDisp: TdxTimeEdit
            Left = 252
            Top = 242
            Width = 93
            Style.BorderStyle = xbs3D
            TabOrder = 7
            Alignment = taCenter
            StoredValues = 5
          end
        end
      end
      object tbsGeral2: TTabSheet
        Caption = '&Geral II'
        object pnlGeral2: TPanel
          Left = 0
          Top = 0
          Width = 578
          Height = 382
          Align = alClient
          BevelOuter = bvLowered
          Enabled = False
          TabOrder = 0
          object lblTipoAplic: TLabel
            Left = 8
            Top = 216
            Width = 221
            Height = 13
            Caption = 'Tipo de Aplicação para sobra de Caixa'
            Visible = False
          end
          object gbTrocaTipo: TGroupBox
            Left = 9
            Top = 11
            Width = 440
            Height = 120
            Caption = ' Troca de Tipo de Recebimento/Desembolso '
            TabOrder = 0
            object lblTroca: TLabel
              Left = 37
              Top = 34
              Width = 283
              Height = 13
              Caption = 'recebidos/pagos em mês diferente do lançamento'
            end
            object lblFinalCAR: TLabel
              Left = 27
              Top = 64
              Width = 126
              Height = 13
              Caption = 'Final para o C. a Rec.'
            end
            object lblFinalCAP: TLabel
              Left = 275
              Top = 64
              Width = 125
              Height = 13
              Caption = 'Final para o C. a Pag.'
            end
            object dbcbTroca: TDBCheckBox
              Left = 16
              Top = 18
              Width = 361
              Height = 17
              Caption = 'Troca Tipo de Recebimento/Desembolso para Documentos'
              DataField = 'FLGSEPARADATA'
              DataSource = ds
              TabOrder = 0
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              OnClick = dbcbTrocaClick
            end
            object dbedFinalCAR: TwwDBEdit
              Left = 27
              Top = 80
              Width = 121
              Height = 21
              DataField = 'TRDFINALCAR'
              DataSource = ds
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedFinalCAP: TwwDBEdit
              Left = 275
              Top = 80
              Width = 121
              Height = 21
              DataField = 'TRDFINALCAP'
              DataSource = ds
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object dbcbConfirmaRP: TDBCheckBox
            Left = 408
            Top = 144
            Width = 361
            Height = 17
            Caption = 'Utiliza tela de confirmar recebimento e pagamento'
            DataField = 'FLGCONFIRMARECPAG'
            DataSource = ds
            Enabled = False
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            Visible = False
          end
          object dblcTipoAplic: TCMDBLookupCombo
            Left = 8
            Top = 232
            Width = 441
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição')
            DataField = 'TIPOAPLICACAO'
            DataSource = ds
            LookupTable = cdsTipoAplicacao
            LookupField = 'TIPOAPLICACAO'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 2
            Visible = False
            AutoDropDown = True
            ShowButton = True
            OrderByDisplay = False
            AllowClearKey = True
            ShowMatchText = True
          end
          object dbckCalcImposto: TDBCheckBox
            Left = 16
            Top = 168
            Width = 361
            Height = 17
            Caption = 'Calcula Imposto sobre os Lançamentos do Financeiro'
            DataField = 'FLGCALCIMPOSTO'
            DataSource = ds
            TabOrder = 3
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object dbckImprimeCheque: TDBCheckBox
            Left = 16
            Top = 192
            Width = 377
            Height = 17
            Caption = 'Imprime Cheque na Transferência entre Contas'
            DataField = 'FLGIMPCHEQUE'
            DataSource = ds
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
      end
      object tbsNaoIdent: TTabSheet
        Caption = '&Lançamentos Não Identificados'
        object pnlLancNIDent: TPanel
          Left = 0
          Top = 0
          Width = 578
          Height = 382
          Align = alClient
          BevelOuter = bvLowered
          Enabled = False
          TabOrder = 0
          object gbIntContab: TGroupBox
            Left = 7
            Top = 3
            Width = 444
            Height = 243
            Caption = 'Para Integração Contábil do Lançamento Não Identificado'
            TabOrder = 0
            object lblCentroCusto: TLabel
              Left = 12
              Top = 145
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object lblSubConta: TLabel
              Left = 13
              Top = 194
              Width = 55
              Height = 13
              Caption = 'Subconta'
            end
            object dblcCCusto: TwwDBLookupCombo
              Left = 12
              Top = 159
              Width = 421
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome'#9'F'
                'CODEXTERNO'#9'10'#9'Código'#9'F')
              DataField = 'CCUSTOLANCNAOID'
              DataSource = ds
              LookupTable = cdsCentroCusto
              LookupField = 'CODCENTROCUSTO'
              Options = [loTitles]
              Style = csDropDownList
              Enabled = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbccConta: TCMProcuraMaskContabil
              Left = 10
              Top = 54
              Width = 423
              Height = 84
              Caption = ' Conta Contábil '
              TabOrder = 1
              OnExit = dbccContaExit
              MostraMensagens = True
              MostraDescricao = True
              DataSource = ds
              DataField = 'CONTALANCNAOIDENT'
              Mensagens.EmBranco = 'não pode estar em branco'
              Mensagens.NaoExiste = 'não existe'
              Mensagens.Sintetica = 'não pode ser sintética'
              Mensagens.Analitica = 'não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scSoAtiva
            end
            object dblcSubConta: TwwDBLookupCombo
              Left = 13
              Top = 208
              Width = 419
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMESUBCONTA'#9'60'#9'Nome da Subconta'
                'CODSUBCONTA'#9'10'#9'Código da Subconta')
              DataField = 'SUBCONTANAOIDENT'
              DataSource = ds
              LookupTable = cdsSubConta
              LookupField = 'CODSUBCONTA'
              Options = [loTitles]
              Style = csDropDownList
              Enabled = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
          object ckbExibeLancNaoIdent: TDBCheckBox
            Left = 13
            Top = 261
            Width = 345
            Height = 17
            Caption = 'Exibir os lançamentos na tela de Conciliação Bancária'
            DataField = 'EXIBELANCNAOIDENT'
            DataSource = ds
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox1: TDBCheckBox
            Left = 13
            Top = 285
            Width = 266
            Height = 17
            Hint = 
              'Altera a data de baixa do recebimento para a mesma data da regul' +
              'arização do Lançamento Não Identificado'
            Caption = 'Atualizar a data de baixa na regularização'
            DataField = 'FLGALTDTBAIXA'
            DataSource = ds
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox2: TDBCheckBox
            Left = 21
            Top = 32
            Width = 424
            Height = 17
            Hint = 
              'Altera a data de baixa do recebimento para a mesma data da regul' +
              'arização do Lançamento Não Identificado'
            Caption = 
              'Utilizar preferencialmente Contas do Tipo de Recebimento/Desembo' +
              'lso'
            DataField = 'FLGCTATPRECDES'
            DataSource = ds
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
      end
      object tbsRelatorios: TTabSheet
        Caption = 'Parâmetros para Relatórios'
        object pnlParamRelat: TPanel
          Left = 0
          Top = 0
          Width = 578
          Height = 382
          Align = alClient
          BevelOuter = bvLowered
          Enabled = False
          TabOrder = 0
          object Pnldocpendentes: TPanel
            Left = 1
            Top = 1
            Width = 576
            Height = 30
            Align = alTop
            BevelInner = bvLowered
            BevelWidth = 2
            Caption = 'Assinaturas e Vistos'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 0
          end
          object TreeAssin: TTreeView
            Left = 1
            Top = 31
            Width = 576
            Height = 350
            Align = alClient
            Indent = 23
            TabOrder = 1
            OnEdited = TreeAssinEdited
            OnEditing = TreeAssinEditing
          end
        end
      end
      object tbsFluxoCaixa: TTabSheet
        Caption = 'Fluxo de Caixa'
        ImageIndex = 4
        object pnlFluxoCaixa: TPanel
          Left = 0
          Top = 0
          Width = 578
          Height = 382
          Align = alClient
          BevelOuter = bvLowered
          Enabled = False
          TabOrder = 0
          object gpbDiasBloqueioFluxo: TGroupBox
            Left = 8
            Top = 8
            Width = 441
            Height = 105
            Caption = 'Número de dias de Bloqueio'
            TabOrder = 0
            object Label1: TLabel
              Left = 24
              Top = 20
              Width = 71
              Height = 13
              Caption = 'Curto Prazo:'
            end
            object Label2: TLabel
              Left = 20
              Top = 52
              Width = 75
              Height = 13
              Caption = 'Médio Prazo:'
            end
            object Label3: TLabel
              Left = 19
              Top = 84
              Width = 76
              Height = 13
              Caption = 'Longo Prazo:'
            end
            object Label8: TLabel
              Left = 215
              Top = 20
              Width = 102
              Height = 13
              Caption = 'Data Curto Prazo:'
            end
            object Label10: TLabel
              Left = 210
              Top = 48
              Width = 106
              Height = 13
              Caption = 'Data Médio Prazo:'
            end
            object Label11: TLabel
              Left = 208
              Top = 80
              Width = 107
              Height = 13
              Caption = 'Data Longo Prazo:'
            end
            object dbedNumDiasBloqueioCurto: TDBEdit
              Left = 104
              Top = 16
              Width = 57
              Height = 21
              DataField = 'DIASBLOQORCCP'
              DataSource = ds
              TabOrder = 0
            end
            object dbedNumDiasBloqueioMedio: TDBEdit
              Left = 104
              Top = 48
              Width = 57
              Height = 21
              DataField = 'DIASBLOQORCMP'
              DataSource = ds
              TabOrder = 1
            end
            object dbedNumDiasBloqueioLongo: TDBEdit
              Left = 104
              Top = 80
              Width = 57
              Height = 21
              DataField = 'DIASBLOQORCLP'
              DataSource = ds
              TabOrder = 2
            end
            object dtprazocurto: TCMDateTimePicker
              Left = 324
              Top = 16
              Width = 93
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'Dtcurtopz'
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
              UnboundDataType = wwDTEdtDate
            end
            object dtprazomedio: TCMDateTimePicker
              Left = 324
              Top = 48
              Width = 93
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'dtmediopz'
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
              UnboundDataType = wwDTEdtDate
            end
            object dtprazolongo: TCMDateTimePicker
              Left = 324
              Top = 80
              Width = 93
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'dtlongopz'
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
              UnboundDataType = wwDTEdtDate
            end
          end
          object dbckbAtualizaFlx: TDBCheckBox
            Left = 16
            Top = 208
            Width = 385
            Height = 17
            Caption = 'Atualiza Fluxo de Médio Prazo para Curto Prazo'
            DataField = 'FLGATUALFLX'
            DataSource = ds
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object dbckExibeColExpandidas: TDBCheckBox
            Left = 16
            Top = 232
            Width = 385
            Height = 17
            Caption = 'Exibe Colunas do Fluxo Expandidas'
            DataField = 'FLGEXIBECOLEXP'
            DataSource = ds
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object gpbTitulos: TGroupBox
            Left = 8
            Top = 120
            Width = 441
            Height = 81
            Caption = 'Título das Linhas Fixas'
            TabOrder = 3
            object Label5: TLabel
              Left = 40
              Top = 24
              Width = 85
              Height = 13
              Caption = 'Saldo Anterior:'
            end
            object Label6: TLabel
              Left = 8
              Top = 56
              Width = 117
              Height = 13
              Caption = 'Saldo a Transportar:'
            end
            object dbeTituloSaldoAnt: TDBEdit
              Left = 136
              Top = 20
              Width = 281
              Height = 21
              DataField = 'TITSALDOANT'
              DataSource = ds
              TabOrder = 0
            end
            object dbeTituloSaldoTransp: TDBEdit
              Left = 136
              Top = 52
              Width = 281
              Height = 21
              DataField = 'TITSALDOTRANSP'
              DataSource = ds
              TabOrder = 1
            end
          end
          object dbckExibeDesemb: TDBCheckBox
            Left = 16
            Top = 256
            Width = 385
            Height = 17
            Caption = 'Exibe Desembolsos  em vermelho'
            DataField = 'FLGDESVERM'
            DataSource = ds
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Transf. de Fundos'
        ImageIndex = 5
        object Label7: TLabel
          Left = 31
          Top = 7
          Width = 338
          Height = 13
          Caption = 'Valor Mínimo para Lançamentos para o Mesmo Dia (T.E.D.)'
        end
        object Label13: TLabel
          Left = 27
          Top = 205
          Width = 363
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Imposto Agregado do tipo CPMF para Transferências de Fundos'
        end
        object DBCheckBox4: TDBCheckBox
          Left = 27
          Top = 185
          Width = 369
          Height = 17
          Anchors = [akLeft, akBottom]
          Caption = 'Lança CPMF somente para tranferência de valores positivos'
          DataField = 'FLGCPMFVALPOS'
          DataSource = ds
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object wwDBEdit2: TwwDBEdit
          Left = 384
          Top = 3
          Width = 161
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'VALMINTRASNFDIA'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbcmbImpAgreg: TwwDBLookupCombo
          Left = 27
          Top = 219
          Width = 518
          Height = 21
          Anchors = [akLeft, akBottom]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCCUSTAGREG'#9'60'#9'Tipo de Imposto'#9'F')
          DataField = 'CODTIPOCUSTAGREG'
          DataSource = ds
          LookupTable = cdsTipoAgre
          LookupField = 'CODTIPOCUSTAGREG'
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object rgTipoDocTransf: TGroupBox
          Left = 27
          Top = 29
          Width = 518
          Height = 132
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = 
            'Movimentos Financeiros a serem utilizados no processo de Transfe' +
            'rência '
          TabOrder = 3
          object lblReceb: TLabel
            Left = 8
            Top = 27
            Width = 75
            Height = 13
            Caption = 'Recebimento'
          end
          object lblTituloTipoDes: TLabel
            Left = 8
            Top = 56
            Width = 69
            Height = 13
            Caption = 'Desembolso'
          end
          object Label12: TLabel
            Left = 8
            Top = 83
            Width = 101
            Height = 26
            Anchors = [akLeft, akBottom]
            Caption = 'Centro de Responsabilidade'
            WordWrap = True
          end
          object dbcmbRecebimento: TwwDBLookupCombo
            Left = 131
            Top = 23
            Width = 366
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'30'#9'Recebimento'#9'F')
            DataField = 'TIPORECEB'
            DataSource = ds
            LookupTable = cdsTipoRec
            LookupField = 'CODTIPRECDES'
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object dbcmbDesembolso: TwwDBLookupCombo
            Left = 131
            Top = 54
            Width = 366
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'30'#9'Descrição'#9'F')
            DataField = 'TIPODESEMB'
            DataSource = ds
            LookupTable = cdsTipoDes
            LookupField = 'CODTIPRECDES'
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object cmlkCRTransfBanc: TCMDBLookupCombo
            Left = 131
            Top = 88
            Width = 366
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'50'#9'Centro de Responsabilidade'#9'F')
            DataField = 'CODCRTRANF'
            DataSource = ds
            LookupTable = cdsCRTranfBanc
            LookupField = 'CODCENTRORESPON'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 588
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 477
    Width = 588
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 230005
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 392
    Top = 0
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  inherited ds: TwwDataSource
    Left = 288
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 552
    Top = 8
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 336
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 248
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 632
    Top = 8
  end
  object ImlReports: TImageList
    Left = 434
    Top = 7
    Bitmap = {
      494C010103000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400FFFFFF00FFFFFF0000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000084848400FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF00000000000000FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400848484008484840000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FF000000FF000000FF000000FFFFFF0084848400FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00FFFFFF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      84008484840000000000000000000000000000000000000000000000FF000000
      FF000000FF00000000000000FF00848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF0084848400848484000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF0000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FE3FFFFFFFFF0000F81FFF3FFCFF0000
      E01FFC3FF0F80000C01FF03FC0F00000C00FC01F00000000E00FC01F00400000
      8007C00F000000008003E00F802700008001E007800F0000C003F003C00F0000
      C00FC001C0070000E007F003E00F0000E003E00FF03F0000F007C43FF8FF0000
      F81F0DFFFFFF0000FC7FFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object cdsParamRelat: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 292
    Top = 71
  end
  object cdsAlteradorJuros: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 432
    Top = 328
  end
  object cdsAlteradorCMonetaria: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 104
    Top = 40
  end
  object cdsAlteradorVCambial: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 352
    Top = 272
  end
  object cdsTipoAplicacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 56
    Top = 80
  end
  object cdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 120
    Top = 144
  end
  object cdsSubConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 200
    Top = 72
  end
  object cdsTipoAgre: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 104
    Top = 440
  end
  object cdsCentroCustoInv: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 37
    Top = 378
  end
  object SqlCentroCusto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   CODCENTROCUSTO,'
      '   CODEXTERNO,'
      '   NOME'
      'FROM'
      '   CENTCUST'
      'ORDER BY'
      '   NOME   '
      '   ')
    ClientDataSet = cdsCentroCustoInv
    Left = 389
    Top = 114
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   CODCENTROCUSTO,'
      '   CODEXTERNO,'
      '   NOME'
      'FROM'
      '   CENTCUST'
      'ORDER BY'
      '   NOME   '
      '   ')
    ClientDataSet = cdsCentroCustoInv
    Left = 501
    Top = 106
  end
  object cdsTipoRec: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 176
    Top = 120
  end
  object cdsTipoDes: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 64
    Top = 136
  end
  object sqlaux: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   TIPORECEB, TIPODESEMB'
      'FROM'
      '  PARAFINANC')
    Left = 117
    Top = 2
  end
  object cdsaux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 72
  end
  object cdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 367
  end
  object cdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 367
  end
  object cdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 469
    Top = 258
  end
  object cdsCRTranfBanc: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 445
    Top = 394
    Data = {
      CD0300009619E0BD010000001800000002003200000003000000AC00044E4F4D
      4501004900000002000753554254595045020049000A00466978656443686172
      00055749445448020002001E000F434F4443454E54524F524553504F4E010049
      00000002000753554254595045020049000A0046697865644368617200055749
      445448020002000A0002000D44454641554C545F4F5244455202008200010000
      000100044C434944040001000908000000000941444D20474552414C04303131
      3000001041444D2E415353495354454E4349414C043031313800001041444D2E
      494E56455354494D454E544F0430313139000004616D6F720131000005616D6F
      72310132000007414E414C495345043031323300000341525104303132310000
      0341534404303231310000054154454E44043031323800000741545541524941
      043031303300001A432E20526573706F6E736162696C69646164652050616472
      E36F0A3939393939393939393900000543425320410430323031000005434253
      2042043032303200000543425320430430323033000008434543495341204904
      3032303600000D4349435554412D454449462E49043032303700000E43494355
      54412D454449462E49490430323134000005434F4D2041043032303400000543
      4F4D20420430323035000009434F4E474F4E4841530430323132000003444558
      0430313031000003474141043031303600000347414904303132300000034741
      53043031303900000347434F04303132350000094744452D435553544F043031
      3234000009474552454E43494153023031000003474643043031303700000347
      4649043031323700000347465304303130380000034752450231330000034753
      4A0430313035000007504C484142495404303131340000085053505249534D41
      04303131350000095155414C4944414445043031323900000E5345525649434F
      20534F4349414C0430313330000003535343043032313600000E5445522E434F
      4E464F52544F2049043032313800000F5445522E434F4E464F52544F20495604
      3032313900000E5445522E4E2E532E475241C74153043032313700000D544552
      2E56494C41205249434104303232300000055465737465013600000554657374
      650135000009544F54414C5052455602313200001455534520434F4E532E4C41
      4641494554452F4D47043031313200000F5553452043524943CD554D412F5343
      04303131310000155553452052494F204445204A414E4549524F2F524A043031
      3133000008555345205345444504303132320000075553452055505604303131
      370000085553452056494C410430313136}
  end
  object sqlCRTranfBanc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  NOME, CODCENTRORESPON'
      'FROM'
      '  CENTRESPON'
      'WHERE'
      '  ( ATIVO = '#39'S'#39' ) '
      'ORDER BY NOME')
    ClientDataSet = cdsCRTranfBanc
    Left = 501
    Top = 394
  end
end
