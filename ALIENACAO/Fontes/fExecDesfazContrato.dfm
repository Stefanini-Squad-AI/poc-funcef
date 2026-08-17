inherited frmExecDesfazContrato: TfrmExecDesfazContrato
  Left = 376
  Top = 66
  HelpContext = 1350003
  Caption = 'Desfaz Geração de Contrato'
  ClientHeight = 446
  ClientWidth = 540
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 540
    Height = 407
    inline molProposta1: TmolProposta
      Left = 10
      Top = 16
      inherited Label1: TLabel
        Width = 85
        Caption = 'Nº do Contrato'
      end
      inherited Label2: TLabel
        Width = 103
        Caption = 'Nome do Contrato'
      end
      inherited btnBuscaProp: TBitBtn
        OnClick = molProposta1btnBuscaPropClick
      end
      inherited btnLimpaProp: TBitBtn
        OnClick = molProposta1btnLimpaPropClick
      end
    end
    object Panel5: TPanel
      Left = 17
      Top = 72
      Width = 499
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Imóveis Alienados'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object DBgrdBemOriginal: TwwDBGrid
      Left = 17
      Top = 99
      Width = 498
      Height = 97
      Selected.Strings = (
        'NOMEIMOVEL'#9'123'#9'Nome do Imóvel'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsImovel
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      KeyOptions = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
      ParentFont = False
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'Small Fonts'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      IndicatorColor = icBlack
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 205
      Width = 499
      Height = 189
      Caption = 'Evento Original'
      Enabled = False
      TabOrder = 3
      object Label1: TLabel
        Left = 16
        Top = 18
        Width = 61
        Height = 13
        Caption = 'Cabeçalho'
      end
      object Label6: TLabel
        Left = 376
        Top = 18
        Width = 32
        Height = 13
        Caption = 'Data '
      end
      object Label7: TLabel
        Left = 16
        Top = 59
        Width = 118
        Height = 13
        Caption = 'Descrição detalhada'
      end
      object Label2: TLabel
        Left = 16
        Top = 144
        Width = 121
        Height = 13
        Caption = 'Usuário Responsável'
      end
      object DBmemEvento: TDBMemo
        Left = 16
        Top = 73
        Width = 457
        Height = 65
        DataField = 'EVIDESCRICAO'
        DataSource = dsEventoImovel
        MaxLength = 2000
        TabOrder = 2
      end
      object DBedtCabecalhoEvento: TDBEdit
        Left = 16
        Top = 32
        Width = 345
        Height = 21
        DataField = 'EVICABECALHO'
        DataSource = dsEventoImovel
        TabOrder = 0
      end
      object DBedtUsuario: TDBEdit
        Left = 16
        Top = 158
        Width = 457
        Height = 21
        DataField = 'USUARIO_EXTENSO'
        DataSource = dsEventoImovel
        MaxLength = 60
        TabOrder = 3
      end
      object DBeditData: TDBEdit
        Left = 376
        Top = 32
        Width = 97
        Height = 21
        DataField = 'EVIDATA'
        DataSource = dsEventoImovel
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 407
    Width = 540
    inherited tb97Fundo: TToolbar97
      Left = 368
      DockPos = 425
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 133
      inherited ToolbarSep971: TToolbarSep97
        Left = 228
      end
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 81
        Width = 147
        Caption = '&Desfazer Contrato'
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 43
    Top = 411
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  object qryImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT I.IDIMOVEL,'
      '       IM.IMONOME || '#39' - '#39' || I.IMONOME AS NOMEIMOVEL'
      ''
      'FROM   CONTRATOXIMOVEL CI,'
      '       IMOVEL I,'
      '       IMOVEL IM'
      ''
      'WHERE  (CI.IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL)'
      '   AND (CI.IDIMOVEL = I.IDIMOVEL)'
      '   AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)'
      ''
      'ORDER BY IM.IMONOME || '#39' - '#39' || I.IMONOME'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 120
    Top = 126
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryImovelNOMEIMOVEL: TStringField
      DisplayLabel = 'Imóvel'
      FieldName = 'NOMEIMOVEL'
      Origin = 'BASEDADOS.IMOVEL.IMONOME'
      Size = 123
    end
    object qryImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
  end
  object dsImovel: TwwDataSource
    DataSet = qryImovel
    Left = 120
    Top = 140
  end
  object dsEventoImovel: TwwDataSource
    DataSet = qryEventoImovel
    Left = 208
    Top = 133
  end
  object qryEventoImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   E.EVIDATA,'
      '   E.EVICABECALHO,'
      '   E.EVIDESCRICAO,'
      '   E.IDUSUARIO,'
      '   (RTRIM(U.NOMEUSUARIO) || '#39' - '#39' || PU.NOME) AS USUARIO_EXTENSO'
      ''
      'FROM'
      '   PESSOA PU, EVENTOIMOVEL E,'
      '   USUARIOSISTEMA U'
      ''
      'WHERE'
      '       ( E.IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL )'
      '   AND ( E.FLGTIPOEVENTO = '#39'CA'#39' )    '
      '   AND ( E.IDUSUARIO = U.IDUSUARIO )'
      '   AND ( U.IDUSUARIO = PU.IDPESSOA )'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 208
    Top = 145
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryEventoImovelEVIDATA: TDateTimeField
      FieldName = 'EVIDATA'
    end
    object qryEventoImovelEVICABECALHO: TStringField
      FieldName = 'EVICABECALHO'
      Size = 60
    end
    object qryEventoImovelEVIDESCRICAO: TMemoField
      FieldName = 'EVIDESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryEventoImovelIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
    end
    object qryEventoImovelUSUARIO_EXTENSO: TStringField
      FieldName = 'USUARIO_EXTENSO'
      Size = 83
    end
  end
  object qryVerifBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      '  FROM HISTORICOMOVIMENTACAO '
      ' WHERE IDBEM = :pIDBEM'
      '   AND IDTIPOMOVIMENTACAO IN(20,70,6,24)'
      '   AND DATAMOVIMENTACAO = :pDATABAIXA'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 336
    Top = 145
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDATABAIXA'
        ParamType = ptUnknown
      end>
  end
  object qryAssinatura: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CONDATAASSINATURA'
      ' FROM CONTRATOIMOVEL'
      ' WHERE IDCONTRATOIMOVEL = :pIDCONTRATO'
      ' ')
    ValidateWithMask = True
    Left = 404
    Top = 145
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDCONTRATO'
        ParamType = ptUnknown
      end>
    object qryAssinaturaCONDATAASSINATURA: TDateTimeField
      FieldName = 'CONDATAASSINATURA'
      Origin = 'BASEDADOS.CONTRATOIMOVEL.CONDATAASSINATURA'
    end
  end
end
