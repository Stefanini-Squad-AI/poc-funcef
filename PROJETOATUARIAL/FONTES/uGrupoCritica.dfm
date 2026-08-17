inherited frmGrupoCritica: TfrmGrupoCritica
  Left = 180
  Top = 121
  Caption = 'Grupo Crítica'
  ClientHeight = 340
  ClientWidth = 444
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 444
    Height = 254
    object Label1: TLabel
      Left = 24
      Top = 14
      Width = 37
      Height = 13
      Caption = 'Ordem'
    end
    object Label2: TLabel
      Left = 24
      Top = 54
      Width = 125
      Height = 13
      Caption = 'Grupo do Participante'
    end
    object Label3: TLabel
      Left = 24
      Top = 95
      Width = 164
      Height = 13
      Caption = 'Condição do Enquadramento'
    end
    object DBEdit2: TDBEdit
      Left = 24
      Top = 28
      Width = 58
      Height = 21
      DataField = 'NR_ORDEM'
      DataSource = ds
      TabOrder = 0
    end
    object DBMemocondicao: TDBMemo
      Left = 24
      Top = 110
      Width = 396
      Height = 126
      Hint = 'Condição de Enquadramento do Participante'
      Color = clSilver
      DataField = 'DS_CONDICAO_EQUADRAMENTO'
      DataSource = dsCondicao
      ParentShowHint = False
      ReadOnly = True
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 2
    end
    object DBEdit1: TDBEdit
      Left = 34
      Top = 68
      Width = 371
      Height = 21
      DataField = 'NO_GRUPO_PARTIC'
      DataSource = ds
      TabOrder = 3
    end
    object DBLkTipoGrupo: TwwDBLookupCombo
      Left = 24
      Top = 68
      Width = 375
      Height = 21
      Hint = 'Grupo de Enquadramento do Participante'
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NO_GRUPO_PARTIC'#9'40'#9'Grupo de Cálculo')
      LookupTable = qryTipoGrupoPartic
      LookupField = 'CD_GRUPO_PARTIC'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Visible = False
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = DBLkTipoGrupoChange
    end
  end
  inherited Dock972: TDock97
    Width = 444
  end
  inherited Dock971: TDock97
    Top = 301
    Width = 444
    inherited tb97Fundo: TToolbar97
      Left = 269
      DockPos = 269
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 100
      DockPos = 100
    end
    inherited dbnav: TDBNavigator
      Left = 40
      Hints.Strings = ()
      OnClick = dbnavClick
    end
  end
  inherited ds: TwwDataSource
    DataSet = qryPrincipal
    Left = 311
    Top = 13
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 408
    Top = 7
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 438
    Top = 8
  end
  object qryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = qryPrincipalAfterOpen
    BeforePost = qryPrincipalBeforePost
    AfterPost = qryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select a.*, b.NO_GRUPO_PARTIC'
      'from FI_GRUPO_CRITICA a, FI_GRUPO_PARTICIPANTE b'
      'where a.CD_GRUPO_PARTIC = b.CD_GRUPO_PARTIC'
      '  and a.CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '  and a.CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '  and a.CD_PLANO = :CD_PLANO'
      'order by NR_ORDEM')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 280
    Top = 13
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    object qryPrincipalNO_GRUPO_PARTIC: TStringField
      DisplayLabel = 'Grupo do Participante'
      DisplayWidth = 60
      FieldName = 'NO_GRUPO_PARTIC'
      Origin = '"CM.FI_GRUPO_PARTICIPANTE".NO_GRUPO_PARTIC'
      Size = 60
    end
    object qryPrincipalNR_ORDEM: TFloatField
      DisplayLabel = 'Ordem'
      DisplayWidth = 10
      FieldName = 'NR_ORDEM'
      Origin = 'FI_GRUPO_CRITICA.NR_ORDEM'
    end
    object qryPrincipalCD_GRUPO_PARTIC: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_GRUPO_PARTIC'
      Origin = 'FI_GRUPO_CRITICA.CD_GRUPO_PARTIC'
      Visible = False
    end
    object qryPrincipalCD_PESSOA_PATROC: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'FI_GRUPO_CRITICA.CD_PESSOA_PATROC'
      Visible = False
    end
    object qryPrincipalCD_PESSOA_ENTID: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'FI_GRUPO_CRITICA.CD_PESSOA_ENTID'
      Visible = False
    end
    object qryPrincipalCD_PLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PLANO'
      Origin = 'FI_GRUPO_CRITICA.CD_PLANO'
      Visible = False
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_GRUPO_CRITICA'
      'set'
      '  NR_ORDEM = :NR_ORDEM'
      'where'
      '  CD_GRUPO_PARTIC = :OLD_CD_GRUPO_PARTIC and'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID and'
      '  CD_PLANO = :OLD_CD_PLANO')
    InsertSQL.Strings = (
      'insert into FI_GRUPO_CRITICA'
      
        '  (CD_GRUPO_PARTIC, CD_PESSOA_PATROC, CD_PESSOA_ENTID, CD_PLANO,' +
        ' '
      '   NR_ORDEM)'
      'values'
      '  (:CD_GRUPO_PARTIC, :CD_PESSOA_PATROC, :CD_PESSOA_ENTID, '
      '   :CD_PLANO, :NR_ORDEM)')
    DeleteSQL.Strings = (
      'delete from FI_GRUPO_CRITICA'
      'where'
      '  CD_GRUPO_PARTIC = :OLD_CD_GRUPO_PARTIC and'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID and'
      '  CD_PLANO = :OLD_CD_PLANO')
    Left = 343
    Top = 13
  end
  object qryTipoGrupoPartic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select *'
      'from FI_GRUPO_PARTICIPANTE'
      'order by NO_GRUPO_PARTIC')
    ValidateWithMask = True
    Left = 307
    Top = 112
    object qryTipoGrupoParticNO_GRUPO_PARTIC: TStringField
      DisplayLabel = 'Grupo de Cálculo'
      DisplayWidth = 40
      FieldName = 'NO_GRUPO_PARTIC'
      Origin = '"CM.FI_GRUPO_PARTICIPANTE".NO_GRUPO_PARTIC'
      Size = 60
    end
    object qryTipoGrupoParticCD_GRUPO_PARTIC: TFloatField
      FieldName = 'CD_GRUPO_PARTIC'
      Origin = '"CM.FI_GRUPO_PARTICIPANTE".CD_GRUPO_PARTIC'
      Visible = False
    end
    object qryTipoGrupoParticDS_CONDICAO_EQUADRAMENTO: TMemoField
      FieldName = 'DS_CONDICAO_EQUADRAMENTO'
      Origin = '"CM.FI_GRUPO_PARTICIPANTE".DS_CONDICAO_EQUADRAMENTO'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
    object qryTipoGrupoParticDS_SQL_ENQUADRAMENTO: TMemoField
      FieldName = 'DS_SQL_ENQUADRAMENTO'
      Origin = '"CM.FI_GRUPO_PARTICIPANTE".DS_SQL_ENQUADRAMENTO'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
  end
  object dsTipoGrupoPartic: TDataSource
    DataSet = qryTipoGrupoPartic
    Left = 340
    Top = 112
  end
  object qryCondicao: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsTipoGrupoPartic
    SQL.Strings = (
      'Select DS_CONDICAO_EQUADRAMENTO'
      'from FI_GRUPO_PARTICIPANTE'
      'where cd_GRUPO_PARTIC = :CD_GRUPO_PARTIC')
    ValidateWithMask = True
    Left = 307
    Top = 182
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_PARTIC'
        ParamType = ptUnknown
      end>
    object qryCondicaoDS_CONDICAO_EQUADRAMENTO: TMemoField
      FieldName = 'DS_CONDICAO_EQUADRAMENTO'
      Origin = '"CM.FI_GRUPO_PARTICIPANTE".DS_CONDICAO_EQUADRAMENTO'
      BlobType = ftMemo
      Size = 2000
    end
  end
  object dsCondicao: TDataSource
    DataSet = qryCondicao
    Left = 335
    Top = 182
  end
end
