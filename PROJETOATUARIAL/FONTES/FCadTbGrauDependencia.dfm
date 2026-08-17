inherited frmCadTbGrauDependencia: TfrmCadTbGrauDependencia
  Left = 192
  Top = 216
  HelpContext = 40161
  Caption = 'Grau de Dependência'
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
      Width = 125
      Height = 13
      Caption = 'Grau de Dependência'
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
      DataField = 'DS_GRAU_DEPENDENCIA'
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
      DataField = 'CD_GRAU_DEPENDENCIA'
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
      Left = 301
      DockPos = 304
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 132
      DockPos = 135
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
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
      'Select CD_GRAU_DEPENDENCIA, DS_GRAU_DEPENDENCIA'
      'from FI_GRAU_DEPENDENCIA'
      'order by DS_GRAU_DEPENDENCIA')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 198
    Top = 63
    object QryPrincipalCD_GRAU_DEPENDENCIA: TStringField
      FieldName = 'CD_GRAU_DEPENDENCIA'
      Origin = 'BASEDADOS.FI_GRAU_DEPENDENCIA.CD_GRAU_DEPENDENCIA'
      FixedChar = True
      Size = 3
    end
    object QryPrincipalDS_GRAU_DEPENDENCIA: TStringField
      FieldName = 'DS_GRAU_DEPENDENCIA'
      Origin = 'BASEDADOS.FI_GRAU_DEPENDENCIA.DS_GRAU_DEPENDENCIA'
      FixedChar = True
      Size = 30
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_GRAU_DEPENDENCIA'
      'set'
      '  CD_GRAU_DEPENDENCIA = :CD_GRAU_DEPENDENCIA,'
      '  DS_GRAU_DEPENDENCIA = :DS_GRAU_DEPENDENCIA'
      'where'
      '  CD_GRAU_DEPENDENCIA = :OLD_CD_GRAU_DEPENDENCIA')
    InsertSQL.Strings = (
      'insert into FI_GRAU_DEPENDENCIA'
      '  (CD_GRAU_DEPENDENCIA, DS_GRAU_DEPENDENCIA)'
      'values'
      '  (:CD_GRAU_DEPENDENCIA, :DS_GRAU_DEPENDENCIA)')
    DeleteSQL.Strings = (
      'delete from FI_GRAU_DEPENDENCIA'
      'where'
      '  CD_GRAU_DEPENDENCIA = :OLD_CD_GRAU_DEPENDENCIA')
    Left = 265
    Top = 62
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_GRAU_DEPENDENCIA) as Max_CD'
      'from FI_GRAU_DEPENDENCIA')
    ValidateWithMask = True
    Left = 314
    Top = 12
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_GRAU_DEPENDENCIA.DS_GRAU_DEPENDENCIA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      '')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'FI_GRAU_DEPENDENCIA')
    CamposChave.Strings = (
      'FI_GRAU_DEPENDENCIA.CD_GRAU_DEPENDENCIA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 304
    Top = 63
  end
end
