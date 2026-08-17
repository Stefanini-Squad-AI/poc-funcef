inherited frmSelPessoal: TfrmSelPessoal
  Left = 119
  Top = 118
  Caption = 'Seleção de Pessoal'
  ClientHeight = 365
  ClientWidth = 614
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 614
    Height = 326
    BorderWidth = 2
    object pnSelecao: TPanel
      Left = 4
      Top = 4
      Width = 606
      Height = 318
      Align = alClient
      TabOrder = 0
      object pnResult: TPanel
        Left = 1
        Top = 1
        Width = 604
        Height = 316
        Align = alClient
        TabOrder = 0
        Visible = False
      end
      object PageControl1: TPageControl
        Left = 1
        Top = 1
        Width = 604
        Height = 316
        ActivePage = tsDadosFunc
        Align = alClient
        TabOrder = 1
        object tsDadosFunc: TTabSheet
          Caption = 'Por Dados Funcionais Básicos'
          object gbxTipContra: TGroupBox
            Left = 31
            Top = 3
            Width = 165
            Height = 135
            Hint = '"Tique" Uma ou Mais Alternativas'
            Caption = 'Tipo de Cont(r)ato'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object cbxEfetivos: TCheckBox
              Left = 9
              Top = 15
              Width = 76
              Height = 13
              Caption = 'Efetivos'
              Checked = True
              State = cbChecked
              TabOrder = 0
              OnClick = cbxEfetivosClick
            end
            object cbxTemporarios: TCheckBox
              Left = 9
              Top = 44
              Width = 91
              Height = 13
              Caption = 'Temporários'
              TabOrder = 2
              OnClick = cbxTemporariosClick
            end
            object cbxEstagiarios: TCheckBox
              Left = 9
              Top = 58
              Width = 85
              Height = 13
              Caption = 'Estagiários'
              TabOrder = 3
              OnClick = cbxEstagiariosClick
            end
            object cbxCandidatos: TCheckBox
              Left = 9
              Top = 117
              Width = 88
              Height = 13
              Caption = 'Candidatos'
              TabOrder = 7
              OnClick = cbxCandidatosClick
            end
            object cbxTerceiros: TCheckBox
              Left = 9
              Top = 72
              Width = 91
              Height = 13
              Caption = 'Terceiros'
              TabOrder = 4
              OnClick = cbxTerceirosClick
            end
            object cbxAutonomos: TCheckBox
              Left = 9
              Top = 102
              Width = 91
              Height = 13
              Caption = 'Autônomos'
              TabOrder = 6
              OnClick = cbxAutonomosClick
            end
            object cbxProprietarios: TCheckBox
              Left = 9
              Top = 87
              Width = 120
              Height = 13
              Caption = 'Prop/Dir s/ Vinc'
              TabOrder = 5
              OnClick = cbxProprietariosClick
            end
            object cbxEspeciais: TCheckBox
              Left = 9
              Top = 30
              Width = 136
              Height = 13
              Caption = 'Efetivos Especiais'
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = cbxEspeciaisClick
            end
          end
          object gbxSituacao: TGroupBox
            Left = 216
            Top = 3
            Width = 165
            Height = 135
            Hint = '"Tique" Uma ou Mais Alternativas'
            Caption = 'Situação Funcional'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            object cbxAtivos: TCheckBox
              Left = 9
              Top = 25
              Width = 76
              Height = 13
              Caption = 'Ativos'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object cbxAfastados: TCheckBox
              Left = 9
              Top = 63
              Width = 79
              Height = 13
              Caption = 'Afastados'
              TabOrder = 1
            end
            object cbxDemitidos: TCheckBox
              Left = 9
              Top = 104
              Width = 91
              Height = 13
              Caption = 'Demitidos'
              TabOrder = 2
              OnClick = cbxDemitidosClick
            end
          end
          object gbxTipoSal: TGroupBox
            Left = 216
            Top = 200
            Width = 352
            Height = 43
            Hint = '"Tique" Uma ou Mais Alternativas'
            Caption = 'Tipo de Salário'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
            object cbxMensalistas: TCheckBox
              Left = 30
              Top = 16
              Width = 94
              Height = 17
              Caption = 'Mensalistas'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object cbxDiaristas: TCheckBox
              Left = 147
              Top = 16
              Width = 76
              Height = 17
              Caption = 'Diaristas'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
            object cbxHoristas: TCheckBox
              Left = 258
              Top = 16
              Width = 76
              Height = 17
              Caption = 'Horistas'
              Checked = True
              State = cbChecked
              TabOrder = 2
            end
          end
          object gbxSalario: TGroupBox
            Left = 31
            Top = 200
            Width = 165
            Height = 43
            Hint = 'Valores Mínimo e Máximo da Faixa Desejada'
            Caption = 'Faixa de Salário (mensal)'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            object Label4: TLabel
              Left = 82
              Top = 18
              Width = 8
              Height = 13
              Caption = 'a'
            end
            object ednSal1: TEditNum
              Left = 7
              Top = 15
              Width = 70
              Height = 21
              MaxLength = 8
              TabOrder = 0
              Text = '0'
              IntDigits = 8
              Signal = False
              DecDigits = 0
              Numeric = True
            end
            object ednSal2: TEditNum
              Left = 94
              Top = 15
              Width = 64
              Height = 21
              MaxLength = 8
              TabOrder = 1
              Text = '99999999'
              IntDigits = 8
              Signal = False
              DecDigits = 0
              Numeric = True
            end
          end
          object gbxTempAdm: TGroupBox
            Left = 31
            Top = 146
            Width = 165
            Height = 43
            Hint = 'Valores Mínimo e Máximo da Faixa Desejada'
            Caption = 'Tempo de Casa (meses)'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            object Label1: TLabel
              Left = 79
              Top = 18
              Width = 8
              Height = 13
              Caption = 'a'
            end
            object ednAdm1: TSpinEdit
              Left = 22
              Top = 15
              Width = 49
              Height = 22
              MaxValue = 999
              MinValue = 0
              TabOrder = 0
              Value = 0
              OnChange = ednAdm1Change
            end
            object ednAdm2: TSpinEdit
              Left = 94
              Top = 15
              Width = 49
              Height = 22
              MaxValue = 999
              MinValue = 0
              TabOrder = 1
              Value = 999
              OnChange = ednAdm2Change
            end
          end
          object gbxTempLot: TGroupBox
            Left = 216
            Top = 146
            Width = 165
            Height = 43
            Hint = 'Valores Mínimo e Máximo da Faixa Desejada'
            Caption = 'Tempo na Lotação (meses)'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            object Label2: TLabel
              Left = 77
              Top = 18
              Width = 8
              Height = 13
              Caption = 'a'
            end
            object ednLot1: TSpinEdit
              Left = 20
              Top = 15
              Width = 49
              Height = 22
              MaxValue = 999
              MinValue = 0
              TabOrder = 0
              Value = 0
              OnChange = ednLot1Change
            end
            object ednLot2: TSpinEdit
              Left = 95
              Top = 15
              Width = 49
              Height = 22
              MaxValue = 0
              MinValue = 0
              TabOrder = 1
              Value = 999
              OnChange = ednLot2Change
            end
          end
          object gbxTempCar: TGroupBox
            Left = 403
            Top = 146
            Width = 165
            Height = 43
            Hint = 'Valores Mínimo e Máximo da Faixa Desejada'
            Caption = 'Tempo na Função (meses)'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            object Label3: TLabel
              Left = 80
              Top = 18
              Width = 8
              Height = 13
              Caption = 'a'
            end
            object ednCar1: TSpinEdit
              Left = 19
              Top = 15
              Width = 49
              Height = 22
              MaxValue = 999
              MinValue = 0
              TabOrder = 0
              Value = 0
              OnChange = ednCar1Change
            end
            object ednCar2: TSpinEdit
              Left = 97
              Top = 15
              Width = 49
              Height = 22
              MaxValue = 999
              MinValue = 0
              TabOrder = 1
              Value = 999
              OnChange = ednCar2Change
            end
          end
          object rgSequencia: TGroupBox
            Left = 403
            Top = 3
            Width = 165
            Height = 54
            Caption = 'Sequência'
            TabOrder = 2
            object cmbSequencia: TComboBox
              Left = 7
              Top = 20
              Width = 151
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Nome'
                'Matrícula'
                'Cargo,Nome'
                'Cargo,Matrícula'
                'Centro de Custo,Nome'
                'Centro de Custo,Matrícula'
                'Lotação,Nome'
                'Lotação,Matrícula'
                'Segmento,Lotação,Nome'
                'Segmento,Lotação,Matrícula'
                'C.Custo,Cargo,Nome'
                'C.Custo,Cargo,Matrícula'
                'Lotação,Cargo,Nome'
                'Lotação,Cargo,Matrícula'
                'Segmento,Lotação,Cargo,Nome'
                'Segmento,Lotação,Cargo,Matrícula')
            end
          end
          object gbxAdmissao: TGroupBox
            Left = 403
            Top = 64
            Width = 165
            Height = 73
            Caption = 'Admissão'
            TabOrder = 3
            object Label7: TLabel
              Left = 11
              Top = 22
              Width = 17
              Height = 13
              Caption = 'De'
            end
            object Label8: TLabel
              Left = 12
              Top = 46
              Width = 9
              Height = 13
              Caption = 'A'
            end
            object EdDataAdm1: TCMDateTimePicker
              Left = 40
              Top = 18
              Width = 108
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
            object EdDataAdm2: TCMDateTimePicker
              Left = 40
              Top = 44
              Width = 108
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
          end
        end
        object tsDadosPess: TTabSheet
          Caption = 'Por Dados Pessoais'
          object gbxIdade: TGroupBox
            Left = 60
            Top = 2
            Width = 139
            Height = 45
            Hint = 'Valores Mínimo e Máximo da Faixa Desejada'
            Caption = 'Faixa Etária (anos)'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object Label5: TLabel
              Left = 66
              Top = 18
              Width = 8
              Height = 13
              Caption = 'a'
            end
            object ednIda1: TSpinEdit
              Left = 8
              Top = 15
              Width = 49
              Height = 22
              MaxValue = 99
              MinValue = 0
              TabOrder = 0
              Value = 0
              OnChange = ednIda1Change
            end
            object ednIda2: TSpinEdit
              Left = 83
              Top = 15
              Width = 49
              Height = 22
              MaxValue = 99
              MinValue = 0
              TabOrder = 1
              Value = 99
              OnChange = ednIda2Change
            end
          end
          object gbxSexo: TGroupBox
            Left = 205
            Top = 2
            Width = 100
            Height = 92
            Hint = '"Tique" Uma ou Ambas Alternativas'
            Caption = 'Sexo'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            object cbxFeminino: TCheckBox
              Left = 9
              Top = 24
              Width = 80
              Height = 17
              Caption = 'Feminino'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object cbxMasculino: TCheckBox
              Left = 9
              Top = 60
              Width = 80
              Height = 17
              Caption = 'Masculino'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
          end
          object gbxProfis: TGroupBox
            Left = 60
            Top = 148
            Width = 316
            Height = 45
            Hint = 'Informe Profissão ou Nada Para Todas'
            Caption = 'Profissão'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            object dblcProfis: TwwDBLookupCombo
              Left = 9
              Top = 15
              Width = 300
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRICAO'#9'60'#9'Nome da Profissão'
                'IDPROFISS'#9'10'#9'Código')
              LookupTable = tblProfis
              LookupField = 'IDPROFISS'
              Options = [loColLines, loTitles]
              MaxLength = 8
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
              OnCloseUp = dblcProfisCloseUp
            end
          end
          object gbxGrauInstr: TGroupBox
            Left = 60
            Top = 96
            Width = 469
            Height = 50
            Caption = 'Escolaridade'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 4
            object dblcGrauInstr: TwwDBLookupCombo
              Left = 9
              Top = 15
              Width = 300
              Height = 21
              Hint = 'Código do Grau de Instrução'
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'30'#9'Descrição'#9'No'
                'IDGRINSTR'#9'10'#9'Grau'#9'No')
              LookupTable = qryGrauInstr
              LookupField = 'IDGRINSTR'
              Options = [loTitles]
              MaxLength = 8
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
              OnCloseUp = dblcGrauInstrCloseUp
            end
            object rgSinal: TRadioGroup
              Left = 330
              Top = 8
              Width = 120
              Height = 34
              Hint = 'Escolha Uma das Opções de Sinal'
              Columns = 3
              ItemIndex = 1
              Items.Strings = (
                '<='
                '='
                '>=')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object gbxCep: TGroupBox
            Left = 390
            Top = 148
            Width = 139
            Height = 45
            Hint = 'Valores Mínimo e Máximo da Faixa Desejada'
            Caption = 'Faixa de CEP (Resid.)'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            object Label6: TLabel
              Left = 66
              Top = 18
              Width = 8
              Height = 13
              Caption = 'a'
            end
            object ednCep1: TEditNum
              Left = 9
              Top = 15
              Width = 49
              Height = 21
              MaxLength = 5
              TabOrder = 0
              Text = '0'
              IntDigits = 5
              Signal = False
              DecDigits = 0
              Numeric = True
            end
            object ednCep2: TEditNum
              Left = 81
              Top = 15
              Width = 49
              Height = 21
              MaxLength = 5
              TabOrder = 1
              Text = '99999'
              IntDigits = 5
              Signal = False
              DecDigits = 0
              Numeric = True
            end
          end
          object gbxAniv: TGroupBox
            Left = 60
            Top = 50
            Width = 139
            Height = 43
            Hint = 'Mês Desejado ou Todos'
            Caption = 'Mês de Aniversário'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            object cbxAniv: TComboBox
              Left = 21
              Top = 15
              Width = 100
              Height = 21
              ItemHeight = 13
              TabOrder = 0
              Text = 'Todos'
              Items.Strings = (
                'Todos'
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
          end
          object GroupBox1: TGroupBox
            Left = 60
            Top = 195
            Width = 469
            Height = 93
            Caption = 'Qtde.Dependentes'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 7
            object Label40: TLabel
              Left = 7
              Top = 23
              Width = 46
              Height = 13
              AutoSize = False
              Caption = 'Total'
            end
            object Label41: TLabel
              Left = 7
              Top = 62
              Width = 46
              Height = 13
              AutoSize = False
              Caption = 'I.Renda'
            end
            object Label42: TLabel
              Left = 243
              Top = 23
              Width = 50
              Height = 13
              Caption = 'Sal.Fam.'
            end
            object rgSinTot: TRadioGroup
              Left = 57
              Top = 12
              Width = 120
              Height = 34
              Hint = 'Escolha Uma das Opções de Sinal'
              Columns = 3
              ItemIndex = 2
              Items.Strings = (
                '<='
                '='
                '>=')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object speDepTot: TSpinEdit
              Left = 183
              Top = 21
              Width = 37
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              MaxValue = 9
              MinValue = 0
              ParentFont = False
              TabOrder = 1
              Value = 0
              OnChange = ednIda1Change
            end
            object speDepIR: TSpinEdit
              Left = 183
              Top = 59
              Width = 37
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              MaxValue = 9
              MinValue = 0
              ParentFont = False
              TabOrder = 3
              Value = 0
              OnChange = ednIda1Change
            end
            object speDepSF: TSpinEdit
              Left = 423
              Top = 21
              Width = 37
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              MaxValue = 9
              MinValue = 0
              ParentFont = False
              TabOrder = 5
              Value = 0
              OnChange = ednIda1Change
            end
            object rgSinIR: TRadioGroup
              Left = 57
              Top = 50
              Width = 120
              Height = 34
              Hint = 'Escolha Uma das Opções de Sinal'
              Columns = 3
              ItemIndex = 2
              Items.Strings = (
                '<='
                '='
                '>=')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
            end
            object rgSinSF: TRadioGroup
              Left = 297
              Top = 12
              Width = 120
              Height = 34
              Hint = 'Escolha Uma das Opções de Sinal'
              Columns = 3
              ItemIndex = 2
              Items.Strings = (
                '<='
                '='
                '>=')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
            end
          end
          object gbxEstCivil: TGroupBox
            Left = 311
            Top = 2
            Width = 218
            Height = 92
            Hint = '"Tique" Uma ou Mais Alternativas'
            Caption = 'Estado Civil'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            object cbxSolt: TCheckBox
              Left = 9
              Top = 17
              Width = 78
              Height = 13
              Caption = 'Solteiro(a)'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object cbxCas: TCheckBox
              Left = 9
              Top = 34
              Width = 80
              Height = 13
              Caption = 'Casado(a)'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
            object cbxSep: TCheckBox
              Left = 9
              Top = 51
              Width = 89
              Height = 13
              Caption = 'Separado(a)'
              Checked = True
              State = cbChecked
              TabOrder = 2
            end
            object cbxViu: TCheckBox
              Left = 109
              Top = 34
              Width = 60
              Height = 13
              Caption = 'Viúvo'
              Checked = True
              State = cbChecked
              TabOrder = 5
            end
            object cbxOutr: TCheckBox
              Left = 109
              Top = 51
              Width = 60
              Height = 13
              Caption = 'Outro'
              Checked = True
              State = cbChecked
              TabOrder = 6
            end
            object cbxSepJud: TCheckBox
              Left = 9
              Top = 68
              Width = 173
              Height = 13
              Caption = 'Separado(a) Judicialmente'
              Checked = True
              State = cbChecked
              TabOrder = 3
            end
            object cbxDes: TCheckBox
              Left = 109
              Top = 17
              Width = 101
              Height = 13
              Caption = 'Desquitado(a)'
              Checked = True
              State = cbChecked
              TabOrder = 4
            end
          end
        end
        object tsDadosOutros: TTabSheet
          Caption = 'Por Cargo, Lotação e Sindicato'
          object rgSelEstab: TRadioGroup
            Left = 204
            Top = 140
            Width = 185
            Height = 32
            Caption = 'Estabelecimentos a Considerar'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Todos '
              'Seleciona')
            TabOrder = 5
            OnClick = rgSelEstabClick
          end
          object gbxEstab: TGroupBox
            Left = 204
            Top = 172
            Width = 185
            Height = 115
            Caption = 'Estabelecimentos'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 6
            Visible = False
            object dblcEstab: TwwDBLookupCombo
              Left = 9
              Top = 28
              Width = 165
              Height = 21
              Hint = 'Informe Estabelecimento(s) Desejado(s)'
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'40'#9'NOME')
              LookupTable = tblEstab
              LookupField = 'NOME'
              MaxLength = 5
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
              OnCloseUp = dblcEstabCloseUp
            end
            object lstEstab: TListBox
              Left = 9
              Top = 52
              Width = 165
              Height = 56
              Color = clTeal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              IntegralHeight = True
              ItemHeight = 13
              ParentFont = False
              TabOrder = 2
              OnKeyDown = lstEstabKeyDown
            end
            object cbxSubEstab: TCheckBox
              Left = 9
              Top = 12
              Width = 163
              Height = 17
              Caption = 'Inclui Sub-Divisões'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object lstCodEstab: TListBox
              Left = 12
              Top = 69
              Width = 40
              Height = 30
              Color = clTeal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              IntegralHeight = True
              ItemHeight = 13
              ParentFont = False
              TabOrder = 3
              Visible = False
            end
          end
          object rgSelSindi: TRadioGroup
            Left = 402
            Top = 140
            Width = 185
            Height = 32
            Caption = 'Sindicatos a Considerar'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Todos '
              'Seleciona')
            TabOrder = 7
            OnClick = rgSelSindiClick
          end
          object gbxSindi: TGroupBox
            Left = 402
            Top = 172
            Width = 185
            Height = 115
            Caption = 'Sindicatos'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 8
            Visible = False
            object dblcSindi: TwwDBLookupCombo
              Left = 9
              Top = 15
              Width = 165
              Height = 21
              Hint = 'Informe Sindicato(s) Desejado(s)'
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME')
              LookupTable = tblSindic
              LookupField = 'IDPESSOA'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
              OnCloseUp = dblcSindiCloseUp
            end
            object lstSindi: TListBox
              Left = 9
              Top = 39
              Width = 165
              Height = 69
              Color = clBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              IntegralHeight = True
              ItemHeight = 13
              ParentFont = False
              TabOrder = 1
              OnKeyDown = lstSindiKeyDown
            end
            object lstCodSindi: TListBox
              Left = 12
              Top = 69
              Width = 40
              Height = 30
              Color = clBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              IntegralHeight = True
              ItemHeight = 13
              ParentFont = False
              TabOrder = 2
              Visible = False
            end
          end
          object gbxLotacao: TGroupBox
            Left = 205
            Top = 34
            Width = 185
            Height = 45
            Hint = 'Máscara do Centro de Custo'
            Caption = 'Centro(s) de Custo'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object dblcLotacao: TwwDBLookupCombo
              Left = 33
              Top = 15
              Width = 118
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome'
                'CODCENTROCUSTO'#9'10'#9'Código')
              LookupTable = tblLotacao
              LookupField = 'CODCENTROCUSTO'
              Options = [loColLines, loTitles]
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
              OnCloseUp = dblcLotacaoCloseUp
            end
          end
          object rgSelCargo: TRadioGroup
            Left = 8
            Top = 140
            Width = 185
            Height = 32
            Caption = 'Cargos a Considerar'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Todos '
              'Seleciona')
            TabOrder = 3
            OnClick = rgSelCargoClick
          end
          object gbxCargo: TGroupBox
            Left = 8
            Top = 172
            Width = 185
            Height = 115
            Caption = 'Cargos'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 4
            Visible = False
            object dblcCargo: TwwDBLookupCombo
              Left = 9
              Top = 28
              Width = 165
              Height = 21
              Hint = 'Informe Cargo(s) Desejado(s)'
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'TITULO'#9'30'#9'TITULO')
              LookupTable = tblCargo
              LookupField = 'IDCARGO'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
              OnCloseUp = dblcCargoCloseUp
            end
            object lstCargo: TListBox
              Left = 9
              Top = 52
              Width = 165
              Height = 56
              Color = clMaroon
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clYellow
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              IntegralHeight = True
              ItemHeight = 13
              ParentFont = False
              TabOrder = 1
              OnKeyDown = lstCargoKeyDown
            end
            object lstCodCargo: TListBox
              Left = 12
              Top = 69
              Width = 40
              Height = 30
              Color = clMaroon
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              IntegralHeight = True
              ItemHeight = 13
              ParentFont = False
              TabOrder = 2
              Visible = False
            end
          end
          object rgSelRamo: TRadioGroup
            Left = 402
            Top = 1
            Width = 185
            Height = 32
            Caption = 'Segmentos a Considerar'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Todos '
              'Seleciona')
            TabOrder = 1
            OnClick = rgSelRamoClick
          end
          object gbxRamo: TGroupBox
            Left = 402
            Top = 34
            Width = 185
            Height = 87
            Caption = 'Segmentos (Ramos Atividade)'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
            Visible = False
            object dblcRamo: TwwDBLookupCombo
              Left = 9
              Top = 15
              Width = 165
              Height = 21
              Hint = 'Informe Segmento(s) Desejado(s)'
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRAMOFORNECEDOR'#9'40'#9'DESCRAMOFORNECEDOR')
              LookupTable = qryRamo
              LookupField = 'IDRAMOFORNECEDOR'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
              OnCloseUp = dblcRamoCloseUp
            end
            object lstRamo: TListBox
              Left = 9
              Top = 39
              Width = 165
              Height = 43
              Color = clMaroon
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clYellow
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              IntegralHeight = True
              ItemHeight = 13
              ParentFont = False
              TabOrder = 1
              OnKeyDown = lstRamoKeyDown
            end
            object lstCodRamo: TListBox
              Left = 12
              Top = 45
              Width = 40
              Height = 30
              Color = clMaroon
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              IntegralHeight = True
              ItemHeight = 13
              ParentFont = False
              TabOrder = 2
              Visible = False
            end
          end
          object cbxCargoAltern: TCheckBox
            Left = 8
            Top = 122
            Width = 160
            Height = 17
            Caption = 'Cargo Alternativo'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            State = cbChecked
            TabOrder = 9
          end
        end
        object tbsDemit: TTabSheet
          Caption = 'Demitidos'
          object gbxDemitidos: TGroupBox
            Left = 0
            Top = 0
            Width = 596
            Height = 288
            Align = alClient
            TabOrder = 0
            object LabelDeData: TLabel
              Left = 35
              Top = 113
              Width = 17
              Height = 13
              Caption = 'De'
            end
            object LabelAdata: TLabel
              Left = 36
              Top = 146
              Width = 9
              Height = 13
              Caption = 'A'
            end
            object Label711: TLabel
              Left = 71
              Top = 92
              Width = 108
              Height = 13
              Caption = 'Data Desligamento'
            end
            object EdDataDem1: TCMDateTimePicker
              Left = 72
              Top = 108
              Width = 108
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
            object EdDataDem2: TCMDateTimePicker
              Left = 72
              Top = 143
              Width = 108
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
            object rgSelMotivo: TRadioGroup
              Left = 215
              Top = 34
              Width = 331
              Height = 40
              Caption = 'Motivos de Desligamento a Considerar'
              Columns = 2
              ItemIndex = 0
              Items.Strings = (
                'Todos'
                'Seleciona')
              TabOrder = 2
              OnClick = rgSelMotivoClick
            end
            object gbxMotivos: TGroupBox
              Left = 215
              Top = 81
              Width = 331
              Height = 157
              Caption = 'Motivos'
              ParentShowHint = False
              ShowHint = False
              TabOrder = 3
              Visible = False
              object dblcMotivos: TwwDBLookupCombo
                Left = 9
                Top = 15
                Width = 310
                Height = 21
                Hint = 'Informe Sindicato(s) Desejado(s)'
                DropDownAlignment = taRightJustify
                Selected.Strings = (
                  'DESCRICAO'#9'50'#9'DESCRICAO')
                LookupTable = qryMotivo
                LookupField = 'DESCRICAO'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
                AllowClearKey = True
                OnCloseUp = dblcMotivosCloseUp
              end
              object lstMotivos: TListBox
                Left = 9
                Top = 39
                Width = 310
                Height = 108
                Color = clBlue
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                IntegralHeight = True
                ItemHeight = 13
                ParentFont = False
                TabOrder = 1
                OnKeyDown = lstMotivosKeyDown
              end
              object lstCodMotivos: TListBox
                Left = 12
                Top = 70
                Width = 40
                Height = 30
                Color = clBlue
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                IntegralHeight = True
                ItemHeight = 13
                ParentFont = False
                TabOrder = 2
                Visible = False
              end
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 326
    Width = 614
    inherited tb97Fundo: TToolbar97
      Left = 438
      DockPos = 438
    end
    inherited TB97oKCancelar: TToolbar97
      inherited ToolbarSep971: TToolbarSep97
        Left = 160
      end
      object bbtnOutraVez: TBitBtn [1]
        Left = 80
        Top = 0
        Width = 80
        Height = 33
        Caption = '&De Novo'
        TabOrder = 2
        Visible = False
        OnClick = bbtnOutraVezClick
        Kind = bkOK
        Spacing = 2
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 163
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 307
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object ds: TwwDataSource
    DataSet = tblPessoal
    Left = 59
    Top = 314
  end
  object tblCargo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDCARGO, TITULO '
      'FROM '
      '  CARGO '
      'ORDER BY '
      '  UPPER(TITULO)')
    ValidateWithMask = True
    Left = 533
    Top = 317
  end
  object tblSindic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PJ.IDPESSOA, PJ.NOME'
      'FROM'
      '  PESSOA PJ, SINDICATO S'
      'WHERE'
      '  (S.IDPESSOA = PJ.IDPESSOA)'
      'ORDER BY'
      '  NOME')
    ValidateWithMask = True
    Left = 484
    Top = 311
  end
  object tblProfis: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDPROFISS, DESCRICAO '
      'FROM '
      '  PROFISS '
      'ORDER BY '
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 444
    Top = 316
  end
  object tblPessoal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PESSOA.NOME,PESSOA.TIPO,PESSOA.NUMDOCUMENTO,'
      '  PESSOA.FLGFUNCIONARIO,PESSOA.FLGCANDIDATO,PESSOAFISICA.*,'
      '  FUNCIONARIO.MATRICULA,PESSOA.IDPESSOA,'
      '  '#39' '#39' AS TITULO, '#39' '#39' AS CENTROCUSTO'
      'FROM'
      '  PESSOA, PESSOAFISICA, FUNCIONARIO'
      'WHERE'
      '  (PESSOA.FLGCANDIDATO=1 OR PESSOA.FLGFUNCIONARIO=1) AND'
      '  (PESSOA.IDPESSOA       = FUNCIONARIO.IDPESSOA(+)) AND'
      '  (PESSOAFISICA.IDPESSOA = PESSOA.IDPESSOA)'
      'ORDER BY'
      '  FUNCIONARIO.MATRICULA, PESSOA.IDPESSOA')
    ValidateWithMask = True
    Left = 120
    Top = 318
  end
  object tblEstab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPESSOA, NOME'
      'FROM'
      '  PESSOA'
      'WHERE'
      '  (IDGRUPO = :IdEmpresaProp) OR'
      '  (IDGRUPO IN (SELECT IDPESSOA FROM PESSOA'
      '               WHERE  IDGRUPO = :IdEmpresaProp)) OR'
      '  (IDGRUPO IN (SELECT IDPESSOA FROM PESSOA'
      '               WHERE  IDGRUPO IN (SELECT IDPESSOA FROM PESSOA'
      
        '                                  WHERE  IDGRUPO = :IdEmpresaPro' +
        'p))) OR'
      '  (IDGRUPO IN (SELECT IDPESSOA FROM PESSOA'
      '               WHERE  IDGRUPO IN (SELECT IDPESSOA FROM PESSOA'
      
        '                                 WHERE   IDGRUPO IN (SELECT IDPE' +
        'SSOA FROM PESSOA'
      
        '                                                     WHERE  IDGR' +
        'UPO = :IdEmpresaProp))))'
      'ORDER BY'
      '  UPPER(NOME)')
    ValidateWithMask = True
    Left = 231
    Top = 314
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdEmpresaProp'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdEmpresaProp'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdEmpresaProp'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdEmpresaProp'
        ParamType = ptUnknown
      end>
  end
  object tblLotacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODCENTROCUSTO, NOME'
      'FROM'
      '  CENTCUST'
      'WHERE'
      '  (IDEMPRESA =:IdEmpresaProp)'
      'ORDER BY'
      '  UPPER(NOME)')
    ValidateWithMask = True
    Left = 177
    Top = 316
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdEmpresaProp'
        ParamType = ptUnknown
      end>
  end
  object qryGrauInstr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDGRINSTR, DESCRICAO, CODRAIS'
      'FROM '
      '  GRINSTR '
      'ORDER BY '
      '  IDGRINSTR')
    ValidateWithMask = True
    Left = 385
    Top = 317
  end
  object qryRamo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDRAMOFORNECEDOR, DESCRAMOFORNECEDOR'
      'FROM '
      '  RAMOFORNECEDOR'
      'WHERE '
      
        '  (IDRAMOFORNECEDOR IN (SELECT DISTINCT IDRAMOFORNECEDOR FROM FI' +
        'LIALPESSOA    '
      '                        WHERE  IDRAMOFORNECEDOR IS NOT NULL))'
      'ORDER BY '
      '  UPPER(DESCRAMOFORNECEDOR)')
    ValidateWithMask = True
    Left = 286
    Top = 313
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDMOTIVO, DESCRICAO '
      'FROM '
      '  MOTIVO '
      'WHERE '
      '  (GRUPOMOTIVO = '#39'D'#39')'
      'ORDER BY '
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 331
    Top = 317
  end
  object qryParamRH: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  FLGDOISCARGOS '
      'FROM '
      '  PARAMRH')
    ValidateWithMask = True
    Left = 541
    Top = 269
  end
end
