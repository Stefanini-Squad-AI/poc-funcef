inherited frmCadTbTipoCategoriaPro: TfrmCadTbTipoCategoriaPro
  HelpContext = 40189
  Caption = 'Tipo de Categoria Profissional'
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
      Width = 171
      Height = 13
      Caption = 'Tipo de Categoria Profissional'
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
      DataField = 'DS_TIPO_CAT_PROF_ESP'
      DataSource = ds
      MaxLength = 30
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 341
      Top = 26
      Width = 84
      Height = 21
      Color = clSilver
      DataField = 'CD_TIPO_CAT_PROF_ESP'
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
      'Select CD_TIPO_CAT_PROF_ESP, DS_TIPO_CAT_PROF_ESP'
      'from FI_TIPO_CATEG_PROF_ESPECIAL'
      'order by DS_TIPO_CAT_PROF_ESP')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 223
    Top = 68
    object QryPrincipalDS_TIPO_CAT_PROF_ESP: TStringField
      DisplayLabel = 'Tipo de Categoria Especial'
      DisplayWidth = 60
      FieldName = 'DS_TIPO_CAT_PROF_ESP'
      Origin = 'FI_TIPO_CATEG_PROF_ESPECIAL.DS_TIPO_CAT_PROF_ESP'
      Size = 60
    end
    object QryPrincipalCD_TIPO_CAT_PROF_ESP: TFloatField
      DisplayLabel = 'Código do Tipo de Categoria Especial'
      DisplayWidth = 10
      FieldName = 'CD_TIPO_CAT_PROF_ESP'
      Origin = 'FI_TIPO_CATEG_PROF_ESPECIAL.CD_TIPO_CAT_PROF_ESP'
      Visible = False
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_TIPO_CATEG_PROF_ESPECIAL'
      'set'
      '  DS_TIPO_CAT_PROF_ESP = :DS_TIPO_CAT_PROF_ESP'
      'where'
      '  CD_TIPO_CAT_PROF_ESP = :OLD_CD_TIPO_CAT_PROF_ESP')
    InsertSQL.Strings = (
      'insert into FI_TIPO_CATEG_PROF_ESPECIAL'
      '  (CD_TIPO_CAT_PROF_ESP, DS_TIPO_CAT_PROF_ESP)'
      'values'
      '  (:CD_TIPO_CAT_PROF_ESP, :DS_TIPO_CAT_PROF_ESP)')
    DeleteSQL.Strings = (
      'delete from FI_TIPO_CATEG_PROF_ESPECIAL'
      'where'
      '  CD_TIPO_CAT_PROF_ESP = :OLD_CD_TIPO_CAT_PROF_ESP')
    Left = 290
    Top = 67
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_TIPO_CAT_PROF_ESP) as Max_CD'
      'from FI_TIPO_CATEG_PROF_ESPECIAL')
    ValidateWithMask = True
    Left = 319
    Top = 12
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_TIPO_CATEG_PROF_ESPECIAL.DS_TIPO_CAT_PROF_ESP')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Categoria Profissional')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'FI_TIPO_CATEG_PROF_ESPECIAL')
    CamposChave.Strings = (
      'FI_TIPO_CATEG_PROF_ESPECIAL.CD_TIPO_CAT_PROF_ESP')
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
