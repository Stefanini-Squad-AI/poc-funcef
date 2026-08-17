inherited frmEstornaDesmembramento: TfrmEstornaDesmembramento
  Left = 414
  Top = 182
  HelpContext = 540010
  Caption = 'Desfazer Desmembramento'
  ClientHeight = 418
  ClientWidth = 521
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 521
    Height = 385
    object GroupBox1: TGroupBox
      Left = 16
      Top = 185
      Width = 489
      Height = 189
      Caption = 'Evento Original'
      Enabled = False
      TabOrder = 0
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
      object dbedtData: TDBEdit
        Left = 376
        Top = 32
        Width = 97
        Height = 21
        DataField = 'EVIDATA'
        DataSource = dsEventoImovel
        TabOrder = 1
      end
    end
    inline molImovelDesmembra1: TmolImovelDesmembra
      Left = 8
      Top = 8
      Width = 505
      TabOrder = 1
      inherited Label5: TLabel
        Width = 85
        Caption = 'Imóvel Original'
      end
      inherited edtImovel: TEdit
        Width = 441
      end
      inherited btnBuscaImovel: TBitBtn
        Left = 448
        OnClick = molImovelDesmembra1btnBuscaImovelClick
      end
      inherited btnLimpaImovel: TBitBtn
        Left = 472
        OnClick = molImovelDesmembra1btnLimpaImovelClick
      end
      inherited MS_ImovelInativo: TMontaSelect
        Left = 368
      end
    end
    object Panel5: TPanel
      Left = 16
      Top = 53
      Width = 488
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Imóveis Resultantes'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object DBgrdBemOriginal: TwwDBGrid
      Left = 16
      Top = 80
      Width = 487
      Height = 97
      Selected.Strings = (
        'NOMEIMOVEL'#9'123'#9'Nome do Imóvel'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsDesmembraImovel
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      KeyOptions = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
      ParentFont = False
      TabOrder = 3
      TitleAlignment = taLeftJustify
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'Small Fonts'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      OnCalcCellColors = DBgrdBemOriginalCalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = DBgrdBemOriginalTopRowChanged
    end
  end
  inherited Dock971: TDock97
    Top = 385
    Width = 521
    inherited tb97Fundo: TToolbar97
      Left = 349
      DockPos = 482
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 65
      inherited ToolbarSep973: TToolbarSep97
        Visible = False
      end
      inherited ToolbarSep974: TToolbarSep97
        Left = 278
      end
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        Visible = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Width = 193
        Caption = '&Desfazer Desmembramento'
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  object qryEventoImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   E.IDEVENTOIMOVEL,'
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
      '       ( E.IDEVENTOIMOVEL = :PIDEVENTOIMOVEL )'
      '   AND ( E.IDUSUARIO = U.IDUSUARIO )'
      '   AND ( U.IDUSUARIO = PU.IDPESSOA )'
      ''
      '')
    ValidateWithMask = True
    Left = 216
    Top = 97
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEVENTOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryEventoImovelIDEVENTOIMOVEL: TFloatField
      FieldName = 'IDEVENTOIMOVEL'
    end
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
  object dsEventoImovel: TwwDataSource
    DataSet = qryEventoImovel
    Left = 216
    Top = 85
  end
  object qryDesmembraImovel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       D.IDIMOVELINI,'
      '       D.IDIMOVELFIM,'
      '       D.DMRDATA,'
      '       D.IDEVENTOIMOVELINI,'
      '       D.IDEVENTOIMOVELFIM,'
      '       IM.IMONOME || '#39' - '#39' || I.IMONOME AS NOMEIMOVEL,'
      '       B.IDCONJUNTO AS IDCONJUNTOFIM'
      ''
      'FROM   DESMEMBRAIMOVEL D, '
      '       IMOVEL I, '
      '       IMOVEL IM,'
      '       IMOVELXBEM IXB,'
      '       BEM B'
      '       '
      'WHERE  (D.IDIMOVELINI = :PIDIMOVELORIG)'
      '   AND (D.IDIMOVELFIM = I.IDIMOVEL)'
      '   AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)'
      '   AND (D.IDIMOVELFIM = IXB.IDIMOVEL)'
      '   AND (IXB.IDBEM = B.IDBEM)'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 80
    Top = 86
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVELORIG'
        ParamType = ptUnknown
      end>
    object qryDesmembraImovelIDIMOVELINI: TFloatField
      FieldName = 'IDIMOVELINI'
      Origin = 'BASEDADOS.DESMEMBRAIMOVEL.IDIMOVELINI'
    end
    object qryDesmembraImovelIDIMOVELFIM: TFloatField
      FieldName = 'IDIMOVELFIM'
      Origin = 'BASEDADOS.DESMEMBRAIMOVEL.IDIMOVELFIM'
    end
    object qryDesmembraImovelDMRDATA: TDateTimeField
      FieldName = 'DMRDATA'
      Origin = 'BASEDADOS.DESMEMBRAIMOVEL.DMRDATA'
    end
    object qryDesmembraImovelNOMEIMOVEL: TStringField
      DisplayLabel = 'Nome do Imóvel'
      FieldName = 'NOMEIMOVEL'
      Origin = 'BASEDADOS.IMOVEL.IMONOME'
      Size = 123
    end
    object qryDesmembraImovelIDEVENTOIMOVELINI: TFloatField
      FieldName = 'IDEVENTOIMOVELINI'
      Origin = 'BASEDADOS.DESMEMBRAIMOVEL.IDEVENTOIMOVELINI'
    end
    object qryDesmembraImovelIDCONJUNTOFIM: TFloatField
      FieldName = 'IDCONJUNTOFIM'
      Origin = 'BASEDADOS.BEM.IDCONJUNTO'
    end
    object qryDesmembraImovelIDEVENTOIMOVELFIM: TFloatField
      FieldName = 'IDEVENTOIMOVELFIM'
      Origin = 'BASEDADOS.DESMEMBRAIMOVEL.IDEVENTOIMOVELFIM'
    end
  end
  object dsDesmembraImovel: TwwDataSource
    DataSet = qryDesmembraImovel
    Left = 80
    Top = 100
  end
end
