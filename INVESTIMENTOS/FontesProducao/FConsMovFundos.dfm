inherited frmConsMovFundos: TfrmConsMovFundos
  Left = 313
  Top = 217
  HelpContext = 790504
  Caption = ''
  ClientHeight = 536
  ClientWidth = 792
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 792
    Height = 497
    object DbGMovFdoEmol: TwwDBGrid
      Left = 1
      Top = 117
      Width = 790
      Height = 178
      Selected.Strings = (
        'DESCFUNDOINVEST'#9'34'#9'Fundo'
        'DESCTIPOOPERACAO'#9'25'#9'Operação'
        'DATALIQUIDACAO'#9'10'#9'Liquidação'
        'VLRCOTA'#9'16'#9'Cota'
        'VALOR'#9'16'#9'Valor'
        'VLRCOLOCACAO'#9'12'#9'Comissão Coloc.'
        'VLRTAXAS'#9'12'#9'Taxas e Emol.'
        'VLRCORRETAGEM'#9'12'#9'Corretagem'
        'VLRTOTAL'#9'16'#9'Valor Total'
        'PLANPRVCONTABPATRO'#9'113'#9'Plano / Patrocinadora')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = DmRelFundosEmol.DsConsFundoEmol
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clMaroon
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object DbGMovFdoNormal: TwwDBGrid
      Left = 1
      Top = 117
      Width = 790
      Height = 178
      Selected.Strings = (
        'PLANPRVCONTABPATRO'#9'24'#9'Plano / Patrocinadora'
        'DESCFUNDOINVEST'#9'24'#9'Fundo de Investimento'
        'DESCTIPOOPERACAO'#9'16'#9'Tipo de Operação'
        'DATAOPERACAO'#9'10'#9'Movimento'
        'DATAAPLICACAO'#9'10'#9'Aplicação'
        'DATALIQUIDACAO'#9'10'#9'Liquidação'
        'VLRCOTA'#9'18'#9'Valor da Cota'
        'VLRTOTAL'#9'15'#9'Valor Total'
        'DESCTIPOCOTA'#9'20'#9'Tipo de Cota')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      Align = alClient
      Color = clWhite
      DataSource = DmRelFundosConsMov.dsConsMovFundos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyOptions = []
      Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clMaroon
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icYellow
    end
    object pnlCabecario: TPanel
      Left = 1
      Top = 31
      Width = 790
      Height = 86
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 42
        Width = 130
        Height = 13
        Caption = 'Fundo de Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 4
        Width = 66
        Height = 13
        Caption = 'Data Inicial'
      end
      object Label3: TLabel
        Left = 135
        Top = 4
        Width = 59
        Height = 13
        Caption = 'Data Final'
      end
      object lblTipoFundo: TLabel
        Left = 256
        Top = 4
        Width = 83
        Height = 13
        Caption = 'Tipo de Fundo'
        FocusControl = dblTipoFundo
      end
      object lblTipoCota: TLabel
        Left = 530
        Top = 42
        Width = 74
        Height = 13
        Caption = 'Tipo de Cota'
        FocusControl = dblTipoCota
        Visible = False
      end
      object DbLkcFundos: TwwDBLookupCombo
        Left = 15
        Top = 56
        Width = 502
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCFUNDOINVEST'#9'40'#9'Descrição'#9'F')
        LookupTable = QryFundoInvest
        LookupField = 'IDFUNDOINVEST'
        Options = [loColLines, loRowLines]
        ParentFont = False
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object CbxPlano: TCheckBox
        Left = 530
        Top = 16
        Width = 121
        Height = 17
        Caption = 'Todos os Planos'
        TabOrder = 3
        OnClick = CbxPlanoClick
      end
      object dtDtaInicio: TCMDateTimePicker
        Left = 16
        Top = 18
        Width = 110
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
        OnEnter = dtDtaInicioEnter
      end
      object dtDtaFim: TCMDateTimePicker
        Left = 135
        Top = 18
        Width = 110
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
        OnExit = dtDtaFimExit
      end
      object dblTipoFundo: TwwDBLookupCombo
        Left = 256
        Top = 18
        Width = 261
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOFUNDOINV'#9'40'#9'Descrição'#9'F')
        LookupTable = QryTipoFundo
        LookupField = 'IDTIPOFUNDOINVEST'
        Options = [loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnExit = dblTipoFundoExit
      end
      object dblTipoCota: TwwDBLookupCombo
        Left = 530
        Top = 56
        Width = 223
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOCOTA'#9'30'#9'Descrição'#9'F')
        LookupTable = QryTipoCota
        LookupField = 'IDTIPOCOTA'
        Options = [loRowLines, loTitles]
        TabOrder = 5
        Visible = False
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 790
      Height = 30
      Align = alTop
      TabOrder = 3
      object lbNomItem: TfcLabel
        Left = 16
        Top = 4
        Width = 614
        Height = 24
        Caption = 'Movimentação das Operações dos Fundos de Investimentos'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
    end
    object pnlTotal: TPanel
      Left = 1
      Top = 295
      Width = 790
      Height = 201
      Align = alBottom
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 4
      object pnlTotApl: TPanel
        Left = 1
        Top = 19
        Width = 788
        Height = 19
        Align = alTop
        Enabled = False
        TabOrder = 0
        object lbApl: TLabel
          Left = 6
          Top = 1
          Width = 83
          Height = 17
          AutoSize = False
          Caption = 'Aplicação'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbQtdAplicada: TDBRealEdit
          Left = 125
          Top = 1
          Width = 150
          Height = 17
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,000000000')
          ParentFont = False
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 9
          NumberFormat = fNumber
          Signal = False
          DataField = 'QTDOPERACAO'
          DataSource = DmRelFundosConsMov.DsTotApl
        end
        object dbValorAplicado: TDBRealEdit
          Left = 275
          Top = 1
          Width = 115
          Height = 17
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLROPERACAO'
          DataSource = DmRelFundosConsMov.DsTotApl
        end
        object dbValorIrApl: TDBRealEdit
          Left = 390
          Top = 1
          Width = 90
          Height = 17
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRIR'
          DataSource = DmRelFundosConsMov.DsTotApl
        end
        object dbValorIOFApl: TDBRealEdit
          Left = 480
          Top = 1
          Width = 90
          Height = 17
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 3
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRIOF'
          DataSource = DmRelFundosConsMov.DsTotApl
        end
        object dbValorLiqApl: TDBRealEdit
          Left = 660
          Top = 1
          Width = 115
          Height = 17
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 4
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRLIQUIDO'
          DataSource = DmRelFundosConsMov.DsTotApl
        end
        object dbValorTxApl: TDBRealEdit
          Left = 570
          Top = 1
          Width = 90
          Height = 17
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 5
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRTAXAS'
          DataSource = DmRelFundosConsMov.DsTotApl
        end
      end
      object pnlTotResg: TPanel
        Left = 1
        Top = 38
        Width = 788
        Height = 20
        Align = alTop
        Enabled = False
        TabOrder = 1
        object lbResg: TLabel
          Left = 6
          Top = 1
          Width = 83
          Height = 18
          AutoSize = False
          Caption = 'Resgate'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbQtdResgate: TDBRealEdit
          Left = 125
          Top = 1
          Width = 150
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,000000000')
          ParentFont = False
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 9
          NumberFormat = fNumber
          Signal = False
          DataField = 'QTDOPERACAO'
          DataSource = DmRelFundosConsMov.DsTotResg
        end
        object dbValorResgate: TDBRealEdit
          Left = 275
          Top = 1
          Width = 115
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLROPERACAO'
          DataSource = DmRelFundosConsMov.DsTotResg
        end
        object dbValorIr: TDBRealEdit
          Left = 390
          Top = 1
          Width = 90
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRIR'
          DataSource = DmRelFundosConsMov.DsTotResg
        end
        object dbValorIOF: TDBRealEdit
          Left = 480
          Top = 1
          Width = 90
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 3
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRIOF'
          DataSource = DmRelFundosConsMov.DsTotResg
        end
        object dbValorLiquido: TDBRealEdit
          Left = 660
          Top = 1
          Width = 115
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 4
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRLIQUIDO'
          DataSource = DmRelFundosConsMov.DsTotResg
        end
        object dbValorTxResg: TDBRealEdit
          Left = 570
          Top = 1
          Width = 90
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 5
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRTAXAS'
          DataSource = DmRelFundosConsMov.DsTotResg
        end
      end
      object PnlTotSub: TPanel
        Left = 1
        Top = 58
        Width = 788
        Height = 20
        Align = alTop
        Enabled = False
        TabOrder = 2
        object lbSub: TLabel
          Left = 6
          Top = 1
          Width = 108
          Height = 17
          AutoSize = False
          Caption = 'Subscrição'
          Font.Charset = ANSI_CHARSET
          Font.Color = clTeal
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbQtdSub: TDBRealEdit
          Left = 125
          Top = 1
          Width = 150
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,000000000')
          ParentFont = False
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 9
          NumberFormat = fNumber
          Signal = False
          DataField = 'QTDOPERACAO'
          DataSource = DmRelFundosConsMov.DsTotSub
        end
        object dbValorSub: TDBRealEdit
          Left = 275
          Top = 1
          Width = 115
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLROPERACAO'
          DataSource = DmRelFundosConsMov.DsTotSub
        end
      end
      object PnlTotIntegr: TPanel
        Left = 1
        Top = 78
        Width = 788
        Height = 20
        Align = alTop
        Enabled = False
        TabOrder = 3
        object lbintegr: TLabel
          Left = 6
          Top = 1
          Width = 108
          Height = 17
          AutoSize = False
          Caption = 'Integralização'
          Font.Charset = ANSI_CHARSET
          Font.Color = clTeal
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbQtdIntegr: TDBRealEdit
          Left = 125
          Top = 1
          Width = 150
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,000000000')
          ParentFont = False
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 9
          NumberFormat = fNumber
          Signal = False
          DataField = 'QTDOPERACAO'
          DataSource = DmRelFundosConsMov.DsTotIntegr
        end
        object dbValorIntegr: TDBRealEdit
          Left = 275
          Top = 1
          Width = 115
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLROPERACAO'
          DataSource = DmRelFundosConsMov.DsTotIntegr
        end
        object dbValorTxIntegr: TDBRealEdit
          Left = 570
          Top = 1
          Width = 90
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRTAXAS'
          DataSource = DmRelFundosConsMov.DsTotIntegr
        end
      end
      object Panel2: TPanel
        Left = 1
        Top = 98
        Width = 788
        Height = 21
        Align = alTop
        Enabled = False
        TabOrder = 4
        object Label4: TLabel
          Left = 6
          Top = 1
          Width = 181
          Height = 18
          AutoSize = False
          Caption = 'Amortização a Receber'
          Font.Charset = ANSI_CHARSET
          Font.Color = clTeal
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbValorAmortRec: TDBRealEdit
          Left = 275
          Top = 1
          Width = 115
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLROPERACAO'
          DataSource = DmRelFundosConsMov.DsTotAmortRec
        end
      end
      object PnlTotAmort: TPanel
        Left = 1
        Top = 119
        Width = 788
        Height = 21
        Align = alTop
        Enabled = False
        TabOrder = 5
        object lbAmort: TLabel
          Left = 6
          Top = 1
          Width = 98
          Height = 18
          AutoSize = False
          Caption = 'Amortização'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbValorAmort: TDBRealEdit
          Left = 275
          Top = 1
          Width = 115
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLROPERACAO'
          DataSource = DmRelFundosConsMov.DsTotAmort
        end
        object dbValorTxAmort: TDBRealEdit
          Left = 570
          Top = 1
          Width = 90
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRTAXAS'
          DataSource = DmRelFundosConsMov.DsTotAmort
        end
      end
      object PnlTotOutros: TPanel
        Left = 1
        Top = 179
        Width = 788
        Height = 21
        Align = alBottom
        Enabled = False
        TabOrder = 6
        object lbOut: TLabel
          Left = 6
          Top = 1
          Width = 83
          Height = 19
          AutoSize = False
          Caption = 'Outros'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbOutroIRRF: TDBRealEdit
          Left = 390
          Top = 1
          Width = 90
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRIR'
          DataSource = DmRelFundosConsMov.DsTotalMovOutro
        end
        object dbOutroIOF: TDBRealEdit
          Left = 480
          Top = 1
          Width = 90
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRIOF'
          DataSource = DmRelFundosConsMov.DsTotalMovOutro
        end
        object dbQtdOutros: TDBRealEdit
          Left = 125
          Top = 1
          Width = 150
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,000000000')
          ParentFont = False
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 9
          NumberFormat = fNumber
          Signal = False
          DataField = 'QTDOPERACAO'
          DataSource = DmRelFundosConsMov.DsTotalMovOutro
        end
        object dbVlrOutros: TDBRealEdit
          Left = 275
          Top = 1
          Width = 115
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 3
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLROPERACAO'
          DataSource = DmRelFundosConsMov.DsTotalMovOutro
        end
        object dbVlrLiqOutros: TDBRealEdit
          Left = 660
          Top = 1
          Width = 115
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 4
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRLIQUIDO'
          DataSource = DmRelFundosConsMov.DsTotalMovOutro
        end
      end
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 788
        Height = 18
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 7
        object Label21: TLabel
          Left = 696
          Top = 2
          Width = 77
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Líquido'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 550
          Top = 3
          Width = 21
          Height = 13
          Alignment = taRightJustify
          Caption = 'IOF'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 452
          Top = 3
          Width = 30
          Height = 13
          Caption = 'IRRF'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 359
          Top = 2
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 209
          Top = 2
          Width = 66
          Height = 13
          Caption = 'Quantidade'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 625
          Top = 2
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'Taxas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object pnlTotTransfEnt: TPanel
        Left = 1
        Top = 140
        Width = 788
        Height = 19
        Align = alTop
        Enabled = False
        TabOrder = 8
        object LblTransfEnt: TLabel
          Left = 6
          Top = 1
          Width = 133
          Height = 17
          AutoSize = False
          Caption = 'Transf. Acrésc.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbQtdEntr: TDBRealEdit
          Left = 125
          Top = 1
          Width = 150
          Height = 17
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,000000000')
          ParentFont = False
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 9
          NumberFormat = fNumber
          Signal = False
          DataField = 'QTDOPERACAO'
          DataSource = DmRelFundosConsMov.DsTotTransfEntr
        end
        object dbValorTransfEntr: TDBRealEdit
          Left = 275
          Top = 1
          Width = 115
          Height = 17
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLROPERACAO'
          DataSource = DmRelFundosConsMov.DsTotTransfEntr
        end
        object dbVlrfEntrIrrf: TDBRealEdit
          Left = 390
          Top = 1
          Width = 90
          Height = 17
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRIR'
          DataSource = DmRelFundosConsMov.DsTotTransfEntr
        end
        object dbVlrEntrIof: TDBRealEdit
          Left = 480
          Top = 1
          Width = 90
          Height = 17
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 3
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRIOF'
          DataSource = DmRelFundosConsMov.DsTotTransfEntr
        end
        object dbVlrEntrLiq: TDBRealEdit
          Left = 660
          Top = 1
          Width = 115
          Height = 17
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 4
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRLIQUIDO'
          DataSource = DmRelFundosConsMov.DsTotTransfEntr
        end
      end
      object pnlTotTransfSai: TPanel
        Left = 1
        Top = 159
        Width = 788
        Height = 20
        Align = alTop
        Enabled = False
        TabOrder = 9
        object LblTransfSai: TLabel
          Left = 6
          Top = 1
          Width = 113
          Height = 18
          AutoSize = False
          Caption = 'Transf. Baixa'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbQtdSaida: TDBRealEdit
          Left = 125
          Top = 1
          Width = 150
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,000000000')
          ParentFont = False
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 9
          NumberFormat = fNumber
          Signal = False
          DataField = 'QTDOPERACAO'
          DataSource = DmRelFundosConsMov.DsTotTransfSaida
        end
        object dbValorTransfSai: TDBRealEdit
          Left = 275
          Top = 1
          Width = 115
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLROPERACAO'
          DataSource = DmRelFundosConsMov.DsTotTransfSaida
        end
        object dbVlrfSaiIrrf: TDBRealEdit
          Left = 390
          Top = 1
          Width = 90
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRIR'
          DataSource = DmRelFundosConsMov.DsTotTransfSaida
        end
        object dbVlrSaiIof: TDBRealEdit
          Left = 480
          Top = 1
          Width = 90
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 3
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRIOF'
          DataSource = DmRelFundosConsMov.DsTotTransfSaida
        end
        object dbVlrSaiLiq: TDBRealEdit
          Left = 660
          Top = 1
          Width = 115
          Height = 18
          Alignment = taRightJustify
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          TabOrder = 4
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRLIQUIDO'
          DataSource = DmRelFundosConsMov.DsTotTransfSaida
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 497
    Width = 792
    inherited tb97Fundo: TToolbar97
      Left = 540
      DockPos = 540
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 165
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 81
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
      object bt_Imprime: TBitBtn
        Left = 168
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 2
        OnClick = bt_ImprimeClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 675
    Top = 115
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object QryFundoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.IDGESTORCA' +
        'RTEIRA  , FUN.TRGDTINCLUSAO     ,'
      
        '  FUN.TRGUSERINCLUSAO   , FUN.MOECODIGO         , FUN.IDCARTEIRA' +
        'INVEST  , FUN.IDTIPOFUNDOINVEST ,'
      
        '  FUN.CNPJFUNDO         , FUN.STAEXCLUSIVO      , FUN.PZOCARENCI' +
        'A       , FUN.PZOANIVERSARIO    ,'
      
        '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD ' +
        '        , FUN.QTDDECVALOR       ,'
      
        '  FUN.STAFUNDO          , FUN.PZOAMORTIZACAO    , FUN.PERCTXPERF' +
        'ORM     , FUN.PERCTXADM         ,'
      
        '  FUN.CODFUNCETIP       , FUN.STAPROVISIONAIR   , FUN.STAPROVISI' +
        'ONAIOF  , FUN.CONTRCETIP'
      'FROM'
      ' (SELECT'
      
        '       IDFUNDOINVEST     , DESCFUNDOINVEST   , IDGESTORCARTEIRA ' +
        ' , TRGDTINCLUSAO     ,'
      
        '       TRGUSERINCLUSAO   , MOECODIGO         , IDCARTEIRAINVEST ' +
        ' , IDTIPOFUNDOINVEST ,'
      
        '       CNPJFUNDO         , STAEXCLUSIVO      , PZOCARENCIA      ' +
        ' , PZOANIVERSARIO    ,'
      
        '       PZOLIQAPLIC       , PZOLIQRESG        , QTDDECQTD        ' +
        ' , QTDDECVALOR       ,'
      
        '       STAFUNDO          , PZOAMORTIZACAO    , PERCTXPERFORM    ' +
        ' , PERCTXADM         ,'
      
        '       CODFUNCETIP       , STAPROVISIONAIR   , STAPROVISIONAIOF ' +
        ' , CONTRCETIP'
      
        '  FROM HISTFUNDOINVEST WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENC' +
        'IA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '      (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),'#39'DD/MM/Y' +
        'YYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST'
      
        '       WHERE   DTAVIGENCIA < TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/YYYY'#39')' +
        '+1'
      '       AND (((:IDTIPOFUNDOINVEST IS NOT NULL)           AND'
      '              (IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)) OR'
      '             (:IDTIPOFUNDOINVEST IS NULL))'
      '       GROUP BY IDFUNDOINVEST))) FUN,  TIPOFUNDOINVEST TFI'
      'WHERE'
      ''
      '    (TFI.IDTIPOINVEST    = :IDTIPOINVEST)'
      'AND  (((:IDTIPOFUNDOINVEST IS NOT NULL)           AND'
      '    (TFI.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)) OR'
      '       (:IDTIPOFUNDOINVEST IS NULL))'
      'AND (FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST)'
      'ORDER BY FUN.DESCFUNDOINVEST'
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 673
    Top = 177
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end>
    object QryFundoInvestDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoInvestIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
    object QryFundoInvestIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'FUNDOINVEST.IDGESTORCARTEIRA'
      Visible = False
    end
    object QryFundoInvestTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'FUNDOINVEST.TRGDTINCLUSAO'
      Visible = False
    end
    object QryFundoInvestTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'FUNDOINVEST.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object QryFundoInvestMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'FUNDOINVEST.MOECODIGO'
      Visible = False
    end
    object QryFundoInvestIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'FUNDOINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object QryFundoInvestIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryFundoInvestCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Origin = 'FUNDOINVEST.CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object QryFundoInvestSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Origin = 'FUNDOINVEST.STAEXCLUSIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Origin = 'FUNDOINVEST.PZOCARENCIA'
      Visible = False
    end
    object QryFundoInvestPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Origin = 'FUNDOINVEST.PZOANIVERSARIO'
      Visible = False
    end
    object QryFundoInvestPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Origin = 'FUNDOINVEST.PZOLIQAPLIC'
      Visible = False
    end
    object QryFundoInvestPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
      Origin = 'FUNDOINVEST.PZOLIQRESG'
      Visible = False
    end
    object QryFundoInvestQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Origin = 'FUNDOINVEST.QTDDECQTD'
      Visible = False
    end
    object QryFundoInvestQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Origin = 'FUNDOINVEST.QTDDECVALOR'
      Visible = False
    end
    object QryFundoInvestSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Origin = 'FUNDOINVEST.STAFUNDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Origin = 'FUNDOINVEST.PZOAMORTIZACAO'
      Visible = False
    end
    object QryFundoInvestPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Origin = 'FUNDOINVEST.PERCTXPERFORM'
      Visible = False
    end
    object QryFundoInvestPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Origin = 'FUNDOINVEST.PERCTXADM'
      Visible = False
    end
    object QryFundoInvestCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Origin = 'FUNDOINVEST.CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object QryFundoInvestSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Origin = 'FUNDOINVEST.STAPROVISIONAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Origin = 'FUNDOINVEST.STAPROVISIONAIOF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Origin = 'FUNDOINVEST.CONTRCETIP'
      Visible = False
      Size = 30
    end
  end
  object dsFundoInvest: TwwDataSource
    AutoEdit = False
    DataSet = QryFundoInvest
    Left = 677
    Top = 233
  end
  object QryTipoFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IDTIPOINVEST, IDTIPOFUNDOINVEST, DESCTIPOFUNDOINV, DATAULTFEC' +
        'H'
      'FROM'
      '   TIPOFUNDOINVEST'
      'WHERE'
      '   IDTIPOINVEST =:IDTIPOINVEST'
      'ORDER BY DESCTIPOFUNDOINV   '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 549
    Top = 234
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
  end
  object QryTipoCota: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOCOTA, DESCTIPOCOTA'
      'FROM'
      '   TIPOCOTA'
      'ORDER BY DESCTIPOCOTA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 549
    Top = 186
  end
end
