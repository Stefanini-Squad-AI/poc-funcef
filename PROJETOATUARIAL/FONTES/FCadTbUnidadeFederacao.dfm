inherited frmCadTbUnidadeFederacao: TfrmCadTbUnidadeFederacao
  HelpContext = 40205
  Caption = 'Unidade da Federação'
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
      Width = 130
      Height = 13
      Caption = 'Unidade da Federação'
      FocusControl = DBEdit2
    end
    object Label6: TLabel
      Left = 396
      Top = 11
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sigla'
      FocusControl = DBEdit1
    end
    object DBEdit2: TDBEdit
      Left = 20
      Top = 50
      Width = 405
      Height = 21
      AutoSelect = False
      DataField = 'DS_UF'
      DataSource = ds
      TabOrder = 1
    end
    object DBEdit1: TDBEdit
      Left = 341
      Top = 26
      Width = 84
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      DataField = 'CD_UF'
      DataSource = ds
      TabOrder = 0
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
      Hints.Strings = ()
    end
  end
  inherited ds: TwwDataSource
    DataSet = QryPrincipal
    Left = 256
    Top = 68
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
      'Select CD_UF, DS_UF'
      'from FI_UF'
      'order by DS_UF')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 223
    Top = 68
    object QryPrincipalDS_UF: TStringField
      DisplayLabel = 'Unidade da Federação'
      DisplayWidth = 20
      FieldName = 'DS_UF'
      Origin = 'FI_UF.DS_UF'
      Size = 40
    end
    object QryPrincipalCD_UF: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 2
      FieldName = 'CD_UF'
      Origin = 'FI_UF.CD_UF'
      Size = 2
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_UF'
      'set'
      '  DS_UF = :DS_UF'
      'where'
      '  CD_UF = :OLD_CD_UF')
    InsertSQL.Strings = (
      'insert into FI_UF'
      '  (CD_UF, DS_UF)'
      'values'
      '  (:CD_UF, :DS_UF)')
    DeleteSQL.Strings = (
      'delete from FI_UF'
      'where'
      '  CD_UF = :OLD_CD_UF ')
    Left = 290
    Top = 67
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_UF.DS_UF')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Unidade da Federação')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'FI_UF')
    CamposChave.Strings = (
      'FI_UF.CD_UF')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 200
    Top = 55
  end
end
