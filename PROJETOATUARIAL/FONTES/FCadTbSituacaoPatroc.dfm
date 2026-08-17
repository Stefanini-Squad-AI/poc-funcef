inherited frmCadTbSituacaoPatroc: TfrmCadTbSituacaoPatroc
  Left = 446
  Top = 409
  HelpContext = 40176
  Caption = 'Situação na Patrocinadora'
  ClientHeight = 177
  ClientWidth = 445
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 445
    Height = 91
    object Label1: TLabel
      Left = 20
      Top = 35
      Width = 51
      Height = 13
      Caption = 'Situação'
      FocusControl = DBEdit1
    end
    object Label6: TLabel
      Left = 385
      Top = 11
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Código'
      FocusControl = DBEdit3
    end
    object DBEdit1: TDBEdit
      Left = 20
      Top = 50
      Width = 405
      Height = 21
      AutoSelect = False
      DataField = 'DS_SITUACAO_PATROC'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 341
      Top = 26
      Width = 84
      Height = 21
      Color = clSilver
      DataField = 'CD_SITUACAO_PATROC'
      DataSource = ds
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 445
  end
  inherited Dock971: TDock97
    Top = 138
    Width = 445
    inherited tb97Fundo: TToolbar97
      Left = 275
      DockPos = 275
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 107
      DockPos = 107
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ds: TwwDataSource
    DataSet = QryPrincipal
    Left = 256
    Top = 68
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 393
    Top = 7
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 428
    Top = 8
  end
  object QryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = QryPrincipalAfterOpen
    BeforePost = QryPrincipalBeforePost
    AfterPost = QryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_SITUACAO_PATROC'
      'order by DS_SITUACAO_PATROC')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 223
    Top = 68
    object QryPrincipalDS_SITUACAO_PATROC: TStringField
      DisplayLabel = 'Situação na Patrocinadora'
      DisplayWidth = 60
      FieldName = 'DS_SITUACAO_PATROC'
      Origin = 'FI_SITUACAO_PATROC.DS_SITUACAO_PATROC'
      Size = 60
    end
    object QryPrincipalCD_SITUACAO_PATROC: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_SITUACAO_PATROC'
      Origin = 'FI_SITUACAO_PATROC.CD_SITUACAO_PATROC'
      Visible = False
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_SITUACAO_PATROC'
      'set'
      '  DS_SITUACAO_PATROC = :DS_SITUACAO_PATROC'
      'where'
      '  CD_SITUACAO_PATROC = :OLD_CD_SITUACAO_PATROC')
    InsertSQL.Strings = (
      'insert into FI_SITUACAO_PATROC'
      '  (CD_SITUACAO_PATROC, DS_SITUACAO_PATROC)'
      'values'
      '  (:CD_SITUACAO_PATROC, :DS_SITUACAO_PATROC)')
    DeleteSQL.Strings = (
      'delete from FI_SITUACAO_PATROC'
      'where'
      '  CD_SITUACAO_PATROC = :OLD_CD_SITUACAO_PATROC')
    Left = 290
    Top = 67
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_SITUACAO_PATROC) as Max_CD'
      'from FI_SITUACAO_PATROC')
    ValidateWithMask = True
    Left = 319
    Top = 12
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_SITUACAO_PATROC.DS_SITUACAO_PATROC')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Situaçao na Patrocinadora')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'FI_SITUACAO_PATROC')
    CamposChave.Strings = (
      'FI_SITUACAO_PATROC.CD_SITUACAO_PATROC')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 192
    Top = 55
  end
end
