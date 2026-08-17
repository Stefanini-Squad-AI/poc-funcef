inherited frmCadLancamentoFundo: TfrmCadLancamentoFundo
  Left = 306
  Top = 82
  HelpContext = 790204
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Operação'
  ClientHeight = 542
  ClientWidth = 792
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel [0]
    Left = 134
    Top = 301
    Width = 87
    Height = 13
    Caption = 'Prazo Carência'
  end
  inherited Dock972: TDock97 [1]
    Width = 792
    object Label1: TLabel [0]
      Left = 529
      Top = 1
      Width = 140
      Height = 13
      Caption = 'Disponibilidade de Caixa'
    end
    object lblTempo: TLabel [1]
      Left = 461
      Top = 1
      Width = 39
      Height = 13
      Caption = 'Tempo'
    end
    object lblMsg: TLabel [2]
      Left = 675
      Top = 20
      Width = 61
      Height = 13
      Caption = 'Mensagem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited Toolbar971: TToolbar97
      Left = 12
      DockPos = 12
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
      object sbtnMovimento: TToolbarButton97
        Left = 240
        Top = 0
        Width = 67
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Movimento'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555777555
          5555555555000757755555575500005007555570058880000075570870088078
          007555787887087777755550880FF0800007708080888F7088077088F0708F78
          88077000F0778080005555508F0008800755557878FF88777075570870080088
          0755557075888070755555575500075555555555557775555555}
        ImageIndex = 3
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = sbtnMovimentoClick
      end
      object sbtnGraficos: TToolbarButton97
        Left = 307
        Top = 0
        Width = 67
        Height = 41
        AllowAllUp = True
        DropdownMenu = PopMnuGrafico
        Caption = '&Gráficos'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333700073333333FFF3777773F3FFF00030990BB03
          000077737337F373777733309990BBB0333333373337F3373F3333099990BBBB
          033333733337F33373F337999990BBBBB73337F33337F33337F330999990BBBB
          B03337F33337FFFFF7F3309999900000003337F33337777777F33099990A0CCC
          C03337F3337373F337F3379990AAA0CCC733373F3733373F373333090AAAAA0C
          033333737333337373333330AAAAAAA033333FF73F33333733FF00330AAAAA03
          3000773373FFFF73377733333700073333333333377777333333333333333333
          3333333333333333333333333333333333333333333333333333}
        ImageIndex = 3
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
      end
      object sbtnSaldos: TToolbarButton97
        Left = 374
        Top = 0
        Width = 67
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        DropdownMenu = PopMnuSaldo
        Caption = '&Saldos'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
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
        ImageIndex = 3
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = bbtnConfirmarClick
      end
      object sbtnEspecificoFdo: TToolbarButton97
        Left = 441
        Top = 0
        Width = 67
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Especificar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
          FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
          990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
          990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
          FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
          00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
          00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
          00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
          03FF33337FFF77777333333300000333333F3333777773333333}
        ImageIndex = 3
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnDisponibilidadeClick
      end
    end
    object PnlDisp: TPanel
      Left = 529
      Top = 15
      Width = 141
      Height = 24
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = '0,00 '
      Color = 13041663
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = pmnuDisp
      TabOrder = 1
    end
    object RGAtualizaSaldo: TRadioGroup
      Left = 289
      Top = 1
      Width = 166
      Height = 39
      BiDiMode = bdLeftToRight
      Caption = 'Forma de Atualização:'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Manual '
        'Periódica')
      ParentBiDiMode = False
      TabOrder = 2
      OnClick = RGAtualizaSaldoClick
    end
    object cboOpcao: TComboBox
      Left = 460
      Top = 18
      Width = 64
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 3
      OnClick = cboOpcaoClick
      Items.Strings = (
        '5 min'
        '10 min'
        '15 min')
    end
    object bbtnCalcula: TBitBtn
      Left = 460
      Top = 15
      Width = 63
      Height = 23
      Caption = 'Atualizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = bbtnCalculaClick
    end
  end
  inherited pnlFundo: TPanel [2]
    Width = 792
    Height = 456
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 790
      Height = 36
      Align = alTop
      TabOrder = 3
      object lbNomItem: TfcLabel
        Left = 16
        Top = 6
        Width = 420
        Height = 24
        Caption = 'Lançamento de Fundos de Investimentos'
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
    object pnlDadosBase: TPanel
      Left = 1
      Top = 37
      Width = 790
      Height = 49
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 14
        Top = 6
        Width = 94
        Height = 13
        Caption = 'Data Referência'
      end
      object Label7: TLabel
        Left = 121
        Top = 6
        Width = 83
        Height = 13
        Caption = 'Tipo de Fundo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label33: TLabel
        Left = 350
        Top = 6
        Width = 38
        Height = 13
        Caption = 'Gestor'
      end
      object DtEdDataReferenciaGeral: TCMDateTimePicker
        Left = 14
        Top = 21
        Width = 100
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
        OnExit = DtEdDataReferenciaGeralExit
      end
      object DblTipoFundo: TwwDBLookupCombo
        Left = 121
        Top = 21
        Width = 224
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOFUNDOINV'#9'30'#9'Descrição'#9'F')
        LookupTable = QryTipoFundo
        LookupField = 'IDTIPOFUNDOINVEST'
        Options = [loRowLines]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = DblTipoFundoCloseUp
        OnExit = DblTipoFundoExit
      end
      object dblGestorCarteira: TwwDBLookupCombo
        Left = 350
        Top = 21
        Width = 344
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Descrição'#9'F')
        LookupTable = qryGestorCart
        LookupField = 'IDGESTORCARTEIRA'
        Options = [loRowLines]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblGestorCarteiraCloseUp
        OnEnter = dblGestorCarteiraEnter
        OnExit = dblGestorCarteiraExit
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 86
      Width = 790
      Height = 308
      Align = alClient
      TabOrder = 1
      object PgcSaldos: TPageControl
        Left = 1
        Top = 1
        Width = 788
        Height = 306
        ActivePage = TbsAplicacao
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MultiLine = True
        ParentFont = False
        TabOrder = 0
        OnChange = PgcSaldosChange
        object TbsAplicacao: TTabSheet
          Caption = '&Aplicação '
          object pgcAplicacaoGeral: TPageControl
            Left = 0
            Top = 0
            Width = 780
            Height = 278
            ActivePage = TbSheet
            Align = alClient
            TabOrder = 0
            object TbSheet: TTabSheet
              Caption = 'Informações Contábeis '
              TabVisible = False
              object DbGrdAplicacao: TwwDBGrid
                Left = 0
                Top = 31
                Width = 687
                Height = 237
                Selected.Strings = (
                  'DESCFUNDOINVEST'#9'22'#9'Fundo'
                  'CODFUNCETIP'#9'14'#9'CETIP'
                  'IDOPERACAOFUNDO'#9'7'#9'Boleta'
                  'DATAOPERACAO'#9'10'#9'Operação'
                  'DATACOTIZACAO'#9'10'#9'Cotização'
                  'DATALIQUIDACAO'#9'10'#9'Liquidação'
                  'VLROPERACAO'#9'15'#9'Valor Aplicado'
                  'USUARIO'#9'12'#9'Operador')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
                Align = alClient
                Color = clWhite
                DataSource = DsAplicacao
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                KeyOptions = []
                Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
                ParentFont = False
                TabOrder = 3
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
              object PnlAplicacao: TPanel
                Left = 0
                Top = 31
                Width = 687
                Height = 237
                Align = alClient
                BevelOuter = bvLowered
                TabOrder = 0
                object pgcAplicacao: TPageControl
                  Left = 1
                  Top = 1
                  Width = 685
                  Height = 235
                  ActivePage = tbsObsApl
                  Align = alClient
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  MultiLine = True
                  ParentFont = False
                  TabOrder = 0
                  TabPosition = tpRight
                  object tbsDadosApl: TTabSheet
                    Caption = 'Operação'
                    object Label25: TLabel
                      Left = 2
                      Top = 5
                      Width = 106
                      Height = 13
                      Caption = 'Data da Aplicação'
                    end
                    object Label17: TLabel
                      Left = 2
                      Top = 47
                      Width = 130
                      Height = 13
                      Caption = 'Fundo de Investimento'
                    end
                    object Label26: TLabel
                      Left = 2
                      Top = 88
                      Width = 112
                      Height = 13
                      Caption = 'Data da Liquidação'
                    end
                    object Label18: TLabel
                      Left = 2
                      Top = 128
                      Width = 83
                      Height = 13
                      Caption = 'Valor Aplicado'
                    end
                    object Label19: TLabel
                      Left = 452
                      Top = 88
                      Width = 84
                      Height = 13
                      Caption = 'Cota do Fundo'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clNavy
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label20: TLabel
                      Left = 452
                      Top = 128
                      Width = 118
                      Height = 13
                      Caption = 'Quantidade Operada'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clNavy
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label15: TLabel
                      Left = 131
                      Top = 88
                      Width = 106
                      Height = 13
                      Caption = 'Data da Cotização'
                    end
                    object Label27: TLabel
                      Left = 452
                      Top = 47
                      Width = 37
                      Height = 13
                      Caption = 'CETIP'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clNavy
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DbDtDataAplicacao: TCMDateTimePicker
                      Left = 2
                      Top = 20
                      Width = 110
                      Height = 21
                      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                      CalendarAttributes.Font.Color = clWindowText
                      CalendarAttributes.Font.Height = -11
                      CalendarAttributes.Font.Name = 'MS Sans Serif'
                      CalendarAttributes.Font.Style = []
                      ButtonStyle = cbsCustom
                      DataField = 'DATAOPERACAO'
                      DataSource = DsAplicacao
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
                      OnExit = DbDtDataAplicacaoExit
                    end
                    object DbLkcFundoInvest: TwwDBLookupCombo
                      Left = 2
                      Top = 61
                      Width = 427
                      Height = 21
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCFUNDOINVEST'#9'40'#9'Fundo de Investimento')
                      DataField = 'IDFUNDOINVEST'
                      DataSource = DsAplicacao
                      LookupTable = QryFundoInvestAplic
                      LookupField = 'IDFUNDOINVEST'
                      Options = [loRowLines]
                      TabOrder = 1
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                      ShowMatchText = True
                      OnExit = DbLkcFundoInvestExit
                    end
                    object DbDtDataLiquidacao: TCMDateTimePicker
                      Left = 2
                      Top = 102
                      Width = 110
                      Height = 21
                      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                      CalendarAttributes.Font.Color = clWindowText
                      CalendarAttributes.Font.Height = -11
                      CalendarAttributes.Font.Name = 'MS Sans Serif'
                      CalendarAttributes.Font.Style = []
                      ButtonStyle = cbsCustom
                      DataField = 'DATALIQUIDACAO'
                      DataSource = DsAplicacao
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
                      TabOrder = 2
                    end
                    object DbEdValorAplic: TDBRealEdit
                      Left = 2
                      Top = 142
                      Width = 169
                      Height = 21
                      Alignment = taRightJustify
                      Lines.Strings = (
                        '0,00')
                      TabOrder = 4
                      WordWrap = False
                      OnChange = DbEdValorAplicChange
                      IntDigits = 17
                      DecDigits = 2
                      NumberFormat = fNumber
                      Signal = False
                      DataField = 'VLROPERACAO'
                      DataSource = DsAplicacao
                    end
                    object DbEdCota: TDBRealEdit
                      Left = 452
                      Top = 102
                      Width = 169
                      Height = 21
                      Alignment = taRightJustify
                      Color = clMenu
                      Enabled = False
                      Lines.Strings = (
                        '0,00000000')
                      TabOrder = 6
                      WordWrap = False
                      IntDigits = 17
                      DecDigits = 8
                      NumberFormat = fNumber
                      Signal = False
                      DataField = 'VLRCOTA'
                      DataSource = DsAplicacao
                    end
                    object DbEdQtdOper: TDBRealEdit
                      Left = 452
                      Top = 142
                      Width = 169
                      Height = 21
                      Alignment = taRightJustify
                      Color = clMenu
                      Enabled = False
                      Lines.Strings = (
                        '0,000000000')
                      TabOrder = 7
                      WordWrap = False
                      IntDigits = 17
                      DecDigits = 9
                      NumberFormat = fNumber
                      Signal = False
                      DataField = 'QTDOPERACAO'
                      DataSource = DsAplicacao
                    end
                    object DbDtDataCotizacaoAplic: TCMDateTimePicker
                      Left = 131
                      Top = 102
                      Width = 110
                      Height = 21
                      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                      CalendarAttributes.Font.Color = clWindowText
                      CalendarAttributes.Font.Height = -11
                      CalendarAttributes.Font.Name = 'MS Sans Serif'
                      CalendarAttributes.Font.Style = []
                      ButtonStyle = cbsCustom
                      DataField = 'DATACOTIZACAO'
                      DataSource = DsAplicacao
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
                      OnExit = DbDtDataCotizacaoAplicExit
                    end
                    object DBeCETIPApl: TDBEdit
                      Left = 452
                      Top = 61
                      Width = 177
                      Height = 21
                      Color = clMenu
                      Enabled = False
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clNavy
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 5
                    end
                  end
                  object tbsDadosAplTx: TTabSheet
                    Caption = 'Taxa'
                    object Label11: TLabel
                      Left = 8
                      Top = 5
                      Width = 103
                      Height = 13
                      Caption = 'Tipo de Operação'
                    end
                    object Label10: TLabel
                      Left = 8
                      Top = 49
                      Width = 99
                      Height = 13
                      Caption = 'Taxa de Ingresso'
                    end
                    object dbeTipoOperAplTx: TDBEdit
                      Left = 8
                      Top = 21
                      Width = 561
                      Height = 21
                      Color = clBtnFace
                      DataField = 'DESCTIPOOPERACAO'
                      DataSource = dsTipoOperAplTx
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEVlrTxIngresso: TDBRealEdit
                      Left = 8
                      Top = 63
                      Width = 135
                      Height = 21
                      Alignment = taRightJustify
                      Lines.Strings = (
                        '0,00')
                      TabOrder = 1
                      WordWrap = False
                      IntDigits = 10
                      DecDigits = 2
                      NumberFormat = fNumber
                      Signal = False
                      DataField = 'VLRTAXAS'
                      DataSource = DsAplicacao
                    end
                  end
                  object tbsObsApl: TTabSheet
                    Caption = 'Observação'
                    object pnlObsAplic: TPanel
                      Left = 0
                      Top = 0
                      Width = 660
                      Height = 225
                      Align = alClient
                      BevelOuter = bvNone
                      TabOrder = 0
                      object dbeObsApl: TDBMemo
                        Left = 0
                        Top = 0
                        Width = 660
                        Height = 225
                        Align = alClient
                        DataField = 'OBSERVACAO'
                        DataSource = DsAplicacao
                        MaxLength = 300
                        TabOrder = 0
                      end
                    end
                  end
                end
              end
              object Dock977: TDock97
                Left = 0
                Top = 0
                Width = 772
                Height = 31
                AllowDrag = False
                BoundLines = [blTop, blBottom, blLeft, blRight]
                object Toolbar974: TToolbar97
                  Left = 0
                  Top = 0
                  Caption = 'tb97BotoesDetalhe'
                  DockPos = 0
                  TabOrder = 0
                  object BtIncAplic: TSpeedButton
                    Left = 0
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Inserir novo registro|'
                    AllowAllUp = True
                    GroupIndex = 1
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000010000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                      333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                      0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                      07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                      07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
                      0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
                      33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
                      B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                      3BB33773333773333773B333333B3333333B7333333733333337}
                    Layout = blGlyphTop
                    NumGlyphs = 2
                    ParentShowHint = False
                    ShowHint = True
                    Spacing = 0
                    OnClick = BtIncAplicClick
                  end
                  object BtAltAplic: TSpeedButton
                    Left = 25
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Consulta a aplicação selecionada|'
                    AllowAllUp = True
                    GroupIndex = 1
                    Glyph.Data = {
                      42020000424D4202000000000000420000002800000010000000100000000100
                      1000030000000002000000000000000000000000000000000000007C0000E003
                      00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C104210421F7C1F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7F00001F7C1F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7F00001F7C1F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7FFF7FFF7FFF7F00001F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F00001F7C
                      1F7C1F7C1F7C00401F7C1F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F0000
                      1F7C1F7C1F7C004000401F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F0000
                      1F7C1F7C1F7C0040004000401F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F
                      00001F7C1F7C1F7C0040004000400000000000000000FF7FFF7FFF7F1F00FF7F
                      FF7F00001F7C1F7C1F7C00400000FF031F7CFF031F7C000010021F00FF7FFF7F
                      FF7FFF7F00001F7C1F7C0000FF031F7CFF031F7CFF031F7C0000FF7FFF7FFF7F
                      104210421F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF030000FF7F10421042
                      1F7C1F7C1F7C1F7C1F7C0000FF031F7CFF031F7CFF031F7C000010421F7C1F7C
                      1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF0300001F7C1F7C1F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF0300001F7C1F7C1F7C1F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C1F7C1F7C1F7C1F7C
                      1F7C1F7C1F7C}
                    Layout = blGlyphTop
                    ParentShowHint = False
                    ShowHint = True
                    Spacing = 0
                    OnClick = BtAltAplicClick
                  end
                  object BtExcAplic: TSpeedButton
                    Left = 50
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Excluir o registro selecionado|'
                    AllowAllUp = True
                    GroupIndex = 1
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000010000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
                      555557777F777555F55500000000555055557777777755F75555005500055055
                      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
                      5555577FF77577FF555555005050110555555577F757777FF555555505099910
                      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
                      3055577F75F77777575F55005055090B030555775755777575755555555550B0
                      B03055555F555757575755550555550B0B335555755555757555555555555550
                      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
                      50BB555555555555575F555555555555550B5555555555555575}
                    Layout = blGlyphTop
                    NumGlyphs = 2
                    ParentShowHint = False
                    ShowHint = True
                    Spacing = 0
                    OnClick = BtExcAplicClick
                  end
                end
              end
              object Dock978: TDock97
                Left = 687
                Top = 31
                Width = 85
                Height = 237
                AllowDrag = False
                BoundLines = [blLeft]
                Position = dpRight
                Visible = False
                object Toolbar975: TToolbar97
                  Left = 0
                  Top = 0
                  Caption = 'tb97Detalhe'
                  DockPos = 0
                  TabOrder = 0
                  object BtOkAplic: TBitBtn
                    Left = 0
                    Top = 0
                    Width = 80
                    Height = 27
                    Caption = '&OK'
                    Default = True
                    Enabled = False
                    TabOrder = 0
                    OnClick = BtOkAplicClick
                    Glyph.Data = {
                      BE060000424DBE06000000000000360400002800000024000000120000000100
                      0800000000008802000000000000000000000001000000010000000000000000
                      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                      A600000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                      0303030303030303030303030303030303030303030303030303030303030303
                      03030303030303030303030303030303030303030303FF030303030303030303
                      03030303030303040403030303030303030303030303030303F8F8FF03030303
                      03030303030303030303040202040303030303030303030303030303F80303F8
                      FF030303030303030303030303040202020204030303030303030303030303F8
                      03030303F8FF0303030303030303030304020202020202040303030303030303
                      0303F8030303030303F8FF030303030303030304020202FA0202020204030303
                      0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
                      040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
                      03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
                      FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
                      0303030303030303030303FA0202020403030303030303030303030303F8FF03
                      03F8FF03030303030303030303030303FA020202040303030303030303030303
                      0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
                      03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
                      030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
                      0202040303030303030303030303030303F8FF03F8FF03030303030303030303
                      03030303FA0202030303030303030303030303030303F8FFF803030303030303
                      030303030303030303FA0303030303030303030303030303030303F803030303
                      0303030303030303030303030303030303030303030303030303030303030303
                      0303}
                    NumGlyphs = 2
                  end
                  object BtCancAplic: TBitBtn
                    Left = 0
                    Top = 27
                    Width = 80
                    Height = 28
                    Cancel = True
                    Caption = '&Cancelar'
                    Enabled = False
                    TabOrder = 1
                    OnClick = BtCancAplicClick
                    Glyph.Data = {
                      BE060000424DBE06000000000000360400002800000024000000120000000100
                      0800000000008802000000000000000000000001000000010000000000000000
                      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                      A600000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                      0303030303030303030303030303030303030303030303030303030303030303
                      0303F8F80303030303030303030303030303030303FF03030303030303030303
                      0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
                      03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
                      030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
                      FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
                      030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
                      F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
                      010101F8030303030303030303F8FF030303030303FFF8030303030303030303
                      030101010101F80303030303030303030303F8FF0303030303F8030303030303
                      0303030303F901010101F8030303030303030303030303F8FF030303F8030303
                      0303030303030303F90101010101F8030303030303030303030303F803030303
                      F8FF030303030303030303F9010101F8010101F803030303030303030303F803
                      03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
                      03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
                      03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
                      0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
                      030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
                      03030303030303030303030303030303030303030303030303F8F8F803030303
                      0303030303030303030303030303030303030303030303030303030303030303
                      0303}
                    NumGlyphs = 2
                  end
                  object BtVoltaAplic: TBitBtn
                    Left = 0
                    Top = 55
                    Width = 80
                    Height = 27
                    Cancel = True
                    Caption = '&Voltar'
                    Enabled = False
                    TabOrder = 2
                    OnClick = BtVoltaAplicClick
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
            end
          end
        end
        object TbsResgate: TTabSheet
          Caption = '&Resgate'
          object pgcResgateGeral: TPageControl
            Left = 0
            Top = 0
            Width = 780
            Height = 278
            ActivePage = TabSheet1
            Align = alClient
            TabOrder = 0
            object TabSheet1: TTabSheet
              Caption = 'Informações Contábeis '
              TabVisible = False
              object DbGrdrResgate: TwwDBGrid
                Left = 0
                Top = 31
                Width = 772
                Height = 237
                Selected.Strings = (
                  'DESCFUNDOINVEST'#9'24'#9'Fundo'
                  'DESCTIPOOPERACAO'#9'19'#9'Tipo de Operação'
                  'CODFUNCETIP'#9'14'#9'CETIP'
                  'IDPEDIDOFUNDO'#9'7'#9'Boleta'
                  'DATAPEDIDO'#9'10'#9'Operação'
                  'DATALIQUIDACAO'#9'10'#9'Liquidação'
                  'VLRPEDIDO'#9'16'#9'Valor da Operação'
                  'DATACOTIZACAO'#9'10'#9'Cotização'
                  'USUARIO'#9'12'#9'Operador')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
                Align = alClient
                Color = clWhite
                DataSource = DsResgate
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                KeyOptions = []
                Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgWordWrap]
                ParentFont = False
                TabOrder = 2
                TitleAlignment = taCenter
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clMaroon
                TitleFont.Height = -8
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                IndicatorColor = icYellow
              end
              object pnlResgate: TPanel
                Left = 0
                Top = 31
                Width = 772
                Height = 237
                Align = alClient
                BevelOuter = bvLowered
                TabOrder = 0
                object pgcResgate: TPageControl
                  Left = 1
                  Top = 1
                  Width = 685
                  Height = 235
                  ActivePage = tbsDadosResgTx
                  Align = alClient
                  MultiLine = True
                  TabOrder = 1
                  TabPosition = tpRight
                  object tbsDadosResg: TTabSheet
                    Caption = 'Operação'
                    object Label23: TLabel
                      Left = 2
                      Top = 5
                      Width = 105
                      Height = 13
                      Caption = 'Data da Operação'
                    end
                    object Label12: TLabel
                      Left = 2
                      Top = 88
                      Width = 130
                      Height = 13
                      Caption = 'Fundo de Investimento'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clBlack
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label24: TLabel
                      Left = 2
                      Top = 128
                      Width = 112
                      Height = 13
                      Caption = 'Data da Liquidação'
                    end
                    object Label13: TLabel
                      Left = 261
                      Top = 128
                      Width = 107
                      Height = 13
                      Caption = 'Valor da Operação'
                    end
                    object Label16: TLabel
                      Left = 131
                      Top = 128
                      Width = 106
                      Height = 13
                      Caption = 'Data da Cotização'
                    end
                    object Label21: TLabel
                      Left = 452
                      Top = 47
                      Width = 37
                      Height = 13
                      Caption = 'CETIP'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clNavy
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label4: TLabel
                      Left = 452
                      Top = 88
                      Width = 84
                      Height = 13
                      Caption = 'Cota do Fundo'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clNavy
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label31: TLabel
                      Left = 2
                      Top = 47
                      Width = 103
                      Height = 13
                      Caption = 'Tipo de Operação'
                    end
                    object dbDDataOperacao: TCMDateTimePicker
                      Left = 2
                      Top = 20
                      Width = 110
                      Height = 21
                      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                      CalendarAttributes.Font.Color = clWindowText
                      CalendarAttributes.Font.Height = -11
                      CalendarAttributes.Font.Name = 'MS Sans Serif'
                      CalendarAttributes.Font.Style = []
                      ButtonStyle = cbsCustom
                      DataField = 'DATAPEDIDO'
                      DataSource = DsResgate
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
                      OnExit = dbDDataOperacaoExit
                    end
                    object DbLkcFundoInvestResg: TwwDBLookupCombo
                      Left = 2
                      Top = 102
                      Width = 427
                      Height = 21
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clBlack
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCFUNDOINVEST'#9'40'#9'Fundo de Investimento')
                      DataField = 'IDFUNDOINVEST'
                      DataSource = DsResgate
                      LookupTable = QryFundoInvestResg
                      LookupField = 'IDFUNDOINVEST'
                      Options = [loRowLines]
                      ParentFont = False
                      TabOrder = 2
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                      ShowMatchText = True
                      OnExit = DbLkcFundoInvestResgExit
                    end
                    object dbDDataLiquidacaoResg: TCMDateTimePicker
                      Left = 2
                      Top = 142
                      Width = 110
                      Height = 21
                      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                      CalendarAttributes.Font.Color = clWindowText
                      CalendarAttributes.Font.Height = -11
                      CalendarAttributes.Font.Name = 'MS Sans Serif'
                      CalendarAttributes.Font.Style = []
                      ButtonStyle = cbsCustom
                      DataField = 'DATALIQUIDACAO'
                      DataSource = DsResgate
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
                    end
                    object DbRValorLiquido: TDBRealEdit
                      Left = 261
                      Top = 142
                      Width = 169
                      Height = 21
                      Alignment = taRightJustify
                      Lines.Strings = (
                        '0,00')
                      TabOrder = 5
                      WordWrap = False
                      IntDigits = 17
                      DecDigits = 2
                      NumberFormat = fNumber
                      Signal = False
                      DataField = 'VLRPEDIDO'
                      DataSource = DsResgate
                    end
                    object DbDtDataCotizacaoResg: TCMDateTimePicker
                      Left = 131
                      Top = 142
                      Width = 110
                      Height = 21
                      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                      CalendarAttributes.Font.Color = clWindowText
                      CalendarAttributes.Font.Height = -11
                      CalendarAttributes.Font.Name = 'MS Sans Serif'
                      CalendarAttributes.Font.Style = []
                      ButtonStyle = cbsCustom
                      DataField = 'DATACOTIZACAO'
                      DataSource = DsResgate
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
                      TabOrder = 4
                      OnExit = DbDtDataCotizacaoResgExit
                    end
                    object DBeCETIPResg: TDBEdit
                      Left = 452
                      Top = 61
                      Width = 177
                      Height = 21
                      Color = clMenu
                      Enabled = False
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clBlack
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 6
                    end
                    object DbEdCotaResg: TDBRealEdit
                      Left = 452
                      Top = 102
                      Width = 169
                      Height = 21
                      Alignment = taRightJustify
                      Color = clMenu
                      Enabled = False
                      Lines.Strings = (
                        '0,00000000')
                      TabOrder = 7
                      WordWrap = False
                      IntDigits = 17
                      DecDigits = 8
                      NumberFormat = fNumber
                      Signal = False
                      DataField = 'VLRCOTA'
                      DataSource = DsAplicacao
                    end
                    object DbLkcTipoOperacaoResg: TwwDBLookupCombo
                      Left = 2
                      Top = 61
                      Width = 327
                      Height = 21
                      DropDownAlignment = taLeftJustify
                      Selected.Strings = (
                        'DESCTIPOOPERACAO'#9'40'#9'Descrição'#9'F')
                      LookupTable = QryTipoOperacao
                      LookupField = 'IDTIPOOPERACAO'
                      Options = [loRowLines]
                      TabOrder = 1
                      AutoDropDown = True
                      ShowButton = True
                      AllowClearKey = True
                    end
                  end
                  object tbsDadosResgTx: TTabSheet
                    Caption = 'Taxa'
                    ImageIndex = 2
                    object Label8: TLabel
                      Left = 8
                      Top = 48
                      Width = 85
                      Height = 13
                      Caption = 'Taxa de Saída'
                    end
                    object Label9: TLabel
                      Left = 8
                      Top = 5
                      Width = 103
                      Height = 13
                      Caption = 'Tipo de Operação'
                    end
                    object DBEVlrTxSaida: TDBRealEdit
                      Left = 8
                      Top = 62
                      Width = 135
                      Height = 21
                      Alignment = taRightJustify
                      Lines.Strings = (
                        '0,00')
                      TabOrder = 1
                      WordWrap = False
                      IntDigits = 10
                      DecDigits = 2
                      NumberFormat = fNumber
                      Signal = False
                      DataField = 'VLRTAXAS'
                      DataSource = DsResgate
                    end
                    object dbeTipoOperResgTx: TDBEdit
                      Left = 8
                      Top = 21
                      Width = 561
                      Height = 21
                      Color = clBtnFace
                      DataField = 'DESCTIPOOPERACAO'
                      DataSource = dsTipoOperResgTx
                      Enabled = False
                      TabOrder = 0
                    end
                  end
                  object tbsObsResg: TTabSheet
                    Caption = 'Observação'
                    ImageIndex = 1
                    object pnlObsResg: TPanel
                      Left = 0
                      Top = 0
                      Width = 660
                      Height = 226
                      Align = alClient
                      BevelOuter = bvNone
                      TabOrder = 0
                      object dbeObsResg: TDBMemo
                        Left = 0
                        Top = 0
                        Width = 660
                        Height = 226
                        Align = alClient
                        DataField = 'OBSERVACAO'
                        DataSource = DsResgate
                        MaxLength = 300
                        TabOrder = 0
                      end
                    end
                  end
                end
                object Dock974: TDock97
                  Left = 686
                  Top = 1
                  Width = 85
                  Height = 235
                  AllowDrag = False
                  BoundLines = [blLeft]
                  Position = dpRight
                  Visible = False
                  object Toolbar973: TToolbar97
                    Left = 0
                    Top = 0
                    Caption = 'tb97Detalhe'
                    DockPos = 0
                    TabOrder = 0
                    object BtOkResg: TBitBtn
                      Left = 0
                      Top = 0
                      Width = 80
                      Height = 27
                      Caption = '&OK'
                      Default = True
                      Enabled = False
                      TabOrder = 0
                      OnClick = BtOkResgClick
                      Glyph.Data = {
                        BE060000424DBE06000000000000360400002800000024000000120000000100
                        0800000000008802000000000000000000000001000000010000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A600000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                        0303030303030303030303030303030303030303030303030303030303030303
                        03030303030303030303030303030303030303030303FF030303030303030303
                        03030303030303040403030303030303030303030303030303F8F8FF03030303
                        03030303030303030303040202040303030303030303030303030303F80303F8
                        FF030303030303030303030303040202020204030303030303030303030303F8
                        03030303F8FF0303030303030303030304020202020202040303030303030303
                        0303F8030303030303F8FF030303030303030304020202FA0202020204030303
                        0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
                        040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
                        03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
                        FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
                        0303030303030303030303FA0202020403030303030303030303030303F8FF03
                        03F8FF03030303030303030303030303FA020202040303030303030303030303
                        0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
                        03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
                        030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
                        0202040303030303030303030303030303F8FF03F8FF03030303030303030303
                        03030303FA0202030303030303030303030303030303F8FFF803030303030303
                        030303030303030303FA0303030303030303030303030303030303F803030303
                        0303030303030303030303030303030303030303030303030303030303030303
                        0303}
                      NumGlyphs = 2
                    end
                    object BtCancResg: TBitBtn
                      Left = 0
                      Top = 27
                      Width = 80
                      Height = 28
                      Cancel = True
                      Caption = '&Cancelar'
                      Enabled = False
                      TabOrder = 1
                      OnClick = BtCancResgClick
                      Glyph.Data = {
                        BE060000424DBE06000000000000360400002800000024000000120000000100
                        0800000000008802000000000000000000000001000000010000000000000000
                        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                        A600000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        0000000000000000000000000000000000000000000000000000000000000000
                        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                        0303030303030303030303030303030303030303030303030303030303030303
                        0303F8F80303030303030303030303030303030303FF03030303030303030303
                        0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
                        03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
                        030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
                        FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
                        030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
                        F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
                        010101F8030303030303030303F8FF030303030303FFF8030303030303030303
                        030101010101F80303030303030303030303F8FF0303030303F8030303030303
                        0303030303F901010101F8030303030303030303030303F8FF030303F8030303
                        0303030303030303F90101010101F8030303030303030303030303F803030303
                        F8FF030303030303030303F9010101F8010101F803030303030303030303F803
                        03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
                        03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
                        03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
                        0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
                        030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
                        03030303030303030303030303030303030303030303030303F8F8F803030303
                        0303030303030303030303030303030303030303030303030303030303030303
                        0303}
                      NumGlyphs = 2
                    end
                    object BtVoltaResg: TBitBtn
                      Left = 0
                      Top = 55
                      Width = 80
                      Height = 27
                      Cancel = True
                      Caption = '&Voltar'
                      Enabled = False
                      TabOrder = 2
                      OnClick = BtVoltaResgClick
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
              end
              object Dock973: TDock97
                Left = 0
                Top = 0
                Width = 772
                Height = 31
                AllowDrag = False
                BoundLines = [blTop, blBottom, blLeft, blRight]
                object Toolbar972: TToolbar97
                  Left = 0
                  Top = 0
                  Caption = 'tb97BotoesDetalhe'
                  DockPos = 0
                  TabOrder = 0
                  object BtIncResg: TSpeedButton
                    Left = 0
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Inserir novo registro|'
                    AllowAllUp = True
                    GroupIndex = 1
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000010000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                      333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                      0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                      07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                      07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
                      0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
                      33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
                      B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                      3BB33773333773333773B333333B3333333B7333333733333337}
                    Layout = blGlyphTop
                    NumGlyphs = 2
                    ParentShowHint = False
                    ShowHint = True
                    Spacing = 0
                    OnClick = BtIncResgClick
                  end
                  object BtAltResg: TSpeedButton
                    Left = 25
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Consulta o resgate selecionado|'
                    AllowAllUp = True
                    GroupIndex = 1
                    Glyph.Data = {
                      42020000424D4202000000000000420000002800000010000000100000000100
                      1000030000000002000000000000000000000000000000000000007C0000E003
                      00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C104210421F7C1F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7F00001F7C1F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7F00001F7C1F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7FFF7FFF7FFF7F00001F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F00001F7C
                      1F7C1F7C1F7C00401F7C1F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F0000
                      1F7C1F7C1F7C004000401F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F0000
                      1F7C1F7C1F7C0040004000401F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F
                      00001F7C1F7C1F7C0040004000400000000000000000FF7FFF7FFF7F1F00FF7F
                      FF7F00001F7C1F7C1F7C00400000FF031F7CFF031F7C000010021F00FF7FFF7F
                      FF7FFF7F00001F7C1F7C0000FF031F7CFF031F7CFF031F7C0000FF7FFF7FFF7F
                      104210421F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF030000FF7F10421042
                      1F7C1F7C1F7C1F7C1F7C0000FF031F7CFF031F7CFF031F7C000010421F7C1F7C
                      1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF0300001F7C1F7C1F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF0300001F7C1F7C1F7C1F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C1F7C1F7C1F7C1F7C
                      1F7C1F7C1F7C}
                    Layout = blGlyphTop
                    ParentShowHint = False
                    ShowHint = True
                    Spacing = 0
                    OnClick = BtAltResgClick
                  end
                  object BtExcResg: TSpeedButton
                    Left = 50
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Excluir o registro selecionado|'
                    AllowAllUp = True
                    GroupIndex = 1
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000010000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
                      555557777F777555F55500000000555055557777777755F75555005500055055
                      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
                      5555577FF77577FF555555005050110555555577F757777FF555555505099910
                      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
                      3055577F75F77777575F55005055090B030555775755777575755555555550B0
                      B03055555F555757575755550555550B0B335555755555757555555555555550
                      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
                      50BB555555555555575F555555555555550B5555555555555575}
                    Layout = blGlyphTop
                    NumGlyphs = 2
                    ParentShowHint = False
                    ShowHint = True
                    Spacing = 0
                    OnClick = BtExcResgClick
                  end
                end
                object pnlAguardar: TPanel
                  Left = 80
                  Top = 0
                  Width = 689
                  Height = 29
                  TabOrder = 1
                  Visible = False
                end
              end
            end
          end
        end
        object TbsSaldo: TTabSheet
          Caption = '&Saldo'
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 780
            Height = 42
            Align = alTop
            BevelOuter = bvLowered
            TabOrder = 0
            object Label3: TLabel
              Left = 8
              Top = 3
              Width = 82
              Height = 13
              Caption = 'Data do Saldo'
            end
            object Label14: TLabel
              Left = 307
              Top = 3
              Width = 134
              Height = 13
              Caption = 'Fundo de Investimento '
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object BtProduraSaldo: TSpeedButton
              Left = 692
              Top = 17
              Width = 24
              Height = 20
              Hint = 'Abre consulta dos Saldos dos Fundos'
              Glyph.Data = {
                EE000000424DEE000000000000007600000028000000100000000F0000000100
                0400000000007800000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                88888888888888888888888888800000000088088880FFFFFFF088008880F00F
                00F000000880FFFFFFF000000080F00F00F000000880FFFFFFF088008884C4C4
                C4C48808888CF4CF4CFC88888884C4C4C44C8888888888888888888888888888
                888888888888888888888888888888888888}
              ParentShowHint = False
              ShowHint = True
              OnClick = BtProduraSaldoClick
            end
            object Label5: TLabel
              Left = 199
              Top = 3
              Width = 63
              Height = 13
              Caption = 'Aplicações'
            end
            object Label30: TLabel
              Left = 115
              Top = 3
              Width = 38
              Height = 13
              Caption = 'Opção'
            end
            object DbLkcSaldo: TwwDBLookupCombo
              Left = 307
              Top = 17
              Width = 382
              Height = 21
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCFUNDOINVEST'#9'40'#9'Fundo de Investimento')
              LookupTable = QryFundoInvestOperacao
              LookupField = 'IDFUNDOINVEST'
              Options = [loRowLines, loTitles]
              ParentFont = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = DbLkcSaldoCloseUp
              OnEnter = DbLkcSaldoEnter
              OnExit = DbLkcSaldoExit
            end
            object DbDtRefSaldo: TCMDateTimePicker
              Left = 8
              Top = 17
              Width = 100
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
              OnExit = DbDtRefSaldoExit
            end
            object DbDtRefAplc: TCMDateTimePicker
              Left = 199
              Top = 17
              Width = 100
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
              TabOrder = 2
              OnExit = DbDtRefSaldoExit
            end
            object CbxAplic: TComboBox
              Left = 115
              Top = 17
              Width = 78
              Height = 21
              ItemHeight = 13
              TabOrder = 1
              Text = 'CbxAplic'
              OnExit = CbxAplicExit
              Items.Strings = (
                'Todos'
                'Menor'
                'Maior =')
            end
          end
          object Panel10: TPanel
            Left = 0
            Top = 42
            Width = 780
            Height = 236
            Align = alClient
            TabOrder = 1
            object dbGrdSaldos: TwwDBGrid
              Left = 1
              Top = 1
              Width = 778
              Height = 235
              Hint = 'Clique com o botão direito para Fixar Colunas'
              Selected.Strings = (
                'DESCFUNDOINVEST'#9'26'#9'Fundos'#9'F'
                'DATAAPLICACAO'#9'10'#9'Aplicação'#9'F'
                'DATAMOVFUNDO'#9'10'#9'Data Cota'#9'F'
                'SALDOQTDCOTAS'#9'22'#9'Quantidade'#9'F'
                'VLRCOTAATUAL'#9'15'#9'Valor da Cota'#9'F'
                'SALDOVLRFUNDO'#9'19'#9'Valor Bruto'#9'F'
                'SALDOQTDCOTASBLQ'#9'22'#9'Quantidade Bloqueada'#9'F'
                'VLRIOFPROV'#9'13'#9'IOF'#9'F'
                'VLRIRPROV'#9'14'#9'IR'#9'F'
                'SALDOLIQUIDO'#9'20'#9'Valor Líquido'#9'F'
                'VLRCOTAAPLICACAO'#9'18'#9'Cota Aplicacão'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
              Align = alClient
              Color = clWhite
              DataSource = DsSaldoFundo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              KeyOptions = []
              Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgShowFooter]
              ParentFont = False
              PopupMenu = pmnuConsSaldoFundos
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clMaroon
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icYellow
              OnUpdateFooter = dbGrdSaldosUpdateFooter
            end
          end
        end
      end
    end
    object pnlSaldos: TPanel
      Left = 1
      Top = 394
      Width = 790
      Height = 61
      Align = alBottom
      TabOrder = 2
      Visible = False
      object pnlSaldosDetalhes: TPanel
        Left = 1
        Top = 1
        Width = 788
        Height = 59
        Align = alClient
        TabOrder = 0
        object pnlSaldoSintetico: TPanel
          Left = 1
          Top = 1
          Width = 786
          Height = 23
          Align = alTop
          BevelOuter = bvLowered
          Caption = 'Saldo Sintético'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          Visible = False
        end
        object Panel2: TPanel
          Left = 1
          Top = 24
          Width = 786
          Height = 34
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          object Panel3: TPanel
            Left = 1
            Top = 1
            Width = 784
            Height = 32
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object Panel6: TPanel
              Left = 1
              Top = 1
              Width = 168
              Height = 16
              BevelOuter = bvLowered
              Caption = 'Quantidade '
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object Panel8: TPanel
              Left = 328
              Top = 1
              Width = 134
              Height = 16
              BevelOuter = bvLowered
              Caption = 'Valor Bruto '
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object Panel9: TPanel
              Left = 462
              Top = 1
              Width = 98
              Height = 16
              BevelOuter = bvLowered
              Caption = 'IOF '
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
            object Panel12: TPanel
              Left = 560
              Top = 1
              Width = 96
              Height = 16
              BevelOuter = bvLowered
              Caption = 'IRRF '
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
            end
            object Panel16: TPanel
              Left = 656
              Top = 1
              Width = 129
              Height = 16
              BevelOuter = bvLowered
              Caption = 'Valor Líquido '
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
            end
            object DBReLiq: TDBRealEdit
              Left = 656
              Top = 17
              Width = 130
              Height = 18
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 5
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'SALDOLIQUIDO'
              DataSource = dsSaldoFundoTotal
            end
            object DBReIRRF: TDBRealEdit
              Left = 560
              Top = 17
              Width = 96
              Height = 18
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 6
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRIRPROV'
              DataSource = dsSaldoFundoTotal
            end
            object DBReIOF: TDBRealEdit
              Left = 462
              Top = 17
              Width = 98
              Height = 18
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 7
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRIOFPROV'
              DataSource = dsSaldoFundoTotal
            end
            object DBReBruto: TDBRealEdit
              Left = 328
              Top = 17
              Width = 134
              Height = 18
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 8
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'SALDOVLRFUNDO'
              DataSource = dsSaldoFundoTotal
            end
            object DBReQtd: TDBRealEdit
              Left = 0
              Top = 17
              Width = 169
              Height = 18
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '0,0000000000')
              TabOrder = 9
              WordWrap = False
              IntDigits = 10
              DecDigits = 10
              NumberFormat = fNumber
              Signal = False
              DataField = 'SALDOQTDCOTAS'
              DataSource = dsSaldoFundoTotal
            end
            object Panel7: TPanel
              Left = 169
              Top = 1
              Width = 159
              Height = 16
              BevelOuter = bvLowered
              Caption = 'Quantidade Bloqueada'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 10
            end
            object DBReQtdBloq: TDBRealEdit
              Left = 169
              Top = 17
              Width = 159
              Height = 18
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '0,0000000000')
              TabOrder = 11
              WordWrap = False
              IntDigits = 10
              DecDigits = 10
              NumberFormat = fNumber
              Signal = False
              DataField = 'SALDOQTDCOTASBLQ'
              DataSource = dsSaldoFundoTotal
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 503
    Width = 792
    inherited tb97Fundo: TToolbar97
      Left = 620
      DockPos = 969
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 451
      DockPos = 800
    end
    inline fraMens: TfraMensagem
      Width = 450
      Height = 37
      TabOrder = 2
      inherited pnlProgresso: TPanel
        Width = 450
        Height = 37
        inherited pnlProgressoMensagem: TPanel
          Width = 346
          Height = 35
          inherited lblProgressoMensagem: TfcLabel
            Width = 344
            Height = 33
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 347
          Width = 102
          Height = 35
          inherited pgbProcesso: TProgressBar
            Width = 100
            Height = 33
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 720
    Top = 40
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 39
    Top = 374
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update FundoInvest'
      'set'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DESCFUNDOINVEST = :DESCFUNDOINVEST,'
      '  IDGESTORCARTEIRA = :IDGESTORCARTEIRA'
      'where'
      '  IDFUNDOINVEST = :OLD_IDFUNDOINVEST')
    InsertSQL.Strings = (
      'insert into FundoInvest'
      '  (IDFUNDOINVEST, DESCFUNDOINVEST, IDGESTORCARTEIRA)'
      'values'
      '  (:IDFUNDOINVEST, :DESCFUNDOINVEST, :IDGESTORCARTEIRA)')
    DeleteSQL.Strings = (
      'delete from FundoInvest'
      'where'
      '  IDFUNDOINVEST = :OLD_IDFUNDOINVEST')
    Left = 39
    Top = 388
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Left = 680
    Top = 40
  end
  inherited ImlPadrao: TImageList
    Left = 648
    Top = 40
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008400000084000000840000008400000084000000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000084000000FF00000084000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      0000008400000084000000000000000000000084000000840000008400000084
      0000008400000084000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      84000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000848484008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      00000000000000000000000000000000000000000000000000008484840000FF
      000000840000FFFFFF00FFFFFF00FFFFFF000000000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0084848400000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      00008400000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000008400000084
      00000084000000840000008400000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000084
      000000840000008400000084840000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      000000840000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF000000000000000000000000008484840000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF000000000000840000FFFFFF00FFFFFF00FFFF
      FF0000000000008400000084840000000000848484000000FF00000084000000
      FF00000084000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00000084000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00008400000084000000840000FFFFFF00FFFF
      FF0000000000008400000084840000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000084000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00848484000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      000084000000840000008400000000000000FFFFFF00FFFFFF00840000008400
      00008400000084000000000000000000000000000000000000008484840000FF
      000000840000008400000084000000840000008400000084000000840000FFFF
      FF00FFFFFF00008400000000000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000FFFFFF00FFFFFF00840000008400000000000000FFFFFF00FFFFFF008400
      00008400000084000000000000000000000000000000000000008484840000FF
      0000008400000084000000840000008400000084000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      0000FFFFFF00FFFFFF00000000008400000000000000FFFFFF00FFFFFF008400
      0000840000000000000000000000000000000000000000000000000000008484
      840000FF000000FF000000840000008400000084000000840000008400000084
      00000084000000000000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000848484008484840000FF000000FF000000FF000000FF000000FF00008484
      8400848484000000000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      840000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000084848400FF00
      0000FF00000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000FF000000FF000000FF000000FF000000FF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FF000000FF000000FF000000FF000000FF000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000FFFF0000FFFF008484840084848400000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000000000000000000000008400000000000000840000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000084000000
      8400000084000000840000008400FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000008400000000000000840000008400000084000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000FFFF0000FFFF000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF0000008400FFFFFF00FFFFFF00FF000000FFFF
      FF00000000000000000000008400000000000000840000008400000084000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000FFFF0000FFFF0000FFFF008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000008400FF000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000008400000084000000
      840000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF000000000000000000000000000000000000FFFF0000FF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000FFFFFF008484840084848400000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000084000000
      0000FFFF000000000000FFFF0000000000000000000084840000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000000000FF
      FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF000000FF000000
      0000FFFFFF00FFFFFF000000FF000000FF0000008400FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000FFFFFF00FFFF
      FF00FFFFFF0084848400848484000000000000000000000000000000000000FF
      FF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000084000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF00FFFF
      FF00FFFFFF00000000000000FF000000FF0000008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000FFFFFF008484
      840084848400000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      840000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF008484
      840084848400000000000000000000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000848484000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF00848484008484840084848400000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400848484000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000084008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      84000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      E007000000000000F00F000000000000F81F000000000000FC3F000000000000
      FE7F000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FC1FFFFFFFFFFFFFF007F83FF83FF83F
      E003E00FE00FE00FC301C007C007C007C0818003800380038040800380038003
      8020000100010001811000010001008181080001000100818008000100010101
      C001000100010081C001800380038283E003800380038023F007C007C007C007
      FC1FE00FE00FE00FFFFFF83FF83FF83FFEFFFF1FFFFFFF9FBC3DFC0FFF9FFE1F
      CC33F00FFE1FF81FC003E00FF81FE00FC007E007E00FE00FC00FF007E00F6007
      C007C003C0073007C003C001800710030000C00000038001C003E0012001C500
      E001E0071000CA81E003F0030401D507C003F0012007CA9FCC33F803801FD53F
      BEFDFC0FC1FFEA7FFEFFFE3FFFFFF0FF00000000000000000000000000000000
      000000000000}
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 592
    Top = 48
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select       FI.IdFundoInvest,'
      '                FI.DescFundoInvest,'
      '                FI.IdGestorCarteira,'
      ' '#39' '#39' AS STATUS,'
      ' '#39' '#39' AS STATUS1,'
      ' '#39' '#39' AS STATUS2,'
      ' '#39' '#39' AS STATUS3,'
      ' '#39' '#39' AS STATUS4,'
      ' '#39' '#39' AS STATUS5'
      ''
      'From         FundoInvest FI'
      ''
      'Order By FI.DescfUNDOInvest'
      ''
      ' ')
    UpdateObject = nil
    ControlType.Strings = (
      'STATUS;CheckBox;Yes;No')
    Left = 39
    Top = 353
  end
  object QryAplicacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT /*+INDEX(OPE.XIE4OPERACAOFUNDO)*/'
      
        '  OPE.IDOPERACAOFUNDO   , OPE.IDPEDIDOFUNDO     , OPE.IDTIPOINVE' +
        'ST      ,'
      
        '  OPE.IDTIPOOPERACAO    , OPE.IDFUNDOINVEST     , OPE.DATAOPERAC' +
        'AO      ,'
      
        '  OPE.DATALIQUIDACAO    , OPE.QTDOPERACAO       , OPE.VLROPERACA' +
        'O       ,'
      
        '  OPE.VLRCOTA           , OPE.VLRIR             , OPE.VLRIOF    ' +
        '        ,'
      
        '  OPE.VLRRENDIMENTO     , OPE.STACONFIRMA       , OPE.IDPLANPREV' +
        'CTBPATR ,'
      
        '  OPE.DATACOTIZACAO     , OPE.TRGUSERINCLUSAO   , OPE.OBSERVACAO' +
        '        ,'
      
        '  OPE.PLANO             , OPE.PLNCODIGO         , OPE.CODDOCUMEN' +
        'TO      ,'
      '  OPE.IDOPERACAOORIGEM  ,'
      ''
      
        '  TO_CHAR(OPE.QTDOPERACAO,'#39'FM999G999G999G999D009999999999'#39') AS Q' +
        'TDMOSTRA ,'
      ''
      '  FUN.DESCFUNDOINVEST   , FUN.IDGESTORCARTEIRA  ,'
      
        '  FUN.TRGDTINCLUSAO     , FUN.PZOCOTAPLIC       , FUN.MOECODIGO ' +
        '        ,'
      
        '  FUN.IDCARTEIRAINVEST  , FUN.IDTIPOFUNDOINVEST , FUN.CNPJFUNDO ' +
        '        ,'
      
        '  FUN.STAEXCLUSIVO      , FUN.PZOCARENCIA       , FUN.PZOANIVERS' +
        'ARIO    ,'
      
        '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD ' +
        '        ,'
      
        '  FUN.QTDDECVALOR       , FUN.STAFUNDO          , FUN.PZOAMORTIZ' +
        'ACAO    ,'
      
        '  FUN.PERCTXPERFORM     , FUN.PERCTXADM         , FUN.CODFUNCETI' +
        'P       ,'
      
        '  FUN.STAPROVISIONAIR   , FUN.STAPROVISIONAIOF  , FUN.CONTRCETIP' +
        '        ,'
      '  FUN.DTAINIPROC        ,'
      '  TPO.DESCTIPOOPERACAO  , TPO.NATUREZAOPERACAO  ,'
      ''
      '  CAR.IDPLANOPREV       , CAR.IDPATROCINADORA   ,'
      ''
      
        '  DECODE(OPE.STACONFIRMA, '#39'S'#39', '#39'Confirmada'#39','#39'Pendente'#39') As STATU' +
        'S       ,'
      ''
      '  '#39'                             '#39' AS USUARIO,'
      ''
      '  TXA.VLRTAXAS'
      ''
      'FROM'
      '  OPERACAOFUNDO OPE,'
      ''
      ' (SELECT VLRTAXAS, IDOPERACAOORIGEM  FROM OPERACAOFUNDO'
      
        '  WHERE IDTIPOINVEST = :IDTIPOINVEST AND IDTIPOOPERACAO = -176) ' +
        'TXA,'
      ''
      '  TIPOOPERACAO TPO, CARTEIRAINVEST CAR,'
      ''
      
        ' (SELECT * FROM HISTFUNDOINVEST WHERE (IDFUNDOINVEST || TO_CHAR(' +
        'DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '          (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),'#39'DD/' +
        'MM/YYYY, HH24:MI:SS'#39')'
      '           FROM   HISTFUNDOINVEST'
      '           WHERE  IDFUNDOINVEST > 0 AND'
      
        '                  DTAVIGENCIA   < TO_DATE(:DATAOPERACAO,'#39'DD/MM/Y' +
        'YYY'#39')+1'
      '           GROUP BY IDFUNDOINVEST))) FUN'
      'WHERE'
      
        '  (OPE.IDTIPOINVEST      = :IDTIPOINVEST)                       ' +
        ' AND'
      
        '  (OPE.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)                  ' +
        ' AND'
      
        '  (OPE.IDFUNDOINVEST     > 0)                                   ' +
        ' AND'
      
        '  (OPE.DATAOPERACAO      = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') )' +
        ' AND'
      
        '  (OPE.IDTIPOOPERACAO    > 0)                                   ' +
        ' AND'
      
        '  (OPE.IDCOMPOSICAOFUNDO IS NULL)                               ' +
        ' AND'
      ''
      
        '(((:IDGESTORCARTEIRA IS NOT NULL)                               ' +
        ' AND'
      
        '  (FUN.IDGESTORCARTEIRA = :IDGESTORCARTEIRA))                   ' +
        ' OR'
      
        '  (:IDGESTORCARTEIRA IS NULL) )                                 ' +
        ' AND'
      ''
      
        '(((:IDTIPOFUNDOINVEST IS NOT NULL)                              ' +
        ' AND'
      
        '  (FUN.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))                 ' +
        ' OR'
      
        '  (:IDTIPOFUNDOINVEST IS NULL) )                                ' +
        ' AND'
      ''
      
        '  (TPO.TIPOMOVTO        <> '#39'BLQ'#39')                               ' +
        ' AND  '
      ''
      
        '  (TPO.NATUREZAOPERACAO  = '#39'A'#39')                                 ' +
        ' AND'
      ''
      
        ' ((TPO.FLGTRANSF         = '#39'N'#39') OR (TPO.FLGTRANSF IS NULL))     ' +
        ' AND'
      ''
      
        '  (OPE.IDTIPOINVEST      = TPO.IDTIPOINVEST(+))                 ' +
        ' AND'
      
        '  (OPE.IDTIPOOPERACAO    = TPO.IDTIPOOPERACAO(+))               ' +
        ' AND'
      
        '  (OPE.IDFUNDOINVEST     = FUN.IDFUNDOINVEST)                   ' +
        ' AND'
      
        '  (CAR.IDCARTEIRAINVEST(+) = FUN.IDCARTEIRAINVEST)              ' +
        'AND'
      '  (TXA.IDOPERACAOORIGEM(+) = OPE.IDOPERACAOFUNDO)'
      ''
      ''
      'ORDER BY'
      '  FUN.DESCFUNDOINVEST, OPE.DATAOPERACAO'
      ' ')
    UpdateObject = UpdAplicacao
    ControlType.Strings = (
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 39
    Top = 255
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
        Value = '09/04/2001'
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
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
      end>
    object QryAplicacaoDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo'
      DisplayWidth = 22
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryAplicacaoCODFUNCETIP: TStringField
      DisplayLabel = 'CETIP'
      DisplayWidth = 14
      FieldName = 'CODFUNCETIP'
      Size = 30
    end
    object QryAplicacaoIDOPERACAOFUNDO: TFloatField
      DisplayLabel = 'Boleta'
      DisplayWidth = 7
      FieldName = 'IDOPERACAOFUNDO'
    end
    object QryAplicacaoDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Operação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
    end
    object QryAplicacaoDATACOTIZACAO: TDateTimeField
      DisplayLabel = 'Cotização'
      DisplayWidth = 10
      FieldName = 'DATACOTIZACAO'
    end
    object QryAplicacaoDATALIQUIDACAO: TDateTimeField
      DisplayLabel = 'Liquidação'
      DisplayWidth = 10
      FieldName = 'DATALIQUIDACAO'
    end
    object QryAplicacaoVLROPERACAO: TFloatField
      DisplayLabel = 'Valor Aplicado'
      DisplayWidth = 15
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,###0.00'
      EditFormat = '############0.00'
    end
    object QryAplicacaoUSUARIO: TStringField
      DisplayLabel = 'Operador'
      DisplayWidth = 12
      FieldName = 'USUARIO'
      FixedChar = True
      Size = 29
    end
    object QryAplicacaoVLRTAXAS: TFloatField
      DisplayLabel = 'Taxa de Ingresso'
      DisplayWidth = 12
      FieldName = 'VLRTAXAS'
      Visible = False
      DisplayFormat = '###,###,###0.00'
    end
    object QryAplicacaoSTACONFIRMA: TStringField
      DisplayLabel = 'Confirmada'
      DisplayWidth = 9
      FieldName = 'STACONFIRMA'
      Visible = False
      Size = 1
    end
    object QryAplicacaoQTDOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 23
      FieldName = 'QTDOPERACAO'
      Visible = False
      DisplayFormat = '###,#0.000000000'
    end
    object QryAplicacaoVLRCOTA: TFloatField
      DisplayLabel = 'Cota'
      DisplayWidth = 15
      FieldName = 'VLRCOTA'
      Visible = False
      DisplayFormat = '###,#0.000000000'
    end
    object QryAplicacaoIDFUNDOINVEST: TFloatField
      DisplayLabel = 'Boleta'
      DisplayWidth = 12
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object QryAplicacaoIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryAplicacaoIDPEDIDOFUNDO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPEDIDOFUNDO'
      Visible = False
    end
    object QryAplicacaoIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryAplicacaoIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryAplicacaoVLRIR: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRIR'
      Visible = False
    end
    object QryAplicacaoVLRIOF: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRIOF'
      Visible = False
    end
    object QryAplicacaoVLRRENDIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRRENDIMENTO'
      Visible = False
    end
    object QryAplicacaoIDGESTORCARTEIRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGESTORCARTEIRA'
      Visible = False
    end
    object QryAplicacaoTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Visible = False
    end
    object QryAplicacaoTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object QryAplicacaoMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object QryAplicacaoIDTIPOFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryAplicacaoCNPJFUNDO: TStringField
      DisplayWidth = 25
      FieldName = 'CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object QryAplicacaoSTAEXCLUSIVO: TStringField
      DisplayWidth = 1
      FieldName = 'STAEXCLUSIVO'
      Visible = False
      Size = 1
    end
    object QryAplicacaoPZOCARENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOCARENCIA'
      Visible = False
    end
    object QryAplicacaoPZOANIVERSARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOANIVERSARIO'
      Visible = False
    end
    object QryAplicacaoPZOLIQAPLIC: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOLIQAPLIC'
      Visible = False
    end
    object QryAplicacaoPZOLIQRESG: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOLIQRESG'
      Visible = False
    end
    object QryAplicacaoQTDDECQTD: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECQTD'
      Visible = False
    end
    object QryAplicacaoQTDDECVALOR: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECVALOR'
      Visible = False
    end
    object QryAplicacaoSTAFUNDO: TStringField
      DisplayWidth = 1
      FieldName = 'STAFUNDO'
      Visible = False
      Size = 1
    end
    object QryAplicacaoPZOAMORTIZACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOAMORTIZACAO'
      Visible = False
    end
    object QryAplicacaoPERCTXPERFORM: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCTXPERFORM'
      Visible = False
    end
    object QryAplicacaoPERCTXADM: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCTXADM'
      Visible = False
    end
    object QryAplicacaoSTAPROVISIONAIR: TStringField
      DisplayWidth = 1
      FieldName = 'STAPROVISIONAIR'
      Visible = False
      Size = 1
    end
    object QryAplicacaoSTAPROVISIONAIOF: TStringField
      DisplayWidth = 1
      FieldName = 'STAPROVISIONAIOF'
      Visible = False
      Size = 1
    end
    object QryAplicacaoCONTRCETIP: TStringField
      DisplayWidth = 30
      FieldName = 'CONTRCETIP'
      Visible = False
      Size = 30
    end
    object QryAplicacaoDESCTIPOOPERACAO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Visible = False
      Size = 60
    end
    object QryAplicacaoNATUREZAOPERACAO: TStringField
      DisplayWidth = 1
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      Size = 1
    end
    object QryAplicacaoQTDMOSTRA: TStringField
      Alignment = taRightJustify
      DisplayWidth = 29
      FieldName = 'QTDMOSTRA'
      Visible = False
      Size = 29
    end
    object QryAplicacaoSTATUS: TStringField
      DisplayWidth = 10
      FieldName = 'STATUS'
      Visible = False
      Size = 10
    end
    object QryAplicacaoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object QryAplicacaoIDPATROCINADORA: TFloatField
      FieldName = 'IDPATROCINADORA'
      Visible = False
    end
    object QryAplicacaoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object QryAplicacaoPZOCOTAPLIC: TFloatField
      FieldName = 'PZOCOTAPLIC'
      Visible = False
    end
    object QryAplicacaoOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 300
    end
    object QryAplicacaoDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
      Visible = False
    end
    object QryAplicacaoPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object QryAplicacaoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object QryAplicacaoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object QryAplicacaoIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
      Visible = False
    end
  end
  object DsAplicacao: TwwDataSource
    DataSet = QryAplicacao
    Left = 39
    Top = 275
  end
  object UpdAplicacao: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOFUNDO'
      'set'
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
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  DATACOTIZACAO = :DATACOTIZACAO,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  IDOPERACAOORIGEM = :IDOPERACAOORIGEM,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  VLRTAXAS = :VLRTAXAS'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    InsertSQL.Strings = (
      'insert into OPERACAOFUNDO'
      
        '  (IDOPERACAOFUNDO,  IDTIPOINVEST, IDTIPOOPERACAO, IDFUNDOINVEST' +
        ', DATAOPERACAO,'
      
        '   DATALIQUIDACAO,   QTDOPERACAO,  VLROPERACAO, VLRCOTA, VLRIR, ' +
        'VLRIOF, VLRRENDIMENTO,'
      
        '   STACONFIRMA,      IDPLANPREVCTBPATR, DATACOTIZACAO, OBSERVACA' +
        'O, IDOPERACAOORIGEM,'
      '   IDCARTEIRAINVEST, VLRTAXAS,     IDPEDIDOFUNDO)'
      'values'
      
        '  (:IDOPERACAOFUNDO,  :IDTIPOINVEST, :IDTIPOOPERACAO, :IDFUNDOIN' +
        'VEST, :DATAOPERACAO,'
      
        '   :DATALIQUIDACAO,   :QTDOPERACAO,  :VLROPERACAO, :VLRCOTA, :VL' +
        'RIR,  :VLRIOF, :VLRRENDIMENTO,'
      
        '   :STACONFIRMA,      :IDPLANPREVCTBPATR, :DATACOTIZACAO, :OBSER' +
        'VACAO,  :IDOPERACAOORIGEM,'
      '   :IDCARTEIRAINVEST, :VLRTAXAS,     :IDPEDIDOFUNDO)'
      ' ')
    DeleteSQL.Strings = (
      'delete from OPERACAOFUNDO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    Left = 39
    Top = 290
  end
  object QryFundoInvestOperacao: TwwQuery
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
      
        ' (SELECT * FROM HISTFUNDOINVEST WHERE (IDFUNDOINVEST || TO_CHAR(' +
        'DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '          (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),'#39'DD/' +
        'MM/YYYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST'
      
        '           WHERE DTAVIGENCIA < TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/YYYY' +
        #39')+1'
      '           GROUP BY IDFUNDOINVEST))) FUN,'
      '  TIPOFUNDOINVEST TFI'
      
        'WHERE (((:IDGESTORCARTEIRA IS NOT NULL)                        A' +
        'ND'
      
        '        (FUN.IDGESTORCARTEIRA  = :IDGESTORCARTEIRA))           O' +
        'R'
      '        (:IDGESTORCARTEIRA IS NULL) )'
      
        '  AND (((:IDTIPOFUNDOINVEST IS NOT NULL)                       A' +
        'ND'
      
        '        (FUN.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))          O' +
        'R'
      '        (:IDTIPOFUNDOINVEST IS NULL))'
      
        '  AND (((:IDTIPOINVEST <> 0)                                   A' +
        'ND'
      
        '        (TFI.IDTIPOINVEST = :IDTIPOINVEST))                    O' +
        'R'
      '        (:IDTIPOINVEST = 0))'
      '  AND (FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST)         '
      ''
      'ORDER BY  FUN.DESCFUNDOINVEST'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 513
    Top = 151
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
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
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
    object QryFundoInvestOperacaoIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDFUNDOINVEST'
    end
    object QryFundoInvestOperacaoDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoInvestOperacaoIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'FUNDOINVEST.IDGESTORCARTEIRA'
    end
    object QryFundoInvestOperacaoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'FUNDOINVEST.TRGDTINCLUSAO'
    end
    object QryFundoInvestOperacaoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'FUNDOINVEST.TRGUSERINCLUSAO'
      Size = 30
    end
    object QryFundoInvestOperacaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'FUNDOINVEST.MOECODIGO'
    end
    object QryFundoInvestOperacaoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'FUNDOINVEST.IDCARTEIRAINVEST'
    end
    object QryFundoInvestOperacaoIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDTIPOFUNDOINVEST'
    end
    object QryFundoInvestOperacaoCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Origin = 'FUNDOINVEST.CNPJFUNDO'
      Size = 25
    end
    object QryFundoInvestOperacaoSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Origin = 'FUNDOINVEST.STAEXCLUSIVO'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperacaoPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Origin = 'FUNDOINVEST.PZOCARENCIA'
    end
    object QryFundoInvestOperacaoPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Origin = 'FUNDOINVEST.PZOANIVERSARIO'
    end
    object QryFundoInvestOperacaoPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Origin = 'FUNDOINVEST.PZOLIQAPLIC'
    end
    object QryFundoInvestOperacaoPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
      Origin = 'FUNDOINVEST.PZOLIQRESG'
    end
    object QryFundoInvestOperacaoQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Origin = 'FUNDOINVEST.QTDDECQTD'
    end
    object QryFundoInvestOperacaoQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Origin = 'FUNDOINVEST.QTDDECVALOR'
    end
    object QryFundoInvestOperacaoSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Origin = 'FUNDOINVEST.STAFUNDO'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperacaoPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Origin = 'FUNDOINVEST.PZOAMORTIZACAO'
    end
    object QryFundoInvestOperacaoPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Origin = 'FUNDOINVEST.PERCTXPERFORM'
    end
    object QryFundoInvestOperacaoPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Origin = 'FUNDOINVEST.PERCTXADM'
    end
    object QryFundoInvestOperacaoCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Origin = 'FUNDOINVEST.CODFUNCETIP'
      Size = 30
    end
    object QryFundoInvestOperacaoSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Origin = 'FUNDOINVEST.STAPROVISIONAIR'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperacaoSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Origin = 'FUNDOINVEST.STAPROVISIONAIOF'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperacaoCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Origin = 'FUNDOINVEST.CONTRCETIP'
      Size = 30
    end
  end
  object QryTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOOPERACAO,'
      '   DESCTIPOOPERACAO,'
      '   NATUREZAOPERACAO,'
      '   FLGCONTAINVEST'
      'FROM  TIPOOPERACAO'
      'WHERE'
      '     (IDTIPOINVEST     = :IDTIPOINVEST)'
      'AND  (IDTIPOOPERACAO   > 0)'
      'AND  (NATUREZAOPERACAO = '#39'D'#39')'
      'AND  (RECPAG           = '#39'R'#39')'
      'AND  (FLGTRANSF        = '#39'N'#39')'
      'AND  (CODTIPDOC IS NOT NULL)'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 322
    Top = 207
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
    object QryTipoOperacaoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object QryTipoOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
    object QryTipoOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryTipoOperacaoFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGCONTAINVEST'
      Visible = False
    end
  end
  object QrySaldoFundo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT /*+INDEX (H1.XPKHISTFUNDO)*/'
      ' FI.DESCFUNDOINVEST   ,'
      
        ' H1.IDHISTFUNDO       , H1.CODDOCUMENTO      , H1.PLNCODIGO     ' +
        '    , H1.PLANO             ,'
      
        ' H1.IDTIPOINVEST      , H1.IDTIPOOPERACAO    , H1.IDCARTEIRAINVE' +
        'ST  , H1.IDFUNDOINVEST     ,'
      
        ' H1.DATAAPLICACAO     , H1.DATAMOVFUNDO      , H1.HISTMOVFUNDO  ' +
        '    , H1.NATURMOVFUNDO     ,'
      
        ' H1.TIPMOVFUNDO       , H1.VLRAPLICADO       , NVL(H1.VLRIRPROV,' +
        '0) AS VLRIRPROV  , NVL(H1.VLRIOFPROV,0) AS VLRIOFPROV ,'
      
        ' H1.VLRVARIACAO       , H1.COTASMOVFUNDO     , H1.VLRMOVFUNDO   ' +
        '    , H1.FLGCALCSALDO      ,'
      
        ' H1.SALDOQTDCOTAS     , H1.SALDOVLRFUNDO     , H1.COTAAPLICACAO ' +
        'AS VLRCOTAAPLICACAO,'
      ' H1.SALDOQTDCOTASBLQ  ,'
      ' CF.VLRCOTA AS VLRCOTAATUAL,'
      '(H1.SALDOVLRFUNDO-(NVL(H1.VLRIOFPROV,0))) AS  SALDOLIQUIDO,'
      ' '#39' '#39' AS STAMARCAAPL'
      ''
      'FROM HISTFUNDO H1, COTAFUNDO CF,'
      
        '             (SELECT HF1.IDFUNDOINVEST, HF1.DESCFUNDOINVEST, HF1' +
        '.IDGESTORCARTEIRA, HF1.IDTIPOFUNDOINVEST'
      '              FROM   HISTFUNDOINVEST HF1'
      
        '              WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCI' +
        'A,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '                    (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.D' +
        'TAVIGENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '                     FROM HISTFUNDOINVEST HF'
      '                     WHERE'
      
        '                       (((:IDTIPOFUNDOINVEST IS NOT NULL)       ' +
        '                  AND'
      
        '                       (HF.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVES' +
        'T))               OR'
      
        '                         (:IDTIPOFUNDOINVEST IS NULL) )         ' +
        '                  AND'
      ''
      '                        HF.IDFUNDOINVEST > 0       AND'
      ''
      '                       (((:DATAMOVFUNDO IS NOT NULL) AND'
      
        '                         (TRUNC(HF.DTAVIGENCIA) < TO_DATE(:DATAM' +
        'OVFUNDO,'#39'DD/MM/YYYY'#39')+1)) OR'
      '                         (:DATAMOVFUNDO IS NULL))    AND'
      ''
      
        '                       (((:IDGESTORCARTEIRA IS NOT NULL)        ' +
        '                  AND'
      
        '                       (HF.IDGESTORCARTEIRA = :IDGESTORCARTEIRA)' +
        ')                 OR'
      '                         (:IDGESTORCARTEIRA IS NULL) )'
      '                     GROUP BY HF.IDFUNDOINVEST))) FI'
      'WHERE'
      ''
      '(H1.IDHISTFUNDO IN ('
      
        '                SELECT /*+INDEX (H.XIE1HISTFUNDO)*/ MAX(H.IDHIST' +
        'FUNDO) AS IDHISTFUNDO'
      '                FROM HISTFUNDO H'
      '                WHERE'
      
        '                      (H.IDTIPOINVEST      = :IDTIPOINVEST)     ' +
        ' AND'
      ''
      
        '                      (H.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)' +
        ' AND'
      ''
      
        '                    (((:IDFUNDOINVEST IS NULL)         AND (H.ID' +
        'FUNDOINVEST > 0)) OR'
      
        '                     ((:IDFUNDOINVEST IS NOT NULL)     AND (H.ID' +
        'FUNDOINVEST = :IDFUNDOINVEST))) AND'
      ''
      
        '                   ( ((:TIPOMAIOR IS NOT NULL) AND (H.DATAAPLICA' +
        'CAO >= TO_DATE(:DATAAPLICACAO,'#39'DD/MM/YYYY'#39') )) OR'
      
        '                     ((:TIPOMENOR IS NOT NULL) AND (H.DATAAPLICA' +
        'CAO <  TO_DATE(:DATAAPLICACAO,'#39'DD/MM/YYYY'#39') )) OR'
      
        '                     ((:TIPOMAIOR IS NULL)     AND (:TIPOMENOR I' +
        'S NULL) ))           AND'
      ''
      
        '                       (H.DATAMOVFUNDO      = TO_DATE(:DATAMOVFU' +
        'NDO,  '#39'DD/MM/YYYY'#39')) AND'
      
        '                      ((H.DATAMOVFUNDO      < TO_DATE(:DATAMOVFU' +
        'NDO,  '#39'DD/MM/YYYY'#39')) OR H.IDHISTFUNDO < 999999999) AND'
      ''
      '                       (H.TIPMOVFUNDO      <> '#39'PIR'#39')'
      
        '                GROUP BY H.IDTIPOINVEST, H.IDPLANPREVCTBPATR, H.' +
        'IDFUNDOINVEST, H.DATAAPLICACAO'
      '                )) AND'
      ''
      '(H1.SALDOQTDCOTAS > 0)                                     AND'
      ''
      '(H1.IDCOMPOSICAOFUNDO IS NULL)                             AND'
      ''
      '(CF.IDFUNDOINVEST(+)  = H1.IDFUNDOINVEST)                  AND'
      ''
      '(CF.DATACOTA(+)       = H1.DATAMOVFUNDO)                   AND'
      ''
      '(FI.IDFUNDOINVEST     = H1.IDFUNDOINVEST)'
      ''
      'ORDER BY DESCFUNDOINVEST, DATAAPLICACAO')
    ControlType.Strings = (
      'STAMARCAAPL;CheckBox;S;N')
    ValidateWithMask = True
    Left = 224
    Top = 151
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end>
    object QrySaldoFundoDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundos'
      DisplayWidth = 26
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QrySaldoFundoDATAAPLICACAO: TDateTimeField
      DisplayLabel = 'Aplicação'
      DisplayWidth = 10
      FieldName = 'DATAAPLICACAO'
    end
    object QrySaldoFundoDATAMOVFUNDO: TDateTimeField
      DisplayLabel = 'Data Cota'
      DisplayWidth = 10
      FieldName = 'DATAMOVFUNDO'
    end
    object QrySaldoFundoSALDOQTDCOTAS: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 22
      FieldName = 'SALDOQTDCOTAS'
      DisplayFormat = '###,#0.000000000'
    end
    object QrySaldoFundoVLRCOTAATUAL: TFloatField
      DisplayLabel = 'Valor da Cota'
      DisplayWidth = 15
      FieldName = 'VLRCOTAATUAL'
      DisplayFormat = '###,#0.000000000'
    end
    object QrySaldoFundoSALDOVLRFUNDO: TFloatField
      DisplayLabel = 'Valor Bruto'
      DisplayWidth = 19
      FieldName = 'SALDOVLRFUNDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoSALDOQTDCOTASBLQ: TFloatField
      DisplayLabel = 'Quantidade Bloqueada'
      DisplayWidth = 22
      FieldName = 'SALDOQTDCOTASBLQ'
      DisplayFormat = '###,#0.000000000'
    end
    object QrySaldoFundoVLRIOFPROV: TFloatField
      DisplayLabel = 'IOF'
      DisplayWidth = 13
      FieldName = 'VLRIOFPROV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoVLRIRPROV: TFloatField
      DisplayLabel = 'IR'
      DisplayWidth = 14
      FieldName = 'VLRIRPROV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoSALDOLIQUIDO: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 20
      FieldName = 'SALDOLIQUIDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoVLRCOTAAPLICACAO: TFloatField
      DisplayLabel = 'Cota Aplicacão'
      DisplayWidth = 18
      FieldName = 'VLRCOTAAPLICACAO'
      DisplayFormat = '###,#0.000000000'
    end
    object QrySaldoFundoSTAMARCAAPL: TStringField
      DisplayLabel = '   '
      DisplayWidth = 1
      FieldName = 'STAMARCAAPL'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QrySaldoFundoVLRAPLICADO: TFloatField
      DisplayLabel = 'Valor Aplicado'
      DisplayWidth = 17
      FieldName = 'VLRAPLICADO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoIDHISTFUNDO: TFloatField
      FieldName = 'IDHISTFUNDO'
      Visible = False
    end
    object QrySaldoFundoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object QrySaldoFundoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object QrySaldoFundoPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object QrySaldoFundoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QrySaldoFundoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QrySaldoFundoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QrySaldoFundoIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object QrySaldoFundoHISTMOVFUNDO: TStringField
      FieldName = 'HISTMOVFUNDO'
      Visible = False
      Size = 60
    end
    object QrySaldoFundoNATURMOVFUNDO: TStringField
      FieldName = 'NATURMOVFUNDO'
      Visible = False
      Size = 1
    end
    object QrySaldoFundoTIPMOVFUNDO: TStringField
      FieldName = 'TIPMOVFUNDO'
      Visible = False
      Size = 3
    end
    object QrySaldoFundoVLRVARIACAO: TFloatField
      FieldName = 'VLRVARIACAO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoCOTASMOVFUNDO: TFloatField
      FieldName = 'COTASMOVFUNDO'
      Visible = False
    end
    object QrySaldoFundoVLRMOVFUNDO: TFloatField
      FieldName = 'VLRMOVFUNDO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoFLGCALCSALDO: TStringField
      FieldName = 'FLGCALCSALDO'
      Visible = False
      Size = 1
    end
  end
  object DsSaldoFundo: TwwDataSource
    DataSet = QrySaldoFundo
    Left = 224
    Top = 164
  end
  object QryFundoInvestAplic: TwwQuery
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
        'ONAIOF  , FUN.CONTRCETIP        ,'
      
        '  FUN.DATAINICIOFUNDO   , FUN.PZOCOTAPLIC       , TFI.IDTIPOINVE' +
        'ST      , FUN.DTAINIPROC'
      'FROM'
      
        ' (SELECT * FROM HISTFUNDOINVEST WHERE (IDFUNDOINVEST || TO_CHAR(' +
        'DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '          (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),'#39'DD/' +
        'MM/YYYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST'
      
        '           WHERE TRUNC(DTAVIGENCIA) < TO_DATE(:DATAMOVFUNDO,'#39'DD/' +
        'MM/YYYY'#39')+1'
      '           GROUP BY IDFUNDOINVEST))) FUN,  TIPOFUNDOINVEST TFI'
      'WHERE'
      '    (FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST) AND'
      ''
      '    (((:IDGESTORCARTEIRA IS NOT NULL)               AND'
      '      (FUN.IDGESTORCARTEIRA  = :IDGESTORCARTEIRA))  OR'
      '      (:IDGESTORCARTEIRA IS NULL) )                 AND'
      ''
      '    (((:IDTIPOFUNDOINVEST IS NOT NULL)              AND'
      '      (FUN.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)) OR'
      '      (:IDTIPOFUNDOINVEST IS NULL) )                AND'
      ''
      '    (((:IDTIPOINVEST <> 0)                          AND'
      '      (TFI.IDTIPOINVEST = :IDTIPOINVEST))           OR'
      '      (:IDTIPOINVEST = 0) )'
      ''
      'ORDER BY'
      '  FUN.DESCFUNDOINVEST')
    ValidateWithMask = True
    Left = 513
    Top = 207
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
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
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
    object QryFundoInvestAplicIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDFUNDOINVEST'
    end
    object QryFundoInvestAplicDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoInvestAplicIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'FUNDOINVEST.IDGESTORCARTEIRA'
    end
    object QryFundoInvestAplicTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'FUNDOINVEST.TRGDTINCLUSAO'
    end
    object QryFundoInvestAplicTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'FUNDOINVEST.TRGUSERINCLUSAO'
      Size = 30
    end
    object QryFundoInvestAplicMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'FUNDOINVEST.MOECODIGO'
    end
    object QryFundoInvestAplicIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDTIPOFUNDOINVEST'
    end
    object QryFundoInvestAplicCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Origin = 'FUNDOINVEST.CNPJFUNDO'
      Size = 25
    end
    object QryFundoInvestAplicSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Origin = 'FUNDOINVEST.STAEXCLUSIVO'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestAplicPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Origin = 'FUNDOINVEST.PZOCARENCIA'
    end
    object QryFundoInvestAplicPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Origin = 'FUNDOINVEST.PZOANIVERSARIO'
    end
    object QryFundoInvestAplicPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Origin = 'FUNDOINVEST.PZOLIQAPLIC'
    end
    object QryFundoInvestAplicPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
      Origin = 'FUNDOINVEST.PZOLIQRESG'
    end
    object QryFundoInvestAplicQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Origin = 'FUNDOINVEST.QTDDECQTD'
    end
    object QryFundoInvestAplicQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Origin = 'FUNDOINVEST.QTDDECVALOR'
    end
    object QryFundoInvestAplicSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Origin = 'FUNDOINVEST.STAFUNDO'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestAplicPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Origin = 'FUNDOINVEST.PZOAMORTIZACAO'
    end
    object QryFundoInvestAplicPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Origin = 'FUNDOINVEST.PERCTXPERFORM'
    end
    object QryFundoInvestAplicPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Origin = 'FUNDOINVEST.PERCTXADM'
    end
    object QryFundoInvestAplicCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Origin = 'FUNDOINVEST.CODFUNCETIP'
      Size = 30
    end
    object QryFundoInvestAplicSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Origin = 'FUNDOINVEST.STAPROVISIONAIR'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestAplicSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Origin = 'FUNDOINVEST.STAPROVISIONAIOF'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestAplicCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Origin = 'FUNDOINVEST.CONTRCETIP'
      Size = 30
    end
    object QryFundoInvestAplicDATAINICIOFUNDO: TDateTimeField
      FieldName = 'DATAINICIOFUNDO'
      Origin = 'FUNDOINVEST.DATAINICIOFUNDO'
    end
    object QryFundoInvestAplicPZOCOTAPLIC: TFloatField
      FieldName = 'PZOCOTAPLIC'
      Origin = 'FUNDOINVEST.PZOCOTAPLIC'
    end
    object QryFundoInvestAplicIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'FUNDOINVEST.IDCARTEIRAINVEST'
    end
    object QryFundoInvestAplicIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'TIPOFUNDOINVEST.IDTIPOINVEST'
    end
    object QryFundoInvestAplicDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
    end
  end
  object QrySaldoFundoTotal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+INDEX (H1.XPKHISTFUNDO)*/'
      
        ' SUM(H1.VLRAPLICADO)   AS VLRAPLICADO      , SUM(NVL(H1.VLRIRPRO' +
        'V,0))  AS VLRIRPROV, SUM(NVL(H1.VLRIOFPROV,0))  AS VLRIOFPROV,'
      
        ' SUM(NVL(H1.VLRVARIACAO,0)) AS VLRVARIACAO , SUM(H1.COTASMOVFUND' +
        'O) AS COTASMOVFUNDO, SUM(H1.VLRMOVFUNDO) AS VLRMOVFUNDO,'
      
        ' SUM(H1.SALDOQTDCOTAS) AS SALDOQTDCOTAS    , SUM(H1.SALDOVLRFUND' +
        'O) AS SALDOVLRFUNDO,'
      
        ' SUM(H1.SALDOVLRFUNDO)-SUM(NVL(H1.VLRIOFPROV,0)) AS  SALDOLIQUID' +
        'O,'
      ' SUM(H1.SALDOQTDCOTASBLQ) AS SALDOQTDCOTASBLQ'
      ''
      'FROM HISTFUNDO H1, FUNDOINVEST FI'
      ''
      'WHERE'
      ''
      
        '(H1.IDHISTFUNDO  IN (SELECT /*+INDEX (HF.XIE1HISTFUNDO)*/ MAX(HF' +
        '.IDHISTFUNDO) AS IDHISTFUNDO'
      '                     FROM HISTFUNDO HF'
      '                     WHERE'
      
        '                         (HF.IDTIPOINVEST      = :IDTIPOINVEST) ' +
        '     AND'
      
        '                         (HF.IDPLANPREVCTBPATR = :IDPLANPREVCTBP' +
        'ATR) AND'
      ''
      
        '                      (((:IDFUNDOINVEST IS NULL)         AND (HF' +
        '.IDFUNDOINVEST > 0)) OR'
      
        '                       ((:IDFUNDOINVEST IS NOT NULL)     AND (HF' +
        '.IDFUNDOINVEST = :IDFUNDOINVEST))) AND'
      ''
      
        '                     ( ((:TIPOMAIOR IS NOT NULL) AND (HF.DATAAPL' +
        'ICACAO >= TO_DATE(:DATAAPLICACAO,'#39'DD/MM/YYYY'#39') )) OR'
      
        '                       ((:TIPOMENOR IS NOT NULL) AND (HF.DATAAPL' +
        'ICACAO <  TO_DATE(:DATAAPLICACAO,'#39'DD/MM/YYYY'#39') )) OR'
      
        '                       ((:TIPOMAIOR IS NULL)     AND (:TIPOMENOR' +
        ' IS NULL) ))            AND'
      
        '                         (HF.DATAMOVFUNDO      = TO_DATE(:DATAMO' +
        'VFUNDO,  '#39'DD/MM/YYYY'#39')) AND'
      
        '                        ((HF.DATAMOVFUNDO      < TO_DATE(:DATAMO' +
        'VFUNDO,  '#39'DD/MM/YYYY'#39')) OR HF.IDHISTFUNDO < 999999999) AND'
      '                         (HF.TIPMOVFUNDO       <>'#39'PIR'#39')'
      
        '                     GROUP BY HF.IDTIPOINVEST, HF.IDPLANPREVCTBP' +
        'ATR, HF.IDFUNDOINVEST, HF.DATAAPLICACAO)) AND'
      ''
      '(H1.SALDOQTDCOTAS > 0)                                     AND'
      ''
      '(H1.IDCOMPOSICAOFUNDO IS NULL)                             AND'
      ''
      '(((:IDGESTORCARTEIRA IS NOT NULL)                          AND'
      '  (FI.IDGESTORCARTEIRA = :IDGESTORCARTEIRA))               OR'
      '  (:IDGESTORCARTEIRA IS NULL) )                            AND'
      ''
      '(((:IDTIPOFUNDOINVEST IS NOT NULL)                         AND'
      '  (FI.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))             OR'
      '  (:IDTIPOFUNDOINVEST IS NULL) )                           AND'
      ''
      '(FI.IDFUNDOINVEST     = H1.IDFUNDOINVEST)')
    ValidateWithMask = True
    Left = 136
    Top = 151
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
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
      end>
    object QrySaldoFundoTotalVLRAPLICADO: TFloatField
      FieldName = 'VLRAPLICADO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoTotalVLRIRPROV: TFloatField
      FieldName = 'VLRIRPROV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoTotalVLRIOFPROV: TFloatField
      FieldName = 'VLRIOFPROV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoTotalVLRVARIACAO: TFloatField
      FieldName = 'VLRVARIACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoTotalCOTASMOVFUNDO: TFloatField
      FieldName = 'COTASMOVFUNDO'
      DisplayFormat = '###,#0.000000000'
    end
    object QrySaldoFundoTotalVLRMOVFUNDO: TFloatField
      FieldName = 'VLRMOVFUNDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoTotalSALDOQTDCOTAS: TFloatField
      FieldName = 'SALDOQTDCOTAS'
      DisplayFormat = '###,#0.000000000'
    end
    object QrySaldoFundoTotalSALDOVLRFUNDO: TFloatField
      FieldName = 'SALDOVLRFUNDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoTotalSALDOLIQUIDO: TFloatField
      FieldName = 'SALDOLIQUIDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoTotalSALDOQTDCOTASBLQ: TFloatField
      FieldName = 'SALDOQTDCOTASBLQ'
      DisplayFormat = '###,#0.000000000'
    end
  end
  object dsSaldoFundoTotal: TwwDataSource
    DataSet = QrySaldoFundoTotal
    Left = 128
    Top = 164
  end
  object DsResgate: TwwDataSource
    DataSet = QryResgate
    Left = 39
    Top = 189
  end
  object UpdResgate: TUpdateSQL
    ModifySQL.Strings = (
      'update PEDIDOFUNDO'
      'set'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DATAPEDIDO = :DATAPEDIDO,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO,'
      '  VLRPEDIDO = :VLRPEDIDO,'
      '  DATACOTIZACAO = :DATACOTIZACAO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  IDTIPORESGATE = :IDTIPORESGATE,'
      '  DATAAPLICACAO = :DATAAPLICACAO,'
      '  VLRTAXAS = :VLRTAXAS   '
      'where'
      '  IDPEDIDOFUNDO = :OLD_IDPEDIDOFUNDO'
      ' '
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into PEDIDOFUNDO'
      '  (IDPEDIDOFUNDO, IDTIPOINVEST, IDTIPOOPERACAO, IDFUNDOINVEST, '
      'DATAPEDIDO, '
      '   DATALIQUIDACAO, VLRPEDIDO, DATACOTIZACAO, IDPLANPREVCTBPATR, '
      'OBSERVACAO, '
      '   IDTIPORESGATE, DATAAPLICACAO, VLRTAXAS)'
      'values'
      
        '  (:IDPEDIDOFUNDO, :IDTIPOINVEST, :IDTIPOOPERACAO, :IDFUNDOINVES' +
        'T, '
      ':DATAPEDIDO, '
      
        '   :DATALIQUIDACAO, :VLRPEDIDO, :DATACOTIZACAO, :IDPLANPREVCTBPA' +
        'TR, '
      ':OBSERVACAO, '
      '   :IDTIPORESGATE, :DATAAPLICACAO, :VLRTAXAS)')
    DeleteSQL.Strings = (
      'delete from PEDIDOFUNDO'
      'where'
      '  IDPEDIDOFUNDO = :OLD_IDPEDIDOFUNDO')
    Left = 39
    Top = 186
  end
  object QryFundoInvestResg: TwwQuery
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
        'ONAIOF  , FUN.CONTRCETIP        ,'
      
        '  FUN.DATAINICIOFUNDO   , FUN.PZOCOTRESG        , TFI.IDTIPOINVE' +
        'ST      , FUN.DTAINIPROC'
      'FROM'
      
        ' (SELECT * FROM HISTFUNDOINVEST WHERE (IDFUNDOINVEST || TO_CHAR(' +
        'DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '          (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),'#39'DD/' +
        'MM/YYYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST'
      
        '           WHERE TRUNC(DTAVIGENCIA) < TO_DATE(:DATAMOVFUNDO,'#39'DD/' +
        'MM/YYYY'#39')+1'
      '           GROUP BY IDFUNDOINVEST))) FUN,  TIPOFUNDOINVEST TFI'
      'WHERE'
      ''
      '  (((:IDGESTORCARTEIRA IS NOT NULL)               AND'
      ' (FUN.IDGESTORCARTEIRA  = :IDGESTORCARTEIRA))     OR'
      '    (:IDGESTORCARTEIRA IS NULL) )                 AND'
      ''
      '  (((:IDTIPOFUNDOINVEST IS NOT NULL)              AND'
      ' (FUN.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))    OR'
      '    (:IDTIPOFUNDOINVEST IS NULL))                 AND'
      ''
      '  (((:IDTIPOINVEST <> 0)                          AND'
      ' (TFI.IDTIPOINVEST = :IDTIPOINVEST))              OR'
      '    (:IDTIPOINVEST = 0))                          AND'
      ''
      ' (FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST)'
      ''
      'ORDER BY  FUN.DESCFUNDOINVEST')
    ValidateWithMask = True
    Left = 513
    Top = 255
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
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
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
    object QryFundoInvestResgIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDFUNDOINVEST'
    end
    object QryFundoInvestResgDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoInvestResgIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'FUNDOINVEST.IDGESTORCARTEIRA'
    end
    object QryFundoInvestResgTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'FUNDOINVEST.TRGDTINCLUSAO'
    end
    object QryFundoInvestResgTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'FUNDOINVEST.TRGUSERINCLUSAO'
      Size = 30
    end
    object QryFundoInvestResgMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'FUNDOINVEST.MOECODIGO'
    end
    object QryFundoInvestResgIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'FUNDOINVEST.IDCARTEIRAINVEST'
    end
    object QryFundoInvestResgIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDTIPOFUNDOINVEST'
    end
    object QryFundoInvestResgCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Origin = 'FUNDOINVEST.CNPJFUNDO'
      Size = 25
    end
    object QryFundoInvestResgSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Origin = 'FUNDOINVEST.STAEXCLUSIVO'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestResgPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Origin = 'FUNDOINVEST.PZOCARENCIA'
    end
    object QryFundoInvestResgPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Origin = 'FUNDOINVEST.PZOANIVERSARIO'
    end
    object QryFundoInvestResgPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Origin = 'FUNDOINVEST.PZOLIQAPLIC'
    end
    object QryFundoInvestResgPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
      Origin = 'FUNDOINVEST.PZOLIQRESG'
    end
    object QryFundoInvestResgQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Origin = 'FUNDOINVEST.QTDDECQTD'
    end
    object QryFundoInvestResgQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Origin = 'FUNDOINVEST.QTDDECVALOR'
    end
    object QryFundoInvestResgSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Origin = 'FUNDOINVEST.STAFUNDO'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestResgPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Origin = 'FUNDOINVEST.PZOAMORTIZACAO'
    end
    object QryFundoInvestResgPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Origin = 'FUNDOINVEST.PERCTXPERFORM'
    end
    object QryFundoInvestResgPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Origin = 'FUNDOINVEST.PERCTXADM'
    end
    object QryFundoInvestResgCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Origin = 'FUNDOINVEST.CODFUNCETIP'
      Size = 30
    end
    object QryFundoInvestResgSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Origin = 'FUNDOINVEST.STAPROVISIONAIR'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestResgSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Origin = 'FUNDOINVEST.STAPROVISIONAIOF'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestResgCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Origin = 'FUNDOINVEST.CONTRCETIP'
      Size = 30
    end
    object QryFundoInvestResgDATAINICIOFUNDO: TDateTimeField
      FieldName = 'DATAINICIOFUNDO'
      Origin = 'FUNDOINVEST.DATAINICIOFUNDO'
    end
    object QryFundoInvestResgPZOCOTRESG: TFloatField
      FieldName = 'PZOCOTRESG'
      Origin = 'FUNDOINVEST.PZOCOTRESG'
    end
    object QryFundoInvestResgIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'TIPOFUNDOINVEST.IDTIPOINVEST'
    end
    object QryFundoInvestResgDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
    end
  end
  object QryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 322
    Top = 353
  end
  object QryVerificaOperacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT /*+INDEX(OPE.XIE4OPERACAOFUNDO)*/'
      '   OPE.IDFUNDOINVEST,'
      '   OPE.DATAOPERACAO,'
      '   DESCTIPOOPERACAO'
      'FROM'
      '   OPERACAOFUNDO OPE, TIPOOPERACAO TPO'
      'WHERE'
      '   OPE.IDTIPOINVEST      =:IDTIPOINVEST        AND'
      '   OPE.IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR   AND'
      '   OPE.IDFUNDOINVEST     =:IDFUNDOINVEST       AND'
      
        '   OPE.DATAOPERACAO      =TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') AN' +
        'D'
      
        '    ((:IDTIPOOPERACAO IS NULL) Or (OPE.IDTIPOOPERACAO =:IDTIPOOP' +
        'ERACAO)) AND'
      '   TPO.NATUREZAOPERACAO  =:NATUREZAOPERACAO    AND'
      '   TPO.IDTIPOINVEST      = OPE.IDTIPOINVEST    AND'
      '   TPO.IDTIPOOPERACAO    = OPE.IDTIPOOPERACAO  AND'
      '   TPO.IDTIPOOPERACAO    > 0                   AND'
      '   TPO.TIPOMOVTO        <> '#39'BLQ'#39'               AND'
      '   TPO.CODTIPDOC      IS NOT NULL              '
      ''
      ' ')
    ValidateWithMask = True
    Left = 417
    Top = 151
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NATUREZAOPERACAO'
        ParamType = ptInput
      end>
  end
  object QryVerDelResgate: TwwQuery
    DatabaseName = 'basedados'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT DISTINCT'
      '     CODDOCUMENTO,'
      '     PLNCODIGO,'
      '     PLANO,'
      '     IDTIPOINVEST,'
      '     DATAMOVFUNDO'
      'FROM'
      '  (SELECT'
      '        CODDOCUMENTO,'
      '        PLNCODIGO,'
      '        PLANO,'
      '        IDTIPOINVEST,'
      '        DATAMOVFUNDO'
      '   FROM HISTFUNDO'
      '   WHERE'
      '       (IDTIPOOPERACAO NOT IN (-12,-13))  AND'
      '       (IDOPERACAOFUNDO IN (SELECT IDOPERACAOFUNDO'
      '                            FROM   OPERACAOFUNDO'
      
        '                            WHERE  IDPEDIDOFUNDO =:IDPEDIDOFUNDO' +
        '))'
      '   UNION'
      ''
      '   SELECT'
      '        CODDOCUMENTO,'
      '        PLNCODIGO,'
      '        PLANO,'
      '        IDTIPOINVEST,'
      '        DATAPEDIDO AS DATAMOVFUNDO'
      '   FROM PEDIDOFUNDO'
      '   WHERE'
      '      (CODDOCUMENTO IS NOT NULL) AND'
      '      (PLNCODIGO    IS NOT NULL) AND'
      '      (IDPEDIDOFUNDO =:IDPEDIDOFUNDO))')
    ValidateWithMask = True
    Left = 417
    Top = 301
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPEDIDOFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPEDIDOFUNDO'
        ParamType = ptUnknown
      end>
  end
  object QryTipoFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TIPOFUNDOINVEST'
      
        'WHERE (((:IDTIPOINVEST <> 0) AND (IDTIPOINVEST = :IDTIPOINVEST))' +
        ' OR'
      '        (:IDTIPOINVEST = 0))'
      'ORDER BY DESCTIPOFUNDOINV'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 322
    Top = 151
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
  end
  object qryGestorCart: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT DISTINCT G.IDGESTORCARTEIRA, P.IDPESSOA, P.NOME'
      'FROM PESSOA P, GESTORCARTEIRA G, FUNDOINVEST F'
      'WHERE'
      '   P.IDPESSOA            = G.IDGESTORCARTEIRA AND'
      '   G.IDGESTORCARTEIRA(+) = F.IDGESTORCARTEIRA'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 512
    Top = 301
    object qryGestorCartNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryGestorCartIDGESTORCARTEIRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'GESTORCARTEIRA.IDGESTORCARTEIRA'
      Visible = False
    end
    object qryGestorCartIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
      Visible = False
    end
  end
  object QryVerSaldosFundos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+INDEX (H1.XPKHISTFUNDO)*/'
      '     H1.IDFUNDOINVEST, SUM(H1.SALDOVLRFUNDO) AS SALDOVLRFUNDO'
      'FROM HISTFUNDO H1, FUNDOINVEST FI'
      ''
      'WHERE'
      ''
      
        '(H1.IDHISTFUNDO  IN (SELECT  /*+INDEX (HISTFUNDO.XIE1HISTFUNDO)*' +
        '/  MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      '                     FROM HISTFUNDO'
      '                     WHERE'
      
        '                         (IDTIPOINVEST      = :IDTIPOINVEST)    ' +
        '   AND'
      
        '                         (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR' +
        ')  AND'
      
        '                         (IDFUNDOINVEST     > 0)                ' +
        '   AND'
      
        '                         (DATAAPLICACAO    <= TO_DATE(:DATAMOVFU' +
        'NDO,  '#39'DD/MM/YYYY'#39'))      AND'
      
        '                         (DATAMOVFUNDO      = TO_DATE(:DATAMOVFU' +
        'NDO,  '#39'DD/MM/YYYY'#39'))      AND'
      
        '                        ((DATAMOVFUNDO      < TO_DATE(:DATAMOVFU' +
        'NDO,  '#39'DD/MM/YYYY'#39')) OR IDHISTFUNDO < 999999999)'
      
        '                     GROUP BY IDTIPOINVEST, IDPLANPREVCTBPATR, I' +
        'DFUNDOINVEST, DATAAPLICACAO)) AND'
      ''
      '(H1.SALDOVLRFUNDO > 0 )                                    AND'
      ''
      '(((:IDTIPOFUNDOINVEST IS NOT NULL)                         AND'
      '  (FI.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))             OR'
      '  (:IDTIPOFUNDOINVEST IS NULL) )                           AND'
      ''
      '(((:IDGESTORCARTEIRA IS NOT NULL)                          AND'
      '  (FI.IDGESTORCARTEIRA = :IDGESTORCARTEIRA))               OR'
      '  (:IDGESTORCARTEIRA IS NULL) )                            AND'
      ''
      '(H1.IDFUNDOINVEST     = FI.IDFUNDOINVEST)'
      ''
      'GROUP BY H1.IDFUNDOINVEST'
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 416
    Top = 353
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
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
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end>
  end
  object PopMnuGrafico: TPopupMenu
    Left = 322
    Top = 87
    object MnuPatrimonio: TMenuItem
      Caption = '&Patrimônio'
      OnClick = MnuPatrimonioClick
    end
    object MnuRentCotas: TMenuItem
      Caption = '&Rentabilidade de Cotas'
      OnClick = MnuRentCotasClick
    end
  end
  object QryVerAtualizacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      
        'SELECT /*+INDEX (H1.XPKHISTFUNDO)*/ MIN(DATAMOVFUNDO) AS DATAMOV' +
        'FUNDO'
      'FROM HISTFUNDO H1, FUNDOINVEST FI'
      'WHERE'
      
        '(H1.IDHISTFUNDO  IN (SELECT  /*+INDEX (HISTFUNDO.XIE1HISTFUNDO)*' +
        '/  MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      '                     FROM HISTFUNDO'
      '                     WHERE'
      '                           (IDTIPOINVEST      = :IDTIPOINVEST)'
      
        '                     AND   (IDPLANPREVCTBPATR = :IDPLANPREVCTBPA' +
        'TR)'
      '                     AND   (IDFUNDOINVEST     = :IDFUNDOINVEST)'
      
        '                     AND   (DATAAPLICACAO    <= TO_DATE(:DATAMOV' +
        'FUNDO,  '#39'DD/MM/YYYY'#39'))'
      
        '                     AND   (DATAMOVFUNDO     <= TO_DATE(:DATAMOV' +
        'FUNDO,  '#39'DD/MM/YYYY'#39'))'
      '                     AND   (TIPMOVFUNDO      <> '#39'PIR'#39')'
      
        '                     GROUP BY IDTIPOINVEST, IDPLANPREVCTBPATR, I' +
        'DFUNDOINVEST, DATAAPLICACAO))  AND'
      '(H1.SALDOQTDCOTAS > 0)                                       AND'
      '(FI.IDFUNDOINVEST = H1.IDFUNDOINVEST)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 417
    Top = 255
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptUnknown
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
  object pmnuConsSaldoFundos: TPopupMenu
    OnPopup = pmnuConsSaldoFundosPopup
    Left = 417
    Top = 87
    object FixarColuna1: TMenuItem
      Caption = 'Fixar Coluna'
      Enabled = False
      OnClick = FixarColuna1Click
    end
    object LiberarColuna1: TMenuItem
      Caption = 'Liberar Coluna'
      Enabled = False
      OnClick = LiberarColuna1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object LiberaTodasasColunas1: TMenuItem
      Caption = 'Libera Todas as Colunas'
      Enabled = False
      OnClick = LiberaTodasasColunas1Click
    end
    object mnuImprimeGrid: TMenuItem
      Caption = 'Imprime'
      Enabled = False
      OnClick = mnuImprimeGridClick
    end
  end
  object QryResgate: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT /*+INDEX(PED.XIE3PEDIDOFUNDO)*/'
      
        '  PED.IDPEDIDOFUNDO     , PED.IDTIPOINVEST      , PED.IDTIPOOPER' +
        'ACAO    ,'
      
        '  PED.IDFUNDOINVEST     , PED.DATAPEDIDO        , PED.DATALIQUID' +
        'ACAO    ,'
      
        '  PED.VLRPEDIDO         , PED.DATACOTIZACAO     , PED.IDPLANPREV' +
        'CTBPATR ,'
      
        '  PED.TRGUSERINCLUSAO   , PED.OBSERVACAO        , PED.IDTIPORESG' +
        'ATE     ,'
      '  PED.DATAAPLICACAO     ,'
      
        ' (SELECT SUM(NVL(OPE.VLRIOF,0)) FROM OPERACAOFUNDO OPE WHERE OPE' +
        '.IDPEDIDOFUNDO = PED.IDPEDIDOFUNDO) AS VLRIOF,'
      ''
      '  FUN.DESCFUNDOINVEST   , FUN.IDGESTORCARTEIRA  ,'
      
        '  FUN.IDCARTEIRAINVEST  , FUN.IDTIPOFUNDOINVEST , FUN.CNPJFUNDO ' +
        '        ,'
      
        '  FUN.STAEXCLUSIVO      , FUN.PZOCARENCIA       , FUN.PZOANIVERS' +
        'ARIO    ,'
      
        '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD ' +
        '        ,'
      
        '  FUN.QTDDECVALOR       , FUN.STAFUNDO          , FUN.PZOAMORTIZ' +
        'ACAO    ,'
      
        '  FUN.PERCTXPERFORM     , FUN.PERCTXADM         , FUN.CODFUNCETI' +
        'P       ,'
      
        '  FUN.STAPROVISIONAIR   , FUN.STAPROVISIONAIOF  , FUN.CONTRCETIP' +
        '        ,'
      
        '  FUN.TRGDTINCLUSAO     , FUN.MOECODIGO         , FUN.DTAINIPROC' +
        '        ,'
      ''
      '  TPO.DESCTIPOOPERACAO  , TPO.NATUREZAOPERACAO  ,'
      '  CAR.IDPLANOPREV       , CAR.IDPATROCINADORA   ,'
      '  '#39' '#39' AS STACONFIRMA    , '#39' '#39' As STATUS         ,'
      '  '#39'                             '#39' AS USUARIO    ,'
      '  TXA.VLRTAXAS'
      ''
      'FROM PEDIDOFUNDO PED,'
      ''
      '    (SELECT VLRTAXAS, IDPEDIDOFUNDO  FROM OPERACAOFUNDO'
      
        '     WHERE IDTIPOINVEST = :IDTIPOINVEST AND IDTIPOOPERACAO = -17' +
        '7) TXA,'
      ''
      '     TIPOOPERACAO TPO, CARTEIRAINVEST CAR,'
      ''
      '    (SELECT *'
      '     FROM HISTFUNDOINVEST'
      
        '     WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH' +
        '24:MI:SS'#39') IN'
      
        '             (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),'#39 +
        'DD/MM/YYYY, HH24:MI:SS'#39')'
      '              FROM  HISTFUNDOINVEST'
      '              WHERE IDFUNDOINVEST > 0 AND'
      
        '                    DTAVIGENCIA   < TO_DATE(:DATAOPERACAO,'#39'DD/MM' +
        '/YYYY'#39')+1'
      '              GROUP BY IDFUNDOINVEST))) FUN'
      'WHERE'
      '       (PED.IDTIPOINVEST      = :IDTIPOINVEST)'
      '  AND  (PED.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)'
      '  AND  (PED.IDFUNDOINVEST     > 0)'
      
        '  AND  (PED.DATAPEDIDO        = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYY' +
        'Y'#39'))'
      '  AND  (PED.IDTIPOOPERACAO    > 0)'
      '  AND  (PED.IDCOMPOSICAOFUNDO IS NULL)'
      
        '  AND    ((:IDGESTORCARTEIRA IS NULL) OR (FUN.IDGESTORCARTEIRA =' +
        ' :IDGESTORCARTEIRA))'
      
        '  AND    ((:IDTIPOFUNDOINVEST IS NULL) OR (FUN.IDTIPOFUNDOINVEST' +
        ' = :IDTIPOFUNDOINVEST))'
      '  AND  (TPO.TIPOMOVTO        <> '#39'BLQ'#39')'
      '  AND  (TPO.NATUREZAOPERACAO  = '#39'D'#39')'
      '  AND ((TPO.FLGTRANSF         = '#39'N'#39') OR (TPO.FLGTRANSF IS NULL))'
      '  AND  (PED.IDTIPOINVEST       = TPO.IDTIPOINVEST(+))'
      '  AND  (PED.IDTIPOOPERACAO     = TPO.IDTIPOOPERACAO(+))'
      '  AND  (FUN.IDFUNDOINVEST      = PED.IDFUNDOINVEST)'
      '  AND  (CAR.IDCARTEIRAINVEST(+)= FUN.IDCARTEIRAINVEST)'
      
        '  AND (NOT EXISTS (SELECT OPD.IDOPERACAODIREITO FROM OPERACAODIR' +
        'EITO OPD WHERE OPD.IDPEDIDOFUNDO = PED.IDPEDIDOFUNDO))'
      '  AND  (TXA.IDPEDIDOFUNDO(+)   = PED.IDPEDIDOFUNDO)'
      'ORDER BY FUN.DESCFUNDOINVEST, PED.DATAPEDIDO')
    UpdateObject = UpdResgate
    ControlType.Strings = (
      'STATUS;CheckBox;S;N'
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 39
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
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
    object QryResgateDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo'
      DisplayWidth = 24
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryResgateDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 19
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryResgateCODFUNCETIP: TStringField
      DisplayLabel = 'CETIP'
      DisplayWidth = 14
      FieldName = 'CODFUNCETIP'
      Size = 30
    end
    object QryResgateIDPEDIDOFUNDO: TFloatField
      DisplayLabel = 'Boleta'
      DisplayWidth = 7
      FieldName = 'IDPEDIDOFUNDO'
    end
    object QryResgateDATAPEDIDO: TDateTimeField
      DisplayLabel = 'Operação'
      DisplayWidth = 10
      FieldName = 'DATAPEDIDO'
    end
    object QryResgateDATALIQUIDACAO: TDateTimeField
      DisplayLabel = 'Liquidação'
      DisplayWidth = 10
      FieldName = 'DATALIQUIDACAO'
    end
    object QryResgateVLRPEDIDO: TFloatField
      DisplayLabel = 'Valor da Operação'
      DisplayWidth = 16
      FieldName = 'VLRPEDIDO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryResgateDATACOTIZACAO: TDateTimeField
      DisplayLabel = 'Cotização'
      DisplayWidth = 10
      FieldName = 'DATACOTIZACAO'
    end
    object QryResgateVLRIOF: TFloatField
      DisplayLabel = 'IOF Pago'
      DisplayWidth = 10
      FieldName = 'VLRIOF'
      DisplayFormat = '###,###,###0.00'
    end
    object QryResgateUSUARIO: TStringField
      DisplayLabel = 'Operador'
      DisplayWidth = 12
      FieldName = 'USUARIO'
      FixedChar = True
      Size = 29
    end
    object QryResgateSTACONFIRMA: TStringField
      DisplayLabel = 'Confirmada'
      DisplayWidth = 9
      FieldName = 'STACONFIRMA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryResgateSTATUS: TStringField
      DisplayLabel = 'Confirmada'
      DisplayWidth = 9
      FieldName = 'STATUS'
      Visible = False
      Size = 10
    end
    object QryResgateIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryResgateIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryResgateIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object QryResgateIDGESTORCARTEIRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGESTORCARTEIRA'
      Visible = False
    end
    object QryResgateTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Visible = False
    end
    object QryResgateTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object QryResgateMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object QryResgateIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryResgateIDTIPOFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryResgateCNPJFUNDO: TStringField
      DisplayWidth = 25
      FieldName = 'CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object QryResgateSTAEXCLUSIVO: TStringField
      DisplayWidth = 1
      FieldName = 'STAEXCLUSIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryResgatePZOCARENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOCARENCIA'
      Visible = False
    end
    object QryResgatePZOANIVERSARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOANIVERSARIO'
      Visible = False
    end
    object QryResgatePZOLIQRESG: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOLIQRESG'
      Visible = False
    end
    object QryResgateQTDDECQTD: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECQTD'
      Visible = False
    end
    object QryResgateQTDDECVALOR: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECVALOR'
      Visible = False
    end
    object QryResgateSTAFUNDO: TStringField
      DisplayWidth = 1
      FieldName = 'STAFUNDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryResgatePZOAMORTIZACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOAMORTIZACAO'
      Visible = False
    end
    object QryResgatePERCTXPERFORM: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCTXPERFORM'
      Visible = False
    end
    object QryResgatePERCTXADM: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCTXADM'
      Visible = False
    end
    object QryResgateSTAPROVISIONAIR: TStringField
      DisplayWidth = 1
      FieldName = 'STAPROVISIONAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryResgateSTAPROVISIONAIOF: TStringField
      DisplayWidth = 1
      FieldName = 'STAPROVISIONAIOF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryResgateCONTRCETIP: TStringField
      DisplayWidth = 30
      FieldName = 'CONTRCETIP'
      Visible = False
      Size = 30
    end
    object QryResgateNATUREZAOPERACAO: TStringField
      DisplayWidth = 1
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryResgateIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object QryResgateIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object QryResgateOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 300
    end
    object QryResgateIDTIPORESGATE: TFloatField
      FieldName = 'IDTIPORESGATE'
      Visible = False
    end
    object QryResgateDATAAPLICACAO: TDateTimeField
      FieldName = 'DATAAPLICACAO'
      Visible = False
    end
    object QryResgateDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
      Visible = False
    end
    object QryResgatePZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Visible = False
    end
    object QryResgateIDPATROCINADORA: TFloatField
      FieldName = 'IDPATROCINADORA'
      Visible = False
    end
    object QryResgateVLRTAXAS: TFloatField
      FieldName = 'VLRTAXAS'
      Visible = False
      DisplayFormat = '###,###,###0.00'
    end
  end
  object QryUpdPedido: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'UPDATE PEDIDOFUNDO SET'
      ''
      'CODDOCUMENTO =:CODDOCUMENTO,'
      ''
      'PLNCODIGO =:PLNCODIGO,'
      ''
      'PLANO =:PLANO'
      ''
      'WHERE IDPEDIDOFUNDO =:IDPEDIDOFUNDO')
    ValidateWithMask = True
    Left = 635
    Top = 301
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPEDIDOFUNDO'
        ParamType = ptUnknown
      end>
  end
  object QryUltDataFech: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATAULTFECH'
      'FROM   TIPOFUNDOINVEST'
      'WHERE    (IDTIPOINVEST = :IDTIPOINVEST)'
      
        '  AND (((:IDTIPOFUNDOINVEST IS NOT NULL) AND (IDTIPOFUNDOINVEST ' +
        '= :IDTIPOFUNDOINVEST)) OR'
      '        (:IDTIPOFUNDOINVEST IS NULL) )'
      'ORDER BY DATAULTFECH DESC'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 512
    Top = 353
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryVerSaldoFech: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  /*+INDEX (HISTFUNDO.XIE1HISTFUNDO)*/  MAX(IDHISTFUNDO) A' +
        'S IDHISTFUNDO'
      'FROM'
      '    HISTFUNDO'
      'WHERE'
      
        '      (IDTIPOINVEST       = :IDTIPOINVEST)                      ' +
        '         AND'
      
        '      (IDPLANPREVCTBPATR  = :IDPLANPREVCTBPATR)                 ' +
        '         AND'
      
        '   (((:IDFUNDOINVEST IS NULL)         AND (IDFUNDOINVEST > 0)) O' +
        'R'
      
        '    ((:IDFUNDOINVEST IS NOT NULL)     AND (IDFUNDOINVEST = :IDFU' +
        'NDOINVEST))) AND'
      
        '       (DATAAPLICACAO    <= TO_DATE(:DATAMOVFUNDO,  '#39'DD/MM/YYYY'#39 +
        '))      AND'
      
        '       (DATAMOVFUNDO      = TO_DATE(:DATAMOVFUNDO,  '#39'DD/MM/YYYY'#39 +
        '))      AND'
      
        '      ((DATAMOVFUNDO      < TO_DATE(:DATAMOVFUNDO,  '#39'DD/MM/YYYY'#39 +
        ')) OR IDHISTFUNDO < 999999999)')
    ValidateWithMask = True
    Left = 417
    Top = 207
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end>
  end
  object QryDelEspecificoApl: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT DISTINCT /*+INDEX(OP.XIE4OPERACAOFUNDO)*/'
      '     OP.DATAOPERACAO,'
      '     OP.IDOPERACAOFUNDO'
      'FROM'
      '    OPERACAOFUNDO OP, COMPOSICAOFUNDO CF'
      'WHERE'
      
        '   OP.IDTIPOINVEST      = :IDTIPOINVEST                       AN' +
        'D'
      
        '   OP.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR                  AN' +
        'D'
      
        '   OP.IDFUNDOINVEST     = :IDFUNDOINVEST                      AN' +
        'D'
      
        '   OP.DATAOPERACAO      = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') AN' +
        'D'
      
        '   OP.IDTIPOOPERACAO    = :IDTIPOOPERACAO                     AN' +
        'D'
      
        '   CF.IDFUNDOINVEST     = OP.IDFUNDOINVEST                    AN' +
        'D'
      '   CF.IDCOMPOSICAOFUNDO = OP.IDCOMPOSICAOFUNDO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 631
    Top = 207
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end>
  end
  object QryDelEspecificoRes: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT DISTINCT /*+INDEX(PF.XIE3PEDIDOFUNDO)*/'
      '     PF.IDPEDIDOFUNDO,'
      '     PF.IDFUNDOINVEST,'
      '     PF.DATAPEDIDO'
      'FROM'
      '    PEDIDOFUNDO PF, COMPOSICAOFUNDO CF'
      'WHERE'
      
        '   PF.IDTIPOINVEST      = :IDTIPOINVEST                       AN' +
        'D'
      
        '   PF.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR                  AN' +
        'D'
      
        '   PF.IDFUNDOINVEST     = :IDFUNDOINVEST                      AN' +
        'D'
      
        '   PF.DATAPEDIDO        = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') AN' +
        'D'
      
        '   PF.IDTIPOOPERACAO    = :IDTIPOOPERACAO                     AN' +
        'D'
      
        '   CF.IDFUNDOINVEST     = PF.IDFUNDOINVEST                    AN' +
        'D'
      '   CF.IDCOMPOSICAOFUNDO = PF.IDCOMPOSICAOFUNDO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 631
    Top = 151
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptInput
      end>
  end
  object PopMnuSaldo: TPopupMenu
    Left = 513
    Top = 87
    object MnuUmPlanoFechto: TMenuItem
      OnClick = MnuUmPlanoFechtoClick
    end
    object MnuTodosPlanosFechto: TMenuItem
      Caption = '&Todos os Planos'
      OnClick = MnuTodosPlanosFechtoClick
    end
  end
  object QryUpdOperacaoApl: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'UPDATE OPERACAOFUNDO SET'
      '       PLANO =:PLANO,'
      '       PLNCODIGO =:PLNCODIGO,'
      '       CODDOCUMENTO =:CODDOCUMENTO'
      'WHERE'
      '       IDOPERACAOFUNDO =:IDOPERACAOFUNDO')
    ValidateWithMask = True
    Left = 635
    Top = 353
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaUsuario: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT NOMEUSUARIO'
      'FROM'
      '   USUARIOSISTEMA'
      'WHERE'
      '   IDUSUARIO =:IDUSUARIO   ')
    ValidateWithMask = True
    Left = 322
    Top = 301
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end>
  end
  object pmnuDisp: TPopupMenu
    Left = 631
    Top = 87
    object mnuOnLine: TMenuItem
      Caption = 'On Line'
      Enabled = False
      Visible = False
      OnClick = mnuOnLineClick
      object mnuLento: TMenuItem
        Caption = 'Atualização Lenta'
      end
      object mnuNormal: TMenuItem
        Caption = 'Atualização Normal'
      end
      object mnuRapido: TMenuItem
        Caption = 'Atualização Rápida'
      end
    end
    object mnuOffLine: TMenuItem
      Caption = 'Off Line'
      Visible = False
      OnClick = mnuOffLineClick
    end
    object N2: TMenuItem
      Caption = '-'
      Visible = False
    end
  end
  object qryVerGrupoDisp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPO, IDUSUARIO'
      'FROM GRUPOUSU G, PARAMINVEST P'
      'WHERE G.IDUSUARIO = :IDUSUARIO'
      '  AND G.IDGRUPO = P.IDGRUPODISP')
    ValidateWithMask = True
    Left = 726
    Top = 89
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptResult
      end>
  end
  object QryDelHistFundo: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'DELETE  FROM HISTFUNDO WHERE IDHISTFUNDO = :IDHISTFUNDO')
    ValidateWithMask = True
    Left = 635
    Top = 255
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHISTFUNDO'
        ParamType = ptUnknown
      end>
  end
  object QyDelHistFundoATU: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'DELETE FROM HISTFUNDO'
      'WHERE'
      '       IDTIPOINVEST      = :IDTIPOINVEST'
      '   AND IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      '   AND IDFUNDOINVEST     = :IDFUNDOINVEST'
      '   AND DATAAPLICACAO     = :DATAAPLICACAO'
      '   AND DATAMOVFUNDO      = :DATAMOVFUNDO'
      '   AND IDTIPOOPERACAO    = :IDTIPOOPERACAO'
      '   AND IDCARTEIRAINVEST  = :IDCARTEIRAINVEST'
      '   AND NATURMOVFUNDO     = :NATURMOVFUNDO'
      '   AND TIPMOVFUNDO       = '#39'ATU'#39' ')
    ValidateWithMask = True
    Left = 635
    Top = 255
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAAPLICACAO'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'NATURMOVFUNDO'
        ParamType = ptResult
      end>
  end
  object qryTipoOperAplTx: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM  TIPOOPERACAO'
      'WHERE IDTIPOINVEST   = :IDTIPOINVEST    AND'
      '      IDTIPOOPERACAO = -176'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 228
    Top = 210
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
  end
  object dsTipoOperAplTx: TwwDataSource
    AutoEdit = False
    DataSet = qryTipoOperAplTx
    Left = 227
    Top = 250
  end
  object dsTipoOperResgTx: TwwDataSource
    AutoEdit = False
    DataSet = qryTipoOperResgTx
    Left = 139
    Top = 226
  end
  object qryTipoOperResgTx: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM  TIPOOPERACAO'
      'WHERE IDTIPOINVEST   = :IDTIPOINVEST    AND'
      '      IDTIPOOPERACAO = -177'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 140
    Top = 210
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
  end
end
