inherited frmConsLanContRVOPE: TfrmConsLanContRVOPE
  Left = 172
  Top = 113
  HelpContext = 790562
  Caption = 'Consulta'
  ClientHeight = 550
  ClientWidth = 902
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 902
    Height = 511
    inherited bvlSepTit: TBevel
      Width = 900
    end
    object splBoletas: TSplitter [1]
      Left = 433
      Top = 92
      Width = 3
      Height = 418
      Cursor = crHSplit
    end
    inherited pnlTitulo: TPanel
      Width = 900
      inherited lbNomDescricao: TfcLabel
        Width = 581
        Caption = 'Lançamentos Contábeis de Operações de Renda Variável'
      end
    end
    object pnlDados: TPanel
      Left = 1
      Top = 45
      Width = 900
      Height = 47
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 14
        Top = 4
        Width = 112
        Height = 13
        Caption = 'Data de Referência'
      end
      object lblPlanoPatro: TLabel
        Left = 145
        Top = 4
        Width = 126
        Height = 13
        Caption = 'Plano / Patrocinadora'
      end
      object dtDataRef: TCMDateTimePicker
        Left = 14
        Top = 20
        Width = 121
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
        OnEnter = dtDataRefEnter
        OnExit = dtDataRefExit
      end
      object LkcPlanPatro: TwwDBLookupCombo
        Left = 145
        Top = 20
        Width = 339
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'30'#9'Descrição'#9'F')
        LookupTable = DmRelLanContRVOPE.QryPlanoPatro
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
    end
    object pnlBoletas: TPanel
      Left = 1
      Top = 92
      Width = 432
      Height = 418
      Align = alLeft
      TabOrder = 2
      object dbgBoletas: TwwDBGrid
        Left = 1
        Top = 1
        Width = 430
        Height = 416
        Selected.Strings = (
          'IDBOLETA'#9'11'#9'Boleta'
          'PLANO'#9'5'#9'Plano'
          'PLNCODIGO'#9'10'#9'Planilha'
          'CODDOCUMENTO'#9'10'#9'Documento'
          'STATUS'#9'9'#9'Status'
          'PLANPRVCONTABPATRO'#9'50'#9'Plano / Patrocinadora'#9'F'
          'FORCLI'#9'50'#9'Fornecedor / Cliente'
          'OBSERVACAO'#9'10'#9'Obs')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DmRelLanContRVOPE.dsBoletas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnDrawDataCell = dbgBoletasDrawDataCell
        IndicatorColor = icBlack
      end
    end
    object pnlDetalhes: TPanel
      Left = 436
      Top = 92
      Width = 465
      Height = 418
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 3
      object splDetalhes: TSplitter
        Left = 0
        Top = 137
        Width = 465
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object pnlLancamento: TPanel
        Left = 0
        Top = 140
        Width = 465
        Height = 278
        Align = alClient
        TabOrder = 0
        object dbgLancamento: TwwDBGrid
          Left = 1
          Top = 1
          Width = 463
          Height = 276
          Selected.Strings = (
            'HISTORICO'#9'51'#9'Histórico do Lançamento'
            'LANCAMENTO'#9'13'#9'Valor Lançado'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = DmRelLanContRVOPE.dsLancamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          KeyOptions = [dgEnterToTab]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
          ParentFont = False
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
      object pnlHistoricos: TPanel
        Left = 0
        Top = 0
        Width = 465
        Height = 137
        Align = alTop
        TabOrder = 1
        object dbgHistorico: TwwDBGrid
          Left = 1
          Top = 1
          Width = 463
          Height = 135
          Selected.Strings = (
            'HISTMOVCARTINV'#9'51'#9'Histórico da Movimentação'
            'VALOR'#9'12'#9'Valor Calculado')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = DmRelLanContRVOPE.dsHistoricos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnDrawDataCell = dbgHistoricoDrawDataCell
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 511
    Width = 902
    inherited tb97Fundo: TToolbar97
      Left = 730
      DockPos = 1054
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 477
      DockPos = 800
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 165
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
      object bbtnImprimir: TBitBtn
        Left = 168
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
end
