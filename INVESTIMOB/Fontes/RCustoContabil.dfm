inherited frmRelCustoContabil: TfrmRelCustoContabil
  Left = 25
  Top = 144
  HelpContext = 540055
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Saldo Contábil por Imóvel'
  ClientHeight = 365
  ClientWidth = 730
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 730
    Height = 332
    object Label15: TLabel
      Left = 600
      Top = 10
      Width = 112
      Height = 13
      Caption = 'Data de Referência'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 504
      Top = 300
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 10
      Width = 38
      Height = 13
      Caption = 'Imóvel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 16
      Top = 72
      Width = 554
      Height = 3
      Shape = bsTopLine
    end
    object lblSimula: TLabel
      Left = 18
      Top = 297
      Width = 276
      Height = 20
      Caption = 'Valores atualizados até a data de '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object btnBuscaImovel: TBitBtn
      Left = 560
      Top = 24
      Width = 24
      Height = 22
      TabOrder = 0
      OnClick = btnBuscaImovelClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
    end
    object btnCalculaSaldo: TBitBtn
      Left = 584
      Top = 60
      Width = 129
      Height = 27
      Caption = 'Custo Contábil'
      TabOrder = 1
      OnClick = btnCalculaSaldoClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777777777777777777700000000000000766444444444444406E6666666666
        66406E60F0F0F067F0406E666666666666406E60F0F0F0F0F0406E6666666666
        66406E077777776666406E0FFFFFF76666406E000000006666406EEEEEEEEEEE
        EE60766666666666666777777777777777777777777777777777}
      Margin = 10
      Spacing = 6
    end
    object edtImovel: TEdit
      Left = 16
      Top = 24
      Width = 545
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object edtData: TCMDateTimePicker
      Left = 600
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
      TabOrder = 3
      OnExit = edtDataExit
    end
    object DBGrd: TwwDBGrid
      Left = 16
      Top = 96
      Width = 697
      Height = 185
      Selected.Strings = (
        'DESBEM'#9'77'#9'Descrição do Bem'#9'T'
        'VLR_BEM'#9'16'#9'Valor'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsImovelxBem
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 5
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      OnCalcCellColors = DBGrdCalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = DBGrdTopRowChanged
    end
    object edtCustoTotal: TRealEdit
      Left = 544
      Top = 296
      Width = 153
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = 12648447
      Lines.Strings = (
        '      0,00')
      ReadOnly = True
      TabOrder = 4
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
  end
  inherited Dock971: TDock97
    Top = 332
    Width = 730
    inherited tb97Fundo: TToolbar97
      Left = 494
      DockPos = 494
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65499
    Top = 65499
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object dsImovelxBem: TwwDataSource
    AutoEdit = False
    DataSet = qryImovelXBem
    Left = 477
    Top = 16
  end
  object qryImovelXBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBEM,'
      '       B.DESBEM,'
      '       0 AS VLR_BEM'
      '  FROM BEM B,'
      '       IMOVELXBEM IXB'
      ' WHERE B.IDBEM = IXB.IDBEM'
      '   AND IXB.IDIMOVEL = :PIDIMOVEL')
    UpdateObject = updImovelXBem
    ValidateWithMask = True
    Left = 480
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptInput
      end>
    object qryImovelXBemIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryImovelXBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryImovelXBemVLR_BEM: TFloatField
      FieldName = 'VLR_BEM'
      DisplayFormat = '###,##0.00'
    end
  end
  object updImovelXBem: TUpdateSQL
    Left = 480
    Top = 120
  end
end
