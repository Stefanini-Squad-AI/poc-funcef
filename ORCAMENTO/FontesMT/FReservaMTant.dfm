inherited frmReservaMT: TfrmReservaMT
  Left = 247
  Top = 100
  Caption = 'Reserva Orçamentária'
  ClientHeight = 378
  ClientWidth = 513
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 513
    Height = 292
    object Label4: TLabel
      Left = 24
      Top = 16
      Width = 66
      Height = 13
      Caption = 'Reserva Nº'
    end
    object Label5: TLabel
      Left = 160
      Top = 16
      Width = 106
      Height = 13
      Caption = 'Status da Reserva'
    end
    object Bevel1: TBevel
      Left = 24
      Top = 63
      Width = 465
      Height = 9
      Shape = bsTopLine
    end
    object lblCodigoConta: TLabel
      Left = 24
      Top = 72
      Width = 95
      Height = 13
      Caption = 'Código da Conta'
    end
    object lblNome: TLabel
      Left = 176
      Top = 72
      Width = 167
      Height = 13
      Caption = 'Nome da Conta Orçamentária'
    end
    object Label3: TLabel
      Left = 24
      Top = 112
      Width = 160
      Height = 13
      Caption = 'Centro de Responsabilidade'
    end
    object Label11: TLabel
      Left = 264
      Top = 112
      Width = 90
      Height = 13
      Caption = 'Grupo da Conta'
    end
    object lblDataIni: TLabel
      Left = 24
      Top = 152
      Width = 112
      Height = 13
      Caption = 'Data de Referência'
    end
    object Label1: TLabel
      Left = 160
      Top = 152
      Width = 99
      Height = 13
      Caption = 'Valor da Reserva'
    end
    object Label12: TLabel
      Left = 337
      Top = 152
      Width = 121
      Height = 13
      Caption = 'Saldo Atual da Conta'
    end
    object Label2: TLabel
      Left = 24
      Top = 192
      Width = 144
      Height = 13
      Caption = 'Observações da Reserva'
    end
    object dbrReservaNum: TDBRealEdit
      Left = 24
      Top = 32
      Width = 121
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        '0')
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      WordWrap = False
      IntDigits = 11
      DecDigits = 0
      NumberFormat = fFixed
      Signal = False
      DataField = 'NUMRESERVA'
      DataSource = ds
    end
    object bbtnImprime: TBitBtn
      Left = 336
      Top = 25
      Width = 153
      Height = 29
      Caption = '&Imprime Reserva'
      Enabled = False
      TabOrder = 2
      TabStop = False
      OnClick = bbtnImprimeClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
        8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
        0000888800880007700888888F778F7778F778FF000088008800877007700888
        778F7787F778F778000080880088877770077087FF778887F88778F700008700
        888887777770008777888887FF888777000080888888F77777777087F8888F77
        78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
        87777087FF778888888778F7000087FF88899888888770877788888888888777
        000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
        778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
        88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
        8F888F77000088888888887FFF7788888888888878FF77880000888888888887
        7788888888888888877788880000888888888888888888888888888888888888
        0000}
      NumGlyphs = 2
      Spacing = 8
    end
    object dbeCodigoConta: TwwDBEdit
      Left = 24
      Top = 88
      Width = 113
      Height = 21
      DataField = 'IDCONTAORCAMEN'
      DataSource = ds
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeCodigoContaExit
    end
    object edtNomeConta: TEdit
      Left = 176
      Top = 88
      Width = 313
      Height = 21
      TabStop = False
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
    object edtCentroResp: TEdit
      Left = 24
      Top = 128
      Width = 225
      Height = 21
      TabStop = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object edtGrupo: TEdit
      Left = 264
      Top = 128
      Width = 225
      Height = 21
      TabStop = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object dbeDataRef: TCMDateTimePicker
      Left = 24
      Top = 168
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATAREFERENCIA'
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
      TabOrder = 7
      OnExit = dbeDataRefExit
    end
    object dbrValor: TDBRealEdit
      Left = 160
      Top = 168
      Width = 161
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 8
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'VLRRESERVA'
      DataSource = ds
    end
    object redSaldo: TRealEdit
      Left = 336
      Top = 168
      Width = 154
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = clBtnFace
      Lines.Strings = (
        '      0,00')
      ReadOnly = True
      TabOrder = 9
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object bbtnBuscaConta: TBitBtn
      Left = 136
      Top = 88
      Width = 25
      Height = 21
      Hint = 'Procura a Conta'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
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
    object dbeStatus: TEdit
      Left = 160
      Top = 32
      Width = 157
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 513
    inherited Toolbar971: TToolbar97
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 339
    Width = 513
    inherited tb97Fundo: TToolbar97
      Left = 343
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520014
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 176
    end
    object bbtnPermiteNeg: TBitBtn
      Left = 6
      Top = 5
      Width = 139
      Height = 29
      Caption = 'Permite Res. Negativa'
      TabOrder = 2
      TabStop = False
      Visible = False
      OnClick = bbtnImprimeClick
      NumGlyphs = 2
      Spacing = 8
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 279
    TargetsData = (
      1
      3
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 151
    Top = 279
  end
  inherited ImlPadrao: TImageList
    Left = 68
    Top = 279
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 193
    Top = 279
  end
  inherited Cds: TCMClientDataSet
    Left = 110
    Top = 279
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RESERVAORCAMEN.NUMRESERVA'
      'RESERVAORCAMEN.DATAREFERENCIA'
      'RESERVAORCAMEN.VLRRESERVA'
      'RESERVAORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN')
    TipodeDado.Strings = (
      'N'
      'D'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'No.Reserva'
      'Data Ref.'
      'Valor'
      'Conta'
      'Nome da Conta')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RESERVAORCAMEN'
      'CONTASORCAMEN')
    CamposChave.Strings = (
      'RESERVAORCAMEN.IDRESERVAORCAMEN')
    Filtro.Strings = (
      'CONTASORCAMEN.IDPLANOORCAMEN = RESERVAORCAMEN.IDPLANOORCAMEN'
      'CONTASORCAMEN.IDCONTAORCAMEN = RESERVAORCAMEN.IDCONTAORCAMEN'
      'RESERVAORCAMEN.FLGRESCOMP = '#39'R'#39)
    Mascaras.Strings = (
      ''
      ''
      '###,###,###,##0.00'
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '25'
      '60')
    Left = 235
    Top = 279
  end
  object cdsSaldos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 318
    Top = 279
  end
  object cdsProxReserva: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 360
    Top = 279
  end
  object MontaSelectConta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN'
      'CONTASORCAMEN.OBSERVACAO'
      'CONTASORCAMEN.TIPOCALCREALIZADO'
      'CONTASORCAMEN.TIPOCALCORCADO'
      'TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORECEBDESEMB.DESCRICAO'
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.NOME')
    TipodeDado.Strings = (
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
      'Observação'
      'Tipo de Cálculo Realizado'
      'Tipo de Cálculo Orçado'
      'Tipo de Recebimento/Desembolso'
      'Descrição do Recebimento/Desembolso'
      'Código do Centro de Custo'
      'Nome do Centro de Custo')
    SensivelACaixa.Strings = (
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
      'TIPORECEBDESEMB'
      'CENTCUST'
      'COMPCONTASORCAMEN')
    CamposChave.Strings = (
      'CONTASORCAMEN.IDPLANOORCAMEN'
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN'
      'CONTASORCAMEN.TIPOCALCREALIZADO')
    Filtro.Strings = (
      
        'CONTASORCAMEN.IDPLANOORCAMEN = COMPCONTASORCAMEN.IDPLANOORCAMEN(' +
        '+)'
      
        'CONTASORCAMEN.IDCONTAORCAMEN = COMPCONTASORCAMEN.IDCONTAORCAMEN(' +
        '+)'
      
        'CONTASORCAMEN.IDCONTAORCAMEN = COMPCONTASORCAMEN.IDCONTACONDRES(' +
        '+)'
      
        'CONTASORCAMEN.IDPLANOORCAMEN = COMPCONTASORCAMEN.IDPLANOORCAMEN(' +
        '+)'
      
        'CONTASORCAMEN.IDCONTAORCAMEN = COMPCONTASORCAMEN.IDCONTACONDFIM(' +
        '+)'
      
        'CONTASORCAMEN.IDPLANOORCAMEN = COMPCONTASORCAMEN.IDPLANOORCAMEN(' +
        '+)'
      
        'CONTASORCAMEN.IDCONTAORCAMEN = COMPCONTASORCAMEN.IDCONTACONDINI(' +
        '+)'
      
        'CONTASORCAMEN.IDPLANOORCAMEN = COMPCONTASORCAMEN.IDPLANOORCAMEN(' +
        '+)'
      
        'CONTASORCAMEN.IDCONTAORCAMEN = COMPCONTASORCAMEN.IDCONTAREFREAL(' +
        '+)'
      
        'CONTASORCAMEN.IDPLANOORCAMEN = COMPCONTASORCAMEN.IDPLANOORCAMEN(' +
        '+)'
      
        'CONTASORCAMEN.IDCONTAORCAMEN = COMPCONTASORCAMEN.IDCONTAREFORCAD' +
        'O(+)'
      
        'CONTASORCAMEN.IDPLANOORCAMEN = COMPCONTASORCAMEN.IDPLANOORCAMEN(' +
        '+)'
      
        'CONTASORCAMEN.IDCONTAORCAMEN = COMPCONTASORCAMEN.IDCONTAORCAMEN(' +
        '+)'
      
        'CONTASORCAMEN.IDPLANOORCAMEN = COMPCONTASORCAMEN.IDPLANOORCAMEN(' +
        '+)'
      'TIPORECEBDESEMB.IDPESSOA(+) = COMPCONTASORCAMEN.IDPESSOA'
      'TIPORECEBDESEMB.RECPAG(+) = COMPCONTASORCAMEN.RECPAG'
      'TIPORECEBDESEMB.CODTIPRECDES(+) = COMPCONTASORCAMEN.CODTIPRECDES'
      'CENTCUST.IDEMPRESA(+) = COMPCONTASORCAMEN.IDEMPRESA'
      'CENTCUST.CODCENTROCUSTO(+) = COMPCONTASORCAMEN.CODCENTROCUSTO')
    Mascaras.Strings = (
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
      '25'
      '60'
      '60'
      '1'
      '1'
      '15'
      '35'
      '10'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 277
    Top = 279
  end
end
