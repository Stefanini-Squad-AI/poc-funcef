inherited frmEntidadePrevidencia: TfrmEntidadePrevidencia
  Left = 231
  Top = 131
  HelpContext = 40158
  Caption = 'Entidade de Previdência'
  ClientHeight = 340
  ClientWidth = 421
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 421
    Height = 254
    object Label1: TLabel
      Left = 20
      Top = 10
      Width = 33
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit1
    end
    object Label6: TLabel
      Left = 20
      Top = 50
      Width = 26
      Height = 13
      Caption = 'CGC'
      FocusControl = DBEdit6
    end
    object Label11: TLabel
      Left = 20
      Top = 92
      Width = 75
      Height = 13
      Caption = 'Observações'
      FocusControl = DBEdit6
    end
    object DBEdit1: TDBEdit
      Left = 20
      Top = 25
      Width = 381
      Height = 21
      AutoSelect = False
      DataField = 'NO_PESSOA'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit6: TDBEdit
      Left = 20
      Top = 65
      Width = 145
      Height = 21
      AutoSelect = False
      DataField = 'NR_CGC'
      DataSource = ds
      TabOrder = 1
    end
    object DBMemo1: TDBMemo
      Left = 20
      Top = 107
      Width = 381
      Height = 94
      DataField = 'DS_OBSERV'
      DataSource = ds
      TabOrder = 2
    end
    object btbtnEndereco: TBitBtn
      Left = 32
      Top = 209
      Width = 98
      Height = 35
      Caption = '&Endereço >>'
      Enabled = False
      TabOrder = 3
      OnClick = btbtnEnderecoClick
    end
    object btbtnContatos: TBitBtn
      Left = 130
      Top = 209
      Width = 93
      Height = 35
      Caption = '&Contatos >>'
      Enabled = False
      TabOrder = 4
      OnClick = btbtnContatosClick
    end
  end
  inherited Dock972: TDock97
    Width = 421
  end
  inherited Dock971: TDock97
    Top = 301
    Width = 421
    inherited tb97Fundo: TToolbar97
      Left = 248
      DockPos = 248
      TabOrder = 2
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 80
      DockPos = 80
      TabOrder = 1
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ds: TwwDataSource
    DataSet = QryPrincipal
    Left = 291
    Top = 43
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 308
    Top = 12
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 338
    Top = 13
  end
  object QryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = QryPrincipalAfterOpen
    BeforePost = QryPrincipalBeforePost
    AfterPost = QryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CD_PESSOA, NO_PESSOA, NR_CGC, DS_OBSERV, CD_UF'
      'from FI_PESSOA_JURIDICA f, FI_ENTIDADE_PREVIDENCIA p'
      'where f.CD_PESSOA = p.CD_PESSOA_ENTID'
      'order by NO_PESSOA')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 258
    Top = 46
    object QryPrincipalCD_PESSOA: TFloatField
      DisplayLabel = 'Código da Entidade'
      DisplayWidth = 10
      FieldName = 'CD_PESSOA'
      Origin = '"CM.FI_PESSOA_JURIDICA".CD_PESSOA'
      Visible = False
    end
    object QryPrincipalNO_PESSOA: TStringField
      DisplayLabel = 'Nome da Entidade'
      DisplayWidth = 60
      FieldName = 'NO_PESSOA'
      Origin = '"CM.FI_PESSOA_JURIDICA".NO_PESSOA'
      Size = 60
    end
    object QryPrincipalNR_CGC: TStringField
      DisplayLabel = 'CGC da Entidade'
      DisplayWidth = 14
      FieldName = 'NR_CGC'
      Origin = '"CM.FI_PESSOA_JURIDICA".NR_CGC'
      Size = 14
    end
    object QryPrincipalDS_OBSERV: TMemoField
      DisplayLabel = 'Observações'
      DisplayWidth = 10
      FieldName = 'DS_OBSERV'
      Origin = '"CM.FI_PESSOA_JURIDICA".DS_OBSERV'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
    object QryPrincipalCD_UF: TStringField
      DisplayLabel = 'UF'
      DisplayWidth = 2
      FieldName = 'CD_UF'
      Origin = '"CM.FI_PESSOA_JURIDICA".CD_UF'
      Visible = False
      Size = 2
    end
  end
  object qryEntid: TwwQuery
    CachedUpdates = True
    BeforePost = qryEntidBeforePost
    AfterPost = qryEntidAfterPost
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select CD_PESSOA_ENTID'
      'from FI_ENTIDADE_PREVIDENCIA'
      'where CD_PESSOA_ENTID = :CD_PESSOA')
    UpdateObject = UpdtSQLEntid
    ValidateWithMask = True
    Left = 258
    Top = 74
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
    object qryEntidCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'FI_ENTIDADE_PREVIDENCIA.CD_PESSOA_ENTID'
    end
  end
  object dsEntid: TwwDataSource
    AutoEdit = False
    DataSet = qryEntid
    Left = 291
    Top = 74
  end
  object UpdtSQLEntid: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_ENTIDADE_PREVIDENCIA'
      'set'
      '  CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      'where'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID')
    InsertSQL.Strings = (
      'insert into FI_ENTIDADE_PREVIDENCIA'
      '  (CD_PESSOA_ENTID)'
      'values'
      '  (:CD_PESSOA_ENTID)')
    DeleteSQL.Strings = (
      'delete from FI_ENTIDADE_PREVIDENCIA'
      'where'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID')
    Left = 325
    Top = 74
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_PESSOA_JURIDICA'
      'set'
      '  NO_PESSOA = :NO_PESSOA,'
      '  NR_CGC = :NR_CGC,'
      '  DS_OBSERV = :DS_OBSERV'
      'where'
      '  CD_PESSOA = :OLD_CD_PESSOA')
    InsertSQL.Strings = (
      'insert into FI_PESSOA_JURIDICA'
      '  (CD_PESSOA, NO_PESSOA, NR_CGC, DS_OBSERV)'
      'values'
      '  (:CD_PESSOA, :NO_PESSOA, :NR_CGC, :DS_OBSERV)')
    DeleteSQL.Strings = (
      'delete from FI_PESSOA_JURIDICA'
      'where'
      '  CD_PESSOA = :OLD_CD_PESSOA')
    Left = 325
    Top = 47
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_PESSOA) as Max_CD'
      'from FI_PESSOA_JURIDICA')
    ValidateWithMask = True
    Left = 374
    Top = 12
  end
  object qryContatos: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select CD_PESSOA_CONTATO, NO_PESSOA_CONTATO'
      'from FI_CONTATO_PESSOA_JURIDICA'
      'where CD_PESSOA_CONTATO = :CD_PESSOA')
    ValidateWithMask = True
    Left = 374
    Top = 53
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select NO_PLANO'
      'from FI_PLANO_PATRONAL'
      'where CD_PESSOA_ENTID = :CD_PESSOA')
    ValidateWithMask = True
    Left = 374
    Top = 91
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
      end>
  end
end
