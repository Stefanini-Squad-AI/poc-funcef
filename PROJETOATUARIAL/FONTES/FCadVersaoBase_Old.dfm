inherited frmCadVersaoBase_Old: TfrmCadVersaoBase_Old
  Left = 161
  Top = 98
  ActiveControl = DBEdit1
  Caption = 'Versão da Base de Dados'
  ClientHeight = 397
  ClientWidth = 497
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 497
    Height = 311
    object Label1: TLabel
      Left = 54
      Top = 19
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = DBEdit1
    end
    object Label9: TLabel
      Left = 54
      Top = 61
      Width = 32
      Height = 13
      Caption = 'Login'
    end
    object Label2: TLabel
      Left = 278
      Top = 61
      Width = 162
      Height = 13
      Caption = 'Data de Referência da Base'
    end
    object Label7: TLabel
      Left = 54
      Top = 162
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object Label8: TLabel
      Left = 54
      Top = 201
      Width = 140
      Height = 13
      Caption = 'Entidade de Previdência'
    end
    object Label3: TLabel
      Left = 54
      Top = 241
      Width = 110
      Height = 13
      Caption = 'Plano de Benefício'
    end
    object DBEdit6: TDBEdit
      Left = 54
      Top = 256
      Width = 391
      Height = 21
      AutoSelect = False
      DataField = 'NO_PLANO'
      DataSource = dsPlan
      TabOrder = 9
    end
    object DBEdit5: TDBEdit
      Left = 54
      Top = 216
      Width = 391
      Height = 21
      AutoSelect = False
      DataField = 'NO_PESSOA'
      DataSource = dsEnt
      TabOrder = 8
    end
    object DBEdit3: TDBEdit
      Left = 54
      Top = 177
      Width = 391
      Height = 21
      AutoSelect = False
      DataField = 'NO_PESSOA'
      DataSource = dsPat
      TabOrder = 7
    end
    object DBEdit1: TDBEdit
      Left = 54
      Top = 34
      Width = 391
      Height = 21
      AutoSelect = False
      DataField = 'DS_VERSAO'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 54
      Top = 76
      Width = 147
      Height = 21
      Color = clSilver
      DataField = 'LOGIN'
      DataSource = ds
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 279
      Top = 76
      Width = 111
      Height = 21
      DataField = 'DT_REFER_BASE'
      DataSource = ds
      TabOrder = 2
    end
    object DateEdit: TCMDateTimePicker
      Left = 278
      Top = 76
      Width = 106
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      Epoch = 1950
      ButtonGlyph.Data = {
        06050000424D06050000000000003604000028000000100000000D0000000100
        080000000000D000000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
        000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
        A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
        A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
        A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
        FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
        04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
        000000000000000000FF}
      ShowButton = True
      TabOrder = 3
      Visible = False
    end
    object LkcTbPatroc: TwwDBLookupCombo
      Left = 54
      Top = 177
      Width = 385
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NO_PESSOA'#9'60'#9'Patrocinadora')
      DataField = 'CD_PESSOA_PATROC'
      DataSource = ds
      LookupTable = qryPatroc
      LookupField = 'CD_PESSOA'
      Options = [loColLines, loRowLines]
      TabOrder = 4
      Visible = False
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnChange = LkcTbPatrocChange
    end
    object LkcTbEntid: TwwDBLookupCombo
      Left = 54
      Top = 216
      Width = 385
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NO_PESSOA'#9'60'#9'Entidade de Previdência')
      DataField = 'CD_PESSOA_ENTID'
      DataSource = ds
      LookupTable = qryEntid
      LookupField = 'CD_PESSOA'
      Options = [loColLines, loRowLines]
      Enabled = False
      TabOrder = 5
      Visible = False
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnChange = LkcTbEntidChange
    end
    object LkcTbPlano: TwwDBLookupCombo
      Left = 54
      Top = 256
      Width = 385
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NO_PLANO'#9'60'#9'Plano Patronal')
      DataField = 'CD_PLANO'
      DataSource = ds
      LookupTable = qryPlano
      LookupField = 'CD_PLANO'
      Options = [loColLines, loRowLines]
      Enabled = False
      TabOrder = 6
      Visible = False
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object GroupBox1: TGroupBox
      Left = 54
      Top = 109
      Width = 391
      Height = 41
      Caption = 'Situação'
      TabOrder = 10
      object DBChkBxBaseHist: TDBCheckBox
        Left = 27
        Top = 19
        Width = 124
        Height = 17
        Caption = 'Base de Histórico'
        DataField = 'IR_BASE_HISTORICA'
        DataSource = ds
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 497
  end
  inherited Dock971: TDock97
    Top = 358
    Width = 497
    inherited tb97Fundo: TToolbar97
      Left = 327
      DockPos = 327
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 159
      DockPos = 159
    end
    inherited dbnav: TDBNavigator
      Left = 24
      Hints.Strings = ()
      OnClick = dbnavClick
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    DataSet = QryPrincipal
    Left = 291
    Top = 46
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 263
    Top = 12
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 343
    Top = 13
  end
  object QryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = QryPrincipalAfterOpen
    BeforePost = QryPrincipalBeforePost
    AfterPost = QryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select a.*, b.*'
      'from FI_VERSAO_BASE a, FI_BASE_PLANO_PATRONAL b'
      'where a.CD_VERSAO = b.CD_VERSAO'
      'order by a.DS_VERSAO')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 258
    Top = 46
    object QryPrincipalDS_VERSAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DS_VERSAO'
      Origin = 'FI_VERSAO_BASE.DS_VERSAO'
      Size = 60
    end
    object QryPrincipalDT_REFER_BASE: TDateTimeField
      DisplayLabel = 'Data de Referência'
      DisplayWidth = 10
      FieldName = 'DT_REFER_BASE'
      Origin = 'FI_VERSAO_BASE.DT_REFER_BASE'
    end
    object QryPrincipalLOGIN: TStringField
      DisplayLabel = 'Login'
      DisplayWidth = 20
      FieldName = 'LOGIN'
      Origin = 'FI_VERSAO_BASE.LOGIN'
    end
    object QryPrincipalIR_BASE_HISTORICA: TStringField
      DisplayLabel = 'Base de Histórico'
      DisplayWidth = 1
      FieldName = 'IR_BASE_HISTORICA'
      Origin = 'FI_VERSAO_BASE.IR_BASE_HISTORICA'
      Size = 1
    end
    object QryPrincipalDT_GERACAO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DT_GERACAO'
      Origin = 'FI_VERSAO_BASE.DT_GERACAO'
      Visible = False
      DisplayFormat = 'dd/mm/yyyy hh:mm:ss'
    end
    object QryPrincipalCD_VERSAO: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_VERSAO'
      Origin = 'FI_VERSAO_BASE.CD_VERSAO'
      Visible = False
    end
    object QryPrincipalCD_VERSAO_1: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_VERSAO_1'
      Origin = 'FI_BASE_PLANO_PATRONAL.CD_VERSAO'
      Visible = False
    end
    object QryPrincipalCD_PESSOA_PATROC: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'FI_BASE_PLANO_PATRONAL.CD_PESSOA_PATROC'
      Visible = False
    end
    object QryPrincipalCD_PESSOA_ENTID: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'FI_BASE_PLANO_PATRONAL.CD_PESSOA_ENTID'
      Visible = False
    end
    object QryPrincipalCD_PLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PLANO'
      Origin = 'FI_BASE_PLANO_PATRONAL.CD_PLANO'
      Visible = False
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_VERSAO_BASE'
      'set'
      '  DS_VERSAO = :DS_VERSAO,'
      '  DT_GERACAO = :DT_GERACAO,'
      '  LOGIN = :LOGIN,'
      '  DT_REFER_BASE = :DT_REFER_BASE,'
      '  IR_BASE_HISTORICA = :IR_BASE_HISTORICA'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO')
    InsertSQL.Strings = (
      'insert into FI_VERSAO_BASE'
      '  (CD_VERSAO, DS_VERSAO, DT_GERACAO, LOGIN, DT_REFER_BASE, '
      '   IR_BASE_HISTORICA)'
      'values'
      '  (:CD_VERSAO, :DS_VERSAO, :DT_GERACAO, :LOGIN, :DT_REFER_BASE, '
      '   :IR_BASE_HISTORICA)')
    DeleteSQL.Strings = (
      'delete from FI_VERSAO_BASE'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO')
    Left = 325
    Top = 47
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_VERSAO) as Max_CD'
      'from FI_VERSAO_BASE')
    ValidateWithMask = True
    Left = 374
    Top = 12
  end
  object qryEntid: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select pj.CD_PESSOA, pj.NO_PESSOA'
      'from FI_PESSOA_JURIDICA pj, FI_ENTIDADE_PREVIDENCIA e'
      'where e.CD_PESSOA_ENTID = pj.CD_PESSOA')
    ValidateWithMask = True
    Left = 283
    Top = 256
    object qryEntidNO_PESSOA: TStringField
      DisplayLabel = 'Entidade de Previdência'
      DisplayWidth = 60
      FieldName = 'NO_PESSOA'
      Origin = '"CM.FI_PESSOA_JURIDICA".NO_PESSOA'
      Size = 60
    end
    object qryEntidCD_PESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PESSOA'
      Origin = '"CM.FI_PESSOA_JURIDICA".CD_PESSOA'
      Visible = False
    end
  end
  object qryPatroc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select pj.CD_PESSOA, pj.NO_PESSOA'
      'from FI_PESSOA_JURIDICA pj, FI_PATROCINADORA p'
      'where p.CD_PESSOA_PATROC = pj.CD_PESSOA')
    ValidateWithMask = True
    Left = 283
    Top = 216
    object qryPatrocNO_PESSOA: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 60
      FieldName = 'NO_PESSOA'
      Origin = '"CM.FI_PESSOA_JURIDICA".NO_PESSOA'
      Size = 60
    end
    object qryPatrocCD_PESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'CD_PESSOA'
      Origin = '"CM.FI_PESSOA_JURIDICA".CD_PESSOA'
      Visible = False
    end
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CD_PLANO, NO_PLANO '
      'from FI_PLANO_PATRONAL'
      'where CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '   and CD_PESSOA_ENTID = :CD_PESSOA_ENTID')
    ValidateWithMask = True
    Left = 284
    Top = 296
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
      end>
    object qryPlanoNO_PLANO: TStringField
      DisplayLabel = 'Plano Patronal'
      DisplayWidth = 60
      FieldName = 'NO_PLANO'
      Origin = 'FI_PLANO_PATRONAL.NO_PLANO'
      Size = 60
    end
    object qryPlanoCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'FI_PLANO_PATRONAL.CD_PLANO'
      Visible = False
    end
  end
  object qryPlan: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select CD_PLANO, NO_PLANO'
      'from FI_PLANO_PATRONAL'
      'where CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '  and CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '  and CD_PLANO = :CD_PLANO'
      'order by NO_PLANO'
      ' ')
    ValidateWithMask = True
    Left = 354
    Top = 299
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
        DataType = ftUnknown
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
    object qryPlanCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = '"CM.FI_PLANO_PATRONAL".CD_PLANO'
    end
    object qryPlanNO_PLANO: TStringField
      FieldName = 'NO_PLANO'
      Origin = '"CM.FI_PLANO_PATRONAL".NO_PLANO'
      Size = 60
    end
  end
  object dsPlan: TwwDataSource
    AutoEdit = False
    DataSet = qryPlan
    Left = 386
    Top = 300
  end
  object qryEnt: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select CD_PESSOA, NO_PESSOA '
      'from FI_PESSOA_JURIDICA'
      'where CD_PESSOA = :CD_PESSOA_ENTID')
    ValidateWithMask = True
    Left = 354
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end>
    object qryEntCD_PESSOA: TFloatField
      FieldName = 'CD_PESSOA'
      Origin = '"CM.FI_PESSOA_JURIDICA".CD_PESSOA'
    end
    object qryEntNO_PESSOA: TStringField
      DisplayWidth = 60
      FieldName = 'NO_PESSOA'
      Origin = 'FI_PESSOA_JURIDICA.NO_PESSOA'
      Size = 60
    end
  end
  object dsEnt: TwwDataSource
    AutoEdit = False
    DataSet = qryEnt
    Left = 386
    Top = 255
  end
  object qryPat: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select CD_PESSOA, NO_PESSOA'
      'from FI_PESSOA_JURIDICA'
      'where CD_PESSOA = :CD_PESSOA_PATROC')
    ValidateWithMask = True
    Left = 354
    Top = 217
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end>
    object qryPatCD_PESSOA: TFloatField
      FieldName = 'CD_PESSOA'
      Origin = '"CM.FI_PESSOA_JURIDICA".CD_PESSOA'
    end
    object qryPatNO_PESSOA: TStringField
      FieldName = 'NO_PESSOA'
      Origin = 'FI_PESSOA_JURIDICA.NO_PESSOA'
      Size = 60
    end
  end
  object dsPat: TwwDataSource
    AutoEdit = False
    DataSet = qryPat
    Left = 386
    Top = 215
  end
  object qryBasePlano: TwwQuery
    CachedUpdates = True
    BeforePost = qryBasePlanoBeforePost
    AfterPost = qryBasePlanoAfterPost
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select a.* '
      'from FI_BASE_PLANO_PATRONAL a, FI_VERSAO_BASE b'
      'where a.CD_VERSAO = :CD_VERSAO'
      '    and a.CD_VERSAO = b.CD_VERSAO')
    UpdateObject = UpdtSQLBasePlano
    ValidateWithMask = True
    Left = 258
    Top = 78
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object qryBasePlanoCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'FI_BASE_PLANO_PATRONAL.CD_VERSAO'
    end
    object qryBasePlanoCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'FI_BASE_PLANO_PATRONAL.CD_PESSOA_PATROC'
    end
    object qryBasePlanoCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'FI_BASE_PLANO_PATRONAL.CD_PESSOA_ENTID'
    end
    object qryBasePlanoCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'FI_BASE_PLANO_PATRONAL.CD_PLANO'
    end
  end
  object dsBasePlano: TwwDataSource
    AutoEdit = False
    DataSet = qryBasePlano
    Left = 291
    Top = 78
  end
  object UpdtSQLBasePlano: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_BASE_PLANO_PATRONAL'
      'set'
      '  CD_PESSOA_PATROC = :CD_PESSOA_PATROC,'
      '  CD_PESSOA_ENTID = :CD_PESSOA_ENTID,'
      '  CD_PLANO = :CD_PLANO'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO'
      '')
    InsertSQL.Strings = (
      'insert into FI_BASE_PLANO_PATRONAL'
      '  (CD_VERSAO, CD_PESSOA_PATROC, CD_PESSOA_ENTID, CD_PLANO)'
      'values'
      '  (:CD_VERSAO, :CD_PESSOA_PATROC, :CD_PESSOA_ENTID, :CD_PLANO)')
    DeleteSQL.Strings = (
      'delete from FI_BASE_PLANO_PATRONAL'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO and'
      '  CD_PESSOA_PATROC = :OLD_CD_PESSOA_PATROC and'
      '  CD_PESSOA_ENTID = :OLD_CD_PESSOA_ENTID and'
      '  CD_PLANO = :OLD_CD_PLANO')
    Left = 325
    Top = 79
  end
  object wwQryExcluiParticipante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 331
    Top = 160
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_VERSAO_BASE.DS_VERSAO'
      'FI_VERSAO_BASE.DT_REFER_BASE')
    TipodeDado.Strings = (
      'C'
      'D')
    Descricao.Strings = (
      'Nome da Versão'
      'Data de Referência')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'FI_VERSAO_BASE')
    CamposChave.Strings = (
      'FI_VERSAO_BASE.CD_VERSAO')
    Mascaras.Strings = (
      ''
      'dd/mm/yyyy')
    Larguras.Strings = (
      '60'
      '18')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 208
    Top = 47
  end
end
