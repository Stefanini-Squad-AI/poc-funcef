object FrameAgregados: TFrameAgregados
  Left = 0
  Top = 0
  Width = 380
  Height = 237
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  ParentFont = False
  TabOrder = 0
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 380
    Height = 23
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Custos Agregados'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 0
  end
  object grdAgreg: TwwDBGrid
    Left = 0
    Top = 23
    Width = 380
    Height = 156
    Selected.Strings = (
      'DESCCUSTAGREG'#9'21'#9'Descrição'
      'BASE'#9'10'#9'Base'
      'PERCENT'#9'10'#9'Aliquota'
      'VALOR'#9'10'#9'Valor')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    DataSource = dsAgregados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleAlignment = taCenter
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    TitleLines = 2
    TitleButtons = False
    OnExit = grdAgregExit
    IndicatorColor = icBlack
  end
  object plnEdAgreg: TPanel
    Left = 0
    Top = 179
    Width = 380
    Height = 58
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Label25: TLabel
      Left = 13
      Top = 8
      Width = 47
      Height = 13
      Caption = 'Aliquota'
    end
    object Label24: TLabel
      Left = 133
      Top = 8
      Width = 90
      Height = 13
      Caption = 'Base de Cáculo'
    end
    object Label23: TLabel
      Left = 252
      Top = 8
      Width = 30
      Height = 13
      Caption = 'Valor'
    end
    object edAliquota: TDBRealEdit
      Left = 13
      Top = 24
      Width = 105
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 0
      WordWrap = False
      OnExit = edAliquotaExit
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'PERCENT'
      DataSource = dsAgregados
    end
    object edBaseCalc: TDBRealEdit
      Left = 133
      Top = 24
      Width = 108
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 1
      WordWrap = False
      OnExit = edBaseCalcExit
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'BASE'
      DataSource = dsAgregados
    end
    object edValorAgreg: TDBRealEdit
      Left = 252
      Top = 24
      Width = 108
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 2
      WordWrap = False
      OnExit = edValorAgregExit
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'VALOR'
      DataSource = dsAgregados
    end
  end
  object dsAgregados: TwwDataSource
    DataSet = cdsAgregados
    Left = 48
    Top = 96
  end
  object cdsAgregados: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 96
  end
  object sqlImpostoxProd: TCMSqlParams
    SQL.Strings = (
      'SELECT PERCIMPOSTO,PERCBASEIMP'
      'FROM IMPOSTOSXPRODUTOS'
      'WHERE (CODPRODUTO = :sCODPRODUTO)'
      '  AND (CODTIPOCUSTAGREG = :iCODTIPOCUSTAGREG)'
      '  AND (CODESTADO  = :sCODUF)'
      '  AND (IDPAIS     = :iIDPAIS)'
      ' ')
    ClientDataSet = cdsImpostoxProd
    Left = 200
    Top = 96
  end
  object cdsImpostoxProd: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 96
  end
end
