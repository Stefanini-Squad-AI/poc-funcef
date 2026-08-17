inherited frmEntradaDadosDiariaMT: TfrmEntradaDadosDiariaMT
  Left = 215
  Top = 164
  HelpContext = 520008
  Caption = 'Entrada de Dados Diária'
  ClientHeight = 395
  ClientWidth = 384
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 384
    Height = 356
    object lblExercicio: TLabel
      Left = 24
      Top = 22
      Width = 55
      Height = 13
      Caption = 'Exercício'
    end
    object Label1: TLabel
      Left = 24
      Top = 126
      Width = 75
      Height = 13
      Caption = 'Valor Orçado'
    end
    object Label3: TLabel
      Left = 200
      Top = 126
      Width = 90
      Height = 13
      Caption = 'Valor Realizado'
    end
    object Label2: TLabel
      Left = 104
      Top = 22
      Width = 94
      Height = 13
      Caption = 'Data da Entrada'
    end
    object Bevel1: TBevel
      Left = 24
      Top = 114
      Width = 337
      Height = 9
      Shape = bsTopLine
    end
    object lblCodigoConta: TLabel
      Left = 232
      Top = 22
      Width = 95
      Height = 13
      Caption = 'Código da Conta'
    end
    object lblNome: TLabel
      Left = 24
      Top = 62
      Width = 167
      Height = 13
      Caption = 'Nome da Conta Orçamentária'
    end
    object spnedExercicio: TSpinEdit
      Left = 24
      Top = 38
      Width = 65
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
    end
    object redValorOrcado: TRealEdit
      Left = 24
      Top = 142
      Width = 161
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
    object redValorRealizado: TRealEdit
      Left = 200
      Top = 142
      Width = 161
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 6
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object dteDataEntrada: TCMDateTimePicker
      Left = 104
      Top = 38
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
      TabOrder = 1
    end
    object bbtnBuscaConta: TBitBtn
      Left = 336
      Top = 40
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
      Left = 24
      Top = 78
      Width = 337
      Height = 21
      TabStop = False
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
    object edtCodigoConta: TEdit
      Left = 232
      Top = 38
      Width = 105
      Height = 21
      TabOrder = 2
      OnExit = edtCodigoContaExit
    end
  end
  inherited Dock971: TDock97
    Top = 356
    Width = 384
    inherited tb97Fundo: TToolbar97
      Left = 211
      DockPos = 211
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520008
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 42
      DockPos = 42
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
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
  object ds: TwwDataSource
    DataSet = cds
    Left = 320
    Top = 208
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
      'CONTASORCAMEN.FLGATIVA = '#39'A'#39
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
      '25'
      '10'
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
    Left = 78
    Top = 232
  end
  object sql: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  IDCONTAORCAMEN, IDPLANOORCAMEN, NOMECONTAORCAMEN, FLGSINALCONT' +
        'A,'
      '  TIPOCALCORCADO, TIPOCALCREALIZADO'
      'FROM'
      '  CONTASORCAMEN'
      'WHERE'
      
        '  (IDCONTAORCAMEN = :IDCONTAORCAMEN) AND (IDPLANOORCAMEN = :IDPL' +
        'ANOORCAMEN)'
      '')
    ClientDataSet = cds
    Left = 248
    Top = 208
  end
  object sqlSaldos: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  VLRORCADO, VLRREALIZADO'
      'FROM'
      '  SALDOORCADO'
      'WHERE'
      
        '  (IDPESSOA = :IDPESSOA) AND (IDPLANOORCAMEN = :IDPLANOORCAMEN) ' +
        'AND'
      
        '  (IDCONTAORCAMEN = :IDCONTAORCAMEN) AND (DATAREFERENCIA = :DATA' +
        ')')
    ClientDataSet = cdsSaldos
    Left = 248
    Top = 240
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 280
    Top = 208
  end
  object cdsSaldos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 280
    Top = 240
  end
  object sqlPeriodo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PERIODO, FLGBLOQUEADO'
      'FROM'
      '  PERIODOORCAMEN'
      'WHERE'
      '  (IDPESSOA = :IDPESSOA) AND (EXERCICIO = :EXERCICIO) AND'
      '  (DATAINIPERIODO <= :DATA) AND (DATAFIMPERIODO >= :DATA)')
    ClientDataSet = cdsPeriodo
    Left = 248
    Top = 272
  end
  object cdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 280
    Top = 272
  end
end
