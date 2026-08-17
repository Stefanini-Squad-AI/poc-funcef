inherited FrmViewRestricao: TFrmViewRestricao
  Left = 297
  Top = 242
  Caption = 'Visualização de Restrição'
  ClientHeight = 346
  ClientWidth = 603
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 603
    Height = 307
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 65
      Height = 13
      Caption = 'Fornecedor'
    end
    object plnf: TPanel
      Left = 5
      Top = 63
      Width = 593
      Height = 239
      Align = alBottom
      TabOrder = 0
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 591
        Height = 31
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Restrições'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Grd: TwwDBGrid
        Left = 1
        Top = 32
        Width = 344
        Height = 206
        Selected.Strings = (
          'DATAINI'#9'10'#9'Data~Inicio'
          'DATAFIM'#9'10'#9'Data~Término'
          'FLEXIVEL'#9'3'#9'Flexível'
          'CODARTIGO'#9'14'#9'Código'
          'DESCRICAO'#9'35'#9'Descrição')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alLeft
        DataSource = ds
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel2: TPanel
        Left = 345
        Top = 32
        Width = 247
        Height = 206
        Align = alClient
        Caption = 'Panel2'
        TabOrder = 2
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 245
          Height = 31
          Align = alTop
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Caption = 'Motivo'
          TabOrder = 0
        end
        object memMotivo: TDBMemo
          Left = 1
          Top = 32
          Width = 245
          Height = 173
          Align = alClient
          DataField = 'MOTIVO'
          DataSource = ds
          TabOrder = 1
        end
      end
    end
    object edForn: TEdit
      Left = 16
      Top = 32
      Width = 569
      Height = 21
      TabStop = False
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = 'Airton Senna'
    end
  end
  inherited Dock971: TDock97
    Top = 307
    Width = 603
    inherited tb97Fundo: TToolbar97
      Left = 437
      DockPos = 437
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 795
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      R.CODARTIGO,'
      
        '      (P.DESCPROD || '#39' '#39' || A.CODCOR || '#39' '#39' || A.CODTAMANHO ) AS' +
        ' DESCRICAO,'
      '      R.DATAINI,'
      '      R.DATAFIM,'
      '      R.FLGFLEXIVEL,'
      '      DECODE(R.FLGFLEXIVEL,'#39'S'#39','#39'SIM'#39','#39'NÃO'#39') AS FLEXIVEL,'
      '      R.MOTIVO'
      'FROM'
      '     RESTRICAO R,'
      '     ARTIGO A,'
      '     PRODUTO P'
      'WHERE'
      '      (R.IDFORCLI = :pIDFORCLI)'
      '  AND (R.IDPESSOA = :pIDPESS)'
      '  AND (R.CODARTIGO = A.CODARTIGO(+))'
      '  AND (A.CODPRODUTO = P.CODPRODUTO(+))'
      'ORDER BY DATAFIM'
      '           ')
    ValidateWithMask = True
    Left = 375
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end>
    object qryDATAINI: TDateTimeField
      DisplayLabel = 'Data~Inicio'
      DisplayWidth = 10
      FieldName = 'DATAINI'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryDATAFIM: TDateTimeField
      DisplayLabel = 'Data~Término'
      DisplayWidth = 10
      FieldName = 'DATAFIM'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryFLEXIVEL: TStringField
      DisplayLabel = 'Flexível'
      DisplayWidth = 3
      FieldName = 'FLEXIVEL'
      Size = 3
    end
    object qryCODARTIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 14
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryMOTIVO: TStringField
      DisplayLabel = 'Motivo'
      DisplayWidth = 200
      FieldName = 'MOTIVO'
      Visible = False
      Size = 200
    end
    object qryFLGFLEXIVEL: TStringField
      FieldName = 'FLGFLEXIVEL'
      Visible = False
      Size = 1
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 325
    Top = 296
  end
end
