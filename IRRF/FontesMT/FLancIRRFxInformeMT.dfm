inherited frmLancIRRFxInformeMT: TfrmLancIRRFxInformeMT
  Left = 128
  Top = 89
  HelpContext = 240002
  Caption = 'Lançamento Manual de Impostos'
  ClientHeight = 427
  ClientWidth = 733
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 387
    Top = 343
    Width = 46
    Height = 13
    Caption = 'COFINS'
  end
  inherited pnlFundo: TPanel
    Width = 733
    Height = 341
    inherited pnlMestre: TPanel
      Width = 731
      Height = 108
      object lblNatRendimento: TLabel
        Left = 264
        Top = 66
        Width = 141
        Height = 13
        Caption = 'Natureza de Rendimento'
      end
      object lblDocumento: TLabel
        Left = 16
        Top = 66
        Width = 65
        Height = 13
        Caption = 'Documento'
        Enabled = False
      end
      object lblDataLancamento: TLabel
        Left = 344
        Top = 10
        Width = 101
        Height = 13
        Caption = 'Data Lançamento'
      end
      object Label6: TLabel
        Left = 528
        Top = 66
        Width = 114
        Height = 13
        Caption = 'Modulo responsável'
      end
      object dblcNatRendimento: TwwDBLookupCombo
        Left = 264
        Top = 80
        Width = 246
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'Descrição'
          'CODNATUREZA'#9'4'#9'Código')
        DataField = 'CODNATUREZA'
        DataSource = ds
        LookupTable = dtmLookIRRF.cdsLookNatureza
        LookupField = 'CODNATUREZA'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dbFolha: TDBCheckBox
        Left = 124
        Top = 82
        Width = 123
        Height = 17
        Caption = 'Refere-se a Folha'
        DataField = 'FLGFOLHA'
        DataSource = ds
        TabOrder = 4
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dblcDocumento: TwwDBLookupCombo
        Left = 16
        Top = 80
        Width = 97
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NODOCUMENTO'#9'10'#9'Documento'#9'F')
        DataField = 'CODDOCUMENTO'
        DataSource = ds
        LookupTable = cdsDocumento
        LookupField = 'CODDOCUMENTO'
        Options = [loTitles]
        Style = csDropDownList
        Enabled = False
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object PSubTipoBeneficiario1: TCMProcuraSubTipo
        Left = 16
        Top = 8
        Width = 313
        Height = 50
        Caption = ' Beneficiário '
        TabOrder = 0
        OnExit = PSubTipoBeneficiario1Exit
        CampoEdit = ceRazaoSocial
        MostraMensagens = True
        DataSource = ds
        DataField = 'IDBENEFIRRF'
        Mensagens.EmBranco = 'Beneficiário não pode estar em branco'
        Mensagens.NaoExiste = 'Beneficiário não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        SubTipo = stCliente
        FiltraSubTipo = False
      end
      object dbedDataLanc: TCMDateTimePicker
        Left = 344
        Top = 24
        Width = 113
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATALANCAMENTO'
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
      object cmccContaContabil: TCMProcuraMaskContabil
        Left = 472
        Top = 8
        Width = 241
        Height = 50
        Caption = ' Conta Contábil '
        TabOrder = 2
        MostraMensagens = True
        MostraDescricao = True
        DataSource = ds
        DataField = 'PLACONTA'
        Mensagens.EmBranco = 'Conta contábil não pode estar em branco'
        Mensagens.NaoExiste = 'Conta contábil não existe'
        Mensagens.Sintetica = 'Conta contábil não pode ser sintética'
        Mensagens.Analitica = 'Conta contábil não pode ser analítica'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        AceitaTipoConta = Indiferente
        Plano = 0
        Status = scSoAtiva
      end
      object dblModulo: TwwDBLookupCombo
        Left = 528
        Top = 80
        Width = 185
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'Descrição'
          'CODNATUREZA'#9'4'#9'Código')
        DataField = 'IDMODULORESPON'
        DataSource = ds
        LookupTable = dtmLookIRRF.cdsLookModulo
        LookupField = 'IDMODULO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 109
      Width = 731
      Height = 231
      Tabs.Strings = (
        'Linhas do Informe'
        'Valores'
        'Previdência')
      detdbGrids.Strings = (
        'dbgrdDet'
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 633
        Height = 172
        ActivePage = tbsValores
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 625
            Height = 144
            object lblLinhaInforme: TLabel
              Left = 16
              Top = 18
              Width = 96
              Height = 13
              Caption = 'Linha do Informe'
            end
            object lblValor: TLabel
              Left = 440
              Top = 18
              Width = 95
              Height = 13
              Caption = 'Base do Imposto'
            end
            object dblcLinhaInforme: TCMDBLookupCombo
              Left = 16
              Top = 32
              Width = 409
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEINFORME'#9'60'#9'Nome da Linha'#9'F'
                'CODINFORME'#9'10'#9'Código do Informe'#9'F'
                'IDINFORME'#9'10'#9'Código da Linha'#9'F')
              DataField = 'IDINFORME'
              DataSource = dsDet
              LookupTable = cdsInforme
              LookupField = 'IDINFORME'
              Options = [loColLines, loRowLines, loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbreValor: TDBEdit
              Left = 440
              Top = 32
              Width = 121
              Height = 21
              DataField = 'VLRLANC'
              DataSource = dsDet
              TabOrder = 1
              OnExit = dbreValorExit
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 625
            Height = 144
            Selected.Strings = (
              'NOMEINFORME'#9'60'#9'Nome da Linha'
              'PERCLANC'#9'10'#9'Percentual'
              'VLRLANC'#9'10'#9'Valor')
          end
        end
        object tbsValores: TTabSheet
          Caption = 'Valores'
          object lblBase: TLabel
            Left = 352
            Top = 8
            Width = 95
            Height = 13
            Caption = 'Base do Imposto'
          end
          object lblPercent: TLabel
            Left = 480
            Top = 8
            Width = 62
            Height = 13
            Caption = 'Percentual'
          end
          object lblValorRef: TLabel
            Left = 352
            Top = 48
            Width = 114
            Height = 13
            Caption = 'Valor de Referência'
          end
          object Label10: TLabel
            Left = 480
            Top = 48
            Width = 81
            Height = 13
            Caption = 'Código Pagto.'
          end
          object Label2: TLabel
            Left = 352
            Top = 88
            Width = 96
            Height = 13
            Caption = 'Valor do Imposto'
          end
          object Label4: TLabel
            Left = 480
            Top = 96
            Width = 142
            Height = 52
            Caption = 
              'Abaixo deste componente em amarelo tem vários outros referente a' +
              ' valores'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Visible = False
            WordWrap = True
          end
          object dbrISS: TDBRealEdit
            Left = 352
            Top = 104
            Width = 113
            Height = 21
            Alignment = taRightJustify
            Color = 12648447
            Lines.Strings = (
              '      0,00')
            TabOrder = 12
            WordWrap = False
            IntDigits = 14
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
            DataField = 'VLRISS'
            DataSource = ds
          end
          object dbrPIS: TDBRealEdit
            Left = 352
            Top = 104
            Width = 113
            Height = 21
            Alignment = taRightJustify
            Color = 12648447
            Lines.Strings = (
              '      0,00')
            TabOrder = 6
            WordWrap = False
            IntDigits = 18
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
            DataField = 'VLRPIS'
            DataSource = ds
          end
          object dbrIOF: TDBRealEdit
            Left = 352
            Top = 104
            Width = 113
            Height = 21
            Alignment = taRightJustify
            Color = 12648447
            Lines.Strings = (
              '      0,00')
            TabOrder = 3
            WordWrap = False
            IntDigits = 14
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
            DataField = 'VLRIOF'
            DataSource = ds
          end
          object dbrCSLL: TDBRealEdit
            Left = 352
            Top = 104
            Width = 113
            Height = 21
            Alignment = taRightJustify
            Color = 12648447
            Lines.Strings = (
              '      0,00')
            TabOrder = 8
            WordWrap = False
            IntDigits = 14
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
            DataField = 'VLRCSLL'
            DataSource = ds
          end
          object dbrCSCOFPIS: TDBRealEdit
            Left = 352
            Top = 104
            Width = 113
            Height = 21
            Alignment = taRightJustify
            Color = 12648447
            Lines.Strings = (
              '      0,00')
            TabOrder = 10
            WordWrap = False
            IntDigits = 18
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
            DataField = 'VLRCSCOFPIS'
            DataSource = ds
          end
          object dbrINSS: TDBRealEdit
            Left = 352
            Top = 104
            Width = 113
            Height = 21
            Alignment = taRightJustify
            Color = 12648447
            Lines.Strings = (
              '      0,00')
            TabOrder = 5
            WordWrap = False
            IntDigits = 18
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
            DataField = 'VLRINSS'
            DataSource = ds
          end
          object dbrCOFINS: TDBRealEdit
            Left = 352
            Top = 104
            Width = 113
            Height = 21
            Alignment = taRightJustify
            Color = 12648447
            Lines.Strings = (
              '      0,00')
            TabOrder = 7
            WordWrap = False
            IntDigits = 18
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
            DataField = 'VLRCOFINS'
            DataSource = ds
          end
          object dbrValorBase: TDBRealEdit
            Left = 352
            Top = 24
            Width = 113
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 0
            WordWrap = False
            OnExit = dbrValorBaseExit
            IntDigits = 14
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
            DataField = 'VLRBASE'
            DataSource = ds
          end
          object dbrIRRF: TDBRealEdit
            Left = 352
            Top = 104
            Width = 113
            Height = 21
            Alignment = taRightJustify
            Color = 12648447
            Lines.Strings = (
              '      0,00')
            TabOrder = 4
            WordWrap = False
            IntDigits = 14
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
            DataField = 'VLRIRRF'
            DataSource = ds
          end
          object dbrPercIRRF: TDBRealEdit
            Left = 480
            Top = 24
            Width = 73
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 1
            WordWrap = False
            OnExit = dbrPercIRRFExit
            IntDigits = 3
            DecDigits = 5
            NumberFormat = fNumber
            Signal = False
            DataField = 'PERCIRRF'
            DataSource = ds
          end
          object dbrValorReferencia: TDBRealEdit
            Left = 352
            Top = 64
            Width = 113
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 2
            WordWrap = False
            IntDigits = 14
            DecDigits = 2
            NumberFormat = fNumber
            Signal = True
            DataField = 'VLRREFERENCIA'
            DataSource = ds
          end
          object rdgImposto: TRadioGroup
            Left = 16
            Top = 8
            Width = 321
            Height = 121
            Caption = ' Imposto '
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'IRRF'
              'INSS'
              'ISS'
              'CSLL'
              'PIS'
              'COFINS'
              'CSLL / PIS / COFINS'
              'IOF')
            TabOrder = 9
            OnClick = rdgImpostoClick
          end
          object DBedtCodigoGPS: TDBEdit
            Left = 480
            Top = 64
            Width = 73
            Height = 21
            DataField = 'CODIGOGPS'
            DataSource = ds
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
          end
        end
        object tbsPrevidencia: TTabSheet
          Caption = 'Previdência'
          object pnlPlanoPatroC: TPanel
            Left = 0
            Top = 0
            Width = 620
            Height = 201
            BevelOuter = bvNone
            TabOrder = 0
            object lblPatroC: TLabel
              Left = 312
              Top = 2
              Width = 80
              Height = 13
              Caption = 'Patrocinadora'
            end
            object lblPlanoPrevC: TLabel
              Left = 16
              Top = 2
              Width = 33
              Height = 13
              Caption = 'Plano'
            end
            object lblPrograma: TLabel
              Left = 16
              Top = 42
              Width = 54
              Height = 13
              Caption = 'Programa'
            end
            object lblCentroCusto: TLabel
              Left = 312
              Top = 42
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object lblMotivo: TLabel
              Left = 16
              Top = 82
              Width = 39
              Height = 13
              Caption = 'Motivo'
            end
            object Label1: TLabel
              Left = 312
              Top = 82
              Width = 93
              Height = 13
              Caption = 'Versão da Folha'
            end
            object Label8: TLabel
              Left = 312
              Top = 122
              Width = 160
              Height = 13
              Caption = 'Centro de Responsabilidade'
            end
            object Label9: TLabel
              Left = 16
              Top = 122
              Width = 116
              Height = 13
              Caption = 'Tipo de Desembolso'
            end
            object dblcPatroC: TwwDBLookupCombo
              Left = 312
              Top = 16
              Width = 281
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome')
              DataField = 'IDPATRO'
              DataSource = ds
              LookupTable = dtmLookIRRF.cdsLookPatro
              LookupField = 'IDPESSOA'
              Options = [loColLines]
              Style = csDropDownList
              DropDownCount = 5
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcPlanoPrevC: TwwDBLookupCombo
              Left = 16
              Top = 16
              Width = 281
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome')
              DataField = 'IDPLANOPREV'
              DataSource = ds
              LookupTable = dtmLookIRRF.cdsLookPlanoPrev
              LookupField = 'IDPLANOPREV'
              Options = [loColLines]
              Style = csDropDownList
              DropDownCount = 5
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcPrograma: TwwDBLookupCombo
              Left = 16
              Top = 56
              Width = 281
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCPROGRAMA'#9'60'#9'Descrição'
                'CODPROGRAMA'#9'2'#9'Código')
              DataField = 'IDPROGRAMA'
              DataSource = ds
              LookupTable = dtmLookIRRF.cdsLookPrograma
              LookupField = 'IDPROGRAMA'
              Options = [loColLines]
              Style = csDropDownList
              DropDownCount = 5
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcCentroCusto: TwwDBLookupCombo
              Left = 312
              Top = 56
              Width = 281
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'NOME'#9'F'
                'CODEXTERNO'#9'10'#9'Código'#9'F')
              DataField = 'CODCENTROCUSTO'
              DataSource = ds
              LookupTable = dtmLookIRRF.cdsLookCentroCusto
              LookupField = 'CODCENTROCUSTO'
              Options = [loColLines]
              Style = csDropDownList
              DropDownCount = 5
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcMotivo: TwwDBLookupCombo
              Left = 16
              Top = 96
              Width = 281
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Descrição'#9'F')
              DataField = 'IDMOTIVO'
              DataSource = ds
              LookupTable = dtmLookIRRF.cdsLookMotivo
              LookupField = 'IDMOTIVO'
              Options = [loColLines]
              Style = csDropDownList
              DropDownCount = 5
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcVersaoFolha: TwwDBLookupCombo
              Left = 312
              Top = 96
              Width = 281
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'HISTORICO'#9'50'#9'Descrição'#9'F')
              DataField = 'IDHSTFOLHABENEF'
              DataSource = ds
              LookupTable = cdsVerFolha
              LookupField = 'IDHSTFOLHABENEF'
              Options = [loColLines]
              Style = csDropDownList
              DropDownCount = 5
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcCentRespon: TwwDBLookupCombo
              Left = 312
              Top = 136
              Width = 281
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Descrição')
              DataField = 'CODCENTRORESPON'
              DataSource = ds
              LookupTable = dtmLookIRRF.cdsLookCentroRespon
              LookupField = 'CODCENTRORESPON'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 7
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcTipoRecDes: TwwDBLookupCombo
              Left = 16
              Top = 136
              Width = 281
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'Descrição')
              DataField = 'CODTIPRECDES'
              DataSource = ds
              LookupTable = dtmLookIRRF.cdsLookTipoDesemb
              LookupField = 'CODTIPRECDES'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 723
      end
      inherited Dock974: TDock97
        Left = 637
        Height = 172
      end
    end
  end
  inherited Dock972: TDock97
    Width = 733
  end
  inherited Dock971: TDock97
    Top = 388
    Width = 733
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnSair: TBitBtn
        OnExit = bbtnSairExit
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 240002
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 1018
    Top = 65511
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 288
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 1024
    Top = 65511
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    Left = 504
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 256
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'LANCIRRF.DATAPAGAMENTO'
      'LANCIRRF.CODNATUREZA'
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO'
      'LANCIRRF.VLRBASE'
      'LANCIRRF.VLRIRRF'
      'LANCIRRF.FLGDARF'
      'LANCIRRF.IDBENEFIRRF'
      'PESSOA.NUMDOCUMENTO'
      'MODULO.NOMEMODULO')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'N'
      'C'
      'N'
      'N'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Beneficiário'
      'Data de Pagamento'
      'Natureza do Rendimento'
      'Número do Documento'
      'Compl. Documento'
      'Valor Base do Imposto'
      'Valor do IRRF'
      'DARF Impresso <S/N>'
      'Código do Beneficiário'
      'CGC/CPF'
      'Nome do Módulo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'S'
      'N')
    Tabelas.Strings = (
      'DOCUMENTO'
      'LANCIRRF'
      'PESSOA'
      'MODULO')
    CamposChave.Strings = (
      'LANCIRRF.IDLANCIRRF'
      'LANCIRRF.IDPESSOA'
      'LANCIRRF.IDBENEFIRRF'
      'LANCIRRF.DATAPAGAMENTO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA=LANCIRRF.IDBENEFIRRF'
      'MODULO.IDMODULO(+)=LANCIRRF.IDMODULO'
      'DOCUMENTO.CODDOCUMENTO(+)=LANCIRRF.CODDOCUMENTO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '10'
      '10'
      '10'
      '10'
      '15'
      '15'
      '10'
      '10'
      '18'
      '50')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 432
    Top = 0
  end
  inherited CmeDetalhe: TCmEventosCadastro
    AfterConfirma = CmeDetalheAfterConfirma
    Left = 576
    Top = 0
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 376
    Top = 0
  end
  object cdsDocumento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 328
    Top = 152
  end
  object cdsInforme: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 544
    Top = 200
  end
  object cdsVerFolha: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 408
    Top = 152
  end
  object cdsPFisica: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 256
    Top = 152
  end
  object cdsTabIRRF: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 480
    Top = 152
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 408
    Top = 200
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 336
  end
  object cdsEmpresaProp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 328
    Top = 200
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDINFORME,'
      '  NOMEINFORME,'
      '  CODINFORME'
      ''
      'FROM'
      '  INFORME')
    Left = 656
  end
  object cdsAuxAlt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 504
    Top = 320
  end
end
