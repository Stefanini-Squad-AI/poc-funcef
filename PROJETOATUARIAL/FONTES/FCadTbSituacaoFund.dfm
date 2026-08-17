inherited frmCadTbSituacaoFund: TfrmCadTbSituacaoFund
  Left = 165
  Top = 252
  HelpContext = 40175
  ActiveControl = DBEdit1
  Caption = 'Situação na Fundação'
  ClientHeight = 177
  ClientWidth = 446
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 446
    Height = 91
    object Label6: TLabel
      Left = 385
      Top = 11
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Código'
      FocusControl = DBEdit3
    end
    object Label1: TLabel
      Left = 20
      Top = 35
      Width = 51
      Height = 13
      Caption = 'Situação'
      FocusControl = DBEdit1
    end
    object DBEdit3: TDBEdit
      Left = 341
      Top = 26
      Width = 84
      Height = 21
      Color = clSilver
      DataField = 'CD_SITUACAO_FUNDACAO'
      DataSource = ds
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit1: TDBEdit
      Left = 20
      Top = 50
      Width = 405
      Height = 21
      AutoSelect = False
      DataField = 'DS_SITUACAO_FUNDACAO'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 446
  end
  inherited Dock971: TDock97
    Top = 138
    Width = 446
    inherited tb97Fundo: TToolbar97
      Left = 276
      DockPos = 276
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 108
      DockPos = 108
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
    Left = 383
    Top = 7
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 428
    Top = 8
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_SITUACAO_FUNDACAO) as Max_CD'
      'from FI_SITUACAO_FUNDACAO')
    ValidateWithMask = True
    Left = 319
    Top = 12
  end
  object QryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = QryPrincipalAfterOpen
    BeforePost = QryPrincipalBeforePost
    AfterPost = QryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_SITUACAO_FUNDACAO'
      'order by DS_SITUACAO_FUNDACAO')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 223
    Top = 68
    object QryPrincipalCD_SITUACAO_FUNDACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_SITUACAO_FUNDACAO'
      Origin = 'FI_SITUACAO_FUNDACAO.CD_SITUACAO_FUNDACAO'
      Visible = False
    end
    object QryPrincipalDS_SITUACAO_FUNDACAO: TStringField
      FieldName = 'DS_SITUACAO_FUNDACAO'
      Origin = '"CM.FI_SITUACAO_FUNDACAO".DS_SITUACAO_FUNDACAO'
      Size = 50
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_SITUACAO_FUNDACAO'
      'set'
      '  DS_SITUACAO_FUNDACAO = :DS_SITUACAO_FUNDACAO'
      'where'
      '  CD_SITUACAO_FUNDACAO = :OLD_CD_SITUACAO_FUNDACAO')
    InsertSQL.Strings = (
      'insert into FI_SITUACAO_FUNDACAO'
      '  (CD_SITUACAO_FUNDACAO, DS_SITUACAO_FUNDACAO)'
      'values'
      '  (:CD_SITUACAO_FUNDACAO, :DS_SITUACAO_FUNDACAO)')
    DeleteSQL.Strings = (
      'delete from FI_SITUACAO_FUNDACAO'
      'where'
      '  CD_SITUACAO_FUNDACAO = :OLD_CD_SITUACAO_FUNDACAO')
    Left = 290
    Top = 67
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_SITUACAO_FUNDACAO.DS_SITUACAO_FUNDACAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Situaçao na Fundção')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'FI_SITUACAO_FUNDACAO')
    CamposChave.Strings = (
      'FI_SITUACAO_FUNDACAO.CD_SITUACAO_FUNDACAO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '50')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 208
    Top = 55
  end
end
