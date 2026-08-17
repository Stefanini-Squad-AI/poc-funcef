inherited frmComposicaoCalculo: TfrmComposicaoCalculo
  Left = 269
  Top = 163
  ActiveControl = DBEdit4
  Caption = 'Composição de Cálculo'
  ClientHeight = 413
  ClientWidth = 443
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 443
    Height = 327
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
    object Label4: TLabel
      Left = 24
      Top = 241
      Width = 103
      Height = 13
      Caption = 'Tipo de Benefício'
    end
    object Label5: TLabel
      Left = 24
      Top = 278
      Width = 102
      Height = 13
      Caption = 'Rotina de Cálculo'
      Visible = False
    end
    object Label3: TLabel
      Left = 24
      Top = 95
      Width = 164
      Height = 13
      Caption = 'Condição do Enquadramento'
    end
    object DBEdit1: TDBEdit
      Left = 24
      Top = 68
      Width = 371
      Height = 21
      DataField = 'NO_GRUPO_PARTIC'
      DataSource = ds
      TabOrder = 3
    end
    object DBEdit2: TDBEdit
      Left = 24
      Top = 255
      Width = 370
      Height = 21
      DataField = 'DS_TIPO_BENEF'
      DataSource = dsBeneficio
      TabOrder = 4
    end
    object DBEdit3: TDBEdit
      Left = 24
      Top = 292
      Width = 371
      Height = 21
      TabOrder = 5
      Visible = False
    end
    object wwDBLkpCmbRotinaCalc: TwwDBLookupCombo
      Left = 24
      Top = 292
      Width = 366
      Height = 21
      Hint = 'Rotina de cálculo associada ao Grupo / Benefício do Participante'
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_GRUPO_FORMULA'#9'40'#9'Rotina de Cálculo')
      LookupTable = wwQryRotCalculo
      LookupField = 'CD_GRUPO_FORMULA'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Visible = False
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object wwDBLKpCmbTipoBenef: TwwDBLookupCombo
      Left = 24
      Top = 255
      Width = 365
      Height = 21
      Hint = 'Tipo de Benefício associado ao Grupo do Participante'
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_TIPO_BENEF'#9'40'#9'Tipo de Benefício')
      LookupTable = wwQryTipoBenef
      LookupField = 'CD_TIPO_BENEF'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Visible = False
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object wwDBLkpCmbTipoGrupo: TwwDBLookupCombo
      Left = 24
      Top = 68
      Width = 366
      Height = 21
      Hint = 'Grupo de Enquadramento do Participante'
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NO_GRUPO_PARTIC'#9'40'#9'Grupo de Cálculo')
      LookupTable = wwqryTipoGrupoPartic
      LookupField = 'CD_GRUPO_PARTIC'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = False
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = wwDBLkpCmbTipoGrupoChange
    end
    object DBEdit4: TDBEdit
      Left = 24
      Top = 28
      Width = 58
      Height = 21
      DataField = 'NR_ORDEM'
      DataSource = ds
      TabOrder = 6
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
      TabOrder = 7
    end
  end
  inherited Dock972: TDock97
    Width = 443
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 16
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 31
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 91
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 16
        Width = 15
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 374
    Width = 443
    inherited tb97Fundo: TToolbar97
      Left = 271
      DockPos = 274
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 102
      DockPos = 105
    end
    inherited dbnav: TDBNavigator
      Left = 13
      Hints.Strings = ()
      OnClick = dbnavClick
    end
  end
  inherited ds: TwwDataSource
    DataSet = wwqryGrupoPartic
    Left = 281
    Top = 11
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 388
    Top = 7
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    DataSet = wwqryGrupoPartic
    Left = 418
    Top = 8
  end
  object wwqryGrupoPartic: TwwQuery
    CachedUpdates = True
    AfterOpen = wwqryGrupoParticAfterOpen
    BeforePost = wwqryGrupoParticBeforePost
    AfterPost = wwqryGrupoParticAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select a.*, b.NO_GRUPO_PARTIC'
      'from FI_GRUPO_CALCULO a, FI_GRUPO_PARTICIPANTE b'
      'where a.CD_GRUPO_PARTIC = b.CD_GRUPO_PARTIC'
      '  and a.CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '  and a.CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '  and a.CD_PLANO = :CD_PLANO'
      'order by NR_ORDEM')
    UpdateObject = UpdtSQLGrupoPartic
    ValidateWithMask = True
    Left = 251
    Top = 11
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
    object wwqryGrupoParticNO_GRUPO_PARTIC: TStringField
      DisplayLabel = 'Grupo de Participantes'
      DisplayWidth = 60
      FieldName = 'NO_GRUPO_PARTIC'
      Origin = 'FI_GRUPO_PARTICIPANTE.NO_GRUPO_PARTIC'
      Size = 60
    end
    object wwqryGrupoParticNR_ORDEM: TFloatField
      DisplayLabel = 'Ordem'
      DisplayWidth = 10
      FieldName = 'NR_ORDEM'
      Origin = 'FI_GRUPO_CALCULO.NR_ORDEM'
    end
    object wwqryGrupoParticCD_GRUPO_PARTIC: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_GRUPO_PARTIC'
      Origin = 'FI_GRUPO_CALCULO.CD_GRUPO_PARTIC'
      Visible = False
    end
    object wwqryGrupoParticCD_PESSOA_PATROC: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'FI_GRUPO_CALCULO.CD_PESSOA_PATROC'
      Visible = False
    end
    object wwqryGrupoParticCD_PESSOA_ENTID: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'FI_GRUPO_CALCULO.CD_PESSOA_ENTID'
      Visible = False
    end
    object wwqryGrupoParticCD_PLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PLANO'
      Origin = 'FI_GRUPO_CALCULO.CD_PLANO'
      Visible = False
    end
  end
  object wwqryTipoGrupoPartic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select *'
      'from FI_GRUPO_PARTICIPANTE'
      'order by NO_GRUPO_PARTIC')
    ValidateWithMask = True
    Left = 307
    Top = 112
    object wwqryTipoGrupoParticNO_GRUPO_PARTIC: TStringField
      DisplayLabel = 'Grupo de Cálculo'
      DisplayWidth = 40
      FieldName = 'NO_GRUPO_PARTIC'
      Origin = '"CM.FI_GRUPO_PARTICIPANTE".NO_GRUPO_PARTIC'
      Size = 60
    end
    object wwqryTipoGrupoParticCD_GRUPO_PARTIC: TFloatField
      FieldName = 'CD_GRUPO_PARTIC'
      Origin = '"CM.FI_GRUPO_PARTICIPANTE".CD_GRUPO_PARTIC'
      Visible = False
    end
    object wwqryTipoGrupoParticDS_CONDICAO_EQUADRAMENTO: TMemoField
      FieldName = 'DS_CONDICAO_EQUADRAMENTO'
      Origin = '"CM.FI_GRUPO_PARTICIPANTE".DS_CONDICAO_EQUADRAMENTO'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
    object wwqryTipoGrupoParticDS_SQL_ENQUADRAMENTO: TMemoField
      FieldName = 'DS_SQL_ENQUADRAMENTO'
      Origin = '"CM.FI_GRUPO_PARTICIPANTE".DS_SQL_ENQUADRAMENTO'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
  end
  object wwQryTipoBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select a.*'
      'from FI_TIPO_BENEFICIO a, FI_PLANO_BENEFICIO b '
      'where a.CD_TIPO_BENEF = b.CD_TIPO_BENEF'
      '  and b.CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '  and b.CD_PESSOA_ENTID  = :CD_PESSOA_ENTID'
      '  and b.CD_PLANO         = :CD_PLANO'
      'order by a.DS_TIPO_BENEF'
      '')
    ValidateWithMask = True
    Left = 265
    Top = 292
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
    object wwQryTipoBenefDS_TIPO_BENEF: TStringField
      DisplayLabel = 'Tipo de Benefício'
      DisplayWidth = 40
      FieldName = 'DS_TIPO_BENEF'
      Origin = '"CM.FI_TIPO_BENEFICIO".DS_TIPO_BENEF'
      Size = 60
    end
    object wwQryTipoBenefCD_TIPO_BENEF: TFloatField
      FieldName = 'CD_TIPO_BENEF'
      Origin = '"CM.FI_TIPO_BENEFICIO".CD_TIPO_BENEF'
      Visible = False
    end
    object wwQryTipoBenefSG_TIPO_BENEF: TStringField
      FieldName = 'SG_TIPO_BENEF'
      Origin = '"CM.FI_TIPO_BENEFICIO".SG_TIPO_BENEF'
      Visible = False
      Size = 5
    end
  end
  object wwQryRotCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_GRUPO_FORMULA'
      'where IR_GRUPO_CALCULO = '#39'A'#39
      'order by DS_GRUPO_FORMULA')
    ValidateWithMask = True
    Left = 265
    Top = 332
    object wwQryRotCalculoDS_GRUPO_FORMULA: TStringField
      DisplayLabel = 'Rotina de Cálculo'
      DisplayWidth = 40
      FieldName = 'DS_GRUPO_FORMULA'
      Origin = '"CM.FI_GRUPO_FORMULA".DS_GRUPO_FORMULA'
      Size = 80
    end
    object wwQryRotCalculoCD_GRUPO_FORMULA: TFloatField
      FieldName = 'CD_GRUPO_FORMULA'
      Origin = '"CM.FI_GRUPO_FORMULA".CD_GRUPO_FORMULA'
      Visible = False
    end
    object wwQryRotCalculoIR_GRUPO_CALCULO: TStringField
      FieldName = 'IR_GRUPO_CALCULO'
      Origin = '"CM.FI_GRUPO_FORMULA".IR_GRUPO_CALCULO'
      Visible = False
      Size = 1
    end
    object wwQryRotCalculoDS_OBSERV_FORMULA: TMemoField
      FieldName = 'DS_OBSERV_FORMULA'
      Origin = 'BASEDADOS.FI_GRUPO_FORMULA.DS_OBSERV_FORMULA'
      BlobType = ftMemo
      Size = 1400
    end
  end
  object wwQryComposicaoCalculo234: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT a.*'
      'FROM FI_COMPOSICAO_CALCULO a, FI_GRUPO_CALCULO b'
      'WHERE  a.CD_GRUPO_PARTIC   = b.CD_GRUPO_PARTIC'
      '  and a.CD_PESSOA_PATROC   = b.CD_PESSOA_PATROC'
      '  and a.CD_PESSOA_ENTID    = b.CD_PESSOA_ENTID'
      '  and a.CD_PLANO           = b.CD_PLANO'
      ''
      ''
      ' ')
    UpdateObject = UpdtSQLComposicaoCalculo234
    ValidateWithMask = True
    Left = 175
    Top = 182
    object wwQryComposicaoCalculo234CD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'FI_COMPOSICAO_CALCULO.CD_PESSOA_PATROC'
    end
    object wwQryComposicaoCalculo234CD_GRUPO_PARTIC: TFloatField
      FieldName = 'CD_GRUPO_PARTIC'
      Origin = 'FI_COMPOSICAO_CALCULO.CD_GRUPO_PARTIC'
    end
    object wwQryComposicaoCalculo234CD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'FI_COMPOSICAO_CALCULO.CD_PESSOA_ENTID'
    end
    object wwQryComposicaoCalculo234CD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'FI_COMPOSICAO_CALCULO.CD_PLANO'
    end
    object wwQryComposicaoCalculo234CD_GRUPO_FORMULA: TFloatField
      FieldName = 'CD_GRUPO_FORMULA'
      Origin = 'FI_COMPOSICAO_CALCULO.CD_GRUPO_FORMULA'
    end
  end
  object wwQryComposicaoCalcBenef342: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT a.*'
      'FROM FI_COMPOSICAO_CALCULO_BENEF a, FI_GRUPO_CALCULO b'
      'WHERE a.CD_GRUPO_PARTIC    = b.CD_GRUPO_PARTIC'
      '  and a.CD_PESSOA_PATROC   = b.CD_PESSOA_PATROC'
      '  and a.CD_PESSOA_ENTID    = b.CD_PESSOA_ENTID'
      '  and a.CD_PLANO           = b.CD_PLANO')
    UpdateObject = UpdtSQLComposicaoCalcBenef342
    ValidateWithMask = True
    Left = 175
    Top = 222
    object wwQryComposicaoCalcBenef342CD_GRUPO_PARTIC: TFloatField
      FieldName = 'CD_GRUPO_PARTIC'
      Origin = 'FI_COMPOSICAO_CALCULO_BENEF.CD_GRUPO_PARTIC'
    end
    object wwQryComposicaoCalcBenef342CD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'FI_COMPOSICAO_CALCULO_BENEF.CD_PESSOA_PATROC'
    end
    object wwQryComposicaoCalcBenef342CD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'FI_COMPOSICAO_CALCULO_BENEF.CD_PESSOA_ENTID'
    end
    object wwQryComposicaoCalcBenef342CD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'FI_COMPOSICAO_CALCULO_BENEF.CD_PLANO'
    end
    object wwQryComposicaoCalcBenef342CD_TIPO_BENEF: TFloatField
      FieldName = 'CD_TIPO_BENEF'
      Origin = 'FI_COMPOSICAO_CALCULO_BENEF.CD_TIPO_BENEF'
    end
    object wwQryComposicaoCalcBenef342CD_GRUPO_FORMULA: TFloatField
      FieldName = 'CD_GRUPO_FORMULA'
      Origin = 'FI_COMPOSICAO_CALCULO_BENEF.CD_GRUPO_FORMULA'
    end
  end
  object UpdtSQLComposicaoCalculo234: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_COMPOSICAO_CALCULO'
      'set'
      '  CD_GRUPO_FORMULA = :CD_GRUPO_FORMULA'
      'where'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC and'
      '  CD_GRUPO_PARTIC = :OLD_CD_GRUPO_PARTIC and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID and'
      '  CD_PLANO = :OLD_CD_PLANO')
    InsertSQL.Strings = (
      'insert into FI_COMPOSICAO_CALCULO'
      
        '  (CD_PESSOA_PATROC, CD_GRUPO_PARTIC, CD_PESSOA_ENTID, CD_PLANO,' +
        ' '
      '   CD_GRUPO_FORMULA)'
      'values'
      '  (:CD_PESSOA_PATROC, :CD_GRUPO_PARTIC, :CD_PESSOA_ENTID, '
      '   :CD_PLANO, :CD_GRUPO_FORMULA)')
    DeleteSQL.Strings = (
      'delete from FI_COMPOSICAO_CALCULO'
      'where'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC and'
      '  CD_GRUPO_PARTIC = :OLD_CD_GRUPO_PARTIC and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID and'
      '  CD_PLANO = :OLD_CD_PLANO')
    Left = 205
    Top = 182
  end
  object UpdtSQLComposicaoCalcBenef342: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_COMPOSICAO_CALCULO_BENEF'
      'set'
      '  CD_GRUPO_FORMULA = :CD_GRUPO_FORMULA'
      'where'
      '  CD_GRUPO_PARTIC = :OLD_CD_GRUPO_PARTIC and'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID and'
      '  CD_PLANO = :OLD_CD_PLANO and'
      '  CD_TIPO_BENEF = :OLD_CD_TIPO_BENEF')
    InsertSQL.Strings = (
      'insert into FI_COMPOSICAO_CALCULO_BENEF'
      
        '  (CD_GRUPO_PARTIC, CD_PESSOA_PATROC, CD_PESSOA_ENTID, CD_PLANO,' +
        ' '
      '   CD_TIPO_BENEF, CD_GRUPO_FORMULA)'
      'values'
      '  (:CD_GRUPO_PARTIC, :CD_PESSOA_PATROC, :CD_PESSOA_ENTID, '
      '   :CD_PLANO, :CD_TIPO_BENEF, :CD_GRUPO_FORMULA)')
    DeleteSQL.Strings = (
      'delete from FI_COMPOSICAO_CALCULO_BENEF'
      'where'
      '  CD_GRUPO_PARTIC = :OLD_CD_GRUPO_PARTIC and'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID and'
      '  CD_PLANO = :OLD_CD_PLANO and'
      '  CD_TIPO_BENEF = :OLD_CD_TIPO_BENEF')
    Left = 205
    Top = 222
  end
  object UpdtSQLGrupoPartic: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_GRUPO_CALCULO'
      'set'
      '  NR_ORDEM = :NR_ORDEM'
      'where'
      '  CD_GRUPO_PARTIC = :OLD_CD_GRUPO_PARTIC and'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID and'
      '  CD_PLANO = :OLD_CD_PLANO')
    InsertSQL.Strings = (
      'insert into FI_GRUPO_CALCULO'
      
        '  (CD_GRUPO_PARTIC, CD_PESSOA_PATROC, CD_PESSOA_ENTID, CD_PLANO,' +
        ' '
      '   NR_ORDEM)'
      'values'
      '  (:CD_GRUPO_PARTIC, :CD_PESSOA_PATROC, :CD_PESSOA_ENTID, '
      '   :CD_PLANO, :NR_ORDEM)')
    DeleteSQL.Strings = (
      'delete from FI_GRUPO_CALCULO'
      'where'
      '  CD_GRUPO_PARTIC = :OLD_CD_GRUPO_PARTIC and'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID and'
      '  CD_PLANO = :OLD_CD_PLANO')
    Left = 311
    Top = 11
  end
  object wwDtSrcComposicaoCalculo234: TwwDataSource
    DataSet = wwQryComposicaoCalculo234
    Left = 145
    Top = 182
  end
  object wwDtSrcComposicaoCalcBenef342: TwwDataSource
    DataSet = wwQryComposicaoCalcBenef342
    Left = 145
    Top = 222
  end
  object dsTipoGrupoPartic: TDataSource
    DataSet = wwqryTipoGrupoPartic
    Left = 335
    Top = 112
  end
  object qryCondicao: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
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
  object qryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = wwDtSrcComposicaoCalcBenef
    SQL.Strings = (
      ' SELECT b.DS_TIPO_BENEF,c.DS_GRUPO_FORMULA'
      ' FROM FI_COMPOSICAO_CALCULO_BENEF a, FI_TIPO_BENEFICIO b,'
      '      FI_GRUPO_FORMULA c'
      'WHERE a.CD_PESSOA_PATROC     = :CD_PESSOA_PATROC'
      '  and a.CD_PESSOA_ENTID      = :CD_PESSOA_ENTID'
      '  and a.CD_PLANO             = :CD_PLANO'
      '  and a.CD_GRUPO_PARTIC      = :CD_GRUPO_PARTIC'
      '  and a.CD_TIPO_BENEF        = :CD_TIPO_BENEF'
      '  and a.CD_TIPO_BENEF        = b.CD_TIPO_BENEF'
      '  and a.CD_GRUPO_FORMULA     = c.CD_GRUPO_FORMULA')
    ValidateWithMask = True
    Left = 320
    Top = 292
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
      end
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_TIPO_BENEF'
        ParamType = ptUnknown
      end>
    object qryBeneficioDS_TIPO_BENEF: TStringField
      FieldName = 'DS_TIPO_BENEF'
      Size = 60
    end
    object qryBeneficioDS_GRUPO_FORMULA: TStringField
      FieldName = 'DS_GRUPO_FORMULA'
      Size = 80
    end
  end
  object qryRotina: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT b.DS_GRUPO_FORMULA'
      'FROM FI_COMPOSICAO_CALCULO a, FI_GRUPO_FORMULA b'
      'WHERE a.CD_PESSOA_PATROC     = :CD_PESSOA_PATROC'
      '  and a.CD_PESSOA_ENTID      = :CD_PESSOA_ENTID'
      '  and a.CD_PLANO             = :CD_PLANO'
      '  and a.CD_GRUPO_PARTIC      = :CD_GRUPO_PARTIC'
      '  and a.CD_GRUPO_FORMULA = b.CD_GRUPO_FORMULA')
    ValidateWithMask = True
    Left = 320
    Top = 332
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
      end
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_PARTIC'
        ParamType = ptUnknown
      end>
    object qryRotinaDS_GRUPO_FORMULA: TStringField
      FieldName = 'DS_GRUPO_FORMULA'
      Size = 80
    end
  end
  object dsBeneficio: TwwDataSource
    DataSet = qryBeneficio
    Left = 350
    Top = 292
  end
  object dsRotina: TwwDataSource
    DataSet = qryRotina
    Left = 350
    Top = 332
  end
  object wwQryComposicaoCalculo: TQuery
    CachedUpdates = True
    BeforePost = wwQryComposicaoCalculoBeforePost
    AfterPost = wwQryComposicaoCalculoAfterPost
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT a.*'
      'FROM FI_COMPOSICAO_CALCULO a, FI_GRUPO_CALCULO b'
      'WHERE  a.CD_GRUPO_PARTIC  = :CD_GRUPO_PARTIC'
      '  and b.CD_PESSOA_PATROC     = :CD_PESSOA_PATROC'
      '  and b.CD_PESSOA_ENTID         = :CD_PESSOA_ENTID'
      '  and b.CD_PLANO                        = :CD_PLANO'
      '  and a.CD_GRUPO_PARTIC    = b.CD_GRUPO_PARTIC'
      '  and a.CD_PESSOA_PATROC = b.CD_PESSOA_PATROC'
      '  and a.CD_PESSOA_ENTID     = b.CD_PESSOA_ENTID'
      '  and a.CD_PLANO                     = b.CD_PLANO')
    UpdateObject = UpdtSQLComposicaoCalculo
    Left = 45
    Top = 182
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_GRUPO_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    object wwQryComposicaoCalculoCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'FI_COMPOSICAO_CALCULO.CD_PESSOA_PATROC'
    end
    object wwQryComposicaoCalculoCD_GRUPO_PARTIC: TFloatField
      FieldName = 'CD_GRUPO_PARTIC'
      Origin = 'FI_COMPOSICAO_CALCULO.CD_GRUPO_PARTIC'
    end
    object wwQryComposicaoCalculoCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'FI_COMPOSICAO_CALCULO.CD_PESSOA_ENTID'
    end
    object wwQryComposicaoCalculoCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'FI_COMPOSICAO_CALCULO.CD_PLANO'
    end
    object wwQryComposicaoCalculoCD_GRUPO_FORMULA: TFloatField
      FieldName = 'CD_GRUPO_FORMULA'
      Origin = 'FI_COMPOSICAO_CALCULO.CD_GRUPO_FORMULA'
    end
  end
  object wwDtSrcComposicaoCalculo: TDataSource
    DataSet = wwQryComposicaoCalculo
    Left = 75
    Top = 182
  end
  object UpdtSQLComposicaoCalculo: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_COMPOSICAO_CALCULO'
      'set'
      '  CD_GRUPO_FORMULA = :CD_GRUPO_FORMULA'
      'where'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC and'
      '  CD_GRUPO_PARTIC = :OLD_CD_GRUPO_PARTIC and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID and'
      '  CD_PLANO = :OLD_CD_PLANO')
    InsertSQL.Strings = (
      'insert into FI_COMPOSICAO_CALCULO'
      
        '  (CD_PESSOA_PATROC, CD_GRUPO_PARTIC, CD_PESSOA_ENTID, CD_PLANO,' +
        ' '
      '   CD_GRUPO_FORMULA)'
      'values'
      '  (:CD_PESSOA_PATROC, :CD_GRUPO_PARTIC, :CD_PESSOA_ENTID, '
      '   :CD_PLANO, :CD_GRUPO_FORMULA)')
    DeleteSQL.Strings = (
      'delete from FI_COMPOSICAO_CALCULO'
      'where'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC and'
      '  CD_GRUPO_PARTIC = :OLD_CD_GRUPO_PARTIC and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID and'
      '  CD_PLANO = :OLD_CD_PLANO')
    Left = 105
    Top = 182
  end
  object wwQryComposicaoCalcBenef: TQuery
    CachedUpdates = True
    BeforePost = wwQryComposicaoCalcBenefBeforePost
    AfterPost = wwQryComposicaoCalcBenefAfterPost
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT a.*'
      'FROM FI_COMPOSICAO_CALCULO_BENEF a, FI_GRUPO_CALCULO b'
      'WHERE a.CD_GRUPO_PARTIC  = :CD_GRUPO_PARTIC'
      '  and b.CD_PESSOA_PATROC     = :CD_PESSOA_PATROC'
      '  and b.CD_PESSOA_ENTID         = :CD_PESSOA_ENTID'
      '  and b.CD_PLANO                        = :CD_PLANO'
      '  and a.CD_GRUPO_PARTIC    = b.CD_GRUPO_PARTIC'
      '  and a.CD_PESSOA_PATROC   = b.CD_PESSOA_PATROC'
      '  and a.CD_PESSOA_ENTID    = b.CD_PESSOA_ENTID'
      '  and a.CD_PLANO           = b.CD_PLANO')
    UpdateObject = UpdtSQLComposicaoCalcBenef
    Left = 45
    Top = 222
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_GRUPO_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    object wwQryComposicaoCalcBenefCD_GRUPO_PARTIC: TFloatField
      FieldName = 'CD_GRUPO_PARTIC'
      Origin = 'FI_COMPOSICAO_CALCULO_BENEF.CD_GRUPO_PARTIC'
    end
    object wwQryComposicaoCalcBenefCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'FI_COMPOSICAO_CALCULO_BENEF.CD_PESSOA_PATROC'
    end
    object wwQryComposicaoCalcBenefCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'FI_COMPOSICAO_CALCULO_BENEF.CD_PESSOA_ENTID'
    end
    object wwQryComposicaoCalcBenefCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'FI_COMPOSICAO_CALCULO_BENEF.CD_PLANO'
    end
    object wwQryComposicaoCalcBenefCD_TIPO_BENEF: TFloatField
      FieldName = 'CD_TIPO_BENEF'
      Origin = 'FI_COMPOSICAO_CALCULO_BENEF.CD_TIPO_BENEF'
    end
    object wwQryComposicaoCalcBenefCD_GRUPO_FORMULA: TFloatField
      FieldName = 'CD_GRUPO_FORMULA'
      Origin = 'FI_COMPOSICAO_CALCULO_BENEF.CD_GRUPO_FORMULA'
    end
  end
  object wwDtSrcComposicaoCalcBenef: TDataSource
    DataSet = wwQryComposicaoCalcBenef
    Left = 75
    Top = 222
  end
  object UpdtSQLComposicaoCalcBenef: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_COMPOSICAO_CALCULO_BENEF'
      'set'
      '  CD_TIPO_BENEF = :CD_TIPO_BENEF,'
      '  CD_GRUPO_FORMULA = :CD_GRUPO_FORMULA'
      'where'
      '  CD_GRUPO_PARTIC = :OLD_CD_GRUPO_PARTIC and'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID and'
      '  CD_PLANO = :OLD_CD_PLANO and'
      '  CD_TIPO_BENEF = :OLD_CD_TIPO_BENEF')
    InsertSQL.Strings = (
      'insert into FI_COMPOSICAO_CALCULO_BENEF'
      
        '  (CD_GRUPO_PARTIC, CD_PESSOA_PATROC, CD_PESSOA_ENTID, CD_PLANO,' +
        ' '
      '   CD_TIPO_BENEF, CD_GRUPO_FORMULA)'
      'values'
      '  (:CD_GRUPO_PARTIC, :CD_PESSOA_PATROC, :CD_PESSOA_ENTID, '
      '   :CD_PLANO, :CD_TIPO_BENEF, :CD_GRUPO_FORMULA)')
    DeleteSQL.Strings = (
      'delete from FI_COMPOSICAO_CALCULO_BENEF'
      'where'
      '  CD_GRUPO_PARTIC = :OLD_CD_GRUPO_PARTIC and'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID and'
      '  CD_PLANO = :OLD_CD_PLANO and'
      '  CD_TIPO_BENEF = :OLD_CD_TIPO_BENEF')
    Left = 105
    Top = 222
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_GRUPO_CALCULO.NR_ORDEM'
      'FI_GRUPO_PARTICIPANTE.NO_GRUPO_PARTIC')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Ordem'
      'Grupo do Participante')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'FI_GRUPO_CALCULO'
      'FI_GRUPO_PARTICIPANTE')
    CamposChave.Strings = (
      'FI_GRUPO_CALCULO.CD_GRUPO_PARTIC')
    Filtro.Strings = (
      
        'FI_GRUPO_CALCULO.CD_GRUPO_PARTIC = FI_GRUPO_CALCULO.CD_GRUPO_PAR' +
        'TIC')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 208
    Top = 55
  end
end
