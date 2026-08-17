inherited FrmConciliaCustodia: TFrmConciliaCustodia
  Left = -4
  Top = -4
  Caption = 'Conciliação da Custódia'
  ClientHeight = 553
  ClientWidth = 800
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 800
    Height = 514
    object dbgConsulta: TwwDBGrid
      Left = 1
      Top = 101
      Width = 798
      Height = 384
      Selected.Strings = (
        'STATUS'#9'9'#9'Divergente'
        'DESCINVESTIMENTO'#9'23'#9'Ação'#9'F'
        'CODISIN'#9'15'#9'Código ISIN'
        'QTDE'#9'17'#9'Quantidade~ Atual'
        'QTDTITULOS'#9'17'#9'Quantidade~ de Conciliação'
        'QTDEDIVERGENTE'#9'17'#9'Quantidade~ de Divergência'
        'OBSERVACAO'#9'70'#9'Observação')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 3
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      Align = alClient
      Color = clWhite
      DataSource = DtmRelatorio.DsConciliacaoCustodia
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyOptions = []
      Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clMaroon
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      IndicatorColor = icYellow
    end
    object pnlConsulta: TPanel
      Left = 1
      Top = 1
      Width = 798
      Height = 75
      Align = alTop
      TabOrder = 0
      object Label3: TLabel
        Left = 16
        Top = 8
        Width = 116
        Height = 13
        Caption = 'Data da Conciliação'
      end
      object Label2: TLabel
        Left = 152
        Top = 8
        Width = 45
        Height = 13
        Caption = 'Carteira'
      end
      object edData: TCMDateTimePicker
        Left = 16
        Top = 24
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
      end
      object rgMostra: TRadioGroup
        Left = 476
        Top = 8
        Width = 185
        Height = 62
        Caption = 'Consulta'
        ItemIndex = 1
        Items.Strings = (
          'Divergentes'
          'Todos')
        TabOrder = 1
        OnClick = rgMostraClick
      end
      object dblConsCarteira: TwwDBLookupCombo
        Left = 152
        Top = 24
        Width = 299
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'60'#9'Carteira')
        LookupTable = qryConsCarteira
        LookupField = 'IDCARTEIRAINVEST'
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblConsCarteiraExit
      end
    end
    object pnlTotal: TPanel
      Left = 1
      Top = 485
      Width = 798
      Height = 28
      Align = alBottom
      Enabled = False
      TabOrder = 2
      object Label1: TLabel
        Left = 12
        Top = 9
        Width = 41
        Height = 13
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbQtd: TDBRealEdit
        Left = 358
        Top = 3
        Width = 123
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
          '5.860.349.001')
        ParentFont = False
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
        DataField = 'TOTALQTDE'
        DataSource = DtmRelatorio.DsConciliacaoCustodia
      end
      object dbQtdConciiacao: TDBRealEdit
        Left = 481
        Top = 3
        Width = 124
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
          '6.559.629.394')
        ParentFont = False
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
        DataField = 'TOTALQTDTITULOS'
        DataSource = DtmRelatorio.DsConciliacaoCustodia
      end
      object dbQtdDivergencia: TDBRealEdit
        Left = 605
        Top = 3
        Width = 125
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
          '699.280.393')
        ParentFont = False
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
        DataField = 'TOTALQTDEDIVERGENTE'
        DataSource = DtmRelatorio.DsConciliacaoCustodia
      end
    end
    object Panel11: TPanel
      Left = 1
      Top = 76
      Width = 798
      Height = 25
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Conciliação de Custódia'
      Color = clNavy
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
  end
  inherited Dock971: TDock97
    Top = 514
    Width = 800
    inherited tb97Fundo: TToolbar97
      Left = 520
      DockPos = 520
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 242
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
        Kind = bkOK
      end
      inherited bbtnCancelar: TBitBtn
        Left = 161
        TabOrder = 2
        OnClick = bbtnCancelarClick
      end
      object bt_Imprime: TBitBtn
        Left = 245
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 3
        OnClick = bt_ImprimeClick
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
      object bbtnGravar: TBitBtn
        Left = 81
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Gravar'
        Default = True
        ModalResult = 1
        TabOrder = 1
        OnClick = bbtnGravarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 731
    Top = 11
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object QryUpdConcilaCustodia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE CONCILIACUSTODIA SET OBSERVACAO = :OBSERVACAO'
      'WHERE'
      'IDCONCILIACUSTODIA   = :IDCONCILIACUSTODIA')
    ValidateWithMask = True
    Left = 478
    Top = 31
    ParamData = <
      item
        DataType = ftString
        Name = 'OBSERVACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCONCILIACUSTODIA'
        ParamType = ptUnknown
      end>
  end
  object qryConsCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCARTEIRAINVEST,'
      '   DESCCARTINVEST'
      'FROM'
      '   CARTEIRAINVEST      '
      'WHERE'
      '    IDTIPOINVEST = 2')
    ValidateWithMask = True
    Left = 309
    Top = 13
    object qryConsCarteiraDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Origin = 'CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryConsCarteiraIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
  end
  object dtsConsCarteira: TwwDataSource
    DataSet = qryConsCarteira
    Left = 208
    Top = 8
  end
end
