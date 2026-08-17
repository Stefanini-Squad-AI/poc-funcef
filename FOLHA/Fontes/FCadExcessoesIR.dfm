inherited FrmCadExcessoesIR: TFrmCadExcessoesIR
  Left = 496
  Top = 75
  Width = 781
  Height = 692
  HelpContext = 180033
  AutoScroll = True
  Caption = 'Informações para Benefícios em Manutenção'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 765
    Height = 567
    object Label2: TLabel
      Left = 14
      Top = 12
      Width = 42
      Height = 16
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 12
      Top = 37
      Width = 99
      Height = 16
      Caption = 'Patrocinadora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 13
      Top = 63
      Width = 146
      Height = 16
      Caption = 'Plano Previdenciário'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 6
      Top = 90
      Width = 746
      Height = 3
    end
    object bvlTop: TBevel
      Left = 1
      Top = 1
      Width = 763
      Height = 252
      Align = alTop
      Shape = bsSpacer
    end
    object edNome: TEdit
      Left = 165
      Top = 8
      Width = 580
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edPatro: TEdit
      Left = 165
      Top = 35
      Width = 580
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object edPlano: TEdit
      Left = 165
      Top = 61
      Width = 580
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object rdgdestino: TRadioGroup
      Left = 7
      Top = 281
      Width = 743
      Height = 43
      Caption = 'Destino do Demonstrativo de Proventos'
      Columns = 2
      Items.Strings = (
        'Residência'
        'Não Enviar')
      TabOrder = 4
    end
    object GroupBox1: TGroupBox
      Left = 7
      Top = 96
      Width = 743
      Height = 149
      Caption = 'Informações Referentes ao I.R.R.F.'
      TabOrder = 3
      object Label10: TLabel
        Left = 6
        Top = 21
        Width = 94
        Height = 13
        Caption = 'Nº Dependentes'
      end
      object dbrgrpTpIsencao: TGroupBox
        Left = 118
        Top = 48
        Width = 198
        Height = 89
        Caption = 'Tipo de Isenção'
        TabOrder = 7
        Visible = False
        object BitBtnHistorico: TButton
          Left = 16
          Top = 50
          Width = 162
          Height = 26
          Caption = 'Histórico de moléstia grave'
          Enabled = False
          TabOrder = 1
          OnClick = BitBtnHistoricoClick
        end
        object wwDBCBIsentoIrrf: TwwDBComboBox
          Left = 16
          Top = 19
          Width = 162
          Height = 21
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DataField = 'TIPOISENCAOIRRF'
          DataSource = dsPessoaFisica
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            'Espécie de Benefício 92'#9'0'
            'Ação Judicial'#9'1'
            'Moléstia Grave'#9'2')
          Sorted = False
          TabOrder = 0
          UnboundDataType = wwDefault
          OnCloseUp = wwDBCBIsentoIrrfCloseUp
        end
      end
      object chkirtotal: TCheckBox
        Left = 675
        Top = 26
        Width = 50
        Height = 17
        Caption = 'Cálculo do IRRF com base no somatório de todas as fontes'
        TabOrder = 2
        Visible = False
      end
      object edtnumdepirrf: TEdit
        Left = 618
        Top = 9
        Width = 41
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Visible = False
      end
      object dbcIsento: TDBCheckBox
        Left = 660
        Top = 19
        Width = 73
        Height = 17
        TabStop = False
        Caption = 'ISENTO'
        DataField = 'FLGISENTOIRRF'
        DataSource = dsAux
        ReadOnly = True
        TabOrder = 3
        ValueChecked = '1'
        ValueUnchecked = '0'
        Visible = False
      end
      object dbrgrpIsentoIR: TDBRadioGroup
        Left = 6
        Top = 48
        Width = 103
        Height = 89
        Caption = 'Isenção de IR'
        DataField = 'FLGISENTOIRRF'
        DataSource = dsPessoaFisica
        Items.Strings = (
          'Sim'
          'Não')
        TabOrder = 4
        Values.Strings = (
          '1'
          '0')
        OnClick = dbrgrpIsentoIRClick
      end
      object DbcheckSomaSUP: TDBCheckBox
        Left = 171
        Top = 17
        Width = 360
        Height = 17
        Caption = 'Cálculo do IRRF com base no somatório de todas as fontes'
        DataField = 'FLGSOMAIRSUPINSS'
        DataSource = dsPessoaFisica
        TabOrder = 5
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dxDBSpinNumDep: TdxDBSpinEdit
        Left = 108
        Top = 16
        Width = 53
        Enabled = False
        TabOrder = 0
        DataField = 'NUMDEPIRRF'
        DataSource = dsPessoaFisica
      end
      object dbrgrpMolestiaGrave: TGroupBox
        Left = 326
        Top = 48
        Width = 276
        Height = 89
        Caption = 'Moléstia Grave '
        Enabled = False
        TabOrder = 6
        Visible = False
        object Label22: TLabel
          Left = 13
          Top = 18
          Width = 34
          Height = 13
          Caption = 'Início'
        end
        object Label45: TLabel
          Left = 141
          Top = 18
          Width = 46
          Height = 13
          Caption = 'Término'
        end
        object dbdtMolestiaGrave: TCMDateTimePicker
          Left = 4
          Top = 34
          Width = 121
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = cl3DLight
          ButtonStyle = cbsCustom
          DataField = 'DATAMOLESTIAGRAVE'
          DataSource = dsPessoaFisica
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 0
        end
        object dbdtFimMolestia: TCMDateTimePicker
          Left = 140
          Top = 34
          Width = 121
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = cl3DLight
          ButtonStyle = cbsCustom
          DataField = 'DATAFIMMOLESTIA'
          DataSource = dsPessoaFisica
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 1
        end
      end
    end
    object plnCalculoIRRF: TPanel
      Left = 1
      Top = 253
      Width = 763
      Height = 121
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 5
      object Label1: TLabel
        Left = 11
        Top = 0
        Width = 114
        Height = 16
        Caption = 'Cálculo do IRRF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbgBeneficio: TwwDBGrid
        Left = 9
        Top = 18
        Width = 739
        Height = 104
        Selected.Strings = (
          'BENEFICIO'#9'43'#9'Benefício'#9'F'
          'ESPECIE'#9'6'#9'Espécie'#9'F'
          'EXISTEISENCAO'#9'3'#9'Existe Isenção'#9'F'
          'MOLESTIAGRAVE'#9'3'#9'Moléstia Grave'#9'F'
          'SITPROCESSO'#9'25'#9'Ação Judicial'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = []
        MultiSelectOptions = [msoShiftSelect]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object plnHstIsencaoIRRF: TPanel
      Left = 1
      Top = 374
      Width = 763
      Height = 192
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 6
      object Pnlisencabenef: TPanel
        Left = 7
        Top = 2
        Width = 741
        Height = 200
        BevelInner = bvRaised
        TabOrder = 0
        object PnlisencabenefDet: TPanel
          Left = 2
          Top = 33
          Width = 647
          Height = 165
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 0
          object lblObservacao: TLabel
            Left = 10
            Top = 72
            Width = 69
            Height = 13
            Caption = 'Observação'
          end
          object dbrgocorrencia: TDBRadioGroup
            Left = 8
            Top = 8
            Width = 313
            Height = 61
            Caption = 'Ocorrência'
            Columns = 2
            DataField = 'FLGINDOCORRENCIA'
            DataSource = dsDet
            Items.Strings = (
              'Lançamento Único'
              'Periódico')
            TabOrder = 0
            Values.Strings = (
              '1'
              '0')
            OnChange = dbrgocorrenciaChange
          end
          object gbPeriodo: TGroupBox
            Left = 328
            Top = 8
            Width = 313
            Height = 61
            Caption = 'Período de Vigência'
            TabOrder = 1
            object lblInicio: TLabel
              Left = 8
              Top = 16
              Width = 34
              Height = 13
              Caption = 'Início'
            end
            object lblFim: TLabel
              Left = 163
              Top = 16
              Width = 46
              Height = 13
              Caption = 'Término'
            end
            object dbDtini: TDBEdit
              Left = 8
              Top = 32
              Width = 121
              Height = 21
              DataField = 'DTINICIO'
              DataSource = dsDet
              TabOrder = 0
            end
            object dbDtfim: TDBEdit
              Left = 163
              Top = 32
              Width = 121
              Height = 21
              DataField = 'DTFIM'
              DataSource = dsDet
              TabOrder = 1
              OnExit = dbDtfimExit
            end
          end
          object DBMemoObs: TDBMemo
            Left = 8
            Top = 88
            Width = 629
            Height = 69
            DataField = 'OBSERVACAO'
            DataSource = dsDet
            TabOrder = 2
          end
        end
        object dbgrdDet: TwwDBGrid
          Left = 2
          Top = 33
          Width = 647
          Height = 165
          MemoAttributes = [mSizeable]
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsDet
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 3
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object pnlBotoes: TDock97
          Left = 649
          Top = 33
          Width = 90
          Height = 165
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
          Left = 2
          Top = 2
          Width = 737
          Height = 31
          AllowDrag = False
          BoundLines = [blTop, blBottom, blLeft, blRight]
          object lblTituloHstIsencao: TLabel
            Left = 89
            Top = 8
            Width = 250
            Height = 13
            Caption = 'Histórico de Isenção de IRRF por Benefício'
          end
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
              GroupIndex = 2
              ImageIndex = 0
              Images = ImlPadrao
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnInsDetClick
            end
            object sbtnAltDet: TToolbarButton97
              Left = 25
              Top = 0
              Width = 24
              Height = 25
              Hint = 'Alterar'
              AllowAllUp = True
              GroupIndex = 2
              ImageIndex = 1
              Images = ImlPadrao
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnAltDetClick
            end
            object sbtnExcluiDet: TToolbarButton97
              Left = 49
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
          object wwDBGrid1: TwwDBGrid
            Left = 104
            Top = 32
            Width = 320
            Height = 120
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
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
    end
  end
  inherited Dock972: TDock97
    Width = 765
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 614
    Width = 765
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 272
    Top = 6
    TargetsData = (
      1
      4
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Filter'
        0))
  end
  inherited ds: TwwDataSource
    Left = 416
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      '')
    InsertSQL.Strings = (
      'insert into BENEFBFCIARIO'
      '  (FLGDESCIRMES)'
      'values'
      '  (:FLGDESCIRMES)')
    DeleteSQL.Strings = (
      'delete from BENEFBFCIARIO'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    Left = 451
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Left = 578
    Top = 3
  end
  inherited ImlPadrao: TImageList
    Left = 313
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 507
    Top = 4
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT'
      '      BBF.IDPLANOPREV,'
      '      BBF.IDPESSJUR,'
      '      BBF.IDPESSOA,'
      '      BEN.NOME AS BENEFICIO,'
      '      BBF.FLGDESCIRMES,'
      '      BBF.IDBENEFICIO,'
      '      BBF.IDSITBENEFICIO,'
      
        '      DECODE(BPP.FLGREFERENCIA,1,BEN.CODBENEFICIO,'#39' '#39') AS ESPECI' +
        'E,'
      
        '      DECODE(PF.FLGMOLESTIAGRAVE,1,'#39'SIM'#39','#39'NÃO'#39') AS MOLESTIAGRAVE' +
        ','
      '      DECODE(PRJ.SITPROCESSO,0,'#39'AÇÃO JUDICIAL EM LIMINAR'#39','
      '                             1,'#39'AÇÃO JUDICIAL JULGADA GANHA'#39','
      
        '                             2,'#39'AÇÃO JUDICIAL JULGADA PERDIDA'#39','#39 +
        ' '#39') AS SITPROCESSO,'
      
        '      (SELECT DECODE(COUNT(1),0,'#39'NÃO'#39','#39'SIM'#39') FROM CM.HISTISENCAO' +
        'IRRFBENF HB'
      '        WHERE HB.IDPLANOPREV    = BBF.IDPLANOPREV'
      '          AND HB.IDBENEFICIO    = BBF.IDBENEFICIO'
      '          AND HB.NUMEROPROCESSO = BBF.NUMEROPROCESSO'
      '          AND HB.IDPESSJUR      = BBF.IDPESSJUR'
      '          AND HB.IDTITULAR      = BBF.IDTITULAR'
      '          AND HB.IDPLANOORIGEM  = BBF.IDPLANOORIGEM'
      '          AND HB.IDPESSOA       = BBF.IDPESSOA'
      '          AND HB.SEQPROPOSTA    = BBF.SEQPROPOSTA'
      
        '          AND TO_CHAR(SYSDATE, '#39'YYYY/MM'#39') BETWEEN HB.DTINICIO AN' +
        'D NVL(HB.DTFIM, TO_CHAR(SYSDATE, '#39'YYYY/MM'#39'))'
      '       ) AS EXISTEISENCAO,'
      '     BBF.NUMEROPROCESSO,'
      '     BBF.IDTITULAR,'
      '     BBF.IDPLANOORIGEM,'
      '     BBF.SEQPROPOSTA'
      'FROM'
      '     BENEFBFCIARIO BBF,'
      '     BENEFICIO BEN,'
      '     PESSOAFISICA PF,'
      '     PROCJUD PRJ,'
      '     BENEFPLANPREV BPP'
      'WHERE'
      '     BBF.IDPESSJUR      = :PIDPESSJUR   AND'
      '     BBF.IDPESSOA       = :PIDPESSOA    AND'
      '     BBF.IDSITBENEFICIO = 1             AND'
      '     BBF.IDPESSOA       = PF.IDPESSOA(+) AND'
      '     BBF.IDPESSOA       = PRJ.IDPESSOA(+) AND'
      '     BEN.IDBENEFICIO    = BBF.IDBENEFICIO AND'
      '     BBF.IDPLANOPREV    = BPP.IDPLANOPREV AND'
      '     BBF.IDBENEFICIO    = BPP.IDBENEFICIO'
      ''
      ' ')
    ControlType.Strings = (
      'FLGDESCIRMES;CheckBox;1;0')
    Left = 383
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryBENEFICIO: TStringField
      DisplayLabel = 'BENEFÍCIO'
      DisplayWidth = 50
      FieldName = 'BENEFICIO'
      Origin = 'BASEDADOS.BENEFICIO.NOME'
      Size = 60
    end
    object qryESPECIE: TStringField
      DisplayLabel = 'ESPÉCIE '
      DisplayWidth = 6
      FieldName = 'ESPECIE'
      Size = 6
    end
    object qryFLGDESCIRMES: TFloatField
      DisplayLabel = '  Não Calcula~ IRRF no Mês'
      DisplayWidth = 12
      FieldName = 'FLGDESCIRMES'
      Origin = 'BASEDADOS.BENEFBFCIARIO.FLGDESCIRMES'
    end
    object qryMOLESTIAGRAVE: TStringField
      DisplayLabel = 'MOLÉSTIA ~  GRAVE'
      DisplayWidth = 3
      FieldName = 'MOLESTIAGRAVE'
      Size = 3
    end
    object qrySITPROCESSO: TStringField
      DisplayLabel = ' AÇÃO JUDICIAL'
      DisplayWidth = 29
      FieldName = 'SITPROCESSO'
      Size = 29
    end
    object qryIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPLANOPREV'
      Visible = False
    end
    object qryIDPESSJUR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPESSJUR'
      Visible = False
    end
    object qryIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPESSOA'
      Visible = False
    end
    object qryIDBENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDBENEFICIO'
      Visible = False
    end
    object qryIDSITBENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITBENEFICIO'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDSITBENEFICIO'
      Visible = False
    end
    object qryNUMEROPROCESSO: TFloatField
      FieldName = 'NUMEROPROCESSO'
    end
    object qryIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
    end
    object qrySEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object qryEXISTEISENCAO: TStringField
      FieldName = 'EXISTEISENCAO'
      Size = 3
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '    SELECT'
      '                   NVL(FLGDESTCC,0) AS FLGDESTCC   ,'
      '                   NVL(NUMDEPIRRF,0) AS NUMDEPIRRF ,'
      '                   NVL(NUMDEPSALF,0) AS NUMDEPSALF ,'
      '                   NVL(FLGISENTOIRRF,0) AS FLGISENTOIRRF,'
      '                   NVL(FLGSOMAIRSUPINSS,0) AS FLGSOMAIRSUPINSS,'
      'TIPOISENCAOIRRF,         DECODE(TIPOISENCAOIRRF,'
      '              '#39'0'#39','
      '              '#39'Espécie de Benefício 92'#39','
      '              '#39'1'#39','
      '              '#39'Ação Judicial'#39','
      '              '#39'2'#39','
      '              '#39'Moléstia Grave'#39') AS TPISENCAOIRRF'
      '                   FROM'
      '                   PESSOAFISICA'
      '                   WHERE IDPESSOA = :IDPESSOA')
    ValidateWithMask = True
    Left = 718
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsAux: TwwDataSource
    DataSet = qryAux
    Left = 696
    Top = 50
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE CM.HISTISENCAOIRRFBENF'
      '   SET FLGINDOCORRENCIA      = :FLGINDOCORRENCIA,'
      '       DTINICIO              = :DTINICIO,'
      '       DTFIM                 = :DTFIM,'
      '       OBSERVACAO            = :OBSERVACAO'
      ' WHERE IDHISTISENCAOIRRFBENF = :OLD_IDHISTISENCAOIRRFBENF')
    InsertSQL.Strings = (
      ''
      'INSERT INTO CM.HISTISENCAOIRRFBENF'
      '  (IDHISTISENCAOIRRFBENF,'
      '   IDPLANOPREV,'
      '   IDBENEFICIO,'
      '   NUMEROPROCESSO,'
      '   IDPESSJUR,'
      '   IDTITULAR,'
      '   IDPLANOORIGEM,'
      '   IDPESSOA,'
      '   SEQPROPOSTA,'
      '   FLGINDOCORRENCIA,'
      '   DTINICIO,'
      '   DTFIM,'
      '   OBSERVACAO)'
      'VALUES'
      '  (:IDHISTISENCAOIRRFBENF,'
      '   :IDPLANOPREV,'
      '   :IDBENEFICIO,'
      '   :NUMEROPROCESSO,'
      '   :IDPESSJUR,'
      '   :IDTITULAR,'
      '   :IDPLANOORIGEM,'
      '   :IDPESSOA,'
      '   :SEQPROPOSTA,'
      '   :FLGINDOCORRENCIA,'
      '   :DTINICIO,'
      '   :DTFIM,'
      '   :OBSERVACAO)')
    DeleteSQL.Strings = (
      'DELETE CM.HISTISENCAOIRRFBENF'
      ' WHERE IDHISTISENCAOIRRFBENF = :OLD_IDHISTISENCAOIRRFBENF')
    Left = 612
    Top = 406
  end
  object dsDet: TwwDataSource
    AutoEdit = False
    DataSet = qryDet
    Left = 567
    Top = 406
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    AfterPost = qryDetAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HB.IDHISTISENCAOIRRFBENF,'
      '       HB.IDPLANOPREV,'
      '       HB.IDBENEFICIO,'
      '       HB.NUMEROPROCESSO,'
      '       HB.IDPESSJUR,'
      '       HB.IDTITULAR,'
      '       HB.IDPLANOORIGEM,'
      '       HB.IDPESSOA,'
      '       HB.SEQPROPOSTA,'
      '       HB.FLGINDOCORRENCIA,'
      '       HB.DTINICIO,'
      '       HB.DTFIM,'
      '       HB.OBSERVACAO,'
      '       HB.TRGUSERINCLUSAO,'
      '       HB.TRGDTINCLUSAO,'
      '       HB.TRGUSERALTERACAO,'
      '       HB.TRGDTALTERACAO,'
      
        '       DECODE(HB.FLGINDOCORRENCIA,1,'#39'Lançamento único'#39','#39'Periódic' +
        'o'#39') AS DESCOCORRENCIA,'
      '       SUBSTR(HB.OBSERVACAO,1,100) as OBS_GRID'
      '  FROM CM.HISTISENCAOIRRFBENF HB'
      ' WHERE  HB.IDPESSJUR = :IDPESSJUR'
      '   AND HB.IDTITULAR = :IDTITULAR'
      '   AND HB.IDPESSOA = :IDPESSOA'
      '')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 520
    Top = 406
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptInputOutput
      end
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptInputOutput
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptInputOutput
      end>
    object qryDetIDHISTISENCAOIRRFBENF: TFloatField
      FieldName = 'IDHISTISENCAOIRRFBENF'
      Visible = False
    end
    object qryDetIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryDetIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Visible = False
    end
    object qryDetNUMEROPROCESSO: TFloatField
      FieldName = 'NUMEROPROCESSO'
      Visible = False
    end
    object qryDetIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryDetIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object qryDetIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
      Visible = False
    end
    object qryDetIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDetSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Visible = False
    end
    object qryDetDTINICIO: TStringField
      DisplayLabel = 'Data Início'
      DisplayWidth = 10
      FieldName = 'DTINICIO'
      EditMask = '!9999/99;1;_'
    end
    object qryDetDTFIM: TStringField
      DisplayLabel = 'Data Fim'
      DisplayWidth = 10
      FieldName = 'DTFIM'
      EditMask = '!9999/99;1;_'
    end
    object qryDetFLGINDOCORRENCIA: TFloatField
      DisplayLabel = 'Ocorrência'
      FieldName = 'FLGINDOCORRENCIA'
      Visible = False
    end
    object qryDetOBSERVACAO: TMemoField
      DisplayLabel = 'Observação'
      DisplayWidth = 150
      FieldName = 'OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 500
    end
    object qryDetDESCOCORRENCIA: TStringField
      DisplayLabel = 'Ocorrência'
      FieldName = 'DESCOCORRENCIA'
      Size = 30
    end
    object qryDetOBS_GRID: TStringField
      DisplayLabel = 'Observação'
      FieldName = 'OBS_GRID'
      Size = 100
    end
  end
  object qryValida: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HB.IDHISTISENCAOIRRFBENF,'
      '       HB.IDPLANOPREV,'
      '       HB.IDBENEFICIO,'
      '       HB.NUMEROPROCESSO,'
      '       HB.IDPESSJUR,'
      '       HB.IDTITULAR,'
      '       HB.IDPLANOORIGEM,'
      '       HB.IDPESSOA,'
      '       HB.SEQPROPOSTA,'
      '       HB.FLGINDOCORRENCIA,'
      '       HB.DTINICIO,'
      '       HB.DTFIM,'
      '       HB.OBSERVACAO,'
      '       HB.TRGUSERINCLUSAO,'
      '       HB.TRGDTINCLUSAO,'
      '       HB.TRGUSERALTERACAO,'
      '       HB.TRGDTALTERACAO,'
      
        '       DECODE(HB.FLGINDOCORRENCIA,1,'#39'Lançamento único'#39','#39'Periódic' +
        'o'#39') AS DESCOCORRENCIA,'
      '       SUBSTR(HB.OBSERVACAO,1,100) as OBS_GRID'
      '  FROM CM.HISTISENCAOIRRFBENF HB'
      ' WHERE  HB.IDPESSJUR = :IDPESSJUR'
      '   AND HB.IDTITULAR = :IDTITULAR'
      '   AND HB.IDPESSOA = :IDPESSOA')
    ValidateWithMask = True
    Left = 522
    Top = 443
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsPessoaFisica: TwwDataSource
    DataSet = qryPessoaFisica
    Left = 685
    Top = 197
  end
  object qryPessoaFisica: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT'
      
        '   VLRINSS, VLRPENSAO, IDCIDADES, PERCIRRFJUD, STATUSPROCJUD, DA' +
        'TACONCLIMINAR, DATACONCJULG,'
      
        '   VLRTOTCOMPIR, VLRPARCCOMPIR, INICIOCOMPIR, VLRENQUADRAMENTO, ' +
        'INICIOINVALIDEZ, FIMINVALIDEZ,'
      
        '   FLGDESTCC, IDSINDICATO, IDPESSOA, CODESTADO, IDPAIS, IDFONTRE' +
        'CR, IDGRINSTR, IDPROFISS, NOMEPAI,'
      
        '   NOMEMAE, DATAMORTE, DATANASC, SEXO, TIPOSANG, ESTCIVIL, NUMDE' +
        'PIRRF, NUMDEPSALF, NUMDEPTOT,'
      
        '   NVL(FLGISENTOIRRF,0) FLGISENTOIRRF, IDESTADO, CORPESSOA, FLGD' +
        'EFICIENTE, FLGMOLESTIAGRAVE, DATAMOLESTIAGRAVE,'
      
        '   FLGSOMAIRSUPINSS, DATAFIMMOLESTIA, DTCONTASALARIOPROCESSADA, ' +
        'DTSOLICITACONTASALARIO, FLGSOLICITACONTASALARIO, FLGCONTASALARIO' +
        'PROCESSADA, EMAILFUNCEF,'
      'TIPOISENCAOIRRF,         DECODE(TIPOISENCAOIRRF,'
      '              '#39'0'#39','
      '              '#39'Espécie de Benefício 92'#39','
      '              '#39'1'#39','
      '              '#39'Ação Judicial'#39','
      '              '#39'2'#39','
      '              '#39'Moléstia Grave'#39') AS TPISENCAOIRRF,'
      ' NOMECONJUGE'
      'FROM'
      '   PESSOAFISICA'
      'WHERE'
      '   ( PESSOAFISICA.IDPESSOA =:IdPessoa )'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updPessoaFisica
    ValidateWithMask = True
    Left = 637
    Top = 236
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryPessoaFisicaVLRINSS: TFloatField
      FieldName = 'VLRINSS'
      Origin = 'BASEDADOS.PESSOAFISICA.VLRINSS'
    end
    object qryPessoaFisicaVLRPENSAO: TFloatField
      FieldName = 'VLRPENSAO'
      Origin = 'BASEDADOS.PESSOAFISICA.VLRPENSAO'
    end
    object qryPessoaFisicaIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
      Origin = 'BASEDADOS.PESSOAFISICA.IDCIDADES'
    end
    object qryPessoaFisicaPERCIRRFJUD: TFloatField
      FieldName = 'PERCIRRFJUD'
      Origin = 'BASEDADOS.PESSOAFISICA.PERCIRRFJUD'
    end
    object qryPessoaFisicaSTATUSPROCJUD: TFloatField
      FieldName = 'STATUSPROCJUD'
      Origin = 'BASEDADOS.PESSOAFISICA.STATUSPROCJUD'
    end
    object qryPessoaFisicaDATACONCLIMINAR: TDateTimeField
      FieldName = 'DATACONCLIMINAR'
      Origin = 'BASEDADOS.PESSOAFISICA.DATACONCLIMINAR'
    end
    object qryPessoaFisicaDATACONCJULG: TDateTimeField
      FieldName = 'DATACONCJULG'
      Origin = 'BASEDADOS.PESSOAFISICA.DATACONCJULG'
    end
    object qryPessoaFisicaVLRTOTCOMPIR: TFloatField
      FieldName = 'VLRTOTCOMPIR'
      Origin = 'BASEDADOS.PESSOAFISICA.VLRTOTCOMPIR'
    end
    object qryPessoaFisicaVLRPARCCOMPIR: TFloatField
      FieldName = 'VLRPARCCOMPIR'
      Origin = 'BASEDADOS.PESSOAFISICA.VLRPARCCOMPIR'
    end
    object qryPessoaFisicaINICIOCOMPIR: TStringField
      FieldName = 'INICIOCOMPIR'
      Origin = 'BASEDADOS.PESSOAFISICA.INICIOCOMPIR'
      FixedChar = True
      Size = 7
    end
    object qryPessoaFisicaVLRENQUADRAMENTO: TFloatField
      FieldName = 'VLRENQUADRAMENTO'
      Origin = 'BASEDADOS.PESSOAFISICA.VLRENQUADRAMENTO'
    end
    object qryPessoaFisicaINICIOINVALIDEZ: TDateTimeField
      FieldName = 'INICIOINVALIDEZ'
      Origin = 'BASEDADOS.PESSOAFISICA.INICIOINVALIDEZ'
    end
    object qryPessoaFisicaFIMINVALIDEZ: TDateTimeField
      FieldName = 'FIMINVALIDEZ'
      Origin = 'BASEDADOS.PESSOAFISICA.FIMINVALIDEZ'
    end
    object qryPessoaFisicaFLGDESTCC: TFloatField
      FieldName = 'FLGDESTCC'
      Origin = 'BASEDADOS.PESSOAFISICA.FLGDESTCC'
    end
    object qryPessoaFisicaIDSINDICATO: TFloatField
      FieldName = 'IDSINDICATO'
      Origin = 'BASEDADOS.PESSOAFISICA.IDSINDICATO'
    end
    object qryPessoaFisicaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOAFISICA.IDPESSOA'
    end
    object qryPessoaFisicaCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Origin = 'BASEDADOS.PESSOAFISICA.CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryPessoaFisicaIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'BASEDADOS.PESSOAFISICA.IDPAIS'
    end
    object qryPessoaFisicaIDFONTRECR: TFloatField
      FieldName = 'IDFONTRECR'
      Origin = 'BASEDADOS.PESSOAFISICA.IDFONTRECR'
    end
    object qryPessoaFisicaIDGRINSTR: TFloatField
      FieldName = 'IDGRINSTR'
      Origin = 'BASEDADOS.PESSOAFISICA.IDGRINSTR'
    end
    object qryPessoaFisicaIDPROFISS: TFloatField
      FieldName = 'IDPROFISS'
      Origin = 'BASEDADOS.PESSOAFISICA.IDPROFISS'
    end
    object qryPessoaFisicaNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      Origin = 'BASEDADOS.PESSOAFISICA.NOMEPAI'
      Size = 50
    end
    object qryPessoaFisicaNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      Origin = 'BASEDADOS.PESSOAFISICA.NOMEMAE'
      Size = 50
    end
    object qryPessoaFisicaDATAMORTE: TDateTimeField
      FieldName = 'DATAMORTE'
      Origin = 'BASEDADOS.PESSOAFISICA.DATAMORTE'
    end
    object qryPessoaFisicaDATANASC: TDateTimeField
      FieldName = 'DATANASC'
      Origin = 'BASEDADOS.PESSOAFISICA.DATANASC'
    end
    object qryPessoaFisicaSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'BASEDADOS.PESSOAFISICA.SEXO'
      FixedChar = True
      Size = 1
    end
    object qryPessoaFisicaTIPOSANG: TStringField
      FieldName = 'TIPOSANG'
      Origin = 'BASEDADOS.PESSOAFISICA.TIPOSANG'
      Size = 3
    end
    object qryPessoaFisicaESTCIVIL: TStringField
      FieldName = 'ESTCIVIL'
      Origin = 'BASEDADOS.PESSOAFISICA.ESTCIVIL'
      FixedChar = True
      Size = 1
    end
    object qryPessoaFisicaNUMDEPIRRF: TFloatField
      FieldName = 'NUMDEPIRRF'
      Origin = 'BASEDADOS.PESSOAFISICA.NUMDEPIRRF'
    end
    object qryPessoaFisicaNUMDEPSALF: TFloatField
      FieldName = 'NUMDEPSALF'
      Origin = 'BASEDADOS.PESSOAFISICA.NUMDEPSALF'
    end
    object qryPessoaFisicaNUMDEPTOT: TFloatField
      FieldName = 'NUMDEPTOT'
      Origin = 'BASEDADOS.PESSOAFISICA.NUMDEPTOT'
    end
    object qryPessoaFisicaFLGISENTOIRRF: TFloatField
      FieldName = 'FLGISENTOIRRF'
      Origin = 'BASEDADOS.PESSOAFISICA.FLGISENTOIRRF'
    end
    object qryPessoaFisicaIDESTADO: TFloatField
      FieldName = 'IDESTADO'
      Origin = 'BASEDADOS.PESSOAFISICA.IDESTADO'
    end
    object qryPessoaFisicaCORPESSOA: TFloatField
      FieldName = 'CORPESSOA'
      Origin = 'BASEDADOS.PESSOAFISICA.CORPESSOA'
    end
    object qryPessoaFisicaFLGDEFICIENTE: TFloatField
      FieldName = 'FLGDEFICIENTE'
      Origin = 'BASEDADOS.PESSOAFISICA.FLGDEFICIENTE'
    end
    object qryPessoaFisicaFLGMOLESTIAGRAVE: TFloatField
      FieldName = 'FLGMOLESTIAGRAVE'
      Origin = 'BASEDADOS.PESSOAFISICA.FLGMOLESTIAGRAVE'
    end
    object qryPessoaFisicaDATAMOLESTIAGRAVE: TDateTimeField
      FieldName = 'DATAMOLESTIAGRAVE'
      Origin = 'BASEDADOS.PESSOAFISICA.DATAMOLESTIAGRAVE'
    end
    object qryPessoaFisicaFLGSOMAIRSUPINSS: TFloatField
      FieldName = 'FLGSOMAIRSUPINSS'
      Origin = 'BASEDADOS.PESSOAFISICA.FLGSOMAIRSUPINSS'
    end
    object qryPessoaFisicaDATAFIMMOLESTIA: TDateTimeField
      FieldName = 'DATAFIMMOLESTIA'
      Origin = 'BASEDADOS.PESSOAFISICA.DATAFIMMOLESTIA'
    end
    object qryPessoaFisicaFLGSOLICITACONTASALARIO: TFloatField
      FieldName = 'FLGSOLICITACONTASALARIO'
      Origin = 'BASEDADOS.PESSOAFISICA.FLGSOLICITACONTASALARIO'
    end
    object qryPessoaFisicaFLGCONTASALARIOPROCESSADA: TFloatField
      FieldName = 'FLGCONTASALARIOPROCESSADA'
      Origin = 'BASEDADOS.PESSOAFISICA.FLGCONTASALARIOPROCESSADA'
    end
    object dtmfldPessoaFisicaDTSOLICITACONTASALARIO: TDateTimeField
      FieldName = 'DTSOLICITACONTASALARIO'
      Origin = 'BASEDADOS.PESSOAFISICA.DTSOLICITACONTASALARIO'
    end
    object dtmfldPessoaFisicaDTCONTASALARIOPROCESSADA: TDateTimeField
      FieldName = 'DTCONTASALARIOPROCESSADA'
      Origin = 'BASEDADOS.PESSOAFISICA.DTCONTASALARIOPROCESSADA'
    end
    object qryPessoaFisicaEMAILFUNCEF: TStringField
      FieldName = 'EMAILFUNCEF'
      Origin = 'BASEDADOS.PESSOAFISICA.EMAILFUNCEF'
      Size = 100
    end
    object qryPessoaFisicaTIPOISENCAOIRRF: TFloatField
      FieldName = 'TIPOISENCAOIRRF'
      Origin = 'BASEDADOS.PESSOAFISICA.TIPOISENCAOIRRF'
    end
    object qryPessoaFisicaTPISENCAOIRRF: TStringField
      FieldName = 'TPISENCAOIRRF'
      Size = 23
    end
    object qryPessoaFisicaNOMECONJUGE: TStringField
      FieldName = 'NOMECONJUGE'
      Size = 60
    end
  end
  object updPessoaFisica: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOAFISICA'
      'set'
      '  IDSINDICATO = :IDSINDICATO,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODESTADO = :CODESTADO,'
      '  IDPAIS = :IDPAIS,'
      '  IDFONTRECR = :IDFONTRECR,'
      '  IDGRINSTR = :IDGRINSTR,'
      '  IDPROFISS = :IDPROFISS,'
      '  NOMEPAI = :NOMEPAI,'
      '  NOMEMAE = :NOMEMAE,'
      '  DATAMORTE = :DATAMORTE,'
      '  DATANASC = :DATANASC,'
      '  SEXO = :SEXO,'
      '  TIPOSANG = :TIPOSANG,'
      '  ESTCIVIL = :ESTCIVIL,'
      '  NUMDEPIRRF = :NUMDEPIRRF,'
      '  NUMDEPSALF = :NUMDEPSALF,'
      '  NUMDEPTOT = :NUMDEPTOT,'
      '  FLGISENTOIRRF = :FLGISENTOIRRF,'
      '  IDESTADO = :IDESTADO,'
      '  CORPESSOA = :CORPESSOA,'
      '  FLGDEFICIENTE = :FLGDEFICIENTE,'
      '  FLGMOLESTIAGRAVE = :FLGMOLESTIAGRAVE,'
      '  DATAMOLESTIAGRAVE = :DATAMOLESTIAGRAVE,'
      '  FLGSOMAIRSUPINSS = :FLGSOMAIRSUPINSS,'
      '  FLGDESTCC = :FLGDESTCC,'
      '  IDCIDADES = :IDCIDADES,'
      '  PERCIRRFJUD = :PERCIRRFJUD,'
      '  STATUSPROCJUD = :STATUSPROCJUD,'
      '  DATACONCLIMINAR = :DATACONCLIMINAR,'
      '  DATACONCJULG = :DATACONCJULG,'
      '  VLRTOTCOMPIR = :VLRTOTCOMPIR,'
      '  VLRPARCCOMPIR = :VLRPARCCOMPIR,'
      '  INICIOCOMPIR = :INICIOCOMPIR,'
      '  VLRENQUADRAMENTO = :VLRENQUADRAMENTO,'
      '  INICIOINVALIDEZ = :INICIOINVALIDEZ,'
      '  FIMINVALIDEZ = :FIMINVALIDEZ,'
      '  VLRINSS = :VLRINSS,'
      '  VLRPENSAO = :VLRPENSAO,'
      '  DATAFIMMOLESTIA = :DATAFIMMOLESTIA,  '
      '  FLGCONTASALARIOPROCESSADA = :FLGCONTASALARIOPROCESSADA,'
      '  FLGSOLICITACONTASALARIO = :FLGSOLICITACONTASALARIO,'
      '  DTCONTASALARIOPROCESSADA = :DTCONTASALARIOPROCESSADA,'
      '  DTSOLICITACONTASALARIO = :DTSOLICITACONTASALARIO,'
      '  TIPOISENCAOIRRF = :TIPOISENCAOIRRF,'
      '  EMAILFUNCEF = :EMAILFUNCEF,'
      '  NOMECONJUGE = :NOMECONJUGE'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA'
      ' '
      ' '
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into PESSOAFISICA'
      
        '  (IDSINDICATO, EMAILFUNCEF, IDPESSOA, CODESTADO, IDPAIS, IDFONT' +
        'RECR, IDGRINSTR,'
      'IDPROFISS, '
      
        '   NOMEPAI, NOMEMAE, DATAMORTE, DATANASC, SEXO, TIPOSANG, ESTCIV' +
        'IL, '
      'NUMDEPIRRF,'
      '   NUMDEPSALF, NUMDEPTOT, FLGISENTOIRRF, IDESTADO, CORPESSOA,'
      'FLGDEFICIENTE, '
      '   FLGMOLESTIAGRAVE, DATAMOLESTIAGRAVE, FLGSOMAIRSUPINSS, '
      'FLGDESTCC, IDCIDADES, '
      '   PERCIRRFJUD, STATUSPROCJUD, DATACONCLIMINAR, DATACONCJULG, '
      'VLRTOTCOMPIR, '
      
        '   VLRPARCCOMPIR, INICIOCOMPIR, VLRENQUADRAMENTO, INICIOINVALIDE' +
        'Z, '
      'FIMINVALIDEZ, '
      '   VLRINSS, VLRPENSAO, DATAFIMMOLESTIA,'
      
        '  DTCONTASALARIOPROCESSADA,FLGSOLICITACONTASALARIO,FLGCONTASALAR' +
        'IOPROCESSADA,'
      '  DTSOLICITACONTASALARIO,TIPOISENCAOIRRF,NOMECONJUGE)'
      'values'
      
        '  (:IDSINDICATO, :EMAILFUNCEF, :IDPESSOA, :CODESTADO, :IDPAIS, :' +
        'IDFONTRECR, '
      ':IDGRINSTR, '
      
        '   :IDPROFISS, :NOMEPAI, :NOMEMAE, :DATAMORTE, :DATANASC, :SEXO,' +
        ' '
      ':TIPOSANG,'
      
        '   :ESTCIVIL, :NUMDEPIRRF, :NUMDEPSALF, :NUMDEPTOT, :FLGISENTOIR' +
        'RF, '
      ':IDESTADO, '
      '   :CORPESSOA, :FLGDEFICIENTE, :FLGMOLESTIAGRAVE, '
      ':DATAMOLESTIAGRAVE, :FLGSOMAIRSUPINSS, '
      '   :FLGDESTCC, :IDCIDADES, :PERCIRRFJUD, :STATUSPROCJUD, '
      ':DATACONCLIMINAR, '
      '   :DATACONCJULG, :VLRTOTCOMPIR, :VLRPARCCOMPIR, :INICIOCOMPIR, '
      ':VLRENQUADRAMENTO, '
      '   :INICIOINVALIDEZ, :FIMINVALIDEZ, :VLRINSS, :VLRPENSAO, '
      ':DATAFIMMOLESTIA,'
      
        ':DTCONTASALARIOPROCESSADA,:FLGSOLICITACONTASALARIO,:FLGCONTASALA' +
        'RIOPROCESSADA,'
      '  :DTSOLICITACONTASALARIO,:TIPOISENCAOIRRF,:NOMECONJUGE)'
      ''
      ' '
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from PESSOAFISICA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 635
    Top = 204
  end
  object queryMolestiaGrave: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DTINICIO, DTFINAL'
      '  FROM HSTMOLESTIAGRAVE'
      ' WHERE IDPESSOA = :IdPessoa'
      'ORDER BY DTINICIO DESC'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 682
    Top = 236
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
  end
end
