inherited frmCadTbEstadoCivil: TfrmCadTbEstadoCivil
  Left = 242
  Top = 210
  HelpContext = 40159
  Caption = 'Estado Civil'
  ClientHeight = 183
  ClientWidth = 473
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 473
    Height = 97
    object Label1: TLabel
      Left = 20
      Top = 35
      Width = 68
      Height = 13
      Caption = 'Estado Civil'
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
      DataField = 'DS_ESTADO_CIVIL'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 341
      Top = 26
      Width = 84
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      DataField = 'CD_ESTADO_CIVIL'
      DataSource = ds
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 473
  end
  inherited Dock971: TDock97
    Top = 144
    Width = 473
    inherited tb97Fundo: TToolbar97
      Left = 303
      DockPos = 303
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 135
      DockPos = 135
    end
    inherited dbnav: TDBNavigator
      Width = 116
      Hints.Strings = ()
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 13
    Top = 8
  end
  inherited ds: TwwDataSource
    DataSet = QryPrincipal
    Left = 231
    Top = 63
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 258
    Top = 12
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 353
    Top = 13
  end
  object QryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = QryPrincipalAfterOpen
    BeforePost = QryPrincipalBeforePost
    AfterPost = QryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CD_ESTADO_CIVIL, DS_ESTADO_CIVIL'
      'from FI_ESTADO_CIVIL'
      'order by  DS_ESTADO_CIVIL')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 198
    Top = 63
    object QryPrincipalDS_ESTADO_CIVIL: TStringField
      DisplayLabel = 'Estado Civil'
      DisplayWidth = 20
      FieldName = 'DS_ESTADO_CIVIL'
      Origin = 'FI_ESTADO_CIVIL.DS_ESTADO_CIVIL'
    end
    object QryPrincipalCD_ESTADO_CIVIL: TStringField
      DisplayWidth = 1
      FieldName = 'CD_ESTADO_CIVIL'
      Origin = 'FI_ESTADO_CIVIL.CD_ESTADO_CIVIL'
      Visible = False
      Size = 1
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_ESTADO_CIVIL) as Max_CD'
      'from FI_ESTADO_CIVIL')
    ValidateWithMask = True
    Left = 314
    Top = 12
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_ESTADO_CIVIL'
      'set'
      '  DS_ESTADO_CIVIL = :DS_ESTADO_CIVIL'
      'where'
      '  CD_ESTADO_CIVIL = :OLD_CD_ESTADO_CIVIL')
    InsertSQL.Strings = (
      'insert into FI_ESTADO_CIVIL'
      '  (CD_ESTADO_CIVIL, DS_ESTADO_CIVIL)'
      'values'
      '  (:CD_ESTADO_CIVIL, :DS_ESTADO_CIVIL)')
    DeleteSQL.Strings = (
      'delete from FI_ESTADO_CIVIL'
      'where'
      '  CD_ESTADO_CIVIL = :OLD_CD_ESTADO_CIVIL')
    Left = 265
    Top = 62
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_ESTADO_CIVIL.DS_ESTADO_CIVIL')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Estado Civil')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'FI_ESTADO_CIVIL')
    CamposChave.Strings = (
      'FI_ESTADO_CIVIL.CD_ESTADO_CIVIL')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '20')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 128
    Top = 55
  end
end
