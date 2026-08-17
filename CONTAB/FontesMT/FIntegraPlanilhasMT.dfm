inherited frmIntegraPlanilhasMT: TfrmIntegraPlanilhasMT
  Left = 131
  Top = 224
  BorderStyle = bsSingle
  Caption = 'Integração por Planilhas'
  ClientHeight = 423
  ClientWidth = 796
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 796
    Height = 384
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 794
      Height = 124
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label2: TLabel
        Left = 400
        Top = 16
        Width = 106
        Height = 13
        Caption = 'Sistema de Origem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 552
        Top = 16
        Width = 103
        Height = 13
        Caption = 'Tipo de Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 16
        Top = 16
        Width = 86
        Height = 13
        Caption = 'Faixa de Datas'
      end
      object Label6: TLabel
        Left = 16
        Top = 108
        Width = 208
        Height = 13
        Caption = 'Planilhas / Lançamentos da Planilha'
      end
      object Label5: TLabel
        Left = 240
        Top = 16
        Width = 64
        Height = 13
        Caption = 'Plan.Inicial'
      end
      object Label7: TLabel
        Left = 320
        Top = 16
        Width = 57
        Height = 13
        Caption = 'Plan.Final'
      end
      object Bevel1: TBevel
        Left = 16
        Top = 62
        Width = 757
        Height = 9
        Shape = bsTopLine
      end
      object dteDataIni: TCMDateTimePicker
        Left = 16
        Top = 32
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
      end
      object dblkModulo: TwwDBLookupCombo
        Left = 400
        Top = 32
        Width = 137
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEMODULO'#9'50'#9'NOMEMODULO')
        LookupTable = cdsModulo
        LookupField = 'IDMODULO'
        Style = csDropDownList
        ParentFont = False
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object btnFiltra: TBitBtn
        Left = 704
        Top = 11
        Width = 69
        Height = 41
        Caption = 'Selecionar'
        TabOrder = 6
        OnClick = btnFiltraClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000033
          33333333330F803333333333330F803333333333330F803333333333308F8703
          3333333308F88870333333308F88888703333308F88888887033308F88888888
          870330000000000000033337FFCCCFFF033333337FFFFFCFF03333337FFCCCFF
          FF03333337FFFFFF77333333337FFF7733333333333777333333}
        Layout = blGlyphTop
      end
      object dblkTipoOper: TwwDBLookupCombo
        Left = 552
        Top = 31
        Width = 137
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TIPDESCRICAO'#9'25'#9'Operação')
        LookupTable = cdsTipoOper
        LookupField = 'TIPCODIGO'
        Style = csDropDownList
        ParentFont = False
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dteDataFim: TCMDateTimePicker
        Left = 128
        Top = 32
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
      end
      object redPlanilhaIni: TRealEdit
        Left = 240
        Top = 32
        Width = 65
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
      end
      object redPlanilhaFim: TRealEdit
        Left = 320
        Top = 32
        Width = 65
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
      end
      object btnInverte: TBitBtn
        Left = 16
        Top = 74
        Width = 128
        Height = 25
        Hint = 'Inverte a Seleção'
        Caption = 'Integra Todas'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = btnTodasClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFF88888888FFFFFFFF0777
          7770FFFFFFFF8FFFFFF8FFF000FF07777770FFF788FF8FFFFFF8FFF0FFFF0777
          7770FFF8FFFF8FFFFFF8FF000FFF07777770FF778FFF8FFFFFF8FFF0FFFF0777
          7770FFF8FFFF8FFFFFF8FFFFFFFF00000000FFFFFFFF8888888800000000FFFF
          FFFF88888888FFFFFFFF07797770FFFF0FFF8FF7FFF8FFFF8FFF07999770FFF0
          00FF8F777FF8FFF877FF09979970FFFF0FFF877F77F8FFFF8FFF09777990FF00
          0FFF87FFF778FF887FFF07777799FFFFFFFF8FFFFF77FFFFFFFF000000099FFF
          FFFF888888877FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        NumGlyphs = 2
      end
      object btnTodas: TBitBtn
        Left = 160
        Top = 74
        Width = 128
        Height = 25
        Hint = 'Seleciona TODAS as Planilhas'
        Caption = 'Inverte Seleção'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = btnInverteClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000
          000FFFFFFFF88888888FFFFFFFF07797770FFFFFFFF8FF7FFF8FFFFFF0007999
          770FFFFFF888F777FF8FFFFFF0709979970FFFFFF8F877F77F8FFFF000709777
          990FFFF888F87FFF778FFFF070907777799FFFF8F878FFFFF77FF00070900000
          0099F888F87888888877F070907777799FFFF8F878FFFFF77FFFF07090000000
          99FFF8F87888888877FFF0907777799FFFFFF878FFFFF77FFFFFF09000000099
          FFFFF87888888877FFFFF07777799FFFFFFFF8FFFFF77FFFFFFFF000000099FF
          FFFFF888888877FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        NumGlyphs = 2
      end
      object pgrStatus: TProgressBar
        Left = 400
        Top = 76
        Width = 373
        Height = 21
        Min = 0
        Max = 100
        TabOrder = 9
      end
      object Anim: TAnimate
        Left = 392
        Top = 69
        Width = 16
        Height = 16
        Active = False
        AutoSize = False
        CommonAVI = aviFindFile
        StopFrame = 8
        Visible = False
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 125
      Width = 16
      Height = 241
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 1
      Top = 366
      Width = 794
      Height = 17
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
    end
    object Panel2: TPanel
      Left = 781
      Top = 125
      Width = 14
      Height = 241
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 3
    end
    object Panel5: TPanel
      Left = 17
      Top = 125
      Width = 764
      Height = 241
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 4
      object Splitter1: TSplitter
        Left = 0
        Top = 161
        Width = 764
        Height = 8
        Cursor = crVSplit
        Align = alTop
      end
      object dbgrdLancamentos: TwwDBGrid
        Left = 0
        Top = 169
        Width = 764
        Height = 72
        Selected.Strings = (
          'LACNUMLAN'#9'10'#9'Lanç. N°'
          'LACDEBCRE'#9'1'#9'D/C'
          'LACVALOR'#9'10'#9'Valor'
          'PLACONTA'#9'18'#9'Conta'
          'PLANOME'#9'40'#9'Nome da Conta'
          'CODCENTROCUSTO'#9'10'#9'Centro de Custo'
          'LACNUMDOC'#9'15'#9'N° do Documento'
          'PLANOPREV'#9'25'#9'Plano Previdenciário'#9'F'
          'PATRO'#9'25'#9'Patrocinadora')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsLancamentos
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnCalcCellColors = dbgrdLancamentosCalcCellColors
        IndicatorColor = icBlack
        OnTopRowChanged = dbgrdLancamentosTopRowChanged
      end
      object dbgrdPlanilhas: TwwDBGrid
        Left = 0
        Top = 0
        Width = 764
        Height = 161
        ControlType.Strings = (
          'PLNEFETIVADO;CheckBox;S;N')
        Selected.Strings = (
          'PLNEFETIVADO'#9'1'#9'Efet.'
          'PLNDATDIA'#9'18'#9'Data'
          'PLNPLANIL'#9'10'#9'Planilha'
          'PLNNUMLAN'#9'10'#9'Lanc.'
          'PLNTOTDEB'#9'10'#9'Débito'
          'PLNTOTCRE'#9'10'#9'Crédito'
          'TIPDESCRICAO'#9'25'#9'Tipo de Operação'
          'NOMEMODULO'#9'50'#9'Módulo')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alTop
        DataSource = dsPlanilhas
        EditCalculated = True
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnCalcCellColors = dbgrdPlanilhasCalcCellColors
        IndicatorColor = icBlack
        OnTopRowChanged = dbgrdPlanilhasTopRowChanged
      end
    end
  end
  inherited Dock971: TDock97
    Top = 384
    Width = 796
    inherited tb97Fundo: TToolbar97
      Left = 334
      DockPos = 334
      inherited sep1: TToolbarSep97
        Left = 166
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 5
      end
      inherited bbtnSair: TBitBtn
        Left = 85
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 168
      end
      object btnIntegra: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Integrar'
        TabOrder = 2
        OnClick = btnIntegraClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888005555500
          88888887788888778F8888755555555508888878888888F878F887D555555F55
          508887F888F8878F87F887D58F55FFF55088878887F87778F78F7D558F5FFFFF
          55087F8887F77777887F7D558F555F8555087F8887F887F8887F7D558F555F85
          55087F88F7FFF7F8887F7D5FFFFF5F8555087F87777787F8887F7D55FFF55F85
          550878F877788788887887D55F555555508887F88788888887F887D555555555
          5088878F888888888788887DD555555508888878FF88888F788888877DDDDD77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65531
    Top = 419
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object cdsModulo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 432
    Top = 66
  end
  object cdsTipoOper: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 582
    Top = 63
  end
  object cdsPlanilha: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 450
    Top = 168
    object cdsPlanilhaPLNEFETIVADO: TStringField
      DisplayLabel = 'Efet.'
      DisplayWidth = 1
      FieldName = 'PLNEFETIVADO'
      FixedChar = True
      Size = 1
    end
    object cdsPlanilhaPLNDATDIA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 18
      FieldName = 'PLNDATDIA'
    end
    object cdsPlanilhaPLNPLANIL: TFloatField
      DisplayLabel = 'Planilha'
      DisplayWidth = 10
      FieldName = 'PLNPLANIL'
    end
    object cdsPlanilhaPLNNUMLAN: TFloatField
      DisplayLabel = 'Lanc.'
      DisplayWidth = 10
      FieldName = 'PLNNUMLAN'
    end
    object cdsPlanilhaPLNTOTDEB: TFloatField
      DisplayLabel = 'Débito'
      DisplayWidth = 10
      FieldName = 'PLNTOTDEB'
      DisplayFormat = '#,##0.00'
    end
    object cdsPlanilhaPLNTOTCRE: TFloatField
      DisplayLabel = 'Crédito'
      DisplayWidth = 10
      FieldName = 'PLNTOTCRE'
      DisplayFormat = '#,##0.00'
    end
    object cdsPlanilhaTIPDESCRICAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 25
      FieldName = 'TIPDESCRICAO'
      Size = 25
    end
    object cdsPlanilhaNOMEMODULO: TStringField
      DisplayLabel = 'Módulo'
      DisplayWidth = 50
      FieldName = 'NOMEMODULO'
      FixedChar = True
      Size = 50
    end
    object cdsPlanilhaPLNCODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object cdsPlanilhaIDMODULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMODULO'
      Visible = False
    end
    object cdsPlanilhaPERNUMERO: TFloatField
      DisplayWidth = 10
      FieldName = 'PERNUMERO'
      Visible = False
    end
    object cdsPlanilhaPEREXERCICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'PEREXERCICIO'
      Visible = False
    end
    object cdsPlanilhaIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object cdsPlanilhaPLNTOTDEBOFICIAL: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNTOTDEBOFICIAL'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object cdsPlanilhaPLNTOTCREOFICIAL: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNTOTCREOFICIAL'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object cdsPlanilhaPLNTOTDEBGER: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNTOTDEBGER'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object cdsPlanilhaPLNTOTCREGER: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNTOTCREGER'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object cdsPlanilhaPLNTOTDEBGEREN1: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNTOTDEBGEREN1'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object cdsPlanilhaPLNTOTCREGEREN1: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNTOTCREGEREN1'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object cdsPlanilhaPLNTOTDEBGEREN2: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNTOTDEBGEREN2'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object cdsPlanilhaPLNTOTCREGEREN2: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNTOTCREGEREN2'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object cdsPlanilhaPLNTOTDEBHIST: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNTOTDEBHIST'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object cdsPlanilhaPLNTOTCREHIST: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNTOTCREHIST'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object cdsPlanilhaPLNPLANESTORNO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNPLANESTORNO'
      Visible = False
    end
    object cdsPlanilhaPLNREFERENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNREFERENCIA'
      Visible = False
    end
    object cdsPlanilhaPANCODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'PANCODIGO'
      Visible = False
    end
  end
  object cdsLancamento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 171
    object cdsLancamentoLACNUMLAN: TFloatField
      DisplayLabel = 'Lanç. N°'
      DisplayWidth = 10
      FieldName = 'LACNUMLAN'
    end
    object cdsLancamentoLACDEBCRE: TStringField
      DisplayLabel = 'D/C'
      DisplayWidth = 1
      FieldName = 'LACDEBCRE'
      FixedChar = True
      Size = 1
    end
    object cdsLancamentoLACVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'LACVALOR'
      DisplayFormat = '#,##0.00'
    end
    object cdsLancamentoPLACONTA: TStringField
      DisplayLabel = 'Conta'
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      FixedChar = True
      Size = 18
    end
    object cdsLancamentoPLANOME: TStringField
      DisplayLabel = 'Nome da Conta'
      DisplayWidth = 40
      FieldName = 'PLANOME'
      Size = 40
    end
    object cdsLancamentoCODCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object cdsLancamentoLACNUMDOC: TStringField
      DisplayLabel = 'N° do Documento'
      DisplayWidth = 15
      FieldName = 'LACNUMDOC'
      Size = 15
    end
    object cdsLancamentoPLANOPREV: TStringField
      DisplayLabel = 'Plano Previdenciário'
      DisplayWidth = 25
      FieldName = 'PLANOPREV'
      Size = 50
    end
    object cdsLancamentoPATRO: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 25
      FieldName = 'PATRO'
      Size = 60
    end
    object cdsLancamentoPLACCUST: TStringField
      DisplayWidth = 1
      FieldName = 'PLACCUST'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsLancamentoPERNUMERO: TFloatField
      DisplayWidth = 10
      FieldName = 'PERNUMERO'
      Visible = False
    end
    object cdsLancamentoPEREXERCICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'PEREXERCICIO'
      Visible = False
    end
    object cdsLancamentoPLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLANO'
      Visible = False
    end
    object cdsLancamentoTIPCODIGO: TStringField
      DisplayWidth = 2
      FieldName = 'TIPCODIGO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object cdsLancamentoCODSUBCONTA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODSUBCONTA'
      Visible = False
    end
    object cdsLancamentoIDEMPRESA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object cdsLancamentoUNIDNEGOC: TFloatField
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Visible = False
    end
    object cdsLancamentoIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object cdsLancamentoIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Visible = False
    end
    object cdsLancamentoPLATIPO: TStringField
      DisplayWidth = 1
      FieldName = 'PLATIPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsLancamentoPLAGRUPO: TStringField
      DisplayWidth = 1
      FieldName = 'PLAGRUPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsLancamentoPLANOMEOUTLING: TStringField
      DisplayWidth = 40
      FieldName = 'PLANOMEOUTLING'
      Visible = False
      Size = 40
    end
    object cdsLancamentoPLNPLANIL: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNPLANIL'
      Visible = False
    end
    object cdsLancamentoPLNCODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object cdsLancamentoPLNDATDIA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'PLNDATDIA'
      Visible = False
    end
    object cdsLancamentoLACVALOFICIAL: TFloatField
      DisplayWidth = 10
      FieldName = 'LACVALOFICIAL'
      Visible = False
    end
    object cdsLancamentoLACVALGERENCIAL: TFloatField
      DisplayWidth = 10
      FieldName = 'LACVALGERENCIAL'
      Visible = False
    end
    object cdsLancamentoLACVALGEREN1: TFloatField
      DisplayWidth = 10
      FieldName = 'LACVALGEREN1'
      Visible = False
    end
    object cdsLancamentoLACVALGEREN2: TFloatField
      DisplayWidth = 10
      FieldName = 'LACVALGEREN2'
      Visible = False
    end
    object cdsLancamentoLACVALHIST: TFloatField
      DisplayWidth = 10
      FieldName = 'LACVALHIST'
      Visible = False
    end
  end
  object dsPlanilhas: TwwDataSource
    DataSet = cdsPlanilha
    OnDataChange = dsPlanilhasDataChange
    Left = 453
    Top = 230
  end
  object dsLancamentos: TwwDataSource
    DataSet = cdsLancamento
    Left = 356
    Top = 227
  end
end
