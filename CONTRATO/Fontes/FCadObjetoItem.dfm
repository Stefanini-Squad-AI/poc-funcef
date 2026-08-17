inherited frmCadObjetoItem: TfrmCadObjetoItem
  Left = 102
  Top = 185
  HelpContext = 120007
  Caption = 'Cadastro de Serviço/Produto x Item '
  ClientHeight = 280
  ClientWidth = 633
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 633
    Height = 194
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 94
      Height = 13
      Caption = 'Serviço/Produto'
    end
    object Label2: TLabel
      Left = 320
      Top = 16
      Width = 25
      Height = 13
      Caption = 'Item'
    end
    object Label3: TLabel
      Left = 320
      Top = 65
      Width = 196
      Height = 13
      Caption = 'Tipo de Recebimento/Desembolso'
    end
    object dblcObjeto: TwwDBLookupCombo
      Left = 16
      Top = 32
      Width = 289
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEOBJETO'#9'200'#9'Serviço/Produto'#9'F')
      DataField = 'IDOBJETO'
      DataSource = ds
      LookupTable = qryObjeto
      LookupField = 'IDOBJETO'
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnChange = dblcObjetoChange
    end
    object dblcItem: TwwDBLookupCombo
      Left = 320
      Top = 32
      Width = 289
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME_ITEM'#9'200'#9'Item'#9'F')
      DataField = 'IDITEM'
      DataSource = ds
      LookupTable = qryItem
      LookupField = 'IDITEM'
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnChange = dblcItemChange
      OnEnter = dblcItemEnter
    end
    object rgpRegimePagamento: TDBRadioGroup
      Left = 16
      Top = 55
      Width = 289
      Height = 45
      Caption = 'Regime de Pagamento'
      Columns = 2
      DataField = 'RECPAG'
      DataSource = ds
      Items.Strings = (
        'Contas a Pagar'
        'Contas a Receber')
      TabOrder = 2
      Values.Strings = (
        'P'
        'R')
      OnClick = rgpRegimePagamentoClick
    end
    object dblcTipoRecebimento: TwwDBLookupCombo
      Left = 320
      Top = 81
      Width = 289
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'35'#9'Tipo de Rec/Des'#9'F'
        'CODTIPRECDES'#9'15'#9'Código'#9'F'
        'RECPAG'#9'1'#9'Tipo'#9'F'
        'PLACONTA'#9'18'#9#9'F')
      DataField = 'CODTIPRECDES'
      DataSource = ds
      LookupTable = qryRecebimentoDesembolso
      LookupField = 'CODTIPRECDES'
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcTipoRecebimentoExit
    end
    object pnlConta: TPanel
      Left = 16
      Top = 104
      Width = 609
      Height = 81
      BevelOuter = bvNone
      TabOrder = 4
      object lblSubConta: TLabel
        Left = 304
        Top = 4
        Width = 55
        Height = 13
        Caption = 'Subconta'
      end
      object dbedtContaContabil: TCMProcuraMaskContabil
        Left = 0
        Top = 2
        Width = 289
        Height = 71
        Caption = ' Conta Contábil '
        TabOrder = 0
        OnExit = dbedtContaContabilExit
        MostraMensagens = True
        MostraDescricao = True
        DataSource = ds
        DataField = 'PLACONTA'
        Mensagens.EmBranco = 'Conta não pode estar em branco'
        Mensagens.NaoExiste = 'Conta não existe'
        Mensagens.Sintetica = 'Conta não pode ser sintética'
        Mensagens.Analitica = 'Conta não pode ser analítica'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = True
        AceitaTipoConta = SoAnalitica
        Plano = 0
        Status = scSoAtiva
      end
      object dblcSubConta: TwwDBLookupCombo
        Left = 304
        Top = 20
        Width = 289
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA'#9'No'
          'CODSUBCONTA'#9'10'#9'CODSUBCONTA'#9'No')
        DataField = 'CODSUBCONTA'
        DataSource = ds
        LookupTable = qrySubConta
        LookupField = 'CODSUBCONTA'
        Enabled = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  inherited Dock972: TDock97
    Width = 633
  end
  inherited Dock971: TDock97
    Top = 241
    Width = 633
    inherited tb97Fundo: TToolbar97
      Left = 461
      DockPos = 463
      inherited bbtnSair: TBitBtn
        Tag = 99
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 120007
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 292
      DockPos = 294
      inherited bbtnCancelar: TBitBtn
        Tag = 99
      end
    end
  end
  inherited ds: TwwDataSource
    Left = 53
    Top = 230
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update OBJETOXITEM'
      'set'
      '  IDOBJETO = :IDOBJETO,'
      '  IDITEM = :IDITEM,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  RECPAG = :RECPAG,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  PLANO = :PLANO,'
      '  PLACONTA = :PLACONTA'
      'where'
      '  IDOBJETO = :OLD_IDOBJETO and'
      '  IDITEM = :OLD_IDITEM')
    InsertSQL.Strings = (
      'insert into OBJETOXITEM'
      
        '  (IDOBJETO, IDITEM, CODTIPRECDES, RECPAG, IDPESSOA, CODSUBCONTA' +
        ', PLANO, '
      '   PLACONTA)'
      'values'
      
        '  (:IDOBJETO, :IDITEM, :CODTIPRECDES, :RECPAG, :IDPESSOA, :CODSU' +
        'BCONTA, '
      '   :PLANO, :PLACONTA)')
    DeleteSQL.Strings = (
      'delete from OBJETOXITEM'
      'where'
      '  IDOBJETO = :OLD_IDOBJETO and'
      '  IDITEM = :OLD_IDITEM')
    Left = 89
    Top = 230
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'OBJETOCONTRATUAL.NOMEOBJETO'
      'ITEMCONTRATUAL.NOME_ITEM')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Objeto'
      'Item')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'OBJETOXITEM'
      'OBJETOCONTRATUAL'
      'ITEMCONTRATUAL')
    CamposChave.Strings = (
      'OBJETOXITEM.IDOBJETO'
      'OBJETOXITEM.IDITEM')
    Filtro.Strings = (
      'OBJETOCONTRATUAL.IDOBJETO=OBJETOXITEM.IDOBJETO'
      'ITEMCONTRATUAL.IDITEM=OBJETOXITEM.IDITEM')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '10')
    Left = 168
    Top = 232
  end
  inherited ImlPadrao: TImageList
    Left = 585
    Top = 190
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 240
    Top = 232
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '   OBJETOXITEM'
      'WHERE'
      '  (IDOBJETO = :IDObjeto) AND'
      '  (IDITEM = :IDItem) AND'
      '  (IDPESSOA = :IDPessoa)'
      ''
      ' '
      ' ')
    Left = 15
    Top = 230
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDObjeto'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDItem'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptUnknown
      end>
    object qryIDOBJETO: TFloatField
      FieldName = 'IDOBJETO'
      Origin = 'OBJETOXITEM.IDOBJETO'
    end
    object qryIDITEM: TFloatField
      FieldName = 'IDITEM'
      Origin = 'OBJETOXITEM.IDITEM'
    end
    object qryCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'OBJETOXITEM.CODTIPRECDES'
      Size = 15
    end
    object qryRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'OBJETOXITEM.RECPAG'
      Size = 1
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'OBJETOXITEM.IDPESSOA'
    end
    object qryCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'OBJETOXITEM.CODSUBCONTA'
    end
    object qryPLANO2: TFloatField
      FieldName = 'PLANO'
      Origin = 'OBJETOXITEM.PLANO'
    end
    object qryPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'OBJETOXITEM.PLACONTA'
      Size = 18
    end
  end
  object qryObjeto: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT'
      '   IDOBJETO,'
      '   NOMEOBJETO'
      'FROM'
      '   OBJETOCONTRATUAL'
      'WHERE'
      '   (IDPESSOA = :IDPessoa)'
      'ORDER BY NOMEOBJETO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 231
    Top = 48
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptInput
      end>
    object qryObjetoNOMEOBJETO: TStringField
      DisplayLabel = 'Serviço/Produto'
      DisplayWidth = 200
      FieldName = 'NOMEOBJETO'
      Origin = 'BASEDADOS.OBJETOCONTRATUAL.NOMEOBJETO'
      Size = 200
    end
    object qryObjetoIDOBJETO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOBJETO'
      Origin = 'BASEDADOS.OBJETOCONTRATUAL.IDOBJETO'
      Visible = False
    end
  end
  object qryItem: TwwQuery
    Tag = 5
    DatabaseName = 'BASEDADOS'
    DataSource = ds
    SQL.Strings = (
      'SELECT'
      '   IC.IDITEM,'
      '   IC.NOME_ITEM'
      'FROM'
      '   ITEMCONTRATUAL IC'
      'WHERE'
      '   (IC.IDPESSOA = :IDPessoa) AND'
      '   (NOT EXISTS(SELECT *'
      '               FROM'
      '                  OBJETOXITEM OXI'
      '               WHERE'
      '                  (OXI.IDITEM = IC.IDITEM) AND'
      '                  (OXI.IDOBJETO = :IDObjeto) AND'
      '                  (OXI.IDPESSOA = :IDPessoa))'
      '    OR (IC.IDITEM = :IDItem))'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 457
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDOBJETO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDItem'
        ParamType = ptUnknown
      end>
    object qryItemNOME_ITEM: TStringField
      DisplayLabel = 'Item'
      DisplayWidth = 200
      FieldName = 'NOME_ITEM'
      Size = 200
    end
    object qryItemIDITEM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDITEM'
      Visible = False
    end
  end
  object qrySubConta: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT'
      '   CODSUBCONTA,'
      '   NOMESUBCONTA'
      'FROM'
      '   SUBCONTA'
      'WHERE'
      '   (IDPESSOA = :IDPessoa)'
      'ORDER BY'
      '   NOMESUBCONTA'
      ' ')
    ValidateWithMask = True
    Left = 456
    Top = 144
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptInput
      end>
  end
  object qryRecebimentoDesembolso: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT'
      '   CODTIPRECDES,'
      '   RECPAG,'
      '   DESCRICAO,'
      '   PLACONTA'
      'FROM'
      '   TIPORECEBDESEMB'
      'WHERE'
      '   ( IDPESSOA =:IDPessoa ) AND'
      '   ( RECPAG = :RecPag ) AND'
      '   ( ANASINT = '#39'A'#39' )'
      'ORDER BY'
      '   DESCRICAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 456
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptInput
      end>
  end
  object qryVerificaConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PLACONTA, PLANOME, PLASUBCONTA, PLACCUST'
      'FROM'
      '  PLANOCONTA'
      'WHERE'
      '  ( PLANO =:PLANO ) AND'
      '  ( RTRIM(PLACONTA) =:CONTA ) AND'
      '  ( PLATIPO = '#39'A'#39')'
      '')
    ValidateWithMask = True
    Left = 536
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CONTA'
        ParamType = ptUnknown
      end>
  end
  object qryParam: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPARAMCONTRATO,FLGTIPODESEMB,DATAINI,DATAFIM'
      'FROM PARAMCONTRATO')
    ValidateWithMask = True
    Left = 391
    Top = 8
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '   OBJETOXITEM'
      'WHERE'
      '   (IDOBJETO = :IDObjeto) AND'
      '   (IDITEM = :IDItem)'
      ' ')
    ValidateWithMask = True
    Left = 455
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDOBJETO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDITEM'
        ParamType = ptInput
      end>
    object FloatField1: TFloatField
      FieldName = 'IDOBJETO'
      Origin = 'OBJETOXITEM.IDOBJETO'
    end
    object FloatField2: TFloatField
      FieldName = 'IDITEM'
      Origin = 'OBJETOXITEM.IDITEM'
    end
    object StringField1: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'OBJETOXITEM.CODTIPRECDES'
      Size = 15
    end
    object StringField2: TStringField
      FieldName = 'RECPAG'
      Origin = 'OBJETOXITEM.RECPAG'
      Size = 1
    end
    object FloatField3: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'OBJETOXITEM.IDPESSOA'
    end
    object FloatField4: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'OBJETOXITEM.CODSUBCONTA'
    end
    object FloatField5: TFloatField
      FieldName = 'PLANO'
      Origin = 'OBJETOXITEM.PLANO'
    end
    object StringField3: TStringField
      FieldName = 'PLACONTA'
      Origin = 'OBJETOXITEM.PLACONTA'
      Size = 18
    end
  end
end
