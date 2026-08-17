inherited frmExecRecalculoCobrImovel: TfrmExecRecalculoCobrImovel
  Left = 13
  Top = 72
  BorderStyle = bsSingle
  Caption = 'Recálculo de Cobranças em Atraso por Imóvel'
  ClientHeight = 435
  ClientWidth = 755
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 755
    Height = 402
    object Label4: TLabel
      Left = 16
      Top = 10
      Width = 92
      Height = 13
      Caption = 'Nome do Imóvel'
    end
    object Label1: TLabel
      Left = 624
      Top = 10
      Width = 98
      Height = 13
      Caption = 'Data Vencimento'
    end
    object Label9: TLabel
      Left = 16
      Top = 85
      Width = 137
      Height = 13
      Caption = 'Lançamentos em Aberto'
    end
    object lblMesVencimento: TLabel
      Left = 288
      Top = 50
      Width = 119
      Height = 13
      Caption = 'Mês de Competência'
    end
    object pgc: TPageControl
      Left = 1
      Top = 223
      Width = 753
      Height = 178
      ActivePage = tbsParametros
      Align = alBottom
      TabOrder = 0
      object tbsParametros: TTabSheet
        Caption = 'Parâmetros p/ Recálculo'
        object GroupBox2: TGroupBox
          Left = 16
          Top = 4
          Width = 457
          Height = 69
          Caption = ' Correção Monetária '
          TabOrder = 0
          TabStop = True
          object Label6: TLabel
            Left = 304
            Top = 18
            Width = 109
            Height = 13
            Caption = 'Índice de Correção'
          end
          object chkCorrecao: TCheckBox
            Left = 16
            Top = 20
            Width = 177
            Height = 17
            Caption = 'Aplicar correção monetária'
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = chkCorrecaoClick
            OnExit = chkCorrecaoClick
          end
          object chkMesAnterior: TCheckBox
            Left = 16
            Top = 40
            Width = 241
            Height = 17
            Caption = 'Utilizar índice relativo ao mês anterior'
            TabOrder = 1
            OnClick = chkCorrecaoClick
            OnExit = chkCorrecaoClick
          end
          object DBcboIndiceCorrecao: TwwDBLookupCombo
            Left = 304
            Top = 32
            Width = 129
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOESIGLA'#9'6'#9'Moeda')
            LookupTable = qryIndice
            LookupField = 'MOECODIGO'
            Style = csDropDownList
            DropDownCount = 7
            DropDownWidth = 8
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
        end
        object Panel3: TPanel
          Left = 488
          Top = 9
          Width = 237
          Height = 64
          TabOrder = 1
          object Label5: TLabel
            Left = 12
            Top = 25
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
          object edtNovaData: TCMDateTimePicker
            Left = 124
            Top = 23
            Width = 97
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
            OnExit = edtNovaDataExit
          end
        end
        object btnCalcula: TBitBtn
          Left = 552
          Top = 96
          Width = 129
          Height = 33
          Caption = 'Recalcular'
          ModalResult = 1
          TabOrder = 2
          OnClick = btnCalculaClick
          Glyph.Data = {
            F6020000424DF60200000000000076000000280000003C000000140000000100
            0400000000008002000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777000000000
            0007777777788888888888F77777777888888888888777770000770666666666
            66607777778777777777778F7777770000000000008877770000770EEEEEEEEE
            EE607777778F77777777778F7777706666666666660877770000770EE66666E6
            6E607777778F7FFFFF7FF78F777770EEEEEEEEEEE60877770000770EEFFFF6EF
            6E607777778F78888F78F78F777770EE66666E66E60877770000770EEEEEEEEE
            EE607777778F77777777778F777770EEFFFF6EF6E60877770000770EE66E66E6
            6E607777778F7FF7FF7FF78F777770EEEEEEEEEEE60877770000770EEF6EF6EF
            6E607777778F78F78F78F78F777770EE66E66E66E60877770000770EEEEEEEEE
            EE607777778F77777777778F777770EEF6EF6EF6E60877770000770EE66E66E6
            6E607777778F7FF7FF7FF78F777770EEEEEEEEEEE60877770000770EEF6EF6EF
            6E607777778F78F78F78F78F777770EE66E66E66E60877770000770EEEEEEEEE
            EE607777778F77777777778F777770EEF6EF6EF6E60877770000770EE66E66E6
            6E607777778F7FF7FF7FF78F777770EEEEEEEEEEE60877770000770EEF6EF6EF
            6E607777778F78F78F78F78F777770EE66E66E66E60877770000770EEEEEEEEE
            EE607777778F77777777778F777770EEF6EF6EF6E60877770000770E67777777
            7E607777778F8FFFFFFFF78F777770EEEEEEEEEEE60877770000770E66666666
            6E607777778F88888888878F777770E677777777E60877770000770EEEEEEEEE
            EE607777778FFFFFFFFFFF8F777770E666666666E60877770000777000000000
            0007777777788888888888F7777770EEEEEEEEEEE60777770000777777777777
            7777777777777777777777777777770000000000007777770000}
          NumGlyphs = 3
          Spacing = 3
        end
        object GroupBox1: TGroupBox
          Left = 16
          Top = 76
          Width = 457
          Height = 65
          Caption = ' Multa / Juros de Mora '
          TabOrder = 3
          object Label3: TLabel
            Left = 121
            Top = 18
            Width = 29
            Height = 13
            Caption = 'Mora'
          end
          object Label12: TLabel
            Left = 225
            Top = 18
            Width = 80
            Height = 13
            Caption = 'Períodicidade'
          end
          object Label16: TLabel
            Left = 17
            Top = 18
            Width = 32
            Height = 13
            Caption = 'Multa'
          end
          object Label56: TLabel
            Left = 93
            Top = 33
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
          object Label17: TLabel
            Left = 197
            Top = 33
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
          object chkMoraProp: TCheckBox
            Left = 344
            Top = 33
            Width = 97
            Height = 17
            Caption = 'Proporcional'
            TabOrder = 0
            OnClick = chkCorrecaoClick
            OnExit = chkCorrecaoClick
          end
          object edtPercMulta: TRealEdit
            Left = 17
            Top = 32
            Width = 72
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '   0,0000')
            TabOrder = 1
            WordWrap = False
            IntDigits = 9
            DecDigits = 4
            NumberFormat = fFixed
            Signal = False
          end
          object edtPercMora: TRealEdit
            Left = 121
            Top = 32
            Width = 72
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '   0,0000')
            TabOrder = 2
            WordWrap = False
            IntDigits = 9
            DecDigits = 4
            NumberFormat = fFixed
            Signal = False
          end
          object cboPerMora: TComboBox
            Left = 225
            Top = 32
            Width = 104
            Height = 21
            Style = csDropDownList
            DropDownCount = 2
            ItemHeight = 13
            TabOrder = 3
            Items.Strings = (
              'Diária'
              'Mensal')
          end
        end
      end
      object tbsAlteradores: TTabSheet
        Caption = 'Alteradores'
        object Label13: TLabel
          Left = 104
          Top = 100
          Width = 59
          Height = 13
          Caption = 'ATENÇÃO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          WordWrap = True
        end
        object Label14: TLabel
          Left = 168
          Top = 100
          Width = 436
          Height = 13
          Caption = 
            ':  Favor certificar-se de indicar os ALTERADORES apropriados a c' +
            'ada caso.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label15: TLabel
          Left = 168
          Top = 116
          Width = 417
          Height = 13
          Caption = 
            '   Caso contrário, pode haver inconsistência no cálculo dos Docu' +
            'mentos.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label18: TLabel
          Left = 40
          Top = 12
          Width = 116
          Height = 13
          Caption = 'Alterador p/ Multa:  '
        end
        object Label19: TLabel
          Left = 41
          Top = 36
          Width = 115
          Height = 13
          Caption = 'Alterador p/ Juros:  '
        end
        object Label20: TLabel
          Left = 16
          Top = 60
          Width = 140
          Height = 13
          Caption = 'Alterador p/ Corr.Mon.:  '
        end
        object DBcboAltMulta: TwwDBLookupCombo
          Left = 152
          Top = 8
          Width = 305
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'DESCRICAO')
          LookupTable = qryLookAlterador
          LookupField = 'CODALTERADOR'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          OnCloseUp = DBcboAltMultaCloseUp
        end
        object DBcboAltJuros: TwwDBLookupCombo
          Left = 152
          Top = 32
          Width = 305
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'DESCRICAO')
          LookupTable = qryLookAlterador
          LookupField = 'CODALTERADOR'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          OnCloseUp = DBcboAltJurosCloseUp
        end
        object DBcboAltCorrecao: TwwDBLookupCombo
          Left = 152
          Top = 56
          Width = 305
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'DESCRICAO')
          LookupTable = qryLookAlterador
          LookupField = 'CODALTERADOR'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          OnCloseUp = DBcboAltCorrecaoCloseUp
        end
        object Panel2: TPanel
          Left = 480
          Top = 8
          Width = 237
          Height = 69
          TabOrder = 3
          object Label10: TLabel
            Left = 64
            Top = 16
            Width = 101
            Height = 13
            Caption = 'Data Lançamento'
          end
          object edtDataLancamento: TCMDateTimePicker
            Left = 64
            Top = 30
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
          end
        end
      end
      object tbsResultado: TTabSheet
        Caption = 'Histórico de Alteradores do Lançamento'
        object Label11: TLabel
          Left = 13
          Top = 10
          Width = 151
          Height = 13
          Caption = 'Alteradores do Documento'
        end
        object DBgrdAlteradoresLanc: TwwDBGrid
          Left = 12
          Top = 24
          Width = 573
          Height = 113
          Selected.Strings = (
            'DESCRICAO'#9'18'#9'Tipo do Alterador'
            'HISTORICOCOMPL'#9'27'#9'Histórico'
            'VALOR'#9'10'#9'Valor'
            'DATALANCTO'#9'10'#9'Data')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsAlteradoresLanc
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
          OnEnter = DBgrdReajusteEnter
          OnExit = DBgrdReajusteExit
          IndicatorColor = icBlack
        end
        object btnExcluiAlterador: TBitBtn
          Left = 597
          Top = 64
          Width = 127
          Height = 33
          Caption = 'Excluir Alterador'
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
      end
    end
    object btnBuscaImovel: TBitBtn
      Left = 560
      Top = 24
      Width = 23
      Height = 22
      Hint = 'Busca um Contrato'
      TabOrder = 1
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
    object btnLimpaContrato: TBitBtn
      Left = 584
      Top = 24
      Width = 23
      Height = 22
      Hint = 'Limpa Contrato selecionado'
      TabOrder = 2
      OnClick = btnLimpaContratoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888FF8888888888888778888888888888F77F8888888888800F0888
        88888888F7787F88888888800FFF0888888888F7788878F88888800FFF8FF088
        888887788888F7F8888887FF888FF088888887F88888878F888887FF8888FF08
        8888878F88888F7F8888887F88888F088888887F88888878F888887FF8800FF0
        88888878F88778F78F888887FF0910FF08888887F87F878878F88887FF09910F
        F08888878F7F8878F78888887FF090307888888878F7F7F77F88888887FF0BB3
        08888888878F7F8878F88888887770BB30888888887777F8878F88888888880B
        B30888888888887F887888888888888888888888888888888888}
      NumGlyphs = 2
    end
    object edtNomeContrato: TEdit
      Left = 16
      Top = 24
      Width = 545
      Height = 21
      TabStop = False
      Enabled = False
      TabOrder = 3
    end
    object edtDataVenc: TCMDateTimePicker
      Left = 624
      Top = 24
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
      TabOrder = 4
      OnExit = edtDataVencExit
    end
    object DBgrdReajuste: TwwDBGrid
      Left = 16
      Top = 100
      Width = 713
      Height = 104
      Selected.Strings = (
        'NOME_IMOVEL'#9'25'#9'Imóvel'
        'DESCCUSTORECIMO'#9'17'#9'Tipo de Receita'
        'VLRLANCRECEB'#9'11'#9'A Receber'
        'VLRMULTA'#9'10'#9'Multa'
        'VLRJUROS'#9'10'#9'Juros'
        'VLRCORRECAOMON'#9'10'#9'Correção'
        'PERCCORRMONET'#9'8'#9'     %'
        'VALORTOTAL'#9'11'#9'Total'
        'MESCOMPETENCIA'#9'5'#9'Mês'
        'ANOCOMPETENCIA'#9'5'#9'Ano'
        'DATAVENCIMENTO'#9'13'#9'Vencimento')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 5
      TitleAlignment = taLeftJustify
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'Small Fonts'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = DBgrdReajusteCalcCellColors
      OnEnter = DBgrdReajusteEnter
      OnExit = DBgrdReajusteExit
      IndicatorColor = icBlack
      OnTopRowChanged = DBgrdReajusteTopRowChanged
    end
    object DBspnAno: TwwDBSpinEdit
      Left = 448
      Top = 64
      Width = 65
      Height = 21
      Increment = 1
      MaxValue = 2055
      MinValue = 1980
      Enabled = False
      TabOrder = 6
      UnboundDataType = wwDefault
    end
    object cboMes: TComboBox
      Left = 288
      Top = 64
      Width = 161
      Height = 21
      Style = csDropDownList
      Enabled = False
      ItemHeight = 13
      TabOrder = 7
      Items.Strings = (
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
    object chkCompetencia: TCheckBox
      Left = 32
      Top = 64
      Width = 249
      Height = 17
      Caption = 'Levar em conta o mês de competência:'
      TabOrder = 8
      OnClick = chkCompetenciaClick
    end
    object btnSeleciona: TBitBtn
      Left = 544
      Top = 60
      Width = 185
      Height = 29
      Caption = 'Seleciona Lançamentos'
      TabOrder = 9
      OnClick = btnSelecionaClick
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777700000077770000000000777700000077770FFFFFFFF077770000007777
        0F777777F0777700000077770FFFFFFFF077770000007C770F777777F077C700
        00007CC70FFFFFFFF07CC70000007CCC0F777777F0CCC70000007CCC0FFFFFFF
        F0CCC70000007CC70F777777F07CC70000007C770FFFFFFFF077C70000007777
        0FFFF777F0777700000077770000FFFFF07777000000777770F0F777F0777700
        000077777700FFFFF07777000000777777700000007777000000777777777777
        777777000000777777777777777777000000}
    end
  end
  inherited Dock971: TDock97
    Top = 402
    Width = 755
    inherited tb97Fundo: TToolbar97
      Left = 564
      DockPos = 564
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 326
      DockPos = 326
      inherited ToolbarSep971: TToolbarSep97
        Left = 231
      end
      inherited ToolbarSep974: TToolbarSep97
        Left = 147
      end
      object ToolbarSep975: TToolbarSep97 [3]
        Left = 230
        Top = 0
        Blank = True
        SizeHorz = 1
        SizeVert = 1
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 145
        Caption = 'A&plica Alteradores'
        Default = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 149
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65499
    Top = 65499
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryLookMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  MOECODIGO, MOEDESC, MOESIGLA  '
      'FROM '
      '  MOEDA'
      'ORDER BY'
      '  MOESIGLA')
    ValidateWithMask = True
    Left = 432
    Top = 168
    object qryLookMoedaMOESIGLA: TStringField
      DisplayLabel = 'Moeda'
      DisplayWidth = 6
      FieldName = 'MOESIGLA'
      Origin = 'MOEDA.MOESIGLA'
      Size = 10
    end
    object qryLookMoedaMOEDESC: TStringField
      DisplayWidth = 15
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
      Visible = False
    end
    object qryLookMoedaMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
      Visible = False
    end
  end
  object qry: TwwQuery
    CachedUpdates = True
    AfterScroll = qryAfterScroll
    OnCalcFields = qryCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   (IM.IMONOME||'#39' - '#39'||I.IMONOME) AS NOME_IMOVEL,'
      ''
      '   LI.IDLANCIMOVEL,'
      '   LI.IDIMOVEL, LI.IDCONTRATOIMOVEL, LI.IDTIPOCUSTORECIMO,'
      '   LI.IDPESSOA, LI.PLNCODIGO, LI.CODDOCUMENTO,'
      '   LI.VLRLANCRECEB, LI.VLRLANCOMRECEB, LI.MOEDARECEB,'
      '   LI.VLRMULTA, LI.VLRJUROS, LI.VLRCORRECAOMON,'
      '   LI.FLGTIPOLANCAMENTO, LI.RECPAG,'
      '   LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA,'
      '   LI.DATALANCAMENTO, LI.DATAVENCIMENTO,'
      '   LI.DATACORRECAO, LI.FLGMULTACALCULADA,'
      '   0 AS PERCCORRMONET,'
      '   I.IDCARTEIRAINVEST, H.HISTMOVCARTINV, T.DESCCUSTORECIMO'
      ''
      'FROM'
      '   LANCAMENTOSIMOVEL LI, IMOVEL I, IMOVEL IM,'
      '   HISTCARTINV H, TIPOCUSTORECIMOV T'
      'WHERE'
      '   ( LI.RECPAG = '#39'R'#39' )'
      '   AND ( LI.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( LI.IDLANCIMOVEL = H.IDLANCIMOVEL )'
      '   AND ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 215
    Top = 149
    object qryNOME_IMOVEL: TStringField
      DisplayLabel = 'Imóvel'
      DisplayWidth = 25
      FieldName = 'NOME_IMOVEL'
      Origin = 'IMOVEL.IMONOME'
      ReadOnly = True
      Size = 123
    end
    object qryDESCCUSTORECIMO: TStringField
      DisplayLabel = 'Tipo de Receita'
      DisplayWidth = 17
      FieldName = 'DESCCUSTORECIMO'
      ReadOnly = True
      Size = 60
    end
    object qryVLRLANCRECEB: TFloatField
      DisplayLabel = 'A Receber'
      DisplayWidth = 11
      FieldName = 'VLRLANCRECEB'
      ReadOnly = True
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qryVLRMULTA: TFloatField
      DisplayLabel = 'Multa'
      DisplayWidth = 10
      FieldName = 'VLRMULTA'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qryVLRJUROS: TFloatField
      DisplayLabel = 'Juros'
      DisplayWidth = 10
      FieldName = 'VLRJUROS'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qryVLRCORRECAOMON: TFloatField
      DisplayLabel = 'Correção'
      DisplayWidth = 10
      FieldName = 'VLRCORRECAOMON'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qryPERCCORRMONET: TFloatField
      DisplayLabel = '     %'
      DisplayWidth = 8
      FieldName = 'PERCCORRMONET'
    end
    object qryVALORTOTAL: TFloatField
      DisplayLabel = 'Total'
      DisplayWidth = 11
      FieldKind = fkCalculated
      FieldName = 'VALORTOTAL'
      ReadOnly = True
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      Calculated = True
    end
    object qryMESCOMPETENCIA: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Mês'
      DisplayWidth = 5
      FieldName = 'MESCOMPETENCIA'
      ReadOnly = True
    end
    object qryANOCOMPETENCIA: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Ano'
      DisplayWidth = 5
      FieldName = 'ANOCOMPETENCIA'
      ReadOnly = True
    end
    object qryDATAVENCIMENTO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      DisplayWidth = 13
      FieldName = 'DATAVENCIMENTO'
      ReadOnly = True
    end
    object qryIDLANCIMOVEL: TFloatField
      FieldName = 'IDLANCIMOVEL'
      Visible = False
    end
    object qryIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object qryIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Visible = False
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object qryVLRLANCOMRECEB: TFloatField
      FieldName = 'VLRLANCOMRECEB'
      Visible = False
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qryMOEDARECEB: TFloatField
      FieldName = 'MOEDARECEB'
      Visible = False
    end
    object qryFLGTIPOLANCAMENTO: TStringField
      FieldName = 'FLGTIPOLANCAMENTO'
      Visible = False
      Size = 1
    end
    object qryRECPAG: TStringField
      FieldName = 'RECPAG'
      Visible = False
      Size = 1
    end
    object qryDATALANCAMENTO: TDateTimeField
      FieldName = 'DATALANCAMENTO'
      Visible = False
    end
    object qryDATACORRECAO: TDateTimeField
      FieldName = 'DATACORRECAO'
      Visible = False
    end
    object qryFLGMULTACALCULADA: TFloatField
      FieldName = 'FLGMULTACALCULADA'
      Visible = False
    end
    object qryIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryHISTMOVCARTINV: TStringField
      FieldName = 'HISTMOVCARTINV'
      Visible = False
      Size = 60
    end
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 247
    Top = 149
  end
  object qrySaldoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   SUM(DECODE(D.RECPAG, '#39'P'#39','
      
        '       DECODE(L.DEBCRE, '#39'D'#39', L.VALOR * -1, L.VALOR), DECODE(L.DE' +
        'BCRE, '#39'D'#39', L.VALOR, L.VALOR * -1)'
      '      ) ) AS SALDO'
      'FROM'
      '   DOCUMENTO D, LANCTODOCUM L'
      'WHERE'
      '       ( RTRIM(L.OPERACAO) IN('#39'1'#39','#39'2'#39') )'
      '   AND ( D.CODDOCUMENTO =:DOCUMENTO )'
      '   AND ( D.CODDOCUMENTO = L.CODDOCUMENTO )')
    ValidateWithMask = True
    Left = 616
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DOCUMENTO'
        ParamType = ptUnknown
      end>
    object qrySaldoDocSALDO: TFloatField
      FieldName = 'SALDO'
    end
  end
  object qryIndice: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   M.MOECODIGO, M.MOEDESC, M.MOESIGLA,'
      '   M.MOEPERIODICIDADE, M.MOEINATIVO,'
      '   M.FLGPERCVALOR, M.DATAINICIO, M.DATAFIM'
      'FROM'
      '   MOEDA M'
      'ORDER BY'
      '   M.MOESIGLA')
    ValidateWithMask = True
    Left = 688
    Top = 131
    object qryIndiceMOESIGLA: TStringField
      DisplayLabel = 'Moeda'
      DisplayWidth = 6
      FieldName = 'MOESIGLA'
      Origin = 'MOEDA.MOESIGLA'
      Size = 10
    end
    object qryIndiceMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
      Visible = False
    end
    object qryIndiceMOEDESC: TStringField
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
      Visible = False
    end
    object qryIndiceMOEPERIODICIDADE: TStringField
      FieldName = 'MOEPERIODICIDADE'
      Origin = 'MOEDA.MOEPERIODICIDADE'
      Visible = False
      Size = 1
    end
    object qryIndiceMOEINATIVO: TStringField
      FieldName = 'MOEINATIVO'
      Origin = 'MOEDA.MOEINATIVO'
      Visible = False
      Size = 1
    end
    object qryIndiceFLGPERCVALOR: TStringField
      FieldName = 'FLGPERCVALOR'
      Origin = 'MOEDA.FLGPERCVALOR'
      Visible = False
      Size = 1
    end
    object qryIndiceDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'MOEDA.DATAINICIO'
      Visible = False
    end
    object qryIndiceDATAFIM: TDateTimeField
      FieldName = 'DATAFIM'
      Origin = 'MOEDA.DATAFIM'
      Visible = False
    end
  end
  object qryCotacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   M.MOECODIGO, C.COTVALOR, C.COTMESREF, M.MOEDESC, M.MOESIGLA'
      'FROM'
      '   COTACAOMOEDA C, MOEDA M'
      'WHERE'
      '       ( C.MOECODIGO =:MOEDA )'
      
        '   AND ( (SUBSTR(C.COTMESREF, 3, 4)||SUBSTR(C.COTMESREF, 1, 2)) ' +
        '>=:DATAINI )'
      
        '   AND ( (SUBSTR(C.COTMESREF, 3, 4)||SUBSTR(C.COTMESREF, 1, 2)) ' +
        '<=:DATAFIM )'
      '   AND ( C.MOECODIGO = M.MOECODIGO )'
      'ORDER BY'
      '   C.COTDATA')
    ValidateWithMask = True
    Left = 688
    Top = 119
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end>
    object qryCotacaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
    end
    object qryCotacaoCOTVALOR: TFloatField
      FieldName = 'COTVALOR'
      Origin = 'COTACAOMOEDA.COTVALOR'
    end
    object qryCotacaoMOEDESC: TStringField
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
    end
    object qryCotacaoMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Origin = 'MOEDA.MOESIGLA'
      Size = 10
    end
  end
  object qryDataUltCorrecao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MAX(L.DATALANCTO) AS DATAULTCORRECAO'
      'FROM'
      '   DOCUMENTO D, LANCTODOCUM L'
      'WHERE'
      '   ( D.CODDOCUMENTO =:DOCUMENTO ) AND'
      '   ('
      '   ( L.OPERACAO <> '#39'5'#39' ) OR ( L.OPERACAO IS NULL )'
      '   ) AND'
      '   ( D.CODDOCUMENTO = L.CODDOCUMENTO )')
    ValidateWithMask = True
    Left = 528
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryDataUltCorrecaoDATAULTCORRECAO: TDateTimeField
      FieldName = 'DATAULTCORRECAO'
      Origin = 'LANCTODOCUM.DATALANCTO'
    end
  end
  object qryLookAlterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODALTERADOR, DESCRICAO'
      'FROM'
      '   TIPOALTERADOR'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP ) AND'
      '   ( RECPAG = '#39'R'#39' ) AND'
      '   ( ACRESDECRES = '#39'D'#39' )'
      'ORDER BY'
      '   DESCRICAO')
    ValidateWithMask = True
    Left = 432
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryLookAlteradorDESCRICAO: TStringField
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPOALTERADOR.DESCRICAO'
      Size = 35
    end
    object qryLookAlteradorCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Origin = 'TIPOALTERADOR.CODALTERADOR'
      Visible = False
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 528
    Top = 168
  end
  object upd: TUpdateSQL
    ModifySQL.Strings = (
      'update LANCAMENTOSIMOVEL'
      'set'
      '  IDLANCIMOVEL = :IDLANCIMOVEL,'
      '  VLRMULTA = :VLRMULTA,'
      '  VLRJUROS = :VLRJUROS,'
      '  VLRCORRECAOMON = :VLRCORRECAOMON'
      'where'
      '  IDLANCIMOVEL = :OLD_IDLANCIMOVEL')
    InsertSQL.Strings = (
      'insert into LANCAMENTOSIMOVEL'
      '  (IDLANCIMOVEL, VLRMULTA, VLRJUROS, VLRCORRECAOMON)'
      'values'
      '  (:IDLANCIMOVEL, :VLRMULTA, :VLRJUROS, :VLRCORRECAOMON)')
    DeleteSQL.Strings = (
      'delete from LANCAMENTOSIMOVEL'
      'where'
      '  IDLANCIMOVEL = :OLD_IDLANCIMOVEL')
    Left = 183
    Top = 149
  end
  object qryAlteradoresLanc: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT'
      '   LD.CODDOCUMENTO, LD.NUMLANCTO,'
      '   LD.CODALTERADOR, LD.PLNCODIGO,'
      '   LD.DATALANCTO, LD.VALOR, LD.VALOROUTRAMOEDA,'
      '   LD.DEBCRE, LD.OPERACAO, LD.HISTORICOCOMPL,'
      ''
      '   A.DESCRICAO'
      'FROM'
      '   LANCTODOCUM LD, TIPOALTERADOR A'
      'WHERE'
      '   ( LD.CODDOCUMENTO =:DOCUMENTO )'
      '   AND ( LD.OPERACAO = '#39'4 '#39' )'
      '   AND ( LD.CODALTERADOR = A.CODALTERADOR )'
      'ORDER BY'
      '   LD.DATALANCTO, A.DESCRICAO')
    ValidateWithMask = True
    Left = 104
    Top = 146
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryAlteradoresLancDESCRICAO: TStringField
      DisplayLabel = 'Tipo do Alterador'
      DisplayWidth = 18
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryAlteradoresLancHISTORICOCOMPL: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 27
      FieldName = 'HISTORICOCOMPL'
      Size = 60
    end
    object qryAlteradoresLancVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
    object qryAlteradoresLancDATALANCTO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATALANCTO'
    end
    object qryAlteradoresLancCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object qryAlteradoresLancNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Visible = False
    end
    object qryAlteradoresLancCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Visible = False
    end
    object qryAlteradoresLancPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryAlteradoresLancVALOROUTRAMOEDA: TFloatField
      FieldName = 'VALOROUTRAMOEDA'
      Visible = False
    end
    object qryAlteradoresLancDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Visible = False
      Size = 1
    end
    object qryAlteradoresLancOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Visible = False
      Size = 2
    end
  end
  object dsAlteradoresLanc: TwwDataSource
    DataSet = qryAlteradoresLanc
    Left = 104
    Top = 134
  end
  object qryAchaHistCart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   H.IDHISTCARTINV,'
      '   H.CODDOCUMENTO, H.NUMLANCTO'
      'FROM'
      '   HISTCARTINV H '
      'WHERE'
      '   ( CODDOCUMENTO =:DOCUMENTO )'
      '   AND ( NUMLANCTO =:LANCTO )'
      '   ')
    ValidateWithMask = True
    Left = 328
    Top = 132
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'LANCTO'
        ParamType = ptUnknown
      end>
    object qryAchaHistCartIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
      Origin = 'HISTCARTINV.IDHISTCARTINV'
    end
  end
  object qryApagaHistCart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE '
      'FROM'
      '   HISTCARTINV'
      'WHERE'
      '   IDHISTCARTINV =:HISTORICO')
    ValidateWithMask = True
    Left = 328
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'HISTORICO'
        ParamType = ptUnknown
      end>
  end
  object MontaSelectImovel: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'I.IMONOMEENDERECO'
      'I.IMOLOGRADOURO'
      'I.IMOBAIRRO'
      'I.IMOCIDADE')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Nome do Imóvel'
      'Nome do Endereço'
      'Logradouro'
      'Bairro'
      'Cidade')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL IM')
    CamposChave.Strings = (
      'I.IDIMOVEL'
      'I.IDIMOVELMESTRE'
      'I.IMONOME'
      'IM.IMONOME')
    Filtro.Strings = (
      'I.IDIMOVELMESTRE = IM.IDIMOVEL (+)'
      'I.FLGTIPOIMOVEL = 1')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '30'
      '10'
      '20'
      '20')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 528
    Top = 21
  end
  object qryParametros: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '          IDIMOVELMESTRE, IDIMOVEL, IDPESSOA,'
      '          IDMARCA, CODESTADO, IDPAIS,'
      '          IDADMINIMOVEL, FLGTIPOIMOVEL,'
      '          IMODATACONSTRUCAO, IMOAREA,'
      '          IMOFRACAOIDEAL, IMODESCRICAO,'
      '          FLGSTATUSOCUPACAO, QTDETOTALCOTAS,'
      '          IMONOME, IMOLOGRADOURO,'
      '          IMONUMERO, IMOCOMPLEMENTO,'
      '          IMOBAIRRO, IMOCIDADE,'
      '          IMONOMEENDERECO, IMOCEP, CODSUBCONTA,'
      '          IDCARTEIRAINVEST, CODTIPIMOVEL,'
      '          IDCIDADES, FLGATIVO, IMOPERCENTRATEIO,'
      '          IMOMOEDACOMPRA, IMOVLRCOMPRA, IMODATACOMPRA,'
      '          IMOMATRICULA, IMOOBSERVACAO, IMODATAHABITESE,'
      '          IDCARTORIO, FLGSTATUS, IMOCODIGO'
      ''
      'FROM      IMOVEL'
      ''
      'WHERE     IDIMOVEL = :IDIMOVEL')
    ValidateWithMask = True
    Left = 672
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDIMOVEL'
        ParamType = ptUnknown
      end>
    object qryParametrosIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
      Origin = '"CM.IMOVEL".IDIMOVELMESTRE'
    end
    object qryParametrosIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = '"CM.IMOVEL".IDIMOVEL'
    end
    object qryParametrosIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.IMOVEL".IDPESSOA'
    end
    object qryParametrosIDMARCA: TFloatField
      FieldName = 'IDMARCA'
      Origin = '"CM.IMOVEL".IDMARCA'
    end
    object qryParametrosCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Origin = '"CM.IMOVEL".CODESTADO'
      Size = 3
    end
    object qryParametrosIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = '"CM.IMOVEL".IDPAIS'
    end
    object qryParametrosIDADMINIMOVEL: TFloatField
      FieldName = 'IDADMINIMOVEL'
      Origin = '"CM.IMOVEL".IDADMINIMOVEL'
    end
    object qryParametrosFLGTIPOIMOVEL: TFloatField
      FieldName = 'FLGTIPOIMOVEL'
      Origin = '"CM.IMOVEL".FLGTIPOIMOVEL'
    end
    object qryParametrosIMODATACONSTRUCAO: TDateTimeField
      FieldName = 'IMODATACONSTRUCAO'
      Origin = '"CM.IMOVEL".IMODATACONSTRUCAO'
    end
    object qryParametrosIMOAREA: TFloatField
      FieldName = 'IMOAREA'
      Origin = '"CM.IMOVEL".IMOAREA'
    end
    object qryParametrosIMOFRACAOIDEAL: TFloatField
      FieldName = 'IMOFRACAOIDEAL'
      Origin = '"CM.IMOVEL".IMOFRACAOIDEAL'
    end
    object qryParametrosIMODESCRICAO: TMemoField
      FieldName = 'IMODESCRICAO'
      Origin = '"CM.IMOVEL".IMODESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryParametrosFLGSTATUSOCUPACAO: TStringField
      FieldName = 'FLGSTATUSOCUPACAO'
      Origin = '"CM.IMOVEL".FLGSTATUSOCUPACAO'
      Size = 1
    end
    object qryParametrosQTDETOTALCOTAS: TFloatField
      FieldName = 'QTDETOTALCOTAS'
      Origin = '"CM.IMOVEL".QTDETOTALCOTAS'
    end
    object qryParametrosIMONOME: TStringField
      FieldName = 'IMONOME'
      Origin = '"CM.IMOVEL".IMONOME'
      Size = 60
    end
    object qryParametrosIMONUMERO: TStringField
      FieldName = 'IMONUMERO'
      Origin = '"CM.IMOVEL".IMONUMERO'
      Size = 8
    end
    object qryParametrosIMOCOMPLEMENTO: TStringField
      FieldName = 'IMOCOMPLEMENTO'
      Origin = '"CM.IMOVEL".IMOCOMPLEMENTO'
    end
    object qryParametrosIMOBAIRRO: TStringField
      FieldName = 'IMOBAIRRO'
      Origin = '"CM.IMOVEL".IMOBAIRRO'
    end
    object qryParametrosIMOCIDADE: TStringField
      FieldName = 'IMOCIDADE'
      Origin = '"CM.IMOVEL".IMOCIDADE'
    end
    object qryParametrosIMONOMEENDERECO: TStringField
      FieldName = 'IMONOMEENDERECO'
      Origin = '"CM.IMOVEL".IMONOMEENDERECO'
      Size = 40
    end
    object qryParametrosIMOCEP: TStringField
      FieldName = 'IMOCEP'
      Origin = '"CM.IMOVEL".IMOCEP'
      Size = 8
    end
    object qryParametrosCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = '"CM.IMOVEL".CODSUBCONTA'
    end
    object qryParametrosIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = '"CM.IMOVEL".IDCARTEIRAINVEST'
    end
    object qryParametrosCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = '"CM.IMOVEL".CODTIPIMOVEL'
      Size = 5
    end
    object qryParametrosIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
      Origin = '"CM.IMOVEL".IDCIDADES'
    end
    object qryParametrosFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
      Origin = '"CM.IMOVEL".FLGATIVO'
    end
    object qryParametrosIMOPERCENTRATEIO: TFloatField
      FieldName = 'IMOPERCENTRATEIO'
      Origin = '"CM.IMOVEL".IMOPERCENTRATEIO'
    end
    object qryParametrosIMOMOEDACOMPRA: TFloatField
      FieldName = 'IMOMOEDACOMPRA'
      Origin = '"CM.IMOVEL".IMOMOEDACOMPRA'
    end
    object qryParametrosIMOVLRCOMPRA: TFloatField
      FieldName = 'IMOVLRCOMPRA'
      Origin = '"CM.IMOVEL".IMOVLRCOMPRA'
    end
    object qryParametrosIMODATACOMPRA: TDateTimeField
      FieldName = 'IMODATACOMPRA'
      Origin = '"CM.IMOVEL".IMODATACOMPRA'
    end
    object qryParametrosIMOMATRICULA: TStringField
      FieldName = 'IMOMATRICULA'
      Origin = '"CM.IMOVEL".IMOMATRICULA'
    end
    object qryParametrosIMOOBSERVACAO: TMemoField
      FieldName = 'IMOOBSERVACAO'
      Origin = '"CM.IMOVEL".IMOOBSERVACAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryParametrosIMODATAHABITESE: TDateTimeField
      FieldName = 'IMODATAHABITESE'
      Origin = '"CM.IMOVEL".IMODATAHABITESE'
    end
    object qryParametrosIDCARTORIO: TFloatField
      FieldName = 'IDCARTORIO'
      Origin = '"CM.IMOVEL".IDCARTORIO'
    end
    object qryParametrosFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      Origin = '"CM.IMOVEL".FLGSTATUS'
      Size = 1
    end
    object qryParametrosIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Origin = '"CM.IMOVEL".IMOCODIGO'
      Size = 15
    end
    object qryParametrosIMOLOGRADOURO: TStringField
      FieldName = 'IMOLOGRADOURO'
      Origin = '"CM.IMOVEL".IMOLOGRADOURO'
      Size = 80
    end
  end
end
