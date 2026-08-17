inherited frmFolhaNormalEfet: TfrmFolhaNormalEfet
  Top = 16
  HelpContext = 180014
  Caption = 'Efetivação de Versão de Pagamento'
  ClientHeight = 690
  ClientWidth = 1348
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDiretorio: TPanel [0]
    Left = 349
    Top = 207
    Width = 217
    Height = 170
    TabOrder = 2
    Visible = False
    object DriveComboBox1: TDriveComboBox
      Left = 5
      Top = 4
      Width = 209
      Height = 19
      DirList = DirectoryListBox1
      TabOrder = 1
    end
    object btnOkDir: TBitBtn
      Left = 24
      Top = 140
      Width = 77
      Height = 25
      Caption = '&OK'
      Default = True
      TabOrder = 2
      OnClick = btnOkDirClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      Spacing = 2
    end
    object btnSairDiretorio: TBitBtn
      Left = 107
      Top = 140
      Width = 78
      Height = 25
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
      OnClick = btnSairDiretorioClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      Spacing = 2
    end
    object DirectoryListBox1: TDirectoryListBox
      Left = 5
      Top = 26
      Width = 207
      Height = 111
      ItemHeight = 16
      TabOrder = 0
    end
  end
  inherited pnlFundo: TPanel
    Width = 1348
    Height = 651
    inherited Splitter1: TSplitter
      Top = 205
      Width = 1346
    end
    inherited pnlOpcoes: TPanel
      Width = 1346
      Height = 204
      object pnlOpcoesVersao: TPanel
        Left = 1
        Top = 42
        Width = 1344
        Height = 161
        Align = alClient
        TabOrder = 2
        Visible = False
        object cboxAlteraEstadoVersao: TCheckBox
          Left = 22
          Top = 12
          Width = 291
          Height = 17
          Caption = 'Desejo colocar as versões selecionadas no Estado ==>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dbcboxNovoEstado: TwwDBComboBox
          Left = 312
          Top = 9
          Width = 257
          Height = 21
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DropDownCount = 8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 0
          Items.Strings = (
            'Gera Contabilização'#9'-5'
            'Gera Documentos'#9'-4'
            'Gera Arquivos'#9'-3')
          ParentFont = False
          Sorted = False
          TabOrder = 1
          UnboundDataType = wwDefault
        end
      end
      object pnlSelecaoLista: TPanel
        Left = 1
        Top = 1
        Width = 1344
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object rgOpcaoSelecao: TRadioGroup
          Left = 0
          Top = 0
          Width = 362
          Height = 41
          Align = alLeft
          Caption = ' Opção de Seleção '
          Columns = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemIndex = 0
          Items.Strings = (
            'Lotes a Efetivar'
            'Versões Pendentes'
            'Regeração contábil')
          ParentFont = False
          TabOrder = 0
          OnClick = rgOpcaoSelecaoClick
        end
        object gboxSituacaoCF: TGroupBox
          Left = 362
          Top = 0
          Width = 982
          Height = 41
          Align = alClient
          Caption = ' Situação da Integração Contábil e Financeira '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object lblContabil: TLabel
            Left = 11
            Top = 18
            Width = 60
            Height = 13
            Caption = 'lblContabil'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblfinanc: TLabel
            Left = 236
            Top = 18
            Width = 49
            Height = 13
            Caption = 'lblfinanc'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
      object pnlOpcoesLote: TPanel
        Left = 1
        Top = 42
        Width = 1344
        Height = 161
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object rdgProcessar: TRadioGroup
          Left = 542
          Top = 1
          Width = 801
          Height = 102
          Align = alClient
          Caption = ' Filtra os Lotes de ... '
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Manutenção'
            'Concessão'
            'Manut./Concessão'
            'Abono'
            'Antecip. Abono'
            'Extra'
            'Pagto. Pendente'
            'Folha de Resgate/Portabilidade')
          TabOrder = 1
          OnClick = MontaLista
        end
        object pnlDatas: TPanel
          Left = 1
          Top = 1
          Width = 541
          Height = 102
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object grpMesRef: TGroupBox
            Left = 4
            Top = 3
            Width = 160
            Height = 65
            Caption = ' Mês e Ano de Referência  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object spnedAno: TSpinEdit
              Left = 101
              Top = 25
              Width = 50
              Height = 22
              EditorEnabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxValue = 2100
              MinValue = 1950
              ParentFont = False
              TabOrder = 1
              Value = 1950
              OnChange = MontaMes
              OnExit = MontaLista
            end
            object cmbMes: TComboBox
              Left = 10
              Top = 26
              Width = 84
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 0
              OnChange = MontaMes
              OnExit = MontaLista
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
          end
          object GroupBox3: TGroupBox
            Left = 167
            Top = 3
            Width = 372
            Height = 65
            Caption = ' Datas '
            TabOrder = 1
            object Label2: TLabel
              Left = 5
              Top = 15
              Width = 51
              Height = 13
              Caption = 'Efetivação'
            end
            object Label3: TLabel
              Left = 186
              Top = 7
              Width = 84
              Height = 26
              AutoSize = False
              Caption = 'Prevista        (doc. financeiros)'
              WordWrap = True
            end
            object Label4: TLabel
              Left = 276
              Top = 8
              Width = 85
              Height = 26
              AutoSize = False
              Caption = 'Programada     (doc. financeiros)'
              WordWrap = True
            end
            object lblcontabilizacao: TLabel
              Left = 95
              Top = 15
              Width = 69
              Height = 13
              Caption = 'Contabilização'
            end
            object dtpDtEfetivacao: TCMDateTimePicker
              Left = 5
              Top = 35
              Width = 85
              Height = 21
              Hint = 'Data da efetivação registrada no histórico de versões'
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              ShowButton = True
              TabOrder = 0
              UnboundDataType = wwDTEdtDate
              OnChange = ChecaValidacao
              OnExit = dtpDtEfetivacaoExit
            end
            object dptDtVencimento: TCMDateTimePicker
              Left = 186
              Top = 35
              Width = 85
              Height = 21
              Hint = 
                'Data prevista de vencimento dos documentos financeiros e lançame' +
                'ntos (LANCTODOCUM) se menor que o dia corrente'
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              ShowButton = True
              TabOrder = 2
              UnboundDataType = wwDTEdtDate
              OnChange = ChecaValidacao
              OnExit = dptDtVencimentoExit
            end
            object dptDtProgramada: TCMDateTimePicker
              Left = 276
              Top = 35
              Width = 85
              Height = 21
              Hint = 'Data programada efetiva dos documentos financeiros'
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              ShowButton = True
              TabOrder = 3
              UnboundDataType = wwDTEdtDate
              OnChange = dptDtProgramadaChange
              OnExit = dptDtProgramadaExit
            end
            object dtpDtContabilizacao: TCMDateTimePicker
              Left = 95
              Top = 35
              Width = 85
              Height = 21
              Hint = 'Data para os lançamentos contábil se existirem'
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              ShowButton = True
              TabOrder = 1
              UnboundDataType = wwDTEdtDate
              OnChange = ChecaValidacao
              OnExit = dtpDtContabilizacaoExit
            end
          end
          object Panel3: TPanel
            Left = 0
            Top = 69
            Width = 541
            Height = 33
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
            object lbHistorico: TLabel
              Left = 5
              Top = 9
              Width = 154
              Height = 13
              Caption = 'Descrição (v.ano/mes/versao) : '
            end
            object edtHistorico: TEdit
              Left = 164
              Top = 6
              Width = 366
              Height = 21
              Hint = 'Nomeclatura da Folha de benefício que será processada'
              MaxLength = 60
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnChange = ChecaValidacao
            end
          end
        end
        object pnlEletronico: TPanel
          Left = 1
          Top = 103
          Width = 1342
          Height = 57
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          object rgEletronico: TRadioGroup
            Left = 0
            Top = 0
            Width = 329
            Height = 57
            Align = alLeft
            Caption = ' Geração de Arquivo Eletrônico '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemIndex = 0
            Items.Strings = (
              'Sim. Para as exceções gera documento individual.'
              'Não. Gera documento individual para todos os pagamentos.')
            ParentFont = False
            TabOrder = 0
            OnClick = rgEletronicoClick
          end
          object pnlOpcaoEletronico: TPanel
            Left = 329
            Top = 0
            Width = 291
            Height = 57
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
            object Label6: TLabel
              Left = 13
              Top = 3
              Width = 279
              Height = 27
              AutoSize = False
              Caption = 
                'Pasta para gravação dos arquivos (caso não esteja parametrizado ' +
                'no Contas/Caixas x Forma de Pagamento)'
              WordWrap = True
            end
            object pnlLblDiretorio: TPanel
              Left = 13
              Top = 32
              Width = 182
              Height = 21
              BevelOuter = bvNone
              BorderStyle = bsSingle
              Color = clCaptionText
              TabOrder = 0
              object lblDiretorio: TLabel
                Left = 4
                Top = 2
                Width = 15
                Height = 13
                Caption = 'C:\'
              end
            end
            object btnEscolheDir: TBitBtn
              Left = 201
              Top = 32
              Width = 27
              Height = 21
              Hint = 'Seleciona a Pasta que será gravado os arquivos para banco'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = btnEscolheDirClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
                333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
                300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
                333337F373F773333333303330033333333337F3377333333333303333333333
                333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
                333337777F337F33333330330BB00333333337F373F773333333303330033333
                333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
                333377777F77377733330BBB0333333333337F337F33333333330BB003333333
                333373F773333333333330033333333333333773333333333333}
              NumGlyphs = 2
            end
          end
          object pnlOpcaoDocIndiv: TPanel
            Left = 620
            Top = 0
            Width = 291
            Height = 57
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 2
            Visible = False
            object Label1: TLabel
              Left = 13
              Top = 3
              Width = 207
              Height = 27
              AutoSize = False
              Caption = 
                'Contas/Caixas x Forma de Pagamento para lançamento dos documento' +
                's individuais'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object dblkPortadorForma: TwwDBLookupCombo
              Left = 13
              Top = 32
              Width = 225
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO')
              LookupTable = qryPortadorForma1
              LookupField = 'CODPORTFORMA'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnChange = ChecaValidacao
            end
          end
          object cbEXEC_SP_MAPA: TCheckBox
            Left = 885
            Top = 22
            Width = 209
            Height = 17
            Caption = 'Executar Mapa da Folha de Benefício.'
            TabOrder = 4
          end
          object chkExcessoDebito: TCheckBox
            Left = 885
            Top = 4
            Width = 209
            Height = 17
            Caption = 'Tratar excesso de débito'
            TabOrder = 3
          end
          object cbPreparaContrib: TCheckBox
            Left = 885
            Top = 40
            Width = 209
            Height = 17
            Caption = 'Prepara Contribuição da Patrocinadora'
            Checked = True
            State = cbChecked
            TabOrder = 5
          end
        end
      end
    end
    inherited pgctrlInformacoes: TPageControl
      Top = 208
      Width = 1346
      Height = 442
      ActivePage = tbsLista
      Font.Style = []
      ParentFont = False
      OnChange = pgctrlInformacoesChange
      object tbsLista: TTabSheet [0]
        Caption = 'Lotes a efetivar'
        ImageIndex = 1
        object toolControles: TToolBar
          Left = 0
          Top = 0
          Width = 1338
          Height = 2
          AutoSize = True
          Caption = 'toolControles'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Images = frameProgresso.ImageList1
          ParentFont = False
          ShowCaptions = True
          TabOrder = 0
          object tbtnSep1: TToolButton
            Left = 0
            Top = 2
            Width = 8
            Caption = 'tbtnSep1'
            Enabled = False
            ImageIndex = 0
            Style = tbsSeparator
          end
          object tbtnsep2: TToolButton
            Left = 8
            Top = 2
            Width = 8
            Caption = 'tbtnsep2'
            Enabled = False
            ImageIndex = 0
            Style = tbsSeparator
          end
        end
        object pnlOpcaoFiltroLista: TPanel
          Left = 0
          Top = 2
          Width = 1338
          Height = 35
          Align = alTop
          TabOrder = 1
          object Label5: TLabel
            Left = 941
            Top = 11
            Width = 255
            Height = 13
            Caption = 'Número de linhas para cada página do contra-cheque'
            Visible = False
          end
          object btnInverte: TBitBtn
            Left = 4
            Top = 5
            Width = 128
            Height = 26
            Caption = '&Inverter Seleção'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = btnInverteClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000003
              33333333777777733333333330CCC03333333333F7777733F3333330330C0330
              33333337337773373333333333303333333333F33337333333F3303333333333
              3033373333333333373333333333333333333F3333333333333F033333333333
              3303733333333333337333333333333333333F3333333333333F033333333333
              3303733333333333FF7333333333333000333FFFFF33333777FF000003333307
              B70377777F333377777F09990333330BBB0377777F333377777F099903333307
              B70377777F3333777773099903333330003377777F3333377733000003333330
              3333777773F3F3F7333333333030303333333333373737333333}
            NumGlyphs = 2
          end
          object cboxVerificar: TCheckBox
            Left = 143
            Top = 10
            Width = 494
            Height = 17
            Caption = 
              ' <== Marque aqui para Apenas Verificar a Parametrização dos Lote' +
              's sem Efetivar '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = ChecaValidacao
          end
          object chkDemonstrativos: TCheckBox
            Left = 636
            Top = 10
            Width = 279
            Height = 17
            Caption = 'Gerar o arquivo dos demonstrativos automaticamente'
            TabOrder = 2
            OnClick = chkDemonstrativosClick
          end
          object edtNumLinhas: TEdit
            Left = 1201
            Top = 6
            Width = 41
            Height = 21
            Hint = 'Nomeclatura da Folha de benefício que será processada'
            MaxLength = 60
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            Visible = False
            OnChange = ChecaValidacao
          end
        end
        object dbgrdLista: TwwDBGrid
          Left = 0
          Top = 37
          Width = 1338
          Height = 377
          Selected.Strings = (
            'IDLISTA'#9'10'#9'IDLISTA'#9'F'
            'DESCRICAO'#9'200'#9'DESCRICAO'#9'F'
            'MES'#9'7'#9'MES'#9'F'
            'FLGTIPOFOLHALOTE'#9'10'#9'FLGTIPOFOLHALOTE'#9'F'
            'PROCESSAR'#9'10'#9'PROCESSAR'#9'F'
            'RESPCHKLIST'#9'100'#9'RESPCHKLIST'#9'F'
            'TIPOLOTE'#9'21'#9'TIPOLOTE'#9'F'
            'BLOQUEIO'#9'9'#9'BLOQUEIO'#9'F')
          MemoAttributes = []
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alClient
          DataSource = dsLista
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgTrailingEllipsis, dgShowCellHint]
          ParentFont = False
          TabOrder = 2
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = dbgrdListaCalcCellColors
          IndicatorColor = icBlack
          OnFieldChanged = dbgrdListaFieldChanged
        end
      end
      inherited tbsResultado: TTabSheet
        inherited frameProgresso: TfrmFrameProgresso
          Width = 1338
          Height = 414
          PopupMenu = frameProgresso.PopupMenu1
          inherited Panel1: TPanel
            Width = 1338
            Height = 388
            inherited toolControles: TToolBar
              Width = 1336
            end
            inherited redResultado: TRichEdit
              Width = 1336
              Height = 346
            end
          end
          inherited BarraProgresso: TProgressBar
            Top = 388
            Width = 1338
            TabOrder = 2
          end
          inherited StatusBar1: TStatusBar
            Top = 395
            Width = 1338
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 651
    Width = 1348
    inherited tb97Fundo: TToolbar97
      Left = 421
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 819
    Top = 19
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object qryPortadorForma1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 705
    Top = 166
  end
  object qryAux1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 741
    Top = 58
  end
  object qryLista: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLOTE AS IDLISTA,'
      '       DESCRICAO,'
      '       MESREFERENCIA AS MES,'
      '       NVL(FLGTIPOFOLHA,0) FLGTIPOFOLHALOTE,'
      '       0 AS PROCESSAR,'
      '       RESPCHKLIST,'
      '       DECODE(FLGCONCESSAO,1,'#39'Concessão'#39','
      '         DECODE(FLGTIPOFOLHA,'
      '           0,'#39'Manutenção'#39','
      '           1,'#39'Pagamento Pendente'#39','
      '           2,'#39'Folha Extra'#39','
      '           3,'#39'Folha de Abono'#39','
      '           4,'#39'Folha de Antec. Abono'#39','
      '           5,'#39'Exclusões Efetivação'#39','
      '           6,'#39'Reprocessamento'#39')) AS TIPOLOTE,'
      
        '       DECODE(SUBSTR(NVL(RESPCHKLIST,'#39'0'#39'),1,1),'#39'0'#39','#39'Bloqueado'#39','#39 +
        'Liberado'#39') AS BLOQUEIO'
      'FROM  CTRLINTERFACE'
      'WHERE (FLGIDATMP = 1)'
      'AND (TIPO = '#39'B'#39')'
      ' ')
    UpdateObject = updLista
    ControlType.Strings = (
      'PROCESSAR;CheckBox;1;0')
    ValidateWithMask = True
    Left = 121
    Top = 274
  end
  object updLista: TUpdateSQL
    ModifySQL.Strings = (
      'update CTRLINTERFACE'
      'set'
      '  PROCESSAR = :PROCESSAR'
      'where'
      '  IDLISTA = :OLD_IDLISTA')
    InsertSQL.Strings = (
      '')
    Left = 174
    Top = 273
  end
  object dsLista: TwwDataSource
    DataSet = qryLista
    Left = 80
    Top = 274
  end
  object qryProcesso: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 841
    Top = 86
  end
  object QryDocTxt1: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' '#39'123456789012345678'#39' CONTALIQUIDO,'
      ' 0 IDPESSOA,'
      ' '#39'12345678901234567890123456789012345678901234567890'#39' NOME,'
      
        ' '#39'12345678901234567890123456789012345678901234567890'#39' RAZAOSOCIA' +
        'L,'
      ' '#39'123456789012345678'#39' NUMDOCUMENTO,'
      ' '#39'123456789012345'#39' CONTACORRENTE,'
      ' '#39'1234567890'#39' CODBANCOFAVORECIDO,'
      ' '#39'123456789012345'#39' NUMAGENCIA,'
      
        ' '#39'12345678901234567890123456789012345678901234567890'#39' LOGRADOURO' +
        ','
      ' '#39'12345678'#39' NUMERO,'
      ' '#39'12345678901234567890'#39' COMPLEMENTO,'
      ' '#39'12345678901234567890'#39' BAIRRO,'
      ' '#39'12345678901234567890'#39' CIDADE,'
      ' '#39'123'#39' CODESTADO,'
      ' '#39'12345678'#39' CEP,'
      ' 0 IDFORCLI,'
      ' '#39'1234567890123456789012345'#39' CODDOCUMENTO,'
      ' 0.00 VALOR,'
      ' 0.00 VALORDESCONTO,'
      ' 0.00 VALORJUROS,'
      ' '#39'01/01/1990'#39' DATAVENCTO,'
      ' '#39'01/01/1990'#39' DATAPROGRAMADA,'
      ' 0 TIPOMOEDA,'
      ' 0 NUMLOTE,'
      ' 0 CODPORTFORMA,'
      ' 0 CODPORTADOR,'
      ' 0 CODFORMAPAGTO,'
      ' 0 CODTIPOPAGTO,'
      ' '#39'0'#39' FLGEMITEAVISO,'
      ' 0 CODARQUIVOREMESSA,'
      ' 0 IDBANCO,'
      ' '#39'123456789012345'#39' NOCONTACORR,'
      ' '#39'1234567890'#39' CODBARRA,'
      ' '#39'1234567890'#39' CODBARRAVALOR,'
      ' '#39'12345678901234567890'#39' NODOCUMENTO,'
      ' '#39'123'#39' COMPLDOCUMENTO,'
      ' '#39'1'#39' TIPO,'
      ' '#39'12345678901234567890'#39' NUMEMPRESABANCO,'
      ' '#39'1'#39' DEBCRE,'
      ' '#39'1'#39' TIPOCONTA,'
      ' '#39'AGENCIA'#39' NOMEAGENCIA,'
      ' 0 DMAISALT,'
      ' 0 CODFORMAPGTOALT,'
      ' 0.00 VALORMAXIMO,'
      ' '#39'1234567890123456789012345'#39' LIVRE'
      'FROM DUAL'
      'WHERE 1 = 2'
      ''
      ' ')
    UpdateObject = updDoc
    ValidateWithMask = True
    Left = 809
    Top = 275
  end
  object qryDadosRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.LOGRADOURO,'
      '       E.NUMERO,'
      '       E.COMPLEMENTO,'
      '       E.BAIRRO,'
      '       C.NOME AS CIDADE,'
      '       S.CODESTADO,'
      '       E.CEP,'
      '       NVL(P.NUMDOCUMENTO,D.NUMDOCUMENTO) AS NUMDOCUMENTO,'
      '       P.NOME'
      
        'FROM PESSOA P, ENDPESS E, DOCPESSOA D, CIDADES C, ESTADO S, PARA' +
        'MGLOBAL PG'
      'WHERE P.IDPESSOA = :IDRESPONSAVEL'
      'AND E.IDPESSOA(+) = P.IDPESSOA'
      'AND D.IDPESSOA(+) = P.IDPESSOA'
      'AND E.IDCIDADES = C.IDCIDADES(+)'
      'AND C.IDESTADO = S.IDESTADO(+)'
      'AND PG.DOCPFISICA(+) = D.IDDOCUMENTO')
    ValidateWithMask = True
    Left = 513
    Top = 273
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object qryDadosAg: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 672
    Top = 271
  end
  object qryaux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 685
    Top = 6
  end
  object qryUltEvento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDSITFUNCATUAL,IDSITPLANOATUAL,IDSITPARTATUAL,IDEVENTOSPR' +
        'EV'
      'FROM   EVENTOSPREV'
      'WHERE (IDPESSJUR = :IDPESSJUR)'
      'AND   (IDPLANOPREV = :IDPLANOPREV)'
      'AND   (IDPESSOA = :IDPESSOA)'
      'AND   (SEQPROPOSTA = :SEQPROPOSTA)'
      'AND   (IDEVENTOGERADOR = :IDEVENTOGERADOR)'
      'ORDER BY DATAEVENTO DESC'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 282
    Top = 275
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end>
  end
  object qryEncerrado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT B.NUMEROPROCESSO'
      
        'FROM BENEFBFCIARIO B, TPPAGTOBENEFICIO TPB, PROCESSOBENEF P, EVE' +
        'NTOGERADOR EG'
      'WHERE B.NUMEROPROCESSO = :PNUMEROPROCESSO'
      'AND B.IDTITULAR = :PIDTITULAR'
      'AND B.IDSITBENEFICIO = 3'
      'AND B.FLGFORMAPAGTO = '#39'F'#39
      'AND TO_CHAR(B.DATAFINAL, '#39'YYYY/MM'#39') <= :PMESREF'
      'AND TPB.IDTPPAGTOBENEFIC = B.IDTPPAGTOBENEFIC'
      'AND TPB.FLGFREQUENCIA <> '#39'U'#39
      'AND P.NUMEROPROCESSO = B.NUMEROPROCESSO'
      'AND EG.IDEVENTOGERADOR = P.IDEVENTOGERADOR'
      'AND EG.FLGINTERNO IN ('#39'AC'#39','#39'DO'#39','#39'OE'#39')'
      
        'AND EXISTS (SELECT IDSITFUNCATUAL, IDSITPLANOATUAL, IDSITPARTATU' +
        'AL, IDEVENTOSPREV'
      '            FROM EVENTOSPREV EP'
      '            WHERE (EP.IDPESSJUR = B.IDPESSJUR)'
      '            AND (EP.IDPLANOPREV = B.IDPLANOPREV)'
      '            AND (EP.IDPESSOA = B.IDTITULAR)'
      '            AND (EP.SEQPROPOSTA = B.SEQPROPOSTA)'
      '            AND (EP.IDEVENTOGERADOR = P.IDEVENTOGERADOR)'
      '            AND NOT EXISTS (SELECT 1'
      '                            FROM EVENTOSPREV EP2'
      '                            WHERE EP2.IDPESSOA = EP.IDPESSOA'
      '                            AND EP2.DATAEVENTO > EP.DATAEVENTO))'
      ' ')
    ValidateWithMask = True
    Left = 210
    Top = 370
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pNumeroProcesso'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIdTitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMesRef'
        ParamType = ptUnknown
      end>
  end
  object qryHstContEventosPR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HCE.IDCONTRIBUICAOF, C.NOME'
      'FROM HSTCONTEVENTOSPR HCE, CONTRIBUICAO C'
      'WHERE HCE.IDEVENTOSPREV = :IDEVENTOSPREV'
      'AND HCE.IDCONTRIBUICAOF = C.IDCONTRIBUICAO'
      'AND HCE.FLGASSOCIADA = 0'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 421
    Top = 368
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDEVENTOSPREV'
        ParamType = ptUnknown
      end>
  end
  object qryContribuicaoEv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CPP.IDCONTRIBUICAO, C.NOME'
      
        'FROM EVENTOSPREV EV, CONTPREVEVENTO CPE, CONTRIBPREVPARTP CPP, C' +
        'ONTRIBUICAO C'
      'WHERE EV.IDEVENTOGERADOR = CPE.IDEVENTOGERADOR'
      'AND CPE.IDPLANOPREV = EV.IDPLANOPREV'
      'AND CPP.IDPESSOA = EV.IDPESSOA'
      'AND CPP.IDPESSJUR = EV.IDPESSJUR'
      'AND CPP.IDPLANOPREV = EV.IDPLANOPREV'
      'AND CPP.SEQPROPOSTA = 1'
      'AND CPP.IDCONTRIBUICAO = CPE.IDCONTRIBUICAO'
      'AND CPP.FLGCOBRA = 0'
      'AND CPP.IDCONTRIBUICAO = C.IDCONTRIBUICAO'
      'AND EV.IDEVENTOSPREV IN'
      '  (SELECT MAX(IDEVENTOSPREV)'
      '   FROM EVENTOSPREV'
      '   WHERE IDPESSOA = :IDPESSOA'
      '   AND IDPLANOPREV = :IDPLANOPREV'
      '   AND IDPESSJUR = :IDPESSJUR'
      '   AND DATAREGISTRO IN'
      '     (SELECT MAX(DATAREGISTRO)'
      '      FROM EVENTOSPREV'
      '      WHERE IDPESSOA = :IDPESSOA'
      '      AND IDPLANOPREV = :IDPLANOPREV'
      '      AND IDPESSJUR = :IDPESSJUR'
      '      AND IDEVENTOSPREV <> :IDEVENTOANTERIOR))')
    ValidateWithMask = True
    Left = 363
    Top = 275
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDEVENTOANTERIOR'
        ParamType = ptUnknown
      end>
  end
  object qryUpdPartPrevPlan: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update PARTPREVPLAN'
      'set IDSITPLANOPREV=:IDSITPLANOATUAL,'
      '    IDSITPART     =:IDSITPARTATUAL'
      'WHERE (IDPESSJUR = :IdPessJur)'
      'AND   (IDPLANOPREV = :IdPlanoPrev)'
      'AND   (IDPESSOA = :IdPessoa)'
      'AND   (SEQPROPOSTA = :SEQPROPOSTA)'
      '')
    ValidateWithMask = True
    Left = 301
    Top = 370
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDSITPLANOATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDSITPARTATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object qryUpdElegpatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update ELEGPATRO'
      'set IDSITFUNC=:IDSITFUNCATUAL'
      'WHERE (IDPESSJUR = :IdPessJur)'
      'AND   (IDPESSOA = :IdPessoa)'
      '')
    ValidateWithMask = True
    Left = 604
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDSITFUNCATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
  end
  object updDoc: TUpdateSQL
    Left = 869
    Top = 278
  end
  object cdsDocTxt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDocTxt'
    Left = 746
    Top = 277
  end
  object dspDocTxt: TDataSetProvider
    DataSet = QryDocTxt1
    Constraints = True
    Left = 518
    Top = 370
  end
  object qryDadoReceb: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 590
    Top = 272
  end
  object cdsParamRubrica: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 45
    Top = 368
  end
  object qryAux3: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 757
    Top = 6
  end
  object QryParamFolha: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 699
    Top = 368
  end
  object QryCpf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NUMDOCUMENTO FROM PESSOA'
      ' WHERE IDPESSOA =:IDPESSOA')
    ValidateWithMask = True
    Left = 229
    Top = 273
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAux10: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 137
    Top = 368
  end
  object qryVerifRRA: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 444
    Top = 273
  end
  object qryAux4: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 705
    Top = 58
  end
end
