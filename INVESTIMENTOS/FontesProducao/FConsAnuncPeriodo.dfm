inherited frmConsAnuncPeriodo: TfrmConsAnuncPeriodo
  Left = 424
  Top = 71
  HelpContext = 790549
  Caption = 'Consulta'
  ClientHeight = 518
  ClientWidth = 784
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 784
    Height = 479
    inherited bvlSepTit: TBevel
      Width = 782
    end
    inherited pnlTitulo: TPanel
      Width = 782
      inherited lbNomDescricao: TfcLabel
        Width = 354
        Caption = 'Anúncios de Proventos no Período'
      end
    end
    object pnlConsulta: TPanel
      Left = 1
      Top = 45
      Width = 782
      Height = 128
      Align = alTop
      TabOrder = 1
      object lblTipoAnunc: TLabel
        Left = 16
        Top = 44
        Width = 94
        Height = 13
        Caption = 'Tipo de Anúncio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblInvestimento: TLabel
        Left = 554
        Top = 44
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object lblDtIni: TLabel
        Left = 16
        Top = 5
        Width = 66
        Height = 13
        Caption = 'Data Inicial'
      end
      object lblDtFim: TLabel
        Left = 171
        Top = 5
        Width = 59
        Height = 13
        Caption = 'Data Final'
      end
      object lblTipoOper: TLabel
        Left = 328
        Top = 44
        Width = 103
        Height = 13
        Caption = 'Tipo de Operação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 328
        Top = 5
        Width = 126
        Height = 13
        Caption = 'Plano / Patrocinadora'
      end
      object Label6: TLabel
        Left = 16
        Top = 83
        Width = 149
        Height = 13
        Caption = 'Segmentação de Mercado'
        FocusControl = dblSegmentacao
      end
      object dblkInvest: TwwDBLookupCombo
        Left = 554
        Top = 59
        Width = 215
        Height = 21
        Hint = 'Investimento'
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'60'#9'Descrição'#9'F')
        LookupTable = DmRelAnuncPeriodo.qryInvestimento
        LookupField = 'IDINVESTIMENTO'
        Options = [loRowLines, loTitles]
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblkInvestCloseUp
      end
      object dblkTipoAnuncio: TwwDBLookupCombo
        Left = 16
        Top = 59
        Width = 300
        Height = 21
        Hint = 'Tipo de Operação'
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOOPERACAO'#9'60'#9'Descrição'#9'F')
        LookupTable = DmRelAnuncPeriodo.qryTipoAnuncio
        LookupField = 'IDTIPOOPERACAO'
        Options = [loRowLines, loTitles]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dtDataIni: TCMDateTimePicker
        Left = 16
        Top = 19
        Width = 145
        Height = 21
        Hint = 'Data EX'
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
      object dtDataFim: TCMDateTimePicker
        Left = 171
        Top = 19
        Width = 145
        Height = 21
        Hint = 'Data EX'
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
      end
      object dblkTipoOper: TwwDBLookupCombo
        Left = 328
        Top = 59
        Width = 216
        Height = 21
        Hint = 'Tipo de Operação'
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOOPERACAO'#9'60'#9'Descrição'#9'F')
        LookupTable = DmRelAnuncPeriodo.qryTipoOperacao
        LookupField = 'IDTIPOOPERACAO'
        Options = [loRowLines, loTitles]
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblPlanoPrev: TwwDBLookupCombo
        Left = 328
        Top = 20
        Width = 440
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'60'#9'Descrição'#9'F')
        LookupTable = DmRelAnuncPeriodo.qryPlanoPrev
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object ChBxConsolidadoInvest: TCheckBox
        Left = 339
        Top = 98
        Width = 193
        Height = 17
        Caption = 'Consolidado por Investimento'
        TabOrder = 6
        OnClick = ChBxConsolidadoInvestClick
      end
      object dblSegmentacao: TwwDBLookupCombo
        Left = 16
        Top = 98
        Width = 300
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCSEGMENTACAO'#9'50'#9'Segmentação'#9'F')
        LookupTable = DmRelAnuncPeriodo.QrySegmentacao
        LookupField = 'IDSEGMENTACAO'
        Options = [loRowLines, loTitles]
        TabOrder = 7
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
    object dbgAnuncRel: TwwDBGrid
      Left = 1
      Top = 173
      Width = 782
      Height = 305
      Selected.Strings = (
        'PLANPRVCONTABPATRO'#9'32'#9'Plano / Patrocinadora'
        'DATAOPER'#9'11'#9'Data EX'
        'DATACOM'#9'11'#9'Data Prevista'
        'DATAEX'#9'11'#9'Data Base'
        'DATAAGE'#9'11'#9'Data AGE'
        'DESCANUNCIO'#9'37'#9'Tipo de Anúncio'
        'BOLETA'#9'14'#9'Boleta'
        'DESCINVESTIMENTO'#9'29'#9'Investimento'
        'QTDEOPERACAO'#9'14'#9'Qtd. Prevista'
        'PRECOUNITOPERACAO'#9'14'#9'Preço Unitário'
        'DESCTIPOOPERACAO'#9'31'#9'Tipo de Operação'
        'VLRREMUNERACAO'#9'16'#9'Remuneração'
        'VLROPERACAO'#9'14'#9'Valor do Anúncio'
        'VLRRCBER'#9'14'#9'Valor a Receber'
        'DESCCARTINVEST'#9'37'#9'Carteira')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = DmRelAnuncPeriodo.dsAnuncPeriodo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clMaroon
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = dbgAnuncRelCalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = dbgAnuncRelTopRowChanged
    end
  end
  inherited Dock971: TDock97
    Top = 479
    Width = 784
    inherited tb97Fundo: TToolbar97
      Left = 443
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
      inherited bt_Imprime: TBitBtn
        OnClick = bt_ImprimeClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 187
    Top = 65531
  end
end
