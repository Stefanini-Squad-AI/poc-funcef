inherited frmFolhaNormalPrevia: TfrmFolhaNormalPrevia
  Left = 359
  Top = 195
  HelpContext = 180009
  Caption = 'Prévia da Folha de Benefícios'
  ClientHeight = 625
  ClientWidth = 1464
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1464
    Height = 586
    object pgctrlOpcoes: TPageControl
      Left = 1
      Top = 81
      Width = 1462
      Height = 504
      ActivePage = tbsPreparos
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object tbsPreparos: TTabSheet
        Caption = 'Preparos do Mês'
        object pnlTabSheet3: TPanel
          Left = 0
          Top = 0
          Width = 1454
          Height = 476
          Align = alClient
          BevelOuter = bvLowered
          Caption = 'pnlTabSheet3'
          TabOrder = 0
          object Panel1: TPanel
            Left = 1
            Top = 1
            Width = 1452
            Height = 41
            Align = alTop
            TabOrder = 1
            object btnInverte: TBitBtn
              Left = 6
              Top = 7
              Width = 131
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
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33333333FF33333333FF333993333333300033377F3333333777333993333333
                300033F77FFF3333377739999993333333333777777F3333333F399999933333
                33003777777333333377333993333333330033377F3333333377333993333333
                3333333773333333333F333333333333330033333333F33333773333333C3333
                330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
                993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
                333333333337733333FF3333333C333330003333333733333777333333333333
                3000333333333333377733333333333333333333333333333333}
              NumGlyphs = 2
            end
            object bbtnDesfazPreparo: TBitBtn
              Left = 256
              Top = 7
              Width = 169
              Height = 26
              Caption = '&Desfaz Preparo/Prévia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnClick = bbtnDesfazPreparoClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
                3333333777333777FF33339993707399933333773337F3777FF3399933000339
                9933377333777F3377F3399333707333993337733337333337FF993333333333
                399377F33333F333377F993333303333399377F33337FF333373993333707333
                333377F333777F333333993333101333333377F333777F3FFFFF993333000399
                999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
                99933773FF777F3F777F339993707399999333773F373F77777F333999999999
                3393333777333777337333333999993333333333377777333333}
              NumGlyphs = 2
            end
            object BtnAtualizaNumDep: TBitBtn
              Left = 1152
              Top = 8
              Width = 193
              Height = 26
              Caption = 'Atualização de dependentes'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              OnClick = BtnAtualizaNumDepClick
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                04000000000080000000130B0000130B0000100000000000000000000000007F
                7F007F7F00007F7F7F000000FF0000FFFF00BFBFBF00FFFFFF00000000000000
                0000000000000000000000000000000000000000000000000000666666666666
                6000600000000000067306666666666666000777777777777600600000000000
                0773030550025107000000550700255000440555506005557034005555005550
                0606630555555500707660555555555007064075055505706004440060507007
                7044444070706707044466660707703066666666603070066666}
            end
            object BtnApagaPrevia: TBitBtn
              Left = 984
              Top = 8
              Width = 169
              Height = 26
              Caption = 'D&esfazer Prévia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              Visible = False
              OnClick = BtnApagaPreviaClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
                3333333777333777FF33339993707399933333773337F3777FF3399933000339
                9933377333777F3377F3399333707333993337733337333337FF993333333333
                399377F33333F333377F993333303333399377F33337FF333373993333707333
                333377F333777F333333993333101333333377F333777F3FFFFF993333000399
                999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
                99933773FF777F3F777F339993707399999333773F373F77777F333999999999
                3393333777333777337333333999993333333333377777333333}
              NumGlyphs = 2
            end
          end
          object dbgrdPreparosAnt: TwwDBGrid
            Left = 1
            Top = 42
            Width = 1452
            Height = 433
            Selected.Strings = (
              'FLGENVIAR'#9'7'#9'Processar'#9'F'
              'IDLOTE'#9'8'#9'Código do~Lote'#9'F'
              'DESCRICAO'#9'41'#9'Descrição do Lote de Pagamento'#9'F'
              'DESCRTIPOFOLHA'#9'10'#9'Tipo de~Folha'#9'F'
              'MESREFERENCIA'#9'9'#9'Mês~Referência'#9'F'
              'JAPROC'#9'9'#9'Prévia já~Executada'#9'F'
              'QTREGS'#9'9'#9'Quant.~Benefícios'#9'F'
              'VLRTOTAL'#9'14'#9'Valor Total'#9'F'
              'DATAPAGAMENTO'#9'10'#9'Data~Pagamento'#9'F')
            MemoAttributes = []
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
            Align = alClient
            DataSource = dsPreparosAnt
            KeyOptions = []
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 2
            TitleButtons = False
            OnCalcCellColors = dbgrdPreparosAntCalcCellColors
            IndicatorColor = icBlack
          end
        end
      end
      object tbsIndividual: TTabSheet
        Caption = 'Individual'
        inline frameBenef: TfrmFrameListaBenef
          Width = 1454
          Height = 476
          Align = alClient
          inherited Panel3: TPanel
            Width = 1454
            inherited Dock971: TDock97
              Width = 1215
              inherited TB97oKCancelar: TToolbar97
                inherited bbtnIncluiBenef: TBitBtn
                  Font.Height = -12
                end
                inherited bbtnIncluiLista: TBitBtn
                  Font.Height = -12
                end
                inherited bbtnExcluiTudo: TBitBtn
                  Font.Height = -12
                end
                inherited bbtnExcluiCorrente: TBitBtn
                  Font.Height = -12
                end
              end
            end
          end
          inherited dbgrdPessoas: TwwDBGrid
            Width = 1454
            Height = 442
          end
        end
      end
      object tbsResultado: TTabSheet
        Caption = 'Resultado'
        object pnlTabSheet4: TPanel
          Left = 0
          Top = 0
          Width = 1217
          Height = 476
          Align = alClient
          BevelOuter = bvLowered
          Caption = 'pnlTabSheet4'
          TabOrder = 0
          object Panel5: TPanel
            Left = 1
            Top = 1
            Width = 1215
            Height = 474
            Align = alClient
            Caption = 'Panel5'
            TabOrder = 0
            object memResult: TMemo
              Left = 1
              Top = 1
              Width = 1213
              Height = 397
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              WordWrap = False
            end
            object PnlProgress: TPanel
              Left = 1
              Top = 398
              Width = 1213
              Height = 75
              Align = alBottom
              BevelOuter = bvNone
              BorderStyle = bsSingle
              TabOrder = 1
              Visible = False
              object Panel3: TPanel
                Left = 0
                Top = 0
                Width = 1209
                Height = 71
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object Label5: TLabel
                  Left = 0
                  Top = 0
                  Width = 1209
                  Height = 19
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Processando a Prévia da Folha de Benefício'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clSilver
                  Font.Height = -15
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                end
                object Mensagem: TLabel
                  Left = 0
                  Top = 19
                  Width = 52
                  Height = 13
                  Align = alTop
                  Caption = 'Mensagem'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object lblContagem: TLabel
                  Left = 0
                  Top = 32
                  Width = 1209
                  Height = 22
                  Align = alClient
                  AutoSize = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  WordWrap = True
                end
                object PBPrevia: TProgressBar
                  Left = 0
                  Top = 54
                  Width = 1209
                  Height = 17
                  Align = alBottom
                  Min = 0
                  Max = 100
                  TabOrder = 0
                  Visible = False
                end
              end
            end
          end
        end
      end
      object tbsETL: TTabSheet
        Caption = 'Execução ETL'
        ImageIndex = 3
        object pnlExecETL: TPanel
          Left = 0
          Top = 0
          Width = 1454
          Height = 44
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object btnRefresh: TBitBtn
            Left = 16
            Top = 6
            Width = 193
            Height = 30
            Caption = 'Atualizar informações'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = btnRefreshClick
            Glyph.Data = {
              06020000424D0602000000000000760000002800000028000000140000000100
              0400000000009001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333FFFFFFFF333FFFFF3330000000033300000333377777777F337777
              7FF330EFEFEF03307333703337F3FFFF7F37733377F330F4444E033333333033
              37F777737F333333F7F33099999903333330703337F333337F33333777FF309F
              FFF903333330000337F333337F33333777733099999903333330003337F3FF3F
              7F333337773330F44E0003333330033337F7737773333337733330EFEF003333
              3330333337FFFF7733333337333330000003333333333333377777733333FFFF
              FFFF3333333333300000000333333F3333377777777F333303333330EFEFEF03
              33337F333337F3FFFF7F333003333330F4444E0333377F333337F777737F3300
              03333330EFEFEF0333777F333337F3FFFF7F300003333330F4444E0337777F33
              3337F777737F330703333330EFEFEF03337773333337F3FF3F7F330333333330
              F44E0003337FF333FF37F7737773330733370330EFEF00333377FFF77337FFFF
              7733333000003330000003333337777733377777733333333333333333333333
              33333333333333333333}
            NumGlyphs = 2
          end
        end
        object dbgrdExecETL: TwwDBGrid
          Left = 0
          Top = 44
          Width = 1454
          Height = 432
          Selected.Strings = (
            'ID'#9'7'#9'Execução'#9'F'
            'IDLOTE_LISTA'#9'65'#9'Lotes'#9'F'
            'DATA_INICIO'#9'20'#9'Data Início'#9'F'
            'DATA_FIM'#9'20'#9'Data Fim'#9'F'
            'ETAPA'#9'7'#9'Etapa'#9'F'
            'DESCRICAO'#9'45'#9'Descrição'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsExecETL
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
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
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 1462
      Height = 80
      Align = alTop
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object grpMesRef: TGroupBox
        Left = 3
        Top = 1
        Width = 208
        Height = 72
        Caption = ' Mês e Ano para Processamento '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnEnter = grpMesRefEnter
        object cmbMes: TComboBox
          Left = 8
          Top = 25
          Width = 121
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
          OnChange = cmbMesChange
          OnExit = cmbMesExit
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
        object spnedAno: TSpinEdit
          Left = 136
          Top = 25
          Width = 63
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxValue = 0
          MinValue = 0
          ParentFont = False
          TabOrder = 1
          Value = 0
          OnChange = spnedAnoChange
          OnExit = spnedAnoExit
        end
      end
      object GroupBox2: TGroupBox
        Left = 214
        Top = 1
        Width = 150
        Height = 72
        Caption = ' Previsão de Pagamento '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edDataFolha: TCMDateTimePicker
          Left = 6
          Top = 26
          Width = 138
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
      object grpProcessar: TGroupBox
        Left = 366
        Top = 1
        Width = 188
        Height = 72
        Caption = ' Processar '
        TabOrder = 2
        object chkConcessao: TCheckBox
          Tag = 1
          Left = 11
          Top = 27
          Width = 127
          Height = 13
          Caption = 'Folha de Concessão'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 1
          OnClick = chkProcessarClick
        end
        object chkManutencao: TCheckBox
          Tag = 2
          Left = 11
          Top = 12
          Width = 127
          Height = 16
          Caption = 'Folha de Manutenção'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 0
          OnClick = chkProcessarClick
        end
        object chkAbono: TCheckBox
          Tag = 3
          Left = 11
          Top = 41
          Width = 97
          Height = 13
          Caption = 'Folha de Abono'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = chkProcessarClick
        end
        object chkResgate: TCheckBox
          Tag = 3
          Left = 11
          Top = 56
          Width = 172
          Height = 13
          Caption = 'Folha de Resgate/Portabilidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = chkResgateClick
        end
      end
      object dbrgAtualiza: TDBRadioGroup
        Left = 557
        Top = 1
        Width = 276
        Height = 31
        Caption = 'Atualização Automática do Nº de Dep. de IR e SF'
        Columns = 2
        Items.Strings = (
          'Habilitada'
          'Desabilitada')
        ReadOnly = True
        TabOrder = 3
      end
      object cboxIndividual: TCheckBox
        Left = 557
        Top = 31
        Width = 225
        Height = 17
        Caption = 'Utiliza Lista Individual de Processamento'
        TabOrder = 4
        OnClick = cboxIndividualClick
      end
      object chkUsaPrevisaoPagto: TCheckBox
        Left = 557
        Top = 45
        Width = 268
        Height = 17
        Caption = 'Utiliza Previsão de Pagamento'
        TabOrder = 5
      end
      object ChkPreviaGeral: TCheckBox
        Left = 557
        Top = 59
        Width = 268
        Height = 17
        Caption = 'Prévia Geral Utilizando Lista Individual'
        TabOrder = 6
        OnClick = ChkPreviaGeralClick
      end
      object chkModoAuto: TCheckBox
        Left = 843
        Top = 5
        Width = 157
        Height = 17
        Caption = 'Prévia em Modo Automático'
        TabOrder = 7
        OnClick = chkModoAutoClick
      end
      object chkETL: TCheckBox
        Left = 1081
        Top = 5
        Width = 109
        Height = 17
        Caption = 'Executar via ETL'
        TabOrder = 8
        OnClick = chkETLClick
      end
    end
    object grpdividelista: TGroupBox
      Left = 836
      Top = 25
      Width = 225
      Height = 51
      Caption = 'Divisão de Listas'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object chkDivideLista: TCheckBox
        Left = 8
        Top = 14
        Width = 88
        Height = 17
        Caption = 'Dividir Listas '
        TabOrder = 0
        OnClick = chkDivideListaClick
      end
      object speDivideLista: TSpinEdit
        Left = 98
        Top = 10
        Width = 63
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 200
      end
      object chkapagaprevia: TCheckBox
        Left = 8
        Top = 33
        Width = 211
        Height = 15
        Caption = 'Apagar Previa antes do processamento?'
        TabOrder = 2
      end
    end
  end
  inherited Dock971: TDock97
    Top = 586
    Width = 1464
    inherited tb97Fundo: TToolbar97
      Left = 439
      DockPos = 439
      inherited sep1: TToolbarSep97
        Left = 523
      end
      inherited sep3: TToolbarSep97
        Left = 439
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 355
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object ToolbarSep973: TToolbarSep97 [3]
        Left = 235
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object ToolbarSep974: TToolbarSep97 [4]
        Left = 117
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnSair: TBitBtn
        Left = 358
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 442
      end
      object bbtnPreparo: TBitBtn
        Left = 0
        Top = 0
        Width = 117
        Height = 33
        Caption = '&Processar'
        TabOrder = 2
        OnClick = bbtnPreparoClick
        Kind = bkOK
        Spacing = 2
      end
      object bbtnOutro: TBitBtn
        Left = 238
        Top = 0
        Width = 117
        Height = 33
        Caption = '&Processar Outro'
        TabOrder = 3
        Visible = False
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnSalvar: TBitBtn
        Left = 120
        Top = 0
        Width = 115
        Height = 33
        Caption = 'S&alvar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        Visible = False
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
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 235
      DockPos = 235
      Visible = False
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 1403
    Top = 11
    TargetsData = (
      1
      3
      (
        ''
        'Text'
        0)
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object qryAux1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 97
    Top = 297
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar relatório do Envio de Benefícios'
    Left = 789
    Top = 100
  end
  object updPreparos: TUpdateSQL
    ModifySQL.Strings = (
      'update CTRLINTERFACE'
      'set'
      '  IDLOTE = :IDLOTE,'
      '  FLGIDATMP = :FLGIDATMP,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  FLGVOLTATMP = :FLGVOLTATMP,'
      '  FLGIDAINTERFACE = :FLGIDAINTERFACE,'
      '  FLGVOLTAINTERFACE = :FLGVOLTAINTERFACE,'
      '  FLGEMITIUCC = :FLGEMITIUCC,'
      '  DATAIDATMP = :DATAIDATMP,'
      '  DATAVOLTATMP = :DATAVOLTATMP,'
      '  DATAIDAINTERFACE = :DATAIDAINTERFACE,'
      '  DATAVOLTAINTERFA = :DATAVOLTAINTERFA,'
      '  DATAEMITIUCC = :DATAEMITIUCC,'
      '  NUMREG = :NUMREG,'
      '  VLRTOTAL = :VLRTOTAL,'
      '  MESREFERENCIA = :MESREFERENCIA,'
      '  TIPO = :TIPO,'
      '  FLGPREPARADO = :FLGPREPARADO,'
      '  DATAPREPARO = :DATAPREPARO,'
      '  DESCRICAO = :DESCRICAO,'
      '  FLGATRASODEVOL = :FLGATRASODEVOL,'
      '  FLGENVIAR = :FLGENVIAR'
      'where'
      '  IDLOTE = :OLD_IDLOTE')
    InsertSQL.Strings = (
      'insert into CTRLINTERFACE'
      
        '  (IDLOTE, FLGIDATMP, IDPESSOA, CODPORTFORMA, FLGVOLTATMP, FLGID' +
        'AINTERFACE, '
      
        '   FLGVOLTAINTERFACE, FLGEMITIUCC, DATAIDATMP, DATAVOLTATMP, DAT' +
        'AIDAINTERFACE, '
      
        '   DATAVOLTAINTERFA, DATAEMITIUCC, NUMREG, VLRTOTAL, MESREFERENC' +
        'IA, TIPO, '
      
        '   FLGPREPARADO, DATAPREPARO, DESCRICAO, FLGATRASODEVOL, FLGENVI' +
        'AR)'
      'values'
      
        '  (:IDLOTE, :FLGIDATMP, :IDPESSOA, :CODPORTFORMA, :FLGVOLTATMP, ' +
        ':FLGIDAINTERFACE, '
      
        '   :FLGVOLTAINTERFACE, :FLGEMITIUCC, :DATAIDATMP, :DATAVOLTATMP,' +
        ' :DATAIDAINTERFACE, '
      
        '   :DATAVOLTAINTERFA, :DATAEMITIUCC, :NUMREG, :VLRTOTAL, :MESREF' +
        'ERENCIA, '
      
        '   :TIPO, :FLGPREPARADO, :DATAPREPARO, :DESCRICAO, :FLGATRASODEV' +
        'OL, :FLGENVIAR)')
    DeleteSQL.Strings = (
      'delete from CTRLINTERFACE'
      'where'
      '  IDLOTE = :OLD_IDLOTE')
    Left = 29
    Top = 393
  end
  object qryPreparosAnt: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDLOTE, FLGIDATMP, DECODE(FLGIDATMP,1,'#39'Sim'#39','#39'Não'#39') AS JAP' +
        'ROC,'
      '       DATAPAGAMENTO, TIPO,  FLGPREPARADO,'
      '       FLGTIPOFOLHA,'
      '       NVL(FLGCONCESSAO,0) AS FLGCONCESSAO,'
      
        '       DECODE(FLGTIPOFOLHA,0,DECODE(FLGCONCESSAO,1,'#39'Concessão'#39','#39 +
        'Normal'#39'),'
      '       1,'#39'Pagto Pendente'#39',2,'#39'Extra'#39',3,'#39'Abono'#39',4,'#39'Adiant. Abono'#39','
      '       5,'#39'Exclusões Efetivação'#39') AS DESCRTIPOFOLHA,'
      '       NUMREG AS QTREGS, MESREFERENCIA,'
      '       DESCRICAO, 0 AS FLGENVIAR, ROUND(VLRTOTAL,2) AS VLRTOTAL'
      'FROM CTRLINTERFACE CI'
      
        'WHERE (FLGTIPOFOLHA = 0 OR FLGTIPOFOLHA = 5 OR FLGTIPOFOLHA = 6 ' +
        'OR FLGTIPOFOLHA IS NULL)'
      'AND (FLGPREPARADO = 1)'
      'AND (FLGVOLTATMP = 0)'
      'AND (TIPO = '#39'B'#39')'
      'ORDER BY IDLOTE'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updPreparos
    ControlType.Strings = (
      'FLGENVIAR;CheckBox;1;0')
    PictureMasks.Strings = (
      
        'VLRTOTAL'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#' +
        '][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#]' +
        '[#]]]}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 29
    Top = 345
    object qryPreparosAntFLGENVIAR: TFloatField
      DisplayLabel = 'Processar'
      DisplayWidth = 7
      FieldName = 'FLGENVIAR'
    end
    object qryPreparosAntIDLOTE: TFloatField
      DisplayLabel = 'Código do~Lote'
      DisplayWidth = 8
      FieldName = 'IDLOTE'
      ReadOnly = True
    end
    object qryPreparosAntDESCRICAO: TStringField
      DisplayLabel = 'Descrição do Lote de Pagamento'
      DisplayWidth = 41
      FieldName = 'DESCRICAO'
      ReadOnly = True
      Size = 200
    end
    object qryPreparosAntDESCRTIPOFOLHA: TStringField
      DisplayLabel = 'Tipo de~Folha'
      DisplayWidth = 10
      FieldName = 'DESCRTIPOFOLHA'
      ReadOnly = True
    end
    object qryPreparosAntMESREFERENCIA: TStringField
      DisplayLabel = 'Mês~Referência'
      DisplayWidth = 9
      FieldName = 'MESREFERENCIA'
      ReadOnly = True
      FixedChar = True
      Size = 7
    end
    object qryPreparosAntJAPROC: TStringField
      DisplayLabel = 'Prévia já~Executada'
      DisplayWidth = 9
      FieldName = 'JAPROC'
      ReadOnly = True
      Size = 3
    end
    object qryPreparosAntQTREGS: TFloatField
      DisplayLabel = 'Quant.~Benefícios'
      DisplayWidth = 9
      FieldName = 'QTREGS'
      ReadOnly = True
    end
    object qryPreparosAntVLRTOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 14
      FieldName = 'VLRTOTAL'
      ReadOnly = True
    end
    object qryPreparosAntDATAPAGAMENTO: TDateTimeField
      DisplayLabel = 'Data~Pagamento'
      DisplayWidth = 10
      FieldName = 'DATAPAGAMENTO'
      ReadOnly = True
    end
    object qryPreparosAntFLGIDATMP: TFloatField
      FieldName = 'FLGIDATMP'
      ReadOnly = True
      Visible = False
    end
    object qryPreparosAntTIPO: TStringField
      FieldName = 'TIPO'
      ReadOnly = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryPreparosAntFLGPREPARADO: TFloatField
      FieldName = 'FLGPREPARADO'
      ReadOnly = True
      Visible = False
    end
    object qryPreparosAntFLGTIPOFOLHA: TFloatField
      FieldName = 'FLGTIPOFOLHA'
      ReadOnly = True
      Visible = False
    end
    object qryPreparosAntFLGCONCESSAO: TFloatField
      FieldName = 'FLGCONCESSAO'
      ReadOnly = True
      Visible = False
    end
  end
  object dsPreparosAnt: TwwDataSource
    DataSet = qryPreparosAnt
    Left = 29
    Top = 297
  end
  object qryBeneficiario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.IDPESSOA,P.NOME,EL.MATRICULA,PP.INSCRICAONUMERO, PAT.NO' +
        'ME AS PATRO,'
      '       BF.IDPESSJUR,PF.DATANASC,PF.NUMDEPIRRF'
      
        'FROM   PESSOA P, ELEGPATRO EL, PARTPREVPLAN PP, PESSOA PAT, PATR' +
        'O PATR,'
      '       BFCIARIOTITPLAN BF, PESSOAFISICA PF'
      'WHERE  P.IDPESSOA = :iIdPessoa AND'
      '       PATR.IDFUNDACAO = :iIdPessJur AND'
      '       PF.IDPESSOA = P.IDPESSOA AND'
      '       BF.IDPESSOA = P.IDPESSOA AND'
      '       BF.IDPESSJUR = PATR.IDPESSOA AND'
      '       BF.IDTITULAR = EL.IDPESSOA AND'
      '       BF.IDPESSJUR = EL.IDPESSJUR AND'
      '       EL.IDPESSOA = PP.IDPESSOA AND'
      '       EL.IDPESSJUR = PP.IDPESSJUR AND'
      '       PP.IDPLANOPREV = BF.IDPLANOPREV AND'
      '       EL.IDPESSJUR = PAT.IDPESSOA'
      '')
    ValidateWithMask = True
    Left = 24
    Top = 65094
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iIdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdPessJur'
        ParamType = ptUnknown
      end>
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 98
    Top = 348
  end
  object qryUpdateHst: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE HSTBENEFBFCIARIO H'
      'SET H.IDLOTE = :PIDLOTE'
      'WHERE H.IDTITULAR = :PIDTITULAR'
      'AND H.IDPESSOA = :PIDPESSOA'
      'AND H.IDLOTE <> :PIDLOTE'
      'AND H.FLGENVIADO = 0'
      'AND H.MES = :PMES'
      'AND H.DTEFETPGTO IS NULL'
      'AND H.VLBENEFPGTO IS NULL'
      'AND EXISTS (SELECT C.IDLOTE'
      '            FROM CTRLINTERFACE C'
      '            WHERE C.IDLOTE = H.IDLOTE'
      '            AND C.FLGTIPOFOLHA NOT IN (3,4))'
      'AND EXISTS (SELECT 1'
      '            FROM PATRO PAT'
      '            WHERE PAT.IDPESSOA = H.IDPESSJUR'
      '            AND PAT.IDFUNDACAO = :PIDFUNDACAO)')
    ValidateWithMask = True
    Left = 162
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PMES'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryAux3: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 98
    Top = 396
  end
  object qrylog: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 225
    Top = 297
  end
  object qryControle: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 913
    Top = 160
  end
  object qryModoAuto: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 105
    Top = 241
  end
  object qryConsulta: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 909
    Top = 281
  end
  object qryExecETL: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT EP.ID, SUBSTR(EP.IDLOTE_LISTA, 1, 244) IDLOTE_LISTA, EP.D' +
        'ATA_INICIO, EP.DATA_FIM, EP.ETAPA,'
      '       CASE'
      
        '         WHEN EP.ETAPA = 16  AND EP.DATA_FIM IS NOT NULL THEN '#39'P' +
        'révia Completa'#39
      
        '         WHEN NVL(EP.ETAPA,0) <> 16 AND EP.DATA_FIM IS NOT NULL ' +
        'THEN '#39'Prévia executada parcialmente'#39
      '         ELSE  DECODE(EP.ETAPA,  0, '#39'Prévia Iniciada'#39','
      '                                 1, '#39'Apaga Previa'#39','
      
        '                                 2, '#39'Buscando Informações Recebe' +
        'dores'#39','
      
        '                                 3, '#39'Gerando Benefícios / TMPDES' +
        'C'#39','
      
        '                                 4, '#39'Gerando Rubricas Individuai' +
        's'#39','
      
        '                                 5, '#39'Prepara Regras (RubricaIndi' +
        'v / TMPDESC)'#39','
      
        '                                 6, '#39'Executando Regras (RubricaI' +
        'ndiv / TMPDESC)'#39','
      
        '                                 7, '#39'Atribuindo Regras (RubricaI' +
        'ndiv / TMPDESC)'#39','
      
        '                                 8, '#39'Determina Base para Imposto' +
        's'#39','
      '                                 9, '#39'Cáculo de Impostos'#39','
      
        '                                10, '#39'Executando Regras (Impostos' +
        ')'#39','
      
        '                                11, '#39'Atribuindo Regras (Impostos' +
        ')'#39','
      
        '                                12, '#39'Verifica Margem de Desconto' +
        #39','
      
        '                                13, '#39'Gerando Bases de Pagamento,' +
        ' Contábil e Financeiro'#39','
      '                                14, '#39'Carregando Previa'#39','
      
        '                                15, '#39'Executando Estrutura de Cál' +
        'culos'#39','
      
        '                                16, '#39'Executando Perfil de Invest' +
        'imento'#39')'
      '       END AS DESCRICAO'
      '  FROM CM.ETL_FOLHA_PREVIA EP'
      ' WHERE EP.MESCOBRANCA = :mescobranca'
      'ORDER BY EP.DATA_INICIO DESC'
      ''
      ' ')
    ValidateWithMask = True
    Left = 909
    Top = 377
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end>
  end
  object dsExecETL: TDataSource
    DataSet = qryExecETL
    Left = 909
    Top = 433
  end
end
