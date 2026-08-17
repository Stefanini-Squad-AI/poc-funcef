inherited frmEstornaDesmembraObra: TfrmEstornaDesmembraObra
  Left = 546
  Top = 162
  HelpContext = 540010
  Caption = 'Desfazer Desmembramento de Obras'
  ClientHeight = 440
  ClientWidth = 521
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 521
    Height = 407
    object GroupBox1: TGroupBox
      Left = 16
      Top = 207
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
        DataSource = dsDesmembraObra
        MaxLength = 2000
        TabOrder = 2
      end
      object DBedtCabecalhoEvento: TDBEdit
        Left = 16
        Top = 32
        Width = 345
        Height = 21
        DataField = 'EVICABECALHO'
        DataSource = dsDesmembraObra
        TabOrder = 0
      end
      object DBedtUsuario: TDBEdit
        Left = 16
        Top = 158
        Width = 457
        Height = 21
        DataField = 'USUARIO_EXTENSO'
        DataSource = dsDesmembraObra
        MaxLength = 60
        TabOrder = 3
      end
      object dbeditData: TDBEdit
        Left = 376
        Top = 32
        Width = 97
        Height = 21
        DataField = 'EVIDATA'
        DataSource = dsDesmembraObra
        TabOrder = 1
      end
    end
    object Panel5: TPanel
      Left = 16
      Top = 99
      Width = 488
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Obras Resultantes'
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
      Left = 16
      Top = 126
      Width = 487
      Height = 73
      Selected.Strings = (
        'DSC_OBRARESULT'#9'250'#9'Descrição'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsDesmembraObra
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
      OnCalcCellColors = DBgrdBemOriginalCalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = DBgrdBemOriginalTopRowChanged
    end
    inline molObraDesmembra1: TmolObraDesmembra
      Left = 8
      Top = 4
      Width = 505
      TabOrder = 3
      inherited edtImovel: TEdit
        Width = 441
      end
      inherited btnBuscaObra: TBitBtn
        Left = 448
        OnClick = molObraDesmembra1btnBuscaObraClick
      end
      inherited btnLimpaObra: TBitBtn
        Left = 472
        OnClick = molObraDesmembra1btnLimpaObraClick
      end
      inherited memObra: TMemo
        Width = 487
      end
    end
  end
  inherited Dock971: TDock97
    Top = 407
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
  object qryDesmembraObra: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       D.IDCAFOBRA,'
      '       D.IDOBRARESULT,'
      '       O.DTAENCERRAOBRA,'
      '       O.DESCCAFOBRA      AS DSC_OBRA,'
      '       OD.DESCCAFOBRA     AS DSC_OBRARESULT,'
      '       EI.EVIDATA,'
      '       EI.EVICABECALHO,'
      '       EI.EVIDESCRICAO,'
      
        '       (RTRIM(U.NOMEUSUARIO) || '#39' - '#39' || P.NOME) AS USUARIO_EXTE' +
        'NSO'
      ''
      'FROM   CAFOBRADESMEMB D,'
      '       CAFOBRA O,'
      '       CAFOBRA OD,'
      '       DESMEMBRAIMOVEL DI,'
      '       EVENTOIMOVEL EI,'
      '       USUARIOSISTEMA U,'
      '       PESSOA P'
      ''
      'WHERE (O.IDCAFOBRA = :PIDCAFOBRA)'
      '  AND (O.IDCAFOBRA = D.IDCAFOBRA)'
      '  AND (D.IDOBRARESULT = OD.IDCAFOBRA)'
      '  AND (O.IDIMOVEL = DI.IDIMOVELINI)'
      '  AND (DI.IDEVENTOIMOVELINI= EI.IDEVENTOIMOVEL)'
      '  AND (EI.IDUSUARIO = U.IDUSUARIO)'
      '  AND (U.IDUSUARIO = P.IDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 80
    Top = 86
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCAFOBRA'
        ParamType = ptUnknown
      end>
    object qryDesmembraObraIDCAFOBRA: TFloatField
      FieldName = 'IDCAFOBRA'
    end
    object qryDesmembraObraIDOBRARESULT: TFloatField
      FieldName = 'IDOBRARESULT'
    end
    object qryDesmembraObraDTAENCERRAOBRA: TDateTimeField
      FieldName = 'DTAENCERRAOBRA'
    end
    object qryDesmembraObraDSC_OBRA: TStringField
      FieldName = 'DSC_OBRA'
      Size = 250
    end
    object qryDesmembraObraDSC_OBRARESULT: TStringField
      FieldName = 'DSC_OBRARESULT'
      Size = 250
    end
    object qryDesmembraObraEVIDATA: TDateTimeField
      FieldName = 'EVIDATA'
    end
    object qryDesmembraObraEVICABECALHO: TStringField
      FieldName = 'EVICABECALHO'
      Size = 60
    end
    object qryDesmembraObraEVIDESCRICAO: TMemoField
      FieldName = 'EVIDESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryDesmembraObraUSUARIO_EXTENSO: TStringField
      FieldName = 'USUARIO_EXTENSO'
      Size = 83
    end
  end
  object dsDesmembraObra: TwwDataSource
    DataSet = qryDesmembraObra
    Left = 80
    Top = 100
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
      'FROM   DESMEMBRAIMOVEL D,'
      '       IMOVEL I,'
      '       IMOVEL IM,'
      '       IMOVELXBEM IXB,'
      '       BEM B'
      ''
      'WHERE  (D.IDIMOVELINI = :PIDIMOVELORIG)'
      '   AND (D.IDIMOVELFIM = I.IDIMOVEL)'
      '   AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)'
      '   AND (D.IDIMOVELFIM = IXB.IDIMOVEL(+))'
      '   AND (IXB.IDBEM = B.IDBEM(+))'
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 241
    Top = 126
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
end
