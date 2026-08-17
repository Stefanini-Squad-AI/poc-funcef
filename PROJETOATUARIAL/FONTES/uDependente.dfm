inherited frmDependente: TfrmDependente
  Left = 354
  Top = 249
  Caption = 'Dependente'
  ClientHeight = 330
  ClientWidth = 442
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 442
    Height = 241
    object Label8: TLabel
      Left = 22
      Top = 62
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object Label7: TLabel
      Left = 22
      Top = 17
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 22
      Top = 109
      Width = 116
      Height = 13
      Caption = 'Data de Nascimento'
    end
    object Label3: TLabel
      Left = 153
      Top = 109
      Width = 33
      Height = 13
      Caption = 'Idade'
    end
    object Label1: TLabel
      Left = 209
      Top = 62
      Width = 114
      Height = 13
      Caption = 'Grau de Parentesco'
    end
    object Label4: TLabel
      Left = 22
      Top = 201
      Width = 103
      Height = 13
      Caption = 'Grau de Instrução'
    end
    object Label5: TLabel
      Left = 257
      Top = 157
      Width = 49
      Height = 13
      Caption = 'Duração'
    end
    object Label6: TLabel
      Left = 209
      Top = 111
      Width = 105
      Height = 13
      Caption = 'Situacao no Plano'
    end
    object DBEdit4: TDBEdit
      Left = 22
      Top = 77
      Width = 157
      Height = 21
      AutoSelect = False
      DataField = 'NR_MATRICULA'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 22
      Top = 32
      Width = 401
      Height = 21
      AutoSelect = False
      DataField = 'NO_DEPENDENTE'
      DataSource = ds
      TabOrder = 1
    end
    object DBRdGrpSexo: TDBRadioGroup
      Left = 22
      Top = 160
      Width = 216
      Height = 32
      Caption = 'Sexo'
      Columns = 2
      DataField = 'IR_SEXO'
      DataSource = ds
      Items.Strings = (
        'Feminino'
        'Masculino')
      TabOrder = 2
      Values.Strings = (
        'F'
        'M')
    end
    object DateEdit: TCMDateTimePicker
      Left = 22
      Top = 124
      Width = 113
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DT_NASC'
      DataSource = ds
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
    end
    object DBEdit3: TDBEdit
      Left = 153
      Top = 124
      Width = 39
      Height = 21
      AutoSelect = False
      DataField = 'NR_ANOS_DEPENDENTE'
      DataSource = ds
      TabOrder = 4
    end
    object LkcTbParentesco: TwwDBLookupCombo
      Left = 209
      Top = 77
      Width = 214
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_GRAU_DEPENDENCIA'#9'30'#9'Grau de Dependência')
      DataField = 'CD_GRAU_DEPENDENCIA'
      DataSource = ds
      LookupTable = qryParentesco
      LookupField = 'CD_GRAU_DEPENDENCIA'
      Options = [loColLines, loRowLines]
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object LkcTbInstrucao: TwwDBLookupCombo
      Left = 22
      Top = 216
      Width = 216
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_GRAU_INSTRUCAO'#9'30'#9'Grau de Instrução')
      DataField = 'CD_GRAU_INSTRUCAO'
      DataSource = ds
      LookupTable = qryInstrucao
      LookupField = 'CD_GRAU_INSTRUCAO'
      Options = [loColLines, loRowLines]
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object wwDBLookupComboDuracao: TwwDBLookupCombo
      Left = 257
      Top = 172
      Width = 165
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_DURACAO'#9'60'#9'Duração')
      DataField = 'CD_DURACAO'
      DataSource = ds
      LookupTable = wwQryDuracao
      LookupField = 'CD_DURACAO'
      Options = [loColLines, loRowLines]
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object DBLkpCmbSituacaoPlano: TwwDBLookupCombo
      Left = 209
      Top = 124
      Width = 214
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DS_SITUACAO_PLANO'#9'50'#9#9'F')
      DataField = 'CD_DURACAO'
      DataSource = ds
      LookupTable = QrySituacaoPlano
      LookupField = 'CD_SITUACAO_PLANO'
      Options = [loColLines, loRowLines]
      TabOrder = 8
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
  end
  inherited Dock972: TDock97
    Width = 442
  end
  inherited Dock971: TDock97
    Top = 288
    Width = 442
    Height = 42
    inherited tb97Fundo: TToolbar97
      Left = 267
      DockPos = 267
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
      Left = 23
      Top = 6
      Hints.Strings = ()
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 384
    Top = 17
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
    Left = 296
    Top = 45
  end
  inherited ImlPadrao: TImageList
    Left = 356
    Top = 17
  end
  inherited srchdlgProcura: TwwSearchDialog
    Selected.Strings = (
      'NR_MATRICULA'#9'15'#9'Matrícula'#9'F'
      'NO_DEPENDENTE'#9'60'#9'Nome'#9'F')
    ShadowSearchTable = qryPrincipal
    CharCase = ecUpperCase
    Left = 268
    Top = 17
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 296
    Top = 17
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 356
    Top = 45
  end
  object qryPrincipal: TwwQuery
    CachedUpdates = True
    AfterOpen = qryPrincipalAfterOpen
    BeforePost = qryPrincipalBeforePost
    AfterPost = qryPrincipalAfterPost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_DEPENDENTE'
      'where CD_VERSAO = :CD_VERSAO'
      '  and CD_PARTIC = :CD_PARTIC'
      'order by NR_MATRICULA, NO_DEPENDENTE')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 268
    Top = 45
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
    object qryPrincipalNR_MATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 15
      FieldName = 'NR_MATRICULA'
      Origin = 'BASEDADOS.FI_DEPENDENTE.NR_MATRICULA'
      FixedChar = True
      Size = 15
    end
    object qryPrincipalNO_DEPENDENTE: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NO_DEPENDENTE'
      Origin = 'BASEDADOS.FI_DEPENDENTE.NO_DEPENDENTE'
      Size = 60
    end
    object qryPrincipalCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'BASEDADOS.FI_DEPENDENTE.CD_VERSAO'
      Visible = False
    end
    object qryPrincipalCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
      Origin = 'BASEDADOS.FI_DEPENDENTE.CD_PARTIC'
      Visible = False
    end
    object qryPrincipalCD_DEPENDENTE: TFloatField
      FieldName = 'CD_DEPENDENTE'
      Origin = 'BASEDADOS.FI_DEPENDENTE.CD_DEPENDENTE'
      Visible = False
    end
    object qryPrincipalCD_GRAU_INSTRUCAO: TFloatField
      FieldName = 'CD_GRAU_INSTRUCAO'
      Origin = 'BASEDADOS.FI_DEPENDENTE.CD_GRAU_INSTRUCAO'
      Visible = False
    end
    object qryPrincipalCD_GRAU_DEPENDENCIA: TStringField
      FieldName = 'CD_GRAU_DEPENDENCIA'
      Origin = 'BASEDADOS.FI_DEPENDENTE.CD_GRAU_DEPENDENCIA'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qryPrincipalCD_DURACAO: TFloatField
      FieldName = 'CD_DURACAO'
      Origin = 'BASEDADOS.FI_DEPENDENTE.CD_DURACAO'
      Visible = False
    end
    object qryPrincipalDT_NASC: TDateTimeField
      FieldName = 'DT_NASC'
      Origin = 'BASEDADOS.FI_DEPENDENTE.DT_NASC'
      Visible = False
    end
    object qryPrincipalIR_SEXO: TStringField
      FieldName = 'IR_SEXO'
      Origin = 'BASEDADOS.FI_DEPENDENTE.IR_SEXO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryPrincipalNR_ANOS_DEPENDENTE: TFloatField
      FieldName = 'NR_ANOS_DEPENDENTE'
      Origin = 'BASEDADOS.FI_DEPENDENTE.NR_ANOS_DEPENDENTE'
      Visible = False
    end
    object qryPrincipalTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FI_DEPENDENTE.TRGDTINCLUSAO'
      Visible = False
    end
    object qryPrincipalTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FI_DEPENDENTE.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryPrincipalCD_SITUACAO_PLANO: TFloatField
      FieldName = 'CD_SITUACAO_PLANO'
      Origin = 'BASEDADOS.FI_DEPENDENTE.CD_SITUACAO_PLANO'
      Visible = False
    end
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_DEPENDENTE'
      'set'
      '  CD_VERSAO = :CD_VERSAO,'
      '  CD_PARTIC = :CD_PARTIC,'
      '  CD_DEPENDENTE = :CD_DEPENDENTE,'
      '  NO_DEPENDENTE = :NO_DEPENDENTE,'
      '  CD_GRAU_INSTRUCAO = :CD_GRAU_INSTRUCAO,'
      '  CD_GRAU_DEPENDENCIA = :CD_GRAU_DEPENDENCIA,'
      '  CD_DURACAO = :CD_DURACAO,'
      '  NR_MATRICULA = :NR_MATRICULA,'
      '  DT_NASC = :DT_NASC,'
      '  IR_SEXO = :IR_SEXO,'
      '  NR_ANOS_DEPENDENTE = :NR_ANOS_DEPENDENTE,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  CD_SITUACAO_PLANO = :CD_SITUACAO_PLANO'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO and'
      '  CD_PARTIC = :OLD_CD_PARTIC and'
      '  CD_DEPENDENTE = :OLD_CD_DEPENDENTE')
    InsertSQL.Strings = (
      'insert into FI_DEPENDENTE'
      
        '  (CD_VERSAO, CD_PARTIC, CD_DEPENDENTE, NO_DEPENDENTE, CD_GRAU_I' +
        'NSTRUCAO, '
      
        '   CD_GRAU_DEPENDENCIA, CD_DURACAO, NR_MATRICULA, DT_NASC, IR_SE' +
        'XO, NR_ANOS_DEPENDENTE, '
      '   TRGDTINCLUSAO, TRGUSERINCLUSAO, CD_SITUACAO_PLANO)'
      'values'
      
        '  (:CD_VERSAO, :CD_PARTIC, :CD_DEPENDENTE, :NO_DEPENDENTE, :CD_G' +
        'RAU_INSTRUCAO, '
      
        '   :CD_GRAU_DEPENDENCIA, :CD_DURACAO, :NR_MATRICULA, :DT_NASC, :' +
        'IR_SEXO, '
      
        '   :NR_ANOS_DEPENDENTE, :TRGDTINCLUSAO, :TRGUSERINCLUSAO, :CD_SI' +
        'TUACAO_PLANO)')
    DeleteSQL.Strings = (
      'delete from FI_DEPENDENTE'
      'where'
      '  CD_VERSAO = :OLD_CD_VERSAO and'
      '  CD_PARTIC = :OLD_CD_PARTIC and'
      '  CD_DEPENDENTE = :OLD_CD_DEPENDENTE')
    Left = 324
    Top = 45
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(CD_DEPENDENTE) as Max_CD'
      'from FI_DEPENDENTE'
      'where CD_VERSAO = :CD_VERSAO'
      '    and CD_PARTIC = :CD_PARTIC')
    ValidateWithMask = True
    Left = 324
    Top = 17
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
    Top = 73
    object qryParentescoDS_GRAU_DEPENDENCIA: TStringField
      DisplayLabel = 'Grau de Dependência'
      DisplayWidth = 30
      FieldName = 'DS_GRAU_DEPENDENCIA'
      Origin = 'FI_GRAU_DEPENDENCIA.DS_GRAU_DEPENDENCIA'
      Size = 30
    end
    object qryParentescoCD_GRAU_DEPENDENCIA: TStringField
      FieldName = 'CD_GRAU_DEPENDENCIA'
      Origin = 'FI_GRAU_DEPENDENCIA.CD_GRAU_DEPENDENCIA'
      Visible = False
      Size = 3
    end
  end
  object qryParent: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select * from FI_GRAU_DEPENDENCIA'
      'where CD_GRAU_DEPENDENCIA = :CD_GRAU_DEPENDENCIA'
      'order by DS_GRAU_DEPENDENCIA')
    ValidateWithMask = True
    Left = 296
    Top = 73
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_GRAU_DEPENDENCIA'
        ParamType = ptInput
      end>
    object qryParentCD_GRAU_DEPENDENCIA: TStringField
      FieldName = 'CD_GRAU_DEPENDENCIA'
      Origin = 'FI_GRAU_DEPENDENCIA.CD_GRAU_DEPENDENCIA'
      Size = 3
    end
    object qryParentDS_GRAU_DEPENDENCIA: TStringField
      FieldName = 'DS_GRAU_DEPENDENCIA'
      Origin = 'FI_GRAU_DEPENDENCIA.DS_GRAU_DEPENDENCIA'
      Size = 30
    end
  end
  object dsParent: TwwDataSource
    AutoEdit = False
    DataSet = qryParent
    Left = 324
    Top = 73
  end
  object qryInstrucao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_GRAU_INSTRUCAO'
      'order by DS_GRAU_INSTRUCAO')
    ValidateWithMask = True
    Left = 268
    Top = 101
    object qryInstrucaoCD_GRAU_INSTRUCAO: TFloatField
      FieldName = 'CD_GRAU_INSTRUCAO'
      Origin = 'BASEDADOS.FI_GRAU_INSTRUCAO.CD_GRAU_INSTRUCAO'
    end
    object qryInstrucaoDS_GRAU_INSTRUCAO: TStringField
      FieldName = 'DS_GRAU_INSTRUCAO'
      Origin = 'BASEDADOS.FI_GRAU_INSTRUCAO.DS_GRAU_INSTRUCAO'
      FixedChar = True
      Size = 30
    end
  end
  object qryInstruc: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select * from FI_GRAU_INSTRUCAO'
      'where CD_GRAU_INSTRUCAO = :CD_GRAU_INSTRUCAO'
      'order by DS_GRAU_INSTRUCAO')
    ValidateWithMask = True
    Left = 296
    Top = 101
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_GRAU_INSTRUCAO'
        ParamType = ptUnknown
      end>
    object qryInstrucCD_GRAU_INSTRUCAO: TFloatField
      FieldName = 'CD_GRAU_INSTRUCAO'
      Origin = 'FI_GRAU_INSTRUCAO.CD_GRAU_INSTRUCAO'
    end
    object qryInstrucDS_GRAU_INSTRUCAO: TStringField
      FieldName = 'DS_GRAU_INSTRUCAO'
      Origin = 'FI_GRAU_INSTRUCAO.DS_GRAU_INSTRUCAO'
      Size = 30
    end
  end
  object dsInstruc: TwwDataSource
    AutoEdit = False
    DataSet = qryInstruc
    Left = 324
    Top = 101
  end
  object wwQryDuracao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_DURACAO '
      'order by DS_DURACAO')
    ValidateWithMask = True
    Left = 384
    Top = 45
    object wwQryDuracaoCD_DURACAO: TFloatField
      FieldName = 'CD_DURACAO'
      Origin = 'BASEDADOS.FI_DURACAO.CD_DURACAO'
    end
    object wwQryDuracaoDS_DURACAO: TStringField
      FieldName = 'DS_DURACAO'
      Origin = 'BASEDADOS.FI_DURACAO.DS_DURACAO'
      Size = 60
    end
  end
  object wwDsDuracao: TwwDataSource
    AutoEdit = False
    DataSet = wwQryDuracao
    Left = 412
    Top = 45
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FI_DEPENDENTE.NR_MATRICULA'
      'FI_DEPENDENTE.NO_DEPENDENTE')
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
      'FI_DEPENDENTE')
    CamposChave.Strings = (
      'FI_DEPENDENTE.CD_VERSAO'
      'FI_DEPENDENTE.CD_PARTIC'
      'FI_DEPENDENTE.CD_DEPENDENTE')
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
    MultiSelect = False
    Left = 412
    Top = 17
  end
  object QrySituacaoPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CD_SITUACAO_PLANO, DS_SITUACAO_PLANO'
      'FROM FI_SITUACAO_PLANO'
      'ORDER BY DS_SITUACAO_PLANO')
    ValidateWithMask = True
    Left = 356
    Top = 73
    object QrySituacaoPlanoDS_SITUACAO_PLANO: TStringField
      DisplayWidth = 50
      FieldName = 'DS_SITUACAO_PLANO'
      Size = 50
    end
    object QrySituacaoPlanoCD_SITUACAO_PLANO: TFloatField
      FieldName = 'CD_SITUACAO_PLANO'
      Visible = False
    end
  end
end
