inherited frmLancEventoRegularizacao: TfrmLancEventoRegularizacao
  Left = 602
  Top = 164
  Caption = 'Lançamento de Eventos para Regularização de Pagamento'
  ClientHeight = 359
  ClientWidth = 728
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 728
    Height = 320
    object lbEventoRegularizacao: TLabel
      Left = 22
      Top = 33
      Width = 155
      Height = 13
      Caption = 'Evento para Regularização'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDataRegularizacao: TLabel
      Left = 257
      Top = 33
      Width = 131
      Height = 13
      Caption = 'Data de Regularização'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbTipoRegularizacao: TLabel
      Left = 394
      Top = 33
      Width = 129
      Height = 13
      Caption = 'Tipo de Regularização'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSelArquivoRegularizacao: TLabel
      Left = 394
      Top = 81
      Width = 222
      Height = 13
      Caption = 'Selecionar Arquivo para Regularização'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbObservacao: TLabel
      Left = 22
      Top = 185
      Width = 69
      Height = 13
      Caption = 'Observação'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtTipoRegularizacao: TEdit
      Left = 394
      Top = 49
      Width = 292
      Height = 21
      TabOrder = 2
    end
    object edtSelArquivoRegularizacao: TEdit
      Left = 394
      Top = 97
      Width = 292
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
    object grpDadosBancarios: TGroupBox
      Left = 22
      Top = 88
      Width = 326
      Height = 74
      Caption = 'Dados Bancários'
      TabOrder = 3
      object lbBanco: TLabel
        Left = 12
        Top = 17
        Width = 37
        Height = 13
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbAgencia: TLabel
        Left = 111
        Top = 17
        Width = 47
        Height = 13
        Caption = 'Agencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 210
        Top = 17
        Width = 34
        Height = 13
        Caption = 'Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtConta: TEdit
        Left = 210
        Top = 33
        Width = 107
        Height = 21
        TabOrder = 2
        OnKeyPress = edtContaKeyPress
      end
      object dblcBanco: TwwDBLookupCombo
        Left = 12
        Top = 33
        Width = 87
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NUMBANCO'#9'10'#9'Num Banco'#9'F'
          'BANCO'#9'60'#9'Banco'#9'F')
        DataField = 'IDBANCO'
        LookupTable = qryBanco
        LookupField = 'IDPESSOA'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnChange = dblcBancoChange
        OnNotInList = dblcBancoNotInList
      end
      object dblcAgencia: TwwDBLookupCombo
        Left = 111
        Top = 33
        Width = 87
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NUMAGENCIA'#9'15'#9'Num Agencia'#9'F'
          'AGENCIA'#9'60'#9'Agencia'#9'F')
        DataField = 'IDBANCO'
        LookupTable = qryAgencia
        LookupField = 'IDPESSOA'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnNotInList = dblcAgenciaNotInList
      end
    end
    object mmObservacao: TMemo
      Left = 22
      Top = 202
      Width = 501
      Height = 103
      MaxLength = 500
      TabOrder = 6
    end
    object btnSelecionarArquivo: TBitBtn
      Left = 684
      Top = 96
      Width = 22
      Height = 21
      Hint = 'Procurar participante'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      TabStop = False
      OnClick = btnSelecionarArquivoClick
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
        FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
        0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
        870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
        FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
        0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
    end
    object dblEvento: TwwDBLookupCombo
      Left = 22
      Top = 49
      Width = 209
      Height = 21
      DropDownAlignment = taRightJustify
      Selected.Strings = (
        'DESCRICAO'#9'35'#9'Descrição'
        'CODTIPRECDES'#9'15'#9'Código')
      LookupTable = QryEvento
      LookupField = 'CODIGO'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      OrderByDisplay = False
      UseTFields = False
      AllowClearKey = True
      ShowMatchText = True
      OnNotInList = dblEventoNotInList
    end
    object dbeDataReg: TCMDateTimePicker
      Left = 257
      Top = 49
      Width = 121
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
  end
  inherited Dock971: TDock97
    Top = 320
    Width = 728
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65523
    Top = 299
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object opDlgSelecionarArquivo: TOpenDialog
    Left = 672
    Top = 8
  end
  object qryBanco: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDPESSOA, P.NOME AS BANCO, B.NUMBANCO'
      '  FROM BANCO B, PESSOA P'
      ' WHERE B.IDPESSOA = P.IDPESSOA'
      ' ORDER BY B.NUMBANCO'
      ' ')
    ValidateWithMask = True
    Left = 45
    Top = 146
  end
  object dsBanco: TwwDataSource
    AutoEdit = False
    DataSet = qryBanco
    Left = 56
    Top = 147
  end
  object qryAgencia: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT  AG.IDPESSOA,'
      '         AGENCIA.NOME AS AGENCIA,'
      '         AG.NUMAGENCIA,'
      '         AG.IDBANCO'
      'FROM AGENCIABANCARIA AG, PESSOA AGENCIA'
      'WHERE AG.IDBANCO = :pIdBanco'
      'AND AG.IDPESSOA = AGENCIA.IDPESSOA'
      'order by AGENCIA.NOME'
      '')
    ValidateWithMask = True
    Left = 149
    Top = 146
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdBanco'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object dsAgencia: TwwDataSource
    AutoEdit = False
    DataSet = qryAgencia
    Left = 160
    Top = 147
  end
  object QryEvento: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CE.DESCRICAOEVENTO DESCRICAO,'
      '       CE.CODIGORETORNO AS CODIGO,'
      '       CE.IDCADEVENTOSDEREGULARIZACAO AS IDCADEVENTO'
      '  FROM CADASTROEVENTOSDEREGULARIZACAO CE'
      ' WHERE CE.FLGDESATIVADO = 0'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 200
    Top = 10
  end
  object DSEvento: TwwDataSource
    AutoEdit = False
    DataSet = QryEvento
    Left = 208
    Top = 11
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 65533
    Top = 6
  end
end
