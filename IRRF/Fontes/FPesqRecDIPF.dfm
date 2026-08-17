object frPesqRecDIPJ: TfrPesqRecDIPJ
  Left = 243
  Top = 183
  Width = 390
  Height = 356
  Caption = 'Pesquisa de Recibos da DIPJ'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgPesqRec: TwwDBGrid
    Left = 0
    Top = 99
    Width = 382
    Height = 230
    PictureMasks.Strings = (
      'VLRTRANSPORTE'#9'##,##0.00'#9'T'#9'T'
      'VLREMBARQUE'#9'##,##0.00'#9'T'#9'T'
      'VLRDESEMBARQUE'#9'##,##0.00'#9'T'#9'T')
    Selected.Strings = (
      'NUMERORECIBO'#9'20'#9'N. Recibo'#9'F'
      'DATARECIBO'#9'18'#9'Data'#9'F'
      'RETIFICADOR'#9'14'#9'Retificador'#9'F')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    Color = clWhite
    DataSource = dsPesqRec
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap, dgPerfectRowFit, dgFooter3DCells]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    TitleLines = 1
    TitleButtons = True
    UseTFields = False
    OnDblClick = dbgPesqRecDblClick
    IndicatorColor = icBlack
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 382
    Height = 99
    Align = alTop
    TabOrder = 1
    object Label7: TLabel
      Left = 14
      Top = 19
      Width = 48
      Height = 13
      Caption = 'N. Recibo'
    end
    object Label1: TLabel
      Left = 163
      Top = 19
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object edData: TEdit
      Left = 163
      Top = 36
      Width = 104
      Height = 21
      MaxLength = 4
      TabOrder = 0
    end
    object edNroRecibo: TMaskEdit
      Left = 14
      Top = 36
      Width = 121
      Height = 21
      EditMask = '00\.00\.00\.00\.00\-00;0;_'
      MaxLength = 17
      TabOrder = 1
    end
  end
  object CMSqlPesqRec: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      
        '  IDRECIBO, IDRECIBORET, NUMERORECIBO, DATARECIBO, RETIFICADOR, ' +
        'EXERCICIO'
      'FROM '
      ' RECIBOS_DIPJ ')
    ClientDataSet = cdsPesqRec
    Left = 160
    Top = 182
  end
  object dsPesqRec: TwwDataSource
    AutoEdit = False
    DataSet = cdsPesqRec
    Left = 62
    Top = 188
  end
  object cdsPesqRec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsPesqRecAfterScroll
    Left = 254
    Top = 182
    object cdsPesqRecIDRECIBO: TFloatField
      FieldName = 'IDRECIBO'
    end
    object cdsPesqRecIDRECIBORET: TFloatField
      FieldName = 'IDRECIBORET'
    end
    object cdsPesqRecNUMERORECIBO: TStringField
      FieldName = 'NUMERORECIBO'
      EditMask = '00\.00\.00\.00\.00\-00;0;_'
    end
    object cdsPesqRecDATARECIBO: TDateTimeField
      FieldName = 'DATARECIBO'
    end
    object cdsPesqRecRETIFICADOR: TStringField
      FieldName = 'RETIFICADOR'
      Size = 1
    end
    object cdsPesqRecEXERCICIO: TStringField
      FieldName = 'EXERCICIO'
      Size = 4
    end
  end
end
