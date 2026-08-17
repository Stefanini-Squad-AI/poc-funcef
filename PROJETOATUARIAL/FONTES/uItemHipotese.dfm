inherited frmItemHipotese: TfrmItemHipotese
  Left = 320
  Top = 200
  Caption = 'Item de Hipótese'
  ClientHeight = 355
  ClientWidth = 457
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 457
    Height = 269
    object Label7: TLabel
      Left = 24
      Top = 16
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label2: TLabel
      Left = 30
      Top = 227
      Width = 84
      Height = 13
      Caption = 'Tipo de Tábua'
      Visible = False
    end
    object DBRdGrpNatureza: TDBRadioGroup
      Left = 24
      Top = 63
      Width = 410
      Height = 57
      Caption = 'Natureza do Item'
      Columns = 2
      DataField = 'IR_ITEM_HIPOTESE'
      DataSource = ds
      Items.Strings = (
        'Fator'
        'Juros'
        'Percentual'
        'Tábua de Serviço')
      TabOrder = 0
      Values.Strings = (
        'F'
        'J'
        'P'
        'T')
      OnChange = DBRdGrpNaturezaChange
    end
    object DBEdit1: TDBEdit
      Left = 24
      Top = 30
      Width = 410
      Height = 21
      AutoSelect = False
      DataField = 'DS_ITEM_HIPOTESE'
      DataSource = ds
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 30
      Top = 242
      Width = 299
      Height = 21
      AutoSelect = False
      DataField = 'DS_TIPO_TABUA'
      DataSource = dsTab
      TabOrder = 2
      Visible = False
    end
    object DBCmbBxTabuaGeral: TwwDBLookupCombo
      Left = 30
      Top = 242
      Width = 293
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_TIPO_TABUA'#9'40'#9'Tipo de Tábua')
      LookupTable = qryTabua
      LookupField = 'CD_TIPO_TABUA'
      Options = [loColLines, loRowLines]
      Enabled = False
      TabOrder = 3
      Visible = False
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object GroupBox1: TGroupBox
      Left = 24
      Top = 137
      Width = 176
      Height = 56
      Caption = 'Variável'
      TabOrder = 4
      object SpeedButton1: TSpeedButton
        Left = 140
        Top = 24
        Width = 25
        Height = 25
        Caption = '...'
        OnClick = SpeedButton1Click
      end
      object DBEdtVariavel: TDBEdit
        Left = 12
        Top = 25
        Width = 124
        Height = 21
        DataField = 'NO_VARIAVEL'
        DataSource = ds
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  inherited Dock972: TDock97
    Width = 457
  end
  inherited Dock971: TDock97
    Top = 316
    Width = 457
    inherited tb97Fundo: TToolbar97
      Left = 285
      DockPos = 286
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 116
      DockPos = 117
    end
    inherited dbnav: TDBNavigator
      Left = 39
      Hints.Strings = ()
    end
  end
  inherited ds: TwwDataSource
    DataSet = QryPrincipal
    Left = 291
    Top = 48
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 308
    Top = 7
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 343
    Top = 8
  end
  object QryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = QryPrincipalAfterOpen
    BeforePost = QryPrincipalBeforePost
    AfterPost = QryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_ITEM_HIPOTESE'
      'order by DS_ITEM_HIPOTESE')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 258
    Top = 46
    object QryPrincipalDS_ITEM_HIPOTESE: TStringField
      DisplayLabel = 'Ítem de Hipótese'
      DisplayWidth = 50
      FieldName = 'DS_ITEM_HIPOTESE'
      Origin = 'FI_ITEM_HIPOTESE.DS_ITEM_HIPOTESE'
      Size = 50
    end
    object QryPrincipalNO_VARIAVEL: TStringField
      DisplayLabel = 'Variável'
      DisplayWidth = 20
      FieldName = 'NO_VARIAVEL'
      Origin = 'FI_ITEM_HIPOTESE.NO_VARIAVEL'
    end
    object QryPrincipalCD_TIPO_TABUA: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_TIPO_TABUA'
      Origin = 'FI_ITEM_HIPOTESE.CD_TIPO_TABUA'
      Visible = False
    end
    object QryPrincipalIR_ITEM_HIPOTESE: TStringField
      DisplayWidth = 1
      FieldName = 'IR_ITEM_HIPOTESE'
      Origin = 'FI_ITEM_HIPOTESE.IR_ITEM_HIPOTESE'
      Visible = False
      Size = 1
    end
    object QryPrincipalCD_ITEM_HIPOTESE: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_ITEM_HIPOTESE'
      Origin = 'FI_ITEM_HIPOTESE.CD_ITEM_HIPOTESE'
      Visible = False
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_ITEM_HIPOTESE'
      'set'
      '  CD_TIPO_TABUA = :CD_TIPO_TABUA,'
      '  DS_ITEM_HIPOTESE = :DS_ITEM_HIPOTESE,'
      '  IR_ITEM_HIPOTESE = :IR_ITEM_HIPOTESE,'
      '  NO_VARIAVEL = :NO_VARIAVEL'
      'where'
      '  CD_ITEM_HIPOTESE = :OLD_CD_ITEM_HIPOTESE')
    InsertSQL.Strings = (
      'insert into FI_ITEM_HIPOTESE'
      '  (CD_ITEM_HIPOTESE, CD_TIPO_TABUA, DS_ITEM_HIPOTESE, '
      '   IR_ITEM_HIPOTESE, NO_VARIAVEL)'
      'values'
      '  (:CD_ITEM_HIPOTESE, :CD_TIPO_TABUA, :DS_ITEM_HIPOTESE, '
      '   :IR_ITEM_HIPOTESE, :NO_VARIAVEL)')
    DeleteSQL.Strings = (
      'delete from FI_ITEM_HIPOTESE'
      'where'
      '  CD_ITEM_HIPOTESE = :OLD_CD_ITEM_HIPOTESE')
    Left = 325
    Top = 47
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_ITEM_HIPOTESE) as Max_CD'
      'from FI_ITEM_HIPOTESE')
    ValidateWithMask = True
    Left = 404
    Top = 12
  end
  object qryTabua: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_TIPO_TABUA'
      'order by DS_TIPO_TABUA ')
    ValidateWithMask = True
    Left = 258
    Top = 194
    object qryTabuaDS_TIPO_TABUA: TStringField
      DisplayLabel = 'Tipo de Tábua'
      DisplayWidth = 40
      FieldName = 'DS_TIPO_TABUA'
      Origin = 'FI_TIPO_TABUA.DS_TIPO_TABUA'
      Size = 40
    end
    object qryTabuaCD_TIPO_TABUA: TFloatField
      FieldName = 'CD_TIPO_TABUA'
      Origin = 'FI_TIPO_TABUA.CD_TIPO_TABUA'
      Visible = False
    end
    object qryTabuaIR_DOMINIO_SISTEMA: TStringField
      FieldName = 'IR_DOMINIO_SISTEMA'
      Origin = 'FI_TIPO_TABUA.IR_DOMINIO_SISTEMA'
      Visible = False
      Size = 3
    end
  end
  object qryTab: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select DS_TIPO_TABUA'
      'from FI_TIPO_TABUA'
      'where CD_TIPO_TABUA = :CD_TIPO_TABUA')
    ValidateWithMask = True
    Left = 163
    Top = 194
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_TIPO_TABUA'
        ParamType = ptUnknown
      end>
    object qryTabDS_TIPO_TABUA: TStringField
      FieldName = 'DS_TIPO_TABUA'
      Origin = 'FI_TIPO_TABUA.DS_TIPO_TABUA'
      Size = 40
    end
  end
  object dsTab: TwwDataSource
    AutoEdit = False
    DataSet = qryTab
    Left = 196
    Top = 193
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_ITEM_HIPOTESE.DS_ITEM_HIPOTESE'
      'FI_TIPO_TABUA.DS_TIPO_TABUA'
      'FI_ITEM_HIPOTESE.NO_VARIAVEL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Tipo de Tábua'
      'Variável')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FI_ITEM_HIPOTESE'
      'FI_TIPO_TABUA')
    CamposChave.Strings = (
      'FI_ITEM_HIPOTESE.CD_ITEM_HIPOTESE')
    Filtro.Strings = (
      'FI_ITEM_HIPOTESE.CD_TIPO_TABUA = FI_TIPO_TABUA.CD_TIPO_TABUA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '40'
      '20')
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
