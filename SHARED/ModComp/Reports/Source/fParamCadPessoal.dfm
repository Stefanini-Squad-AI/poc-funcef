inherited frmParamCadPessoal: TfrmParamCadPessoal
  Left = 287
  Top = 228
  HelpContext = 690106
  BorderStyle = bsSizeToolWin
  Caption = 'Cadastro de Pessoal'
  Font.Style = []
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnSelecao: TPanel
      inherited pgctrlPrincipal: TPageControl
        ActivePage = tsDadosOutros
        object tbsConfiguracoes: TTabSheet [0]
          Caption = 'Configurações'
          ImageIndex = 4
          object Label9: TLabel
            Left = 101
            Top = 7
            Width = 93
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data de Referência'
          end
          object rgOpcaoColuna1: TRadioGroup
            Left = 179
            Top = 75
            Width = 140
            Height = 114
            Caption = 'Imprimir a Coluna:'
            ItemIndex = 0
            Items.Strings = (
              'Data de Nascimento'
              'Salário Contratual')
            TabOrder = 1
          end
          object rgOpcaoColuna2: TRadioGroup
            Left = 38
            Top = 75
            Width = 130
            Height = 114
            Caption = 'Imprimir a Coluna:'
            ItemIndex = 0
            Items.Strings = (
              'Estado Civil'
              'Escolaridade'
              'Tipo de Deficiência'
              'Dt. Fim Estabilidade')
            TabOrder = 2
            OnClick = rgOpcaoColuna2Click
          end
          object EdDataRef: TCMDateTimePicker
            Left = 101
            Top = 23
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
        end
        inherited tsDadosFunc: TTabSheet
          inherited gbxTipContra: TGroupBox
            Caption = 'Tipo de Contrato'
            inherited cbxTemporarios: TCheckBox
              Caption = 'Terceirizado'
            end
            inherited cbxTerceiros: TCheckBox
              Caption = 'Cessão'
            end
            inherited cbxEspeciais: TCheckBox
              Caption = 'LEF'
            end
          end
          inherited gbxSituacao: TGroupBox
            Width = 180
            Height = 66
            inherited cbxAtivos: TCheckBox
              Top = 16
            end
            inherited cbxAfastados: TCheckBox
              Top = 31
            end
            inherited cbxDemitidos: TCheckBox
              Top = 47
            end
          end
          inherited rgSequencia: TGroupBox [2]
            Left = 397
            Top = 145
            Width = 188
            Height = 45
            inherited cmbSequencia: TComboBox
              Left = 9
              Top = 15
              Width = 172
              Items.Strings = (
                'Nome'
                'Matrícula'
                'Cargo,Nome'
                'Cargo,Matrícula'
                'Centro de Custo,Nome'
                'Centro de Custo,Matrícula'
                'Lotação,Nome'
                'Lotação,Matrícula'
                'C.Custo,Cargo,Nome'
                'C.Custo,Cargo,Matrícula'
                'Lotação,Cargo,Nome'
                'Lotação,Cargo,Matrícula')
            end
          end
          inherited gbxTempAdm: TGroupBox [3]
            Top = 145
            inherited Label1: TLabel
              Left = 88
              Width = 6
            end
            inherited ednAdm1: TSpinEdit
              Left = 10
              Width = 70
            end
            inherited ednAdm2: TSpinEdit
              Left = 102
              Width = 64
            end
          end
          inherited gbxTempLot: TGroupBox [4]
            Top = 145
            Width = 180
            inherited Label2: TLabel
              Width = 6
            end
          end
          inherited gbxSalario: TGroupBox [5]
            Top = 194
            inherited Label4: TLabel
              Width = 6
            end
            inherited ednSal1: TEditNum
              Left = 10
            end
          end
          inherited gbxTipoSal: TGroupBox [6]
            Top = 71
            Width = 180
            Height = 66
            inherited cbxMensalistas: TCheckBox
              Left = 10
              Top = 15
            end
            inherited cbxDiaristas: TCheckBox
              Left = 10
              Top = 31
            end
            inherited cbxHoristas: TCheckBox
              Left = 10
              Top = 47
            end
          end
          inherited gbxTempCar: TGroupBox [7]
            Left = 203
            Top = 194
            Width = 180
            Height = 43
            inherited Label3: TLabel
              Left = 78
              Top = 16
              Width = 6
            end
            inherited ednCar1: TSpinEdit
              Left = 18
              Top = 13
            end
            inherited ednCar2: TSpinEdit
              Left = 96
              Top = 13
            end
          end
          inherited gbxAdmissao: TGroupBox
            Left = 397
            Top = 4
            Width = 188
            Height = 64
            inherited Label7: TLabel
              Top = 16
              Width = 14
            end
            inherited Label8: TLabel
              Top = 40
              Width = 7
            end
            inherited EdDataAdm1: TCMDateTimePicker
              Top = 12
            end
            inherited EdDataAdm2: TCMDateTimePicker
              Top = 38
            end
          end
          object grpDtFimEstab: TGroupBox
            Left = 397
            Top = 72
            Width = 188
            Height = 65
            Caption = 'Dt. Fim Estabilidade'
            TabOrder = 9
            object Label11: TLabel
              Left = 27
              Top = 17
              Width = 14
              Height = 13
              Caption = 'De'
            end
            object Label12: TLabel
              Left = 28
              Top = 41
              Width = 7
              Height = 13
              Caption = 'A'
            end
            object dtDeFimEstab: TCMDateTimePicker
              Left = 56
              Top = 13
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
            object dtAteFimEstab: TCMDateTimePicker
              Left = 56
              Top = 39
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
        inherited tsDadosPess: TTabSheet
          inherited gbxIdade: TGroupBox
            Left = 15
            inherited Label5: TLabel
              Width = 6
            end
          end
          inherited gbxSexo: TGroupBox
            Left = 160
            Width = 86
            inherited cbxFeminino: TCheckBox
              Width = 69
            end
            inherited cbxMasculino: TCheckBox
              Width = 72
            end
          end
          inherited gbxCep: TGroupBox [2]
            Left = 253
            Width = 158
            inherited Label6: TLabel
              Left = 71
              Width = 6
            end
            inherited ednCep2: TEditNum
              Left = 89
              Width = 57
            end
          end
          inherited gbxAniv: TGroupBox [3]
            Left = 15
            inherited cbxAniv: TComboBox
              Left = 10
              Width = 119
            end
          end
          inherited gbxGrauInstr: TGroupBox [4]
            Left = 15
            Width = 396
            inherited dblckGrauInstr: TwwDBLookupCombo
              Width = 224
            end
            inherited rgSinal: TRadioGroup
              Left = 239
              Width = 147
              Height = 33
            end
          end
          inherited gbxProfis: TGroupBox [5]
            Left = 15
            Width = 233
            inherited dblckProfis: TwwDBLookupCombo
              Width = 216
            end
          end
          inherited GroupBox1: TGroupBox
            Left = 15
            Width = 234
            Height = 101
            inherited Label40: TLabel
              Top = 21
            end
            inherited Label41: TLabel
              Top = 50
            end
            inherited Label42: TLabel
              Left = 7
              Top = 77
              Width = 41
            end
            inherited rgSinTot: TRadioGroup
              Top = 11
              Height = 29
            end
            inherited speDepTot: TSpinEdit
              Top = 16
            end
            inherited speDepIR: TSpinEdit
              Top = 45
            end
            inherited speDepSF: TSpinEdit
              Left = 183
              Top = 72
            end
            inherited rgSinIR: TRadioGroup
              Top = 39
              Height = 29
            end
            inherited rgSinSF: TRadioGroup
              Left = 57
              Top = 67
              Height = 29
            end
          end
          inherited gbxEstCivil: TGroupBox
            Left = 251
            Width = 160
            inherited cbxSolteiro: TCheckBox
              Width = 70
            end
            inherited cbxCasado: TCheckBox
              Width = 72
            end
            inherited cbxSeparado: TCheckBox
              Left = 9
              Top = 50
              Width = 66
            end
            inherited cbxViuvo: TCheckBox
              Left = 101
              Top = 18
              Width = 46
            end
            inherited cbxOutro: TCheckBox
              Left = 101
              Top = 36
              Width = 56
            end
            inherited cbxSeparadoJud: TCheckBox
              Top = 67
              Width = 146
            end
          end
          object grpTipoDef: TGroupBox
            Left = 419
            Top = 3
            Width = 114
            Height = 92
            Hint = '"Tique" Uma ou Mais Alternativas'
            Caption = 'Tipo de Deficiência'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
            object chkTodosTipoDef: TCheckBox
              Left = 9
              Top = 23
              Width = 70
              Height = 13
              Caption = 'Todos'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object chkPortadorTipoDef: TCheckBox
              Left = 9
              Top = 44
              Width = 72
              Height = 13
              Caption = 'Portador'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
            object chkNaoPortadorTipoDef: TCheckBox
              Left = 9
              Top = 67
              Width = 88
              Height = 13
              Caption = 'Não Portador'
              Checked = True
              State = cbChecked
              TabOrder = 2
            end
          end
        end
        inherited tsDadosOutros: TTabSheet
          inherited rgSelRamo: TRadioGroup [0]
            TabOrder = 1
            Visible = False
          end
          inherited rgSelSindi: TRadioGroup [1]
            Enabled = False
            TabOrder = 7
            Visible = False
          end
          inherited rgSelEstab: TRadioGroup [2]
            Enabled = False
            TabOrder = 5
            Visible = False
          end
          object gbxLstCCusto: TGroupBox [3]
            Left = 8
            Top = 1
            Width = 381
            Height = 120
            Caption = 'Centro de Custo'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            object Label10: TLabel
              Left = 272
              Top = 92
              Width = 97
              Height = 13
              Caption = 'unidades vinculadas'
              OnClick = Label10Click
            end
            object chklstCCusto: TColorCheckListBox
              Left = 5
              Top = 14
              Width = 259
              Height = 101
              OnClickCheck = chklstCCustoClickCheck
              ItemHeight = 13
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
            object bbtnSelTodosCC: TBitBtn
              Left = 264
              Top = 15
              Width = 113
              Height = 25
              Caption = '   Seleciona Todos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              TabStop = False
              OnClick = bbtnSelTodosCCClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333333333333333333333333333333333300000
                0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
                FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
                9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
                00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
                993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
                3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
                3333388888887733333333333333333333333333333333333333}
              NumGlyphs = 2
              Spacing = 0
            end
            object bbtnInverteSelCC: TBitBtn
              Left = 264
              Top = 42
              Width = 113
              Height = 25
              Caption = '   Inverte Seleção'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              TabStop = False
              OnClick = bbtnInverteSelCCClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333000000003333333388888888333333330FFF
                FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
                FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
                FFF0333833338FFFFFF833333333000000003333333388888888000000003333
                333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
                00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
                033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
                3333888888877333333333333333333333333333333333333333}
              NumGlyphs = 2
              Spacing = 0
            end
            object cbVinculados: TCheckBox
              Left = 272
              Top = 79
              Width = 97
              Height = 13
              Caption = 'Selecionar'
              Checked = True
              State = cbChecked
              TabOrder = 3
            end
          end
          inherited gbxEstab: TGroupBox [4]
            Top = 140
            Height = 157
            TabOrder = 6
            Visible = True
            inherited dblckEstab: TwwDBLookupCombo
              Top = 44
              Color = clSilver
            end
            inherited lstEstab: TListBox
              Top = 68
              Height = 69
              Color = clSilver
              Font.Color = clWindowText
            end
            inherited cbxSubEstab: TCheckBox
              Top = 138
            end
            inherited lstCodEstab: TListBox
              Top = 84
              Color = clSilver
              Font.Color = clWindowText
            end
            object rbEstabTodos: TRadioButton
              Left = 8
              Top = 16
              Width = 73
              Height = 17
              Caption = 'Todos'
              Checked = True
              TabOrder = 4
              TabStop = True
              OnClick = rbEstabTodosClick
            end
            object rbEstabSeleciona: TRadioButton
              Left = 99
              Top = 16
              Width = 76
              Height = 17
              Caption = 'Seleciona'
              TabOrder = 5
              OnClick = rbEstabSelecionaClick
            end
          end
          inherited gbxRamo: TGroupBox [5]
            Top = 33
            Height = 120
            TabOrder = 2
            Visible = True
            inherited dblckRamo: TwwDBLookupCombo
              Top = 40
              Color = clSilver
            end
            inherited lstRamo: TListBox
              Top = 64
              Color = clSilver
              Font.Color = clWindowText
            end
            inherited lstCodRamo: TListBox
              Top = 70
              Color = clSilver
              Font.Color = clWindowText
            end
            object rbSegTodos: TRadioButton
              Left = 8
              Top = 16
              Width = 65
              Height = 17
              Caption = 'Todos'
              Checked = True
              TabOrder = 3
              TabStop = True
              OnClick = rbSegTodosClick
            end
            object rbSegSeleciona: TRadioButton
              Left = 88
              Top = 16
              Width = 86
              Height = 17
              Caption = 'Seleciona'
              TabOrder = 4
              OnClick = rbSegSelecionaClick
            end
          end
          inherited cbxCargoAltern: TCheckBox [6]
            TabOrder = 9
          end
          inherited gbxCCusto: TGroupBox [7]
            Left = 54
            Top = 38
            Enabled = False
            TabOrder = 10
            Visible = False
          end
          inherited gbxSindi: TGroupBox [8]
            Top = 140
            Height = 157
            TabOrder = 8
            Visible = True
            inherited dblckSindicato: TwwDBLookupCombo
              Top = 43
              Color = clSilver
            end
            inherited lstSindicato: TListBox
              Top = 67
              Color = clSilver
              Font.Color = clWindowText
            end
            inherited lstCodSindicato: TListBox
              Top = 85
              Color = clSilver
              Font.Color = clWindowText
            end
            object rbSindiTodos: TRadioButton
              Left = 8
              Top = 16
              Width = 73
              Height = 17
              Caption = 'Todos'
              Checked = True
              TabOrder = 3
              TabStop = True
              OnClick = rbSindiTodosClick
            end
            object rbSindiSeleciona: TRadioButton
              Left = 96
              Top = 16
              Width = 74
              Height = 17
              Caption = 'Seleciona'
              TabOrder = 4
              OnClick = rbSindiSelecionaClick
            end
          end
          inherited rgSelCargo: TRadioGroup [9]
            Enabled = False
            TabOrder = 3
            Visible = False
          end
          inherited gbxCargo: TGroupBox [10]
            Top = 140
            Height = 157
            TabOrder = 4
            Visible = True
            inherited dblckCargo: TwwDBLookupCombo
              Top = 44
              Color = clSilver
            end
            inherited lstCargo: TListBox
              Top = 68
              Height = 69
              Color = clSilver
              Font.Color = clWindowText
            end
            inherited lstCodCargo: TListBox
              Top = 85
              Color = clSilver
              Font.Color = clWindowText
            end
            object rbCargosTodos: TRadioButton
              Left = 8
              Top = 17
              Width = 65
              Height = 17
              Caption = 'Todos'
              Checked = True
              TabOrder = 3
              TabStop = True
              OnClick = rbCargosTodosClick
            end
            object rbCargosSeleciona: TRadioButton
              Left = 88
              Top = 17
              Width = 87
              Height = 17
              Caption = 'Seleciona'
              TabOrder = 4
              OnClick = rbCargosSelecionaClick
            end
          end
        end
        inherited tbsDemit: TTabSheet
          inherited gbxDemitidos: TGroupBox
            inherited Label711: TLabel [0]
              Left = 31
              Top = 20
              Width = 90
            end
            inherited LabelDeData: TLabel [1]
              Left = 27
              Top = 42
              Width = 14
            end
            inherited LabelAdata: TLabel [2]
              Left = 164
              Top = 42
              Width = 7
            end
            inherited rgSelMotivo: TRadioGroup [3]
              Left = 23
              Top = 82
              Enabled = False
              Visible = False
            end
            inherited gbxMotivo: TGroupBox [4]
              Left = 23
              Top = 80
              Height = 206
              Caption = 'Motivos de Desligamento a Considerar'
              Visible = True
              inherited dblckMotivo: TwwDBLookupCombo
                Left = 7
                Top = 39
                Color = clSilver
              end
              inherited lstMotivo: TListBox
                Left = 7
                Top = 63
                Height = 134
                Color = clSilver
                Font.Color = clWindowText
              end
              inherited lstCodMotivo: TListBox
                Top = 94
                Color = clSilver
                Font.Color = clWindowText
              end
              object rbMotivoTodos: TRadioButton
                Left = 8
                Top = 16
                Width = 113
                Height = 17
                Caption = 'Todos'
                Checked = True
                TabOrder = 3
                TabStop = True
                OnClick = rbMotivoTodosClick
              end
              object rbMotivoSeleciona: TRadioButton
                Left = 168
                Top = 16
                Width = 113
                Height = 17
                Caption = 'Seleciona'
                TabOrder = 4
                OnClick = rbMotivoSelecionaClick
              end
            end
            object grpDataDesliga: TGroupBox [5]
              Left = 23
              Top = 16
              Width = 331
              Height = 57
              Caption = 'Data de Desligamento'
              TabOrder = 4
              object lblDeDesliga: TLabel
                Left = 16
                Top = 24
                Width = 14
                Height = 13
                Caption = 'De'
              end
              object lblADesliga: TLabel
                Left = 176
                Top = 24
                Width = 7
                Height = 13
                Caption = 'A'
              end
            end
            inherited EdDataDem2: TCMDateTimePicker [6]
              Left = 232
              Top = 38
            end
            inherited EdDataDem1: TCMDateTimePicker [7]
              Top = 38
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      Left = 352
      DockPos = 453
      inherited sep1: TToolbarSep97
        Left = 256
        SizeHorz = 2
      end
      inherited sep3: TToolbarSep97
        Left = 173
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 92
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 175
      end
      inherited bbtnOutraVez: TBitBtn
        Enabled = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 184
      DockPos = 206
      inherited ToolbarSep971: TToolbarSep97
        SizeHorz = 2
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
      end
      inherited bbtnCancelar: TBitBtn
        Left = 83
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 306
  end
  inherited Cmp_Padrao: TCmParamReport
    Params = <
      item
        Caption = 'ListaIdFunc'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'ListaIdFunc'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'NomeEmpresa'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'NomeEmpresa'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'PorFuncionario'
        Controle = tcEdit
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'PorFuncionario'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'BuscarCargoAlternativo'
        Controle = tcEdit
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'BuscarCargoAlternativo'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'OpcaoColuna1'
        Controle = tcEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'OpcaoColuna1'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'OpcaoColuna2'
        Controle = tcEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'OpcaoColuna2'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'SelDemitidos'
        Controle = tcEdit
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'SelDemitidos'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'SelAfastados'
        Controle = tcEdit
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'SelAfastados'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Ordenacao'
        Controle = tcEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Ordenacao'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'DataReferencia'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DataReferencia'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'QtdeFunc'
        Controle = tcEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'QtdeFunc'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'TipoDeficiencia'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'TipoDeficiencia'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Estabilidade'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Estabilidade'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end>
    Left = 376
    Top = 311
  end
  inherited dsPrincipal: TwwDataSource
    Top = 349
  end
  inherited CdsParamRH: TCMClientDataSet
    Top = 342
  end
  inherited sqlParamRH: TCMSqlParams
    Top = 328
  end
  inherited CdsEstab: TCMClientDataSet
    Top = 342
  end
  inherited sqlEstab: TCMSqlParams
    Top = 328
  end
  inherited CdsPrincipal: TCMClientDataSet
    Left = 2
    Top = 344
  end
  inherited sqlPrincipal: TCMSqlParams
    Top = 346
  end
  inherited CdsCCusto: TCMClientDataSet
    IndexDefs = <
      item
        Name = 'CdsCCustoIndex'
        Fields = 'TIPO;NOME'
        Options = [ixCaseInsensitive]
      end>
    Top = 342
  end
  inherited sqlCCusto: TCMSqlParams
    Top = 328
  end
  inherited CdsProfiss: TCMClientDataSet
    Top = 342
  end
  inherited sqlProfiss: TCMSqlParams
    Top = 328
  end
  inherited CdsGrauInstr: TCMClientDataSet
    Top = 342
  end
  inherited sqlGrauInstr: TCMSqlParams
    Top = 328
  end
  inherited CdsCargo: TCMClientDataSet
    Top = 344
  end
  inherited sqlCargo: TCMSqlParams
    Top = 330
  end
  inherited CdsSindicato: TCMClientDataSet
    Top = 344
  end
  inherited sqlSindicato: TCMSqlParams
    Top = 330
  end
  inherited CdsRamo: TCMClientDataSet
    Top = 344
  end
  inherited sqlRamo: TCMSqlParams
    Top = 330
  end
  inherited CdsMotivo: TCMClientDataSet
    Top = 344
  end
  inherited sqlMotivo: TCMSqlParams
    Top = 330
  end
  inherited CdsListaFunc: TCMClientDataSet
    Left = 313
    Top = 320
  end
end
