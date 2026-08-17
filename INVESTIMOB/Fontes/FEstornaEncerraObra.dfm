inherited frmEstornaEncerraObra: TfrmEstornaEncerraObra
  Left = 473
  Top = 169
  HelpContext = 540017
  Caption = 'Desfazer Encerramento de Obra'
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
      Top = 180
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
        Caption = 'Data'
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
      object edtDataEvento: TDBEdit
        Left = 376
        Top = 32
        Width = 97
        Height = 21
        DataField = 'EVIDATA'
        DataSource = dsEventoImovel
        TabOrder = 1
      end
    end
    inline molImovelObra1: TmolImovelObra
      Left = 6
      Top = 8
      Width = 507
      TabOrder = 1
      inherited edtImovel: TEdit
        Width = 441
      end
      inherited btnBuscaImovel: TBitBtn
        Left = 448
        OnClick = molImovelObra1btnBuscaImovelClick
      end
      inherited btnLimpaImovel: TBitBtn
        Left = 472
        OnClick = molImovelObra1btnLimpaImovelClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 64
      Width = 489
      Height = 105
      Caption = 'Descrição da Obra'
      Enabled = False
      TabOrder = 2
      object memDescObra: TMemo
        Left = 16
        Top = 24
        Width = 457
        Height = 65
        Lines.Strings = (
          '')
        TabOrder = 0
      end
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
      end
      inherited bbtnCancelar: TBitBtn
        Width = 193
        Caption = '&Desfazer Encerramento'
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 384
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
      '   DESMEMBRAIMOVEL DI,'
      '   PESSOA PU, EVENTOIMOVEL E,'
      '   USUARIOSISTEMA U'
      ''
      'WHERE'
      '       ( DI.IDIMOVELINI = :PIDIMOVELINI )'
      '   AND ( E.IDEVENTOIMOVEL = DI.IDEVENTOIMOVELINI )'
      '   AND ( E.IDUSUARIO = U.IDUSUARIO )'
      '   AND ( U.IDUSUARIO = PU.IDPESSOA )'
      '   ORDER BY E.EVIDATA DESC'
      ''
      ' ')
    ValidateWithMask = True
    Left = 312
    Top = 281
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVELINI'
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
    Left = 312
    Top = 269
  end
  object qryImovelXBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IB.IDIMOVEL, IB.IDBEM, IB.IXBPERCENT, IB.IXBGRUPO, B.IDGRUPO,'
      '   B.IDCONJUNTO, B.DESBEM '
      'FROM'
      '   IMOVELXBEM IB, BEM B'
      'WHERE'
      '   IB.IDBEM = B.IDBEM'
      '   AND ( (:PIDIMOVEL IS NULL) OR (IB.IDIMOVEL = :PIDIMOVEL) )'
      '   AND ( (:PIDBEM    IS NULL) OR (IB.IDBEM    = :PIDBEM) )'
      '   AND ( IB.IXBGRUPO <> '#39'T'#39' )'
      ''
      ' ')
    ValidateWithMask = True
    Left = 193
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
    object qryImovelXBemIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Origin = 'BASEDADOS.IMOVELXBEM.IDIMOVEL'
    end
    object qryImovelXBemIDBEM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBEM'
      Origin = 'BASEDADOS.IMOVELXBEM.IDBEM'
    end
    object qryImovelXBemIXBPERCENT: TFloatField
      DisplayWidth = 10
      FieldName = 'IXBPERCENT'
      Origin = 'BASEDADOS.IMOVELXBEM.IXBPERCENT'
      DisplayFormat = '##0.00%'
    end
    object qryImovelXBemDESBEM: TStringField
      DisplayWidth = 200
      FieldName = 'DESBEM'
      Origin = 'BASEDADOS.BEM.DESBEM'
      Size = 200
    end
    object qryImovelXBemIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
    object qryImovelXBemIXBGRUPO: TStringField
      FieldName = 'IXBGRUPO'
      FixedChar = True
      Size = 1
    end
    object qryImovelXBemIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
  end
  object qryTransfBens: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   T.IDMOVIMENTACAO,'
      '   T.IDIMOVELORIG,'
      '   T.IDIMOVELDEST,'
      '   I.IDIMOVELMESTRE  AS IDMESTREFIM,'
      '   H.DATAMOVIMENTACAO,'
      '   H.IDBEM, B.IDCONJUNTO,'
      '   H.IDTIPOMOVIMENTACAO,'
      '   T.FLGOPERACAO'
      'FROM'
      '   TRANSFBEMIMOVEL T,'
      '   HISTORICOMOVIMENTACAO H,'
      '   IMOVEL I, BEM B'
      'WHERE'
      '       ( T.IDIMOVELORIG = :PIDIMOVELORIG )'
      '   AND ( T.FLGOPERACAO = '#39'O'#39' OR T.FLGOPERACAO = '#39'X'#39' )'
      '   AND ( T.IDMOVIMENTACAO = H.IDMOVIMENTACAO )'
      '   AND ( T.IDIMOVELDEST = I.IDIMOVEL )'
      '   AND ( H.IDBEM = B.IDBEM )'
      ' ORDER BY H.IDMOVIMENTACAO DESC'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 417
    Top = 262
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVELORIG'
        ParamType = ptUnknown
      end>
    object qryTransfBensIDMOVIMENTACAO: TFloatField
      FieldName = 'IDMOVIMENTACAO'
      Origin = 'BASEDADOS.TRANSFBEMIMOVEL.IDMOVIMENTACAO'
    end
    object qryTransfBensDATAMOVIMENTACAO: TDateTimeField
      FieldName = 'DATAMOVIMENTACAO'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.DATAMOVIMENTACAO'
    end
    object qryTransfBensIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.IDBEM'
    end
    object qryTransfBensIDMESTREFIM: TFloatField
      FieldName = 'IDMESTREFIM'
      Origin = 'BASEDADOS.IMOVEL.IDIMOVELMESTRE'
    end
    object qryTransfBensIDTIPOMOVIMENTACAO: TFloatField
      FieldName = 'IDTIPOMOVIMENTACAO'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.IDTIPOMOVIMENTACAO'
    end
    object qryTransfBensIDIMOVELORIG: TFloatField
      FieldName = 'IDIMOVELORIG'
      Origin = 'BASEDADOS.TRANSFBEMIMOVEL.IDIMOVELORIG'
    end
    object qryTransfBensIDIMOVELDEST: TFloatField
      FieldName = 'IDIMOVELDEST'
      Origin = 'BASEDADOS.TRANSFBEMIMOVEL.IDIMOVELDEST'
    end
    object qryTransfBensFLGOPERACAO: TStringField
      FieldName = 'FLGOPERACAO'
      Origin = 'BASEDADOS.TRANSFBEMIMOVEL.FLGOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryTransfBensIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
      Origin = 'BASEDADOS.BEM.IDCONJUNTO'
    end
  end
  object cdsObra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 46
  end
  object sqlBens: TCMSqlParams
    SQL.Strings = (
      'SELECT B.IDBEM,B.IDPESSOA,B.IDCONJUNTO,B.IDTERCEIRO,B.IDGRUPO,'
      '       B.CODSUBCONTA,B.IDCLASSEBEM,B.IDMODULO,B.IDITENSRECDEV,'
      
        '       B.IDFORNSERV,B.IDSITUACAO,B.IDIMAGEM,B.REGISTRO,B.CONTROL' +
        'E,'
      
        '       B.PLACA,B.DESBEM,B.IDNOTA,B.COMPLNOTA,B.DTANOTA,B.NUMSERI' +
        'E,'
      
        '       B.DTAINCLUSAO,B.VALHISTORICO,B.VALORG,B.CMBEM,B.VALFIS,B.' +
        'VALGER,'
      
        '       B.DATAINICIODEP,B.VALDEPINI,B.TAXADEP,B.DEPLANC,B.CMDEP,B' +
        '.DEPFIS,'
      '       B.DEPGER,B.DATAULTDEP,B.DATARECALCDEP,B.FLGDEPREC,'
      '       B.PROPBAIXA,B.BAIXATOTAL,B.IDOPCIONAL,B.UNIDNEGOC,'
      
        '       B.PROCESSOAQUIS,B.EMPENHOAQUIS,B.PUBAUTOR,B.PUBEDITORA,B.' +
        'PUBANO,'
      '       B.PRIORIDADE,B.DATAINSTALACAO,B.DATATERMINOGAR,'
      '       B.FLGBEMINTCONTAB, B.DTACONTAB,'
      '       G.IDGRUPO AS IDGRUPOOBRA, G.CLASSE, G.NOME AS NOMEGRUPO,'
      '       '#39' '#39' AS TIPO_GRUPO'
      'FROM BEM B,'
      '     HISTORICOMOVIMENTACAO HM,'
      '     GRUPO G'
      'WHERE HM.IDCAFOBRA = :IDCAFOBRA'
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND B.IDBEM = HM.IDBEM(+)'
      '  AND B.IDPESSOA = HM.IDPESSOA(+)'
      '  AND B.IDGRUPO = G.IDGRUPO(+)'
      ''
      ' ')
    ClientDataSet = cdsBens
    Left = 408
    Top = 48
  end
  object cdsBens: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 62
  end
end
