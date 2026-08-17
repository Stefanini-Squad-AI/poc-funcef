inherited frmConsultaFluxoMT: TfrmConsultaFluxoMT
  Left = 194
  Top = 162
  Caption = 'frmConsultaFluxoMT'
  ClientHeight = 523
  ClientWidth = 764
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 764
    Height = 484
    object Panel2: TPanel
      Left = 5
      Top = 5
      Width = 754
      Height = 188
      Align = alTop
      TabOrder = 0
      object lblUnidNegoc: TLabel
        Left = 3
        Top = 18
        Width = 54
        Height = 13
        Caption = 'Atividade'
      end
      object lblCentroRespon: TLabel
        Left = 189
        Top = 18
        Width = 160
        Height = 13
        Caption = 'Centro de Responsabilidade'
      end
      object Label1: TLabel
        Left = 189
        Top = 58
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object Label2: TLabel
        Left = 189
        Top = 98
        Width = 152
        Height = 13
        Caption = 'Fator de divisão da Moeda'
      end
      object Label18: TLabel
        Left = 5
        Top = 98
        Width = 73
        Height = 13
        Caption = 'Patrocinador'
      end
      object Label3: TLabel
        Left = 5
        Top = 58
        Width = 92
        Height = 13
        Caption = 'Centro de Custo'
      end
      object Bevel1: TBevel
        Left = 376
        Top = 112
        Width = 369
        Height = 73
        Shape = bsFrame
      end
      object dblcUnidNegoc: TwwDBLookupCombo
        Left = 3
        Top = 33
        Width = 175
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Nome'
          'UNECODIGO'#9'10'#9'Código'
          'UNETIPO'#9'1'#9'A/S')
        LookupTable = cdsUnidNeg
        LookupField = 'UNIDNEGOC'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblcFiltrosChange
      end
      object dblcCentroRespon: TwwDBLookupCombo
        Left = 189
        Top = 33
        Width = 179
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Nome'
          'CODCENTRORESPON'#9'10'#9'Código'
          'ANALITICOSINTET'#9'1'#9'A/S')
        LookupTable = cdsCentroRespon
        LookupField = 'CODCENTRORESPON'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblcFiltrosChange
      end
      object rgDSM: TRadioGroup
        Left = 631
        Top = 8
        Width = 115
        Height = 97
        Caption = 'Agrupar'
        ItemIndex = 0
        Items.Strings = (
          '&Diariamente'
          '&Semanalmente'
          '&Mensalmente')
        TabOrder = 11
        OnClick = rgDSMClick
      end
      object gbGrauMaximo: TGroupBox
        Left = 376
        Top = 7
        Width = 64
        Height = 98
        Caption = 'Grau'
        Enabled = False
        TabOrder = 8
        object lblCAR: TLabel
          Left = 15
          Top = 15
          Width = 26
          Height = 13
          Caption = 'CAR'
        end
        object lblCAP: TLabel
          Left = 15
          Top = 57
          Width = 25
          Height = 13
          Caption = 'CAP'
        end
        object seGrauMaxCAP: TwwDBSpinEdit
          Left = 15
          Top = 70
          Width = 40
          Height = 21
          Increment = 1
          MaxValue = 10
          MinValue = 1
          Value = 1
          TabOrder = 1
          UnboundDataType = wwDefault
          OnChange = seGrauMaxCAPChange
        end
        object seGrauMaxCAR: TwwDBSpinEdit
          Left = 15
          Top = 28
          Width = 40
          Height = 21
          Increment = 1
          MaxValue = 10
          MinValue = 1
          Value = 1
          TabOrder = 0
          UnboundDataType = wwDefault
          OnChange = seGrauMaxCARChange
        end
      end
      object gbDatas: TGroupBox
        Left = 5
        Top = 139
        Width = 268
        Height = 45
        Caption = 'Faixa de Datas'
        TabOrder = 6
        OnExit = gbDatasExit
        object lbla: TLabel
          Left = 129
          Top = 15
          Width = 8
          Height = 13
          Caption = 'a'
        end
        object deDatIni: TCMDateTimePicker
          Left = 4
          Top = 15
          Width = 114
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
          OnCloseUp = deDatasCloseUp
        end
        object deDatFim: TCMDateTimePicker
          Left = 148
          Top = 15
          Width = 114
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
          OnCloseUp = deDatasCloseUp
        end
      end
      object rgCML: TRadioGroup
        Left = 557
        Top = 7
        Width = 70
        Height = 98
        Caption = 'Prazo'
        ItemIndex = 0
        Items.Strings = (
          '&Curto'
          '&Médio'
          '&Longo')
        TabOrder = 10
        OnClick = rgCMLClick
      end
      object rgQuebra: TRadioGroup
        Left = 445
        Top = 7
        Width = 108
        Height = 98
        Caption = 'Quebrar por'
        ItemIndex = 0
        Items.Strings = (
          '&Não Quebrar'
          '&Atividade'
          '&C. Respons.'
          'C. C&usto')
        TabOrder = 9
        OnClick = rgQuebraClick
      end
      object rgAnaSint: TRadioGroup
        Left = 285
        Top = 139
        Width = 84
        Height = 45
        ItemIndex = 1
        Items.Strings = (
          '&Analitico'
          '&Sintetico')
        TabOrder = 7
        OnClick = rgAnaSintClick
      end
      object cbZerado: TCheckBox
        Left = 386
        Top = 120
        Width = 112
        Height = 17
        Caption = 'Linhas Zeradas'
        TabOrder = 12
        OnClick = cbZeradoClick
      end
      object dblcPlanoPrev: TwwDBLookupCombo
        Left = 189
        Top = 73
        Width = 179
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'NOME'#9'F')
        LookupTable = cdsPlanoPrev
        LookupField = 'IDPLANOPREV'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblcFiltrosChange
      end
      object cbExibeSabDom: TCheckBox
        Left = 386
        Top = 140
        Width = 135
        Height = 17
        Caption = 'Exibe Sáb. e Dom.'
        Checked = True
        State = cbChecked
        TabOrder = 13
        OnClick = cbExibeSabDomClick
      end
      object edFatorDivisaoMoeda: TRealEdit
        Left = 189
        Top = 113
        Width = 179
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 5
        WordWrap = False
        OnExit = edFatorDivisaoMoedaExit
        IntDigits = 10
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
      end
      object dblcPatrocinador: TwwDBLookupCombo
        Left = 5
        Top = 113
        Width = 172
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'RAZAOSOCIAL'#9'60'#9'RAZAOSOCIAL'#9'F')
        LookupTable = cdsPatrocinador
        LookupField = 'IDPESSOA'
        TabOrder = 4
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblcFiltrosChange
      end
      object dblcCentroCusto: TwwDBLookupCombo
        Left = 5
        Top = 73
        Width = 172
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Centro de Custo'#9'F'
          'CODCENTROCUSTO'#9'10'#9'Código'#9'F')
        LookupTable = cdsCentroCusto
        LookupField = 'CODCENTROCUSTO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblcFiltrosChange
      end
      object cbExibeColTotal: TCheckBox
        Left = 386
        Top = 160
        Width = 159
        Height = 17
        Caption = 'Exibe Coluna de Total'
        TabOrder = 14
        OnClick = cbExibeColTotalClick
      end
      object cbExibeColAtrasados: TCheckBox
        Left = 554
        Top = 120
        Width = 183
        Height = 17
        Caption = 'Exibe Coluna de Atrasados'
        TabOrder = 15
        OnClick = cbExibeColAtrasadosClick
      end
    end
    object pnlInformacoesFluxo: TPanel
      Left = 5
      Top = 193
      Width = 754
      Height = 39
      Align = alTop
      BevelInner = bvLowered
      Caption = 'Período Consultado:'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object trkbLarguraTitulo: TTrackBar
        Left = 1
        Top = 4
        Width = 152
        Height = 31
        Hint = 'Altera a largura do título das linhas do fluxo.'
        Max = 20
        Orientation = trHorizontal
        ParentShowHint = False
        Frequency = 1
        Position = 0
        SelEnd = 0
        SelStart = 0
        ShowHint = True
        TabOrder = 0
        TickMarks = tmBottomRight
        TickStyle = tsAuto
        OnChange = trkbLarguraTituloChange
      end
    end
    object sgFluxo: TStringGrid
      Left = 5
      Top = 232
      Width = 754
      Height = 247
      Align = alClient
      DefaultRowHeight = 18
      RowCount = 3
      FixedRows = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
      ParentFont = False
      TabOrder = 2
      OnDblClick = sgFluxoDblClick
      OnDrawCell = sgFluxoDrawCell
      RowHeights = (
        18
        18
        18)
    end
    object sgFluxoAux: TStringGrid
      Left = 74
      Top = 272
      Width = 127
      Height = 73
      FixedCols = 0
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      ParentFont = False
      TabOrder = 3
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 484
    Width = 764
    object pnlProgresso: TPanel [0]
      Left = 8
      Top = 2
      Width = 310
      Height = 33
      Align = alClient
      TabOrder = 2
      object prgBarAtuFluxo: TProgressBar
        Left = 1
        Top = 1
        Width = 308
        Height = 15
        Align = alTop
        Min = 0
        Max = 100
        Smooth = True
        Step = 1
        TabOrder = 0
      end
      object prgBarExibicao: TProgressBar
        Left = 1
        Top = 16
        Width = 308
        Height = 16
        Align = alClient
        Min = 0
        Max = 100
        Smooth = True
        Step = 1
        TabOrder = 1
      end
    end
    object pnlLegenda: TPanel [1]
      Left = 8
      Top = 2
      Width = 310
      Height = 33
      Align = alClient
      TabOrder = 1
      object shpRecSemPrev: TShape
        Left = 6
        Top = 3
        Width = 10
        Height = 13
        Brush.Color = clBlue
        Pen.Color = clNone
        Shape = stCircle
      end
      object lblCorAzul: TLabel
        Left = 21
        Top = 3
        Width = 121
        Height = 13
        Caption = 'Receb. sem Previsão'
      end
      object shpPgtoSemPrev: TShape
        Left = 156
        Top = 3
        Width = 10
        Height = 13
        Brush.Color = clMaroon
        Pen.Color = clNone
        Shape = stCircle
      end
      object lblCorVermelha: TLabel
        Left = 174
        Top = 3
        Width = 117
        Height = 13
        Caption = 'Pagto. sem Previsão'
      end
      object lblCorRosa: TLabel
        Left = 174
        Top = 18
        Width = 118
        Height = 13
        Caption = 'Pagto. com Previsão'
      end
      object shpPgtoComPrev: TShape
        Left = 156
        Top = 18
        Width = 10
        Height = 13
        Brush.Color = clFuchsia
        Pen.Color = clNone
        Shape = stCircle
      end
      object lblCorVerde: TLabel
        Left = 21
        Top = 18
        Width = 122
        Height = 13
        Caption = 'Receb. com Previsão'
      end
      object shpRecComPrev: TShape
        Left = 6
        Top = 18
        Width = 10
        Height = 13
        Brush.Color = clTeal
        Pen.Color = clNone
        Shape = stCircle
      end
    end
    inherited tb97Fundo: TToolbar97
      Left = 378
      DockPos = 378
      inherited sep1: TToolbarSep97
        Left = 116
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 288
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 206
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 208
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 290
      end
      object bbtnMostrarFluxo: TBitBtn
        Left = 0
        Top = 0
        Width = 116
        Height = 33
        Cancel = True
        Caption = 'Mostrar &Fluxo'
        TabOrder = 2
        OnClick = bbtnMostrarFluxoClick
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
        Spacing = 2
      end
      object rbtnImprimir: TBitBtn
        Left = 118
        Top = 0
        Width = 88
        Height = 33
        Cancel = True
        Caption = '&Imprimir'
        TabOrder = 3
        OnClick = rbtnImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 707
    Top = 243
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        ''
        'Cells'
        0))
  end
  object pplImpRetrato: TppBDEPipeline
    DataSource = dsImp
    SkipWhenNoRecords = False
    UserName = 'lImpRetrato'
    Left = 152
    Top = 376
    object pplImpppField1: TppField
      FieldAlias = 'RECPAG'
      FieldName = 'RECPAG'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplImpppField2: TppField
      FieldAlias = 'DATA1'
      FieldName = 'DATA1'
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
    object pplImpppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR1'
      FieldName = 'VALOR1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplImpppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'COR1'
      FieldName = 'COR1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplImpppField5: TppField
      FieldAlias = 'DATA2'
      FieldName = 'DATA2'
      FieldLength = 30
      DisplayWidth = 30
      Position = 4
    end
    object pplImpppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR2'
      FieldName = 'VALOR2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplImpppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'COR2'
      FieldName = 'COR2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplImpppField8: TppField
      FieldAlias = 'DATA3'
      FieldName = 'DATA3'
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
    object pplImpppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR3'
      FieldName = 'VALOR3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplImpppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'COR3'
      FieldName = 'COR3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplImpppField11: TppField
      FieldAlias = 'DATA4'
      FieldName = 'DATA4'
      FieldLength = 30
      DisplayWidth = 30
      Position = 10
    end
    object pplImpppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR4'
      FieldName = 'VALOR4'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplImpppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'COR4'
      FieldName = 'COR4'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplImpppField14: TppField
      FieldAlias = 'DATA5'
      FieldName = 'DATA5'
      FieldLength = 30
      DisplayWidth = 30
      Position = 13
    end
    object pplImpppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR5'
      FieldName = 'VALOR5'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplImpppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'COR5'
      FieldName = 'COR5'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
  end
  object rpImpRetrato: TppReport
    AutoStop = False
    DataPipeline = pplImpRetrato
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 232
    Top = 376
    Version = '5.5'
    mmColumnWidth = 197300
    object HeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 43127
      mmPrintPosition = 0
      object pplblTitulo: TppLabel
        UserName = 'lblTitulo'
        Caption = 'Título do Relatório'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 79640
        mmTop = 16933
        mmWidth = 37835
        BandType = 0
      end
      object Line1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 35190
        mmWidth = 197300
        BandType = 0
      end
      object pplblEmpresa: TppLabel
        UserName = 'lblEmpresa'
        Caption = 'lblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 85725
        mmTop = 9790
        mmWidth = 26458
        BandType = 0
      end
      object pplblRecSemPrev: TppLabel
        UserName = 'lblRecSemPrev'
        Caption = 'Recebimentos sem Previsão'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 29369
        mmWidth = 43656
        BandType = 0
      end
      object pplblRecComPrev: TppLabel
        UserName = 'lblRecComPrev'
        Caption = 'Recebimentos com Previsão'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 57150
        mmTop = 29369
        mmWidth = 43127
        BandType = 0
      end
      object pplblPagSemPrev: TppLabel
        UserName = 'lblPagSemPrev'
        Caption = 'Pagamentos sem Previsão'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 107950
        mmTop = 29369
        mmWidth = 41010
        BandType = 0
      end
      object pplblPagComPrev: TppLabel
        UserName = 'lblPagComPrev'
        Caption = 'Pagamentos com Previsão'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 156634
        mmTop = 29369
        mmWidth = 40481
        BandType = 0
      end
      object ppLabelData1: TppLabel
        OnPrint = ppLabelDataPrint
        UserName = 'DATA1'
        AutoSize = False
        Caption = 'Data/Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 58208
        mmTop = 37042
        mmWidth = 26194
        BandType = 0
      end
      object ppLabelData4: TppLabel
        OnPrint = ppLabelDataPrint
        UserName = 'DATA4'
        AutoSize = False
        Caption = 'Data/Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 140759
        mmTop = 36777
        mmWidth = 26194
        BandType = 0
      end
      object ppLabelData5: TppLabel
        OnPrint = ppLabelDataPrint
        UserName = 'DATA5'
        AutoSize = False
        Caption = 'Data/Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 168275
        mmTop = 36777
        mmWidth = 26194
        BandType = 0
      end
      object ppLabelData2: TppLabel
        OnPrint = ppLabelDataPrint
        UserName = 'DATA2'
        AutoSize = False
        Caption = 'Data/Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 85725
        mmTop = 37042
        mmWidth = 26194
        BandType = 0
      end
      object ppLabelData3: TppLabel
        OnPrint = ppLabelDataPrint
        UserName = 'DATA3'
        AutoSize = False
        Caption = 'Data/Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 113242
        mmTop = 36777
        mmWidth = 26194
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 42069
        mmWidth = 197300
        BandType = 0
      end
      object ppshpPgtoSemPrev: TppShape
        UserName = 'shpPgtoSemPrev'
        Brush.Color = clMaroon
        mmHeight = 3440
        mmLeft = 103717
        mmTop = 29369
        mmWidth = 2910
        BandType = 0
      end
      object ppshpRecSemPrev: TppShape
        UserName = 'shpRecSemPrev'
        Brush.Color = clBlue
        mmHeight = 3440
        mmLeft = 1852
        mmTop = 29369
        mmWidth = 2910
        BandType = 0
      end
      object ppshpPgtoComPrev: TppShape
        UserName = 'shpPgtoComPrev'
        Brush.Color = clFuchsia
        mmHeight = 3440
        mmLeft = 152400
        mmTop = 29369
        mmWidth = 2910
        BandType = 0
      end
      object ppshpRecComPrev: TppShape
        UserName = 'shpRecComPrev'
        Brush.Color = clTeal
        mmHeight = 3440
        mmLeft = 52917
        mmTop = 29369
        mmWidth = 2910
        BandType = 0
      end
      object pplblNomeRelat: TppLabel
        UserName = 'LblEmpresa1'
        AutoSize = False
        Caption = 'Fluxo de Caixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6879
        mmLeft = 0
        mmTop = 1323
        mmWidth = 197380
        BandType = 0
      end
      object pplblFiltro: TppLabel
        UserName = 'lblTitulo1'
        AutoSize = False
        Caption = 'Filtro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 23019
        mmWidth = 197380
        BandType = 0
      end
    end
    object BandaDetalhe: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBTextLinhaFluxo: TppDBText
        OnPrint = ppDBTextLinhaFluxoPrint
        UserName = 'dbtRecPag'
        DataField = 'LINHAFLUXO'
        DataPipeline = pplImpRetrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 529
        mmWidth = 54240
        BandType = 4
      end
      object ppLineSeparacao: TppLine
        UserName = 'LineSeparacao'
        Pen.Width = 3
        ParentWidth = True
        Visible = False
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 2117
        mmWidth = 197300
        BandType = 4
      end
      object ppDBTextValor5: TppDBText
        OnPrint = ppDBTextValorPrint
        UserName = 'VALOR5'
        DataField = 'VALOR5'
        DataPipeline = pplImpRetrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 168275
        mmTop = 529
        mmWidth = 26194
        BandType = 4
      end
      object ppDBTextValor1: TppDBText
        OnPrint = ppDBTextValorPrint
        UserName = 'VALOR1'
        DataField = 'VALOR1'
        DataPipeline = pplImpRetrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 58208
        mmTop = 529
        mmWidth = 26194
        BandType = 4
      end
      object ppDBTextValor3: TppDBText
        OnPrint = ppDBTextValorPrint
        UserName = 'VALOR3'
        DataField = 'VALOR3'
        DataPipeline = pplImpRetrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 113242
        mmTop = 529
        mmWidth = 26194
        BandType = 4
      end
      object ppDBTextValor2: TppDBText
        OnPrint = ppDBTextValorPrint
        UserName = 'VALOR2'
        DataField = 'VALOR2'
        DataPipeline = pplImpRetrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 85725
        mmTop = 529
        mmWidth = 26194
        BandType = 4
      end
      object ppDBTextValor4: TppDBText
        OnPrint = ppDBTextValorPrint
        UserName = 'VALOR4'
        DataField = 'VALOR4'
        DataPipeline = pplImpRetrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 140759
        mmTop = 529
        mmWidth = 26194
        BandType = 4
      end
    end
    object FooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object Calc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2646
        mmWidth = 197380
        BandType = 8
      end
      object ppLblSistema: TppLabel
        OnPrint = ppLblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2646
        mmWidth = 197115
        BandType = 8
      end
      object Line2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object Calc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 2646
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DATA1'
      DataPipeline = pplImpRetrato
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object dsImp: TwwDataSource
    DataSet = cdsImp
    Left = 88
    Top = 400
  end
  object cdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 120
    Top = 56
  end
  object cdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 288
    Top = 56
  end
  object cdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 288
    Top = 8
  end
  object cdsUnidNeg: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 120
    Top = 8
  end
  object cdsPatrocinador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 120
    Top = 104
  end
  object cdsImp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 40
    Top = 400
  end
  object cdsColunasFluxo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 376
    Top = 240
  end
  object cdsNumTerTRD: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 376
    Top = 296
  end
  object cdsNumTerTDOC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 464
    Top = 296
  end
  object cdsLinhasFluxo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 464
    Top = 240
  end
  object ppImpPaisagem: TppBDEPipeline
    DataSource = dsImp
    SkipWhenNoRecords = False
    UserName = 'lImp1'
    Left = 152
    Top = 424
    object ppField1: TppField
      FieldAlias = 'RECPAG'
      FieldName = 'RECPAG'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'DATA1'
      FieldName = 'DATA1'
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
    object ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR1'
      FieldName = 'VALOR1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'COR1'
      FieldName = 'COR1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'DATA2'
      FieldName = 'DATA2'
      FieldLength = 30
      DisplayWidth = 30
      Position = 4
    end
    object ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR2'
      FieldName = 'VALOR2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'COR2'
      FieldName = 'COR2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'DATA3'
      FieldName = 'DATA3'
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
    object ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR3'
      FieldName = 'VALOR3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'COR3'
      FieldName = 'COR3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppField11: TppField
      FieldAlias = 'DATA4'
      FieldName = 'DATA4'
      FieldLength = 30
      DisplayWidth = 30
      Position = 10
    end
    object ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR4'
      FieldName = 'VALOR4'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'COR4'
      FieldName = 'COR4'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppField14: TppField
      FieldAlias = 'DATA5'
      FieldName = 'DATA5'
      FieldLength = 30
      DisplayWidth = 30
      Position = 13
    end
    object ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR5'
      FieldName = 'VALOR5'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'COR5'
      FieldName = 'COR5'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
  end
  object rpImpPaisagem: TppReport
    AutoStop = False
    DataPipeline = ppImpPaisagem
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 232
    Top = 424
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 43127
      mmPrintPosition = 0
      object pplblTituloPaisagem: TppLabel
        UserName = 'lblTitulo'
        Caption = 'Título do Relatório'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 123296
        mmTop = 16933
        mmWidth = 37835
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 35190
        mmWidth = 284300
        BandType = 0
      end
      object pplblEmpresaPaisagem: TppLabel
        UserName = 'lblEmpresaPaisagem'
        Caption = 'lblEmpresaPaisagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 118004
        mmTop = 9790
        mmWidth = 49213
        BandType = 0
      end
      object pplblRecSemPrevPaisag: TppLabel
        UserName = 'lblRecSemPrev'
        Caption = 'Recebimentos sem Previsão'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 29369
        mmWidth = 43656
        BandType = 0
      end
      object pplblRecComPrevPaisag: TppLabel
        UserName = 'lblRecComPrev'
        Caption = 'Recebimentos com Previsão'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 61119
        mmTop = 29369
        mmWidth = 43127
        BandType = 0
      end
      object pplblPagSemPrevPaisag: TppLabel
        UserName = 'lblPagSemPrev'
        Caption = 'Pagamentos sem Previsão'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 115623
        mmTop = 29633
        mmWidth = 41010
        BandType = 0
      end
      object pplblPagComPrevPaisag: TppLabel
        UserName = 'lblPagComPrev'
        Caption = 'Pagamentos com Previsão'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 168540
        mmTop = 29633
        mmWidth = 40481
        BandType = 0
      end
      object ppLabel7: TppLabel
        OnPrint = ppLabelDataPrint
        UserName = 'DATA1'
        AutoSize = False
        Caption = 'Data/Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 58208
        mmTop = 37042
        mmWidth = 26194
        BandType = 0
      end
      object ppLabel8: TppLabel
        OnPrint = ppLabelDataPrint
        UserName = 'DATA4'
        AutoSize = False
        Caption = 'Data/Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 140759
        mmTop = 36777
        mmWidth = 26194
        BandType = 0
      end
      object ppLabel9: TppLabel
        OnPrint = ppLabelDataPrint
        UserName = 'DATA5'
        AutoSize = False
        Caption = 'Data/Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 168275
        mmTop = 36777
        mmWidth = 26194
        BandType = 0
      end
      object ppLabel10: TppLabel
        OnPrint = ppLabelDataPrint
        UserName = 'DATA2'
        AutoSize = False
        Caption = 'Data/Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 85725
        mmTop = 37042
        mmWidth = 26194
        BandType = 0
      end
      object ppLabel11: TppLabel
        OnPrint = ppLabelDataPrint
        UserName = 'DATA3'
        AutoSize = False
        Caption = 'Data/Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 113242
        mmTop = 36777
        mmWidth = 26194
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 42069
        mmWidth = 284300
        BandType = 0
      end
      object ppshpPgtoSemPrevPaisag: TppShape
        UserName = 'shpPgtoSemPrev'
        Brush.Color = clMaroon
        mmHeight = 3440
        mmLeft = 111390
        mmTop = 29633
        mmWidth = 2910
        BandType = 0
      end
      object ppshpRecSemPrevPaisag: TppShape
        UserName = 'shpRecSemPrev'
        Brush.Color = clBlue
        mmHeight = 3440
        mmLeft = 1852
        mmTop = 29369
        mmWidth = 2910
        BandType = 0
      end
      object ppshpPgtoComPrevPaisag: TppShape
        UserName = 'shpPgtoComPrev'
        Brush.Color = clFuchsia
        mmHeight = 3440
        mmLeft = 164307
        mmTop = 29633
        mmWidth = 2910
        BandType = 0
      end
      object ppshpRecComPrevPaisag: TppShape
        UserName = 'shpRecComPrev'
        Brush.Color = clTeal
        mmHeight = 3440
        mmLeft = 56886
        mmTop = 29369
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'LblEmpresa1'
        AutoSize = False
        Caption = 'Fluxo de Caixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6879
        mmLeft = 0
        mmTop = 1323
        mmWidth = 283634
        BandType = 0
      end
      object pplblFiltroPaisagem: TppLabel
        UserName = 'lblTitulo1'
        AutoSize = False
        Caption = 'Filtro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 23019
        mmWidth = 283634
        BandType = 0
      end
      object ppLabel15: TppLabel
        OnPrint = ppLabelDataPrint
        UserName = 'DATA6'
        AutoSize = False
        Caption = 'Data/Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 195792
        mmTop = 36777
        mmWidth = 26194
        BandType = 0
      end
      object ppLabel16: TppLabel
        OnPrint = ppLabelDataPrint
        UserName = 'DATA7'
        AutoSize = False
        Caption = 'Data/Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 223309
        mmTop = 36777
        mmWidth = 26194
        BandType = 0
      end
      object ppLabel17: TppLabel
        OnPrint = ppLabelDataPrint
        UserName = 'DATA8'
        AutoSize = False
        Caption = 'Data/Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 250825
        mmTop = 36777
        mmWidth = 26194
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        OnPrint = ppDBTextLinhaFluxoPrint
        UserName = 'dbtRecPag'
        DataField = 'LINHAFLUXO'
        DataPipeline = ppImpPaisagem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 529
        mmWidth = 54240
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'LineSeparacao'
        Pen.Width = 3
        ParentWidth = True
        Visible = False
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 2117
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText2: TppDBText
        OnPrint = ppDBTextValorPrint
        UserName = 'VALOR5'
        DataField = 'VALOR5'
        DataPipeline = ppImpPaisagem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 168275
        mmTop = 529
        mmWidth = 26194
        BandType = 4
      end
      object ppDBText3: TppDBText
        OnPrint = ppDBTextValorPrint
        UserName = 'VALOR1'
        DataField = 'VALOR1'
        DataPipeline = ppImpPaisagem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 58208
        mmTop = 529
        mmWidth = 26194
        BandType = 4
      end
      object ppDBText4: TppDBText
        OnPrint = ppDBTextValorPrint
        UserName = 'VALOR3'
        DataField = 'VALOR3'
        DataPipeline = ppImpPaisagem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 113242
        mmTop = 529
        mmWidth = 26194
        BandType = 4
      end
      object ppDBText5: TppDBText
        OnPrint = ppDBTextValorPrint
        UserName = 'VALOR2'
        DataField = 'VALOR2'
        DataPipeline = ppImpPaisagem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 85725
        mmTop = 529
        mmWidth = 26194
        BandType = 4
      end
      object ppDBText6: TppDBText
        OnPrint = ppDBTextValorPrint
        UserName = 'VALOR4'
        DataField = 'VALOR4'
        DataPipeline = ppImpPaisagem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 140759
        mmTop = 529
        mmWidth = 26194
        BandType = 4
      end
      object ppDBText7: TppDBText
        OnPrint = ppDBTextValorPrint
        UserName = 'VALOR6'
        DataField = 'VALOR6'
        DataPipeline = ppImpPaisagem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 195792
        mmTop = 529
        mmWidth = 26194
        BandType = 4
      end
      object ppDBText8: TppDBText
        OnPrint = ppDBTextValorPrint
        UserName = 'VALOR7'
        DataField = 'VALOR7'
        DataPipeline = ppImpPaisagem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 223309
        mmTop = 529
        mmWidth = 26194
        BandType = 4
      end
      object ppDBText9: TppDBText
        OnPrint = ppDBTextValorPrint
        UserName = 'VALOR8'
        DataField = 'VALOR8'
        DataPipeline = ppImpPaisagem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 250825
        mmTop = 529
        mmWidth = 26194
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2381
        mmWidth = 197380
        BandType = 8
      end
      object ppLblSistemaPaisagem: TppLabel
        OnPrint = ppLblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2381
        mmWidth = 285486
        BandType = 8
      end
      object ppLine5: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 794
        mmWidth = 284300
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 256646
        mmTop = 2381
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DATA1'
      DataPipeline = ppImpPaisagem
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
end
