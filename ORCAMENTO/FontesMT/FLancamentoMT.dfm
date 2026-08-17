inherited frmLancamentoMT: TfrmLancamentoMT
  Left = 202
  Caption = 'Lançamentos Orçamentários'
  ClientHeight = 226
  ClientWidth = 556
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 556
    Height = 140
    object lblCodigoConta: TLabel
      Left = 24
      Top = 24
      Width = 95
      Height = 13
      Caption = 'Código da Conta'
    end
    object lblNome: TLabel
      Left = 160
      Top = 24
      Width = 167
      Height = 13
      Caption = 'Nome da Conta Orçamentária'
    end
    object lblDataIni: TLabel
      Left = 24
      Top = 72
      Width = 112
      Height = 13
      Caption = 'Data de Referência'
    end
    object Label1: TLabel
      Left = 160
      Top = 72
      Width = 121
      Height = 13
      Caption = 'Valor do Lançamento'
    end
    object Label3: TLabel
      Left = 296
      Top = 72
      Width = 96
      Height = 13
      Caption = 'Planilha Contábil'
    end
    object dbrCodigoConta: TDBRealEdit
      Left = 24
      Top = 40
      Width = 97
      Height = 21
      Alignment = taRightJustify
      Enabled = False
      Lines.Strings = (
        '0')
      ReadOnly = True
      TabOrder = 0
      WordWrap = False
      IntDigits = 11
      DecDigits = 0
      NumberFormat = fFixed
      Signal = False
      DataField = 'IDCONTAORCAMEN'
      DataSource = ds
    end
    object dbrValor: TDBRealEdit
      Left = 160
      Top = 88
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '  1.000,00')
      TabOrder = 2
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'VLRLANCAMENTO'
      DataSource = ds
    end
    object dblcPlanilha: TwwDBLookupCombo
      Left = 297
      Top = 88
      Width = 240
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'LACHIST1'#9'40'#9'Histórico'
        'LACHIST2'#9'40'#9'Histórico'
        'PLNCODIGO'#9'10'#9'Planilha')
      DataField = 'PLNCODIGO'
      DataSource = ds
      LookupTable = cdsPlanilhaContabil
      LookupField = 'PLNCODIGO'
      Options = [loColLines, loTitles]
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object bbtnBuscaConta: TBitBtn
      Left = 120
      Top = 40
      Width = 25
      Height = 22
      Hint = 'Procura a Conta'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = bbtnBuscaContaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
        33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
        8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
        F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
        F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
        0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
        B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
        B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
        333333333777733333333333FBFBFB3333333333333333333333}
      NumGlyphs = 2
    end
    object dbeDataRef: TCMDateTimePicker
      Left = 24
      Top = 88
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
      TabOrder = 5
    end
    object dbeNomeConta: TEdit
      Left = 160
      Top = 40
      Width = 377
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 556
  end
  inherited Dock971: TDock97
    Top = 187
    Width = 556
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 2
    Top = 103
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 102
  end
  inherited ImlPadrao: TImageList
    Left = 16
    Top = 55
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Top = 47
  end
  inherited Cds: TCMClientDataSet
    Left = 284
    Top = 39
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'LANCAMENTOORC.IDCONTAORCAMEN'
      'LANCAMENTOORC.DATAREFERENCIA'
      'LANCAMENTOORC.VLRLANCAMENTO')
    TipodeDado.Strings = (
      'N'
      'D'
      'N')
    Descricao.Strings = (
      'Conta'
      'Data de Referência'
      'Valor do Lançamento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'LANCAMENTOORC'
      '')
    CamposChave.Strings = (
      'LANCAMENTOORC.IDLANCAMENTOORC')
    Mascaras.Strings = (
      ''
      ''
      '###,###,###,##0.00')
    Larguras.Strings = (
      '10'
      '10'
      '10')
  end
  object cdsPlanilhaContabil: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 129
  end
  object MontaSelectConta: TMontaSelect
    Template.IdConsulta = 185
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN'
      'CONTASORCAMEN.OBSERVACAO'
      'CONTASORCAMEN.TIPOCALCREALIZADO'
      'CONTASORCAMEN.TIPOCALCORCADO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código da Conta'
      'Nome da Conta'
      'Observação'
      'Tipo de Cálculo Realizado'
      'Tipo de Cálculo Orçado')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTASORCAMEN')
    CamposChave.Strings = (
      'CONTASORCAMEN.IDPLANOORCAMEN'
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '60'
      '1'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 470
    Top = 8
  end
  object cdsContaOrcamentaria: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 63
  end
end
