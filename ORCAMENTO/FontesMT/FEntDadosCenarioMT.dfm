inherited frmEntDadosCenarioMT: TfrmEntDadosCenarioMT
  Left = 409
  Top = 119
  HelpContext = 520009
  Caption = 'Entrada de Dados - Cenários'
  ClientHeight = 409
  ClientWidth = 473
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 473
    Height = 370
    object lblExercicio: TLabel
      Left = 25
      Top = 19
      Width = 55
      Height = 13
      Caption = 'Exercício'
    end
    object Label1: TLabel
      Left = 83
      Top = 313
      Width = 75
      Height = 13
      Caption = 'Valor Orçado'
    end
    object lblCodigoConta: TLabel
      Left = 25
      Top = 62
      Width = 95
      Height = 13
      Caption = 'Código da Conta'
    end
    object lblCenario: TLabel
      Left = 127
      Top = 19
      Width = 44
      Height = 13
      Caption = 'Cenário'
    end
    object lblPeriodo: TLabel
      Left = 25
      Top = 313
      Width = 46
      Height = 13
      Caption = 'Período'
    end
    object dbgrdSaldo: TwwDBGrid
      Left = 25
      Top = 110
      Width = 424
      Height = 191
      TabStop = False
      Selected.Strings = (
        'EXERCICIO'#9'9'#9'Exercício'
        'PERIODO'#9'10'#9'Período'
        'VLRORCCENARIO'#9'10'#9'Valor Orçado para o Cenário')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsSaldo
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 5
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = dbgrdSaldoCalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = dbgrdSaldoTopRowChanged
    end
    object spnedExercicio: TSpinEdit
      Left = 25
      Top = 35
      Width = 81
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
      OnChange = spnedExercicioChange
    end
    object rdgSinal: TRadioGroup
      Left = 256
      Top = 317
      Width = 193
      Height = 37
      Caption = 'Sinal da Conta'
      Columns = 2
      Enabled = False
      ItemIndex = 0
      Items.Strings = (
        'Positivo'
        'Negativo')
      TabOrder = 8
    end
    object bbtnBuscaConta: TBitBtn
      Left = 130
      Top = 78
      Width = 25
      Height = 21
      Hint = 'Procura a Conta'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = bbtnBuscaContaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
    end
    object edtNomeConta: TEdit
      Left = 166
      Top = 78
      Width = 283
      Height = 21
      TabStop = False
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
    object edtCodigoConta: TEdit
      Left = 25
      Top = 78
      Width = 105
      Height = 21
      TabOrder = 2
      OnExit = edtCodigoContaExit
    end
    object dblcCenario: TCMDBLookupCombo
      Left = 127
      Top = 35
      Width = 322
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMECENARIO'#9'60'#9'Nome do Cenário')
      LookupTable = cdsCenario
      LookupField = 'IDCENARIOORCAMEN'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object redPeriodo: TDBRealEdit
      Left = 25
      Top = 330
      Width = 53
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      MaxLength = 4
      TabOrder = 6
      WordWrap = False
      OnExit = redPeriodoExit
      IntDigits = 4
      DecDigits = 0
      NumberFormat = fNumber
      Signal = False
    end
    object redValorOrcado: TDBRealEdit
      Left = 87
      Top = 330
      Width = 137
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      TabOrder = 7
      WordWrap = False
      OnEnter = redValorOrcadoEnter
      OnExit = redValorOrcadoExit
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fFixed
      Signal = False
    end
  end
  inherited Dock971: TDock97
    Top = 370
    Width = 473
    inherited tb97Fundo: TToolbar97
      Left = 301
      DockPos = 304
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520009
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 132
      DockPos = 135
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
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
  object dsSaldo: TwwDataSource
    DataSet = cdsSaldo
    Left = 392
    Top = 152
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN'
      'CENTRESPON.CODCENTRORESPON'
      'CENTRESPON.NOME'
      'CONTASORCAMEN.OBSERVACAO'
      'CONTASORCAMEN.TIPOCALCREALIZADO'
      'CONTASORCAMEN.TIPOCALCORCADO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código da Conta'
      'Nome da Conta'
      'Cód.Cent.Resp.'
      'Centro de Responsabilidade'
      'Observação'
      'Tipo de Cálculo Realizado'
      'Tipo de Cálculo Orçado')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTASORCAMEN'
      'CENTRESPON')
    CamposChave.Strings = (
      'CONTASORCAMEN.IDPLANOORCAMEN'
      'CONTASORCAMEN.IDCONTAORCAMEN')
    Filtro.Strings = (
      'CENTRESPON.CODCENTRORESPON = CONTASORCAMEN.CODCENTRORESPON')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '60'
      '10'
      '30'
      '60'
      '1'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 46
    Top = 152
  end
  object ds: TwwDataSource
    DataSet = cds
    Left = 392
    Top = 120
  end
  object sql: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  IDCONTAORCAMEN, IDPLANOORCAMEN, NOMECONTAORCAMEN, FLGSINALCONT' +
        'A'
      'FROM'
      '  CONTASORCAMEN'
      'WHERE'
      
        '  (IDCONTAORCAMEN = :IDCONTAORCAMEN) AND (IDPLANOORCAMEN = :IDPL' +
        'ANOORCAMEN)'
      '   '
      ' ')
    ClientDataSet = cds
    Left = 328
    Top = 120
  end
  object sqlSaldo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  EXERCICIO, PERIODO, IDVALORESCENARIO, VLRORCCENARIO'
      'FROM'
      '  VALORESCENARIO'
      'WHERE'
      '  (IDPESSOA = :IDPESSOA) AND (EXERCICIO = :EXERCICIO) AND'
      
        '  (IDCONTAORCAMEN = :IDCONTAORCAMEN) AND (IDPLANOORCAMEN = :IDPL' +
        'ANOORCAMEN) AND'
      '  (IDCENARIOORCAMEN = :IDCENARIOORCAMEN)'
      'ORDER BY'
      '  EXERCICIO, PERIODO')
    ClientDataSet = cdsSaldo
    Left = 328
    Top = 152
  end
  object sqlCenario: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDCENARIOORCAMEN, NOMECENARIO'
      'FROM'
      '  CENARIOORCAMEN'
      'ORDER BY'
      '  NOMECENARIO')
    ClientDataSet = cdsCenario
    Left = 328
    Top = 184
  end
  object sqlPeriodo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PERIODO, DATAINIPERIODO, DATAFIMPERIODO, FLGBLOQUEADO'
      'FROM '
      '  PERIODOORCAMEN '
      'WHERE'
      '  (EXERCICIO = :EXERCICIO) AND (IDPESSOA = :PESSOA)'
      'ORDER BY'
      '  PERIODO')
    ClientDataSet = cdsPeriodo
    Left = 328
    Top = 216
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 360
    Top = 120
  end
  object cdsSaldo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    BeforePost = cdsSaldoBeforePost
    AfterScroll = cdsSaldoAfterScroll
    Left = 360
    Top = 152
    object cdsSaldoEXERCICIO: TFloatField
      DisplayLabel = 'Exercício'
      FieldName = 'EXERCICIO'
      DisplayFormat = '#0'
    end
    object cdsSaldoPERIODO: TFloatField
      DisplayLabel = 'Período'
      FieldName = 'PERIODO'
      DisplayFormat = '#0'
    end
    object cdsSaldoIDVALORESCENARIO: TFloatField
      FieldName = 'IDVALORESCENARIO'
    end
    object cdsSaldoVLRORCCENARIO: TCurrencyField
      DisplayLabel = 'Valor Orçado para o Cenário'
      FieldName = 'VLRORCCENARIO'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object cdsCenario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 360
    Top = 184
  end
  object cdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 360
    Top = 216
  end
end
