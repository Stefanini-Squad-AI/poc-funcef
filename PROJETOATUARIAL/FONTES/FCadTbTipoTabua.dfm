inherited frmCadTbTipoTabua: TfrmCadTbTipoTabua
  HelpContext = 40195
  Caption = 'Tipo da Tábua'
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
      Width = 84
      Height = 13
      Caption = 'Tipo da Tábua'
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
      DataField = 'DS_TIPO_TABUA'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 341
      Top = 26
      Width = 84
      Height = 21
      Color = clSilver
      DataField = 'CD_TIPO_TABUA'
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
      Hints.Strings = ()
    end
  end
  inherited ds: TwwDataSource
    DataSet = QryPrincipal
    Left = 257
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
      'Select * from FI_TIPO_TABUA'
      'order by DS_TIPO_TABUA')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 223
    Top = 68
    object QryPrincipalDS_TIPO_TABUA: TStringField
      DisplayLabel = 'Tipo de Tábua'
      DisplayWidth = 40
      FieldName = 'DS_TIPO_TABUA'
      Origin = 'FI_TIPO_TABUA.DS_TIPO_TABUA'
      Size = 40
    end
    object QryPrincipalCD_TIPO_TABUA: TFloatField
      DisplayLabel = 'Código do Tipo de Tábua'
      DisplayWidth = 10
      FieldName = 'CD_TIPO_TABUA'
      Origin = 'FI_TIPO_TABUA.CD_TIPO_TABUA'
      Visible = False
    end
    object QryPrincipalIR_DOMINIO_SISTEMA: TStringField
      FieldName = 'IR_DOMINIO_SISTEMA'
      Origin = '"CM.FI_TIPO_TABUA".IR_DOMINIO_SISTEMA'
      Size = 3
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_TIPO_TABUA'
      'set'
      '  DS_TIPO_TABUA = :DS_TIPO_TABUA'
      'where'
      '  CD_TIPO_TABUA = :OLD_CD_TIPO_TABUA ')
    InsertSQL.Strings = (
      'insert into FI_TIPO_TABUA'
      '  (CD_TIPO_TABUA, DS_TIPO_TABUA)'
      'values'
      '  (:CD_TIPO_TABUA, :DS_TIPO_TABUA)')
    DeleteSQL.Strings = (
      'delete from FI_TIPO_TABUA'
      'where'
      '  CD_TIPO_TABUA = :OLD_CD_TIPO_TABUA')
    Left = 290
    Top = 67
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_TIPO_TABUA) as Max_CD'
      'from FI_TIPO_TABUA')
    ValidateWithMask = True
    Left = 319
    Top = 12
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_TIPO_TABUA.DS_TIPO_TABUA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'FI_TIPO_TABUA')
    CamposChave.Strings = (
      'FI_TIPO_TABUA.CD_TIPO_TABUA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 192
    Top = 63
  end
end
