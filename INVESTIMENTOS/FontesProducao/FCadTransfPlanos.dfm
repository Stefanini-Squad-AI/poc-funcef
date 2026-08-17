inherited frmCadTransfPlanos: TfrmCadTransfPlanos
  Left = 283
  Top = 206
  HelpContext = 790210
  Caption = 'Operação'
  ClientHeight = 498
  ClientWidth = 728
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 728
    Height = 412
    inherited Bevel2: TBevel
      Width = 726
    end
    inherited pnlTitulo: TPanel
      Width = 726
      inherited lbNomItem: TfcLabel
        Width = 272
        Caption = 'Transferência entre Planos'
      end
    end
    object pnlDetalhe: TPanel
      Left = 1
      Top = 86
      Width = 726
      Height = 325
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object pnlObs: TPanel
        Left = 561
        Top = 2
        Width = 163
        Height = 321
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvNone
        TabOrder = 0
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 161
          Height = 27
          Align = alTop
          BevelInner = bvLowered
          BevelOuter = bvNone
          Caption = 'Observação'
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object memoObs: TMemo
          Left = 1
          Top = 28
          Width = 161
          Height = 292
          Align = alClient
          TabOrder = 1
        end
      end
      object pnlOrigDest: TPanel
        Left = 2
        Top = 2
        Width = 559
        Height = 321
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 1
        object pnlOrigem: TPanel
          Left = 2
          Top = 2
          Width = 555
          Height = 191
          Align = alTop
          TabOrder = 0
          object pnlTitOrigem: TPanel
            Left = 1
            Top = 1
            Width = 553
            Height = 26
            Align = alTop
            BevelInner = bvLowered
            Caption = 'Origem'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object pnlOrigemGeral: TPanel
            Left = 1
            Top = 27
            Width = 553
            Height = 163
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Enabled = False
            TabOrder = 1
            object lblFundoOrigem: TLabel
              Left = 11
              Top = 6
              Width = 130
              Height = 13
              Caption = 'Fundo de Investimento'
            end
            object lblTipFndOrigem: TLabel
              Left = 11
              Top = 46
              Width = 83
              Height = 13
              Caption = 'Tipo de Fundo'
            end
            object lblPlanOrigem: TLabel
              Left = 252
              Top = 47
              Width = 126
              Height = 13
              Caption = 'Plano / Patrocinadora'
            end
            object lblVlrApliOrigem: TLabel
              Left = 252
              Top = 86
              Width = 83
              Height = 13
              Caption = 'Valor Aplicado'
            end
            object lblVlrIOFOrigem: TLabel
              Left = 416
              Top = 86
              Width = 21
              Height = 13
              Caption = 'IOF'
            end
            object lblVlrIRRFOrigem: TLabel
              Left = 11
              Top = 125
              Width = 30
              Height = 13
              Caption = 'IRRF'
            end
            object lblVlrCota: TLabel
              Left = 114
              Top = 125
              Width = 78
              Height = 13
              Caption = 'Valor da Cota'
            end
            object lblQtdOrigem: TLabel
              Left = 252
              Top = 125
              Width = 66
              Height = 13
              Caption = 'Quantidade'
            end
            object lblSaldoOrigem: TLabel
              Left = 416
              Top = 125
              Width = 33
              Height = 13
              Caption = 'Saldo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblDtAplicacaoOrigem: TLabel
              Left = 11
              Top = 86
              Width = 88
              Height = 13
              Caption = 'Data Aplicação'
            end
            object lblPreco: TLabel
              Left = 114
              Top = 86
              Width = 105
              Height = 13
              Caption = 'Cota da Aplicação'
            end
            object dbeVlrAplicado: TDBRealEdit
              Left = 582
              Top = 101
              Width = 135
              Height = 21
              Alignment = taRightJustify
              Color = clBtnFace
              Lines.Strings = (
                '      0,00')
              TabOrder = 12
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object dbeVlrCusto: TDBRealEdit
              Left = 582
              Top = 77
              Width = 135
              Height = 21
              Alignment = taRightJustify
              Color = clBtnFace
              Lines.Strings = (
                '      0,00')
              TabOrder = 8
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object dblFundoOrigem: TwwDBLookupCombo
              Left = 11
              Top = 21
              Width = 449
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCFUNDOINVEST'#9'40'#9'Descrição'#9'F')
              LookupTable = QryFundoOrigem
              LookupField = 'IDFUNDOINVEST'
              Options = [loColLines, loRowLines, loTitles]
              Color = clBtnFace
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = dblFundoOrigemCloseUp
            end
            object dblTipoFundoOrigem: TwwDBLookupCombo
              Left = 11
              Top = 61
              Width = 215
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPOFUNDOINV'#9'25'#9'Descrição'#9'F')
              LookupTable = QryTipoFundoOrigem
              LookupField = 'IDTIPOFUNDOINVEST'
              Options = [loColLines, loRowLines, loTitles]
              Color = clBtnFace
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = dblTipoFundoOrigemCloseUp
            end
            object lblPlanoOrigem: TStaticText
              Left = 252
              Top = 62
              Width = 283
              Height = 20
              AutoSize = False
              BorderStyle = sbsSunken
              Caption = 'Plano'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 2
            end
            object dbeVlrAplicOrigem: TDBRealEdit
              Left = 252
              Top = 100
              Width = 135
              Height = 21
              Alignment = taRightJustify
              Color = clBtnFace
              Lines.Strings = (
                '      0,00')
              TabOrder = 5
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object dbeVlrIOFOrigem: TDBRealEdit
              Left = 416
              Top = 100
              Width = 110
              Height = 21
              Alignment = taRightJustify
              Color = clBtnFace
              Lines.Strings = (
                '      0,00')
              TabOrder = 6
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object dbeVlrIRRFOrigem: TDBRealEdit
              Left = 11
              Top = 139
              Width = 100
              Height = 21
              Alignment = taRightJustify
              Color = clBtnFace
              Lines.Strings = (
                '      0,00')
              TabOrder = 7
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object dbeVlrcota: TDBRealEdit
              Left = 114
              Top = 139
              Width = 135
              Height = 21
              Alignment = taRightJustify
              Color = clBtnFace
              Lines.Strings = (
                '0,00000000')
              TabOrder = 9
              WordWrap = False
              IntDigits = 10
              DecDigits = 10
              NumberFormat = fNumber
              Signal = False
            end
            object dbeQtdOrigem: TDBRealEdit
              Left = 252
              Top = 139
              Width = 160
              Height = 21
              Alignment = taRightJustify
              Color = clBtnFace
              Lines.Strings = (
                '0,00000000')
              TabOrder = 10
              WordWrap = False
              IntDigits = 10
              DecDigits = 10
              NumberFormat = fNumber
              Signal = False
            end
            object dbeSaldoOrigem: TDBRealEdit
              Left = 416
              Top = 139
              Width = 130
              Height = 21
              Alignment = taRightJustify
              Color = clBtnFace
              Lines.Strings = (
                '      0,00')
              TabOrder = 11
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object dbDtaAplicacaoOrigem: TCMDateTimePicker
              Left = 11
              Top = 100
              Width = 100
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              Color = clBtnFace
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
              TabOrder = 3
              DisplayFormat = 'dd/mm/yyyy'
            end
            object dbeCotaAplicOrigem: TDBRealEdit
              Left = 114
              Top = 100
              Width = 135
              Height = 21
              Alignment = taRightJustify
              Color = clBtnFace
              Lines.Strings = (
                '  0,000000')
              TabOrder = 4
              WordWrap = False
              IntDigits = 10
              DecDigits = 10
              NumberFormat = fNumber
              Signal = False
            end
          end
        end
        object pnlDestino: TPanel
          Left = 2
          Top = 193
          Width = 555
          Height = 126
          Align = alClient
          TabOrder = 1
          object pnlDestinoGeral: TPanel
            Left = 1
            Top = 27
            Width = 553
            Height = 98
            Align = alClient
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Enabled = False
            TabOrder = 0
            object lblPlanDestino: TLabel
              Left = 10
              Top = 3
              Width = 126
              Height = 13
              Caption = 'Plano / Patrocinadora'
            end
            object lblPercentual: TLabel
              Left = 10
              Top = 43
              Width = 62
              Height = 13
              Caption = 'Percentual'
            end
            object lblQtdDestino: TLabel
              Left = 87
              Top = 43
              Width = 66
              Height = 13
              Caption = 'Quantidade'
            end
            object lblVlrDestino: TLabel
              Left = 252
              Top = 43
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object dblPlanoDestino: TwwDBLookupCombo
              Left = 10
              Top = 17
              Width = 314
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'PLANPRVCONTABPATRO'#9'40'#9'Plano / Patrocinadora'#9'F')
              LookupTable = qryPlanoDestino
              LookupField = 'IDPLANPREVCTBPATR'
              Options = [loColLines, loRowLines, loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object redtPercentual: TRealEdit
              Left = 10
              Top = 57
              Width = 74
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '100,0000')
              TabOrder = 1
              WordWrap = False
              OnExit = redtPercentualExit
              IntDigits = 10
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object redtQtdDestino: TRealEdit
              Left = 87
              Top = 57
              Width = 162
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,0000000000')
              TabOrder = 2
              WordWrap = False
              OnExit = redtQtdDestinoExit
              IntDigits = 15
              DecDigits = 10
              NumberFormat = fNumber
              Signal = False
            end
            object redtVlrDestino: TRealEdit
              Left = 252
              Top = 57
              Width = 130
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 3
              WordWrap = False
              OnExit = redtVlrDestinoExit
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
          end
          object pnlTitDestino: TPanel
            Left = 1
            Top = 1
            Width = 553
            Height = 26
            Align = alTop
            BevelInner = bvLowered
            Caption = 'Destino'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
      end
    end
    object pnlDataTransf: TPanel
      Left = 1
      Top = 45
      Width = 726
      Height = 41
      Align = alTop
      TabOrder = 2
      object lblDataTransf: TLabel
        Left = 10
        Top = 3
        Width = 128
        Height = 13
        Caption = 'Data de Transferência'
      end
      object lblTipoCota: TLabel
        Left = 151
        Top = 3
        Width = 74
        Height = 13
        Caption = 'Tipo de Cota'
        Visible = False
      end
      object dbDtaTransf: TCMDateTimePicker
        Left = 10
        Top = 17
        Width = 108
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
        DisplayFormat = 'DD/MM/YYYY'
        OnExit = dbDtaTransfExit
      end
      object dblkTipoCota: TwwDBLookupCombo
        Left = 151
        Top = 17
        Width = 258
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOCOTA'#9'20'#9'Descrição'#9'F')
        LookupTable = QryTipoCota
        LookupField = 'IDTIPOCOTA'
        Options = [loColLines, loRowLines]
        TabOrder = 1
        Visible = False
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblkTipoCotaCloseUp
        OnExit = dblkTipoCotaExit
      end
    end
  end
  inherited Dock972: TDock97
    Width = 728
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      object sbtnBuscaSaldos: TToolbarButton97
        Left = 240
        Top = 0
        Width = 84
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Busca Saldo'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 3
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        WordWrap = True
        OnClick = sbtnBuscaSaldosClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 459
    Width = 728
    inherited tb97Fundo: TToolbar97
      Left = 556
      DockPos = 690
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 387
      DockPos = 521
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 480
    Top = 10
    TargetsData = (
      1
      5
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 86
    Top = 46
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOFUNDO'
      'set'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDPEDIDOFUNDO = :IDPEDIDOFUNDO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO,'
      '  QTDOPERACAO = :QTDOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  VLRCOTA = :VLRCOTA,'
      '  VLRIR = :VLRIR,'
      '  VLRIOF = :VLRIOF,'
      '  VLRRENDIMENTO = :VLRRENDIMENTO,'
      '  STACONFIRMA = :STACONFIRMA,'
      '  IDOPERACAOORIGEM = :IDOPERACAOORIGEM,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  DATACOTIZACAO = :DATACOTIZACAO,'
      '  VLRDESCONTO = :VLRDESCONTO,'
      '  IDCOMPOSICAOFUNDO = :IDCOMPOSICAOFUNDO,'
      '  STAESPECIFICADO = :STAESPECIFICADO,'
      '  VLRCOLOCACAO = :VLRCOLOCACAO,'
      '  VLRTAXAS = :VLRTAXAS,'
      '  VLRCORRETAGEM = :VLRCORRETAGEM,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  PLANO = :PLANO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  IDOPERACAODIREITO = :IDOPERACAODIREITO,'
      '  QTDUSUFRUTO = :QTDUSUFRUTO,'
      '  IDTIPOCOTA = :IDTIPOCOTA,'
      '  IDCOTAINTEGRALIZA = :IDCOTAINTEGRALIZA'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    InsertSQL.Strings = (
      'insert into OPERACAOFUNDO'
      
        '  (IDOPERACAOFUNDO, IDCARTEIRAINVEST, IDPEDIDOFUNDO, IDTIPOINVES' +
        'T, '
      'IDTIPOOPERACAO, '
      '   IDFUNDOINVEST, DATAOPERACAO, DATALIQUIDACAO, QTDOPERACAO, '
      'VLROPERACAO, '
      '   VLRCOTA, VLRIR, VLRIOF, VLRRENDIMENTO, STACONFIRMA, '
      'IDOPERACAOORIGEM, '
      '   IDPLANPREVCTBPATR, DATACOTIZACAO, VLRDESCONTO, '
      'IDCOMPOSICAOFUNDO, STAESPECIFICADO, '
      '   VLRCOLOCACAO, VLRTAXAS, VLRCORRETAGEM, OBSERVACAO, PLANO, '
      'PLNCODIGO, '
      '   CODDOCUMENTO, IDOPERACAODIREITO, QTDUSUFRUTO, IDTIPOCOTA, '
      'IDCOTAINTEGRALIZA)'
      'values'
      '  (:IDOPERACAOFUNDO, :IDCARTEIRAINVEST, :IDPEDIDOFUNDO, '
      ':IDTIPOINVEST, '
      
        '   :IDTIPOOPERACAO, :IDFUNDOINVEST, :DATAOPERACAO, :DATALIQUIDAC' +
        'AO, '
      ':QTDOPERACAO, '
      '   :VLROPERACAO, :VLRCOTA, :VLRIR, :VLRIOF, :VLRRENDIMENTO, '
      ':STACONFIRMA, '
      '   :IDOPERACAOORIGEM, :IDPLANPREVCTBPATR, :DATACOTIZACAO, '
      ':VLRDESCONTO, '
      
        '   :IDCOMPOSICAOFUNDO, :STAESPECIFICADO, :VLRCOLOCACAO, :VLRTAXA' +
        'S, '
      ':VLRCORRETAGEM, '
      '   :OBSERVACAO, :PLANO, :PLNCODIGO, :CODDOCUMENTO, '
      ':IDOPERACAODIREITO, '
      '   :QTDUSUFRUTO, :IDTIPOCOTA, :IDCOTAINTEGRALIZA)')
    DeleteSQL.Strings = (
      'delete from OPERACAOFUNDO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    Left = 122
    Top = 46
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'OPERACAOFUNDO.DATAOPERACAO'
      'FUNDOINVEST.DESCFUNDOINVEST'
      'TIPOFUNDOINVEST.DESCTIPOFUNDOINV'
      'OPERACAOFUNDO.QTDOPERACAO'
      'OPERACAOFUNDO.VLROPERACAO'
      'TIPOCOTA.DESCTIPOCOTA')
    TipodeDado.Strings = (
      'D'
      'C'
      'C'
      'N'
      'N'
      'C')
    Descricao.Strings = (
      'Operação'
      'Nome do Fundo'
      'Tipo de Fundo'
      'Quantidade da Operação'
      'Valor da Operação'
      'Tipo de Cota')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FUNDOINVEST'
      'TIPOFUNDOINVEST'
      'TIPOOPERACAO'
      'OPERACAOFUNDO'
      'TIPOCOTA')
    CamposChave.Strings = (
      'OPERACAOFUNDO.IDOPERACAOFUNDO'
      'OPERACAOFUNDO.DATAOPERACAO'
      'OPERACAOFUNDO.QTDOPERACAO'
      'OPERACAOFUNDO.VLROPERACAO'
      'OPERACAOFUNDO.VLRCOTA'
      'OPERACAOFUNDO.OBSERVACAO'
      'TIPOFUNDOINVEST.DESCTIPOFUNDOINV'
      'FUNDOINVEST.DESCFUNDOINVEST'
      'FUNDOINVEST.IDFUNDOINVEST'
      'TIPOFUNDOINVEST.IDTIPOFUNDOINVEST'
      'TIPOFUNDOINVEST.DATAULTFECH'
      'FUNDOINVEST.DTAINIPROC'
      'OPERACAOFUNDO.IDOPERACAOORIGEM'
      'OPERACAOFUNDO.VLRIR'
      'OPERACAOFUNDO.VLRIOF'
      'TIPOCOTA.DESCTIPOCOTA')
    Filtro.Strings = (
      'OPERACAOFUNDO.IDTIPOOPERACAO    = -107'
      'TIPOFUNDOINVEST.IDTIPOINVEST    = OPERACAOFUNDO.IDTIPOINVEST'
      
        'FUNDOINVEST.IDTIPOFUNDOINVEST   = TIPOFUNDOINVEST.IDTIPOFUNDOINV' +
        'EST'
      'FUNDOINVEST.IDFUNDOINVEST       = OPERACAOFUNDO.IDFUNDOINVEST'
      'TIPOOPERACAO.IDTIPOINVEST       = OPERACAOFUNDO.IDTIPOINVEST'
      'TIPOOPERACAO.IDTIPOOPERACAO     = OPERACAOFUNDO.IDTIPOOPERACAO'
      'TIPOCOTA.IDTIPOCOTA(+)          = OPERACAOFUNDO.IDTIPOCOTA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '###,###,###,##0.000000000'
      '###,###,###,##0.00'
      '')
    Larguras.Strings = (
      '10'
      '40'
      '20'
      '18'
      '18'
      '20')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    UsaDistinct = True
    Left = 373
    Top = 10
  end
  inherited ImlPadrao: TImageList
    Left = 457
    Top = 10
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 444
    Top = 10
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT *'
      'FROM  OPERACAOFUNDO'
      'WHERE IDOPERACAOFUNDO = :IDOPERACAOFUNDO')
    Left = 50
    Top = 46
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptInput
      end>
    object qryIDOPERACAOFUNDO: TFloatField
      FieldName = 'IDOPERACAOFUNDO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDOPERACAOFUNDO'
    end
    object qryIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDCARTEIRAINVEST'
    end
    object qryIDPEDIDOFUNDO: TFloatField
      FieldName = 'IDPEDIDOFUNDO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDPEDIDOFUNDO'
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDTIPOINVEST'
    end
    object qryIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDTIPOOPERACAO'
    end
    object qryIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDFUNDOINVEST'
    end
    object qryDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.DATAOPERACAO'
    end
    object qryDATALIQUIDACAO: TDateTimeField
      FieldName = 'DATALIQUIDACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.DATALIQUIDACAO'
    end
    object qryQTDOPERACAO: TFloatField
      FieldName = 'QTDOPERACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.QTDOPERACAO'
    end
    object qryVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLROPERACAO'
    end
    object qryVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRCOTA'
    end
    object qryVLRIR: TFloatField
      FieldName = 'VLRIR'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRIR'
    end
    object qryVLRIOF: TFloatField
      FieldName = 'VLRIOF'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRIOF'
    end
    object qryVLRRENDIMENTO: TFloatField
      FieldName = 'VLRRENDIMENTO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRRENDIMENTO'
    end
    object qrySTACONFIRMA: TStringField
      FieldName = 'STACONFIRMA'
      Origin = 'BASEDADOS.OPERACAOFUNDO.STACONFIRMA'
      FixedChar = True
      Size = 1
    end
    object qryIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDOPERACAOORIGEM'
    end
    object qryIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDPLANPREVCTBPATR'
    end
    object qryDATACOTIZACAO: TDateTimeField
      FieldName = 'DATACOTIZACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.DATACOTIZACAO'
    end
    object qryVLRDESCONTO: TFloatField
      FieldName = 'VLRDESCONTO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRDESCONTO'
    end
    object qryIDCOMPOSICAOFUNDO: TFloatField
      FieldName = 'IDCOMPOSICAOFUNDO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDCOMPOSICAOFUNDO'
    end
    object qrySTAESPECIFICADO: TStringField
      FieldName = 'STAESPECIFICADO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.STAESPECIFICADO'
      FixedChar = True
      Size = 1
    end
    object qryVLRCOLOCACAO: TFloatField
      FieldName = 'VLRCOLOCACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRCOLOCACAO'
    end
    object qryVLRTAXAS: TFloatField
      FieldName = 'VLRTAXAS'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRTAXAS'
    end
    object qryVLRCORRETAGEM: TFloatField
      FieldName = 'VLRCORRETAGEM'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRCORRETAGEM'
    end
    object qryOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.OBSERVACAO'
      BlobType = ftMemo
      Size = 300
    end
    object qryPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.PLANO'
    end
    object qryPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.PLNCODIGO'
    end
    object qryCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.CODDOCUMENTO'
    end
    object qryIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDOPERACAODIREITO'
    end
    object qryQTDUSUFRUTO: TFloatField
      FieldName = 'QTDUSUFRUTO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.QTDUSUFRUTO'
    end
    object qryIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDTIPOCOTA'
    end
    object qryIDCOTAINTEGRALIZA: TFloatField
      FieldName = 'IDCOTAINTEGRALIZA'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDCOTAINTEGRALIZA'
    end
    object qryTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.TRGDTINCLUSAO'
    end
    object qryTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.TRGUSERINCLUSAO'
      Size = 30
    end
  end
  object QryTipoFundoOrigem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM TIPOFUNDOINVEST'
      'WHERE IDTIPOINVEST = :IDTIPOINVEST'
      'ORDER BY DESCTIPOFUNDOINV'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 185
    Top = 139
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
    object QryTipoFundoOrigemDESCTIPOFUNDOINV: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 25
      FieldName = 'DESCTIPOFUNDOINV'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.DESCTIPOFUNDOINV'
      Size = 80
    end
    object QryTipoFundoOrigemIDTIPOFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryTipoFundoOrigemIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.IDTIPOINVEST'
      Visible = False
    end
    object QryTipoFundoOrigemDATAULTFECH: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAULTFECH'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.DATAULTFECH'
      Visible = False
    end
  end
  object QryFundoOrigem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM FUNDOINVEST FUN, TIPOFUNDOINVEST TFI'
      'WHERE (FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST) AND'
      
        '      ((:IDTIPOFUNDOINVEST IS NULL) OR (FUN.IDTIPOFUNDOINVEST = ' +
        ':IDTIPOFUNDOINVEST)) AND'
      
        '      ((:IDFUNDOINVEST IS NULL)     OR (FUN.IDFUNDOINVEST = :IDF' +
        'UNDOINVEST)) AND'
      
        '      ((:IDTIPOINVEST IS NULL)     OR (TFI.IDTIPOINVEST = :IDTIP' +
        'OINVEST))'
      'ORDER BY DESCFUNDOINVEST')
    ValidateWithMask = True
    Left = 184
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
    object QryFundoOrigemDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoOrigemIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
    object QryFundoOrigemIDGESTORCARTEIRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'BASEDADOS.FUNDOINVEST.IDGESTORCARTEIRA'
      Visible = False
    end
    object QryFundoOrigemTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FUNDOINVEST.TRGDTINCLUSAO'
      Visible = False
    end
    object QryFundoOrigemTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FUNDOINVEST.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object QryFundoOrigemMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.FUNDOINVEST.MOECODIGO'
      Visible = False
    end
    object QryFundoOrigemIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object QryFundoOrigemIDTIPOFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryFundoOrigemCNPJFUNDO: TStringField
      DisplayWidth = 25
      FieldName = 'CNPJFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object QryFundoOrigemSTAEXCLUSIVO: TStringField
      DisplayWidth = 1
      FieldName = 'STAEXCLUSIVO'
      Origin = 'BASEDADOS.FUNDOINVEST.STAEXCLUSIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoOrigemPZOCARENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOCARENCIA'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOCARENCIA'
      Visible = False
    end
    object QryFundoOrigemPZOANIVERSARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOANIVERSARIO'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOANIVERSARIO'
      Visible = False
    end
    object QryFundoOrigemPZOLIQAPLIC: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOLIQAPLIC'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOLIQAPLIC'
      Visible = False
    end
    object QryFundoOrigemPZOLIQRESG: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOLIQRESG'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOLIQRESG'
      Visible = False
    end
    object QryFundoOrigemQTDDECQTD: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECQTD'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECQTD'
      Visible = False
    end
    object QryFundoOrigemQTDDECVALOR: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECVALOR'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECVALOR'
      Visible = False
    end
    object QryFundoOrigemSTAFUNDO: TStringField
      DisplayWidth = 1
      FieldName = 'STAFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.STAFUNDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoOrigemPZOAMORTIZACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOAMORTIZACAO'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOAMORTIZACAO'
      Visible = False
    end
    object QryFundoOrigemPERCTXPERFORM: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCTXPERFORM'
      Origin = 'BASEDADOS.FUNDOINVEST.PERCTXPERFORM'
      Visible = False
    end
    object QryFundoOrigemPERCTXADM: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCTXADM'
      Origin = 'BASEDADOS.FUNDOINVEST.PERCTXADM'
      Visible = False
    end
    object QryFundoOrigemCODFUNCETIP: TStringField
      DisplayWidth = 30
      FieldName = 'CODFUNCETIP'
      Origin = 'BASEDADOS.FUNDOINVEST.CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object QryFundoOrigemSTAPROVISIONAIR: TStringField
      DisplayWidth = 1
      FieldName = 'STAPROVISIONAIR'
      Origin = 'BASEDADOS.FUNDOINVEST.STAPROVISIONAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoOrigemSTAPROVISIONAIOF: TStringField
      DisplayWidth = 1
      FieldName = 'STAPROVISIONAIOF'
      Origin = 'BASEDADOS.FUNDOINVEST.STAPROVISIONAIOF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoOrigemCONTRCETIP: TStringField
      DisplayWidth = 30
      FieldName = 'CONTRCETIP'
      Origin = 'BASEDADOS.FUNDOINVEST.CONTRCETIP'
      Visible = False
      Size = 30
    end
    object QryFundoOrigemIDCATEGORIAFUNDO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCATEGORIAFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.IDCATEGORIAFUNDO'
      Visible = False
    end
    object QryFundoOrigemDATAINICIOFUNDO: TDateTimeField
      FieldName = 'DATAINICIOFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.DATAINICIOFUNDO'
    end
    object QryFundoOrigemPZOCOTAPLIC: TFloatField
      FieldName = 'PZOCOTAPLIC'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOCOTAPLIC'
    end
    object QryFundoOrigemPZOCOTRESG: TFloatField
      FieldName = 'PZOCOTRESG'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOCOTRESG'
    end
    object QryFundoOrigemDATACOTIZACAO: TDateTimeField
      FieldName = 'DATACOTIZACAO'
      Origin = 'BASEDADOS.FUNDOINVEST.DATACOTIZACAO'
    end
    object QryFundoOrigemIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.FUNDOINVEST.IDREGRA'
    end
    object QryFundoOrigemVLRCOTAINICIAL: TFloatField
      FieldName = 'VLRCOTAINICIAL'
      Origin = 'BASEDADOS.FUNDOINVEST.VLRCOTAINICIAL'
    end
    object QryFundoOrigemMOECORCOTA: TFloatField
      FieldName = 'MOECORCOTA'
      Origin = 'BASEDADOS.FUNDOINVEST.MOECORCOTA'
    end
    object QryFundoOrigemSTAVERCOTA: TStringField
      FieldName = 'STAVERCOTA'
      Origin = 'BASEDADOS.FUNDOINVEST.STAVERCOTA'
      FixedChar = True
      Size = 1
    end
    object QryFundoOrigemDATAINIAPLIC: TDateTimeField
      FieldName = 'DATAINIAPLIC'
      Origin = 'BASEDADOS.FUNDOINVEST.DATAINIAPLIC'
    end
    object QryFundoOrigemDTAVIGENCIA: TDateTimeField
      FieldName = 'DTAVIGENCIA'
      Origin = 'BASEDADOS.FUNDOINVEST.DTAVIGENCIA'
    end
    object QryFundoOrigemIDCARTEIRASPC: TFloatField
      FieldName = 'IDCARTEIRASPC'
      Origin = 'BASEDADOS.FUNDOINVEST.IDCARTEIRASPC'
    end
    object QryFundoOrigemDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
      Origin = 'BASEDADOS.FUNDOINVEST.DTAINIPROC'
    end
    object QryFundoOrigemQTDTOTINTEGRALIZA: TFloatField
      FieldName = 'QTDTOTINTEGRALIZA'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDTOTINTEGRALIZA'
    end
    object QryFundoOrigemIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
      Origin = 'BASEDADOS.FUNDOINVEST.IDTIPOCOTA'
    end
    object QryFundoOrigemIDCLASSIFANBID: TFloatField
      FieldName = 'IDCLASSIFANBID'
      Origin = 'BASEDADOS.FUNDOINVEST.IDCLASSIFANBID'
    end
    object QryFundoOrigemIDADMFDOINVEST: TFloatField
      FieldName = 'IDADMFDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDADMFDOINVEST'
    end
    object QryFundoOrigemIDTIPOFUNDOINVEST_1: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST_1'
      Origin = 'BASEDADOS.FUNDOINVEST.IDADMFDOINVEST'
    end
    object QryFundoOrigemIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDADMFDOINVEST'
    end
    object QryFundoOrigemDESCTIPOFUNDOINV: TStringField
      FieldName = 'DESCTIPOFUNDOINV'
      Origin = 'BASEDADOS.FUNDOINVEST.IDADMFDOINVEST'
      Size = 80
    end
    object QryFundoOrigemDATAULTFECH: TDateTimeField
      FieldName = 'DATAULTFECH'
      Origin = 'BASEDADOS.FUNDOINVEST.IDADMFDOINVEST'
    end
    object QryFundoOrigemTRGDTINCLUSAO_1: TDateTimeField
      FieldName = 'TRGDTINCLUSAO_1'
      Origin = 'BASEDADOS.FUNDOINVEST.IDADMFDOINVEST'
    end
    object QryFundoOrigemTRGUSERINCLUSAO_1: TStringField
      FieldName = 'TRGUSERINCLUSAO_1'
      Origin = 'BASEDADOS.FUNDOINVEST.IDADMFDOINVEST'
      Size = 30
    end
  end
  object QryTipoOperTransf: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '    IDTIPOOPERACAO,DESCTIPOOPERACAO,NATUREZAOPERACAO,'
      '    FLGTRATAIR, IDMERCADO'
      'FROM'
      '    TIPOOPERACAO'
      'WHERE'
      '    IDTIPOOPERACAO = :IDTIPOOPERACAO'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 86
    Top = 382
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
    object QryTipoOperTransfIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object QryTipoOperTransfDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryTipoOperTransfNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperTransfFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      FixedChar = True
      Size = 1
    end
    object QryTipoOperTransfIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
    end
  end
  object QryCotaFundo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    VLRCOTA'
      'FROM'
      '    COTAFUNDO'
      'WHERE'
      '    (IDFUNDOINVEST = :IDFUNDOINVEST) AND'
      '    (DATACOTA  = :DATACOTA)')
    UpdateObject = updCotaFundo
    ValidateWithMask = True
    Left = 354
    Top = 382
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
        Value = Null
      end
      item
        DataType = ftDateTime
        Name = 'DATACOTA'
        ParamType = ptResult
        Value = Null
      end>
    object QryCotaFundoVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
    end
  end
  object updCotaFundo: TUpdateSQL
    Left = 427
    Top = 382
  end
  object dsCotaFundo: TwwDataSource
    AutoEdit = False
    DataSet = QryCotaFundo
    Left = 667
    Top = 270
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 266
    Top = 385
  end
  object qryPlanoDestino: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO,'
      '   PL.NOME AS PLANO,'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE'
      '   (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV) AND'
      '   (IDPLANPREVCTBPATR <> :IDPLANPREVCTBPATR)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 183
    Top = 385
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end>
  end
  object MSBuscaSaldos: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'HISTFUNDO.DATAAPLICACAO'
      'HISTFUNDO.SALDOQTDCOTAS'
      'HISTFUNDO.SALDOVLRFUNDO'
      'HISTFUNDO.SALDOQTDCOTASBLQ'
      'FUNDOINVEST.DESCFUNDOINVEST'
      'TIPOFUNDOINVEST.DESCTIPOFUNDOINV'
      'HISTFUNDO.VLRIRPROV'
      'HISTFUNDO.VLRIOFPROV')
    TipodeDado.Strings = (
      'D'
      'N'
      'N'
      'N'
      'C'
      'C'
      'N'
      'N')
    Descricao.Strings = (
      'Dt. Aplicação'
      'Quantidade'
      'Financeiro'
      'Quantidade Bloqueadas'
      'Fundo de Investimento'
      'Tipo de Fundo'
      'IRRF'
      'IOF')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'HISTFUNDO'
      'COTAFUNDO'
      'FUNDOINVEST'
      'TIPOFUNDOINVEST')
    CamposChave.Strings = (
      'HISTFUNDO.IDHISTFUNDO'
      'HISTFUNDO.IDTIPOINVEST'
      'HISTFUNDO.IDCARTEIRAINVEST'
      'HISTFUNDO.DATAAPLICACAO'
      'HISTFUNDO.SALDOQTDCOTAS'
      'HISTFUNDO.IDPLANPREVCTBPATR'
      'HISTFUNDO.COTAAPLICACAO'
      'HISTFUNDO.IDOPERACAOFUNDO'
      'HISTFUNDO.DATAULTPGTOIR'
      'HISTFUNDO.IDFUNDOINVEST'
      
        'ROUND(HISTFUNDO.SALDOQTDCOTAS * COTAFUNDO.VLRCOTA,2) AS VLRAPLIC' +
        'ADO'
      'HISTFUNDO.SALDOVLRFUNDO'
      'COTAFUNDO.VLRCOTA'
      'HISTFUNDO.VLRCUSTOATUAL'
      'HISTFUNDO.VLRAPLICADO'
      'HISTFUNDO.DATAMOVFUNDO'
      'TIPOFUNDOINVEST.IDTIPOFUNDOINVEST'
      'FUNDOINVEST.DESCFUNDOINVEST'
      'TIPOFUNDOINVEST.DESCTIPOFUNDOINV'
      'HISTFUNDO.IDHISTFUNDO'
      'HISTFUNDO.VLRIRPROV'
      'HISTFUNDO.VLRIOFPROV'
      'HISTFUNDO.VLRVARIACAO'
      'HISTFUNDO.DATAULTPGTOIR'
      'NVL(HISTFUNDO.SALDOQTDCOTASBLQ,0)')
    Filtro.Strings = (
      'COTAFUNDO.IDFUNDOINVEST = HISTFUNDO.IDFUNDOINVEST'
      'COTAFUNDO.DATACOTA = HISTFUNDO.DATAAPLICACAO'
      
        '(HISTFUNDO.IDTIPOINVEST NOT IN (9,10)) OR (COTAFUNDO.IDTIPOCOTA ' +
        '= HISTFUNDO.IDTIPOCOTA)'
      'FUNDOINVEST.IDFUNDOINVEST = HISTFUNDO.IDFUNDOINVEST'
      'TIPOFUNDOINVEST.IDTIPOINVEST = HISTFUNDO.IDTIPOINVEST'
      
        'TIPOFUNDOINVEST.IDTIPOFUNDOINVEST = FUNDOINVEST.IDTIPOFUNDOINVES' +
        'T')
    Mascaras.Strings = (
      ''
      '###,###,###,##0.000000000'
      '###,###,###,###,##0.00'
      '###,###,###,###,##0.000000'
      ''
      ''
      '###,###,###,##0.00'
      '###,###,###,##0.00')
    Larguras.Strings = (
      '13'
      '16'
      '16'
      '16'
      '45'
      '20'
      '16'
      '16')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
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
    Left = 376
    Top = 72
  end
  object qryBuscaOperDestino: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM OPERACAOFUNDO'
      'WHERE '
      '       (IDOPERACAOORIGEM = :IDOPERACAOFUNDO)'
      '   AND (IDTIPOOPERACAO   = -108)'
      '')
    ValidateWithMask = True
    Left = 186
    Top = 241
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptUnknown
      end>
    object qryBuscaOperDestinoIDOPERACAOFUNDO: TFloatField
      FieldName = 'IDOPERACAOFUNDO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDOPERACAOFUNDO'
    end
    object qryBuscaOperDestinoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDCARTEIRAINVEST'
    end
    object qryBuscaOperDestinoIDPEDIDOFUNDO: TFloatField
      FieldName = 'IDPEDIDOFUNDO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDPEDIDOFUNDO'
    end
    object qryBuscaOperDestinoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDTIPOINVEST'
    end
    object qryBuscaOperDestinoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDTIPOOPERACAO'
    end
    object qryBuscaOperDestinoIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDFUNDOINVEST'
    end
    object qryBuscaOperDestinoDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.DATAOPERACAO'
    end
    object qryBuscaOperDestinoDATALIQUIDACAO: TDateTimeField
      FieldName = 'DATALIQUIDACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.DATALIQUIDACAO'
    end
    object qryBuscaOperDestinoQTDOPERACAO: TFloatField
      FieldName = 'QTDOPERACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.QTDOPERACAO'
    end
    object qryBuscaOperDestinoVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLROPERACAO'
    end
    object qryBuscaOperDestinoVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRCOTA'
    end
    object qryBuscaOperDestinoVLRIR: TFloatField
      FieldName = 'VLRIR'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRIR'
    end
    object qryBuscaOperDestinoVLRIOF: TFloatField
      FieldName = 'VLRIOF'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRIOF'
    end
    object qryBuscaOperDestinoVLRRENDIMENTO: TFloatField
      FieldName = 'VLRRENDIMENTO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRRENDIMENTO'
    end
    object qryBuscaOperDestinoSTACONFIRMA: TStringField
      FieldName = 'STACONFIRMA'
      Origin = 'BASEDADOS.OPERACAOFUNDO.STACONFIRMA'
      FixedChar = True
      Size = 1
    end
    object qryBuscaOperDestinoIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDOPERACAOORIGEM'
    end
    object qryBuscaOperDestinoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDPLANPREVCTBPATR'
    end
    object qryBuscaOperDestinoDATACOTIZACAO: TDateTimeField
      FieldName = 'DATACOTIZACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.DATACOTIZACAO'
    end
    object qryBuscaOperDestinoVLRDESCONTO: TFloatField
      FieldName = 'VLRDESCONTO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRDESCONTO'
    end
    object qryBuscaOperDestinoIDCOMPOSICAOFUNDO: TFloatField
      FieldName = 'IDCOMPOSICAOFUNDO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDCOMPOSICAOFUNDO'
    end
    object qryBuscaOperDestinoSTAESPECIFICADO: TStringField
      FieldName = 'STAESPECIFICADO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.STAESPECIFICADO'
      FixedChar = True
      Size = 1
    end
    object qryBuscaOperDestinoVLRCOLOCACAO: TFloatField
      FieldName = 'VLRCOLOCACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRCOLOCACAO'
    end
    object qryBuscaOperDestinoVLRTAXAS: TFloatField
      FieldName = 'VLRTAXAS'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRTAXAS'
    end
    object qryBuscaOperDestinoVLRCORRETAGEM: TFloatField
      FieldName = 'VLRCORRETAGEM'
      Origin = 'BASEDADOS.OPERACAOFUNDO.VLRCORRETAGEM'
    end
    object qryBuscaOperDestinoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.TRGDTINCLUSAO'
    end
    object qryBuscaOperDestinoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryBuscaOperDestinoOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.OBSERVACAO'
      BlobType = ftMemo
      Size = 300
    end
    object qryBuscaOperDestinoPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.PLANO'
    end
    object qryBuscaOperDestinoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.PLNCODIGO'
    end
    object qryBuscaOperDestinoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.CODDOCUMENTO'
    end
    object qryBuscaOperDestinoIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDOPERACAODIREITO'
    end
    object qryBuscaOperDestinoQTDUSUFRUTO: TFloatField
      FieldName = 'QTDUSUFRUTO'
      Origin = 'BASEDADOS.OPERACAOFUNDO.QTDUSUFRUTO'
    end
    object qryBuscaOperDestinoIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDTIPOCOTA'
    end
    object qryBuscaOperDestinoIDCOTAINTEGRALIZA: TFloatField
      FieldName = 'IDCOTAINTEGRALIZA'
      Origin = 'BASEDADOS.OPERACAOFUNDO.IDCOTAINTEGRALIZA'
    end
  end
  object QryInsertCota: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO COTAFUNDO'
      '(IDCOTAFUNDO,   IDFUNDOINVEST,  DATACOTA,  VLRCOTA) VALUES'
      '(:IDCOTAFUNDO, :IDFUNDOINVEST, :DATACOTA, :VLRCOTA)'
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 674
    Top = 393
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCOTAFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATACOTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VLRCOTA'
        ParamType = ptInput
      end>
    object StringField11: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object FloatField16: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
    object FloatField17: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'FUNDOINVEST.IDGESTORCARTEIRA'
      Visible = False
    end
    object DateTimeField2: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'FUNDOINVEST.TRGDTINCLUSAO'
      Visible = False
    end
    object StringField12: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'FUNDOINVEST.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object FloatField18: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'FUNDOINVEST.MOECODIGO'
      Visible = False
    end
    object FloatField19: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'FUNDOINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object FloatField20: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
    object StringField13: TStringField
      DisplayWidth = 25
      FieldName = 'CNPJFUNDO'
      Origin = 'FUNDOINVEST.CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object StringField14: TStringField
      DisplayWidth = 1
      FieldName = 'STAEXCLUSIVO'
      Origin = 'FUNDOINVEST.STAEXCLUSIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object FloatField21: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOCARENCIA'
      Origin = 'FUNDOINVEST.PZOCARENCIA'
      Visible = False
    end
    object FloatField22: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOANIVERSARIO'
      Origin = 'FUNDOINVEST.PZOANIVERSARIO'
      Visible = False
    end
    object FloatField23: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOLIQAPLIC'
      Origin = 'FUNDOINVEST.PZOLIQAPLIC'
      Visible = False
    end
    object FloatField24: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOLIQRESG'
      Origin = 'FUNDOINVEST.PZOLIQRESG'
      Visible = False
    end
    object FloatField25: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECQTD'
      Origin = 'FUNDOINVEST.QTDDECQTD'
      Visible = False
    end
    object FloatField26: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECVALOR'
      Origin = 'FUNDOINVEST.QTDDECVALOR'
      Visible = False
    end
    object StringField15: TStringField
      DisplayWidth = 1
      FieldName = 'STAFUNDO'
      Origin = 'FUNDOINVEST.STAFUNDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object FloatField27: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOAMORTIZACAO'
      Origin = 'FUNDOINVEST.PZOAMORTIZACAO'
      Visible = False
    end
    object FloatField28: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCTXPERFORM'
      Origin = 'FUNDOINVEST.PERCTXPERFORM'
      Visible = False
    end
    object FloatField29: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCTXADM'
      Origin = 'FUNDOINVEST.PERCTXADM'
      Visible = False
    end
    object StringField16: TStringField
      DisplayWidth = 30
      FieldName = 'CODFUNCETIP'
      Origin = 'FUNDOINVEST.CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object StringField17: TStringField
      DisplayWidth = 1
      FieldName = 'STAPROVISIONAIR'
      Origin = 'FUNDOINVEST.STAPROVISIONAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField18: TStringField
      DisplayWidth = 1
      FieldName = 'STAPROVISIONAIOF'
      Origin = 'FUNDOINVEST.STAPROVISIONAIOF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField19: TStringField
      DisplayWidth = 30
      FieldName = 'CONTRCETIP'
      Origin = 'FUNDOINVEST.CONTRCETIP'
      Visible = False
      Size = 30
    end
    object FloatField30: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCATEGORIAFUNDO'
      Origin = 'FUNDOINVEST.IDCATEGORIAFUNDO'
      Visible = False
    end
  end
  object qryExcluiIRLitigio: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE'
      'FROM IRLITIGIO '
      
        'WHERE IDOPERACAOFUNDO IN (SELECT IDOPERACAOFUNDO FROM OPERACAOFU' +
        'NDO WHERE IDOPERACAOORIGEM = :IDOPERACAOFUNDO)'
      ' ')
    ValidateWithMask = True
    Left = 674
    Top = 334
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptResult
      end>
  end
  object QryTipoFundoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *  FROM TIPOFUNDOINVEST WHERE'
      ''
      'IDTIPOFUNDOINVEST =:IDTIPOFUNDOINVEST  ')
    ValidateWithMask = True
    Left = 322
    Top = 255
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryTipoCota: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCTIPOCOTA, IDTIPOCOTA FROM TIPOCOTA'
      'ORDER BY DESCTIPOCOTA')
    ValidateWithMask = True
    Left = 314
    Top = 161
  end
end
