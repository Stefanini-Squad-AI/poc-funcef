inherited frmCadTbTipoValor: TfrmCadTbTipoValor
  Left = 232
  Top = 221
  HelpContext = 40204
  Caption = 'Tipo de Valor'
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
      Width = 77
      Height = 13
      Caption = 'Tipo de Valor'
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
      DataField = 'DS_TIPO_VALOR'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 341
      Top = 26
      Width = 84
      Height = 21
      Color = clSilver
      DataField = 'CD_TIPO_VALOR'
      DataSource = ds
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
      'Select CD_TIPO_VALOR, DS_TIPO_VALOR'
      'from FI_TIPO_VALOR'
      'order by DS_TIPO_VALOR')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 223
    Top = 68
    object QryPrincipalDS_TIPO_VALOR: TStringField
      DisplayLabel = 'Tipo de Valor'
      DisplayWidth = 60
      FieldName = 'DS_TIPO_VALOR'
      Origin = 'FI_TIPO_VALOR.DS_TIPO_VALOR'
      Size = 60
    end
    object QryPrincipalCD_TIPO_VALOR: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_TIPO_VALOR'
      Origin = 'FI_TIPO_VALOR.CD_TIPO_VALOR'
      Visible = False
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_TIPO_VALOR'
      'set'
      '  CD_TIPO_VALOR = :CD_TIPO_VALOR,'
      '  DS_TIPO_VALOR = :DS_TIPO_VALOR'
      'where'
      '  CD_TIPO_VALOR = :OLD_CD_TIPO_VALOR')
    InsertSQL.Strings = (
      'insert into FI_TIPO_VALOR'
      '  (CD_TIPO_VALOR, DS_TIPO_VALOR)'
      'values'
      '  (:CD_TIPO_VALOR, :DS_TIPO_VALOR)')
    DeleteSQL.Strings = (
      'delete from FI_TIPO_VALOR'
      'where'
      '  CD_TIPO_VALOR = :OLD_CD_TIPO_VALOR')
    Left = 290
    Top = 67
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_TIPO_VALOR) as Max_CD'
      'from FI_TIPO_VALOR')
    ValidateWithMask = True
    Left = 319
    Top = 12
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_TIPO_VALOR.DS_TIPO_VALOR')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo de Valor')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'FI_TIPO_VALOR')
    CamposChave.Strings = (
      'FI_TIPO_VALOR.CD_TIPO_VALOR')
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
    Top = 63
  end
end
