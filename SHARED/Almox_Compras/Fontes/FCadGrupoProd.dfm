inherited frmCadGrupoProd: TfrmCadGrupoProd
  Left = 114
  Top = 80
  Caption = 'Cadastro de Grupo de Produto'
  ClientHeight = 388
  ClientWidth = 547
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 547
    Height = 302
    object Panel1: TPanel
      Left = 282
      Top = 1
      Width = 264
      Height = 300
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label2: TLabel
        Left = 16
        Top = 48
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label3: TLabel
        Left = 16
        Top = 200
        Width = 113
        Height = 13
        Caption = 'Grupo do Ativo Fixo'
      end
      object Label4: TLabel
        Left = 16
        Top = 240
        Width = 120
        Height = 13
        Caption = 'Natureza do Estoque'
      end
      object dbedDescGrupo: TDBEdit2
        Left = 16
        Top = 64
        Width = 226
        Height = 21
        DataField = 'DescGrupoProd'
        DataSource = ds
        TabOrder = 1
      end
      object dbrdAnaSint: TDBRadioGroup
        Left = 16
        Top = 88
        Width = 226
        Height = 40
        Caption = 'Grupo de Produto'
        Columns = 2
        DataField = 'STATUSGRUPO'
        DataSource = ds
        Items.Strings = (
          'Sintético'
          'Analítico')
        TabOrder = 2
        Values.Strings = (
          'S'
          'A')
      end
      object GbTipDesemb: TGroupBox
        Left = 16
        Top = 136
        Width = 226
        Height = 55
        Caption = ' Tipo de Desembolso: '
        Enabled = False
        TabOrder = 3
        object DbLkTipoDesemb: TwwDBLookupCombo
          Left = 14
          Top = 22
          Width = 198
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'20'#9'Descrição'
            'CODTIPRECDES'#9'10'#9'Código')
          LookupTable = QryTipoDesemb
          LookupField = 'DESCRICAO'
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
      end
      object dbedCodGrupProd: TDBEdit2
        Left = 16
        Top = 24
        Width = 121
        Height = 21
        DataField = 'CODGRUPOPROD'
        DataSource = ds
        TabOrder = 0
        OnExit = dbedCodGrupProdExit
      end
      object dblcGrpAtivoFixo: TwwDBLookupCombo
        Left = 16
        Top = 216
        Width = 228
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Descrição'
          'IDGRUPO'#9'10'#9'Código')
        DataField = 'IDGRUPO'
        DataSource = ds
        LookupTable = qryGrpAtivoFixo
        LookupField = 'IDGRUPO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcNatuEst: TCMDBLookupCombo
        Left = 16
        Top = 256
        Width = 228
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCNATUREZA'#9'45'#9'Descrição'#9'F'
          'CODNATUREZA'#9'3'#9'Código'#9'F')
        DataField = 'IDNATUREZAESTOQUE'
        DataSource = ds
        LookupTable = qryNatuEst
        LookupField = 'IDNATUREZAESTOQUE'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object treeGrupoProd: TCMTreeView
      Left = 1
      Top = 1
      Width = 281
      Height = 300
      PodeNavegar = True
      DataSource = ds
      CampoChave = qryGrupoProdCODGRUPOPROD
      CampoDescricao = qryGrupoProdDESCGRUPOPROD
      CampoTipo = qryGrupoProdSTATUSGRUPO
      OnChange = treeGrupoProdChange
      Align = alClient
    end
  end
  inherited Dock972: TDock97
    Width = 547
  end
  inherited Dock971: TDock97
    Top = 349
    Width = 547
    inherited tb97Fundo: TToolbar97
      Left = 375
      DockPos = 378
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 206
      DockPos = 209
    end
    inherited dbnav: TDBNavigator
      Left = 6
      DataSource = nil
      Hints.Strings = ()
      Visible = False
    end
  end
  inherited ds: TwwDataSource
    DataSet = qryGrupoProd
    Left = 14
    Top = 69
  end
  inherited ImlPadrao: TImageList
    Left = 40
    Top = 65535
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 53
    Top = 199
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    SearchControls = True
    Caption = 'Procura de Grupo de Produto'
    DataSet = qryGrupoProd
    FieldNames.Strings = (
      'CodGrupoProd'
      'DescGrupoProd'
      'StatusGrupo')
    DisplayLabels.Strings = (
      'Código'
      'Descrição'
      'Analítico (A) /Sintético(S)')
    Left = 133
    Top = 199
  end
  inherited CmeCadastro: TCmEventosCadastro
    AfterConfirma = CmeCadastroAfterConfirma
    Left = 374
    Top = 10
  end
  object qryGrupoProd: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM CM.GRUPPROD G '
      'ORDER BY CODGRUPOPROD')
    ValidateWithMask = True
    Left = 153
    Top = 127
    object qryGrupoProdCODTIPRECDES: TStringField
      DisplayWidth = 15
      FieldName = 'CODTIPRECDES'
      Origin = 'GRUPPROD.CODTIPRECDES'
      Visible = False
      Size = 15
    end
    object qryGrupoProdCODGRUPOPROD: TStringField
      DisplayWidth = 10
      FieldName = 'CODGRUPOPROD'
      Origin = 'GRUPPROD.CODGRUPOPROD'
      Visible = False
      Size = 10
    end
    object qryGrupoProdDESCGRUPOPROD: TStringField
      DisplayWidth = 30
      FieldName = 'DESCGRUPOPROD'
      Origin = 'GRUPPROD.DESCGRUPOPROD'
      Visible = False
      Size = 30
    end
    object qryGrupoProdSTATUSGRUPO: TStringField
      DisplayWidth = 1
      FieldName = 'STATUSGRUPO'
      Origin = 'GRUPPROD.STATUSGRUPO'
      Visible = False
      Size = 1
    end
    object qryGrupoProdCODPAI: TStringField
      DisplayWidth = 10
      FieldName = 'CODPAI'
      Origin = 'GRUPPROD.CODPAI'
      Visible = False
      Size = 10
    end
    object qryGrupoProdRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Origin = 'GRUPPROD.RECPAG'
      Visible = False
      Size = 1
    end
    object qryGrupoProdIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'GRUPPROD.IDPESSOA'
      Visible = False
    end
    object qryGrupoProdIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPPROD.IDGRUPO'
    end
    object qryGrupoProdIDNATUREZAESTOQUE: TFloatField
      FieldName = 'IDNATUREZAESTOQUE'
      Origin = 'BASEDADOS.GRUPPROD.IDNATUREZAESTOQUE'
    end
  end
  object QryTipoDesemb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * From TipoRecebDesemb')
    PictureMasks.Strings = (
      'CODTIPRECDES'#9'##.##.###'#9'T'#9'T')
    ValidateWithMask = True
    Left = 77
    Top = 127
    object QryTipoDesembDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 20
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object QryTipoDesembCODTIPRECDES: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Size = 15
    end
    object QryTipoDesembRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Origin = 'TIPORECEBDESEMB.RECPAG'
      Visible = False
      Size = 1
    end
    object QryTipoDesembIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'TIPORECEBDESEMB.IDPESSOA'
      Visible = False
    end
    object QryTipoDesembPLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLANO'
      Origin = 'TIPORECEBDESEMB.PLANO'
      Visible = False
    end
    object QryTipoDesembPLACONTA: TStringField
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      Origin = 'TIPORECEBDESEMB.PLACONTA'
      Visible = False
      Size = 18
    end
    object QryTipoDesembIDUSUARIOINCLUSAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDUSUARIOINCLUSAO'
      Origin = 'TIPORECEBDESEMB.IDUSUARIOINCLUSAO'
      Visible = False
    end
    object QryTipoDesembANASINT: TStringField
      DisplayWidth = 1
      FieldName = 'ANASINT'
      Origin = 'TIPORECEBDESEMB.ANASINT'
      Visible = False
      Size = 1
    end
    object QryTipoDesembPLACONTACREDITO: TStringField
      DisplayWidth = 18
      FieldName = 'PLACONTACREDITO'
      Origin = 'TIPORECEBDESEMB.PLACONTACREDITO'
      Visible = False
      Size = 18
    end
  end
  object dsTipoDesemb: TwwDataSource
    DataSet = QryTipoDesemb
    Left = 150
    Top = 66
  end
  object QryJoin: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * '
      'From TipoRecebDesemb T, GrupProd G'
      'Where G.IdPessoa = T.IdPessoa ')
    ValidateWithMask = True
    Left = 16
    Top = 127
    object QryJoinCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Size = 15
    end
    object QryJoinRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPORECEBDESEMB.RECPAG'
      Size = 1
    end
    object QryJoinIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'TIPORECEBDESEMB.IDPESSOA'
    end
    object QryJoinPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'TIPORECEBDESEMB.PLANO'
    end
    object QryJoinPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'TIPORECEBDESEMB.PLACONTA'
      Size = 18
    end
    object QryJoinIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Origin = 'TIPORECEBDESEMB.IDUSUARIOINCLUSAO'
    end
    object QryJoinDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object QryJoinANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = 'TIPORECEBDESEMB.ANASINT'
      Size = 1
    end
    object QryJoinPLACONTACREDITO: TStringField
      FieldName = 'PLACONTACREDITO'
      Origin = 'TIPORECEBDESEMB.PLACONTACREDITO'
      Size = 18
    end
    object QryJoinCODGRUPOPROD: TStringField
      FieldName = 'CODGRUPOPROD'
      Origin = 'TIPORECEBDESEMB.PLACONTACREDITO'
      Size = 10
    end
    object QryJoinDESCGRUPOPROD: TStringField
      FieldName = 'DESCGRUPOPROD'
      Origin = 'TIPORECEBDESEMB.PLACONTACREDITO'
      Size = 30
    end
    object QryJoinSTATUSGRUPO: TStringField
      FieldName = 'STATUSGRUPO'
      Origin = 'TIPORECEBDESEMB.PLACONTACREDITO'
      Size = 1
    end
    object QryJoinCODPAI: TStringField
      FieldName = 'CODPAI'
      Origin = 'TIPORECEBDESEMB.PLACONTACREDITO'
      Size = 10
    end
    object QryJoinCODTIPRECDES_1: TStringField
      FieldName = 'CODTIPRECDES_1'
      Origin = 'TIPORECEBDESEMB.PLACONTACREDITO'
      Size = 15
    end
    object QryJoinRECPAG_1: TStringField
      FieldName = 'RECPAG_1'
      Origin = 'TIPORECEBDESEMB.PLACONTACREDITO'
      Size = 1
    end
    object QryJoinIDPESSOA_1: TFloatField
      FieldName = 'IDPESSOA_1'
      Origin = 'TIPORECEBDESEMB.PLACONTACREDITO'
    end
  end
  object dsJoin: TwwDataSource
    DataSet = QryJoin
    Left = 141
    Top = 11
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CODGRUPOPROD'
      'DESCGRUPOPROD'
      'STATUSGRUPO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código '
      'Descrição '
      'Status')
    Tabelas.Strings = (
      'GRUPPROD')
    CamposChave.Strings = (
      'CODGRUPOPROD')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 276
    Top = 4
  end
  object qryGrpAtivoFixo: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '         IDGRUPO,'
      '         NOME'
      'FROM '
      '    GRUPO'
      'WHERE'
      '        (TIPO = '#39'A'#39')                           '
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 216
    Top = 185
  end
  object qryNatuEst: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    IDNATUREZAESTOQUE,'
      '    CODNATUREZA,'
      '    DESCNATUREZA'
      'FROM'
      '    NATUREZAESTOQUE'
      '    '
      'ORDER BY DESCNATUREZA')
    ValidateWithMask = True
    Left = 208
    Top = 281
  end
end
