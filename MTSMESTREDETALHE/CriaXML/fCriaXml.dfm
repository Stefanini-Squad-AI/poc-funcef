object FrmCriaXml: TFrmCriaXml
  Left = 67
  Top = 37
  Width = 693
  Height = 537
  Caption = 'FrmCriaXml'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 5
    Width = 328
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'XML Mestre'
    Color = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 344
    Top = 5
    Width = 328
    Height = 13
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'XML Detalhe'
    Color = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 177
    Top = 371
    Width = 496
    Height = 13
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Dados Detalhe'
    Color = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 177
    Top = 235
    Width = 496
    Height = 13
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Dados Mestre'
    Color = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object MemMestre: TMemo
    Left = 8
    Top = 18
    Width = 329
    Height = 207
    Lines.Strings = (
      '<?xml version="1.0" standalone="yes"?>  '
      '<DATAPACKET Version="2.0">'
      '<METADATA>'
      '<FIELDS>'
      '<FIELD attrname="IDTBLMESTRE" fieldtype="r8" required="true"/>'
      '<FIELD attrname="DESCTBLMESTRE" fieldtype="string" WIDTH="60"/>'
      '<FIELD attrname="VLRLIMITE" fieldtype="r8"/>'
      '</FIELDS>'
      
        '<PARAMS CHANGE_LOG="1 0 4" DEFAULT_ORDER="1" PRIMARY_KEY="1" LCI' +
        'D="2057"/>'
      '</METADATA>'
      '<ROWDATA>'
      
        '<ROW RowState="4" IDTBLMESTRE="1" DESCTBLMESTRE="Registro Mestre' +
        ' 1" VLRLIMITE="100.25" />'
      '</ROWDATA>'
      '</DATAPACKET>')
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object MemDetalhe: TMemo
    Left = 344
    Top = 16
    Width = 329
    Height = 209
    Anchors = [akLeft, akTop, akRight]
    Lines.Strings = (
      '<?xml version="1.0" standalone="yes"?>  '
      '<DATAPACKET Version="2.0">'
      '<METADATA>'
      '<FIELDS>'
      '<FIELD attrname="IDTBLDETALHE" fieldtype="r8" required="true"/>'
      '<FIELD attrname="IDTBLMESTRE" fieldtype="r8"/>'
      '<FIELD attrname="DESCTBLDETALHE" fieldtype="string" WIDTH="60"/>'
      '<FIELD attrname="VLRDETALHE" fieldtype="r8"/>'
      '</FIELDS>'
      
        '<PARAMS CHANGE_LOG="1 0 4 2 0 4 3 0 4 4 0 4 5 0 4" DEFAULT_ORDER' +
        '="1" PRIMARY_KEY="1" LCID="2057"/>'
      '</METADATA>'
      '<ROWDATA>'
      
        '<ROW RowState="4" IDTBLDETALHE="1" IDTBLMESTRE="1" DESCTBLDETALH' +
        'E="Registro Detalhe 1" VLRDETALHE="100.25"/>'
      
        '<ROW RowState="4" IDTBLDETALHE="2" IDTBLMESTRE="1" DESCTBLDETALH' +
        'E="Registro Detalhe 2" VLRDETALHE="500.25"/>'
      
        '<ROW RowState="4" IDTBLDETALHE="3" IDTBLMESTRE="1" DESCTBLDETALH' +
        'E="Registro Detalhe 3" VLRDETALHE="175.25"/>'
      
        '<ROW RowState="4" IDTBLDETALHE="4" IDTBLMESTRE="1" DESCTBLDETALH' +
        'E="Registro Detalhe 4" VLRDETALHE="99.25"/>'
      
        '<ROW RowState="4" IDTBLDETALHE="5" IDTBLMESTRE="1" DESCTBLDETALH' +
        'E="Registro Detalhe 4" VLRDETALHE="199.25"/>'
      '</ROWDATA>'
      '</DATAPACKET>')
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object BtnInsere: TButton
    Left = 8
    Top = 240
    Width = 145
    Height = 25
    Caption = 'Processar'
    TabOrder = 2
    OnClick = BtnInsereClick
  end
  object BtnExcluir: TButton
    Left = 8
    Top = 272
    Width = 145
    Height = 25
    Caption = 'Excluir'
    TabOrder = 3
    OnClick = BtnExcluirClick
  end
  object BtnBusca: TButton
    Left = 8
    Top = 304
    Width = 145
    Height = 25
    Caption = 'Buscar'
    TabOrder = 4
    OnClick = BtnBuscaClick
  end
  object GrdMestre: TDBGrid
    Left = 176
    Top = 248
    Width = 497
    Height = 121
    Anchors = [akLeft, akTop, akRight]
    DataSource = DsMestre
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object GrdDetalhe: TDBGrid
    Left = 176
    Top = 384
    Width = 497
    Height = 121
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DsDetalhe
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object BtnProcessarGrids: TButton
    Left = 8
    Top = 336
    Width = 145
    Height = 25
    Caption = 'Processar Grids'
    Enabled = False
    TabOrder = 7
    OnClick = BtnProcessarGridsClick
  end
  object DsMestre: TDataSource
    DataSet = CdsMestre
    Left = 40
    Top = 424
  end
  object CdsMestre: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 376
  end
  object CdsDetalhe: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 376
  end
  object DsDetalhe: TDataSource
    DataSet = CdsDetalhe
    Left = 88
    Top = 424
  end
end
