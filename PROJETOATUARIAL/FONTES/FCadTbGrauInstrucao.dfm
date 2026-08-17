inherited frmCadTbGrauInstrucao: TfrmCadTbGrauInstrucao
  Left = 217
  Top = 217
  HelpContext = 40162
  Caption = 'Grau de Instrução'
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
      Width = 109
      Height = 13
      Caption = 'Grau de Instituição'
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
      DataField = 'DS_GRAU_INSTRUCAO'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 341
      Top = 26
      Width = 84
      Height = 21
      Color = clSilver
      DataField = 'CD_GRAU_INSTRUCAO'
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
    Left = 241
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
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_GRAU_INSTRUCAO) as Max_CD'
      'from FI_GRAU_INSTRUCAO')
    ValidateWithMask = True
    Left = 319
    Top = 12
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_GRAU_INSTRUCAO'
      'set'
      '  DS_GRAU_INSTRUCAO = :DS_GRAU_INSTRUCAO'
      'where'
      '  CD_GRAU_INSTRUCAO = :OLD_CD_GRAU_INSTRUCAO')
    InsertSQL.Strings = (
      'insert into FI_GRAU_INSTRUCAO'
      '  (CD_GRAU_INSTRUCAO, DS_GRAU_INSTRUCAO)'
      'values'
      '  (:CD_GRAU_INSTRUCAO, :DS_GRAU_INSTRUCAO)')
    DeleteSQL.Strings = (
      'delete from FI_GRAU_INSTRUCAO'
      'where'
      '  CD_GRAU_INSTRUCAO = :OLD_CD_GRAU_INSTRUCAO ')
    Left = 275
    Top = 62
  end
  object QryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = QryPrincipalAfterOpen
    BeforePost = QryPrincipalBeforePost
    AfterPost = QryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CD_GRAU_INSTRUCAO, DS_GRAU_INSTRUCAO'
      'from FI_GRAU_INSTRUCAO'
      'order by DS_GRAU_INSTRUCAO')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 208
    Top = 63
    object QryPrincipalDS_GRAU_INSTRUCAO: TStringField
      DisplayLabel = 'Grau de Instrução'
      DisplayWidth = 30
      FieldName = 'DS_GRAU_INSTRUCAO'
      Origin = 'FI_GRAU_INSTRUCAO.DS_GRAU_INSTRUCAO'
      Size = 30
    end
    object QryPrincipalCD_GRAU_INSTRUCAO: TFloatField
      DisplayLabel = 'Código do Grau de Instrução'
      DisplayWidth = 10
      FieldName = 'CD_GRAU_INSTRUCAO'
      Origin = 'FI_GRAU_INSTRUCAO.CD_GRAU_INSTRUCAO'
      Visible = False
    end
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_GRAU_INSTRUCAO.DS_GRAU_INSTRUCAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Grau de Instrução')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'FI_GRAU_INSTRUCAO')
    CamposChave.Strings = (
      'FI_GRAU_INSTRUCAO.CD_GRAU_INSTRUCAO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 192
    Top = 55
  end
end
