inherited frmParamVTMagnetico: TfrmParamVTMagnetico
  Left = 161
  Top = 111
  HelpContext = 210087
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Vale Transporte (Meio Magnético)'
  ClientHeight = 338
  ClientWidth = 480
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 480
    Height = 299
    BorderWidth = 2
    object pnlHorario: TPanel
      Left = 5
      Top = 5
      Width = 470
      Height = 21
      BevelInner = bvLowered
      Caption = 'Tempo Decorrido'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object pgctrlPrincipal: TPageControl
      Left = 5
      Top = 26
      Width = 470
      Height = 269
      ActivePage = tbshGeral
      TabOrder = 1
      object tbshGeral: TTabSheet
        Caption = 'Geral'
        object gbxEstab: TGroupBox
          Left = 4
          Top = 3
          Width = 453
          Height = 89
          Caption = 'Estabelecimento(s)'
          TabOrder = 0
          object chklstEstab: TColorCheckListBox
            Left = 8
            Top = 15
            Width = 301
            Height = 66
            OnClickCheck = chklstEstabClickCheck
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            Style = lbOwnerDrawFixed
            TabOrder = 0
          end
          object bbtnSelTodos: TBitBtn
            Left = 314
            Top = 14
            Width = 131
            Height = 25
            Caption = '   Seleciona Todos'
            TabOrder = 1
            TabStop = False
            OnClick = bbtnSelTodosClick
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
          object bbtnInverteSel: TBitBtn
            Left = 314
            Top = 41
            Width = 131
            Height = 25
            Caption = '   Inverte Seleção'
            TabOrder = 2
            TabStop = False
            OnClick = bbtnInverteSelClick
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
        end
        object gbxIntervRef: TGroupBox
          Left = 4
          Top = 95
          Width = 360
          Height = 45
          Caption = ' Intervalo de Referência '
          TabOrder = 1
          object Label1: TLabel
            Left = 204
            Top = 20
            Width = 15
            Height = 13
            Caption = 'até'
          end
          object Label2: TLabel
            Left = 33
            Top = 20
            Width = 14
            Height = 13
            Caption = 'De'
          end
          object dtedInicio: TCMDateTimePicker
            Left = 54
            Top = 16
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
            OnChange = dtedInicioChange
          end
          object dtedFim: TCMDateTimePicker
            Left = 225
            Top = 16
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
            TabOrder = 1
            OnChange = dtedInicioChange
          end
        end
        object gbxDiasMin: TGroupBox
          Left = 372
          Top = 95
          Width = 85
          Height = 45
          Caption = 'Dias Min.'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          object speDias: TSpinEdit
            Left = 12
            Top = 15
            Width = 62
            Height = 22
            Hint = 'Quantidade mínima de dias trabalhados a considerar'
            MaxLength = 2
            MaxValue = 31
            MinValue = 1
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Value = 1
          end
        end
        object gbxDesconta: TGroupBox
          Left = 4
          Top = 144
          Width = 360
          Height = 43
          Caption = 'Desconta em Vales'
          TabOrder = 3
          object chkbFerias: TCheckBox
            Left = 56
            Top = 18
            Width = 49
            Height = 17
            Caption = 'F&érias'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object chkbFaltas: TCheckBox
            Left = 152
            Top = 18
            Width = 49
            Height = 17
            Caption = 'F&altas'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object chkbFeriados: TCheckBox
            Left = 256
            Top = 18
            Width = 60
            Height = 17
            Caption = 'Feria&dos'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
        end
        object gbxQuantDias: TGroupBox
          Left = 372
          Top = 144
          Width = 85
          Height = 43
          Caption = 'Qtde de Dias'
          TabOrder = 4
          object spedQuantDias: TSpinEdit
            Left = 12
            Top = 14
            Width = 62
            Height = 22
            Hint = 'Quantidade de dias trabalhados a considerar'
            MaxLength = 2
            MaxValue = 31
            MinValue = 0
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Value = 0
          end
        end
        object gbxIndentFunc: TGroupBox
          Left = 4
          Top = 192
          Width = 224
          Height = 45
          Caption = 'Identificar Pessoa por'
          TabOrder = 5
          object cmbIdentFunc: TComboBox
            Left = 8
            Top = 16
            Width = 208
            Height = 21
            Hint = 'Campo impresso em cada vale'
            Style = csDropDownList
            ItemHeight = 13
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Items.Strings = (
              'Nome'
              'Matrícula'
              'Nada')
          end
        end
        object gbxOrdem: TGroupBox
          Left = 237
          Top = 192
          Width = 220
          Height = 45
          Caption = 'Ordem dos Dados'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 6
          object cmbOrderBy: TComboBox
            Left = 9
            Top = 16
            Width = 203
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'Nome'
              'Centro de Custo, Nome'
              'Centro de Custo, Matrícula'
              'Matrícula')
          end
        end
      end
      object tbshRioCard: TTabSheet
        Caption = 'Rio Card'
        ImageIndex = 1
        object rgRioCard: TRadioGroup
          Left = 8
          Top = 6
          Width = 214
          Height = 60
          Caption = 'Gerar Arquivo(s) Rio Card?'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 0
          OnClick = rgRioCardClick
        end
        object gbxCidadeRecargaRioCard: TGroupBox
          Left = 8
          Top = 74
          Width = 214
          Height = 60
          Caption = 'Cidade onde será feita a recarga'
          TabOrder = 1
          object cmbCidadeRecargaRioCard: TComboBox
            Left = 14
            Top = 23
            Width = 185
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'Teresópolis'
              'Rio de Janeiro'
              'Niterói'
              'Maricá'
              'São Gonçalo')
          end
        end
        object rgCadUsuarios: TRadioGroup
          Left = 238
          Top = 6
          Width = 214
          Height = 60
          Caption = 'Cadastrar Usuários'
          ItemIndex = 1
          Items.Strings = (
            'Somente os Admitidos no período'
            'Todas as Pessoas')
          TabOrder = 2
        end
        object gbxRedeRecarda: TGroupBox
          Left = 238
          Top = 74
          Width = 214
          Height = 60
          Caption = 'Rede de Recarga'
          TabOrder = 3
          object cmbRedeRecarda: TComboBox
            Left = 14
            Top = 23
            Width = 185
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'Ônibus'
              'Metrô'
              'Trens'
              'Barcas'
              'Rede de POS da Fetranspor')
          end
        end
        object gbxRegTipo3_RioCard: TGroupBox
          Left = 8
          Top = 142
          Width = 444
          Height = 89
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          object Label3: TLabel
            Left = 12
            Top = 26
            Width = 134
            Height = 13
            Caption = 'Data da Liberação da Carga'
          end
          object Label4: TLabel
            Left = 161
            Top = 26
            Width = 128
            Height = 13
            Caption = 'Local da entrega do cartão'
          end
          object Label5: TLabel
            Left = 308
            Top = 26
            Width = 123
            Height = 13
            Caption = 'Nº da Agência da entrega'
          end
          object dtedDataLiberacaoCarga_RioCard: TCMDateTimePicker
            Left = 12
            Top = 42
            Width = 134
            Height = 21
            Hint = 
              'Informar caso se queira fixar uma data de liberação'#13#10'maior do qu' +
              'e 5 ou 7 dias úteis após o pagamento.'
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
            ParentShowHint = False
            ShowHint = True
            ShowButton = True
            TabOrder = 0
            OnChange = dtedInicioChange
          end
          object cmbTipoEntrega_RioCard: TComboBox
            Left = 161
            Top = 42
            Width = 131
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
            OnChange = cmbTipoEntrega_RioCardChange
            Items.Strings = (
              'Domiciliar'
              'Agência Unibanco')
          end
          object spedNumAgencia: TSpinEdit
            Left = 308
            Top = 42
            Width = 123
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 2
            Value = 0
            OnChange = spedNumAgenciaChange
          end
        end
        object cbxRegTipo3_RioCard: TCheckBox
          Left = 21
          Top = 141
          Width = 212
          Height = 17
          Hint = 
            'Utilize esta opção caso não utilize'#13#10'o Site para a finalização d' +
            'o pedido.'
          Caption = 'Dados da Entrega/Retirada dos Cartões '
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = cbxRegTipo3_RioCardClick
        end
      end
      object tbshPasseCard: TTabSheet
        Caption = 'Passe Card (CE)'
        ImageIndex = 2
        object Label6: TLabel
          Left = 113
          Top = 116
          Width = 83
          Height = 13
          Caption = 'Código do Cliente'
        end
        object rgPasseCard: TRadioGroup
          Left = 9
          Top = 30
          Width = 214
          Height = 60
          Caption = 'Gerar Arquivo(s) Passe Card?'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 0
          OnClick = rgPasseCardClick
        end
        object gbxCidadeRecargaPasseCard: TGroupBox
          Left = 9
          Top = 150
          Width = 214
          Height = 60
          Caption = 'Cidade onde será feita a recarga'
          TabOrder = 1
          object cmbCidadeRecargaPasseCard: TComboBox
            Left = 14
            Top = 23
            Width = 185
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'Fortaleza')
          end
        end
        object rgCadUsuariosPasseCard: TRadioGroup
          Left = 239
          Top = 30
          Width = 214
          Height = 60
          Caption = 'Cadastrar Usuários'
          ItemIndex = 1
          Items.Strings = (
            'Somente os Admitidos no período'
            'Todas as Pessoas')
          TabOrder = 2
        end
        object gbxRedeRecargaPasseCard: TGroupBox
          Left = 239
          Top = 150
          Width = 214
          Height = 60
          Caption = 'Rede de Recarga'
          TabOrder = 3
          object cmbRedeRecargaPasseCard: TComboBox
            Left = 14
            Top = 23
            Width = 185
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'Ônibus'
              'Rede de PDV da Chegue&Pague')
          end
        end
        object redCodCli: TRealEdit
          Left = 201
          Top = 112
          Width = 60
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0')
          MaxLength = 5
          TabOrder = 4
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 299
    Width = 480
    inherited tb97Fundo: TToolbar97
      Left = 173
      DockPos = 193
      inherited sep1: TToolbarSep97
        Left = 220
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 109
        Top = 0
        Blank = True
        SizeHorz = 30
      end
      inherited bbtnSair: TBitBtn
        Left = 139
        TabOrder = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 222
        HelpContext = 210087
        TabOrder = 2
      end
      object rbtnGerar: TBitBtn
        Left = 0
        Top = 0
        Width = 109
        Height = 33
        Cancel = True
        Caption = '  &Gerar Arquivo'
        Default = True
        TabOrder = 0
        OnClick = rbtnGerarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        Spacing = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 274
    Top = 1
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
end
