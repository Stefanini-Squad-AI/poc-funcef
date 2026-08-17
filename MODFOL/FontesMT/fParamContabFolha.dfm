inherited frmParamContabFolha: TfrmParamContabFolha
  Left = 196
  Top = 143
  HelpContext = 210068
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Contabilização / Contas a Pagar da Folha de Pagamento'
  ClientHeight = 475
  ClientWidth = 775
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 775
    Height = 436
    BorderWidth = 2
    object pnlResult: TPanel
      Left = 2
      Top = 2
      Width = 771
      Height = 432
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlResult'
      TabOrder = 1
      object memResult: TMemo
        Left = 0
        Top = 0
        Width = 771
        Height = 329
        Align = alTop
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object bbtnVoltar: TBitBtn
        Left = 5
        Top = 335
        Width = 92
        Height = 31
        Caption = '&Voltar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = bbtnVoltarClick
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DD00DDDDD4444DDDDD00DDD44444444DDD00DD444DDDD444DD00DD44DDDDDD44
          DD00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD4
          4D00DD44DDDD4D44DD00DD44DDDD4444DD00DDDDDDDD444DDD00DDDDDDDD4444
          DD00DDDDDDDDDDDDDD00}
      end
      object bbtnSalvar: TBitBtn
        Left = 109
        Top = 335
        Width = 92
        Height = 31
        Caption = 'S&alvar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = bbtnSalvarClick
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
      end
    end
    object pnlSelecao: TPanel
      Left = 2
      Top = 2
      Width = 771
      Height = 432
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object lblCancelProcRubIncompleta: TLabel
        Left = 34
        Top = 184
        Width = 157
        Height = 13
        Caption = 'com Parametrização Incompleta?'
        OnClick = lblCancelProcRubIncompletaClick
      end
      object gbxMesAnoRef: TGroupBox
        Left = 6
        Top = 3
        Width = 256
        Height = 52
        Caption = ' Mês e Ano de Referência '
        TabOrder = 0
        object cmbMes: TComboBox
          Left = 16
          Top = 18
          Width = 137
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
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
            'Dezembro')
        end
        object speAno: TSpinEdit
          Left = 174
          Top = 18
          Width = 65
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 2003
          OnChange = speAnoChange
        end
      end
      object rgProcesso: TRadioGroup
        Left = 6
        Top = 61
        Width = 256
        Height = 39
        Caption = ' Processo '
        Columns = 2
        ItemIndex = 1
        Items.Strings = (
          'Prévia'
          'Final')
        TabOrder = 1
        TabStop = True
        OnClick = rgProcessoClick
      end
      object gbxEstabelecimento: TGroupBox
        Left = 6
        Top = 106
        Width = 256
        Height = 52
        Caption = ' Estabelecimento '
        TabOrder = 2
        object dblckEstab: TwwDBLookupCombo
          Left = 8
          Top = 18
          Width = 240
          Height = 21
          Ctl3D = True
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Estabelecimento')
          LookupTable = CdsEstab
          LookupField = 'IDPESSOA'
          Style = csDropDownList
          ParentCtl3D = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          UseTFields = False
          AllowClearKey = True
          OnChange = dblckEstabChange
        end
      end
      object chkCancelProcRubIncompleta: TCheckBox
        Left = 16
        Top = 168
        Width = 217
        Height = 17
        Caption = 'Cancelar Processo ao encontrar Rubrica'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object gbxMotivo: TGroupBox
        Left = 267
        Top = 3
        Width = 502
        Height = 207
        Caption = ' Tipo de Folha '
        TabOrder = 4
        object chklstTipoFolha: TColorCheckListBox
          Left = 9
          Top = 15
          Width = 480
          Height = 155
          ItemHeight = 13
          Style = lbOwnerDrawFixed
          TabOrder = 0
        end
        object spbtSelTodos: TBitBtn
          Left = 9
          Top = 174
          Width = 155
          Height = 25
          Caption = '   Seleciona Todos'
          TabOrder = 1
          TabStop = False
          OnClick = spbtSelTodosClick
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
        object spbtInvSelecao: TBitBtn
          Left = 172
          Top = 174
          Width = 155
          Height = 25
          Caption = '   Inverte Seleção'
          TabOrder = 2
          TabStop = False
          OnClick = spbtInvSelecaoClick
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
      object pgctrlPrincipal: TPageControl
        Left = 5
        Top = 210
        Width = 764
        Height = 223
        ActivePage = tbshContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object tbshContab: TTabSheet
          Caption = 'Contabilização'
          object rgConsolida: TRadioGroup
            Left = 12
            Top = 31
            Width = 207
            Height = 37
            Caption = ' Consolidar Rubricas da Mesma Conta? '
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Sim'
              'Não')
            TabOrder = 0
          end
          object gbxTipoPag: TGroupBox
            Left = 230
            Top = 31
            Width = 348
            Height = 85
            Caption = 'Tipo de Operação'
            TabOrder = 2
            object dblckTipOper: TwwDBLookupCombo
              Left = 10
              Top = 35
              Width = 327
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'TIPDESCRICAO'#9'25'#9'Descrição')
              LookupTable = CdsTipoOper
              LookupField = 'TIPCODIGO'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnCloseUp = dblckTipOperCloseUp
              OnExit = dblckTipOperExit
            end
          end
          object rgMantemCCusto: TRadioGroup
            Left = 12
            Top = 79
            Width = 207
            Height = 37
            Hint = 
              'Nos Lançamentos de Horas em Outro Setor,  Manter o C.Custo do Em' +
              'pregado.'
            Caption = ' Mantém C.Custo do Empregado? '
            Columns = 2
            ItemIndex = 1
            Items.Strings = (
              'Sim'
              'Não')
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
        end
        object tbshCAP: TTabSheet
          Caption = 'Contas a Pagar'
          object Bevel1: TBevel
            Left = 3
            Top = 8
            Width = 294
            Height = 118
          end
          object Label11: TLabel
            Left = 12
            Top = 70
            Width = 80
            Height = 13
            Caption = 'Data Pagamento'
          end
          object Label1: TLabel
            Left = 12
            Top = 22
            Width = 94
            Height = 13
            Caption = 'Tipo de Documento'
          end
          object dtPagamento: TCMDateTimePicker
            Left = 12
            Top = 84
            Width = 84
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 1
          end
          object dblckTipoDoc: TwwDBLookupCombo
            Left = 12
            Top = 36
            Width = 276
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            LookupTable = CdsTipoDoc
            LookupField = 'CODTIPDOC'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
            OnCloseUp = dblckTipoDocCloseUp
            OnExit = dblckTipoDocExit
          end
          object chkRateioCC: TCheckBox
            Left = 102
            Top = 93
            Width = 153
            Height = 17
            Caption = ' Ratear por Centro de Custo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object GroupBox1: TGroupBox
            Left = 304
            Top = 3
            Width = 281
            Height = 123
            Caption = ' Tipos de Desembolso '
            TabOrder = 3
            object chkTipoDes: TColorCheckListBox
              Left = 9
              Top = 15
              Width = 264
              Height = 72
              OnClickCheck = chkTipoDesClickCheck
              ItemHeight = 13
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
            object bbtnSelTipo: TBitBtn
              Left = 9
              Top = 90
              Width = 131
              Height = 25
              Caption = '   Seleciona Todos'
              TabOrder = 1
              TabStop = False
              OnClick = bbtnSelTipoClick
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
            object bbtnInvTipo: TBitBtn
              Left = 142
              Top = 90
              Width = 131
              Height = 25
              Caption = '   Inverte Seleção'
              TabOrder = 2
              TabStop = False
              OnClick = bbtnInvTipoClick
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
          object chkConsTipoDesemb: TCheckBox
            Left = 102
            Top = 69
            Width = 190
            Height = 17
            Caption = 'Consolidar por Tipo de Desembolso'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
          end
        end
        object tbshSEL: TTabSheet
          Caption = 'Seleção de Rubricas e Empregados'
          ImageIndex = 2
          object lbl1: TLabel
            Left = 7
            Top = 1
            Width = 42
            Height = 13
            Caption = 'Rubricas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbl2: TLabel
            Left = 447
            Top = 1
            Width = 59
            Height = 13
            Caption = 'Empregados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label2: TLabel
            Left = 328
            Top = 176
            Width = 115
            Height = 13
            Caption = 'Informe Matrícula(s)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object chklstRubrica: TColorCheckListBox
            Left = 7
            Top = 15
            Width = 300
            Height = 135
            OnClickCheck = chklstRubricaClickCheck
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            Style = lbOwnerDrawFixed
            TabOrder = 0
            OnDrawItem = chklstRubricaDrawItem
            OnKeyDown = chklstRubricaKeyDown
          end
          object chklstFunc: TColorCheckListBox
            Left = 447
            Top = 15
            Width = 300
            Height = 119
            OnClickCheck = chklstRubricaClickCheck
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            Style = lbOwnerDrawFixed
            TabOrder = 1
            OnDrawItem = chklstRubricaDrawItem
            OnKeyDown = chklstRubricaKeyDown
          end
          object grpTipContr: TGroupBox
            Left = 314
            Top = 10
            Width = 126
            Height = 140
            Caption = ' Tipo de Contrato '
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
            OnExit = grpTipContrExit
            object cbxEfetivos: TCheckBox
              Left = 9
              Top = 16
              Width = 85
              Height = 13
              Caption = 'Efetivos'
              Checked = True
              State = cbChecked
              TabOrder = 0
              OnClick = FiltraEmpregados
            end
            object cbxTemporarios: TCheckBox
              Left = 9
              Top = 51
              Width = 85
              Height = 13
              Caption = 'Temporários'
              TabOrder = 1
              OnClick = FiltraEmpregados
            end
            object cbxEstagiarios: TCheckBox
              Left = 9
              Top = 68
              Width = 85
              Height = 13
              Caption = 'Estagiários'
              TabOrder = 2
              OnClick = FiltraEmpregados
            end
            object cbxTerceiros: TCheckBox
              Left = 9
              Top = 120
              Width = 85
              Height = 13
              Caption = 'Terceiros'
              TabOrder = 3
              OnClick = FiltraEmpregados
            end
            object cbxAutonomos: TCheckBox
              Left = 9
              Top = 85
              Width = 85
              Height = 13
              Caption = 'Autônomos'
              TabOrder = 4
              OnClick = FiltraEmpregados
            end
            object cbxPropDirSemVinc: TCheckBox
              Left = 9
              Top = 102
              Width = 112
              Height = 13
              Caption = 'Prop/Dir s/ Vinc'
              TabOrder = 5
              OnClick = FiltraEmpregados
            end
            object cbxEspeciais: TCheckBox
              Left = 9
              Top = 34
              Width = 109
              Height = 13
              Caption = 'Efetivos Especiais'
              Checked = True
              State = cbChecked
              TabOrder = 6
              OnClick = FiltraEmpregados
            end
          end
          object btnSelTudo: TBitBtn
            Left = 7
            Top = 158
            Width = 148
            Height = 30
            Hint = 'Seleciona Todas as Rubricas'
            Caption = '   Seleciona Tudo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = btnSelTudoClick
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
          object btnInverte: TBitBtn
            Left = 159
            Top = 158
            Width = 148
            Height = 30
            Hint = 'Inverte a Seleção das Rubricas'
            Caption = '   Inverte Seleção'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnClick = btnInverteClick
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
          object btnSelPessoa: TBitBtn
            Left = 447
            Top = 137
            Width = 148
            Height = 30
            Hint = 'Seleciona Todos os Estabelecimentos'
            Caption = '   Seleciona Todos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnClick = btnSelPessoaClick
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
          object btnInvPessoa: TBitBtn
            Left = 600
            Top = 137
            Width = 148
            Height = 30
            Hint = 'Inverte a Seleção dos Estabelecimentos'
            Caption = '   Inverte Seleção'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            OnClick = btnInvPessoaClick
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
          object edtSelEmpregados: TEdit
            Left = 448
            Top = 172
            Width = 239
            Height = 21
            Hint = 'Informe as matrículas separadas por ponto e vírgula ou traço.'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            OnKeyPress = edtSelEmpregadosKeyPress
          end
          object btnSelEmpregados: TBitBtn
            Left = 688
            Top = 169
            Width = 68
            Height = 25
            Caption = '   &Marcar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 8
            TabStop = False
            OnClick = btnSelEmpregadosClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888FF8888888888888778888888888888F77F8888888888800F08
              8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
              88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
              08888877777F788F7F8881999991FFCF088887777777F87878F8998999991CFF
              F088778777777F88F78F99F899991FFCFF0877F877777F87887899FF89991CCF
              FFF077FF87777F7888F799F9F8891FFFF77877F7F8877F88F77899F99FF81FF7
              788877F77FF878F7788889999991777888888777777787788888889999988888
              8888887777788888888888888888888888888888888888888888}
            NumGlyphs = 2
            Spacing = 0
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 436
    Width = 775
    inherited tb97Fundo: TToolbar97
      Left = 326
      DockPos = 326
      inherited sep1: TToolbarSep97
        Left = 277
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 193
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 93
        Top = 0
        Blank = True
        SizeHorz = 20
      end
      inherited bbtnSair: TBitBtn
        Left = 196
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 279
      end
      object bbtnConfirmar: TBitBtn
        Left = 113
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnConfirmarClick
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
      object bbtnVerResultado: TBitBtn
        Left = 0
        Top = 0
        Width = 93
        Height = 33
        Hint = 'Ir para tela de resultado '
        Caption = ' Resultado'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = bbtnVerResultadoClick
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DD00DD4444DDDDDDDD00DDD444DDDDDDDD00DD4444DDDD44DD00DD44D4DDDD44
          DD00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD4
          4D00DD44DDDDDD44DD00DD444DDDD444DD00DDD44444444DDD00DDDDD4444DDD
          DD00DDDDDDDDDDDDDD00}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 473
    Top = 332
    TargetsData = (
      1
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'Filter'
        0))
  end
  object CdsEstab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 57
    Top = 280
  end
  object CdsTipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 89
    Top = 352
  end
  object CdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 105
    Top = 432
  end
  object CdsTipoDes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 190
    Top = 432
  end
  object svdlgResult: TOpenDialog
    DefaultExt = '*.TXT'
    Filter = 'Arquivos Texto|*.TXT|Todos|*.*'
    InitialDir = 'C:\'
    Options = [ofHideReadOnly, ofPathMustExist, ofNoNetworkButton]
    Title = 'Indique o Arquivo que conterá o Resultado da Geração'
    Left = 538
    Top = 332
  end
  object CdsRubrica: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 266
    Top = 431
  end
  object CdsEmpregados: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 145
    Top = 280
  end
  object CdsEmpregadosAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 233
    Top = 288
  end
  object CdsRubricaAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 201
    Top = 344
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 41
    Top = 328
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 89
    Top = 312
  end
  object cdsAvaliaFornec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 670
    Top = 368
  end
end
