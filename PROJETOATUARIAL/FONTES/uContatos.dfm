inherited frmContatos: TfrmContatos
  Left = 240
  Top = 94
  Caption = 'Contatos'
  ClientHeight = 448
  ClientWidth = 466
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 466
    Height = 362
    object Label1: TLabel
      Left = 20
      Top = 10
      Width = 33
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit6
    end
    object Label6: TLabel
      Left = 20
      Top = 50
      Width = 34
      Height = 13
      Caption = 'Cargo'
      FocusControl = DBEdit1
    end
    object Label9: TLabel
      Left = 20
      Top = 175
      Width = 75
      Height = 13
      Caption = 'Observações'
    end
    object Label4: TLabel
      Left = 20
      Top = 133
      Width = 121
      Height = 13
      Caption = 'Telefone Residencial'
      FocusControl = DBEdit8
    end
    object Label11: TLabel
      Left = 168
      Top = 133
      Width = 94
      Height = 13
      Caption = 'Telefone Celular'
      FocusControl = DBEdit11
    end
    object Label12: TLabel
      Left = 20
      Top = 91
      Width = 121
      Height = 13
      Caption = 'Telefone Comercial 1'
      FocusControl = DBEdit12
    end
    object Label10: TLabel
      Left = 168
      Top = 91
      Width = 121
      Height = 13
      Caption = 'Telefone Comercial 2'
      FocusControl = DBEdit5
    end
    object Label2: TLabel
      Left = 315
      Top = 91
      Width = 24
      Height = 13
      Caption = 'FAX'
      FocusControl = DBEdit2
    end
    object DBEdit6: TDBEdit
      Left = 20
      Top = 25
      Width = 425
      Height = 21
      AutoSelect = False
      DataField = 'NO_PESSOA_CONTATO'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit1: TDBEdit
      Left = 20
      Top = 65
      Width = 425
      Height = 21
      AutoSelect = False
      DataField = 'DS_CARGO'
      DataSource = ds
      TabOrder = 1
    end
    object DBEdit8: TDBEdit
      Left = 20
      Top = 148
      Width = 131
      Height = 21
      AutoSelect = False
      DataField = 'NR_FONE_RES'
      DataSource = ds
      TabOrder = 5
    end
    object DBEdit11: TDBEdit
      Left = 168
      Top = 148
      Width = 131
      Height = 21
      AutoSelect = False
      DataField = 'NR_CELULAR'
      DataSource = ds
      TabOrder = 6
    end
    object DBEdit12: TDBEdit
      Left = 20
      Top = 106
      Width = 131
      Height = 21
      AutoSelect = False
      DataField = 'NR_FONE_TRAB_1'
      DataSource = ds
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 168
      Top = 106
      Width = 131
      Height = 21
      AutoSelect = False
      DataField = 'NR_FONE_TRAB_2'
      DataSource = ds
      TabOrder = 3
    end
    object DBMemo1: TDBMemo
      Left = 20
      Top = 190
      Width = 427
      Height = 157
      DataField = 'DS_OBSERV'
      DataSource = ds
      ScrollBars = ssBoth
      TabOrder = 7
    end
    object DBEdit2: TDBEdit
      Left = 315
      Top = 106
      Width = 131
      Height = 21
      AutoSelect = False
      DataField = 'NR_FAX'
      DataSource = ds
      TabOrder = 4
    end
  end
  inherited Dock971: TDock97
    Top = 409
    Width = 466
    inherited tb97Fundo: TToolbar97
      Left = 296
      DockPos = 296
      TabOrder = 2
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 128
      DockPos = 128
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 466
  end
  inherited ds: TwwDataSource
    DataSet = QryPrincipal
    Left = 291
    Top = 48
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 293
    Top = 12
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 333
    Top = 13
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(SQ_PESSOA_CONTATO) as Max_CD'
      'from FI_CONTATO_PESSOA_JURIDICA'
      'where CD_PESSOA_CONTATO = :CD')
    Params.Data = {0100010002434400030400000000000000}
    ValidateWithMask = True
    Left = 374
    Top = 12
  end
  object QryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = QryPrincipalAfterOpen
    BeforePost = QryPrincipalBeforePost
    AfterPost = QryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CD_PESSOA_CONTATO, SQ_PESSOA_CONTATO,'
      '       NO_PESSOA_CONTATO, DS_CARGO, NR_FONE_TRAB_1,'
      '       NR_FONE_TRAB_2, NR_FONE_RES, NR_CELULAR, NR_FAX,'
      '       DS_OBSERV'
      'from FI_CONTATO_PESSOA_JURIDICA'
      'where CD_PESSOA_CONTATO = :CD       '
      'order by NO_PESSOA_CONTATO')
    Params.Data = {0100010002434400030400000000000000}
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 258
    Top = 46
    object QryPrincipalNO_PESSOA_CONTATO: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 40
      FieldName = 'NO_PESSOA_CONTATO'
      Origin = 'FI_CONTATO_PESSOA_JURIDICA.NO_PESSOA_CONTATO'
      Size = 60
    end
    object QryPrincipalDS_CARGO: TStringField
      DisplayLabel = 'Cargo'
      DisplayWidth = 20
      FieldName = 'DS_CARGO'
      Origin = 'FI_CONTATO_PESSOA_JURIDICA.DS_CARGO'
      Size = 60
    end
    object QryPrincipalCD_PESSOA_CONTATO: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PESSOA_CONTATO'
      Origin = 'FI_CONTATO_PESSOA_JURIDICA.CD_PESSOA_CONTATO'
      Visible = False
    end
    object QryPrincipalSQ_PESSOA_CONTATO: TFloatField
      DisplayWidth = 10
      FieldName = 'SQ_PESSOA_CONTATO'
      Origin = 'FI_CONTATO_PESSOA_JURIDICA.SQ_PESSOA_CONTATO'
      Visible = False
    end
    object QryPrincipalNR_FONE_TRAB_1: TStringField
      DisplayWidth = 14
      FieldName = 'NR_FONE_TRAB_1'
      Origin = 'FI_CONTATO_PESSOA_JURIDICA.NR_FONE_TRAB_1'
      Visible = False
      Size = 14
    end
    object QryPrincipalNR_FONE_TRAB_2: TStringField
      DisplayWidth = 14
      FieldName = 'NR_FONE_TRAB_2'
      Origin = 'FI_CONTATO_PESSOA_JURIDICA.NR_FONE_TRAB_2'
      Visible = False
      Size = 14
    end
    object QryPrincipalNR_FONE_RES: TStringField
      DisplayWidth = 14
      FieldName = 'NR_FONE_RES'
      Origin = 'FI_CONTATO_PESSOA_JURIDICA.NR_FONE_RES'
      Visible = False
      Size = 14
    end
    object QryPrincipalNR_CELULAR: TStringField
      DisplayWidth = 14
      FieldName = 'NR_CELULAR'
      Origin = 'FI_CONTATO_PESSOA_JURIDICA.NR_CELULAR'
      Visible = False
      Size = 14
    end
    object QryPrincipalNR_FAX: TStringField
      DisplayWidth = 14
      FieldName = 'NR_FAX'
      Origin = 'FI_CONTATO_PESSOA_JURIDICA.NR_FAX'
      Visible = False
      Size = 14
    end
    object QryPrincipalDS_OBSERV: TMemoField
      DisplayWidth = 10
      FieldName = 'DS_OBSERV'
      Origin = 'FI_CONTATO_PESSOA_JURIDICA.DS_OBSERV'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_CONTATO_PESSOA_JURIDICA'
      'set'
      '  NO_PESSOA_CONTATO = :NO_PESSOA_CONTATO,'
      '  DS_CARGO = :DS_CARGO,'
      '  NR_FONE_TRAB_1 = :NR_FONE_TRAB_1,'
      '  NR_FONE_TRAB_2 = :NR_FONE_TRAB_2,'
      '  NR_FONE_RES = :NR_FONE_RES,'
      '  NR_CELULAR = :NR_CELULAR,'
      '  NR_FAX = :NR_FAX,'
      '  DS_OBSERV = :DS_OBSERV'
      'where'
      '  CD_PESSOA_CONTATO = :OLD_CD_PESSOA_CONTATO and'
      '  SQ_PESSOA_CONTATO = :OLD_SQ_PESSOA_CONTATO')
    InsertSQL.Strings = (
      'insert into FI_CONTATO_PESSOA_JURIDICA'
      '  (CD_PESSOA_CONTATO, SQ_PESSOA_CONTATO, NO_PESSOA_CONTATO, '
      '   DS_CARGO, NR_FONE_TRAB_1, NR_FONE_TRAB_2, NR_FONE_RES, '
      '   NR_CELULAR, NR_FAX, DS_OBSERV)'
      'values'
      '  (:CD_PESSOA_CONTATO, :SQ_PESSOA_CONTATO, :NO_PESSOA_CONTATO, '
      '   :DS_CARGO, :NR_FONE_TRAB_1, :NR_FONE_TRAB_2, :NR_FONE_RES, '
      '   :NR_CELULAR, :NR_FAX, :DS_OBSERV)')
    DeleteSQL.Strings = (
      'delete from FI_CONTATO_PESSOA_JURIDICA'
      'where'
      '  CD_PESSOA_CONTATO = :OLD_CD_PESSOA_CONTATO and'
      '  SQ_PESSOA_CONTATO = :OLD_SQ_PESSOA_CONTATO')
    Left = 325
    Top = 47
  end
end
N
