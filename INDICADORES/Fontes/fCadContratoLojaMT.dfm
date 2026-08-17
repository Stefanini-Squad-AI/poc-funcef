inherited frmCadContratoLojaMT: TfrmCadContratoLojaMT
  Left = 70
  Top = 67
  HelpContext = 4390012
  Caption = 'Cadastro de Contratos de Lojas'
  ClientHeight = 440
  ClientWidth = 676
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 676
    Height = 354
    inherited pnlMestre: TPanel
      Width = 674
      Height = 121
      object Label1: TLabel
        Left = 16
        Top = 2
        Width = 70
        Height = 13
        Caption = 'Nr. Contrato'
      end
      object Label2: TLabel
        Left = 128
        Top = 2
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label6: TLabel
        Left = 16
        Top = 80
        Width = 99
        Height = 13
        Caption = 'Marca / Franquia'
      end
      object Label7: TLabel
        Left = 336
        Top = 80
        Width = 54
        Height = 13
        Caption = 'Atividade'
      end
      object rbTipoContrato: TDBRadioGroup
        Left = 336
        Top = 44
        Width = 305
        Height = 33
        Caption = 'Tipo de Contrato'
        Columns = 3
        DataField = 'TIPOCONTRATO'
        DataSource = ds
        Items.Strings = (
          'Ancora'
          'Satélite'
          'Quiosque')
        TabOrder = 3
        Values.Strings = (
          'A'
          'S'
          'Q')
        OnChange = rbTipoContratoChange
      end
      object edNumContrato: TwwDBEdit
        Left = 16
        Top = 16
        Width = 105
        Height = 21
        DataField = 'NUMCONTRATO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edNomContrato: TwwDBEdit
        Left = 128
        Top = 16
        Width = 513
        Height = 21
        DataField = 'NOMCONTRATO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      inline molImovel1: TmolImovel
        Left = 8
        Top = 38
        Width = 321
        TabOrder = 2
        inherited edtImovel: TEdit
          Width = 281
        end
        inherited btnBuscaImovel: TBitBtn
          Left = 288
        end
        inherited btnLimpaImovel: TBitBtn
          Left = 232
          Enabled = False
          Visible = False
        end
      end
      object DBcboMarca: TwwDBLookupCombo
        Left = 16
        Top = 94
        Width = 305
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MRCNOME'#9'40'#9'Descrição'#9'F')
        DataField = 'IDMARCA'
        DataSource = ds
        LookupTable = cdsMarcas
        LookupField = 'IDMARCA'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object DBcboAtividade: TwwDBLookupCombo
        Left = 336
        Top = 94
        Width = 305
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'ATVDESCRICAO'#9'60'#9'Descrição'#9'F')
        DataField = 'IDATIVIDADE'
        DataSource = ds
        LookupTable = cdsAtividade
        LookupField = 'IDATIVIDADE'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 122
      Width = 674
      Height = 231
      Tabs.Strings = (
        'Lojas'
        'Aluguel'
        'Datas'
        'Observações'
        'Eventos')
      detdbGrids.Strings = (
        'dbgrdDet'
        ''
        ''
        ''
        'dbgrdEvento')
      inherited Dock974: TDock97 [0]
        Left = 580
        Height = 172
      end
      inherited Dock973: TDock97
        Width = 666
      end
      inherited pgctrlDetalhe: TPageControl [2]
        Width = 576
        Height = 172
        ActivePage = tbsEventos
        inherited tbsDet: TTabSheet
          Caption = 'Lojas'
          inherited pnlControlesDet: TPanel
            Width = 568
            Height = 144
            inline molLoja1: TmolLoja
              Left = 88
              Top = 40
              inherited btnBuscaLoja: TBitBtn
                OnClick = molLoja1btnBuscaLojaClick
              end
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 568
            Height = 144
            Selected.Strings = (
              'PISO'#9'15'#9'Piso'
              'NUMLOJA'#9'15'#9'Nr. da Loja'
              'QTDEABL'#9'15'#9'ABL'#9'F')
          end
        end
        object tbsAluguel: TTabSheet
          Caption = 'Aluguel'
          ImageIndex = 1
          object Label8: TLabel
            Left = 24
            Top = 52
            Width = 88
            Height = 13
            Caption = 'Aluguel Mínimo'
          end
          object Label9: TLabel
            Left = 160
            Top = 52
            Width = 93
            Height = 13
            Caption = 'Aluguel Variável'
          end
          object Label10: TLabel
            Left = 24
            Top = 8
            Width = 146
            Height = 13
            Caption = 'Nome Genérico das Lojas'
          end
          object Label3: TLabel
            Left = 241
            Top = 71
            Width = 10
            Height = 13
            Caption = '%'
          end
          object sbNomeLoja: TSpeedButton
            Left = 237
            Top = 24
            Width = 23
            Height = 22
            Hint = 'Compõe nome genérico das lojas'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
              000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
              00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
              F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
              0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
              FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
              FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
              0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
              00333377737FFFFF773333303300000003333337337777777333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbNomeLojaClick
          end
          object Label11: TLabel
            Left = 296
            Top = 8
            Width = 75
            Height = 13
            Caption = 'Total de ABL'
          end
          object grpReajuste: TGroupBox
            Left = 24
            Top = 100
            Width = 537
            Height = 61
            Caption = ' Reajuste '
            TabOrder = 3
            TabStop = True
            object Label14: TLabel
              Left = 272
              Top = 16
              Width = 36
              Height = 13
              Caption = 'Índice'
            end
            object Label15: TLabel
              Left = 424
              Top = 16
              Width = 78
              Height = 13
              Caption = 'Periodicidade'
            end
            object Label34: TLabel
              Left = 478
              Top = 34
              Width = 37
              Height = 13
              Caption = 'Meses'
            end
            object Label12: TLabel
              Left = 136
              Top = 16
              Width = 94
              Height = 13
              Caption = 'Data do Próximo'
            end
            object Label50: TLabel
              Left = 16
              Top = 16
              Width = 60
              Height = 13
              Caption = 'Data-Base'
            end
            object DBedtProxReajuste: TCMDateTimePicker
              Left = 136
              Top = 30
              Width = 97
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATPROXREAJUSTE'
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
              TabOrder = 1
            end
            object DBcboIndiceReajuste: TwwDBLookupCombo
              Left = 272
              Top = 30
              Width = 113
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOESIGLA'#9'6'#9'Sigla'#9'F')
              DataField = 'INDICEREAJUSTE'
              DataSource = ds
              LookupTable = cdsMoeda
              LookupField = 'MOECODIGO'
              Style = csDropDownList
              DropDownCount = 4
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object DBspnPeriodicidadeReajuste: TwwDBSpinEdit
              Left = 424
              Top = 30
              Width = 49
              Height = 21
              Increment = 1
              DataField = 'PERREAJUSTE'
              DataSource = ds
              TabOrder = 3
              UnboundDataType = wwDefault
            end
            object DBedtUltReajuste: TCMDateTimePicker
              Left = 16
              Top = 30
              Width = 97
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATREAJUSTE'
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
              TabOrder = 0
            end
          end
          object dbedtNomeLoja: TwwDBEdit
            Left = 24
            Top = 24
            Width = 208
            Height = 21
            DataField = 'LOJAS'
            DataSource = ds
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBRealEdit1: TDBRealEdit
            Left = 24
            Top = 68
            Width = 105
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '  3.034,73')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRALUGMIN'
            DataSource = ds
          end
          object DBRealEdit2: TDBRealEdit
            Left = 160
            Top = 68
            Width = 73
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      5,00')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'PERALUGVARIAVEL'
            DataSource = ds
          end
          object dbedtAbl: TDBRealEdit
            Left = 296
            Top = 24
            Width = 105
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '    100,00')
            TabOrder = 4
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'QTDEABL'
            DataSource = ds
          end
        end
        object tbsDatas: TTabSheet
          Caption = 'Datas'
          ImageIndex = 4
          object GroupBox1: TGroupBox
            Left = 19
            Top = 12
            Width = 270
            Height = 64
            Caption = 'Período do Contrato'
            TabOrder = 0
            object Label4: TLabel
              Left = 10
              Top = 16
              Width = 34
              Height = 13
              Caption = 'Início'
            end
            object Label5: TLabel
              Left = 138
              Top = 16
              Width = 46
              Height = 13
              Caption = 'Término'
            end
            object cmdtIni: TCMDateTimePicker
              Left = 10
              Top = 30
              Width = 113
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATINICIO'
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
              TabOrder = 0
            end
            object cmdtFim: TCMDateTimePicker
              Left = 138
              Top = 30
              Width = 113
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATTERMINO'
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
              TabOrder = 1
            end
          end
          object GroupBox2: TGroupBox
            Left = 331
            Top = 12
            Width = 166
            Height = 64
            Caption = 'Ultima Auditoria'
            TabOrder = 1
            object cmdtAudit: TCMDateTimePicker
              Left = 26
              Top = 30
              Width = 113
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATULTAUDITORIA'
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
              TabOrder = 0
            end
          end
          object dbcbIndeterminado: TDBCheckBox
            Left = 24
            Top = 88
            Width = 217
            Height = 17
            Caption = 'Término Indeterminado'
            DataField = 'FLGINDETERMINADO'
            DataSource = ds
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnClick = dbcbIndeterminadoClick
          end
        end
        object tbsObs: TTabSheet
          Caption = 'Observações'
          ImageIndex = 2
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 568
            Height = 144
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object pnlSituacao: TPanel
              Left = 1
              Top = 106
              Width = 566
              Height = 37
              Align = alBottom
              TabOrder = 0
              object Label13: TLabel
                Left = 12
                Top = 18
                Width = 113
                Height = 13
                Caption = 'Situação Contratual'
              end
              object wwDBLookupCombo1: TwwDBLookupCombo
                Left = 138
                Top = 10
                Width = 305
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'60'#9'Descrição'#9'T')
                DataField = 'IDSITCONTIMOB'
                DataSource = ds
                LookupTable = cdsSitContImob
                LookupField = 'IDSITCONTIMOB'
                Style = csDropDownList
                DropDownWidth = 8
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
            end
            object DBmemObservacao: TwwDBRichEdit
              Left = 1
              Top = 1
              Width = 566
              Height = 105
              ScrollBars = ssVertical
              Align = alClient
              AutoURLDetect = True
              DataField = 'DESCRICAO'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 1750
              ParentFont = False
              PrintJobName = 'Delphi 5'
              TabOrder = 1
              PopupOptions = [rpoPopupEdit, rpoPopupCut, rpoPopupCopy, rpoPopupPaste, rpoPopupFont]
              EditorCaption = 'Descrição do Imóvel'
              EditorPosition.Left = 0
              EditorPosition.Top = 0
              EditorPosition.Width = 0
              EditorPosition.Height = 0
              MeasurementUnits = muCentimeters
              PrintMargins.Top = 1
              PrintMargins.Bottom = 1
              PrintMargins.Left = 1
              PrintMargins.Right = 1
              RichEditVersion = 2
              Data = {
                730000007B5C727466315C616E73695C616E7369637067313235325C64656666
                305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
                4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
                5C706172645C66305C667331345C7061720D0A7D0D0A00}
            end
          end
        end
        object tbsEventos: TTabSheet
          Caption = 'Eventos'
          ImageIndex = 3
          object Panel5: TPanel
            Left = 0
            Top = 78
            Width = 568
            Height = 66
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 3
            TabOrder = 0
            object gbEvento: TGroupBox
              Left = 3
              Top = 3
              Width = 562
              Height = 60
              Align = alClient
              Caption = 'Descrição do Evento'
              Enabled = False
              TabOrder = 0
              object Panel7: TPanel
                Left = 2
                Top = 15
                Width = 558
                Height = 43
                Align = alClient
                BevelOuter = bvNone
                BorderWidth = 4
                TabOrder = 0
                object DBmemDescricao: TwwDBRichEdit
                  Left = 4
                  Top = 4
                  Width = 550
                  Height = 35
                  TabStop = False
                  Align = alClient
                  AutoURLDetect = True
                  DataField = 'EVIDESCRICAO'
                  DataSource = dsEventos
                  MaxLength = 1750
                  PrintJobName = 'Delphi 5'
                  TabOrder = 0
                  PopupOptions = [rpoPopupEdit, rpoPopupCut, rpoPopupCopy, rpoPopupPaste, rpoPopupFont]
                  EditorOptions = [reoShowLoad, reoShowSaveExit, reoShowPrint, reoShowPageSetup, reoShowFormatBar, reoShowToolBar, reoShowStatusBar, reoShowHints, reoCloseOnEscape]
                  EditorCaption = 'Descrição'
                  EditorPosition.Left = 0
                  EditorPosition.Top = 0
                  EditorPosition.Width = 0
                  EditorPosition.Height = 0
                  MeasurementUnits = muCentimeters
                  PrintMargins.Top = 1
                  PrintMargins.Bottom = 1
                  PrintMargins.Left = 1
                  PrintMargins.Right = 1
                  RichEditVersion = 2
                  Data = {
                    840000007B5C727466315C616E73695C616E7369637067313235325C64656666
                    305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
                    4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
                    5C706172645C625C66305C667331342044426D656D44657363726963616F5C70
                    61720D0A7D0D0A00}
                end
              end
            end
          end
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 568
            Height = 78
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Panel10: TPanel
              Left = 0
              Top = 0
              Width = 568
              Height = 78
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object Label16: TLabel
                Left = 18
                Top = 3
                Width = 90
                Height = 13
                Caption = 'Data do Evento'
              end
              object Label17: TLabel
                Left = 152
                Top = 3
                Width = 61
                Height = 13
                Caption = 'Cabeçalho'
              end
              object Label18: TLabel
                Left = 18
                Top = 41
                Width = 78
                Height = 13
                Caption = 'Valor Anterior'
              end
              object Label23: TLabel
                Left = 152
                Top = 41
                Width = 63
                Height = 13
                Caption = 'Valor Atual'
              end
              object Label32: TLabel
                Left = 296
                Top = 41
                Width = 62
                Height = 13
                Caption = 'Percentual'
              end
              object Label36: TLabel
                Left = 391
                Top = 41
                Width = 89
                Height = 13
                Caption = 'Próximo Evento'
              end
              object DBedtDataEvento: TCMDateTimePicker
                Left = 18
                Top = 17
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'EVIDATA'
                DataSource = dsEventos
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
              object DBedtCabEvento: TDBEdit
                Left = 152
                Top = 17
                Width = 401
                Height = 21
                DataField = 'EVICABECALHO'
                DataSource = dsEventos
                TabOrder = 1
              end
              object DBedtVlrAnterior: TDBEdit
                Left = 18
                Top = 56
                Width = 121
                Height = 21
                DataField = 'EVIVLRANTERIOR'
                DataSource = dsEventos
                TabOrder = 2
              end
              object DBedtVlrAjustado: TDBEdit
                Left = 152
                Top = 56
                Width = 121
                Height = 21
                DataField = 'EVIVLRAJUSTADO'
                DataSource = dsEventos
                TabOrder = 3
              end
              object DBedtPercent: TDBEdit
                Left = 296
                Top = 56
                Width = 73
                Height = 21
                DataField = 'EVIPERCENT'
                DataSource = dsEventos
                TabOrder = 4
              end
              object CMDateTimePicker1: TCMDateTimePicker
                Left = 391
                Top = 56
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'EVIDATAPROX'
                DataSource = dsEventos
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
              end
            end
            object dbgrdEvento: TwwDBGrid2
              Left = 0
              Top = 0
              Width = 568
              Height = 78
              Selected.Strings = (
                'EVIDATA'#9'10'#9'Data'#9'T'
                'EVICABECALHO'#9'31'#9'Histórico'#9'T'
                'EVIVLRANTERIOR'#9'12'#9'Valor Anterior'#9'T'
                'EVIVLRAJUSTADO'#9'12'#9'Valor Corrigido'#9'T'
                'EVIPERCENT'#9'7'#9'Reajuste'#9'T'
                'EVIDATAPROX'#9'10'#9'Próximo'#9'T')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsEventos
              KeyOptions = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
              TabOrder = 1
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = True
              UseTFields = False
              OnTitleButtonClick = DBgrdEventoTitleButtonClick
              IndicatorColor = icBlack
            end
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 676
    object lblVigencia: TLabel [0]
      Left = 462
      Top = 9
      Width = 198
      Height = 24
      Alignment = taRightJustify
      Caption = 'Vigente / Encerrado'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
  end
  inherited Dock971: TDock97
    Top = 401
    Width = 676
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 290
    Top = 65535
    TargetsData = (
      1
      3
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 438
  end
  inherited ImlPadrao: TImageList
    Left = 248
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 480
  end
  inherited Cds: TCMClientDataSet
    Left = 396
    object CdsIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
    end
    object CdsIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object CdsNUMCONTRATO: TStringField
      FieldName = 'NUMCONTRATO'
    end
    object CdsNOMCONTRATO: TStringField
      FieldName = 'NOMCONTRATO'
      Size = 60
    end
    object CdsTIPOCONTRATO: TStringField
      FieldName = 'TIPOCONTRATO'
      FixedChar = True
      Size = 1
    end
    object CdsLOJAS: TStringField
      FieldName = 'LOJAS'
    end
    object CdsVLRALUGMIN: TFloatField
      FieldName = 'VLRALUGMIN'
    end
    object CdsDATINICIO: TDateTimeField
      FieldName = 'DATINICIO'
    end
    object CdsDATTERMINO: TDateTimeField
      FieldName = 'DATTERMINO'
    end
    object CdsPERALUGVARIAVEL: TFloatField
      FieldName = 'PERALUGVARIAVEL'
    end
    object CdsDATULTAUDITORIA: TDateTimeField
      FieldName = 'DATULTAUDITORIA'
    end
    object CdsIDATIVIDADE: TFloatField
      FieldName = 'IDATIVIDADE'
    end
    object CdsIDMARCA: TFloatField
      FieldName = 'IDMARCA'
    end
    object CdsNOME_EXTENSO: TStringField
      FieldName = 'NOME_EXTENSO'
      Size = 123
    end
    object CdsINDICEREAJUSTE: TFloatField
      FieldName = 'INDICEREAJUSTE'
    end
    object CdsDATREAJUSTE: TDateTimeField
      FieldName = 'DATREAJUSTE'
    end
    object CdsDATPROXREAJUSTE: TDateTimeField
      FieldName = 'DATPROXREAJUSTE'
    end
    object CdsPERREAJUSTE: TFloatField
      FieldName = 'PERREAJUSTE'
    end
    object CdsDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object CdsQTDEABL: TFloatField
      FieldName = 'QTDEABL'
    end
    object CdsFLGINDETERMINADO: TStringField
      FieldName = 'FLGINDETERMINADO'
      FixedChar = True
      Size = 1
    end
    object CdsFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      FixedChar = True
      Size = 1
    end
    object CdsIDSITCONTIMOB: TFloatField
      FieldName = 'IDSITCONTIMOB'
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'CL.NUMCONTRATO'
      'CL.NOMCONTRATO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Mestre'
      'Nome do Imóvel'
      'Nr. do Contrato'
      'Nome do Contrato')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INDCONTRATOLOJA CL'
      'IMOVEL I'
      'IMOVEL IM')
    CamposChave.Strings = (
      'CL.IDCONTRATO')
    Filtro.Strings = (
      'CL.IDIMOVEL = I.IDIMOVEL'
      'IM.IDIMOVEL = I.IDIMOVELMESTRE'
      'CL.TIPOCONTRATO IN('#39'A'#39','#39'S'#39','#39'Q'#39')')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '20'
      '60')
    Left = 344
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 580
    Top = 303
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 581
    Top = 359
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Constraints = True
    Left = 568
    Top = 7
  end
  object Query1: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '/*'
      ' SELECT C.IDCONTRATO,      C.IDIMOVEL,       C.NUMCONTRATO,'
      '       C.NOMCONTRATO,     C.TIPOCONTRATO,   C.LOJAS,'
      
        '       C.VLRALUGMIN,      C.DATINICIO,      C.DATTERMINO, C.FLGS' +
        'TATUS,'
      '       C.PERALUGVARIAVEL, C.INDICEREAJUSTE, C.DATULTAUDITORIA,'
      
        '       C.IDATIVIDADE,     C.IDMARCA,        C.DATREAJUSTE,      ' +
        'C.FLGINDETERMINADO,'
      
        '       C.DATPROXREAJUSTE, C.PERREAJUSTE,    C.DESCRICAO,        ' +
        'C.QTDEABL,'
      
        '       IM.IMONOME || '#39' - '#39' || I.IMONOME AS NOME_EXTENSO, C.IDSIT' +
        'CONTIMOB'
      '  FROM INDCONTRATOLOJA C,'
      '       IMOVEL I,'
      '       IMOVEL IM'
      ' WHERE I.IDIMOVELMESTRE = IM.IDIMOVEL'
      '   AND C.IDIMOVEL = I.IDIMOVEL'
      '*/'
      ''
      ''
      '/* SELECT CL.IDCONTRATO, CL.IDLOJA, L.QTDEABL,'
      '       L.PISO, L.NUMLOJA, L.IDIMOVEL'
      '  FROM INDCONTRATOXLOJA CL,'
      '       INDLOJA L'
      ' WHERE CL.IDLOJA = L.IDLOJA   */'
      ''
      '/* select * from marcas */'
      ''
      ''
      '/* select * from moeda */'
      ''
      'SELECT E.*, M.MOESIGLA AS DSC_INDICE'
      '  FROM EVENTOIMOVEL E,'
      '       MOEDA M'
      ' WHERE E.EVIINDICEREAJUSTE = M.MOECODIGO'
      ''
      ''
      '/* SELECT * FROM SITCONTIMOB   */'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 568
    Top = 23
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 580
    Top = 375
    object cdsDetPISO: TStringField
      DisplayLabel = 'Piso'
      DisplayWidth = 15
      FieldName = 'PISO'
      FixedChar = True
      Size = 5
    end
    object cdsDetNUMLOJA: TStringField
      DisplayLabel = 'Nr. da Loja'
      DisplayWidth = 15
      FieldName = 'NUMLOJA'
      FixedChar = True
      Size = 5
    end
    object cdsDetQTDEABL: TFloatField
      DisplayLabel = 'ABL'
      DisplayWidth = 15
      FieldName = 'QTDEABL'
      DisplayFormat = '##,##0.00'
    end
    object cdsDetIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object cdsDetIDCONTRATO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATO'
      Visible = False
    end
    object cdsDetIDLOJA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDLOJA'
      Visible = False
    end
  end
  object cdsMarcas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 590
    Top = 87
    object cdsMarcasMRCNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'MRCNOME'
      Size = 40
    end
    object cdsMarcasIDMARCA: TFloatField
      FieldName = 'IDMARCA'
      Visible = False
    end
  end
  object cdsAtividade: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 590
    Top = 100
    object cdsAtividadeATVDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'ATVDESCRICAO'
      Size = 60
    end
    object cdsAtividadeIDATIVIDADE: TFloatField
      FieldName = 'IDATIVIDADE'
      Visible = False
    end
  end
  object cdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 590
    Top = 113
    object cdsMoedaMOESIGLA: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 6
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object cdsMoedaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object cdsMoedaMOEDESC: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'MOEDESC'
      Visible = False
    end
    object cdsMoedaMOEPERIODICIDADE: TStringField
      FieldName = 'MOEPERIODICIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsMoedaFLGPERCVALOR: TStringField
      FieldName = 'FLGPERCVALOR'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object cdsEventos: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDEVENTOIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'EVIDATA'
        DataType = ftDateTime
      end
      item
        Name = 'EVICABECALHO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'EVIDESCRICAO'
        DataType = ftMemo
        Size = 2000
      end
      item
        Name = 'IDUSUARIO'
        DataType = ftFloat
      end
      item
        Name = 'IDCONTRATOIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'FLGTIPOEVENTO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'EVIVLRANTERIOR'
        DataType = ftFloat
      end
      item
        Name = 'EVIVLRAJUSTADO'
        DataType = ftFloat
      end
      item
        Name = 'EVIDATAPROX'
        DataType = ftDateTime
      end
      item
        Name = 'EVIPERCENT'
        DataType = ftFloat
      end
      item
        Name = 'EVIINDICEREAJUSTE'
        DataType = ftFloat
      end
      item
        Name = 'IDHISTCARTINV'
        DataType = ftFloat
      end
      item
        Name = 'IDCONTRATOLOJA'
        DataType = ftFloat
      end
      item
        Name = 'DSC_INDICE'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'idxEviData'
        Fields = 'EVIDATA'
      end
      item
        Name = 'idxEviCabecalho'
        Fields = 'EVICABECALHO'
      end
      item
        Name = 'idxEviVlrAnterior'
        Fields = 'EVIVLRANTERIOR'
      end
      item
        Name = 'idxEviVlrAjustado'
        Fields = 'EVIVLRAJUSTADO'
      end
      item
        Name = 'idxEviVlrPercent'
        Fields = 'EVIVLRPERCENT'
      end
      item
        Name = 'idxDscIndice'
        Fields = 'DSC_INDICE'
      end
      item
        Name = 'idxEviDataProx'
        Fields = 'EVIDATAPROX'
      end>
    Params = <>
    StoreDefs = True
    Left = 590
    Top = 148
    object cdsEventosEVIDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'EVIDATA'
    end
    object cdsEventosEVICABECALHO: TStringField
      DisplayLabel = 'Evento'
      DisplayWidth = 40
      FieldName = 'EVICABECALHO'
      Size = 60
    end
    object cdsEventosEVIVLRANTERIOR: TFloatField
      DisplayLabel = ' Valor Anterior'
      DisplayWidth = 13
      FieldName = 'EVIVLRANTERIOR'
      DisplayFormat = '###,##0.00'
    end
    object cdsEventosEVIVLRAJUSTADO: TFloatField
      DisplayLabel = ' Valor Corrigido'
      DisplayWidth = 13
      FieldName = 'EVIVLRAJUSTADO'
      DisplayFormat = '###,##0.00'
    end
    object cdsEventosEVIPERCENT: TFloatField
      DisplayLabel = ' Reajuste'
      DisplayWidth = 8
      FieldName = 'EVIPERCENT'
      DisplayFormat = '##0.0000%'
    end
    object cdsEventosDSC_INDICE: TStringField
      DisplayLabel = 'Indice'
      DisplayWidth = 6
      FieldName = 'DSC_INDICE'
      Size = 10
    end
    object cdsEventosEVIDATAPROX: TDateTimeField
      DisplayLabel = 'Próximo'
      DisplayWidth = 10
      FieldName = 'EVIDATAPROX'
    end
    object cdsEventosEVIDESCRICAO: TMemoField
      FieldName = 'EVIDESCRICAO'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
    object cdsEventosIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Visible = False
    end
    object cdsEventosFLGTIPOEVENTO: TStringField
      FieldName = 'FLGTIPOEVENTO'
      Visible = False
      Size = 2
    end
    object cdsEventosIDCONTRATOLOJA: TFloatField
      FieldName = 'IDCONTRATOLOJA'
      Visible = False
    end
    object cdsEventosIDEVENTOIMOVEL: TFloatField
      FieldName = 'IDEVENTOIMOVEL'
      Visible = False
    end
  end
  object dsEventos: TwwDataSource
    DataSet = cdsEventos
    Left = 590
    Top = 161
  end
  object cdsSitContImob: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 501
    Top = 148
    object cdsSitContImobDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsSitContImobIDSITCONTIMOB: TFloatField
      FieldName = 'IDSITCONTIMOB'
      Visible = False
    end
  end
  object dsSitContImob: TwwDataSource
    DataSet = cdsSitContImob
    Left = 501
    Top = 161
  end
end
