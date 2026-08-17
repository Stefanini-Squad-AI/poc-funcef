inherited frmCadObjetoContratual: TfrmCadObjetoContratual
  Left = 78
  Top = 218
  HelpContext = 120005
  Caption = 'Cadastro de Serviços e Produtos do Contrato'
  ClientHeight = 262
  ClientWidth = 651
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 651
    Height = 176
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 148
      Height = 13
      Caption = 'Nome do Serviço/Produto'
    end
    object Label2: TLabel
      Left = 384
      Top = 120
      Width = 34
      Height = 13
      Caption = 'Artigo'
    end
    object dbrdgrpTipo: TDBRadioGroup
      Left = 384
      Top = 24
      Width = 249
      Height = 86
      Caption = ' Tipo do Objeto '
      DataField = 'TIPOOBJETO'
      DataSource = ds
      Items.Strings = (
        '&Serviço'
        '&Produto')
      TabOrder = 0
      Values.Strings = (
        'S'
        'M')
      OnChange = dbrdgrpTipoChange
    end
    object dbcmbArtigo: TwwDBLookupCombo
      Left = 384
      Top = 136
      Width = 249
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CODARTIGO'#9'14'#9'Código'
        'DESCPROD'#9'40'#9'Descrição')
      DataField = 'CODARTIGO'
      DataSource = ds
      LookupTable = qryArtigo
      LookupField = 'CODARTIGO'
      Enabled = False
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object memObj: TDBMemo
      Left = 16
      Top = 32
      Width = 353
      Height = 129
      DataField = 'NOMEOBJETO'
      DataSource = ds
      MaxLength = 200
      ScrollBars = ssVertical
      TabOrder = 2
    end
  end
  inherited Dock972: TDock97
    Width = 651
  end
  inherited Dock971: TDock97
    Top = 223
    Width = 651
    inherited tb97Fundo: TToolbar97
      Left = 479
      DockPos = 482
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 120005
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 310
      DockPos = 313
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65531
  end
  inherited ds: TwwDataSource
    Left = 349
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update OBJETOCONTRATUAL'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  CODARTIGO = :CODARTIGO,'
      '  NOMEOBJETO = :NOMEOBJETO,'
      '  TIPOOBJETO = :TIPOOBJETO'
      'where'
      '  IDOBJETO = :OLD_IDOBJETO')
    InsertSQL.Strings = (
      'insert into OBJETOCONTRATUAL'
      '  (IDOBJETO,IDPESSOA, CODARTIGO, NOMEOBJETO, TIPOOBJETO)'
      'values'
      '  (:IDOBJETO,:IDPESSOA, :CODARTIGO, :NOMEOBJETO, :TIPOOBJETO)')
    DeleteSQL.Strings = (
      'delete from OBJETOCONTRATUAL'
      'where'
      '  IDOBJETO = :OLD_IDOBJETO')
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'O.NOMEOBJETO'
      'O.TIPOOBJETO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Objeto'
      'Tipo do Objeto')
    Tabelas.Strings = (
      'OBJETOCONTRATUAL O')
    CamposChave.Strings = (
      'O.IDOBJETO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '1')
    Left = 437
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDOBJETO,IDPESSOA,CODARTIGO,NOMEOBJETO,TIPOOBJETO'
      'FROM '
      'OBJETOCONTRATUAL'
      'WHERE'
      '(IDOBJETO = :IDOBJETO)')
    Left = 311
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOBJETO'
        ParamType = ptUnknown
      end>
    object qryIDOBJETO: TFloatField
      FieldName = 'IDOBJETO'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryNOMEOBJETO: TStringField
      FieldName = 'NOMEOBJETO'
      Size = 200
    end
    object qryTIPOOBJETO: TStringField
      FieldName = 'TIPOOBJETO'
      Size = 1
    end
  end
  object qryArtigo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT A.CODARTIGO, P.DESCPROD'
      'FROM ARTIGO A, PRODUTO P'
      'WHERE A.CODPRODUTO=P.CODPRODUTO'
      'ORDER BY P.DESCPROD')
    ValidateWithMask = True
    Left = 503
    Top = 88
    object qryArtigoCODARTIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 14
      FieldName = 'CODARTIGO'
      Origin = 'ARTIGO.CODARTIGO'
      Size = 14
    end
    object qryArtigoDESCPROD: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCPROD'
      Origin = 'PRODUTO.DESCPROD'
      Size = 40
    end
  end
end
