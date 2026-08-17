inherited frmConsHistCota: TfrmConsHistCota
  Left = 117
  Top = 128
  HelpContext = 790568
  Caption = 'Consulta'
  ClientHeight = 541
  ClientWidth = 791
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 791
    Height = 502
    inherited bvlSepTit: TBevel
      Top = 123
      Width = 789
    end
    inherited pnlTitulo: TPanel
      Width = 789
      TabOrder = 2
      inherited lbNomDescricao: TfcLabel
        Width = 179
        Caption = 'Evolução da Cota'
      end
    end
    object PlnParam: TPanel
      Left = 1
      Top = 42
      Width = 789
      Height = 81
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 126
        Top = 2
        Width = 103
        Height = 13
        Caption = 'Carteira Gerencial'
      end
      object Label4: TLabel
        Left = 126
        Top = 41
        Width = 164
        Height = 13
        Caption = 'Regra de Cálculo - Indicador'
      end
      object Label8: TLabel
        Left = 426
        Top = 40
        Width = 141
        Height = 13
        Caption = 'Regra de Cálculo - Juros'
      end
      object Label5: TLabel
        Left = 411
        Top = 60
        Width = 10
        Height = 13
        Alignment = taRightJustify
        Caption = '%'
      end
      object Label6: TLabel
        Left = 622
        Top = 41
        Width = 81
        Height = 13
        Caption = 'Taxa de Juros'
      end
      object Label2: TLabel
        Left = 15
        Top = 2
        Width = 34
        Height = 13
        Caption = 'Início'
      end
      object Label7: TLabel
        Left = 15
        Top = 41
        Width = 20
        Height = 13
        Caption = 'Fim'
      end
      object Label3: TLabel
        Left = 426
        Top = 2
        Width = 118
        Height = 13
        Caption = 'Plano/Patrocinadora'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dblCarteira: TwwDBLookupCombo
        Left = 126
        Top = 16
        Width = 282
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTGERENC'#9'30'#9'Descrição'#9'F')
        LookupTable = QryCarteira
        LookupField = 'IDCARTEIRAGERENC'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object dblkRegra: TwwDBLookupCombo
        Left = 126
        Top = 56
        Width = 219
        Height = 21
        Hint = 'Descrição da Moeda'
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEREGRA'#9'60'#9'Nome da Regra'#9'F')
        LookupTable = qryRegra
        LookupField = 'IDREGRA'
        Options = [loColLines, loRowLines, loTitles]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblRegraJur: TwwDBLookupCombo
        Left = 426
        Top = 56
        Width = 190
        Height = 21
        Hint = 'Descrição da Moeda'
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEREGRA'#9'60'#9'Nome da Regra'#9'F')
        LookupTable = qryRegraJur
        LookupField = 'IDREGRA'
        Options = [loColLines, loRowLines, loTitles]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object spePercentual: TSpinEdit
        Left = 354
        Top = 56
        Width = 53
        Height = 22
        Hint = 'Percentual sobre a Moeda'
        MaxValue = 0
        MinValue = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Value = 100
      end
      object chkPassoaPasso: TdxCheckEdit
        Left = 705
        Top = 46
        Width = 76
        Style.BorderStyle = xbsNone
        Style.ButtonStyle = bts3D
        Style.ButtonTransparence = ebtNone
        Style.HotTrack = False
        Style.Shadow = False
        TabOrder = 9
        Alignment = taLeftJustify
        Caption = 'Passo a Passo'
        MultiLine = True
        NullStyle = nsUnchecked
        StoredValues = 1
      end
      object edtJuros: TRealEdit
        Left = 622
        Top = 56
        Width = 79
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 8
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object DtaInicio: TCMDateTimePicker
        Left = 15
        Top = 16
        Width = 103
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
      object DtaFim: TCMDateTimePicker
        Left = 15
        Top = 56
        Width = 103
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
        OnExit = DtaFimExit
      end
      object dblPlanoPatr: TwwDBLookupCombo
        Left = 426
        Top = 16
        Width = 219
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'30'#9'PLANPRVCONTABPATRO'#9'F')
        LookupTable = QryPatroPlanPrevContab
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loColLines, loRowLines]
        ParentFont = False
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object CbxEQM: TCheckBox
        Left = 655
        Top = 16
        Width = 128
        Height = 17
        Caption = 'EQM por Log. Nep.'
        TabOrder = 4
      end
    end
    object PlnGrid: TPanel
      Left = 1
      Top = 126
      Width = 789
      Height = 317
      Align = alClient
      TabOrder = 1
      object DBGrid: TwwDBGrid
        Left = 1
        Top = 26
        Width = 787
        Height = 290
        Selected.Strings = (
          'DATA'#9'10'#9'Data'
          'SALDO'#9'16'#9'Patrimônio Final'
          'COTA'#9'17'#9'Valor da Cota'
          'INDICEEQM'#9'12'#9'Índice~Ibovespa'
          'QUANTIDADE'#9'18'#9'Quantidade de~Cotas'#9'F'
          'QTDEAPL'#9'15'#9'Quantidade~Aplicada'
          'QTDERES'#9'15'#9'Quantidade~Resgatada')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = Ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = [dgAllowDelete]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
        object DBGridIButton: TwwIButton
          Left = 0
          Top = 0
          Width = 11
          Height = 17
          AllowAllUp = True
          NumGlyphs = 2
        end
      end
      object pnlTitMovimento: TPanel
        Left = 1
        Top = 1
        Width = 787
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = 'Movimento'
        Color = clNavy
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object pnlValores: TPanel
      Left = 1
      Top = 443
      Width = 789
      Height = 58
      Align = alBottom
      BevelInner = bvLowered
      BorderWidth = 3
      Color = clSilver
      TabOrder = 3
      object pnlIndicador: TPanel
        Tag = 1
        Left = 392
        Top = 25
        Width = 135
        Height = 25
        Alignment = taRightJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = '0,0000 % '
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object pnlPerSInd: TPanel
        Tag = 3
        Left = 666
        Top = 25
        Width = 108
        Height = 25
        Alignment = taRightJustify
        Anchors = [akLeft, akTop, akRight]
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = '0,0000 % '
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object pnlTitPerSInd: TPanel
        Tag = 3
        Left = 666
        Top = 7
        Width = 108
        Height = 17
        Alignment = taRightJustify
        Anchors = [akLeft, akTop, akRight]
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = '% sobre Indicador '
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object pnlNomeInd: TPanel
        Tag = 1
        Left = 6
        Top = 25
        Width = 249
        Height = 25
        Alignment = taLeftJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object Panel9: TPanel
        Tag = 3
        Left = 6
        Top = 7
        Width = 249
        Height = 17
        Alignment = taLeftJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = ' Indicador'
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object Panel8: TPanel
        Tag = 3
        Left = 528
        Top = 7
        Width = 137
        Height = 17
        Alignment = taRightJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Rentabilidade da Cota '
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object pnlValorizacao: TPanel
        Tag = 1
        Left = 528
        Top = 25
        Width = 137
        Height = 25
        Alignment = taRightJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = '0,0000 % '
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
      object Panel2: TPanel
        Tag = 3
        Left = 392
        Top = 7
        Width = 135
        Height = 17
        Alignment = taRightJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Indicador + Juros '
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
      end
      object pnlEqmCab: TPanel
        Tag = 3
        Left = 256
        Top = 7
        Width = 135
        Height = 17
        Alignment = taRightJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'EQM '
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
      end
      object pnlEQM: TPanel
        Tag = 1
        Left = 256
        Top = 25
        Width = 135
        Height = 25
        Alignment = taRightJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = '0,0000 '
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
      end
    end
  end
  inherited Dock971: TDock97
    Top = 502
    Width = 791
    inherited tb97Fundo: TToolbar97
      Left = 444
      DockPos = 444
      inherited bbtnSair: TBitBtn
        Left = 84
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 168
      end
      object bt_Imprime: TBitBtn
        Left = 0
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
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 379
    Top = 3
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  object QryHistCota: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   HC.DATAHISTCOTA, PL.PLANPRVCONTABPATRO, CG.DESCCARTGERENC, EC' +
        '.DESCCAIXACOTA, HC.VLRHISTCOTA, EC.IDEVENTOCAIXACOTA,'
      '   HC.IDHISTCOTA'
      'FROM'
      
        '   HISTCOTA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA EC, CARTEIRA' +
        'GERENC CG,'
      '('
      '   SELECT'
      '      PA.IDPLANPREVCTBPATR,'
      '      PA.IDPLANOPREV,'
      '      PA.IDPATRO,'
      '      (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      '   FROM'
      '      PESSOA PE,'
      '      PLANPREVCONTABPATRO PA,'
      '      PLANPREVCONTABIL PL'
      '   WHERE'
      '      (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '      (PA.IDPLANOPREV = PL.IDPLANOPREV)) PL   '
      'WHERE'
      
        '     ((:IDPLANPREVCTBPATR IS NULL) OR (HC.IDPLANPREVCTBPATR = :I' +
        'DPLANPREVCTBPATR))'
      'AND (HC.IDCARTEIRAINVEST >  0)'
      'AND (HC.IDCARTEIRAGERENC  = :IDCARTEIRAGERENC)'
      
        'AND (HC.DATAHISTCOTA BETWEEN TO_DATE(:DATAINICIO,'#39'DD/MM/YYYY'#39') A' +
        'ND TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39') )'
      'AND (CE.IDCARTEIRAXEVENTO = HC.IDCARTEIRAXEVENTO)'
      'AND (EC.IDEVENTOCAIXACOTA = CE.IDEVENTOCAIXACOTA)'
      'AND (CG.IDCARTEIRAGERENC  = HC.IDCARTEIRAGERENC)'
      'AND (CG.IDCARTEIRAINVEST  = HC.IDCARTEIRAINVEST)'
      'AND (PL.IDPLANPREVCTBPATR = HC.IDPLANPREVCTBPATR)'
      
        'ORDER BY PL.PLANPRVCONTABPATRO, CG.DESCCARTGERENC, HC.DATAHISTCO' +
        'TA, HC.IDHISTCOTA, EC.DESCCAIXACOTA'
      ' ')
    ValidateWithMask = True
    Left = 593
    Top = 213
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    object QryHistCotaDATAHISTCOTA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 12
      FieldName = 'DATAHISTCOTA'
      Origin = 'BASEDADOS.HISTCOTA.DATAHISTCOTA'
    end
    object QryHistCotaDESCCARTGERENC: TStringField
      DisplayLabel = 'Carteira de Investimento'
      DisplayWidth = 40
      FieldName = 'DESCCARTGERENC'
      Origin = 'BASEDADOS.CARTEIRAGERENC.DESCCARTGERENC'
      Size = 40
    end
    object QryHistCotaDESCCAIXACOTA: TStringField
      DisplayLabel = 'Eventos'
      DisplayWidth = 33
      FieldName = 'DESCCAIXACOTA'
      Origin = 'BASEDADOS.EVENTOCAIXACOTA.DESCCAIXACOTA'
      Size = 40
    end
    object QryHistCotaVLRHISTCOTA: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 20
      FieldName = 'VLRHISTCOTA'
      Origin = 'BASEDADOS.HISTCOTA.VLRHISTCOTA'
      DisplayFormat = '###,###,###,########0.000000'
    end
    object QryHistCotaIDEVENTOCAIXACOTA: TFloatField
      FieldName = 'IDEVENTOCAIXACOTA'
      Origin = 'BASEDADOS.EVENTOCAIXACOTA.IDEVENTOCAIXACOTA'
    end
    object QryHistCotaPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QryHistCotaIDHISTCOTA: TFloatField
      FieldName = 'IDHISTCOTA'
    end
  end
  object DsHistCota: TwwDataSource
    DataSet = QryHistCota
    Left = 726
    Top = 212
  end
  object QryCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCCARTGERENC, IDCARTEIRAGERENC, IDCARTEIRAINVEST'
      ''
      'FROM   CARTEIRAGERENC'
      ''
      'ORDER BY DESCCARTGERENC'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 368
    Top = 212
    object QryCarteiraDESCCARTGERENC: TStringField
      FieldName = 'DESCCARTGERENC'
      Origin = 'BASEDADOS.CARTEIRAGERENC.DESCCARTGERENC'
      Size = 40
    end
    object QryCarteiraIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Origin = 'BASEDADOS.CARTEIRAGERENC.IDCARTEIRAGERENC'
    end
    object QryCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.CARTEIRAGERENC.IDCARTEIRAINVEST'
    end
  end
  object UpdHistCota: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCOTA'
      'set'
      '  IDHISTCOTA = :IDHISTCOTA,'
      '  IDCARTEIRAXEVENTO = :IDCARTEIRAXEVENTO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  DATAHISTCOTA = :DATAHISTCOTA,'
      '  VLRHISTCOTA = :VLRHISTCOTA'
      'where'
      '  IDHISTCOTA = :OLD_IDHISTCOTA')
    InsertSQL.Strings = (
      'insert into HISTCOTA'
      
        '  (IDHISTCOTA, IDCARTEIRAXEVENTO, IDPLANPREVCTBPATR, DATAHISTCOT' +
        'A, VLRHISTCOTA)'
      'values'
      
        '  (:IDHISTCOTA, :IDCARTEIRAXEVENTO, :IDPLANPREVCTBPATR, :DATAHIS' +
        'TCOTA, '
      '   :VLRHISTCOTA)')
    DeleteSQL.Strings = (
      'delete from HISTCOTA'
      'where'
      '  IDHISTCOTA = :OLD_IDHISTCOTA')
    Left = 664
    Top = 215
  end
  object Qry: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  '#39'           '#39' AS DATA,'
      
        #39'                                                               ' +
        '                '#39'  AS CARTEIRA,'
      '0 AS QTDEAPL,'
      '0 AS QTDERES, '
      '0 AS QUANTIDADE, '
      '0 AS SALDO, '
      '0 AS COTA,'
      '0 AS INDICEEQM'
      'FROM    DUAL'
      ''
      ' '
      ' '
      ' ')
    UpdateObject = Upd
    ValidateWithMask = True
    Left = 593
    Top = 157
    object QryDATA: TStringField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATA'
      FixedChar = True
      Size = 10
    end
    object QrySALDO: TFloatField
      DisplayLabel = 'Patrimônio Final'
      DisplayWidth = 16
      FieldName = 'SALDO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryCOTA: TFloatField
      DisplayLabel = 'Valor da Cota'
      DisplayWidth = 17
      FieldName = 'COTA'
      DisplayFormat = '###,###,###,###0.000000000'
    end
    object QryINDICEEQM: TFloatField
      DisplayLabel = 'Índice~Ibovespa'
      DisplayWidth = 12
      FieldName = 'INDICEEQM'
      DisplayFormat = '###,###,###,###0.0000'
    end
    object QryQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade de~Cotas'
      DisplayWidth = 18
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###,###,###,###0.000000000'
    end
    object QryQTDEAPL: TFloatField
      DisplayLabel = 'Quantidade~Aplicada'
      DisplayWidth = 15
      FieldName = 'QTDEAPL'
      DisplayFormat = '###,###,###,###0.000000000'
    end
    object QryQTDERES: TFloatField
      DisplayLabel = 'Quantidade~Resgatada'
      DisplayWidth = 15
      FieldName = 'QTDERES'
      DisplayFormat = '###,###,###,###0.000000000'
    end
    object QryCARTEIRA2: TStringField
      DisplayLabel = 'Carteira de Investimento'
      DisplayWidth = 30
      FieldName = 'CARTEIRA'
      Visible = False
      FixedChar = True
      Size = 79
    end
  end
  object Upd: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  DATA = :DATA,'
      '  CARTEIRA = :CARTEIRA,'
      '  QTDEAPL = :QTDEAPL,'
      '  QTDERES = :QTDERES,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  SALDO = :SALDO,'
      '  COTA = :COTA'
      'where'
      '  DATA = :OLD_DATA')
    InsertSQL.Strings = (
      'insert into DUAL'
      '  (DATA, CARTEIRA, QTDEAPL, QTDERES, QUANTIDADE, SALDO, COTA)'
      'values'
      
        '  (:DATA, :CARTEIRA, :QTDEAPL, :QTDERES, :QUANTIDADE, :SALDO, :C' +
        'OTA)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  DATA = :OLD_DATA')
    Left = 656
    Top = 159
  end
  object Ds: TwwDataSource
    DataSet = Qry
    Left = 718
    Top = 156
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RG.IDREGRA, RG.NOMEREGRA'
      'FROM REGRA RG, TIPOREGRA TR, GRUPOREGRA GR'
      'WHERE RG.IDTIPOREGRA = TR.IDTIPOREGRA AND'
      '      TR.IDGRUPOREGRA = GR.IDGRUPOREGRA AND'
      '      TR.IDTIPOREGRA = :IDTIPOREGRA'
      'ORDER BY NOMEREGRA'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 369
    Top = 263
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOREGRA'
        ParamType = ptInput
      end>
    object qryRegraNOMEREGRA: TStringField
      DisplayLabel = 'Nome da Regra'
      DisplayWidth = 60
      FieldName = 'NOMEREGRA'
      Origin = 'BASEDADOS.REGRA.NOMEREGRA'
      Size = 60
    end
    object qryRegraIDREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.REGRA.IDREGRA'
      Visible = False
    end
  end
  object qryRegraJur: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RG.IDREGRA, RG.NOMEREGRA'
      'FROM REGRA RG, TIPOREGRA TR, GRUPOREGRA GR'
      'WHERE RG.IDTIPOREGRA = TR.IDTIPOREGRA AND'
      '      TR.IDGRUPOREGRA = GR.IDGRUPOREGRA AND'
      '      TR.IDTIPOREGRA = :IDTIPOREGRA'
      'ORDER BY NOMEREGRA'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 369
    Top = 311
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOREGRA'
        ParamType = ptInput
      end>
    object qryRegraJurIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.REGRA.IDREGRA'
    end
    object qryRegraJurNOMEREGRA: TStringField
      FieldName = 'NOMEREGRA'
      Origin = 'BASEDADOS.REGRA.NOMEREGRA'
      Size = 60
    end
  end
  object regRentabilidade: TRegra
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 292
    Top = 65531
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 369
    Top = 358
  end
  object QryPatroPlanPrevContab: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO,'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE'
      '   (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 373
    Top = 160
    object QryPatroPlanPrevContabPLANPRVCONTABPATRO: TStringField
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.NOME'
      Size = 113
    end
    object QryPatroPlanPrevContabIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.PLANPREVCONTABPATRO.IDPLANPREVCTBPATR'
      Visible = False
    end
    object QryPatroPlanPrevContabIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVCONTABPATRO.IDPLANOPREV'
      Visible = False
    end
    object QryPatroPlanPrevContabIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.PLANPREVCONTABPATRO.IDPATRO'
      Visible = False
    end
  end
end
