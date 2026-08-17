inherited FrmRParamRelAnoGrupo: TFrmRParamRelAnoGrupo
  Left = 168
  Top = 24
  Caption = 'Valores Anuais por Grupo'
  ClientHeight = 493
  ClientWidth = 434
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 434
    Height = 454
    object Label4: TLabel
      Left = 33
      Top = 64
      Width = 160
      Height = 13
      Caption = 'Centro de Responsabilidade'
    end
    object Label3: TLabel
      Left = 32
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
    object Label6: TLabel
      Left = 33
      Top = 103
      Width = 39
      Height = 13
      Caption = 'Moeda'
    end
    object Label10: TLabel
      Left = 342
      Top = 103
      Width = 28
      Height = 13
      Caption = 'Grau'
    end
    object Label11: TLabel
      Left = 33
      Top = 139
      Width = 73
      Height = 13
      Caption = 'Grupo Inicial'
    end
    object Label12: TLabel
      Left = 224
      Top = 139
      Width = 66
      Height = 13
      Caption = 'Grupo Final'
    end
    object lblCenario: TLabel
      Left = 26
      Top = 340
      Width = 44
      Height = 13
      Caption = 'Cenário'
    end
    object dblcCentRespConta: TwwDBLookupCombo
      Left = 33
      Top = 80
      Width = 208
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
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblkExercicio: TwwDBLookupCombo
      Left = 32
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
    end
    object gbParametros: TGroupBox
      Left = 26
      Top = 179
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
    object dblcMoeda: TwwDBLookupCombo
      Left = 33
      Top = 116
      Width = 298
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MOEDESC'#9'20'#9'Descrição'
        'MOECODIGO'#9'10'#9'Código')
      DataField = 'CODCENTRORESPON'
      LookupTable = qryMoeda
      LookupField = 'MOECODIGO'
      Options = [loColLines]
      DropDownCount = 5
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object seGrauGrupo: TwwDBSpinEdit
      Left = 342
      Top = 116
      Width = 57
      Height = 21
      Increment = 1
      TabOrder = 3
      UnboundDataType = wwDefault
    end
    object dblcGrupoIni: TwwDBLookupCombo
      Left = 33
      Top = 154
      Width = 175
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CODGRUPOORC'#9'10'#9'Código'
        'NOMEGRUPOORCAMEN'#9'60'#9'Nome')
      DataField = 'CODCENTRORESPON'
      LookupTable = qryGrupoIni
      LookupField = 'CODGRUPOORC'
      Options = [loColLines]
      DropDownCount = 5
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcGrupoFim: TwwDBLookupCombo
      Left = 224
      Top = 154
      Width = 175
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CODGRUPOORC'#9'10'#9'Código'
        'NOMEGRUPOORCAMEN'#9'60'#9'Nome')
      DataField = 'CODCENTRORESPON'
      LookupTable = qryGrupoFim
      LookupField = 'CODGRUPOORC'
      Options = [loColLines]
      DropDownCount = 5
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcCenario: TCMDBLookupCombo
      Left = 26
      Top = 355
      Width = 378
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMECENARIO'#9'60'#9'Nome do Cenário')
      LookupTable = qryCenario
      LookupField = 'IDCENARIOORCAMEN'
      Options = [loTitles]
      Style = csDropDownList
      Enabled = False
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object rgImpValores: TRadioGroup
      Left = 107
      Top = 15
      Width = 292
      Height = 46
      Caption = ' Imprimir Valores '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        '&Orçados'
        '&Realizados'
        '&Cenários')
      TabOrder = 8
      OnClick = rgImpValoresClick
    end
    object pbAguarde: TProgressBar
      Left = 5
      Top = 433
      Width = 424
      Height = 16
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 9
    end
    object cbZerados: TCheckBox
      Left = 252
      Top = 84
      Width = 172
      Height = 17
      Caption = 'Imprime Valores Zerados'
      TabOrder = 10
    end
    object rgUsuXCCCR: TRadioGroup
      Left = 26
      Top = 382
      Width = 379
      Height = 42
      Caption = 'Usuário por...'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Centro de &Responsabilidade'
        'Centro de &Custo')
      TabOrder = 11
    end
  end
  inherited Dock971: TDock97
    Top = 454
    Width = 434
    inherited tb97Fundo: TToolbar97
      Left = 267
      DockPos = 268
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited ToolbarSep971: TToolbarSep97
        Left = 180
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 97
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 100
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 183
      end
      object bbtnGerarTXT: TBitBtn
        Left = 0
        Top = 0
        Width = 97
        Height = 33
        Caption = '&Gerar TXT'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnGerarTXTClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
          3333333330FF00333333333330FFFF00333333330FF44FFF003333330FFFF44F
          FF033330FFCCFFFFFF033330FFFFCCFFF033330FFCCFFFCCF033330FFFFCCFFF
          033330FFCCFFFCCF033330FFFFCCFFF033333300FFFFCCF03333333300FFFF03
          333333333300FF03333333333333003333333333333333333333}
        Spacing = 2
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
    Left = 154
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
    Left = 32
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
  object qryCompSaldo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 391
    Top = 197
  end
  object qryPeriodos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  '
      '   PERIODO, NOMEPERIODO, DATAINIPERIODO, DATAFIMPERIODO'
      'FROM '
      '   PERIODOORCAMEN '
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND '
      '   (EXERCICIO=:EXERCICIO) AND'
      '   (PERIODO >=1 AND PERIODO <=12)'
      'ORDER BY'
      '   PERIODO')
    ValidateWithMask = True
    Left = 309
    Top = 191
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
    object qryPeriodosPERIODO: TFloatField
      FieldName = 'PERIODO'
      Origin = 'PERIODOORCAMEN.PERIODO'
    end
    object qryPeriodosNOMEPERIODO: TStringField
      FieldName = 'NOMEPERIODO'
      Origin = 'PERIODOORCAMEN.NOMEPERIODO'
      Size = 60
    end
    object qryPeriodosDATAINIPERIODO: TDateTimeField
      FieldName = 'DATAINIPERIODO'
      Origin = 'PERIODOORCAMEN.DATAINIPERIODO'
    end
    object qryPeriodosDATAFIMPERIODO: TDateTimeField
      FieldName = 'DATAFIMPERIODO'
      Origin = 'PERIODOORCAMEN.DATAFIMPERIODO'
    end
  end
  object qryMoeda: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MOECODIGO, MOEDESC'
      'FROM'
      '   MOEDA'
      'WHERE'
      '   MOEINATIVO = '#39'A'#39
      'ORDER BY'
      '  MOEDESC')
    ValidateWithMask = True
    Left = 226
    Top = 17
  end
  object qryGrupoIni: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODGRUPOORC, NOMEGRUPOORCAMEN'
      'FROM GRUPOORCAMEN'
      'ORDER BY CODGRUPOORC'
      '')
    ValidateWithMask = True
    Left = 374
    Top = 21
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
      'ORDER BY CODGRUPOORC'
      '')
    ValidateWithMask = True
    Left = 298
    Top = 14
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
  object qryCenario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCENARIOORCAMEN, NOMECENARIO'
      'FROM CENARIOORCAMEN'
      'ORDER BY NOMECENARIO'
      ' ')
    ValidateWithMask = True
    Left = 78
    Top = 86
  end
  object qryGrupoOrc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPOORCAMEN'
      'FROM GRUPOORCAMEN'
      'WHERE (CODGRUPOORC LIKE :CODGRUPOORC) '
      ' ')
    ValidateWithMask = True
    Left = 220
    Top = 137
    ParamData = <
      item
        DataType = ftString
        Name = 'CODGRUPOORC'
        ParamType = ptUnknown
      end>
    object qryGrupoOrcIDGRUPOORCAMEN: TFloatField
      FieldName = 'IDGRUPOORCAMEN'
      Origin = 'BASEDADOS.GRUPOORCAMEN.IDGRUPOORCAMEN'
    end
  end
end
