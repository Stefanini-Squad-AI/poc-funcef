inherited frmFolhaExtra: TfrmFolhaExtra
  Left = 295
  Top = 103
  HelpContext = 180010
  Caption = 'Prévia para Pagamento por Folha Extra'
  ClientHeight = 578
  ClientWidth = 865
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel [0]
    Left = 16
    Top = 88
    Width = 75
    Height = 13
    Caption = 'Cod. Rubrica'
  end
  inherited pnlFundo: TPanel
    Width = 865
    Height = 539
    object pnlConfere: TPanel
      Left = 47
      Top = 64
      Width = 673
      Height = 321
      BevelWidth = 2
      TabOrder = 1
      Visible = False
      object sgConfere: TStringGrid
        Left = 2
        Top = 2
        Width = 669
        Height = 263
        Align = alTop
        DefaultColWidth = 65
        DefaultRowHeight = 17
        FixedCols = 0
        GridLineWidth = 0
        Options = [goFixedVertLine, goFixedHorzLine, goRangeSelect]
        TabOrder = 0
      end
      object BitBtn2: TBitBtn
        Left = 304
        Top = 277
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Sair'
        TabOrder = 1
        OnClick = BitBtn2Click
        Glyph.Data = {
          F6010000424DF601000000000000760000002800000030000000100000000100
          0400000000008001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777F7F7F700F
          7777777777777887F777777F7F7F7F7F777777F7F7F7F0E0F7F77777777778F8
          7F7777F7F7F7F7F7F7F77F7F7F7F70E60F7F7FFFFFF778F787FFFF7F7F7F7F7F
          7F7F000000F7F0E66000888888F778F778887000000E666660007777708880E6
          60877777787778F778F77777770E666660877777087770E6608777778FF778F7
          78F77777770E666660877777007770E660877777887F78F778F77777770E6666
          60877788060770E7608777FF8F87F8F7F8F77777770E7666608770000E6070E0
          60877888877878F878F77777770E066660870EEEEEE600E660878F77777788F7
          78F77777770E666660870EEEEEE670E6608787FFFF7878F778F77777770E6666
          608776660E6770E6608778888F8F78F778F77777770E666660877777060770E6
          60877777888F787F78F77777770E6666608777770707770E60877777878F7787
          F8F77777770E66666087777777077770E0877777778FFFF8F8F77777770EEEEE
          E087777777000000007777777788888888777777770000000077}
        NumGlyphs = 3
        Spacing = 2
      end
      object BtnExibePrevia: TBitBtn
        Left = 184
        Top = 278
        Width = 80
        Height = 33
        Caption = '&Exibe Lote'
        TabOrder = 2
        OnClick = BtnExibePreviaClick
      end
      object dbgMostraPrevia: TwwDBGrid
        Left = 3
        Top = 3
        Width = 668
        Height = 263
        Selected.Strings = (
          'NOME'#9'35'#9'Nome'#9'F'
          'MES'#9'7'#9'Mês Ref.'#9'F'
          'IDRUBRICA'#9'8'#9'Rubrica'#9'F'
          'DESCRICAO'#9'50'#9'Descrição da Rubrica'#9'F'
          'VALORPROVENTO'#9'10'#9'Valor'#9'F'
          'VALORINFO'#9'10'#9'Info.'#9'F'
          'TIPO'#9'10'#9'Tipo'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsMostraPrevia
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ReadOnly = True
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
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 863
      Height = 537
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Panel2: TPanel
        Left = 2
        Top = 2
        Width = 859
        Height = 61
        Align = alTop
        TabOrder = 0
        object GroupBox1: TGroupBox
          Left = 1
          Top = 1
          Width = 164
          Height = 59
          Align = alLeft
          Caption = ' Mês e Ano de Cobrança'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object cmbMesCob: TComboBox
            Left = 8
            Top = 24
            Width = 88
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
            Text = 'cmbMesCob'
            OnChange = cmbMesCobChange
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
          object spnedAnoCob: TSpinEdit
            Left = 98
            Top = 24
            Width = 57
            Height = 22
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxValue = 0
            MinValue = 0
            ParentFont = False
            TabOrder = 1
            Value = 0
            OnChange = spnedAnoCobChange
          end
        end
        object GroupBox2: TGroupBox
          Left = 631
          Top = 1
          Width = 136
          Height = 59
          Align = alLeft
          Caption = ' Previsão de Pagto '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object lbDataFolha: TLabel
            Left = 19
            Top = 21
            Width = 102
            Height = 13
            AutoSize = False
            Caption = 'lbDataFolha'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object GroupBox3: TGroupBox
          Left = 299
          Top = 1
          Width = 332
          Height = 59
          Align = alLeft
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object lbDescricao: TLabel
            Left = 9
            Top = 20
            Width = 312
            Height = 29
            AutoSize = False
            Caption = 'lbDescricao'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
        end
        object GroupBox5: TGroupBox
          Left = 165
          Top = 1
          Width = 134
          Height = 59
          Align = alLeft
          Caption = 'Lote'
          TabOrder = 3
          object dblkLote: TwwDBLookupCombo
            Left = 8
            Top = 24
            Width = 116
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'IDLOTE'#9'10'#9'nº do Lote'#9'F'
              'HIFEN'#9'3'#9#9'F'
              'MESREFERENCIA'#9'7'#9'Mês de Referência'#9'F'
              'DESCRICAO'#9'200'#9'Descrição do Lote'#9'F')
            LookupTable = qryLotes
            LookupField = 'IDLOTE'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            OnCloseUp = dblkLoteCloseUp
          end
        end
      end
      object pcTipoFolhaExtra: TPageControl
        Left = 2
        Top = 63
        Width = 859
        Height = 472
        ActivePage = tbsIndividual
        Align = alClient
        TabOrder = 1
        OnChange = pcTipoFolhaExtraChange
        object tbsIndividual: TTabSheet
          Caption = 'Individual'
          object pnlDadosTitular: TPanel
            Left = 0
            Top = 0
            Width = 851
            Height = 94
            Align = alTop
            TabOrder = 0
            object GroupBox4: TGroupBox
              Left = 1
              Top = 1
              Width = 849
              Height = 92
              Align = alClient
              TabOrder = 0
              object Label7: TLabel
                Left = 11
                Top = 9
                Width = 55
                Height = 13
                Caption = 'Matrícula'
              end
              object Label8: TLabel
                Left = 136
                Top = 9
                Width = 80
                Height = 13
                Caption = 'Inscr. Número'
              end
              object Label1: TLabel
                Left = 259
                Top = 9
                Width = 69
                Height = 13
                Caption = 'Participante'
              end
              object Label13: TLabel
                Left = 10
                Top = 47
                Width = 63
                Height = 13
                Caption = 'Recebedor'
              end
              object Label15: TLabel
                Left = 379
                Top = 47
                Width = 55
                Height = 13
                Caption = 'Dt. Nasc.'
              end
              object Label14: TLabel
                Left = 514
                Top = 47
                Width = 63
                Height = 13
                Caption = 'Nº Dep. IR'
              end
              object edtMatricula: TEdit
                Left = 10
                Top = 24
                Width = 113
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 0
                OnChange = edtMatriculaChange
                OnExit = edtMatriculaExit
              end
              object edtInscricao: TEdit
                Left = 133
                Top = 24
                Width = 113
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 1
                OnChange = edtMatriculaChange
                OnExit = edtInscricaoExit
              end
              object edtNome: TEdit
                Left = 256
                Top = 24
                Width = 346
                Height = 21
                CharCase = ecUpperCase
                Enabled = False
                TabOrder = 2
              end
              object bbtnProcurar: TBitBtn
                Left = 659
                Top = 15
                Width = 101
                Height = 28
                Hint = 'Procurar participante'
                Caption = '&Procurar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                TabStop = False
                OnClick = bbtnProcurarClick
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
              object cmbRecebedor: TwwDBLookupCombo
                Left = 10
                Top = 61
                Width = 337
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'40'#9'Favorecido')
                LookupTable = qryRecebedor
                LookupField = 'NOME'
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
                OnCloseUp = cmbRecebedorCloseUp
              end
              object edDataNasc: TCMDateTimePicker
                Left = 379
                Top = 61
                Width = 104
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
                Enabled = False
                ShowButton = True
                TabOrder = 5
              end
              object edNumDep: TEdit
                Left = 514
                Top = 61
                Width = 69
                Height = 21
                CharCase = ecUpperCase
                Enabled = False
                TabOrder = 6
              end
            end
          end
          object pnlDadosRubrica: TPanel
            Left = 0
            Top = 94
            Width = 851
            Height = 143
            Align = alTop
            TabOrder = 1
            OnMouseMove = pnlDadosRubricaMouseMove
            object Label2: TLabel
              Left = 6
              Top = 5
              Width = 75
              Height = 13
              Caption = 'Cod. Rubrica'
            end
            object Label3: TLabel
              Left = 84
              Top = 5
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object Label4: TLabel
              Left = 366
              Top = 5
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label5: TLabel
              Left = 460
              Top = 5
              Width = 208
              Height = 13
              Caption = 'Contas Caixa x Forma de Pagamento'
            end
            object Label9: TLabel
              Left = 492
              Top = 90
              Width = 81
              Height = 13
              Caption = 'Total Líquido:'
            end
            object Label10: TLabel
              Left = 656
              Top = 100
              Width = 113
              Height = 13
              Caption = '1º Inserir Proventos'
            end
            object Label11: TLabel
              Left = 656
              Top = 114
              Width = 116
              Height = 13
              Caption = '2º Inserir Descontos'
            end
            object lblPlanoContabil: TLabel
              Left = 196
              Top = 51
              Width = 83
              Height = 13
              Caption = 'Plano Contábil'
            end
            object lblPerfil: TLabel
              Left = 432
              Top = 51
              Width = 124
              Height = 13
              Caption = 'Perfil de Investimento'
            end
            object edtCodRubrica: TEdit
              Left = 6
              Top = 20
              Width = 75
              Height = 21
              TabOrder = 0
              OnExit = edtCodRubricaExit
            end
            object cmbRubrica: TwwDBLookupCombo
              Left = 84
              Top = 20
              Width = 269
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'80'#9'Descrição'#9'F')
              LookupTable = qryRubrica
              LookupField = 'IDPROVENTO'
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = cmbRubricaCloseUp
            end
            object cmbPortForma: TwwDBLookupCombo
              Left = 460
              Top = 20
              Width = 310
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'40'#9'Descrição')
              LookupTable = qryPortForma
              LookupField = 'CODPORTFORMA'
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object edtValor: TEdit
              Left = 366
              Top = 20
              Width = 86
              Height = 21
              TabOrder = 2
            end
            object grpMesRef: TGroupBox
              Left = 5
              Top = 44
              Width = 184
              Height = 51
              Caption = ' Mês e Ano de Referência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              object cmbMes: TComboBox
                Left = 8
                Top = 19
                Width = 104
                Height = 21
                Style = csDropDownList
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ItemHeight = 13
                ParentFont = False
                TabOrder = 0
                OnChange = cmbMesChange
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
                  'Dezembro'
                  'Abono Anual')
              end
              object spnedAno: TSpinEdit
                Left = 115
                Top = 19
                Width = 63
                Height = 22
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                MaxValue = 2015
                MinValue = 1900
                ParentFont = False
                TabOrder = 1
                Value = 1900
                OnChange = spnedAnoChange
              end
            end
            object btnConfere: TBitBtn
              Left = 619
              Top = 96
              Width = 31
              Height = 33
              Hint = 'Confere as rubricas'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 9
              OnClick = btnConfereClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                555555555555555555555555555555555555555555FF55555555555559055555
                55555555577FF5555555555599905555555555557777F5555555555599905555
                555555557777FF5555555559999905555555555777777F555555559999990555
                5555557777777FF5555557990599905555555777757777F55555790555599055
                55557775555777FF5555555555599905555555555557777F5555555555559905
                555555555555777FF5555555555559905555555555555777FF55555555555579
                05555555555555777FF5555555555557905555555555555777FF555555555555
                5990555555555555577755555555555555555555555555555555}
              NumGlyphs = 2
            end
            object btnAssociar: TBitBtn
              Left = 425
              Top = 96
              Width = 31
              Height = 33
              Hint = 'Associa rubrica'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
              OnClick = btnAssociarClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
                333333333337F33333333333333033333333333333373F333333333333090333
                33333333337F7F33333333333309033333333333337373F33333333330999033
                3333333337F337F33333333330999033333333333733373F3333333309999903
                333333337F33337F33333333099999033333333373333373F333333099999990
                33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
                33333333337F7F33333333333309033333333333337F7F333333333333090333
                33333333337F7F33333333333309033333333333337F7F333333333333090333
                33333333337F7F33333333333300033333333333337773333333}
              NumGlyphs = 2
            end
            object btnNaoAssociar: TBitBtn
              Left = 457
              Top = 96
              Width = 31
              Height = 33
              Hint = 'Desassocia rubrica'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
              OnClick = btnNaoAssociarClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
                3333333333777F33333333333309033333333333337F7F333333333333090333
                33333333337F7F33333333333309033333333333337F7F333333333333090333
                33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
                3333333777737777F333333099999990333333373F3333373333333309999903
                333333337F33337F33333333099999033333333373F333733333333330999033
                3333333337F337F3333333333099903333333333373F37333333333333090333
                33333333337F7F33333333333309033333333333337373333333333333303333
                333333333337F333333333333330333333333333333733333333}
              NumGlyphs = 2
            end
            object edtTotLiq: TEdit
              Left = 492
              Top = 106
              Width = 121
              Height = 21
              Enabled = False
              TabOrder = 8
              Text = '0'
            end
            object dblcPlanoContabil: TwwDBLookupCombo
              Left = 196
              Top = 65
              Width = 223
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Plano'#9'F'
                'IDPLANOPREV'#9'10'#9'Código'#9'F')
              LookupTable = qryPlanoContabil
              LookupField = 'NOME'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnChange = dblcPlanoContabilChange
            end
            object dblcPerfil: TwwDBLookupCombo
              Left = 432
              Top = 65
              Width = 337
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Plano'#9'F')
              LookupTable = qryPerfil
              LookupField = 'NOME'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 10
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
          end
          object dbgRubricas: TwwDBGrid
            Left = 0
            Top = 237
            Width = 851
            Height = 207
            Selected.Strings = (
              'NOME'#9'40'#9'Recebedor'#9'F'
              'CODPROVDESC'#9'10'#9'Rubrica'#9'F'
              'VALORREF'#9'10'#9'Valor'#9'F'
              'VALORINFO'#9'10'#9'Info.'#9'F'
              'MESREFERENCIA'#9'7'#9'Mês Ref.'#9'F'
              'FLGDESCONTO'#9'10'#9'Desconto'#9'F'
              'TIPO'#9'2'#9'Pensão Alim'#9'F'
              'INCLUIDO'#9'1'#9'Incluido'#9'F'
              'IDPLANOCONTABIL'#9'3'#9'PC'#9'F')
            MemoAttributes = [mSizeable]
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsVirtual
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect]
            ReadOnly = True
            TabOrder = 2
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = dbgRubricasCalcCellColors
            OnDblClick = dbgRubricasDblClick
            OnMouseMove = dbgRubricasMouseMove
            IndicatorColor = icBlack
          end
        end
        object tbsImportaPrevia: TTabSheet
          Caption = 'Por Arquivo'
          ImageIndex = 1
          object grpImportacao: TGroupBox
            Left = 0
            Top = 0
            Width = 851
            Height = 41
            Align = alTop
            Caption = ' Nome do Arquivo '
            TabOrder = 0
            Visible = False
            object sbtImportaArquivo: TSpeedButton
              Left = 743
              Top = 13
              Width = 23
              Height = 22
              Anchors = [akTop, akRight]
              Flat = True
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                5555555555555555555555555555555555555555555555555555555555555555
                555555555555555555555555555555555555555FFFFFFFFFF555550000000000
                55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
                B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
                000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
                555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
                55555575FFF75555555555700007555555555557777555555555555555555555
                5555555555555555555555555555555555555555555555555555}
              NumGlyphs = 2
              OnClick = sbtImportaArquivoClick
            end
            object edtImportacao: TEdit
              Left = 8
              Top = 14
              Width = 730
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              ReadOnly = True
              TabOrder = 0
            end
            object btImportacao: TButton
              Left = 770
              Top = 12
              Width = 75
              Height = 23
              Anchors = [akTop, akRight]
              Caption = 'Importar'
              TabOrder = 1
              OnClick = btImportacaoClick
            end
          end
          object dbgPessoa: TDBGrid
            Left = 0
            Top = 44
            Width = 849
            Height = 161
            Anchors = [akLeft, akTop, akRight]
            DataSource = dsPessoa
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
          end
          object dbgRubrica: TDBGrid
            Left = 0
            Top = 210
            Width = 849
            Height = 93
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = dsRubrica
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
          end
          object Panel3: TPanel
            Left = 1
            Top = 308
            Width = 848
            Height = 133
            Anchors = [akLeft, akRight, akBottom]
            BevelOuter = bvLowered
            TabOrder = 3
            object memResult: TMemo
              Left = 1
              Top = 1
              Width = 782
              Height = 131
              Align = alLeft
              Anchors = [akLeft, akTop, akRight, akBottom]
              ReadOnly = True
              TabOrder = 0
            end
            object bbtnSalvar: TBitBtn
              Left = 788
              Top = 5
              Width = 56
              Height = 54
              Anchors = [akTop, akRight]
              Caption = 'S&alvar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnClick = bbtnSalvarClick
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                7777770000000000007770330770000330777033077000033077703307700003
                30777033000000033077703333333333307770330000000330777030FFFFFFF0
                30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
                8077777CCC777700007777CCC77777777777777C777777777777}
              Layout = blGlyphTop
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 539
    Width = 865
    inherited tb97Fundo: TToolbar97
      Left = 459
      DockPos = 556
      inherited sep1: TToolbarSep97
        Left = 399
      end
      inherited sep3: TToolbarSep97
        Left = 315
      end
      inherited bbtnSair: TBitBtn
        Left = 234
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 318
      end
      object bbtnProcessar: TBitBtn
        Left = 0
        Top = 0
        Width = 117
        Height = 33
        Caption = 'P&rocessar'
        TabOrder = 2
        OnClick = bbtnProcessarClick
        OnKeyPress = bbtnProcessarKeyPress
        OnMouseMove = bbtnProcessarMouseMove
        Kind = bkOK
        Spacing = 2
      end
      object bbtnOutro: TBitBtn
        Left = 117
        Top = 0
        Width = 117
        Height = 33
        Caption = '&Processar Outro'
        TabOrder = 3
        Visible = False
        NumGlyphs = 2
        Spacing = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 290
      DockPos = 336
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 21
    Top = 340
    TargetsData = (
      1
      3
      (
        ''
        'Text'
        0)
      (
        ''
        'Cells'
        0)
      (
        ''
        'Filter'
        0))
  end
  object MSResponsavel: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'EL.MATRICULA'
      'D.MATRICULA'
      'PPP.INSCRICAONUMERO'
      'P.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Matríc. Titular'
      'Matríc. Recebedor'
      'Número de Inscrição'
      'Responsável')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N'
      'N')
    Tabelas.Strings = (
      'VW_RECEBEDOR R'
      'PARTPREVPLAN PPP'
      'ELEGPATRO EL'
      'PESSOA P'
      'DEPENTIT D')
    CamposChave.Strings = (
      'R.IDRECEBEDOR'
      'R.IDTITULAR'
      'PPP.INSCRICAONUMERO'
      'EL.MATRICULA'
      'P.NOME'
      'PPP.IDPESSJUR'
      'PPP.IDPLANOPREV')
    Filtro.Strings = (
      'PPP.IDPESSOA      = R.IDTITULAR'
      'EL.IDPESSOA       = R.IDTITULAR'
      'P.IDPESSOA        = R.IDRECEBEDOR'
      'D.IDPESSOA        = R.IDRECEBEDOR'
      'PPP.FLGDESATIVADO = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '15'
      '15'
      '40')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 78
    Top = 317
  end
  object qryRubrica: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT IDPROVENTO, DESCRICAO, CODPROVDESC, DESCRPROVDESC,'
      '       FLGDESCONTO, FLGIRRF, CODIRRFDARF'
      'FROM PROVDESC'
      'WHERE FLGESPECIAL = 0'
      'ORDER BY DESCRICAO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 84
    Top = 406
  end
  object qryPortForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODPORTFORMA, DESCRICAO, CODPORTADOR'
      'FROM PORTADORFORMA'
      'WHERE RECPAG = '#39'P'#39
      'ORDER BY DESCRICAO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 406
  end
  object qryVirtual: TwwQuery
    CachedUpdates = True
    AfterPost = qryVirtualAfterPost
    AfterDelete = qryVirtualAfterPost
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      #9'0 AS IDPESSOA,'
      #9'0 AS IDRESPONSAVEL,'
      #9'0 AS IDTITULAR,'
      #9#39'1234567890123456789012345678901234567890'#39' AS NOME,'
      #9#39'1234567890'#39' AS CODPROVDESC,'
      #9'0 AS IDRUBRICA,'
      #9'0 AS VALORREF,'
      '  0 AS VALORINFO,'
      #9#39'1234567'#39' AS MESREFERENCIA,'
      #9#39'00/00/0000'#39' AS DATAPAGTO,'
      #9'0 AS CODPORTFORMA,'
      #9'0 AS FLGDESCONTO,'
      #9'0 AS IDPESSJUR,'
      #9'0 AS IDPLANOPREV,'
      #9'0 AS FLGIRRF,'
      '  '#39'9999'#39' AS CODIRRFDARF,'
      #9#39'00/00/0000'#39' AS DATANASC,'
      #9'0 AS FLGISENTOIRRF,'
      '  0 AS NUMDEP,'
      '  '#39'1'#39' AS TIPO,'
      '  '#39'1'#39' AS INCLUIDO,'
      '  0 AS IDPLANOORIGEM,'
      ' 0 AS IDPLANOCONTABIL,'
      ' 0 AS IDFAVDOC,'
      ' 1 AS SEQDOCUMENTO,'
      ' 0 AS IDPERFILINVEST'
      'FROM DUAL'
      'WHERE 1=2'
      'ORDER BY IDPESSOA'
      ''
      ' '
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updVirtual
    PictureMasks.Strings = (
      'VALOR'#9'###.###.##0,00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 285
    Top = 310
  end
  object dsVirtual: TwwDataSource
    DataSet = qryVirtual
    Left = 338
    Top = 318
  end
  object updVirtual: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL,'
      '  IDTITULAR = :IDTITULAR,'
      '  NOME = :NOME,'
      '  CODPROVDESC = :CODPROVDESC,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  VALORREF = :VALORREF,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  DATAPAGTO = :DATAPAGTO,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  FLGDESCONTO = :FLGDESCONTO,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  CODIRRFDARF =:CODIRRFDARF'
      '  FLGIRRF = :FLGIRRF,'
      '  DATANASC = :DATANASC,'
      '  FLGISENTOIRRF = :FLGISENTOIRRF,'
      '  NUMDEP = :NUMDEP,'
      '  TIPO = :TIPO,'
      '  SEQDOCUMENTO = :SEQDOCUMENTO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDRESPONSAVEL = :OLD_IDRESPONSAVEL and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  NOME = :OLD_NOME and'
      '  CODPROVDESC = :OLD_CODPROVDESC and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  VALORREF = :OLD_VALORREF and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  DATAPAGTO = :OLD_DATAPAGTO and'
      '  CODPORTFORMA = :OLD_CODPORTFORMA and'
      '  FLGDESCONTO = :OLD_FLGDESCONTO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  FLGIRRF = :OLD_FLGIRRF and'
      '  DATANASC = :OLD_DATANASC and'
      '  FLGISENTOIRRF = :OLD_FLGISENTOIRRF and'
      '  NUMDEP = :OLD_NUMDEP and'
      '  TIPO = :OLD_TIPO')
    InsertSQL.Strings = (
      'insert into DUAL'
      '  (IDPESSOA, IDRESPONSAVEL, IDTITULAR, NOME, CODPROVDESC, '
      'IDRUBRICA, VALORREF, '
      '   MESREFERENCIA, DATAPAGTO, CODPORTFORMA, FLGDESCONTO, '
      'IDPESSJUR, IDPLANOPREV,  CODIRRFDARF,'
      '   FLGIRRF,    DATANASC, FLGISENTOIRRF, NUMDEP, TIPO, IDFAVDOC,'
      'SEQDOCUMENTO)'
      'values'
      '  (:IDPESSOA, :IDRESPONSAVEL, :IDTITULAR, :NOME, :CODPROVDESC, '
      ':IDRUBRICA, '
      '   :VALORREF, :MESREFERENCIA, :DATAPAGTO, :CODPORTFORMA, '
      ':FLGDESCONTO, '
      '   :IDPESSJUR, :IDPLANOPREV, :CODIRRFDARF, :FLGIRRF, :DATANASC, '
      ':FLGISENTOIRRF, :NUMDEP, '
      '   :TIPO, :IDFAVDOC, :SEQDOCUMENTO)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDRESPONSAVEL = :OLD_IDRESPONSAVEL and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  NOME = :OLD_NOME and'
      '  CODPROVDESC = :OLD_CODPROVDESC and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  VALORREF = :OLD_VALORREF and'
      '  MESREFERENCIA = :OLD_MESREFERENCIA and'
      '  DATAPAGTO = :OLD_DATAPAGTO and'
      '  CODPORTFORMA = :OLD_CODPORTFORMA and'
      '  FLGDESCONTO = :OLD_FLGDESCONTO and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  FLGIRRF = :OLD_FLGIRRF and'
      '  DATANASC = :OLD_DATANASC and'
      '  FLGISENTOIRRF = :OLD_FLGISENTOIRRF and'
      '  NUMDEP = :OLD_NUMDEP and'
      '  TIPO = :OLD_TIPO')
    Left = 407
    Top = 318
  end
  object qryMatricula: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PP.INSCRICAONUMERO,'
      '  EL.MATRICULA,'
      '  P.IDPESSOA,'
      '  P.NOME,'
      '  PP.IDPLANOPREV,'
      '  PP.IDPESSJUR,'
      '  PF.FLGISENTOIRRF,'
      '  PF.NUMDEPIRRF,'
      '  PF.DATANASC,'
      '  D.IDPESSOA AS IDRECEBEDOR'
      ''
      'FROM'
      '  ELEGPATRO EL,'
      '  PARTPREVPLAN PP,'
      '  PESSOA P,'
      '  PESSOAFISICA PF,'
      '  PATRO PAT,'
      '  DEPENTIT D'
      ''
      'WHERE D.MATRICULA       LIKE :MATRICULA'
      '  AND D.IDTITULAR          = EL.IDPESSOA'
      '  AND PP.IDPESSOA          = EL.IDPESSOA'
      '  AND PP.IDPESSJUR         = EL.IDPESSJUR'
      '  AND P.IDPESSOA           = EL.IDPESSOA'
      '  AND PF.IDPESSOA          = P.IDPESSOA'
      '  AND PP.FLGDESATIVADO     = 0'
      '  AND PAT.IDPESSOA         = EL.IDPESSJUR'
      '  AND PAT.IDFUNDACAO       = :PIDFUNDACAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 20
    Top = 405
    ParamData = <
      item
        DataType = ftString
        Name = 'MATRICULA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryInscricao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PP.INSCRICAONUMERO, EL.MATRICULA, PP.IDPESSOA, P.NOME,'
      
        '       PP.IDPLANOPREV, PP.IDPESSJUR, PF.FLGISENTOIRRF, PF.NUMDEP' +
        'IRRF, PF.DATANASC'
      
        'FROM PARTPREVPLAN PP, PESSOA P, ELEGPATRO EL, PESSOAFISICA PF, P' +
        'ATRO PAT'
      'WHERE PP.INSCRICAONUMERO = :INSCRICAO'
      'AND EL.IDPESSOA = PP.IDPESSOA'
      'AND EL.IDPESSJUR = PP.IDPESSJUR'
      'AND P.IDPESSOA  = PP.IDPESSOA'
      'AND PF.IDPESSOA = P.IDPESSOA'
      'AND PP.FLGDESATIVADO = 0'
      'AND PAT.IDPESSOA = PP.IDPESSJUR'
      'AND PAT.IDFUNDACAO = :PIDFUNDACAO'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 52
    Top = 406
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INSCRICAO'
        ParamType = ptUnknown
        Value = 99000015
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryPrevia: TwwQuery
    DatabaseName = 'BaseDados'
    UpdateObject = updPrevia
    ValidateWithMask = True
    Left = 488
    Top = 454
  end
  object updPrevia: TUpdateSQL
    Left = 557
    Top = 454
  end
  object qryContaBancaria: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CB.IDCBANCARIA, CB.CONTACORRENTE, CB.IDAGENCIA, CB.FLGCON' +
        'TAPREF,'
      
        '       CB.IDPESSOA,    CB.TIPOCONTA, AGENCIA.NOME AS AGENCIA, BA' +
        'NCO.NOME AS BANCO,'
      '       AGENCIABANCARIA.NUMAGENCIA'
      'FROM CONTABANCARIA  CB, PESSOA AGENCIA,'
      '     PESSOA BANCO, AGENCIABANCARIA AGENCIABANCARIA'
      'WHERE CB.IDPESSOA = :IDPESSOA AND'
      '       CB.IDAGENCIA = AGENCIA.IDPESSOA AND'
      '       CB.IDAGENCIA  = AGENCIABANCARIA.IDPESSOA AND'
      '       AGENCIABANCARIA.IDBANCO =  BANCO.IDPESSOA AND'
      '       --CB.FLGCONTAPREF = 1 SOL 152601 Kintana 1136369'
      
        '      -- CB.TIPOCONTA            =   2 --SOL 152852 Kintana 1144' +
        '747'
      '       CB.FLGCONTAPREF = 1 ')
    ValidateWithMask = True
    Left = 183
    Top = 406
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 566
    Top = 400
  end
  object qryRecebedor: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      
        'SELECT PP.IDPESSOA AS IDFAVORECIDO, P.NOME, PP.IDPESSOA, PF.DATA' +
        'NASC,'
      #9'      PF.FLGISENTOIRRF, PF.NUMDEPIRRF, '#39'B'#39' AS TIPO'
      'FROM PARTPREVPLAN PP, PESSOA P, PESSOAFISICA PF, PATRO PAT'
      'WHERE PP.IDPESSOA    = :IDPESSOA'
      'AND P.IDPESSOA       = PP.IDPESSOA'
      'AND PF.IDPESSOA      = P.IDPESSOA'
      'AND PAT.IDPESSOA     = PP.IDPESSJUR'
      'AND PAT.IDFUNDACAO   = :PIDFUNDACAO'
      'UNION'
      
        'SELECT BF.IDRESPONSAVEL AS IDFAVORECIDO, P.NOME, BF.IDTITULAR, P' +
        'F.DATANASC,'
      #9'      PF.FLGISENTOIRRF, PF.NUMDEPIRRF, '#39'B'#39' AS TIPO'
      'FROM BFCIARIOTITPLAN BF, PESSOA P, PESSOAFISICA PF, PATRO PAT'
      'WHERE BF.IDTITULAR   = :IDPESSOA'
      'AND P.IDPESSOA       = BF.IDRESPONSAVEL'
      'AND PF.IDPESSOA      = P.IDPESSOA'
      'AND PAT.IDPESSOA     = BF.IDPESSJUR'
      'AND PAT.IDFUNDACAO   = :PIDFUNDACAO'
      'UNION'
      
        'SELECT RI.IDFAVORECIDO AS IDFAVORECIDO, P.NOME, RI.IDPESSOA AS I' +
        'DTITULAR,'
      #9'      PF.DATANASC, PF.FLGISENTOIRRF, PF.NUMDEPIRRF, '#39'P'#39' AS TIPO'
      'FROM RUBRICAINDIV RI, PESSOA P, PESSOAFISICA PF'
      'WHERE RI.IDTITULAR   = :IDPESSOA'
      'AND P.IDPESSOA       = RI.IDFAVORECIDO'
      'AND PF.IDPESSOA      = P.IDPESSOA'
      'AND RI.FLGPENSAOALIM = 1'
      'AND RI.FLGTPRUBMANUT = 1'
      'AND RI.IDEMPRESA     = :PIDFUNDACAO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 117
    Top = 406
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 1262094
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryLotes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLOTE, MESREFERENCIA, DESCRICAO, '
      ' '#39' - '#39' AS HIFEN'
      'FROM CTRLINTERFACE'
      ' WHERE '
      '(MESREFERENCIA = '#39'2002/06'#39') AND'
      '(TIPO = '#39'B'#39') AND'
      '(IDPESSOA IS NULL) AND'
      '(FLGIDATMP = 1) AND'
      '(FLGVOLTATMP = 0) AND'
      '(FLGTIPOFOLHA = 2) ')
    ValidateWithMask = True
    Left = 254
    Top = 406
  end
  object qryMostraPrevia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.NOME, PR.IDRUBRICA, PV.DESCRICAO, PR.VALORPROVENTO, PR.' +
        'VALORINFO, PR.MES,'
      '       DECODE(PR.FLGDESCONTO,0,'#39'PROVENTO'#39',1,'#39'DESCONTO'#39') AS TIPO'
      '             FROM PESSOA P, PREVIA PR, PROVDESC PV'
      '             WHERE '
      '             P.IDPESSOA=PR.IDRESPONSAVEL AND'
      '             PR.IDRUBRICA = PV.IDPROVENTO AND'
      '             PR.FLGTIPODESC IN ('#39'T'#39','#39'I'#39','#39'K'#39') AND'
      '             PR.IDLOTE = 4429 '
      '             '
      '             ORDER BY IDRESPONSAVEL, SEQRUBRICA       ')
    ValidateWithMask = True
    Left = 189
    Top = 357
  end
  object dsMostraPrevia: TwwDataSource
    DataSet = qryMostraPrevia
    Left = 219
    Top = 357
  end
  object qryParticipante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT R.IDRECEBEDOR AS IDPESSOA, R.IDTITULAR AS IDTITULAR, P.NO' +
        'ME,'
      
        '       PPP.INSCRICAONUMERO, EL.MATRICULA, PPP.IDPESSJUR, PPP.IDP' +
        'LANOPREV'
      
        'FROM VW_RECEBEDOR R, PARTPREVPLAN PPP, ELEGPATRO EL, PESSOA P, P' +
        'ATRO PAT'
      'WHERE (PPP.IDPESSOA = :PESSOA)'
      'AND (PPP.IDPESSOA=R.IDTITULAR)'
      'AND (EL.IDPESSOA=R.IDTITULAR)'
      'AND (P.IDPESSOA=R.IDRECEBEDOR)'
      'AND (PPP.FLGDESATIVADO = 0)'
      'AND (PAT.IDPESSOA = EL.IDPESSJUR)'
      'AND (PAT.IDFUNDACAO = :PIDFUNDACAO)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 606
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryRubricaGravar: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'INSERT INTO PREVIA'
      
        '(NUMEROPROCESSO,    IDPESSJUR,          IDPATRO,           IDPLA' +
        'NOPREV,'
      
        ' IDTITULAR,         IDPESSOA,           IDRESPONSAVEL,     IDFAV' +
        'ORECIDO,'
      
        ' MES,               MESCOBRANCA,        IDBENEFICIO,       IDRUB' +
        'RICA,'
      ' IDLOTE,            FLGTIPODESC,        FLGDESCONTO,'
      
        ' IDMOTIVO,          SEQPROPOSTA,        SEQRUBRICA,        REFER' +
        'ENCIA,'
      
        ' VALORPROVENTO,     VALORCOTAS,         VALORINFO,         VALOR' +
        'RECEBIDO,'
      
        ' CODMOEDA,          IDREGRACALCULO,     CODIRRFDARF,       CODAL' +
        'TERADOR,'
      
        ' DATAPAGAMENTO,     FONTEPAGADORA,      FLGIRRF,           IDMOD' +
        'ULO,'
      
        ' FLGSRB,            FLGOK,              FLGCONCESSAO,      FLGIN' +
        'DIVIDUAL,'
      
        ' FLGCOMPOESALPART,  FLGCOMPOESALBENEF,  ORDEM,             FLGPA' +
        'GA,'
      
        ' IDEMPRESA,         RECPAG,             CODTIPRECDES,      CODCE' +
        'NTROCUSTO,'
      
        ' CODCENTRORESPON,   UNIDNEGOC,          PLANO,             PLACO' +
        'NTA,'
      
        ' CODPORTFORMA,      DFLOATPAGTO,        NUMPROCINSS,       FLGSA' +
        'LFAM,'
      ' FLGPROVISORIO,     IDVERSAOESTORNO,'
      
        ' IDPLANOORIGEM,     IDPLANOCONTABIL,    IDFAVDOC,          SEQDO' +
        'CUMENTO, IDPERFILINVEST, CODPROVDESC)'
      ' VALUES'
      
        '(:NUMEROPROCESSO,   :IDPESSJUR,         :IDPATRO,          :IDPL' +
        'ANOPREV,'
      
        ' :IDTITULAR,        :IDPESSOA,          :IDRESPONSAVEL,    :IDFA' +
        'VORECIDO,'
      
        ' :MES,              :MESCOBRANCA,       :IDBENEFICIO,      :IDRU' +
        'BRICA,'
      ' :IDLOTE,           :FLGTIPODESC,       :FLGDESCONTO,'
      
        ' :IDMOTIVO,         :SEQPROPOSTA,       :SEQRUBRICA,       :REFE' +
        'RENCIA,'
      
        ' :VALORPROVENTO,    :VALORCOTAS,        :VALORINFO,        :VALO' +
        'RRECEBIDO,'
      
        ' :CODMOEDA,         :IDREGRACALCULO,    :CODIRRFDARF,      :CODA' +
        'LTERADOR,'
      
        ' :DATAPAGAMENTO,    :FONTEPAGADORA,     :FLGIRRF,          :IDMO' +
        'DULO,'
      
        ' :FLGSRB,           :FLGOK,             :FLGCONCESSAO,     :FLGI' +
        'NDIVIDUAL,'
      
        ' :FLGCOMPOESALPART, :FLGCOMPOESALBENEF, :ORDEM,            :FLGP' +
        'AGA,'
      
        ' :IDEMPRESA,        :RECPAG,            :CODTIPRECDES,     :CODC' +
        'ENTROCUSTO,'
      
        ' :CODCENTRORESPON,  :UNIDNEGOC,         :PLANO,            :PLAC' +
        'ONTA,'
      
        ' :CODPORTFORMA,     :DFLOATPAGTO,       :NUMPROCINSS,      :FLGS' +
        'ALFAM,'
      ' :FLGPROVISORIO,    :IDVERSAOPAGTO,'
      
        ' :IDPLANOORIGEM,    :IDPLANOCONTABIL,   :IDFAVDOC,         :SEQD' +
        'OCUMENTO, :IDPERFILINVEST, :CODPROVDESC) '
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 675
    Top = 391
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMEROPROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFAVORECIDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGTIPODESC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SEQRUBRICA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALORPROVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALORCOTAS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALORINFO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALORRECEBIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODMOEDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDREGRACALCULO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIRRFDARF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODALTERADOR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAPAGAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FONTEPAGADORA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGIRRF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGSRB'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGOK'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGCONCESSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGINDIVIDUAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGCOMPOESALPART'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGCOMPOESALBENEF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGPAGA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODTIPRECDES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODCENTRORESPON'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UNIDNEGOC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODPORTFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'DFLOATPAGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMPROCINSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGSALFAM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGPROVISORIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDVERSAOPAGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOCONTABIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFAVDOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPERFILINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODPROVDESC'
        ParamType = ptUnknown
      end>
  end
  object qryRubricasIRRF: TwwQuery
    CachedUpdates = True
    AfterPost = qryVirtualAfterPost
    AfterDelete = qryVirtualAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '        '#39'12345'#39' AS IDPROVENTO,'
      '        '#39'1234567890123456789012345678901234567890'#39' AS DESCRICAO,'
      #9#39'12345'#39' AS CODIRRFDARF,'
      '        0 AS CODIGOINT'
      'FROM DUAL'
      'WHERE 1=2'
      'ORDER BY  IDPROVENTO,CODIRRFDARF'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updRubricasIRRF
    ControlType.Strings = (
      'FLGDESCONTO;CheckBox;1;0'
      'TIPO;CheckBox;P;B'
      'INCLUIDO;CheckBox;1;')
    PictureMasks.Strings = (
      'VALOR'#9'###.###.##0,00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 349
    Top = 406
  end
  object dsRubricasIRRF: TwwDataSource
    DataSet = qryRubricasIRRF
    Left = 378
    Top = 406
  end
  object updRubricasIRRF: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  IDRUBRICA = :IDRUBRICA,'
      '  NOMERUBRICA = :NOMERUBRICA,'
      '  CODIGODARF = :CODIGODARF'
      'where'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  NOMERUBRICA = :OLD_NOMERUBRICA and'
      '  CODIGODARF = :OLD_CODIGODARF')
    InsertSQL.Strings = (
      'insert into DUAL'
      '  (IDRUBRICA, NOMERUBRICA, CODIGODARF)'
      'values'
      '  (:IDRUBRICA, :NOMERUBRICA, :CODIGODARF)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  NOMERUBRICA = :OLD_NOMERUBRICA and'
      '  CODIGODARF = :OLD_CODIGODARF')
    Left = 407
    Top = 406
  end
  object qryBuscaRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 502
    Top = 352
  end
  object qryPlanoContabil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME'
      'FROM PLANPREVCONTABIL'
      'WHERE FLGPROCESSAMENTOFB = '#39'S'#39
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 108
    Top = 318
  end
  object dsPessoa: TDataSource
    AutoEdit = False
    DataSet = cdsPessoa
    OnDataChange = dsPessoaDataChange
    Left = 359
    Top = 545
  end
  object cdsPessoa: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 233
    Top = 481
  end
  object OpenDialog: TOpenDialog
    Filter = '*.prv|*.prv'
    Left = 392
    Top = 544
  end
  object cdsRubrica: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 329
    Top = 574
  end
  object dsRubrica: TDataSource
    AutoEdit = False
    DataSet = cdsRubrica
    Left = 359
    Top = 574
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar relatório do Envio de Benefícios'
    Left = 773
    Top = 548
  end
  object qryPerfil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPERFILINVEST, NOME'
      'FROM PERFILINVEST'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 704
    Top = 338
  end
end
