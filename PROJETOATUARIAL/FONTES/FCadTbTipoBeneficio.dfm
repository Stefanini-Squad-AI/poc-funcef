inherited frmCadTbTipoBeneficio: TfrmCadTbTipoBeneficio
  Left = 485
  Top = 341
  HelpContext = 40187
  Caption = 'Tipo de Benefício'
  ClientHeight = 226
  ClientWidth = 492
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 492
    Height = 140
    object Label1: TLabel
      Left = 20
      Top = 81
      Width = 103
      Height = 13
      Caption = 'Tipo de Benefício'
      FocusControl = DBEdit2
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
    object Label2: TLabel
      Left = 20
      Top = 40
      Width = 29
      Height = 13
      Caption = 'Sigla'
      FocusControl = DBEdit1
    end
    object DBEdit2: TDBEdit
      Left = 20
      Top = 96
      Width = 405
      Height = 21
      AutoSelect = False
      DataField = 'DS_TIPO_BENEF'
      DataSource = ds
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 341
      Top = 26
      Width = 84
      Height = 21
      Color = clSilver
      DataField = 'CD_TIPO_BENEF'
      DataSource = ds
      Enabled = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit1: TDBEdit
      Left = 20
      Top = 55
      Width = 116
      Height = 21
      AutoSelect = False
      DataField = 'SG_TIPO_BENEF'
      DataSource = ds
      TabOrder = 0
    end
  end
  inherited Dock972: TDock97
    Width = 492
  end
  inherited Dock971: TDock97
    Top = 187
    Width = 492
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
    Left = 261
    Top = 88
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
    AfterDelete = QryPrincipalAfterDelete
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CD_TIPO_BENEF, SG_TIPO_BENEF, DS_TIPO_BENEF'
      'from FI_TIPO_BENEFICIO'
      'order by DS_TIPO_BENEF')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 225
    Top = 88
    object QryPrincipalDS_TIPO_BENEF: TStringField
      DisplayLabel = 'Tipo de Benefício'
      DisplayWidth = 60
      FieldName = 'DS_TIPO_BENEF'
      Origin = 'FI_TIPO_BENEFICIO.DS_TIPO_BENEF'
      Size = 60
    end
    object QryPrincipalCD_TIPO_BENEF: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_TIPO_BENEF'
      Origin = 'FI_TIPO_BENEFICIO.CD_TIPO_BENEF'
      Visible = False
    end
    object QryPrincipalSG_TIPO_BENEF: TStringField
      DisplayWidth = 5
      FieldName = 'SG_TIPO_BENEF'
      Origin = 'FI_TIPO_BENEFICIO.SG_TIPO_BENEF'
      Visible = False
      Size = 5
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_TIPO_BENEFICIO'
      'set'
      '  SG_TIPO_BENEF = :SG_TIPO_BENEF,'
      '  DS_TIPO_BENEF = :DS_TIPO_BENEF'
      'where'
      '  CD_TIPO_BENEF = :OLD_CD_TIPO_BENEF')
    InsertSQL.Strings = (
      'insert into FI_TIPO_BENEFICIO'
      '  (CD_TIPO_BENEF, SG_TIPO_BENEF, DS_TIPO_BENEF)'
      'values'
      '  (:CD_TIPO_BENEF, :SG_TIPO_BENEF, :DS_TIPO_BENEF)')
    DeleteSQL.Strings = (
      'delete from FI_TIPO_BENEFICIO'
      'where'
      '  CD_TIPO_BENEF = :OLD_CD_TIPO_BENEF')
    Left = 295
    Top = 87
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_TIPO_BENEF) as Max_CD'
      'from FI_TIPO_BENEFICIO')
    ValidateWithMask = True
    Left = 319
    Top = 12
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_TIPO_BENEFICIO.DS_TIPO_BENEF')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo do Benefício')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'FI_TIPO_BENEFICIO')
    CamposChave.Strings = (
      'FI_TIPO_BENEFICIO.CD_TIPO_BENEF')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 208
    Top = 55
  end
end
