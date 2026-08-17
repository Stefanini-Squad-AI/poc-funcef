inherited frmCadFaixa: TfrmCadFaixa
  Left = 373
  Top = 170
  Caption = 'Faixas Salariais'
  ClientHeight = 390
  ClientWidth = 580
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 580
    Height = 304
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 2
      Top = 2
      Width = 576
      Height = 300
      object bvFx1: TBevel
        Left = 40
        Top = 34
        Width = 232
        Height = 260
        Style = bsRaised
      end
      object bvFx2: TBevel
        Left = 278
        Top = 34
        Width = 232
        Height = 260
        Style = bsRaised
      end
      object Label1: TLabel
        Left = 54
        Top = 9
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label2: TLabel
        Left = 186
        Top = 9
        Width = 111
        Height = 13
        Caption = 'Data de Efetivação'
      end
      object lblTit9: TLabel
        Left = 121
        Top = 246
        Width = 38
        Height = 13
        Caption = 'Step 9'
      end
      object lblTit8: TLabel
        Left = 121
        Top = 222
        Width = 38
        Height = 13
        Caption = 'Step 8'
      end
      object lblTit7: TLabel
        Left = 121
        Top = 198
        Width = 38
        Height = 13
        Caption = 'Step 7'
      end
      object lblTit6: TLabel
        Left = 121
        Top = 174
        Width = 38
        Height = 13
        Caption = 'Step 6'
      end
      object lblTit5: TLabel
        Left = 121
        Top = 150
        Width = 38
        Height = 13
        Caption = 'Step 5'
      end
      object lblTit4: TLabel
        Left = 121
        Top = 126
        Width = 38
        Height = 13
        Caption = 'Step 4'
      end
      object lblTit3: TLabel
        Left = 121
        Top = 102
        Width = 38
        Height = 13
        Alignment = taRightJustify
        Caption = 'Step 3'
      end
      object lblTit2: TLabel
        Left = 121
        Top = 78
        Width = 38
        Height = 13
        Alignment = taRightJustify
        Caption = 'Step 2'
      end
      object lblTit1: TLabel
        Left = 121
        Top = 54
        Width = 38
        Height = 13
        Alignment = taRightJustify
        Caption = 'Step 1'
      end
      object lblTit10: TLabel
        Left = 114
        Top = 270
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Step 10'
      end
      object lblTit19: TLabel
        Left = 352
        Top = 246
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Step 19'
      end
      object lblTit18: TLabel
        Left = 352
        Top = 222
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Step 18'
      end
      object lblTit17: TLabel
        Left = 352
        Top = 198
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Step 17'
      end
      object lblTit16: TLabel
        Left = 352
        Top = 174
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Step 16'
      end
      object lblTit15: TLabel
        Left = 352
        Top = 150
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Step 15'
      end
      object lblTit14: TLabel
        Left = 352
        Top = 126
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Step 14'
      end
      object lblTit13: TLabel
        Left = 352
        Top = 102
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Step 13'
      end
      object lblTit12: TLabel
        Left = 352
        Top = 78
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Step 12'
      end
      object lblTit11: TLabel
        Left = 352
        Top = 54
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Step 11'
      end
      object lblTit20: TLabel
        Left = 352
        Top = 270
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Step 20'
      end
      object wwDBEdit1: TwwDBEdit
        Left = 99
        Top = 6
        Width = 67
        Height = 21
        DataField = 'IDFAIXASALARIAL'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBDateEdit1: TCMDateTimePicker
        Left = 302
        Top = 6
        Width = 100
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAEFETIV'
        DataSource = ds
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
      object dbredVal9: TDBRealEdit
        Left = 164
        Top = 243
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 10
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'STEP9'
        DataSource = ds
      end
      object dbredVal8: TDBRealEdit
        Left = 164
        Top = 219
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 9
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'STEP8'
        DataSource = ds
      end
      object dbredVal7: TDBRealEdit
        Left = 164
        Top = 195
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 8
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'STEP7'
        DataSource = ds
      end
      object dbredVal6: TDBRealEdit
        Left = 164
        Top = 171
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 7
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'STEP6'
        DataSource = ds
      end
      object dbredVal5: TDBRealEdit
        Left = 164
        Top = 147
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 6
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'STEP5'
        DataSource = ds
      end
      object dbredVal4: TDBRealEdit
        Left = 164
        Top = 123
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 5
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'STEP4'
        DataSource = ds
      end
      object dbredVal3: TDBRealEdit
        Left = 164
        Top = 99
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 4
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'STEP3'
        DataSource = ds
      end
      object dbredVal2: TDBRealEdit
        Left = 164
        Top = 75
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'STEP2'
        DataSource = ds
      end
      object dbredVal1: TDBRealEdit
        Left = 164
        Top = 51
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'STEP1'
        DataSource = ds
      end
      object dbredVal10: TDBRealEdit
        Left = 164
        Top = 267
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 11
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'STEP10'
        DataSource = ds
      end
      object dbredVal19: TDBRealEdit
        Left = 402
        Top = 243
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 20
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'STEP19'
        DataSource = ds
      end
      object dbredVal18: TDBRealEdit
        Left = 402
        Top = 219
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 19
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'STEP18'
        DataSource = ds
      end
      object dbredVal17: TDBRealEdit
        Left = 402
        Top = 195
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 18
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'STEP17'
        DataSource = ds
      end
      object dbredVal16: TDBRealEdit
        Left = 402
        Top = 171
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 17
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'STEP16'
        DataSource = ds
      end
      object dbredVal15: TDBRealEdit
        Left = 402
        Top = 147
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 16
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'STEP15'
        DataSource = ds
      end
      object dbredVal14: TDBRealEdit
        Left = 402
        Top = 123
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 15
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'STEP14'
        DataSource = ds
      end
      object dbredVal13: TDBRealEdit
        Left = 402
        Top = 99
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 14
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'STEP13'
        DataSource = ds
      end
      object dbredVal12: TDBRealEdit
        Left = 402
        Top = 75
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 13
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'STEP12'
        DataSource = ds
      end
      object dbredVal11: TDBRealEdit
        Left = 402
        Top = 51
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 12
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'STEP11'
        DataSource = ds
      end
      object dbredVal20: TDBRealEdit
        Left = 402
        Top = 267
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 21
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'STEP20'
        DataSource = ds
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 2
      Top = 2
      Width = 576
      Height = 300
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 580
    object bbtnHistFaixa: TToolbarButton97 [0]
      Left = 260
      Top = 0
      Width = 125
      Height = 41
      Hint = 'Mostrar/Ocultar Histórico da Faixa Selecionada (alternar)'
      Caption = '&Histórico das Faixas'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      Opaque = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 0
      OnClick = bbtnHistFaixaClick
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 351
    Width = 580
    inherited tb97Fundo: TToolbar97
      Left = 408
      DockPos = 411
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 239
      DockPos = 242
    end
  end
  object pnlHistFaixa: TPanel [3]
    Left = 114
    Top = 70
    Width = 354
    Height = 156
    TabOrder = 3
    Visible = False
    object lblHistFaixa: TLabel
      Left = 5
      Top = 4
      Width = 344
      Height = 18
      Alignment = taCenter
      AutoSize = False
      Caption = 'Histórico da Faixa'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object dbGridHistFaixa: TwwDBGrid
      Left = 5
      Top = 25
      Width = 345
      Height = 127
      Selected.Strings = (
        'DATAEFETIVACAO'#9'18'#9'Data de Efetivação'#9'F'
        'IDFAIXASALEXT'#9'15'#9'Nº do Nível'#9'F'
        'VALOR'#9'16'#9'Valor'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = clWhite
      DataSource = dsHistFaixa
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      IndicatorColor = icBlack
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 56
    Top = 358
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 340
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update FAIXASAL'
      'set'
      '  IDFAIXASALARIAL = :IDFAIXASALARIAL,'
      '  STEP1 = :STEP1,'
      '  DATAEFETIV = :DATAEFETIV,'
      '  STEP2 = :STEP2,'
      '  STEP3 = :STEP3,'
      '  STEP4 = :STEP4,'
      '  STEP5 = :STEP5,'
      '  STEP6 = :STEP6,'
      '  STEP7 = :STEP7,'
      '  STEP8 = :STEP8,'
      '  STEP9 = :STEP9,'
      '  STEP10 = :STEP10,'
      '  STEP11 = :STEP11,'
      '  STEP12 = :STEP12,'
      '  STEP13 = :STEP13,'
      '  STEP14 = :STEP14,'
      '  STEP15 = :STEP15,'
      '  STEP16 = :STEP16,'
      '  STEP17 = :STEP17,'
      '  STEP18 = :STEP18,'
      '  STEP19 = :STEP19,'
      '  STEP20 = :STEP20'
      'where'
      '  IDFAIXASALARIAL = :OLD_IDFAIXASALARIAL')
    InsertSQL.Strings = (
      'insert into FAIXASAL'
      
        '  (IDFAIXASALARIAL, STEP1, DATAEFETIV, STEP2, STEP3, STEP4, STEP' +
        '5, '
      
        'STEP6, STEP7, STEP8, STEP9, STEP10, STEP11, STEP12, STEP13, STEP' +
        '14,'
      'STEP15, STEP16, STEP17, STEP18, STEP19, STEP20)'
      'values'
      
        '  (:IDFAIXASALARIAL, :STEP1, :DATAEFETIV, :STEP2, :STEP3, :STEP4' +
        ', :STEP5, '
      
        '   :STEP6, :STEP7, :STEP8, :STEP9, :STEP10, :STEP11, :STEP12, :S' +
        'TEP13, '
      
        '   :STEP14, :STEP15, :STEP16, :STEP17, :STEP18, :STEP19, :STEP20' +
        ')')
    DeleteSQL.Strings = (
      'delete from FAIXASAL'
      'where'
      '  IDFAIXASALARIAL = :OLD_IDFAIXASALARIAL')
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 105
    Top = 358
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 404
    Top = 6
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'Select * from FAIXASAL order by IDFAIXASALARIAL')
    Top = 2
    object qryIDFAIXASALARIAL: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDFAIXASALARIAL'
      Origin = 'FAIXASAL.IDFAIXASALARIAL'
    end
    object qryDATAEFETIV: TDateTimeField
      DisplayLabel = 'Data Efetivação'
      DisplayWidth = 10
      FieldName = 'DATAEFETIV'
      Origin = 'FAIXASAL.DATAEFETIV'
    end
    object qrySTEP1: TFloatField
      DisplayLabel = 'STEP 1'
      DisplayWidth = 10
      FieldName = 'STEP1'
      Origin = 'FAIXASAL.STEP1'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qrySTEP2: TFloatField
      DisplayLabel = 'STEP 2'
      DisplayWidth = 10
      FieldName = 'STEP2'
      Origin = 'FAIXASAL.STEP2'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qrySTEP3: TFloatField
      DisplayLabel = 'STEP 3'
      DisplayWidth = 10
      FieldName = 'STEP3'
      Origin = 'FAIXASAL.STEP3'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qrySTEP4: TFloatField
      DisplayLabel = 'STEP 4'
      DisplayWidth = 10
      FieldName = 'STEP4'
      Origin = 'FAIXASAL.STEP4'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qrySTEP5: TFloatField
      DisplayLabel = 'STEP 5'
      DisplayWidth = 10
      FieldName = 'STEP5'
      Origin = 'FAIXASAL.STEP5'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qrySTEP6: TFloatField
      DisplayLabel = 'STEP 6'
      DisplayWidth = 10
      FieldName = 'STEP6'
      Origin = 'FAIXASAL.STEP6'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qrySTEP7: TFloatField
      DisplayLabel = 'STEP 7'
      DisplayWidth = 10
      FieldName = 'STEP7'
      Origin = 'FAIXASAL.STEP7'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qrySTEP8: TFloatField
      DisplayLabel = 'STEP 8'
      DisplayWidth = 10
      FieldName = 'STEP8'
      Origin = 'FAIXASAL.STEP8'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object qrySTEP9: TFloatField
      DisplayLabel = 'STEP 9'
      DisplayWidth = 10
      FieldName = 'STEP9'
      Origin = 'FAIXASAL.STEP9'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
  end
  object qryParamRH: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NUMSTEPS, TITSTEP1, TITSTEP2, TITSTEP3, TITSTEP4, TITSTEP5,'
      '  TITSTEP6, TITSTEP7, TITSTEP8, TITSTEP9, TITSTEP10, TITSTEP11,'
      '  TITSTEP12, TITSTEP13, TITSTEP14, TITSTEP15, TITSTEP16, '
      '  TITSTEP17, TITSTEP18, TITSTEP19, TITSTEP20'
      'FROM'
      '  PARAMRH')
    ValidateWithMask = True
    Left = 455
    Top = 2
  end
  object dsHistFaixa: TwwDataSource
    DataSet = qryHistFaixa
    Left = 510
    Top = 4
  end
  object qryHistFaixa: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT DATAEFETIVACAO, '
      '              MOD(IDNIVEL,100)  AS  IDFAIXASALEXT, '
      '              VALOR'
      'FROM FAIXANIVEL'
      'WHERE IDNIVEL BETWEEN :IDFAIXASALARIAL * 100 + 1 '
      '                  AND :IDFAIXASALARIAL * 100 + 9'
      'ORDER BY DATAEFETIVACAO DESC, IDNIVEL')
    PictureMasks.Strings = (
      'VALOR'#9'###,###,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 526
    Top = 9
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDFAIXASALARIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDFAIXASALARIAL'
        ParamType = ptUnknown
      end>
    object qryHistFaixaDATAEFETIVACAO: TDateTimeField
      FieldName = 'DATAEFETIVACAO'
      Origin = 'BASEDADOS.FAIXANIVEL.DATAEFETIVACAO'
    end
    object qryHistFaixaIDFAIXASALEXT: TFloatField
      FieldName = 'IDFAIXASALEXT'
      Origin = 'BASEDADOS.FAIXANIVEL.IDFAIXASALEXT'
    end
    object qryHistFaixaVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'BASEDADOS.FAIXANIVEL.VALOR'
      DisplayFormat = '###,###,##0.00'
    end
  end
end
