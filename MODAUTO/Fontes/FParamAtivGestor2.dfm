inherited frmParamAtivGestor2: TfrmParamAtivGestor2
  Left = 240
  Top = 99
  Caption = 'Distribuição de Saldos por Grupo de Contas - modelo 2'
  ClientHeight = 361
  ClientWidth = 353
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 353
    Height = 322
    object Label4: TLabel
      Left = 25
      Top = 64
      Width = 160
      Height = 13
      Caption = 'Centro de Responsabilidade'
    end
    object Label3: TLabel
      Left = 24
      Top = 24
      Width = 55
      Height = 13
      Caption = 'Exercício'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 104
      Top = 24
      Width = 84
      Height = 13
      Caption = 'Período Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 224
      Top = 24
      Width = 77
      Height = 13
      Caption = 'Período Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValoresPor: TLabel
      Left = 24
      Top = 197
      Width = 69
      Height = 13
      Caption = 'Valores por:'
    end
    object rdgOrdenacao: TRadioGroup
      Left = 24
      Top = 116
      Width = 305
      Height = 61
      Caption = 'Ordenar por...'
      ItemIndex = 0
      Items.Strings = (
        'Código do Grupo Orçamentário'
        'Nome do Grupo Orçamentário')
      TabOrder = 3
    end
    object dblcCentRespConta: TwwDBLookupCombo
      Left = 24
      Top = 80
      Width = 305
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CODCENTRORESPON'#9'10'#9'Código'
        'NOME'#9'30'#9'Nome')
      DataField = 'CODCENTRORESPON'
      LookupTable = qryCenRespConta
      LookupField = 'CODCENTRORESPON'
      Options = [loColLines]
      DropDownCount = 5
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblkExercicio: TwwDBLookupCombo
      Left = 24
      Top = 40
      Width = 65
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'EXERCICIO'#9'10'#9'EXERCICIO')
      DataField = 'PEREXERCI'
      LookupTable = qryExercicio
      LookupField = 'EXERCICIO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnClick = dblkExercicioClick
      OnExit = dblkExercicioClick
    end
    object dblkPeriodoIni: TwwDBLookupCombo
      Left = 104
      Top = 40
      Width = 105
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPERIODO'#9'60'#9'NOMEPERIODO')
      DataField = 'PEREXERCI'
      LookupTable = qryPeriodoIni
      LookupField = 'PERIODO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object dblkPeriodoFim: TwwDBLookupCombo
      Left = 224
      Top = 40
      Width = 105
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPERIODO'#9'60'#9'NOMEPERIODO')
      DataField = 'PEREXERCI'
      LookupTable = qryPeriodoFim
      LookupField = 'PERIODO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object reDividirPor: TRealEdit
      Left = 99
      Top = 189
      Width = 130
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 5
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object cbMovimento: TCheckBox
      Left = 24
      Top = 222
      Width = 301
      Height = 17
      Caption = 'Imprimir somente as Contas com Movimento'
      TabOrder = 6
    end
    object rgUsuXCCCR: TRadioGroup
      Left = 24
      Top = 247
      Width = 305
      Height = 61
      Caption = 'Usuário por...'
      ItemIndex = 0
      Items.Strings = (
        'Centro de &Responsabilidade'
        'Centro de &Custo')
      TabOrder = 7
    end
  end
  inherited Dock971: TDock97
    Top = 322
    Width = 353
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65499
    Top = 65499
  end
  object qryCenRespConta: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   CODCENTRORESPON, NOME'
      'FROM '
      '   CENTRESPON '
      'WHERE'
      '   IDPESSOA =:IDPESSOA'
      'ORDER BY '
      '  NOME')
    ValidateWithMask = True
    Left = 232
    Top = 72
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryCenRespContaCODCENTRORESPON: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Origin = 'CENTRESPON.CODCENTRORESPON'
      Size = 10
    end
    object qryCenRespContaNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTRESPON.NOME'
      Size = 30
    end
  end
  object qryExercicio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT '
      '   EXERCICIO '
      'FROM '
      '   PERIODOORCAMEN '
      'WHERE'
      '   IDPESSOA =:IDPESSOA'
      'ORDER BY '
      '   EXERCICIO')
    ValidateWithMask = True
    Left = 56
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryExercicioEXERCICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'EXERCICIO'
      Origin = 'PERIODOORCAMEN.EXERCICIO'
    end
  end
  object qryPeriodoIni: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  '
      '   PERIODO, NOMEPERIODO '
      'FROM '
      '   PERIODOORCAMEN '
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND '
      '   (EXERCICIO=:EXERCICIO)'
      'ORDER BY '
      '   PERIODO')
    ValidateWithMask = True
    Left = 168
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EXERCICIO'
        ParamType = ptUnknown
      end>
    object qryPeriodoIniNOMEPERIODO: TStringField
      DisplayWidth = 60
      FieldName = 'NOMEPERIODO'
      Origin = 'PERIODOORCAMEN.NOMEPERIODO'
      Size = 60
    end
    object qryPeriodoIniPERIODO: TFloatField
      FieldName = 'PERIODO'
      Origin = 'PERIODOORCAMEN.PERIODO'
      Visible = False
    end
  end
  object qryPeriodoFim: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  '
      '   PERIODO, NOMEPERIODO '
      'FROM '
      '   PERIODOORCAMEN '
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND '
      '   (EXERCICIO=:EXERCICIO)'
      'ORDER BY '
      '   PERIODO')
    ValidateWithMask = True
    Left = 280
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EXERCICIO'
        ParamType = ptUnknown
      end>
    object qryPeriodoFimNOMEPERIODO: TStringField
      DisplayWidth = 60
      FieldName = 'NOMEPERIODO'
      Origin = 'PERIODOORCAMEN.NOMEPERIODO'
      Size = 60
    end
    object qryPeriodoFimPERIODO: TFloatField
      FieldName = 'PERIODO'
      Origin = 'PERIODOORCAMEN.PERIODO'
      Visible = False
    end
  end
end
