inherited FrmCadTipoClixHotelxCC: TFrmCadTipoClixHotelxCC
  Left = 278
  Top = 222
  HelpContext = 20021
  Caption = 'Tipo de Cliente x Hotel x Conta Contábil'
  ClientHeight = 400
  ClientWidth = 707
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Left = 434
    Top = 97
    Width = 273
    Height = 264
    Align = alRight
    object Label2: TLabel
      Left = 12
      Top = 12
      Width = 49
      Height = 13
      Caption = 'Empresa'
    end
    object Label3: TLabel
      Left = 12
      Top = 216
      Width = 92
      Height = 13
      Caption = 'Centro de Custo'
    end
    object CmProcContaDeb: TCMProcuraMaskContabil
      Left = 12
      Top = 56
      Width = 249
      Height = 73
      Caption = 'Conta Débito'
      TabOrder = 1
      OnExit = CmProcContaDebExit
      MostraMensagens = True
      MostraDescricao = True
      DataSource = ds
      DataField = 'PLACONTA'
      Mensagens.EmBranco = 'Chave não pode estar em branco'
      Mensagens.NaoExiste = 'Chave não existe'
      Mensagens.Sintetica = 'Chave não pode ser sintética'
      Mensagens.Analitica = 'Chave não pode ser analítica'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      AceitaTipoConta = Indiferente
      Plano = 0
      Status = scSoAtiva
    end
    object CmProcContaCre: TCMProcuraMaskContabil
      Left = 12
      Top = 136
      Width = 249
      Height = 73
      Caption = 'Conta Crédito'
      TabOrder = 2
      OnExit = CmProcContaCreExit
      MostraMensagens = True
      MostraDescricao = True
      DataSource = ds
      DataField = 'PLACONTACRE'
      Mensagens.EmBranco = 'Chave não pode estar em branco'
      Mensagens.NaoExiste = 'Chave não existe'
      Mensagens.Sintetica = 'Chave não pode ser sintética'
      Mensagens.Analitica = 'Chave não pode ser analítica'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      AceitaTipoConta = Indiferente
      Plano = 0
      Status = scSoAtiva
      OnChange = CmProcContaCreChange
    end
    object DbLcbEmpresa: TDBLookupComboBox
      Left = 12
      Top = 24
      Width = 249
      Height = 21
      DataField = 'IDPESSOA'
      DataSource = ds
      KeyField = 'IDPESSOA'
      ListField = 'NOMEEMPRESA'
      ListSource = DsEmpresa
      TabOrder = 0
      OnCloseUp = DbLcbEmpresaCloseUp
    end
    object DbLcbCentroCusto: TwwDBLookupCombo
      Left = 12
      Top = 232
      Width = 249
      Height = 21
      DropDownAlignment = taLeftJustify
      DataField = 'CODCENTROCUSTO'
      DataSource = ds
      LookupTable = CdsCentCusto
      LookupField = 'CODCENTROCUSTO'
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnEnter = DbLcbCentroCustoEnter
      OnExit = DbLcbCentroCustoExit
    end
  end
  inherited Dock972: TDock97
    Width = 707
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Caption = '&Incluir'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 361
    Width = 707
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  object PnlTipoCliente: TPanel [3]
    Left = 0
    Top = 47
    Width = 707
    Height = 50
    Align = alTop
    TabOrder = 3
    object Label1: TLabel
      Left = 12
      Top = 8
      Width = 87
      Height = 13
      Caption = 'Tipo de Cliente'
    end
    object dblcbTipoCliente: TCMDBLookupCombo
      Left = 12
      Top = 21
      Width = 321
      Height = 21
      Hint = 'Moedas Ativas e com Data Final vazia'
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'20'#9'Descrição'#9'F'
        'IDTIPOCLIENTE'#9'10'#9'Código'#9'F')
      LookupTable = CdsTipoCliente
      LookupField = 'IDTIPOCLIENTE'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      OrderByDisplay = False
      UseTFields = False
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcbTipoClienteCloseUp
    end
  end
  object DbGrd: TwwDBGrid [4]
    Left = 0
    Top = 97
    Width = 434
    Height = 264
    Selected.Strings = (
      'NOMEEMPRESA'#9'20'#9'Empresa'#9'F'
      'PLACONTA'#9'18'#9'Conta Deb.'#9'F'
      'PLANOME'#9'20'#9'Nome Conta Deb.'#9'F'
      'PLACONTACRE'#9'18'#9'Conta Cred.'#9'F'
      'PLANOMECRE'#9'20'#9'Nome Conta Cred.'#9'F'
      'CODCENTROCUSTO'#9'10'#9'Centro de Custo'#9'F'
      'NOMECCUSTO'#9'30'#9'Nome Centro de Custo'#9'F')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    DataSource = ds
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ReadOnly = True
    TabOrder = 4
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -9
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    TitleLines = 1
    TitleButtons = False
    UseTFields = False
    IndicatorColor = icBlack
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 246
    Top = 7
    TargetsData = (
      1
      2
      (
        ''
        'DisplayLabel'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 394
    Top = 3
  end
  inherited ImlPadrao: TImageList
    Left = 344
    Top = 3
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 444
    Top = 3
  end
  inherited Cds: TCMClientDataSet
    Left = 392
    Top = 51
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOCLIENTE.DESCRICAO'
      'EMPRESAPROP.NOMEEMPRESA'
      'TIPOCLIXHOTELXCC.PLANO'
      'TIPOCLIXHOTELXCC.PLACONTA'
      'TIPOCLIXHOTELXCC.PLACONTACRE')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Tipo Cliente'
      'Empresa'
      'Plano'
      'Conta Débito'
      'Conta Crédito')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOCLIXHOTELXCC'
      'TIPOCLIENTE'
      'EMPRESAPROP')
    CamposChave.Strings = (
      'TIPOCLIENTE.IDTIPOCLIENTE'
      'TIPOCLIXHOTELXCC.IDPESSOA')
    Filtro.Strings = (
      'TIPOCLIXHOTELXCC.IDTIPOCLIENTE = TIPOCLIENTE.IDTIPOCLIENTE(+)'
      'TIPOCLIXHOTELXCC.IDPESSOA = EMPRESAPROP.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '60'
      '10'
      '18'
      '18')
    Left = 444
    Top = 51
  end
  object CdsTipoCliente: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 492
    Top = 51
  end
  object DsTipoCliente: TwwDataSource
    AutoEdit = False
    DataSet = CdsTipoCliente
    Left = 494
    Top = 3
  end
  object DsTipoCliXHotelXCC: TwwDataSource
    AutoEdit = False
    DataSet = CdsTipoCliXHotelXCC
    Left = 546
    Top = 3
  end
  object CdsTipoCliXHotelXCC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 544
    Top = 51
  end
  object CdsEmpresa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 292
    Top = 55
  end
  object DsEmpresa: TwwDataSource
    AutoEdit = False
    DataSet = CdsEmpresa
    Left = 294
    Top = 7
  end
  object CdsCentCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 604
    Top = 51
  end
  object SqlCentCusto: TCMSqlParams
    SQL.Strings = (
      'SELECT C.CODCENTROCUSTO, C.NOME'
      '  FROM CENTCUST C, CONTASXCC X'
      ' WHERE X.IDEMPRESA = :idempresa'
      '   AND X.PLANO = :plano'
      '   AND X.PLACONTA = :placonta'
      '   AND X.CODCENTROCUSTO = C.CODCENTROCUSTO'
      '   AND X.IDEMPRESA = C.IDEMPRESA')
    ClientDataSet = CdsCentCusto
    Left = 600
    Top = 4
  end
  object CdsParamContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 660
    Top = 7
  end
  object Sql: TCMSqlParams
    SQL.Strings = (
      
        'SELECT X.IDTIPOCLIENTE, X.IDPESSOA, X.PLANO, X.PLACONTA, X.PLACO' +
        'NTACRE, '
      
        '       X.CODCENTROCUSTO, X.IDEMPRESA, T.DESCRICAO, E.NOMEEMPRESA' +
        ', C.PLANOME,'
      '       P.PLANOME AS PLANOMECRE, N.NOME AS NOMECCUSTO'
      
        '  FROM TIPOCLIXHOTELXCC X, TIPOCLIENTE T, EMPRESAPROP E, PLANOCO' +
        'NTA C, PLANOCONTA P, CENTCUST N'
      ' WHERE X.IDTIPOCLIENTE = T.IDTIPOCLIENTE(+) AND'
      '       X.IDPESSOA = E.IDPESSOA(+) AND'
      
        '       ( X.CODCENTROCUSTO = N.CODCENTROCUSTO(+) AND X.IDEMPRESA ' +
        '= N.IDEMPRESA(+) ) AND'
      
        '       ( X.PLANO = C.PLANO(+) AND X.PLACONTA = C.PLACONTA(+) ) A' +
        'ND'
      
        '       ( X.PLANO = P.PLANO(+) AND X.PLACONTACRE = P.PLACONTA(+) ' +
        ')'
      '')
    ClientDataSet = Cds
    Left = 344
    Top = 56
  end
end
