inherited frmEntradaDadosMT: TfrmEntradaDadosMT
  Left = 91
  Top = 60
  HelpContext = 520007
  Caption = 'Entrada de Dados por Período'
  ClientHeight = 430
  ClientWidth = 658
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 658
    Height = 391
    object lblExercicio: TLabel
      Left = 24
      Top = 20
      Width = 55
      Height = 13
      Caption = 'Exercício'
    end
    object lblPeriodo: TLabel
      Left = 24
      Top = 332
      Width = 46
      Height = 13
      Caption = 'Período'
    end
    object Label1: TLabel
      Left = 88
      Top = 332
      Width = 75
      Height = 13
      Caption = 'Valor Orçado'
    end
    object Label3: TLabel
      Left = 240
      Top = 332
      Width = 90
      Height = 13
      Caption = 'Valor Realizado'
    end
    object lblCodigoConta: TLabel
      Left = 120
      Top = 20
      Width = 95
      Height = 13
      Caption = 'Código da Conta'
    end
    object rgrpTipo: TRadioGroup
      Left = 24
      Top = 65
      Width = 364
      Height = 45
      Caption = 'Entrada de Valores'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        '&Orçados'
        '&Realizados'
        '&Ambos')
      TabOrder = 4
    end
    object dbgrdSaldo: TwwDBGrid
      Left = 24
      Top = 132
      Width = 561
      Height = 191
      TabStop = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsSaldo
      KeyOptions = [dgAllowDelete]
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 6
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
      Left = 24
      Top = 36
      Width = 81
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
      OnChange = spnedExercicioChange
    end
    object rdgSinal: TRadioGroup
      Left = 392
      Top = 333
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
    object rgPerDia: TRadioGroup
      Left = 401
      Top = 65
      Width = 184
      Height = 45
      Caption = 'Entrada de Valores'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        '&Período'
        '&Dia')
      TabOrder = 5
    end
    object bbtnBuscaConta: TBitBtn
      Left = 224
      Top = 36
      Width = 25
      Height = 21
      Hint = 'Procura a Conta'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
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
      Left = 264
      Top = 36
      Width = 321
      Height = 21
      TabStop = False
      Enabled = False
      ReadOnly = True
      TabOrder = 3
    end
    object edtCodigoConta: TEdit
      Left = 120
      Top = 36
      Width = 105
      Height = 21
      TabOrder = 1
      OnExit = edtCodigoContaExit
    end
    object redPeriodo: TDBRealEdit
      Left = 25
      Top = 348
      Width = 53
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      MaxLength = 4
      TabOrder = 7
      WordWrap = False
      OnExit = redPeriodoExit
      IntDigits = 4
      DecDigits = 0
      NumberFormat = fNumber
      Signal = False
      DataField = 'PERIODO'
      DataSource = dsSaldo
    end
    object redValorOrcado: TDBEdit
      Left = 88
      Top = 348
      Width = 136
      Height = 21
      DataField = 'VLRORCADO'
      DataSource = dsSaldo
      TabOrder = 9
    end
    object redValorRealizado: TDBEdit
      Left = 242
      Top = 347
      Width = 143
      Height = 21
      DataField = 'VLRREALIZADO'
      DataSource = dsSaldo
      TabOrder = 10
    end
  end
  inherited Dock971: TDock97
    Top = 391
    Width = 658
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520007
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Caption = 'OK'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 261
    Top = 144
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
    OnDataChange = dsSaldoDataChange
    Left = 712
    Top = 112
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 139
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN'
      'CENTRESPON.CODCENTRORESPON'
      'CENTRESPON.NOME'
      'CONTASORCAMEN.OBSERVACAO'
      'CONTASORCAMEN.TIPOCALCREALIZADO'
      'CONTASORCAMEN.TIPOCALCORCADO'
      'GRUPOORCAMEN.NOMEGRUPOORCAMEN'
      'GRUPOORCAMEN.CODGRUPOORC'
      'PLANOORCAMENTARIO.NOMEPLANOORC')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
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
      'Tipo de Cálculo Orçado'
      'Nome do Grupo Orçamentário'
      'Código do Grupo Orçamentário'
      'Plano Orçamentário')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTASORCAMEN'
      'GRUPOORCAMEN'
      'PLANOORCAMENTARIO'
      'CENTRESPON')
    CamposChave.Strings = (
      'CONTASORCAMEN.IDPLANOORCAMEN'
      'CONTASORCAMEN.IDCONTAORCAMEN')
    Filtro.Strings = (
      'CONTASORCAMEN.IDGRUPOORCAMEN = GRUPOORCAMEN.IDGRUPOORCAMEN'
      'CONTASORCAMEN.IDPLANOORCAMEN = PLANOORCAMENTARIO.IDPLANOORCAMEN'
      'CONTASORCAMEN.FLGATIVA = '#39'A'#39
      'CENTRESPON.CODCENTRORESPON = CONTASORCAMEN.CODCENTRORESPON')
    Mascaras.Strings = (
      ''
      ''
      ''
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
      '10'
      '10'
      '60'
      '200')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 294
    Top = 144
  end
  object ds: TwwDataSource
    DataSet = cds
    Left = 712
    Top = 168
  end
  object sqlSaldo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  /*+ index (SALDOORCADO XIE2SALDOORCADO) */'
      '  C.TIPOCALCREALIZADO,'
      '  C.TIPOCALCORCADO,'
      '  S.EXERCICIO,'
      '  S.PERIODO,'
      '  SUM(S.VLRORCADO) AS VLRORCADO,'
      '  SUM(S.VLRREALIZADO) AS VLRREALIZADO,'
      '  SUM(S.VLRRESERVADO) AS VLRRESERVADO,'
      '  SUM(S.VLRCOMPROMETIDO) AS VLRCOMPROMETIDO'
      'FROM'
      '  SALDOORCADO S,'
      '  CONTASORCAMEN C'
      'WHERE'
      '  (S.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND'
      '  (S.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND '
      '  (S.IDCONTAORCAMEN = :CONTA ) AND'
      '  (S.IDPLANOORCAMEN = :PLANO) AND'
      '  (S.IDPESSOA       = :PESSOA) AND'
      '  (S.EXERCICIO      = :EXERCICIO)'
      'GROUP BY'
      '  C.TIPOCALCREALIZADO,'
      '  C.TIPOCALCORCADO,'
      '  S.EXERCICIO,'
      '  S.PERIODO'
      'ORDER BY'
      '  S.EXERCICIO, S.PERIODO')
    ClientDataSet = cdsSaldo
    Left = 600
    Top = 112
  end
  object cdsSaldo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    BeforePost = cdsSaldoBeforePost
    AfterScroll = cdsSaldoAfterScroll
    OnCalcFields = cdsSaldoCalcFields
    Left = 566
    Top = 112
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
    object cdsSaldoVLRORCADO: TCurrencyField
      DisplayLabel = 'Valor Orçado'
      FieldName = 'VLRORCADO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 2
    end
    object cdsSaldoVLRREALIZADO: TCurrencyField
      DisplayLabel = 'Valor Realizado'
      FieldName = 'VLRREALIZADO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Precision = 2
    end
    object cdsSaldoVLRRESERVADO: TCurrencyField
      DisplayLabel = 'Valor Reservado'
      FieldName = 'VLRRESERVADO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsSaldoVLRCOMPROMETIDO: TCurrencyField
      DisplayLabel = 'Valor Comprometido'
      FieldName = 'VLRCOMPROMETIDO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsSaldoSALDOACUMULADO: TFloatField
      DisplayLabel = 'Valor Acumulado'
      FieldKind = fkCalculated
      FieldName = 'SALDOACUMULADO'
      DisplayFormat = '###,###,##0.00'
      currency = True
      Calculated = True
    end
    object cdsSaldoTIPOCALCORCADO: TStringField
      FieldName = 'TIPOCALCORCADO'
      Size = 1
    end
    object cdsSaldoTIPOCALCREALIZADO: TStringField
      FieldName = 'TIPOCALCREALIZADO'
      Size = 1
    end
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
      ''
      ' ')
    ClientDataSet = cds
    Left = 600
    Top = 168
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 664
    Top = 168
  end
  object sqlSaldoAcum: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  /*+ index (SALDOORCADO XIE2SALDOORCADO) */ SUM(VLRORCADO) AS V' +
        'ALOR1,'
      '  SUM(VLRCOMPROMETIDO) AS VALOR2, SUM(VLRRESERVADO) AS VALOR3'
      'FROM'
      '  SALDOORCADO'
      'WHERE'
      '  (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND'
      '  (IDCONTAORCAMEN = :IDCONTAORCAMEN) AND'
      '  (IDPESSOA = :IDPESSOA) AND'
      '  :TIPO'
      ''
      ' ')
    OnFormartParam = sqlSaldoAcumFormartParam
    ClientDataSet = cdsSaldoAcum
    Left = 600
    Top = 216
  end
  object cdsSaldoAcum: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 664
    Top = 216
  end
  object sqlPeriodo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PERIODO, DATAINIPERIODO, DATAFIMPERIODO, FLGBLOQUEADO'
      'FROM'
      '  PERIODOORCAMEN'
      'WHERE'
      '  (EXERCICIO = :EXERCICIO) AND (IDPESSOA = :PESSOA)'
      'ORDER BY'
      '  PERIODO')
    ClientDataSet = cdsPeriodo
    Left = 600
    Top = 272
  end
  object cdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 664
    Top = 272
  end
  object sqlRegs: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDPESSOA, IDPLANOORCAMEN, IDCONTAORCAMEN, DATAREFERENCIA'
      'FROM'
      '  SALDOORCADO'
      'WHERE'
      
        '  (IDCONTAORCAMEN = :IDCONTAORCAMEN) AND (IDPESSOA = :IDPESSOA) ' +
        'AND'
      
        '  (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND (DATAREFERENCIA =:DATAR' +
        'EFERENCIA)')
    ClientDataSet = cdsRegs
    Left = 600
    Top = 336
  end
  object cdsRegs: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 664
    Top = 336
  end
end
