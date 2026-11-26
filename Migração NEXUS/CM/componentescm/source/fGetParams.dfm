object FrmGetParams: TFrmGetParams
  Left = 323
  Top = 179
  BorderStyle = bsDialog
  Caption = 'Digite o valor e o tipo dos parâmetros'
  ClientHeight = 321
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PnlBotton: TPanel
    Left = 0
    Top = 294
    Width = 393
    Height = 27
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BtnOk: TBitBtn
      Left = 241
      Top = 2
      Width = 75
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 318
      Top = 2
      Width = 75
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object wwDBGrid1: TwwDBGrid
    Left = 0
    Top = 0
    Width = 393
    Height = 294
    ControlType.Strings = (
      'NULO;CheckBox;S;N'
      'TIPOPARAM;CustomEdit;CmbTipoDado')
    Selected.Strings = (
      'NOMEPARAM'#9'22'#9'Parâmetro'#9'F'
      'TIPOPARAM'#9'10'#9'Tipo'
      'VALORPARAM'#9'18'#9'Valor'
      'NULO'#9'7'#9'é nulo ?')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 1
    ShowHorzScrollBar = True
    Align = alClient
    DataSource = Ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyOptions = []
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ParentFont = False
    TabOrder = 1
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    TitleLines = 1
    TitleButtons = False
    IndicatorColor = icBlack
  end
  object CmbTipoDado: TwwDBComboBox
    Left = 200
    Top = 104
    Width = 121
    Height = 21
    ShowButton = True
    Style = csDropDown
    MapList = True
    AllowClearKey = False
    DataField = 'TIPOPARAM'
    DataSource = Ds
    DropDownCount = 8
    ItemHeight = 0
    Items.Strings = (
      'String'#9'0'
      'Float'#9'1'
      'Integer'#9'2'
      'Date'#9'3'
      'DateTime'#9'4'
      'Time'#9'5')
    Sorted = False
    TabOrder = 2
    UnboundDataType = wwDefault
  end
  object Cds: TClientDataSet
    Aggregates = <>
    FileName = 'C:\ProjetosCM5\Cm\Packages\DadosCmParams.cds'
    Params = <>
    Left = 152
    Top = 192
    object CdsNOMEPARAM: TStringField
      DisplayLabel = 'Parâmetro'
      DisplayWidth = 22
      FieldName = 'NOMEPARAM'
      FixedChar = True
      Size = 56
    end
    object CdsTIPOPARAM: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 10
      FieldName = 'TIPOPARAM'
      FixedChar = True
      Size = 40
    end
    object CdsVALORPARAM: TStringField
      DisplayLabel = 'Valor'
      DisplayWidth = 18
      FieldName = 'VALORPARAM'
      FixedChar = True
      Size = 56
    end
    object CdsNULO: TStringField
      DisplayLabel = 'é nulo ?'
      DisplayWidth = 7
      FieldName = 'NULO'
      FixedChar = True
      Size = 1
    end
  end
  object Ds: TwwDataSource
    DataSet = Cds
    Left = 152
    Top = 248
  end
end
