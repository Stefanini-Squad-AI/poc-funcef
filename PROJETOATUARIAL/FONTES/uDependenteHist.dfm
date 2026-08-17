inherited frmDependenteHist: TfrmDependenteHist
  Left = 258
  Top = 115
  Caption = 'Base de Histórico  - Dependente'
  ClientHeight = 330
  ClientWidth = 440
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 440
    Height = 241
    object Label8: TLabel
      Left = 24
      Top = 59
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object Label7: TLabel
      Left = 24
      Top = 17
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 24
      Top = 109
      Width = 116
      Height = 13
      Caption = 'Data de Nascimento'
    end
    object Label3: TLabel
      Left = 165
      Top = 109
      Width = 33
      Height = 13
      Caption = 'Idade'
    end
    object Label1: TLabel
      Left = 211
      Top = 59
      Width = 114
      Height = 13
      Caption = 'Grau de Parentesco'
    end
    object Label4: TLabel
      Left = 227
      Top = 109
      Width = 103
      Height = 13
      Caption = 'Grau de Instrução'
    end
    object DBEdit5: TDBEdit
      Left = 227
      Top = 124
      Width = 189
      Height = 21
      AutoSelect = False
      Color = clSilver
      DataField = 'DS_GRAU_INSTRUCAO'
      DataSource = ds2
      ReadOnly = True
      TabOrder = 8
    end
    object DBEdit6: TDBEdit
      Left = 211
      Top = 74
      Width = 204
      Height = 21
      AutoSelect = False
      Color = clSilver
      DataField = 'DS_GRAU_DEPENDENCIA'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit1: TDBEdit
      Left = 24
      Top = 124
      Width = 118
      Height = 21
      Color = clSilver
      DataField = 'DT_NASC'
      DataSource = ds
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit4: TDBEdit
      Left = 24
      Top = 74
      Width = 157
      Height = 21
      AutoSelect = False
      Color = clSilver
      DataField = 'NR_MATRICULA'
      DataSource = ds
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 24
      Top = 32
      Width = 391
      Height = 21
      AutoSelect = False
      Color = clSilver
      DataField = 'NO_DEPENDENTE'
      DataSource = ds
      ReadOnly = True
      TabOrder = 0
    end
    object DBRdGrpSexo: TDBRadioGroup
      Left = 24
      Top = 160
      Width = 112
      Height = 57
      Caption = 'Sexo'
      DataField = 'IR_SEXO'
      DataSource = ds
      Items.Strings = (
        'Feminino'
        'Masculino')
      ReadOnly = True
      TabOrder = 9
      Values.Strings = (
        'F'
        'M')
    end
    object DBRdGrpTitular: TDBRadioGroup
      Left = 291
      Top = 160
      Width = 127
      Height = 57
      Caption = 'Titular da Pensão'
      DataField = 'IR_E_TITULAR_PENSAO'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      ReadOnly = True
      TabOrder = 11
      Values.Strings = (
        'S'
        'N')
    end
    object DateEdit: TCMDateTimePicker
      Left = 24
      Top = 124
      Width = 113
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
      TabOrder = 4
      Visible = False
    end
    object DBRdGrpDuracao: TDBRadioGroup
      Left = 156
      Top = 160
      Width = 116
      Height = 57
      Caption = 'Duração'
      DataField = 'CD_DURACAO'
      DataSource = ds
      Items.Strings = (
        'Temporária'
        'Vitalícia')
      ReadOnly = True
      TabOrder = 10
      Values.Strings = (
        'T'
        'V')
    end
    object DBEdit3: TDBEdit
      Left = 165
      Top = 124
      Width = 39
      Height = 21
      AutoSelect = False
      Color = clSilver
      DataField = 'NR_ANOS_DEPENDENTE'
      DataSource = ds
      TabOrder = 6
    end
    object LkcTbParentesco: TwwDBLookupCombo
      Left = 211
      Top = 74
      Width = 199
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_GRAU_DEPENDENCIA'#9'30'#9'Grau de Dependência')
      DataField = 'CD_GRAU_DEPENDENCIA'
      DataSource = ds
      LookupTable = qryParentesco
      LookupField = 'CD_GRAU_DEPENDENCIA'
      Options = [loColLines, loRowLines]
      TabOrder = 2
      Visible = False
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object LkcTbInstrucao: TwwDBLookupCombo
      Left = 227
      Top = 124
      Width = 184
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_GRAU_INSTRUCAO'#9'30'#9'Grau de Instrução')
      DataField = 'CD_GRAU_INSTRUCAO'
      DataSource = ds
      LookupTable = qryInstrucao
      LookupField = 'CD_GRAU_INSTRUCAO'
      Options = [loColLines, loRowLines]
      TabOrder = 7
      Visible = False
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
  end
  inherited Dock972: TDock97
    Width = 440
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 16
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 16
        Width = 15
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 46
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 31
        Width = 15
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 288
    Width = 440
    Height = 42
    inherited tb97Fundo: TToolbar97
      Left = 266
      DockPos = 266
      inherited bbtnSair: TBitBtn
        Top = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Top = 1
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 98
      DockPos = 98
      inherited bbtnConfirmar: TBitBtn
        Top = 1
      end
      inherited bbtnCancelar: TBitBtn
        Height = 36
      end
    end
    inherited dbnav: TDBNavigator
      Left = 24
      Hints.Strings = ()
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
    DataSet = qryPrincipal
    Left = 299
    Top = 43
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 263
    Top = 12
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 333
    Top = 13
  end
  object qryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = qryPrincipalAfterOpen
    BeforePost = qryPrincipalBeforePost
    AfterPost = qryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_BK_DEPENDENTE'
      'where CD_VERSAO = :CD_VERSAO'
      '    and CD_PARTIC = :CD_PARTIC'
      'order by NR_MATRICULA, NO_DEPENDENTE')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 268
    Top = 43
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end>
    object qryPrincipalCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'FI_BK_DEPENDENTE.CD_VERSAO'
    end
    object qryPrincipalCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
      Origin = 'FI_BK_DEPENDENTE.CD_PARTIC'
    end
    object qryPrincipalCD_DEPENDENTE: TFloatField
      FieldName = 'CD_DEPENDENTE'
      Origin = 'FI_BK_DEPENDENTE.CD_DEPENDENTE'
    end
    object qryPrincipalNO_DEPENDENTE: TStringField
      FieldName = 'NO_DEPENDENTE'
      Origin = 'FI_BK_DEPENDENTE.NO_DEPENDENTE'
      Size = 60
    end
    object qryPrincipalCD_GRAU_INSTRUCAO: TFloatField
      FieldName = 'CD_GRAU_INSTRUCAO'
      Origin = 'FI_BK_DEPENDENTE.CD_GRAU_INSTRUCAO'
    end
    object qryPrincipalCD_GRAU_DEPENDENCIA: TStringField
      FieldName = 'CD_GRAU_DEPENDENCIA'
      Origin = 'FI_BK_DEPENDENTE.CD_GRAU_DEPENDENCIA'
      Size = 3
    end
    object qryPrincipalCD_DURACAO: TFloatField
      FieldName = 'CD_DURACAO'
      Origin = 'FI_BK_DEPENDENTE.CD_DURACAO'
    end
    object qryPrincipalNR_MATRICULA: TStringField
      FieldName = 'NR_MATRICULA'
      Origin = 'FI_BK_DEPENDENTE.NR_MATRICULA'
      Size = 15
    end
    object qryPrincipalDT_NASC: TDateTimeField
      FieldName = 'DT_NASC'
      Origin = 'FI_BK_DEPENDENTE.DT_NASC'
    end
    object qryPrincipalIR_SEXO: TStringField
      FieldName = 'IR_SEXO'
      Origin = 'FI_BK_DEPENDENTE.IR_SEXO'
      Size = 1
    end
    object qryPrincipalNR_ANOS_DEPENDENTE: TFloatField
      FieldName = 'NR_ANOS_DEPENDENTE'
      Origin = 'FI_BK_DEPENDENTE.NR_ANOS_DEPENDENTE'
    end
    object qryPrincipalIR_E_TITULAR_PENSAO: TStringField
      FieldName = 'IR_E_TITULAR_PENSAO'
      Origin = 'FI_BK_DEPENDENTE.IR_E_TITULAR_PENSAO'
      Size = 1
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_BK_DEPENDENTE'
      'set'
      '  NO_DEPENDENTE = :NO_DEPENDENTE,'
      '  CD_GRAU_INSTRUCAO = :CD_GRAU_INSTRUCAO,'
      '  CD_GRAU_DEPENDENCIA = :CD_GRAU_DEPENDENCIA,'
      '  CD_DURACAO = :CD_DURACAO,'
      '  NR_MATRICULA = :NR_MATRICULA,'
      '  DT_NASC = :DT_NASC,'
      '  IR_SEXO = :IR_SEXO,'
      '  NR_ANOS_DEPENDENTE = :NR_ANOS_DEPENDENTE,'
      '  IR_E_TITULAR_PENSAO = :IR_E_TITULAR_PENSAO'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO and'
      '  CD_PARTIC = :OLD_CD_PARTIC and'
      '  CD_DEPENDENTE = :OLD_CD_DEPENDENTE')
    InsertSQL.Strings = (
      'insert into FI_BK_DEPENDENTE'
      '  (CD_VERSAO, CD_PARTIC, CD_DEPENDENTE, NO_DEPENDENTE, '
      '   CD_GRAU_INSTRUCAO, CD_GRAU_DEPENDENCIA, CD_DURACAO, '
      '   NR_MATRICULA, DT_NASC, IR_SEXO, NR_ANOS_DEPENDENTE, '
      '   IR_E_TITULAR_PENSAO)'
      'values'
      '  (:CD_VERSAO, :CD_PARTIC, :CD_DEPENDENTE, :NO_DEPENDENTE, '
      '   :CD_GRAU_INSTRUCAO, :CD_GRAU_DEPENDENCIA, :CD_DURACAO, '
      '   :NR_MATRICULA, :DT_NASC, :IR_SEXO, :NR_ANOS_DEPENDENTE, '
      '   :IR_E_TITULAR_PENSAO)')
    DeleteSQL.Strings = (
      'delete from FI_BK_DEPENDENTE'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO and'
      '  CD_PARTIC = :OLD_CD_PARTIC and'
      '  CD_DEPENDENTE = :OLD_CD_DEPENDENTE')
    Left = 330
    Top = 43
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_DEPENDENTE) as Max_CD'
      'from FI_BK_DEPENDENTE'
      'where CD_VERSAO = :CD_VERSAO'
      '    and CD_PARTIC = :CD_PARTIC')
    ValidateWithMask = True
    Left = 383
    Top = 20
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end>
  end
  object qryParentesco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_GRAU_DEPENDENCIA'
      'order by DS_GRAU_DEPENDENCIA')
    ValidateWithMask = True
    Left = 268
    Top = 118
    object qryParentescoCD_GRAU_DEPENDENCIA: TStringField
      FieldName = 'CD_GRAU_DEPENDENCIA'
      Origin = 'FI_GRAU_DEPENDENCIA.CD_GRAU_DEPENDENCIA'
      Size = 3
    end
    object qryParentescoDS_GRAU_DEPENDENCIA: TStringField
      FieldName = 'DS_GRAU_DEPENDENCIA'
      Origin = 'FI_GRAU_DEPENDENCIA.DS_GRAU_DEPENDENCIA'
      Size = 30
    end
  end
  object qry1: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select * from FI_GRAU_DEPENDENCIA'
      'where CD_GRAU_DEPENDENCIA = :CD_GRAU_DEPENDENCIA'
      'order by DS_GRAU_DEPENDENCIA')
    ValidateWithMask = True
    Left = 308
    Top = 118
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRAU_DEPENDENCIA'
        ParamType = ptUnknown
      end>
    object qry1CD_GRAU_DEPENDENCIA: TStringField
      FieldName = 'CD_GRAU_DEPENDENCIA'
      Origin = 'FI_GRAU_DEPENDENCIA.CD_GRAU_DEPENDENCIA'
      Size = 3
    end
    object qry1DS_GRAU_DEPENDENCIA: TStringField
      FieldName = 'DS_GRAU_DEPENDENCIA'
      Origin = 'FI_GRAU_DEPENDENCIA.DS_GRAU_DEPENDENCIA'
      Size = 30
    end
  end
  object ds1: TwwDataSource
    AutoEdit = False
    DataSet = qry1
    Left = 339
    Top = 118
  end
  object qryInstrucao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_GRAU_INSTRUCAO'
      'order by DS_GRAU_INSTRUCAO')
    ValidateWithMask = True
    Left = 268
    Top = 168
    object qryInstrucaoDS_GRAU_INSTRUCAO: TStringField
      DisplayLabel = 'Grau de Instrução'
      DisplayWidth = 30
      FieldName = 'DS_GRAU_INSTRUCAO'
      Origin = 'FI_GRAU_INSTRUCAO.DS_GRAU_INSTRUCAO'
      Size = 30
    end
    object qryInstrucaoCD_GRAU_INSTRUCAO: TFloatField
      FieldName = 'CD_GRAU_INSTRUCAO'
      Origin = 'FI_GRAU_INSTRUCAO.CD_GRAU_INSTRUCAO'
      Visible = False
    end
  end
  object qry2: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select * from FI_GRAU_INSTRUCAO'
      'where CD_GRAU_INSTRUCAO = :CD_GRAU_INSTRUCAO'
      'order by DS_GRAU_INSTRUCAO')
    ValidateWithMask = True
    Left = 308
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_GRAU_INSTRUCAO'
        ParamType = ptUnknown
      end>
    object qry2CD_GRAU_INSTRUCAO: TFloatField
      FieldName = 'CD_GRAU_INSTRUCAO'
      Origin = 'FI_GRAU_INSTRUCAO.CD_GRAU_INSTRUCAO'
    end
    object qry2DS_GRAU_INSTRUCAO: TStringField
      FieldName = 'DS_GRAU_INSTRUCAO'
      Origin = 'FI_GRAU_INSTRUCAO.DS_GRAU_INSTRUCAO'
      Size = 30
    end
  end
  object ds2: TwwDataSource
    AutoEdit = False
    DataSet = qry2
    Left = 339
    Top = 168
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_BK_DEPENDENTE.NR_MATRICULA'
      'FI_BK_DEPENDENTE.NO_DEPENDENTE')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Matricula'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'FI_BK_DEPENDENTE')
    CamposChave.Strings = (
      'FI_BK_DEPENDENTE.CD_VERSAO'
      'FI_BK_DEPENDENTE.CD_PARTIC'
      'FI_BK_DEPENDENTE.CD_DEPENDENTE')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 192
    Top = 159
  end
end
