inherited frmCategoriaPro: TfrmCategoriaPro
  Left = 237
  Top = 216
  ActiveControl = DBEdit8
  Caption = 'Categoria Profissional'
  ClientHeight = 289
  ClientWidth = 511
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 511
    Height = 203
    object Label1: TLabel
      Left = 20
      Top = 10
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object Label6: TLabel
      Left = 20
      Top = 57
      Width = 124
      Height = 13
      Caption = 'Categoria Profissional'
    end
    object DBEdit8: TDBEdit
      Left = 20
      Top = 71
      Width = 312
      Height = 21
      AutoSelect = False
      DataField = 'DS_TIPO_CAT_PROF_ESP'
      DataSource = ds
      TabOrder = 1
    end
    object DBEdit1: TDBEdit
      Left = 20
      Top = 26
      Width = 381
      Height = 21
      Color = clSilver
      DataField = 'NO_PESSOA'
      DataSource = ds
      ReadOnly = True
      TabOrder = 0
      OnChange = DBEdit1Change
    end
    object LkcTbTipoCatProf: TwwDBLookupCombo
      Left = 20
      Top = 71
      Width = 308
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_TIPO_CAT_PROF_ESP'#9'60'#9'Descrição')
      DataField = 'CD_TIPO_CAT_PROF_ESP'
      DataSource = ds
      LookupTable = qryTipoCatProf
      LookupField = 'CD_TIPO_CAT_PROF_ESP'
      Options = [loColLines, loRowLines]
      Enabled = False
      TabOrder = 2
      Visible = False
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object GroupBox1: TGroupBox
      Left = 14
      Top = 111
      Width = 159
      Height = 74
      Caption = 'Idade de Aposentadoria'
      TabOrder = 3
      object Label2: TLabel
        Left = 12
        Top = 24
        Width = 42
        Height = 13
        Caption = 'Homem'
      end
      object Label3: TLabel
        Left = 12
        Top = 50
        Width = 39
        Height = 13
        Caption = 'Mulher'
      end
      object DBEdit2: TDBEdit
        Left = 67
        Top = 21
        Width = 72
        Height = 21
        DataField = 'NR_IDADE_APOSENT_MASC'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 67
        Top = 47
        Width = 72
        Height = 21
        DataField = 'NR_IDADE_APOSENT_FEM'
        DataSource = ds
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 177
      Top = 111
      Width = 159
      Height = 74
      Caption = 'Tempo de Contribuição'
      TabOrder = 4
      object Label4: TLabel
        Left = 12
        Top = 50
        Width = 39
        Height = 13
        Caption = 'Mulher'
      end
      object Label5: TLabel
        Left = 12
        Top = 24
        Width = 42
        Height = 13
        Caption = 'Homem'
      end
      object DBEdit4: TDBEdit
        Left = 67
        Top = 47
        Width = 72
        Height = 21
        DataField = 'NR_TEMPO_CONTRIB_FEM'
        DataSource = ds
        TabOrder = 1
      end
      object DBEdit5: TDBEdit
        Left = 67
        Top = 21
        Width = 72
        Height = 21
        DataField = 'NR_TEMPO_CONTRIB_MASC'
        DataSource = ds
        TabOrder = 0
      end
    end
    object GroupBox3: TGroupBox
      Left = 340
      Top = 111
      Width = 158
      Height = 74
      Caption = 'Tempo de Serviço'
      TabOrder = 5
      object Label7: TLabel
        Left = 12
        Top = 50
        Width = 39
        Height = 13
        Caption = 'Mulher'
      end
      object Label8: TLabel
        Left = 12
        Top = 24
        Width = 42
        Height = 13
        Caption = 'Homem'
      end
      object DBEdit6: TDBEdit
        Left = 67
        Top = 47
        Width = 72
        Height = 21
        DataField = 'NR_TEMPO_SERVICO_FEM'
        DataSource = ds
        TabOrder = 1
      end
      object DBEdit7: TDBEdit
        Left = 67
        Top = 21
        Width = 72
        Height = 21
        DataField = 'NR_TEMPO_SERVICO_MASC'
        DataSource = ds
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 250
    Width = 511
    inherited tb97Fundo: TToolbar97
      Left = 296
      DockPos = 296
      TabOrder = 2
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 128
      DockPos = 128
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 511
  end
  inherited ds: TwwDataSource
    DataSet = qryCatProf
    Left = 321
    Top = 16
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 453
    Top = 12
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 423
    Top = 13
  end
  object qryCatProf: TwwQuery
    CachedUpdates = True
    AfterOpen = qryCatProfAfterOpen
    BeforePost = qryCatProfBeforePost
    AfterPost = qryCatProfAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select pj.NO_PESSOA, tc.DS_TIPO_CAT_PROF_ESP, '
      '       c.CD_PESSOA_PATROC, c.CD_TIPO_CAT_PROF_ESP,'
      '       c.NR_IDADE_APOSENT_FEM, c.NR_IDADE_APOSENT_MASC,'
      '       c.NR_TEMPO_SERVICO_FEM, c.NR_TEMPO_SERVICO_MASC,'
      '       c.NR_TEMPO_CONTRIB_FEM, c.NR_TEMPO_CONTRIB_MASC'
      'from FI_PESSOA_JURIDICA pj, FI_PATROCINADORA p,'
      '     FI_CATEG_PROF_ESP_PATROC c, FI_TIPO_CATEG_PROF_ESPECIAL tc'
      'where c.CD_PESSOA_PATROC = :CD'
      '  and pj.CD_PESSOA = p.CD_PESSOA_PATROC'
      '  and p.CD_PESSOA_PATROC = c.CD_PESSOA_PATROC'
      '  and c.CD_TIPO_CAT_PROF_ESP = tc.CD_TIPO_CAT_PROF_ESP'
      'order by tc.DS_TIPO_CAT_PROF_ESP'
      '                 ')
    Params.Data = {0100010002434400030400000000000000}
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 288
    Top = 16
    object qryCatProfNO_PESSOA: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 40
      FieldName = 'NO_PESSOA'
      Origin = '"CM.FI_PESSOA_JURIDICA".NO_PESSOA'
      Size = 60
    end
    object qryCatProfDS_TIPO_CAT_PROF_ESP: TStringField
      DisplayLabel = 'Tipo de Categoria Profissional'
      DisplayWidth = 40
      FieldName = 'DS_TIPO_CAT_PROF_ESP'
      Origin = '"CM.FI_TIPO_CATEG_PROF_ESPECIAL".DS_TIPO_CAT_PROF_ESP'
      Size = 60
    end
    object qryCatProfCD_PESSOA_PATROC: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'FI_CATEG_PROF_ESP_PATROC.CD_PESSOA_PATROC'
      Visible = False
    end
    object qryCatProfCD_TIPO_CAT_PROF_ESP: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_TIPO_CAT_PROF_ESP'
      Origin = 'FI_CATEG_PROF_ESP_PATROC.CD_TIPO_CAT_PROF_ESP'
      Visible = False
    end
    object qryCatProfNR_IDADE_APOSENT_FEM: TFloatField
      DisplayWidth = 10
      FieldName = 'NR_IDADE_APOSENT_FEM'
      Origin = 'FI_CATEG_PROF_ESP_PATROC.NR_IDADE_APOSENT_FEM'
      Visible = False
    end
    object qryCatProfNR_IDADE_APOSENT_MASC: TFloatField
      DisplayWidth = 10
      FieldName = 'NR_IDADE_APOSENT_MASC'
      Origin = 'FI_CATEG_PROF_ESP_PATROC.NR_IDADE_APOSENT_MASC'
      Visible = False
    end
    object qryCatProfNR_TEMPO_SERVICO_FEM: TFloatField
      DisplayWidth = 10
      FieldName = 'NR_TEMPO_SERVICO_FEM'
      Origin = 'FI_CATEG_PROF_ESP_PATROC.NR_TEMPO_SERVICO_FEM'
      Visible = False
    end
    object qryCatProfNR_TEMPO_SERVICO_MASC: TFloatField
      DisplayWidth = 10
      FieldName = 'NR_TEMPO_SERVICO_MASC'
      Origin = 'FI_CATEG_PROF_ESP_PATROC.NR_TEMPO_SERVICO_MASC'
      Visible = False
    end
    object qryCatProfNR_TEMPO_CONTRIB_FEM: TFloatField
      DisplayWidth = 10
      FieldName = 'NR_TEMPO_CONTRIB_FEM'
      Origin = 'FI_CATEG_PROF_ESP_PATROC.NR_TEMPO_CONTRIB_FEM'
      Visible = False
    end
    object qryCatProfNR_TEMPO_CONTRIB_MASC: TFloatField
      DisplayWidth = 10
      FieldName = 'NR_TEMPO_CONTRIB_MASC'
      Origin = 'FI_CATEG_PROF_ESP_PATROC.NR_TEMPO_CONTRIB_MASC'
      Visible = False
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_CATEG_PROF_ESP_PATROC'
      'set'
      '  NR_IDADE_APOSENT_FEM = :NR_IDADE_APOSENT_FEM,'
      '  NR_IDADE_APOSENT_MASC = :NR_IDADE_APOSENT_MASC,'
      '  NR_TEMPO_SERVICO_FEM = :NR_TEMPO_SERVICO_FEM,'
      '  NR_TEMPO_SERVICO_MASC = :NR_TEMPO_SERVICO_MASC,'
      '  NR_TEMPO_CONTRIB_FEM = :NR_TEMPO_CONTRIB_FEM,'
      '  NR_TEMPO_CONTRIB_MASC = :NR_TEMPO_CONTRIB_MASC'
      'where'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC and'
      '  CD_TIPO_CAT_PROF_ESP = :OLD_CD_TIPO_CAT_PROF_ESP ')
    InsertSQL.Strings = (
      'insert into FI_CATEG_PROF_ESP_PATROC'
      '  (CD_PESSOA_PATROC, CD_TIPO_CAT_PROF_ESP, '
      '   NR_IDADE_APOSENT_FEM, NR_IDADE_APOSENT_MASC, '
      '   NR_TEMPO_SERVICO_FEM, NR_TEMPO_SERVICO_MASC, '
      '   NR_TEMPO_CONTRIB_FEM, NR_TEMPO_CONTRIB_MASC)'
      'values'
      '  (:CD_PESSOA_PATROC, :CD_TIPO_CAT_PROF_ESP, '
      '   :NR_IDADE_APOSENT_FEM, :NR_IDADE_APOSENT_MASC, '
      '   :NR_TEMPO_SERVICO_FEM, :NR_TEMPO_SERVICO_MASC,       '
      '   :NR_TEMPO_CONTRIB_FEM, :NR_TEMPO_CONTRIB_MASC)')
    DeleteSQL.Strings = (
      'delete from FI_CATEG_PROF_ESP_PATROC'
      'where'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC and'
      '  CD_TIPO_CAT_PROF_ESP = :OLD_CD_TIPO_CAT_PROF_ESP')
    Left = 354
    Top = 16
  end
  object dsTipoCatProf: TwwDataSource
    AutoEdit = False
    DataSet = qryTipoCatProf
    Left = 336
    Top = 54
  end
  object qryTipoCatProf: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select DS_TIPO_CAT_PROF_ESP, CD_TIPO_CAT_PROF_ESP'
      'from FI_TIPO_CATEG_PROF_ESPECIAL')
    ValidateWithMask = True
    Left = 303
    Top = 54
    object qryTipoCatProfDS_TIPO_CAT_PROF_ESP: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DS_TIPO_CAT_PROF_ESP'
      Origin = 'FI_TIPO_CATEG_PROF_ESPECIAL.DS_TIPO_CAT_PROF_ESP'
      Size = 60
    end
    object qryTipoCatProfCD_TIPO_CAT_PROF_ESP: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CD_TIPO_CAT_PROF_ESP'
      Origin = 'FI_TIPO_CATEG_PROF_ESPECIAL.CD_TIPO_CAT_PROF_ESP'
      Visible = False
    end
  end
end
R
