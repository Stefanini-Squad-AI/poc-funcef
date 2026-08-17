inherited FrmMtCadGrupoProd: TFrmMtCadGrupoProd
  Left = 109
  Top = 78
  HelpContext = 50043
  Caption = 'Cadastro de Grupo de Produto'
  ClientHeight = 352
  ClientWidth = 578
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Left = 273
    Width = 305
    Height = 266
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label2: TLabel
      Left = 24
      Top = 56
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label3: TLabel
      Left = 24
      Top = 208
      Width = 113
      Height = 13
      Caption = 'Grupo do Ativo Fixo'
    end
    object Label5: TLabel
      Left = 24
      Top = 168
      Width = 116
      Height = 13
      Caption = 'Tipo de Desembolso'
    end
    object edDescGrupo: TDBEdit2
      Left = 24
      Top = 72
      Width = 257
      Height = 21
      DataField = 'DescGrupoProd'
      DataSource = ds
      MaxLength = 30
      TabOrder = 1
    end
    object edCodGrupoProd: TDBEdit2
      Left = 24
      Top = 32
      Width = 121
      Height = 21
      DataField = 'CODGRUPOPROD'
      DataSource = ds
      MaxLength = 10
      TabOrder = 0
      OnExit = edCodGrupoProdExit
    end
    object dblcGrpAtivoFixo: TwwDBLookupCombo
      Left = 24
      Top = 224
      Width = 259
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Descrição'
        'IDGRUPO'#9'10'#9'Código')
      DataField = 'IDGRUPO'
      DataSource = ds
      LookupTable = cdsGrpAtivoFixo
      LookupField = 'IDGRUPO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object DbLkTipoDesemb: TwwDBLookupCombo
      Left = 24
      Top = 184
      Width = 259
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'35'#9#9'F')
      DataField = 'CODTIPRECDES'
      DataSource = ds
      LookupTable = cdsTipoDesemb
      LookupField = 'CODTIPRECDES'
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
    end
    object rgStatus: TDBRadioGroup
      Left = 24
      Top = 104
      Width = 257
      Height = 49
      Columns = 2
      DataField = 'STATUSGRUPO'
      DataSource = ds
      Enabled = False
      Items.Strings = (
        'Sintetico'
        'Analitico')
      TabOrder = 4
      Values.Strings = (
        'S'
        'A')
    end
  end
  inherited Dock972: TDock97
    Width = 578
  end
  inherited Dock971: TDock97
    Top = 313
    Width = 578
    inherited tb97Fundo: TToolbar97
      Left = 406
      DockPos = 511
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 50043
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 237
      DockPos = 342
    end
  end
  object TreeGrupoProd: TCMTreeViewMT [3]
    Left = 0
    Top = 47
    Width = 273
    Height = 266
    PodeNavegar = True
    DataSource = dsTree
    CampoChave = 'CODGRUPOPROD'
    CampoDescricao = 'DESCGRUPOPROD'
    CampoTipo = 'STATUSGRUPO'
    OnChange = TreeGrupoProdChange
    Align = alLeft
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 722
    Top = 65535
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  inherited ds: TwwDataSource
    Left = 350
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 768
    Top = 65519
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 432
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 292
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
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
    Left = 512
    Top = 65535
  end
  object cdsTipoDesemb: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoDesemb'
    Left = 24
    Top = 296
  end
  object cdsGrpAtivoFixo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrpAtivoFixo'
    Left = 112
    Top = 296
  end
  object cdsNatuEstoque: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNatuEstoque'
    Left = 208
    Top = 168
  end
  object spTipoDesemb: TCMSqlParams
    SQL.Strings = (
      'SELECT *'
      'FROM TIPORECEBDESEMB'
      'WHERE  (ANASINT = '#39'A'#39')'
      '   AND  (RECPAG = '#39'P'#39')'
      '   AND (ATIVO = '#39'S'#39')')
    ClientDataSet = cdsTipoDesemb
    Left = 24
    Top = 232
  end
  object spGrpAtivoFixo: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '         IDGRUPO,'
      '         NOME'
      'FROM '
      '    GRUPO'
      'WHERE'
      '        (TIPO = '#39'A'#39')                           '
      'ORDER BY NOME')
    ClientDataSet = cdsGrpAtivoFixo
    Left = 120
    Top = 232
  end
  object spNatuEstoque: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '    IDNATUREZAESTOQUE,'
      '    CODNATUREZA,'
      '    DESCNATUREZA'
      'FROM'
      '    NATUREZAESTOQUE'
      '    '
      'ORDER BY DESCNATUREZA')
    ClientDataSet = cdsNatuEstoque
    Left = 208
    Top = 120
  end
  object cdsTree: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 513
    Top = 63
  end
  object dsTree: TwwDataSource
    AutoEdit = False
    DataSet = cdsTree
    Left = 510
    Top = 47
  end
end
