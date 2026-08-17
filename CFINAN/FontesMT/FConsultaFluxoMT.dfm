inherited frmConsultaFluxoMT: TfrmConsultaFluxoMT
  Left = 174
  Top = 116
  ActiveControl = dblcUnidNegoc
  Caption = 'frmConsultaFluxoMT'
  ClientHeight = 523
  ClientWidth = 764
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 764
    Height = 484
    object pnlFiltros: TPanel
      Left = 1
      Top = 1
      Width = 762
      Height = 255
      Align = alTop
      TabOrder = 0
      object lblUnidNegoc: TLabel
        Left = 189
        Top = 10
        Width = 54
        Height = 13
        Caption = 'Atividade'
      end
      object lblCentroRespon: TLabel
        Left = 189
        Top = 50
        Width = 160
        Height = 13
        Caption = 'Centro de Responsabilidade'
      end
      object Label2: TLabel
        Left = 189
        Top = 138
        Width = 152
        Height = 13
        Caption = 'Fator de divisão da Moeda'
      end
      object Label3: TLabel
        Left = 5
        Top = 50
        Width = 92
        Height = 13
        Caption = 'Centro de Custo'
      end
      object Bevel1: TBevel
        Left = 375
        Top = 187
        Width = 377
        Height = 64
        Shape = bsFrame
      end
      object Label5: TLabel
        Left = 5
        Top = 10
        Width = 111
        Height = 13
        Caption = 'Montagem de Fluxo'
      end
      object lblPortador: TLabel
        Left = 5
        Top = 138
        Width = 125
        Height = 13
        Caption = 'Conta Bancária/Caixa'
      end
      object Bevel2: TBevel
        Left = 562
        Top = 188
        Width = 2
        Height = 61
        Shape = bsLeftLine
      end
      object Label18: TLabel
        Left = 5
        Top = 95
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label1: TLabel
        Left = 189
        Top = 95
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object dblcUnidNegoc: TwwDBLookupCombo
        Left = 189
        Top = 25
        Width = 180
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Descrição'#9'F'
          'UNECODIGO'#9'10'#9'Código'#9'F'
          'UNETIPO'#9'12'#9'Anal./Sint.'#9'F')
        LookupTable = cdsUnidNeg
        LookupField = 'UNIDNEGOC'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = FiltrosExit
      end
      object dblcCentroRespon: TwwDBLookupCombo
        Left = 189
        Top = 65
        Width = 180
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Descrição'#9'F'
          'CODCENTRORESPON'#9'10'#9'Código'#9'F'
          'ANALITICOSINTET'#9'12'#9'Anal./Sint.'#9'F')
        LookupTable = cdsCentroRespon
        LookupField = 'CODCENTRORESPON'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = FiltrosExit
      end
      object rgDSM: TRadioGroup
        Left = 631
        Top = 20
        Width = 120
        Height = 152
        Caption = 'Agrupar'
        ItemIndex = 0
        Items.Strings = (
          '&Diariamente'
          '&Semanalmente'
          '&Mensalmente')
        TabOrder = 12
        OnClick = rgDSMClick
      end
      object gbGrauMaximo: TGroupBox
        Left = 376
        Top = 21
        Width = 64
        Height = 152
        Caption = 'Grau'
        Enabled = False
        TabOrder = 10
        object lblCAR: TLabel
          Left = 14
          Top = 30
          Width = 26
          Height = 13
          Caption = 'CAR'
        end
        object lblCAP: TLabel
          Left = 14
          Top = 88
          Width = 25
          Height = 13
          Caption = 'CAP'
        end
        object seGrauMaxCAP: TwwDBSpinEdit
          Left = 14
          Top = 101
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
          Left = 14
          Top = 43
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
        Top = 187
        Width = 268
        Height = 64
        Caption = 'Faixa de Datas'
        TabOrder = 8
        OnExit = gbDatasExit
        object lbla: TLabel
          Left = 129
          Top = 29
          Width = 8
          Height = 13
          Caption = 'a'
        end
        object deDatIni: TCMDateTimePicker
          Left = 4
          Top = 25
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
          OnCloseUp = deDataCloseUp
          OnExit = deDataExit
        end
        object deDatFim: TCMDateTimePicker
          Left = 148
          Top = 24
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
          OnCloseUp = deDataCloseUp
          OnExit = deDataExit
        end
      end
      object rgCML: TRadioGroup
        Left = 557
        Top = 21
        Width = 70
        Height = 152
        Caption = 'Prazo'
        ItemIndex = 0
        Items.Strings = (
          '&Curto'
          '&Médio'
          '&Longo')
        TabOrder = 11
        OnClick = rgCMLClick
      end
      object rgAnaSint: TRadioGroup
        Left = 285
        Top = 187
        Width = 84
        Height = 64
        ItemIndex = 1
        Items.Strings = (
          '&Analítico'
          '&Sintético')
        TabOrder = 9
        OnClick = rgAnaSintClick
      end
      object cbZerado: TCheckBox
        Left = 386
        Top = 192
        Width = 112
        Height = 17
        Caption = 'Linhas Zeradas'
        TabOrder = 13
        OnClick = cbZeradoClick
      end
      object cbExibeSabDom: TCheckBox
        Left = 386
        Top = 210
        Width = 167
        Height = 17
        Caption = 'Exibe Sáb. Dom. e feriados'
        Checked = True
        State = cbChecked
        TabOrder = 14
        OnClick = cbExibeSabDomClick
      end
      object edFatorDivisaoMoeda: TRealEdit
        Left = 189
        Top = 153
        Width = 180
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 7
        WordWrap = False
        OnExit = edFatorDivisaoMoedaExit
        IntDigits = 10
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
      end
      object dblcCentroCusto: TwwDBLookupCombo
        Left = 5
        Top = 65
        Width = 175
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Descrição'#9'F'
          'CODCENTROCUSTO'#9'10'#9'Código'#9'F'
          'STATUSGRUPOCDC'#9'1'#9'Anal./Sint.'#9'F')
        LookupTable = cdsCentroCusto
        LookupField = 'CODCENTROCUSTO'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = FiltrosExit
      end
      object cbExibeColTotal: TCheckBox
        Left = 386
        Top = 228
        Width = 159
        Height = 17
        Caption = 'Exibe Coluna de Total'
        TabOrder = 15
        OnClick = cbExibeColTotalClick
      end
      object cbExibeColAtrasados: TCheckBox
        Left = 570
        Top = 192
        Width = 175
        Height = 17
        Caption = 'Exibe Coluna de Atrasados'
        TabOrder = 16
        OnClick = cbExibeColAtrasadosClick
      end
      object dblcMontagemFluxo: TwwDBLookupCombo
        Left = 5
        Top = 25
        Width = 174
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'Montagem de Fluxo'#9'F')
        LookupTable = cdsMontagemFluxo
        LookupField = 'IDFLUXOCAIXA'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblcMontagemFluxoChange
      end
      object dblcPortador: TwwDBLookupCombo
        Left = 5
        Top = 153
        Width = 175
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'Conta Bancária/Caixa'#9'F')
        LookupTable = cdsPortador
        LookupField = 'CODPORTADOR'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblcPortadorChange
      end
      object cbExibeSaldoBancos: TCheckBox
        Left = 570
        Top = 210
        Width = 167
        Height = 17
        Caption = 'Exibe Saldo dos Bancos'
        TabOrder = 17
        OnClick = cbExibeSaldoBancosClick
      end
      object dblcPatrocinador: TwwDBLookupCombo
        Left = 5
        Top = 110
        Width = 175
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'RAZAOSOCIAL'#9'40'#9'Descrição'#9'F')
        LookupTable = cdsPatrocinador
        LookupField = 'IDPESSOA'
        Options = [loTitles]
        TabOrder = 4
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnExit = FiltrosExit
      end
      object dblcPlanoPrev: TwwDBLookupCombo
        Left = 189
        Top = 110
        Width = 180
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'40'#9'Descrição'#9'F')
        LookupTable = cdsPlanoPrev
        LookupField = 'IDPLANOPREV'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = FiltrosExit
      end
      object chkExibePercentual: TCheckBox
        Left = 570
        Top = 229
        Width = 167
        Height = 17
        Caption = 'Exibir variação (%)'
        TabOrder = 18
        OnClick = cbExibeColTotalClick
      end
    end
    object pnlInformacoesFluxo: TPanel
      Left = 1
      Top = 256
      Width = 762
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
      object lblDetalhes: TLabel
        Left = 592
        Top = 13
        Width = 142
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Clique + Shift = Detalhes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInfoBk
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
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
      Left = 1
      Top = 295
      Width = 762
      Height = 188
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
      Left = 622
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
      Left = 345
      DockPos = 345
      inherited sep1: TToolbarSep97
        Left = 145
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 318
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 235
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 237
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 320
      end
      object bbtnExibirFluxo: TBitBtn
        Left = 0
        Top = 0
        Width = 145
        Height = 33
        Hint = 'Exibe o Fluxo de Caixa'
        Cancel = True
        Caption = 'Exibir &Fluxo'
        TabOrder = 2
        OnClick = bbtnExibirFluxoClick
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
        Left = 147
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
  object rgQuebra: TRadioGroup [2]
    Left = 445
    Top = 23
    Width = 108
    Height = 151
    Caption = 'Quebrar por'
    ItemIndex = 0
    Items.Strings = (
      '&Não Quebrar'
      '&Atividade'
      '&C. Respons.'
      'C. C&usto'
      '&Plano')
    TabOrder = 2
    OnClick = rgQuebraClick
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 8
    Top = 448
    TargetsData = (
      1
      2
      (
        '*'
        'Filter'
        0)
      (
        'TMemo'
        'Text'
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
    PrinterSetup.PaperName = 'A4'
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 232
    Top = 376
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplImpRetrato'
    object HeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 42333
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
        mmLeft = 62971
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
        mmHeight = 3969
        mmLeft = 143934
        mmTop = 37042
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
        mmLeft = 170657
        mmTop = 37042
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
        mmLeft = 89959
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
        mmLeft = 116946
        mmTop = 37042
        mmWidth = 26194
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 42068
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
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplImpRetrato'
        mmHeight = 2879
        mmLeft = 794
        mmTop = 529
        mmWidth = 61119
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
        DataPipelineName = 'pplImpRetrato'
        mmHeight = 3969
        mmLeft = 170657
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
        DataPipelineName = 'pplImpRetrato'
        mmHeight = 3969
        mmLeft = 62971
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
        DataPipelineName = 'pplImpRetrato'
        mmHeight = 3969
        mmLeft = 116946
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
        DataPipelineName = 'pplImpRetrato'
        mmHeight = 3969
        mmLeft = 89959
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
        DataPipelineName = 'pplImpRetrato'
        mmHeight = 3969
        mmLeft = 143934
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
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplImpRetrato'
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
    Left = 872
    Top = 72
  end
  object cdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 872
    Top = 16
  end
  object cdsUnidNeg: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 768
    Top = 72
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
    Left = 384
    Top = 376
  end
  object cdsNumTerTRD: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 384
    Top = 432
  end
  object cdsNumTerTDOC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 472
    Top = 432
  end
  object cdsLinhasFluxo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 472
    Top = 376
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
    PrinterSetup.PaperName = 'A4'
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 232
    Top = 424
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppImpPaisagem'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 42333
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
        mmTop = 37042
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
        mmTop = 37042
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
        mmTop = 37042
        mmWidth = 26194
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 42068
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
      object pplblNomeRelatPaisagem: TppLabel
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
        mmTop = 37042
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
        mmTop = 37042
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
        mmTop = 37042
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
        DataPipelineName = 'ppImpPaisagem'
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
        DataPipelineName = 'ppImpPaisagem'
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
        DataPipelineName = 'ppImpPaisagem'
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
        DataPipelineName = 'ppImpPaisagem'
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
        DataPipelineName = 'ppImpPaisagem'
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
        DataPipelineName = 'ppImpPaisagem'
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
        DataPipelineName = 'ppImpPaisagem'
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
        DataPipelineName = 'ppImpPaisagem'
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
        DataPipelineName = 'ppImpPaisagem'
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
        mmLeft = 43921
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
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppImpPaisagem'
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
  object cdsMontagemFluxo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 768
    Top = 16
  end
  object cdsPortador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 776
    Top = 128
  end
  object cdsLinhasSaldo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 571
    Top = 376
  end
  object imglBotoes: TImageList
    Height = 18
    Width = 36
    Left = 384
    Top = 320
    Bitmap = {
      494C010102000400040024001200FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000900000001200000001002000000000008028
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000808080008080800080808000C0C0C000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF007F7F7F00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF000000FF00000080000000
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF008080
      8000FFFFFF000000000080808000FFFFFF008080800080808000C0C0C0000000
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFF
      FF00FFFFFF008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF00000000000000000000000000FFFFFF00000000007F7F7F00FFFF
      FF007F7F7F007F7F7F00000000007F7F7F007F7F7F00000000007F7F7F007F7F
      7F00000000007F7F7F007F7F7F007F7F7F00000000007F7F7F00000000000000
      0000000000000000000000000000FFFFFF00000000000000FF00000080000000
      000000000000808080000000000000000000FFFFFF000000FF00000080000000
      800080808000000000008080800080808000C0C0C0000000000080808000C0C0
      C000808080000000000080808000C0C0C0008080800080808000C0C0C0008080
      8000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF007F7F7F00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF000000FF00000080000000
      8000000080000000800080808000FFFFFF000000FF0000008000000080000000
      800000008000808080008080800080808000C0C0C00000000000000000008080
      8000C0C0C000FFFFFF00C0C0C00080808000000000000000000080808000C0C0
      C000FFFFFF008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF00000000000000000000000000FFFFFF00000000007F7F7F00FFFF
      FF007F7F7F007F7F7F00000000007F7F7F007F7F7F00000000007F7F7F007F7F
      7F00000000007F7F7F007F7F7F007F7F7F00000000007F7F7F00000000000000
      0000000000000000000000000000FFFFFF0000000000000000000000FF000000
      8000000080000000800000000000808080000000800000008000000080000000
      800000008000808080008080800080808000C0C0C00000000000000000000000
      000080808000C0C0C00080808000000000000000000000000000000000008080
      8000C0C0C0008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF007F7F7F00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000080000000800000008000000080000000800000008000000080000000
      8000808080000000000080808000FFFFFF0080808000C0C0C000000000000000
      0000000000008080800000000000000000000000000000000000C0C0C0008080
      8000FFFFFF008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF00000000000000000000000000FFFFFF00000000007F7F7F00FFFF
      FF007F7F7F007F7F7F00000000007F7F7F007F7F7F00000000007F7F7F007F7F
      7F00000000007F7F7F007F7F7F007F7F7F00000000007F7F7F00000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      00000000FF000000800000008000000080000000800000008000000080008080
      8000FFFFFF000000000080808000FFFFFF008080800080808000C0C0C0000000
      00000000000000000000000000000000000000000000C0C0C000808080008080
      8000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF007F7F7F00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000080000000800000008000000080000000800080808000FFFF
      FF00FFFFFF000000000080808000FFFFFF0000000000FFFFFF0080808000C0C0
      C000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF00000000000000000000000000FFFFFF00000000007F7F7F00FFFF
      FF007F7F7F007F7F7F00000000007F7F7F007F7F7F00000000007F7F7F007F7F
      7F00000000007F7F7F007F7F7F007F7F7F00000000007F7F7F00000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      0000000000000000FF0000008000000080000000800000008000808080000000
      0000FFFFFF000000000080808000FFFFFF008080800080808000000000008080
      8000C0C0C0000000000000000000000000008080800080808000808080008080
      8000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF00000080000000800000008000000080000000800080808000FFFF
      FF00FFFFFF000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      80000000000000000000000000000000000080808000C0C0C000FFFFFF00FFFF
      FF00FFFFFF008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF0000000000
      FF00000080000000800000008000808080000000800000008000000080008080
      8000FF0000000000000080808000808080008080800080808000808080000000
      00000000000000000000000000000000000080808000C0C0C000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000BFBFBF00BFBFBF00000000007F7F7F00FFFF
      FF00FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF007F7F7F00000000000000
      0000000000000000000000000000C0C0C000C0C0C000FF0000000000FF000000
      8000000080000000800080808000FF0000000000FF0000008000000080000000
      8000808080000000000080808000FFFFFF00FFFFFF0080808000000000000000
      0000000000008080800000000000000000000000000080808000C0C0C000FFFF
      FF00FFFFFF008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      800000008000808080000000000000000000000000000000FF00000080000000
      80000000800080808000808080008080800080808000C0C0C000000000000000
      000080808000808080008080800000000000000000000000000080808000C0C0
      C000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000800000000000000000000000000000000000000000000000FF000000
      80000000800000008000000000000000000080808000C0C0C000C0C0C0008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000080000000FF0000000000000000000000000080808000808080000000
      00000000000000000000000000000000000080808000C0C0C000C0C0C000C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000090000000120000000100010000000000680100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFFFFFFFF00000000000000
      00000000FFFFE0003FFFFE00030000000000000000000000C00000003C000000
      030000000000000000000000C00009243C000012030000000000000000000000
      C0000248BC0000440B0000000000000000000000C00009243C000060C3000000
      0000000000000000C0000248BC000071E30000000000000000000000C0000924
      3C00003BC30000000000000000000000C0000248BC00001F8B00000000000000
      00000000C00009243C00008F830000000000000000000000C0000248BC000027
      0B0000000000000000000000C00000003C00000F030000000000000000000000
      C00000003C00001F030000000000000000000000C00000003C00003B83000000
      0000000000000000C00000003C000031C30000000000000000000000FFFFFFFF
      FFE7C30EE70000000000000000000000FFFFFFFFFFFFE39F0700000000000000
      00000000FFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000}
  end
  object cdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 872
    Top = 128
  end
  object cdsPatrocinador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 872
    Top = 176
  end
  object cdsFluxoDesrelac: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 776
    Top = 200
  end
  object pplFluxoDesrelac: TppBDEPipeline
    DataSource = dsFluxoDesrelac
    UserName = 'lFluxoDesrelac'
    Left = 296
    Top = 440
  end
  object rptFluxoDesrelac: TppReport
    AutoStop = False
    DataPipeline = pplFluxoDesrelac
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Lançamentos Inconsistentes'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 296
    Top = 384
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pplFluxoDesrelac'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 44186
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 38894
        mmWidth = 197300
        BandType = 0
      end
      object lbEmpresa: TppLabel
        OnPrint = lbEmpresaPrint
        UserName = 'lbEmpresa'
        Caption = 'lbEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 6615
        mmTop = 5027
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 
          'Lançamento(s) em  Tipo de Desembolso / Recebimento  sem relacion' +
          'amento(s)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4498
        mmLeft = 6615
        mmTop = 12435
        mmWidth = 138377
        BandType = 0
      end
      object lbPerido: TppLabel
        UserName = 'lbPerido'
        Caption = 'Período de 01/02/2005 e 01/02/2005'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 6615
        mmTop = 17727
        mmWidth = 52123
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 23548
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Data programada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 38894
        mmWidth = 22490
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Tipo de Desembolso/ Recebimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 54240
        mmTop = 38894
        mmWidth = 50271
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 188913
        mmTop = 38894
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Rec/Pag'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 35190
        mmTop = 38894
        mmWidth = 10848
        BandType = 0
      end
      object lbPrazo: TppLabel
        UserName = 'Label7'
        Caption = 'Prazo: Longo Prazo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 6615
        mmTop = 21960
        mmWidth = 34925
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label8'
        Caption = 'Fluxo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 129117
        mmTop = 38894
        mmWidth = 12171
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object shpCorLinha: TppShape
        OnPrint = shpCorLinhaPrint
        UserName = 'shpCorLinha'
        Brush.Color = 14869218
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText1'
        DataField = 'DATAPROGRAMADA'
        DataPipeline = pplFluxoDesrelac
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFluxoDesrelac'
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 529
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText2'
        DataField = 'DESCRICAO'
        DataPipeline = pplFluxoDesrelac
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFluxoDesrelac'
        mmHeight = 3175
        mmLeft = 54240
        mmTop = 529
        mmWidth = 71438
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText3'
        DataField = 'VALOR'
        DataPipeline = pplFluxoDesrelac
        DisplayFormat = '#,##0.00;-#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFluxoDesrelac'
        mmHeight = 3175
        mmLeft = 173038
        mmTop = 529
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText4'
        DataField = 'RECPAG'
        DataPipeline = pplFluxoDesrelac
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplFluxoDesrelac'
        mmHeight = 3175
        mmLeft = 35190
        mmTop = 529
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText5'
        DataField = 'TIPO'
        DataPipeline = pplFluxoDesrelac
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFluxoDesrelac'
        mmHeight = 3175
        mmLeft = 129117
        mmTop = 529
        mmWidth = 35983
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
        BandType = 8
      end
      object lbSistema: TppLabel
        OnPrint = lbSistemaPrint
        UserName = 'lbSistema'
        Caption = 'lbsistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 529
        mmTop = 1058
        mmWidth = 32279
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable1'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 90752
        mmTop = 1058
        mmWidth = 18256
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 170657
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 159544
        mmTop = 3704
        mmWidth = 8467
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = pplFluxoDesrelac
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplFluxoDesrelac'
        mmHeight = 4191
        mmLeft = 170127
        mmTop = 3704
        mmWidth = 25485
        BandType = 7
      end
    end
  end
  object dsFluxoDesrelac: TwwDataSource
    DataSet = cdsFluxoDesrelac
    Left = 288
    Top = 488
  end
end
