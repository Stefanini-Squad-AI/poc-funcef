inherited FrmRParamOrcxRealConta: TFrmRParamOrcxRealConta
  Left = 212
  Top = 85
  Caption = 'Orçado x Realizado por Conta'
  ClientHeight = 452
  ClientWidth = 412
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 412
    Height = 413
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
      Width = 46
      Height = 13
      Caption = 'Período'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 25
      Top = 106
      Width = 73
      Height = 13
      Caption = 'Grupo Inicial'
    end
    object Label12: TLabel
      Left = 216
      Top = 106
      Width = 66
      Height = 13
      Caption = 'Grupo Final'
    end
    object lblValoresPor: TLabel
      Left = 25
      Top = 146
      Width = 65
      Height = 13
      Caption = 'Valores por'
    end
    object dblcCentRespConta: TwwDBLookupCombo
      Left = 25
      Top = 80
      Width = 367
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Nome'
        'CODCENTRORESPON'#9'10'#9'Código')
      DataField = 'CODCENTRORESPON'
      LookupTable = qryCenRespConta
      LookupField = 'CODCENTRORESPON'
      Options = [loColLines]
      DropDownCount = 5
      TabOrder = 2
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
      Width = 287
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPERIODO'#9'60'#9'NOMEPERIODO')
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
    object gbParametros: TGroupBox
      Left = 21
      Top = 201
      Width = 379
      Height = 157
      Caption = ' Parâmetros '
      TabOrder = 6
      object Label2: TLabel
        Left = 36
        Top = 15
        Width = 46
        Height = 13
        Caption = 'Posição'
      end
      object Label5: TLabel
        Left = 9
        Top = 30
        Width = 35
        Height = 13
        Caption = 'Inicial'
      end
      object Label7: TLabel
        Left = 66
        Top = 30
        Width = 42
        Height = 13
        Caption = 'Dígitos'
      end
      object Label8: TLabel
        Left = 123
        Top = 30
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object Label9: TLabel
        Left = 288
        Top = 30
        Width = 55
        Height = 13
        Caption = 'Conteúdo'
      end
      object sePosIni1: TwwDBSpinEdit
        Left = 9
        Top = 44
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 0
        UnboundDataType = wwDefault
      end
      object sePosFim1: TwwDBSpinEdit
        Left = 66
        Top = 44
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object edNome1: TEdit
        Left = 123
        Top = 44
        Width = 151
        Height = 21
        TabOrder = 2
      end
      object edConteudo1: TEdit
        Left = 288
        Top = 44
        Width = 79
        Height = 21
        TabOrder = 3
      end
      object sePosIni2: TwwDBSpinEdit
        Left = 9
        Top = 72
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 4
        UnboundDataType = wwDefault
      end
      object sePosFim2: TwwDBSpinEdit
        Left = 66
        Top = 72
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 5
        UnboundDataType = wwDefault
      end
      object edNome2: TEdit
        Left = 123
        Top = 72
        Width = 151
        Height = 21
        TabOrder = 6
      end
      object edConteudo2: TEdit
        Left = 288
        Top = 72
        Width = 79
        Height = 21
        TabOrder = 7
      end
      object sePosIni3: TwwDBSpinEdit
        Left = 9
        Top = 100
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 8
        UnboundDataType = wwDefault
      end
      object sePosFim3: TwwDBSpinEdit
        Left = 66
        Top = 100
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 9
        UnboundDataType = wwDefault
      end
      object edNome3: TEdit
        Left = 123
        Top = 100
        Width = 151
        Height = 21
        TabOrder = 10
      end
      object edConteudo3: TEdit
        Left = 288
        Top = 100
        Width = 79
        Height = 21
        TabOrder = 11
      end
      object sePosIni4: TwwDBSpinEdit
        Left = 9
        Top = 127
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 12
        UnboundDataType = wwDefault
      end
      object sePosFim4: TwwDBSpinEdit
        Left = 66
        Top = 127
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 13
        UnboundDataType = wwDefault
      end
      object edNome4: TEdit
        Left = 123
        Top = 127
        Width = 151
        Height = 21
        TabOrder = 14
      end
      object edConteudo4: TEdit
        Left = 288
        Top = 127
        Width = 79
        Height = 21
        TabOrder = 15
      end
    end
    object dblcGrupoIni: TwwDBLookupCombo
      Left = 25
      Top = 121
      Width = 175
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CODGRUPOORC'#9'10'#9'Código'
        'NOMEGRUPOORCAMEN'#9'60'#9'Nome')
      LookupTable = qryGrupoIni
      LookupField = 'CODGRUPOORC'
      Options = [loColLines]
      DropDownCount = 5
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcGrupoFim: TwwDBLookupCombo
      Left = 216
      Top = 121
      Width = 175
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CODGRUPOORC'#9'10'#9'Código'
        'NOMEGRUPOORCAMEN'#9'60'#9'Nome')
      LookupTable = qryGrupoFim
      LookupField = 'CODGRUPOORC'
      Options = [loColLines]
      DropDownCount = 5
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object reDividirPor: TRealEdit
      Left = 25
      Top = 161
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
    object rgSinal: TRadioGroup
      Left = 165
      Top = 147
      Width = 223
      Height = 49
      Caption = ' Considerar os Valores '
      ItemIndex = 1
      Items.Strings = (
        'Considerando o Sinal'
        'Sempre Positivo')
      TabOrder = 7
    end
    object rgUsuXCCCR: TRadioGroup
      Left = 21
      Top = 361
      Width = 379
      Height = 42
      Caption = 'Usuário por...'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Centro de &Responsabilidade'
        'Centro de &Custo')
      TabOrder = 8
    end
  end
  inherited Dock971: TDock97
    Top = 413
    Width = 412
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
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
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
    Left = 217
    Top = 17
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryCenRespContaNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTRESPON.NOME'
      Size = 30
    end
    object qryCenRespContaCODCENTRORESPON: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Origin = 'CENTRESPON.CODCENTRORESPON'
      Size = 10
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
    Left = 134
    Top = 41
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
    Left = 36
    Top = 26
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
  object qryGrupoIni: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODGRUPOORC, NOMEGRUPOORCAMEN'
      'FROM GRUPOORCAMEN'
      'WHERE (FLGANALSINT = '#39'A'#39')'
      'ORDER BY CODGRUPOORC'
      '')
    ValidateWithMask = True
    Left = 343
    Top = 23
    object qryGrupoIniCODGRUPOORC: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODGRUPOORC'
      Origin = 'GRUPOORCAMEN.CODGRUPOORC'
      Size = 10
    end
    object qryGrupoIniNOMEGRUPOORCAMEN: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NOMEGRUPOORCAMEN'
      Origin = 'GRUPOORCAMEN.NOMEGRUPOORCAMEN'
      Size = 60
    end
  end
  object qryGrupoFim: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODGRUPOORC, NOMEGRUPOORCAMEN'
      'FROM GRUPOORCAMEN'
      'WHERE (FLGANALSINT = '#39'A'#39')'
      'ORDER BY CODGRUPOORC'
      '')
    ValidateWithMask = True
    Left = 286
    Top = 47
    object qryGrupoFimCODGRUPOORC: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODGRUPOORC'
      Origin = 'GRUPOORCAMEN.CODGRUPOORC'
      Size = 10
    end
    object qryGrupoFimNOMEGRUPOORCAMEN: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NOMEGRUPOORCAMEN'
      Origin = 'GRUPOORCAMEN.NOMEGRUPOORCAMEN'
      Size = 60
    end
  end
  object qryGrupoOrc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPOORCAMEN'
      'FROM GRUPOORCAMEN'
      'WHERE (CODGRUPOORC >= :CODGRUPOORCINI)'
      '  AND (CODGRUPOORC <= :CODGRUPOORCFIM)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 328
    Top = 155
    ParamData = <
      item
        DataType = ftString
        Name = 'CODGRUPOORCINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODGRUPOORCFIM'
        ParamType = ptUnknown
      end>
    object qryGrupoOrcIDGRUPOORCAMEN: TFloatField
      FieldName = 'IDGRUPOORCAMEN'
      Origin = 'BASEDADOS.GRUPOORCAMEN.IDGRUPOORCAMEN'
    end
  end
  object qryGrupoVerif: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODGRUPOORC'
      'FROM GRUPOORCAMEN'
      'WHERE (FLGANALSINT = '#39'A'#39')'
      'ORDER BY CODGRUPOORC')
    ValidateWithMask = True
    Left = 79
    Top = 143
    object qryGrupoVerifCODGRUPOORC: TStringField
      FieldName = 'CODGRUPOORC'
      Origin = 'BASEDADOS.GRUPOORCAMEN.CODGRUPOORC'
      FixedChar = True
      Size = 10
    end
  end
end
