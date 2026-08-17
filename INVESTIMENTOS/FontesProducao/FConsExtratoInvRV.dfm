inherited FrmConsExtratoInvRV: TFrmConsExtratoInvRV
  Left = 110
  Top = 152
  HelpContext = 790546
  Caption = 'Consulta de Extrato de Investimentos '
  ClientHeight = 553
  ClientWidth = 800
  Position = poDefault
  WindowState = wsMaximized
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 800
    Height = 137
    Align = alTop
    object pnlCombos: TPanel
      Left = 1
      Top = 1
      Width = 798
      Height = 135
      Align = alClient
      TabOrder = 0
      object Label2: TLabel
        Left = 334
        Top = 48
        Width = 45
        Height = 13
        Caption = 'Carteira'
      end
      object Label4: TLabel
        Left = 16
        Top = 90
        Width = 44
        Height = 13
        Caption = 'Emissor'
      end
      object Label1: TLabel
        Left = 334
        Top = 88
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object Label6: TLabel
        Left = 16
        Top = 6
        Width = 66
        Height = 13
        Caption = 'Data Inicial'
      end
      object Label8: TLabel
        Left = 120
        Top = 5
        Width = 59
        Height = 13
        Caption = 'Data Final'
      end
      object Label3: TLabel
        Left = 16
        Top = 48
        Width = 103
        Height = 13
        Caption = 'Tipo de Operação'
      end
      object lblBoleta: TLabel
        Left = 648
        Top = 90
        Width = 37
        Height = 13
        Caption = 'Boleta'
      end
      object lblPlanPatro: TLabel
        Left = 334
        Top = 5
        Width = 127
        Height = 13
        Caption = 'Plano e Patrocinadora'
      end
      object dblCarteira: TwwDBLookupCombo
        Left = 334
        Top = 62
        Width = 305
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'40'#9'Carteira de Investimentos ')
        LookupTable = QryCarteira
        LookupField = 'IDCARTEIRAINVEST'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblCarteiraExit
      end
      object DbLkEmissor: TwwDBLookupCombo
        Left = 16
        Top = 104
        Width = 305
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SIGLAEMISSOR'#9'40'#9'Emissor')
        LookupTable = QryEmissor
        LookupField = 'IDEMISSOR'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = DbLkEmissorCloseUp
        OnExit = DbLkEmissorExit
      end
      object dblInvestimento: TwwDBLookupCombo
        Left = 334
        Top = 104
        Width = 305
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'40'#9'Investimento')
        LookupTable = QryInvestimento
        LookupField = 'IDINVESTIMENTO'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblInvestimentoExit
      end
      object edDataIni: TCMDateTimePicker
        Left = 16
        Top = 20
        Width = 97
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
        OnExit = edDataIniExit
      end
      object edDataFim: TCMDateTimePicker
        Left = 120
        Top = 20
        Width = 97
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
        OnExit = edDataFimExit
      end
      object dblTipoOperacao: TwwDBLookupCombo
        Left = 16
        Top = 62
        Width = 305
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOOPERACAO'#9'40'#9'Tipo de Operacao'#9'F')
        LookupTable = qryTipoOperacao
        LookupField = 'IDTIPOOPERACAO'
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnExit = dblTipoOperacaoExit
      end
      object dblkBoleta: TwwDBLookupCombo
        Left = 648
        Top = 104
        Width = 143
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NUMDOCUMENTO'#9'30'#9'Documento'#9'F')
        LookupTable = qryBoleta
        LookupField = 'NUMDOCUMENTO'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 7
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblkPlanPatro: TwwDBLookupCombo
        Left = 334
        Top = 20
        Width = 305
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'40'#9'Plano e Patrocinadora'#9'F')
        LookupTable = QryPatroPlanPrevContab
        LookupField = 'IDPLANPREVCTBPATR'
        Style = csDropDownList
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnExit = dblTipoOperacaoExit
      end
    end
  end
  inherited Dock971: TDock97
    Top = 514
    Width = 800
    inherited tb97Fundo: TToolbar97
      Left = 632
      DockPos = 1151
      TabOrder = 1
    end
    object TB97oKCancelar: TToolbar97
      Left = 381
      Top = 0
      Caption = 'TB97oKCancelar'
      DockPos = 900
      TabOrder = 0
      object ToolbarSep971: TToolbarSep97
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object ToolbarSep972: TToolbarSep97
        Left = 163
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 0
        OnClick = bbtnConfirmarClick
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
      object bbtnCancelar: TBitBtn
        Left = 83
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 1
        OnClick = bbtnCancelarClick
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
      end
      object bbtnImprimir: TBitBtn
        Left = 166
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        Enabled = False
        TabOrder = 2
        OnClick = bbtnImprimirClick
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
  object pgcExtrato: TPageControl [2]
    Left = 0
    Top = 137
    Width = 800
    Height = 297
    ActivePage = tbEstoqueIni
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 2
    object tbEstoqueIni: TTabSheet
      Caption = 'Estoque Inicial'
      ImageIndex = 1
      object dbgEstoqueIni: TwwDBGrid
        Left = 0
        Top = 0
        Width = 792
        Height = 269
        Selected.Strings = (
          'DESCCARTINVEST'#9'40'#9'Carteira'
          'PLANPRVCONTABPATRO'#9'40'#9'Plano / Patro'
          'DESCINVESTIMENTO'#9'40'#9'Investimento'
          'SGLCUSTODIANTE'#9'10'#9'Custodiante'
          'DATAMOVCUSTOD'#9'10'#9'Data'
          'SALDOLIBERADO'#9'15'#9'Saldo Liberado'
          'SALDOBLOQUEADO'#9'13'#9'Saldo Bloqueado'
          'SALDOTOTAL'#9'14'#9'Saldo Total')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DmRelExtratoInvRV.dsEstoqueIni
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        PopupMenu = pmnuConsExtSldIni
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object tbLancamentos: TTabSheet
      Caption = 'Lançamentos na Carteira'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      object dbgLancamentos: TwwDBGrid
        Left = 0
        Top = 0
        Width = 792
        Height = 269
        Selected.Strings = (
          'DATAMOVCARTINV'#9'10'#9'Data'
          'NUMDOCUMENTO'#9'15'#9'Boleta'
          'PLANPRVCONTABPATRO'#9'40'#9'Plano / Patro'
          'HISTMOVCARTINV'#9'40'#9'Descrição'
          'SGLCORRETVALORES'#9'15'#9'Corretora'
          'QTDEMOVINVCART'#9'16'#9'Qtd Operação'
          'PRECOUNITOPERACAO'#9'15'#9'P.U.'
          'VLRMOVCARTINV'#9'16'#9'Valor da Operação'
          'MOVIMAQUI'#9'10'#9'Custo'
          'VLRVARIACAO'#9'10'#9'Variação'
          'DESPESAS'#9'15'#9'Despesas'
          'LUCPREJ'#9'15'#9'Lucro / Prejuízo'
          'SALDOQTDEINVCART'#9'16'#9'Saldo Qtd')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DmRelExtratoInvRV.dsOperacoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = [dgAllowDelete]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = pmnuConsExtLanc
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnDrawDataCell = dbgLancamentosDrawDataCell
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
    end
    object tbEstoqueFim: TTabSheet
      Caption = 'Estoque Final'
      ImageIndex = 2
      object dbgEstoqueFim: TwwDBGrid
        Left = 0
        Top = 0
        Width = 792
        Height = 269
        Selected.Strings = (
          'DESCCARTINVEST'#9'40'#9'Carteira'
          'PLANPRVCONTABPATRO'#9'40'#9'Plano / Patro'
          'DESCINVESTIMENTO'#9'40'#9'Investimento'
          'SGLCUSTODIANTE'#9'10'#9'Custodiante'
          'SALDOLIBERADO'#9'15'#9'Saldo Liberado'
          'SALDOBLOQUEADO'#9'13'#9'Saldo Bloqueado'
          'SALDOTOTAL'#9'14'#9'Saldo Total'
          'DATAMOVCUSTOD'#9'10'#9'Data')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DmRelExtratoInvRV.dsEstoqueFim
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        PopupMenu = pmnuConsExtSldFim
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
  end
  object pnlFundoValores: TPanel [3]
    Left = 0
    Top = 434
    Width = 800
    Height = 80
    Align = alBottom
    BevelInner = bvLowered
    BorderWidth = 3
    TabOrder = 3
    object pnlValores: TPanel
      Left = 5
      Top = 5
      Width = 380
      Height = 70
      Align = alLeft
      TabOrder = 0
      object lbNomItem: TfcLabel
        Left = 8
        Top = 5
        Width = 85
        Height = 22
        Caption = 'Compras'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object fcLabel2: TfcLabel
        Left = 105
        Top = 9
        Width = 88
        Height = 19
        Caption = 'Quantidade'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object fcLabel3: TfcLabel
        Left = 105
        Top = 41
        Width = 40
        Height = 19
        Caption = 'Valor'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object edtCPQtd: TRealEdit
        Left = 201
        Top = 10
        Width = 169
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
      object edtCPVal: TRealEdit
        Left = 201
        Top = 42
        Width = 169
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    object Panel1: TPanel
      Left = 435
      Top = 5
      Width = 360
      Height = 70
      Align = alRight
      TabOrder = 1
      object fcLabel1: TfcLabel
        Left = 8
        Top = 5
        Width = 70
        Height = 22
        Caption = 'Vendas'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object fcLabel5: TfcLabel
        Left = 90
        Top = 9
        Width = 88
        Height = 19
        Caption = 'Quantidade'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object fcLabel4: TfcLabel
        Left = 91
        Top = 41
        Width = 40
        Height = 19
        Caption = 'Valor'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
      object edtVDVal: TRealEdit
        Left = 182
        Top = 42
        Width = 169
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edtVDQtd: TRealEdit
        Left = 182
        Top = 10
        Width = 169
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
      end
    end
    object pnlSeparador: TPanel
      Left = 385
      Top = 5
      Width = 50
      Height = 70
      Align = alClient
      TabOrder = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 735
    Top = 6
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object QryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDINVESTIMENTO, DESCINVESTIMENTO'
      ''
      'FROM   INVESTIMENTO'
      ''
      'WHERE  (IDTIPOINVEST IN (1,2)) AND'
      
        '       (((:pIDEMISSOR IS NOT NULL) AND (IDEMISSOR = :pIDEMISSOR)' +
        ') OR (:pIDEMISSOR IS NULL))'
      ''
      'ORDER BY DESCINVESTIMENTO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 560
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDEMISSOR'
        ParamType = ptUnknown
      end>
    object QryInvestimentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryInvestimentoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
  end
  object QryCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDCARTEIRAINVEST, DESCCARTINVEST'
      ''
      'FROM CARTEIRAINVEST'
      ''
      'WHERE IDTIPOINVEST = 2'
      ''
      'ORDER BY DESCCARTINVEST'
      ' ')
    ValidateWithMask = True
    Left = 560
    Top = 200
    object QryCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = '"CM.CARTEIRAINVEST".IDCARTEIRAINVEST'
    end
    object QryCarteiraDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Origin = '"CM.CARTEIRAINVEST".DESCCARTINVEST'
      Size = 60
    end
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 560
    Top = 374
  end
  object QryEmissor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT EMI.IDEMISSOR, EMI.SIGLAEMISSOR'
      'FROM EMISSOR EMI, INVESTIMENTO INV'
      'WHERE INV.IDEMISSOR(+) = EMI.IDEMISSOR AND'
      '      INV.IDTIPOINVEST = 2'
      'ORDER BY SIGLAEMISSOR'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 560
    Top = 240
    object QryEmissorSIGLAEMISSOR: TStringField
      DisplayLabel = 'Emissor'
      DisplayWidth = 40
      FieldName = 'SIGLAEMISSOR'
      Size = 15
    end
    object QryEmissorIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Visible = False
    end
  end
  object pmnuConsExtLanc: TPopupMenu
    OnPopup = pmnuConsExtLancPopup
    Left = 48
    Top = 328
    object mitLancFixCol: TMenuItem
      Caption = 'Fixar Coluna'
      Enabled = False
      OnClick = mitLancFixColClick
    end
    object mitLancLibCol: TMenuItem
      Caption = 'Liberar Coluna'
      Enabled = False
      OnClick = mitLancLibColClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mitLancLibColTodas: TMenuItem
      Caption = 'Libera Todas as Colunas'
      Enabled = False
      OnClick = mitLancLibColTodasClick
    end
  end
  object pmnuConsExtSldIni: TPopupMenu
    OnPopup = pmnuConsExtSldIniPopup
    Left = 48
    Top = 272
    object mitSldIniFixCol: TMenuItem
      Caption = 'Fixar Coluna'
      Enabled = False
      OnClick = mitSldIniFixColClick
    end
    object mitSldIniLibCol: TMenuItem
      Caption = 'Liberar Coluna'
      Enabled = False
      OnClick = mitSldIniLibColClick
    end
    object MenuItem3: TMenuItem
      Caption = '-'
    end
    object mitSldIniLibColTodas: TMenuItem
      Caption = 'Libera Todas as Colunas'
      Enabled = False
      OnClick = mitSldIniLibColTodasClick
    end
  end
  object pmnuConsExtSldFim: TPopupMenu
    OnPopup = pmnuConsExtSldFimPopup
    Left = 48
    Top = 216
    object mitSldFimFixCol: TMenuItem
      Caption = 'Fixar Coluna'
      Enabled = False
      OnClick = mitSldFimFixColClick
    end
    object mitSldFimLibCol: TMenuItem
      Caption = 'Liberar Coluna'
      Enabled = False
      OnClick = mitSldFimLibColClick
    end
    object MenuItem7: TMenuItem
      Caption = '-'
    end
    object mitSldFimLibColTodas: TMenuItem
      Caption = 'Libera Todas as Colunas'
      Enabled = False
      OnClick = mitSldFimLibColTodasClick
    end
  end
  object qryTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOOPERACAO, DESCTIPOOPERACAO FROM TIPOOPERACAO'
      'WHERE IDTIPOOPERACAO > 0 AND IDTIPOINVEST = 2'
      'UNION'
      
        'SELECT 0 AS IDTIPOOPERACAO, '#39'INI - SALDO INICIAL'#39' AS DESCTIPOOPE' +
        'RACAO FROM DUAL'
      'ORDER BY DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 560
    Top = 325
  end
  object qryBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT OP.NUMDOCUMENTO'
      'FROM OPERACAOINVEST OP, INVESTIMENTO IV'
      'WHERE '
      
        '   (OP.DATAOPERACAO BETWEEN (TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')) AND' +
        ' (TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')))'
      
        '   AND ((:IDINVESTIMENTO IS NULL)   OR (OP.IDINVESTIMENTO = :IDI' +
        'NVESTIMENTO))'
      
        '   AND ((:IDTIPOOPERACAO IS NULL)   OR (OP.IDTIPOOPERACAO = :IDT' +
        'IPOOPERACAO))'
      
        '   AND ((:IDEMISSOR IS NULL)        OR (IV.IDEMISSOR = :IDEMISSO' +
        'R))'
      
        '   AND ((:IDCARTEIRAINVEST IS NULL) OR (OP.IDCARTEIRAINVEST = :I' +
        'DCARTEIRAINVEST))'
      '   AND (IV.IDINVESTIMENTO = OP.IDINVESTIMENTO)'
      'ORDER BY OP.NUMDOCUMENTO'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 656
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end>
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
    Left = 450
    Top = 206
    object QryPatroPlanPrevContabPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano e Patrocinadora'
      DisplayWidth = 40
      FieldName = 'PLANPRVCONTABPATRO'
      Origin = 'PLANPREVCONTABIL.NOME'
      Size = 113
    end
    object QryPatroPlanPrevContabIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'PLANPREVCONTABPATRO.IDPLANPREVCTBPATR'
      Visible = False
    end
    object QryPatroPlanPrevContabIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'PLANPREVCONTABPATRO.IDPLANOPREV'
      Visible = False
    end
    object QryPatroPlanPrevContabIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Origin = 'PLANPREVCONTABPATRO.IDPATRO'
      Visible = False
    end
  end
end
