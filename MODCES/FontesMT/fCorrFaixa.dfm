inherited frmCorrFaixa: TfrmCorrFaixa
  Left = 458
  Top = 205
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Correção das Faixas Salariais'
  ClientHeight = 264
  ClientWidth = 448
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 448
    Height = 225
    BorderWidth = 2
  end
  inherited Dock971: TDock97
    Top = 225
    Width = 448
    inherited tb97Fundo: TToolbar97
      Left = 197
      DockPos = 240
      inherited sep1: TToolbarSep97
        Left = 164
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnSair: TBitBtn
        Left = 83
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 166
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        HelpContext = 740019
        Caption = '&OK'
        Default = True
        TabOrder = 2
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
    end
  end
  object Notebook1: TNotebook [2]
    Left = 0
    Top = 0
    Width = 441
    Height = 225
    TabOrder = 2
    object TPage
      Left = 0
      Top = 0
      Caption = 'Select Grid'
      object LabelFaixaSalarial: TLabel
        Left = 96
        Top = 8
        Width = 113
        Height = 16
        Caption = 'Faixas Salariais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBGrid1: TwwDBGrid
        Left = 8
        Top = 25
        Width = 338
        Height = 193
        ControlType.Strings = (
          'SELECTED;CheckBox;1;0')
        Selected.Strings = (
          'SELECTED'#9'3'#9' '#9'F'
          'CODIGO'#9'6'#9'Código'
          'FaixaPCS'#9'10'#9'Faixa Salarial PCS'
          'NIVEL1'#9'7'#9'Nível 1'
          'NIVEL2'#9'7'#9'Nível 2'
          'NIVEL3'#9'7'#9'Nível 3'
          'NIVEL4'#9'7'#9'Nível 4'
          'NIVEL5'#9'7'#9'Nível 5'
          'NIVEL6'#9'7'#9'Nível 6'
          'NIVEL7'#9'7'#9'Nível 7'
          'NIVEL8'#9'7'#9'Nível 8'
          'NIVEL9'#9'7'#9'Nível 9'
          'NIVEL10'#9'7'#9'Nível 10'
          'NIVEL11'#9'7'#9'Nível 11'
          'NIVEL12'#9'7'#9'Nível 12'
          'NIVEL13'#9'7'#9'Nível 13'
          'NIVEL14'#9'7'#9'Nível 14'
          'NIVEL15'#9'7'#9'Nível 15'
          'NIVEL16'#9'7'#9'Nível 16'
          'NIVEL17'#9'7'#9'Nível 17'
          'NIVEL18'#9'7'#9'Nível 18'
          'NIVEL19'#9'7'#9'Nível 19'
          'NIVEL20'#9'7'#9'Nível 20')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
        DataSource = DSGrid
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        OnDrawDataCell = DBGrid1DrawDataCell
        IndicatorColor = icBlack
        OnFieldChanged = DBGrid1FieldChanged
        object DBGrid1IButton: TwwIButton
          Left = 0
          Top = 0
          Width = 13
          Height = 22
          AllowAllUp = True
        end
      end
      object btnContinuar: TfcShapeBtn
        Left = 348
        Top = 188
        Width = 88
        Height = 30
        Caption = 'Continuar'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
          88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
          B08887F88888888887F887FBBBBB0BBBB088878888887F88878F7FBBBBBB00BB
          BB087F88FFFF77F8887F7FB00000000BBB087F877777777F887F7FB000000000
          BB087F8777777777887F7FB00000000BBB087F8777777778887F7FBBBBBB00BB
          BB0878F888887788887887FBBBBB0BBBB08887F88888788887F887FBBBBBBBBB
          B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
          8888888778FFFF77888888888777778888888888877777888888}
        Layout = blGlyphRight
        NumGlyphs = 2
        Options = [boFocusable, boFocusRect]
        Offsets.GlyphY = 1
        Offsets.TextDownX = 2
        Offsets.TextDownY = 2
        ParentClipping = True
        ParentFont = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        TabOrder = 1
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.ExtrudeEffects.Depth = 4
        TextOptions.ExtrudeEffects.Orientation = fcTopRight
        TextOptions.VAlignment = vaVCenter
        OnClick = btnContinuarClick
      end
      object CheckBox1: TCheckBox
        Left = 28
        Top = 30
        Width = 16
        Height = 17
        TabOrder = 2
        OnClick = CheckBox1Click
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Correção de Faixas'
      object lblMsg: TLabel
        Left = 14
        Top = 171
        Width = 406
        Height = 13
        AutoSize = False
        Caption = 'lblMsg'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object gbxCondicoes: TGroupBox
        Left = 14
        Top = 8
        Width = 202
        Height = 108
        Caption = 'Condições'
        TabOrder = 0
        object Label2: TLabel
          Left = 6
          Top = 21
          Width = 77
          Height = 13
          Caption = 'Data Efetivação'
        end
        object Label3: TLabel
          Left = 6
          Top = 51
          Width = 69
          Height = 13
          Caption = '% de Correção'
        end
        object Label1: TLabel
          Left = 6
          Top = 81
          Width = 66
          Height = 13
          Caption = 'Valor a Somar'
        end
        object edData: TCMDateTimePicker
          Left = 111
          Top = 18
          Width = 82
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
          OnChange = edDataChange
        end
        object ednPerc: TRealEdit
          Left = 111
          Top = 48
          Width = 82
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          TabOrder = 1
          WordWrap = False
          IntDigits = 3
          DecDigits = 4
          NumberFormat = fNumber
          Signal = False
        end
        object ednParcela: TRealEdit
          Left = 111
          Top = 78
          Width = 82
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          TabOrder = 2
          WordWrap = False
          IntDigits = 9
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
      object rgTipoArre: TRadioGroup
        Left = 225
        Top = 8
        Width = 196
        Height = 108
        Caption = 'Arredondamento'
        ItemIndex = 0
        Items.Strings = (
          'Nenhum'
          'Próxima Dezena de Centavo'
          'Próxima Unidade'
          'Próxima Dezena'
          'Próxima Centena')
        TabOrder = 1
      end
      object gbxTipoEv: TGroupBox
        Left = 14
        Top = 120
        Width = 202
        Height = 45
        Caption = 'Tipo de Evento'
        TabOrder = 2
        object dblcTipoEv: TwwDBLookupCombo
          Left = 7
          Top = 15
          Width = 188
          Height = 21
          Hint = 'Necessário para Alteração Também dos Salários'
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'DESCRICAO')
          DataField = 'IDMOTIVO'
          LookupTable = CdsTipoEv
          LookupField = 'IDMOTIVO'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
          AllowClearKey = True
        end
      end
      object rgAtualizaSalFunc: TRadioGroup
        Left = 225
        Top = 120
        Width = 196
        Height = 45
        Caption = 'Atualiza os Salários dos Empregados?'
        Columns = 2
        ItemIndex = 1
        Items.Strings = (
          'Sim'
          'Não')
        TabOrder = 3
      end
      object prgbProgresso: TProgressBar
        Left = 14
        Top = 188
        Width = 406
        Height = 20
        Min = 0
        Max = 100
        Step = 1
        TabOrder = 4
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 83
    Top = 214
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        ''
        'Filter'
        0))
  end
  object CdsTipoEv: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 20
    Top = 214
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = wwQuery1
    Constraints = True
    Left = 408
    Top = 48
  end
  object wwQuery1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  /*+ OPTIMIZER_MODE RULE */'
      ''
      ' 0 AS SELECTED,'
      
        '     IDFAIXASALARIAL AS "Código", 1 as "Faixa Salarial PCS", STE' +
        'P1 as "Nível 1",'
      
        '     STEP2 as "Nível 2", STEP3 as "Nível 3", STEP4 as "Nível 4",' +
        ' STEP5 as "Nível 5",  '
      
        '     STEP6 as "Nível 6", STEP7 as "Nível 7", STEP9 as "Nível 9" ' +
        ', STEP10 as "Nível 10",'
      
        '     STEP9 as "Nível 9", STEP10 as "Nível 10", STEP11 as "Nível ' +
        '11", STEP12 as "Nível 12", '
      
        '     STEP13 as "Nível 13", STEP14 as "Nível 14", STEP15 as "Níve' +
        'l 15",STEP16 as "Nível 16",'
      
        '    STEP17 as "Nível 17", STEP18 as "Nível 18",STEP19 as "Nível ' +
        '19",STEP20 as "Nível 20"'
      '   '
      '    FROM '
      '      FAIXASAL')
    ControlType.Strings = (
      'SELECTED;CheckBox;1;0')
    ValidateWithMask = True
    Left = 408
  end
  object CdsGrid: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'SELECTED'
        DataType = ftFloat
      end
      item
        Name = 'Código'
        DataType = ftFloat
      end
      item
        Name = 'Faixa Salarial PCS'
        DataType = ftFloat
      end
      item
        Name = 'Nível 1'
        DataType = ftFloat
      end
      item
        Name = 'Nível 2'
        DataType = ftFloat
      end
      item
        Name = 'Nível 3'
        DataType = ftFloat
      end
      item
        Name = 'Nível 4'
        DataType = ftFloat
      end
      item
        Name = 'Nível 5'
        DataType = ftFloat
      end
      item
        Name = 'Nível 6'
        DataType = ftFloat
      end
      item
        Name = 'Nível 7'
        DataType = ftFloat
      end
      item
        Name = 'Nível 9'
        DataType = ftFloat
      end
      item
        Name = 'Nível 10'
        DataType = ftFloat
      end
      item
        Name = 'Nível 9_1'
        DataType = ftFloat
      end
      item
        Name = 'Nível 10_1'
        DataType = ftFloat
      end
      item
        Name = 'Nível 11'
        DataType = ftFloat
      end
      item
        Name = 'Nível 12'
        DataType = ftFloat
      end
      item
        Name = 'Nível 13'
        DataType = ftFloat
      end
      item
        Name = 'Nível 14'
        DataType = ftFloat
      end
      item
        Name = 'Nível 15'
        DataType = ftFloat
      end
      item
        Name = 'Nível 16'
        DataType = ftFloat
      end
      item
        Name = 'Nível 17'
        DataType = ftFloat
      end
      item
        Name = 'Nível 18'
        DataType = ftFloat
      end
      item
        Name = 'Nível 19'
        DataType = ftFloat
      end
      item
        Name = 'Nível 20'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterOpen = CdsGridAfterOpen
    Left = 396
    Top = 118
  end
  object DSGrid: TwwDataSource
    DataSet = CdsGrid
    Left = 352
    Top = 16
  end
end
