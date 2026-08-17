inherited frmConsCartGerenc: TfrmConsCartGerenc
  Left = 316
  Top = 294
  HelpContext = 790566
  Caption = 'Consulta de Dados'
  ClientHeight = 543
  ClientWidth = 792
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 792
    Height = 504
    inherited bvlSepTit: TBevel
      Width = 790
    end
    inherited pnlTitulo: TPanel
      Width = 790
      inherited lbNomDescricao: TfcLabel
        Width = 204
        Caption = 'Carteiras Gerenciais'
      end
    end
    object PnlSelecao: TPanel
      Left = 1
      Top = 45
      Width = 790
      Height = 56
      Align = alTop
      TabOrder = 1
      object Label3: TLabel
        Left = 17
        Top = 6
        Width = 32
        Height = 13
        Caption = 'Data '
      end
      object Label4: TLabel
        Left = 137
        Top = 6
        Width = 45
        Height = 13
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 465
        Top = 6
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
      object dData: TCMDateTimePicker
        Left = 17
        Top = 21
        Width = 113
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
        OnEnter = dDataEnter
        OnExit = dDataExit
      end
      object dblCarteira: TwwDBLookupCombo
        Left = 137
        Top = 21
        Width = 320
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTGERENC'#9'40'#9'Carteira Gerencial'#9'F')
        LookupTable = qryCarteira
        LookupField = 'IDCARTEIRAGERENC'
        Options = [loColLines, loRowLines]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnEnter = dblCarteiraEnter
      end
      object dblPlanoPatr: TwwDBLookupCombo
        Left = 465
        Top = 21
        Width = 306
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
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object pgcMercados: TPageControl
      Left = 1
      Top = 101
      Width = 790
      Height = 402
      ActivePage = tbsRendaVariavel
      Align = alClient
      TabOrder = 2
      object tbsRendaVariavel: TTabSheet
        Caption = 'Renda &Variável'
        object dbgRendaVariavel: TwwDBGrid
          Left = 0
          Top = 0
          Width = 782
          Height = 350
          Selected.Strings = (
            'INVESTIMENTO'#9'22'#9'Investimento'
            'CODISIN'#9'15'#9'Código ISIN'
            'LOTE'#9'7'#9'Lote'
            'COTACAO'#9'16'#9'Cotação'
            'DATAMOVCARTINV'#9'10'#9'Data da ~Cotação'#9'F'
            'QUANTIDADE'#9'16'#9'Quantidade'
            'VALOR'#9'16'#9'Saldo')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          Color = clInfoBk
          DataSource = dsRendaVariavel
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          PopupMenu = pmnuRendaVariavel
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
        end
        object pnlTotal: TPanel
          Left = 0
          Top = 350
          Width = 782
          Height = 24
          Align = alBottom
          Enabled = False
          TabOrder = 1
          object fcLabel6: TfcLabel
            Left = 455
            Top = 2
            Width = 140
            Height = 20
            Caption = 'Saldo da Carteira'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
          end
          object dbrSaldoAtu: TDBRealEdit
            Left = 645
            Top = 2
            Width = 118
            Height = 21
            Alignment = taRightJustify
            Color = clMenu
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0.00')
            ParentFont = False
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'SALDOTOTAL'
            DataSource = dsRendaVariavel
          end
        end
      end
      object tbsHistCaixa: TTabSheet
        Caption = '&Saldo do Caixa'
        ImageIndex = 4
        object dbgCaixa: TwwDBGrid
          Left = 0
          Top = 0
          Width = 782
          Height = 374
          Selected.Strings = (
            'INVESTIMENTO'#9'55'#9'Evento'
            'VALOR'#9'26'#9'Valor'
            'SALDO'#9'24'#9'Saldo'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsHistCaixa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          PopupMenu = pmnuCaixaCota
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          OnDrawDataCell = dbgCaixaDrawDataCell
          IndicatorColor = icBlack
        end
      end
      object tbsCaixaCota: TTabSheet
        Caption = 'Valores a &Pagar/Receber'
        ImageIndex = 2
        object dbgValoresPagarReceber: TwwDBGrid
          Left = 0
          Top = 0
          Width = 782
          Height = 347
          Selected.Strings = (
            'INVESTIMENTO'#9'60'#9'Descrição'
            'VALOR'#9'45'#9'Valor')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          Color = clInfoBk
          DataSource = DsValoresPagarReceber
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          PopupMenu = pmnuCaixaCota
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
        end
        object Panel3: TPanel
          Left = 0
          Top = 347
          Width = 782
          Height = 27
          Align = alBottom
          Enabled = False
          TabOrder = 1
          object fcLabel1: TfcLabel
            Left = 50
            Top = 5
            Width = 103
            Height = 20
            Caption = 'Total Líquido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
          end
          object DBRealEdit1: TDBRealEdit
            Left = 438
            Top = 3
            Width = 321
            Height = 21
            Alignment = taRightJustify
            Color = clMenu
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0.00')
            ParentFont = False
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'SALDOTOTAL'
            DataSource = DsValoresPagarReceber
          end
        end
      end
      object tbsDetPagRec: TTabSheet
        Caption = 'Analítico'
        ImageIndex = 4
        object dbgDetValoresPagarReceber: TwwDBGrid
          Left = 0
          Top = 0
          Width = 782
          Height = 374
          Selected.Strings = (
            'DATAOPERACAO'#9'10'#9'Data da~Operação'
            'NUMDOCUMENTO'#9'11'#9'Boleta'
            'DESCINVESTIMENTO'#9'25'#9'Investimento'
            'RATEIO'#9'8'#9'Rateio'
            'QTDE'#9'13'#9'Quantidade'
            'PRECO'#9'10'#9'Preço'
            'TOTQTD'#9'14'#9'Total de~Quantidade'
            'TOTDESP'#9'11'#9'Total de~Despesa'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          Color = clInfoBk
          DataSource = dsDetVlPagRec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          PopupMenu = pmnuCaixaCota
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
        end
        object dbgDetValoresPagarReceber2: TwwDBGrid
          Left = 0
          Top = 0
          Width = 782
          Height = 374
          Selected.Strings = (
            'DATAOPERACAO'#9'10'#9'Data da~Operação'
            'NUMDOCUMENTO'#9'11'#9'Boleta'
            'DESCINVESTIMENTO'#9'35'#9'Investimento'
            'QTDE'#9'18'#9'Quantidade'
            'PRECO'#9'12'#9'Preço'#9'F'
            'VLROPERACAO'#9'18'#9'Valor')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          Color = clInfoBk
          DataSource = dsDetVlPagRec2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          PopupMenu = pmnuCaixaCota
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object tbsResumo: TTabSheet
        Caption = '&Resumo'
        ImageIndex = 3
        object pnlQuantCotas: TPanel
          Left = 0
          Top = 41
          Width = 782
          Height = 41
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object fcLabel2: TfcLabel
            Left = 90
            Top = 12
            Width = 146
            Height = 16
            Caption = 'Quantidade de Cotas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
          end
          object redQtdCotas: TRealEdit
            Left = 538
            Top = 9
            Width = 150
            Height = 21
            Alignment = taRightJustify
            Color = clInfoBk
            Enabled = False
            Lines.Strings = (
              '0')
            TabOrder = 0
            WordWrap = False
            IntDigits = 20
            DecDigits = 9
            NumberFormat = fNumber
            Signal = False
          end
        end
        object pnlValCota: TPanel
          Left = 0
          Top = 82
          Width = 782
          Height = 41
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 1
          object fcLabel3: TfcLabel
            Left = 91
            Top = 12
            Width = 95
            Height = 16
            Caption = 'Valor da Cota'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
          end
          object redValCota: TRealEdit
            Left = 538
            Top = 9
            Width = 150
            Height = 21
            Alignment = taRightJustify
            Color = clInfoBk
            Enabled = False
            Lines.Strings = (
              '0,000000000')
            TabOrder = 0
            WordWrap = False
            IntDigits = 18
            DecDigits = 9
            NumberFormat = fNumber
            Signal = False
          end
        end
        object pnlPatrimonio: TPanel
          Left = 0
          Top = 0
          Width = 782
          Height = 41
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 2
          object fcLabel4: TfcLabel
            Left = 90
            Top = 12
            Width = 112
            Height = 16
            Caption = 'Patrimônio Final'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
          end
          object redPatrimonio: TRealEdit
            Left = 538
            Top = 9
            Width = 150
            Height = 21
            Alignment = taRightJustify
            Color = clInfoBk
            Enabled = False
            Lines.Strings = (
              '0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
        object pnlRentabilidade: TPanel
          Left = 0
          Top = 241
          Width = 782
          Height = 133
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 3
        end
        object Panel1: TPanel
          Left = 0
          Top = 123
          Width = 782
          Height = 118
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 4
          object fcLabel7: TfcLabel
            Left = 90
            Top = 12
            Width = 98
            Height = 16
            Caption = 'Rentabilidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
          end
          object fcLabel10: TfcLabel
            Left = 539
            Top = 12
            Width = 50
            Height = 16
            Caption = 'Mensal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
          end
          object fcLabel11: TfcLabel
            Left = 648
            Top = 12
            Width = 39
            Height = 16
            Caption = 'Anual'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
          end
          object fcLabel12: TfcLabel
            Left = 449
            Top = 12
            Width = 42
            Height = 16
            Caption = 'Diária'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Style = fclsRaised
            TextOptions.VAlignment = vaTop
          end
          object Panel2: TPanel
            Left = 90
            Top = 32
            Width = 303
            Height = 21
            Alignment = taLeftJustify
            BevelInner = bvLowered
            BevelOuter = bvLowered
            Caption = ' Cota'
            Color = clWindow
            TabOrder = 8
          end
          object edtInd1Mes: TRealEdit
            Left = 496
            Top = 56
            Width = 93
            Height = 21
            Alignment = taRightJustify
            Color = clInfoBk
            Enabled = False
            Lines.Strings = (
              '0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = False
          end
          object edtInd1Ano: TRealEdit
            Left = 594
            Top = 56
            Width = 93
            Height = 21
            Alignment = taRightJustify
            Color = clInfoBk
            Enabled = False
            Lines.Strings = (
              '0,00')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = False
          end
          object edtVarMes: TwwDBEdit
            Left = 496
            Top = 32
            Width = 93
            Height = 21
            Color = clInfoBk
            DataField = 'VLRZMES'
            DataSource = DmRelCarteiraGerenc.dsRentabilidadeCota
            Enabled = False
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object edtVarAno: TwwDBEdit
            Left = 594
            Top = 32
            Width = 93
            Height = 21
            Color = clInfoBk
            DataField = 'VLRZANO'
            DataSource = DmRelCarteiraGerenc.dsRentabilidadeCota
            Enabled = False
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dblRegra1: TwwDBLookupCombo
            Left = 90
            Top = 56
            Width = 304
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEREGRA'#9'20'#9'Índice'#9'F')
            LookupTable = qryRegra1
            LookupField = 'IDREGRA'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 4
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            OnChange = dblRegra1Change
            OnExit = dblRegra1Exit
          end
          object dblRegra2: TwwDBLookupCombo
            Left = 90
            Top = 80
            Width = 304
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEREGRA'#9'20'#9'Índice'#9'F')
            LookupTable = qryRegra2
            LookupField = 'IDREGRA'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 5
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            OnChange = dblRegra2Change
            OnExit = dblRegra2Exit
          end
          object edtInd2Mes: TRealEdit
            Left = 496
            Top = 80
            Width = 93
            Height = 21
            Alignment = taRightJustify
            Color = clInfoBk
            Enabled = False
            Lines.Strings = (
              '0,00')
            TabOrder = 6
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = False
          end
          object edtInd2Ano: TRealEdit
            Left = 594
            Top = 80
            Width = 93
            Height = 21
            Alignment = taRightJustify
            Color = clInfoBk
            Enabled = False
            Lines.Strings = (
              '0,00')
            TabOrder = 7
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = False
          end
          object btnCalcRegra1: TBitBtn
            Left = 694
            Top = 56
            Width = 23
            Height = 22
            TabOrder = 9
            Visible = False
            OnClick = btnCalcRegra1Click
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555777555
              5555555555000757755555575500005007555570058880000075570870088078
              007555787887087777755550880FF0800007708080888F7088077088F0708F78
              88077000F0778080005555508F0008800755557878FF88777075570870080088
              0755557075888070755555575500075555555555557775555555}
          end
          object btnCalcRegra2: TBitBtn
            Left = 694
            Top = 80
            Width = 23
            Height = 22
            TabOrder = 10
            Visible = False
            OnClick = btnCalcRegra2Click
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555777555
              5555555555000757755555575500005007555570058880000075570870088078
              007555787887087777755550880FF0800007708080888F7088077088F0708F78
              88077000F0778080005555508F0008800755557878FF88777075570870080088
              0755557075888070755555575500075555555555557775555555}
          end
          object edtVarDia: TwwDBEdit
            Left = 398
            Top = 32
            Width = 93
            Height = 21
            Color = clInfoBk
            DataField = 'VLRZDIA'
            DataSource = DmRelCarteiraGerenc.dsRentabilidadeCota
            Enabled = False
            TabOrder = 11
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 504
    Width = 792
    inherited tb97Fundo: TToolbar97
      Left = 620
      DockPos = 1053
      inherited sep1: TToolbarSep97
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 367
      DockPos = 800
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
        Left = 168
        Visible = False
        OnClick = bbtnCancelarClick
      end
      object btImprimir: TBitBtn
        Left = 84
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 2
        OnClick = btImprimirClick
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
    Left = 234
    Top = 5
    TargetsData = (
      1
      3
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object qryCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCARTEIRAINVEST, IDCARTEIRAGERENC, DESCCARTGERENC'
      'FROM'
      '   CARTEIRAGERENC'
      'ORDER BY DESCCARTGERENC'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 272
    Top = 149
    object qryCarteiraDESCCARTGERENC: TStringField
      DisplayLabel = 'Carteira Gerencial'
      DisplayWidth = 40
      FieldName = 'DESCCARTGERENC'
      Origin = 'BASEDADOS.CARTEIRAGERENC.DESCCARTGERENC'
      Size = 40
    end
    object qryCarteiraIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.CARTEIRAGERENC.IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCarteiraIDCARTEIRAGERENC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAGERENC'
      Origin = 'BASEDADOS.CARTEIRAGERENC.IDCARTEIRAGERENC'
      Visible = False
    end
  end
  object qryRendaVariavel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  1                                                             ' +
        '                                             AS TIPOREL,'
      
        '  '#39'                                                            '#39 +
        '                                             AS CARTEIRA,'
      
        '  '#39'              '#39'                                              ' +
        '                                             AS CODISIN,'
      
        '  '#39'                                                             ' +
        '                                           '#39' AS INVESTIMENTO,'
      
        '  TO_DATE('#39#39','#39'DD/MM/YYYY'#39')                                      ' +
        '                                             AS DATAOPER,'
      
        '  0.01                                                          ' +
        '                                             AS VALOR,'
      
        '  0.01                                                          ' +
        '                                             AS SALDO,'
      
        '  0                                                             ' +
        '                                             AS QUANTIDADE,'
      
        '  0                                                             ' +
        '                                             AS COTACAO,'
      
        '  TO_DATE('#39#39','#39'DD/MM/YYYY'#39')                                      ' +
        '                                             AS DATAMOVCARTINV,'
      
        '  0                                                             ' +
        '                                             AS LOTE,'
      
        '  0                                                             ' +
        '                                             AS IDCARTEIRAINVEST' +
        ','
      
        '  0                                                             ' +
        '                                             AS IDINVESTIMENTO,'
      
        '  '#39'          '#39'                                                  ' +
        '                                             AS IDLOTE,'
      
        '  '#39'                                                            '#39 +
        '                                             AS OPERACAO,'
      
        '  TO_DATE('#39#39','#39'DD/MM/YYYY'#39')                                      ' +
        '                                             AS VENCIMENTO,'
      
        '  '#39'          '#39'                                                  ' +
        '                                             AS CORRETORA,'
      
        '  0                                                             ' +
        '                                             AS IDCOR,'
      
        '  0                                                             ' +
        '                                             AS IDEVENTOCAIXACOT' +
        'A,'
      
        '  0                                                             ' +
        '                                             AS IDHISTCAIXA,'
      
        '  0                                                             ' +
        '                                             AS REG,'
      
        '  0.01                                                          ' +
        '                                             AS SALDOTOTAL'
      ''
      'FROM DUAL'
      '')
    ValidateWithMask = True
    Left = 145
    Top = 274
    object qryRendaVariavelINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 22
      FieldName = 'INVESTIMENTO'
      FixedChar = True
      Size = 104
    end
    object qryRendaVariavelCODISIN: TStringField
      DisplayLabel = 'Código ISIN'
      DisplayWidth = 15
      FieldName = 'CODISIN'
      FixedChar = True
      Size = 14
    end
    object qryRendaVariavelLOTE: TFloatField
      DisplayLabel = 'Lote'
      DisplayWidth = 7
      FieldName = 'LOTE'
      DisplayFormat = '#,##0'
      EditFormat = '#,##0'
    end
    object qryRendaVariavelCOTACAO: TFloatField
      DisplayLabel = 'Cotação'
      DisplayWidth = 16
      FieldName = 'COTACAO'
      DisplayFormat = '#,##0.000000000'
      EditFormat = '#,##0.000000000'
    end
    object qryRendaVariavelDATAMOVCARTINV: TDateTimeField
      DisplayLabel = 'Data da ~Cotação'
      DisplayWidth = 10
      FieldName = 'DATAMOVCARTINV'
    end
    object qryRendaVariavelQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 16
      FieldName = 'QUANTIDADE'
      DisplayFormat = '#,##0'
      EditFormat = '#,##0'
    end
    object qryRendaVariavelVALOR: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 16
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryRendaVariavelTIPOREL: TFloatField
      DisplayWidth = 10
      FieldName = 'TIPOREL'
      Visible = False
    end
    object qryRendaVariavelCARTEIRA: TStringField
      DisplayWidth = 60
      FieldName = 'CARTEIRA'
      Visible = False
      FixedChar = True
      Size = 60
    end
    object qryRendaVariavelDATAOPER: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAOPER'
      Visible = False
    end
    object qryRendaVariavelSALDO: TFloatField
      DisplayWidth = 10
      FieldName = 'SALDO'
      Visible = False
    end
    object qryRendaVariavelIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryRendaVariavelIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryRendaVariavelIDLOTE: TStringField
      DisplayWidth = 10
      FieldName = 'IDLOTE'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryRendaVariavelOPERACAO: TStringField
      DisplayWidth = 60
      FieldName = 'OPERACAO'
      Visible = False
      FixedChar = True
      Size = 60
    end
    object qryRendaVariavelVENCIMENTO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'VENCIMENTO'
      Visible = False
    end
    object qryRendaVariavelCORRETORA: TStringField
      DisplayWidth = 10
      FieldName = 'CORRETORA'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryRendaVariavelIDCOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCOR'
      Visible = False
    end
    object qryRendaVariavelIDEVENTOCAIXACOTA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEVENTOCAIXACOTA'
      Visible = False
    end
    object qryRendaVariavelIDHISTCAIXA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHISTCAIXA'
      Visible = False
    end
    object qryRendaVariavelREG: TFloatField
      DisplayWidth = 10
      FieldName = 'REG'
      Visible = False
    end
    object qryRendaVariavelSALDOTOTAL: TFloatField
      DisplayLabel = 'Data da ~Cotação'
      DisplayWidth = 10
      FieldName = 'SALDOTOTAL'
      Visible = False
    end
  end
  object dsRendaVariavel: TwwDataSource
    AutoEdit = False
    DataSet = qryRendaVariavel
    Left = 145
    Top = 329
  end
  object pmnuRendaVariavel: TPopupMenu
    OnPopup = pmnuRendaVariavelPopup
    Left = 403
    Top = 5
    object RVFixarColuna: TMenuItem
      Caption = 'Fixar Coluna'
      Enabled = False
      OnClick = RVFixarColunaClick
    end
    object RVLiberarColuna: TMenuItem
      Caption = 'Liberar Coluna'
      Enabled = False
      OnClick = RVLiberarColunaClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object RVLiberaTodasColunas: TMenuItem
      Caption = 'Libera Todas as Colunas'
      Enabled = False
      OnClick = RVLiberaTodasColunasClick
    end
  end
  object pmnuBMF: TPopupMenu
    Left = 485
    Top = 5
    object BMFFixarColuna: TMenuItem
      Caption = 'Fixar Coluna'
      Enabled = False
    end
    object BMFLiberarColuna: TMenuItem
      Caption = 'Liberar Coluna'
      Enabled = False
    end
    object MenuItem3: TMenuItem
      Caption = '-'
    end
    object BMFLiberarTodasColunas: TMenuItem
      Caption = 'Libera Todas as Colunas'
      Enabled = False
    end
  end
  object pmnuCaixaCota: TPopupMenu
    OnPopup = pmnuCaixaCotaPopup
    Left = 553
    Top = 5
    object CCFixarColuna: TMenuItem
      Caption = 'Fixar Coluna'
      Enabled = False
      OnClick = CCFixarColunaClick
    end
    object CCLiberarColuna: TMenuItem
      Caption = 'Liberar Coluna'
      Enabled = False
      OnClick = CCLiberarColunaClick
    end
    object MenuItem7: TMenuItem
      Caption = '-'
    end
    object CCLiberaTodasColunas: TMenuItem
      Caption = 'Libera Todas as Colunas'
      Enabled = False
      OnClick = CCLiberaTodasColunasClick
    end
  end
  object qryRegra1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RG.IDREGRA, RG.NOMEREGRA'
      'FROM REGRA RG, TIPOREGRA TR, GRUPOREGRA GR'
      'WHERE RG.IDTIPOREGRA = TR.IDTIPOREGRA AND'
      '      TR.IDGRUPOREGRA = GR.IDGRUPOREGRA AND'
      '      TR.IDTIPOREGRA = :IDTIPOREGRA'
      'ORDER BY NOMEREGRA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 586
    Top = 274
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOREGRA'
        ParamType = ptInput
      end>
    object qryRegra1NOMEREGRA: TStringField
      DisplayLabel = 'Índice'
      DisplayWidth = 20
      FieldName = 'NOMEREGRA'
      Origin = 'BASEDADOS.REGRA.NOMEREGRA'
      Size = 60
    end
    object qryRegra1IDREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.REGRA.IDREGRA'
      Visible = False
    end
  end
  object qryRegra2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RG.IDREGRA, RG.NOMEREGRA'
      'FROM REGRA RG, TIPOREGRA TR, GRUPOREGRA GR'
      'WHERE RG.IDTIPOREGRA = TR.IDTIPOREGRA AND'
      '      TR.IDGRUPOREGRA = GR.IDGRUPOREGRA AND'
      '      TR.IDTIPOREGRA = :IDTIPOREGRA'
      'ORDER BY NOMEREGRA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 586
    Top = 329
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOREGRA'
        ParamType = ptInput
      end>
    object qryRegra2NOMEREGRA: TStringField
      DisplayLabel = 'Índice'
      DisplayWidth = 20
      FieldName = 'NOMEREGRA'
      Origin = 'BASEDADOS.REGRA.NOMEREGRA'
      Size = 60
    end
    object qryRegra2IDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.REGRA.IDREGRA'
      Visible = False
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 616
    Top = 5
  end
  object regRentabilidade: TRegra
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 306
    Top = 5
  end
  object dsHistCaixa: TwwDataSource
    AutoEdit = False
    DataSet = qryHistCaixa
    Left = 222
    Top = 329
  end
  object qryHistCaixa: TwwQuery
    AutoCalcFields = False
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  4                                                             ' +
        '                                             AS TIPOREL,'
      
        '  '#39'                                                            '#39 +
        '                                             AS CARTEIRA,'
      
        '  '#39'              '#39'                                              ' +
        '                                             AS CODISIN,'
      
        '  '#39'                                                             ' +
        '                                           '#39' AS INVESTIMENTO,'
      
        '  TO_DATE('#39#39','#39'DD/MM/YYYY'#39')                                      ' +
        '                                             AS DATAOPER,'
      
        '  0.01                                                          ' +
        '                                             AS VALOR,'
      
        '  0.01                                                          ' +
        '                                             AS SALDO,'
      
        '  0                                                             ' +
        '                                             AS QUANTIDADE,'
      
        '  0                                                             ' +
        '                                             AS COTACAO,'
      
        '  TO_DATE('#39#39','#39'DD/MM/YYYY'#39')                                      ' +
        '                                             AS DATAMOVCARTINV,'
      
        '  0                                                             ' +
        '                                             AS LOTE,'
      
        '  0                                                             ' +
        '                                             AS IDCARTEIRAINVEST' +
        ','
      
        '  0                                                             ' +
        '                                             AS IDINVESTIMENTO,'
      
        '  '#39'          '#39'                                                  ' +
        '                                             AS IDLOTE,'
      
        '  '#39'                                                            '#39 +
        '                                             AS OPERACAO,'
      
        '  TO_DATE('#39#39','#39'DD/MM/YYYY'#39')                                      ' +
        '                                             AS VENCIMENTO,'
      
        '  '#39'          '#39'                                                  ' +
        '                                             AS CORRETORA,'
      
        '  0                                                             ' +
        '                                             AS IDCOR,'
      
        '  0                                                             ' +
        '                                             AS IDEVENTOCAIXACOT' +
        'A,'
      
        '  0                                                             ' +
        '                                             AS IDHISTCAIXA,'
      
        '  0                                                             ' +
        '                                             AS REG,'
      
        '  0.01                                                          ' +
        '                                             AS SALDOTOTAL'
      ''
      'FROM DUAL'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 222
    Top = 274
    object qryHistCaixaINVESTIMENTO: TStringField
      DisplayLabel = 'Evento'
      DisplayWidth = 55
      FieldName = 'INVESTIMENTO'
      Size = 104
    end
    object qryHistCaixaVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 26
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryHistCaixaSALDO: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 24
      FieldName = 'SALDO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryHistCaixaTIPOREL: TFloatField
      FieldName = 'TIPOREL'
      Visible = False
    end
    object qryHistCaixaCODISIN: TStringField
      FieldName = 'CODISIN'
      Visible = False
      FixedChar = True
      Size = 14
    end
    object qryHistCaixaDATAOPER: TDateTimeField
      FieldName = 'DATAOPER'
      Visible = False
    end
    object qryHistCaixaQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Visible = False
    end
    object qryHistCaixaCOTACAO: TFloatField
      FieldName = 'COTACAO'
      Visible = False
    end
    object qryHistCaixaDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
      Visible = False
    end
    object qryHistCaixaLOTE: TFloatField
      FieldName = 'LOTE'
      Visible = False
    end
    object qryHistCaixaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryHistCaixaIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryHistCaixaIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryHistCaixaOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Visible = False
      FixedChar = True
      Size = 60
    end
    object qryHistCaixaVENCIMENTO: TDateTimeField
      FieldName = 'VENCIMENTO'
      Visible = False
    end
    object qryHistCaixaCORRETORA: TStringField
      FieldName = 'CORRETORA'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryHistCaixaIDEVENTOCAIXACOTA: TFloatField
      FieldName = 'IDEVENTOCAIXACOTA'
      Visible = False
    end
    object qryHistCaixaCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      Visible = False
      FixedChar = True
      Size = 60
    end
    object qryHistCaixaIDCOR: TFloatField
      FieldName = 'IDCOR'
      Visible = False
    end
    object qryHistCaixaIDHISTCAIXA: TFloatField
      FieldName = 'IDHISTCAIXA'
      Visible = False
    end
    object qryHistCaixaREG: TFloatField
      FieldName = 'REG'
      Visible = False
    end
    object qryHistCaixaSALDOTOTAL: TFloatField
      FieldName = 'SALDOTOTAL'
    end
  end
  object QryValoresPagarReceber: TwwQuery
    AfterOpen = QryValoresPagarReceberAfterOpen
    AfterScroll = QryValoresPagarReceberAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  3                                                             ' +
        '                                             AS TIPOREL,'
      
        '  '#39'                                                            '#39 +
        '                                             AS CARTEIRA,'
      
        '  '#39'              '#39'                                              ' +
        '                                             AS CODISIN,'
      
        '  '#39'                                                             ' +
        '                                           '#39' AS INVESTIMENTO,'
      
        '  TO_DATE('#39#39','#39'DD/MM/YYYY'#39')                                      ' +
        '                                             AS DATAOPER,'
      
        '  0.01                                                          ' +
        '                                             AS VALOR,'
      
        '  0.01                                                          ' +
        '                                             AS SALDO,'
      
        '  0                                                             ' +
        '                                             AS QUANTIDADE,'
      
        '  0                                                             ' +
        '                                             AS COTACAO,'
      
        '  TO_DATE('#39#39','#39'DD/MM/YYYY'#39')                                      ' +
        '                                             AS DATAMOVCARTINV,'
      
        '  0                                                             ' +
        '                                             AS LOTE,'
      
        '  0                                                             ' +
        '                                             AS IDCARTEIRAINVEST' +
        ','
      
        '  0                                                             ' +
        '                                             AS IDINVESTIMENTO,'
      
        '  '#39'          '#39'                                                  ' +
        '                                             AS IDLOTE,'
      
        '  '#39'                                                            '#39 +
        '                                             AS OPERACAO,'
      
        '  TO_DATE('#39#39','#39'DD/MM/YYYY'#39')                                      ' +
        '                                             AS VENCIMENTO,'
      
        '  '#39'          '#39'                                                  ' +
        '                                             AS CORRETORA,'
      
        '  0                                                             ' +
        '                                             AS IDCOR,'
      
        '  0                                                             ' +
        '                                             AS IDEVENTOCAIXACOT' +
        'A,'
      
        '  0                                                             ' +
        '                                             AS IDHISTCAIXA,'
      
        '  0                                                             ' +
        '                                             AS REG,'
      
        '  0.01                                                          ' +
        '                                             AS SALDOTOTAL'
      ''
      'FROM DUAL')
    ValidateWithMask = True
    Left = 318
    Top = 274
    object QryValoresPagarReceberINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'INVESTIMENTO'
      FixedChar = True
      Size = 104
    end
    object QryValoresPagarReceberVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 45
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object QryValoresPagarReceberTIPOREL: TFloatField
      FieldName = 'TIPOREL'
      Visible = False
    end
    object QryValoresPagarReceberCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      Visible = False
      FixedChar = True
      Size = 60
    end
    object QryValoresPagarReceberCODISIN: TStringField
      FieldName = 'CODISIN'
      Visible = False
      FixedChar = True
      Size = 14
    end
    object QryValoresPagarReceberDATAOPER: TDateTimeField
      FieldName = 'DATAOPER'
      Visible = False
    end
    object QryValoresPagarReceberSALDO: TFloatField
      FieldName = 'SALDO'
      Visible = False
    end
    object QryValoresPagarReceberQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Visible = False
    end
    object QryValoresPagarReceberCOTACAO: TFloatField
      FieldName = 'COTACAO'
      Visible = False
    end
    object QryValoresPagarReceberDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
      Visible = False
    end
    object QryValoresPagarReceberLOTE: TFloatField
      FieldName = 'LOTE'
      Visible = False
    end
    object QryValoresPagarReceberIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryValoresPagarReceberIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object QryValoresPagarReceberIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object QryValoresPagarReceberOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Visible = False
      FixedChar = True
      Size = 60
    end
    object QryValoresPagarReceberVENCIMENTO: TDateTimeField
      FieldName = 'VENCIMENTO'
      Visible = False
    end
    object QryValoresPagarReceberCORRETORA: TStringField
      FieldName = 'CORRETORA'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object QryValoresPagarReceberIDCOR: TFloatField
      FieldName = 'IDCOR'
      Visible = False
    end
    object QryValoresPagarReceberIDEVENTOCAIXACOTA: TFloatField
      FieldName = 'IDEVENTOCAIXACOTA'
      Visible = False
    end
    object QryValoresPagarReceberIDHISTCAIXA: TFloatField
      FieldName = 'IDHISTCAIXA'
      Visible = False
    end
    object QryValoresPagarReceberREG: TFloatField
      FieldName = 'REG'
      Visible = False
    end
    object QryValoresPagarReceberSALDOTOTAL: TFloatField
      FieldName = 'SALDOTOTAL'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object DsValoresPagarReceber: TwwDataSource
    AutoEdit = False
    DataSet = QryValoresPagarReceber
    Left = 318
    Top = 329
  end
  object QryUltDataMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(DATAHISTCOTA) AS DATAHISTCOTA'
      'FROM HISTCOTA')
    ValidateWithMask = True
    Left = 733
    Top = 5
  end
  object qryDetVlPagRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATAOPERACAO,'
      '       NUMDOCUMENTO,'
      '       DESCINVESTIMENTO,'
      
        '       ROUND(((TOTDESP/DECODE(TOTDESP,0,0,TOTQTD))*QTDE),2) AS R' +
        'ATEIO,'
      '       QTDE,'
      '       PRECOUNITOPERACAO AS PRECO,'
      '       TOTDESP,'
      '       TOTQTD'
      ''
      '  FROM ('
      '        SELECT '#39'DESPESAS A PAGAR'#39' AS DESCRICAO,'
      '               OI.NUMDOCUMENTO,'
      '               OI.VLROPERACAO AS QTDE,'
      
        '               OI.DATAOPERACAO, OI.DATAVENCOPER, OI.IDOPERACAOIN' +
        'VEST,'
      
        '               OI.IDCARTEIRAINVEST, OI.IDCARTEIRAGERENC, OI.PREC' +
        'OUNITOPERACAO, IV.DESCINVESTIMENTO,'
      '               (SELECT SUM(DP.VLRDESPOPER)'
      '                FROM DESPOPERINVEST DP, OPERACAOINVEST OII'
      '                WHERE (OII.NUMDOCUMENTO    = OI.NUMDOCUMENTO)'
      '                  AND (OII.IDTIPOINVEST    = 2)'
      '                  AND (OII.IDCARTEIRAGERENC IS NOT NULL)'
      
        '                  AND (DP.IDOPERACAOINVEST = OII.IDOPERACAOINVES' +
        'T))*-1 AS TOTDESP,'
      '               (SELECT SUM(OII.VLROPERACAO)'
      '                FROM   OPERACAOINVEST OII'
      '                WHERE (OII.NUMDOCUMENTO    = OI.NUMDOCUMENTO)'
      '                  AND (OII.IDTIPOINVEST    = 2)'
      
        '                  AND (OII.IDCARTEIRAGERENC IS NOT NULL)) AS TOT' +
        'QTD'
      '          FROM OPERACAOINVEST OI, INVESTIMENTO IV'
      
        '         WHERE (OI.DATAOPERACAO    <= TO_DATE('#39'04/10/2004'#39','#39'DD/M' +
        'M/YYYY'#39'))'
      
        '           AND ((OI.DATAVENCOPER    >  TO_DATE('#39'04/10/2004'#39','#39'DD/' +
        'MM/YYYY'#39')) AND'
      
        '               (OI.DATAVENCOPER    <= TO_DATE('#39'18/10/2004'#39','#39'DD/M' +
        'M/YYYY'#39')))'
      
        '           AND (((10 IS NOT NULL)  AND (OI.IDCARTEIRAGERENC = 10' +
        ')) OR'
      
        '               ((10 IS NULL)     AND (OI.IDCARTEIRAGERENC IS NOT' +
        ' NULL)))'
      '           AND (OI.IDTIPOINVEST     = 2)'
      '           AND (OI.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '       )'
      'ORDER BY NUMDOCUMENTO,'
      '         DESCINVESTIMENTO,'
      '         PRECOUNITOPERACAO'
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 425
    Top = 274
    object qryDetVlPagRecDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data da~Operação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
    end
    object qryDetVlPagRecNUMDOCUMENTO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Boleta'
      DisplayWidth = 11
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryDetVlPagRecDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 25
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryDetVlPagRecRATEIO: TFloatField
      DisplayLabel = 'Rateio'
      DisplayWidth = 8
      FieldName = 'RATEIO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryDetVlPagRecQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 13
      FieldName = 'QTDE'
      DisplayFormat = '#,##0'
      EditFormat = '#,##0'
    end
    object qryDetVlPagRecPRECO: TFloatField
      DisplayLabel = 'Preço'
      DisplayWidth = 10
      FieldName = 'PRECO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryDetVlPagRecTOTQTD: TFloatField
      DisplayLabel = 'Total de~Quantidade'
      DisplayWidth = 14
      FieldName = 'TOTQTD'
      DisplayFormat = '#,##0'
      EditFormat = '#,##0'
    end
    object qryDetVlPagRecTOTDESP: TFloatField
      DisplayLabel = 'Total de~Despesa'
      DisplayWidth = 11
      FieldName = 'TOTDESP'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object dsDetVlPagRec: TwwDataSource
    AutoEdit = False
    DataSet = qryDetVlPagRec
    Left = 425
    Top = 328
  end
  object qryDetVlPagRec2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATAOPERACAO,'
      '       NUMDOCUMENTO,'
      '       DESCINVESTIMENTO,'
      '       QTDE,'
      '       PRECO,'
      '       VLROPERACAO'
      ''
      '  FROM ('
      '        SELECT DATAOPERACAO,'
      '               NUMDOCUMENTO,'
      '               QTDEOPERACAO        AS QTDE,'
      '               PRECOUNITOPERACAO   AS PRECO,'
      '               IV.DESCINVESTIMENTO,'
      '               OI.VLROPERACAO'
      ''
      '          FROM HISTCARTINV    HC,'
      '               OPERACAOINVEST OI,'
      '               TIPOOPERACAO   TP,'
      '               INVESTIMENTO   IV'
      ''
      '         WHERE TP.FLGCORRET          = '#39'S'#39
      '           AND OI.IDOPERACAODIREITO IS NULL'
      '           AND OI.IDTIPOINVEST       = 2'
      '           AND HC.TIPMOVCARTINV      = '#39'OPE'#39
      '           AND HC.NATURMOVCARTINV    = '#39'D'#39
      '           AND HC.IDOPERACAOINVEST   = OI.IDOPERACAOINVEST'
      '           AND TP.IDTIPOOPERACAO     = OI.IDTIPOOPERACAO'
      '           AND OI.IDINVESTIMENTO     = IV.IDINVESTIMENTO'
      '       )'
      ''
      'ORDER BY NUMDOCUMENTO,'
      '         DESCINVESTIMENTO,'
      '         PRECO'
      '')
    ValidateWithMask = True
    Left = 513
    Top = 274
    object qryDetVlPagRec2DATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data da~Operação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
    end
    object StringField1: TStringField
      Alignment = taCenter
      DisplayLabel = 'Boleta'
      DisplayWidth = 11
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object StringField2: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 35
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 18
      FieldName = 'QTDE'
      DisplayFormat = '#,##0'
      EditFormat = '#,##0'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Preço'
      DisplayWidth = 12
      FieldName = 'PRECO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryDetVlPagRec2VLROPERACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 18
      FieldName = 'VLROPERACAO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object dsDetVlPagRec2: TwwDataSource
    AutoEdit = False
    DataSet = qryDetVlPagRec2
    Left = 513
    Top = 328
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
    Left = 405
    Top = 148
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
