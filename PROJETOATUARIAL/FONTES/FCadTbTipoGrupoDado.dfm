inherited frmCadTbTipoGrupoDado: TfrmCadTbTipoGrupoDado
  Left = 146
  Top = 200
  HelpContext = 40140
  Caption = 'Tipos de Grupos de Dados'
  ClientHeight = 223
  ClientWidth = 484
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 484
    Height = 137
    object Label6: TLabel
      Left = 332
      Top = 11
      Width = 143
      Height = 13
      Alignment = taRightJustify
      Caption = 'Código do Tipo do Grupo'
      FocusControl = DBEdit3
    end
    object Label1: TLabel
      Left = 10
      Top = 40
      Width = 161
      Height = 13
      Caption = 'Descrição do Tipo do Grupo'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 10
      Top = 85
      Width = 136
      Height = 13
      Caption = 'Ordem de apresentação'
      FocusControl = DBEdit1
    end
    object DBEdit3: TDBEdit
      Left = 361
      Top = 26
      Width = 84
      Height = 21
      Color = clSilver
      DataField = 'CD_GRUPO'
      DataSource = ds
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit1: TDBEdit
      Left = 10
      Top = 55
      Width = 461
      Height = 21
      AutoSelect = False
      DataField = 'NO_GRUPO'
      DataSource = ds
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 10
      Top = 100
      Width = 51
      Height = 21
      AutoSelect = False
      DataField = 'NR_ORDEM'
      DataSource = ds
      TabOrder = 2
    end
  end
  inherited Dock972: TDock97
    Width = 484
  end
  inherited Dock971: TDock97
    Top = 184
    Width = 484
    inherited tb97Fundo: TToolbar97
      Left = 292
      DockPos = 292
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 124
      DockPos = 124
    end
    inherited dbnav: TDBNavigator
      Left = 4
      Hints.Strings = ()
    end
  end
  inherited ds: TwwDataSource
    DataSet = qryPrincipal
    Left = 246
    Top = 58
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 348
    Top = 7
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 383
    Top = 8
  end
  object qryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = qryPrincipalAfterOpen
    BeforePost = qryPrincipalBeforePost
    AfterPost = qryPrincipalAfterPost
    AfterDelete = qryPrincipalAfterDelete
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM FI_GRUPO_LOGICO'
      'ORDER BY NR_ORDEM')
    UpdateObject = UpdtSQLTipoGrupoDado
    ValidateWithMask = True
    Left = 215
    Top = 57
  end
  object UpdtSQLTipoGrupoDado: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_GRUPO_LOGICO'
      'set'
      '  NO_GRUPO = :NO_GRUPO,'
      '  NR_ORDEM = :NR_ORDEM'
      'where'
      '  CD_GRUPO = :OLD_CD_GRUPO')
    InsertSQL.Strings = (
      'insert into FI_GRUPO_LOGICO'
      '  (CD_GRUPO, NO_GRUPO, NR_ORDEM)'
      'values'
      '  (:CD_GRUPO, :NO_GRUPO, :NR_ORDEM)')
    DeleteSQL.Strings = (
      'delete from FI_GRUPO_LOGICO'
      'where'
      '  CD_GRUPO = :OLD_CD_GRUPO')
    Left = 280
    Top = 57
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_GRUPO) as CD_GRUPO'
      'from FI_GRUPO_LOGICO')
    ValidateWithMask = True
    Left = 309
    Top = 7
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_GRUPO_LOGICO.NO_GRUPO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome do Grupo')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'FI_GRUPO_LOGICO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 184
    Top = 55
  end
end
