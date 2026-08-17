inherited FrmCadValParamEmissMT: TFrmCadValParamEmissMT
  Left = 309
  Top = 182
  HelpContext = 790114
  Caption = 'Cadastro'
  ClientHeight = 358
  ClientWidth = 390
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 390
    Height = 241
    inherited pnlControles: TPanel
      Top = 113
      Width = 388
      Height = 127
      object LbLValor: TLabel
        Left = 19
        Top = 71
        Width = 30
        Height = 13
        Caption = 'Valor'
      end
      object Label3: TLabel
        Left = 19
        Top = 18
        Width = 112
        Height = 13
        Caption = 'Data de Referência'
      end
      object DBData: TCMDateTimePicker
        Left = 19
        Top = 34
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAREFPREMISSOR'
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
        TabOrder = 0
      end
      object dbreValor: TDBRealEdit
        Left = 19
        Top = 87
        Width = 144
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 15
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRPARAMEMISSOR'
        DataSource = ds
      end
    end
    inherited dbGrd: TwwDBGrid
      Top = 113
      Width = 388
      Height = 127
      Selected.Strings = (
        'DATAREFPREMISSOR'#9'20'#9'Data de referência'
        'VLRPARAMEMISSOR'#9'31'#9'Valor do Indicador')
    end
    inherited pnlDados: TPanel
      Width = 388
      Height = 112
      object Label5: TLabel
        Left = 20
        Top = 9
        Width = 48
        Height = 13
        Caption = 'Emissor '
      end
      object Label2: TLabel
        Left = 20
        Top = 50
        Width = 199
        Height = 13
        Caption = 'Indicadores associados ao Emissor'
      end
      object DbLkcEmissor: TwwDBLookupCombo
        Left = 20
        Top = 24
        Width = 261
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SIGLAEMISSOR'#9'15'#9'Emissor'#9'F')
        LookupTable = CdsAux
        LookupField = 'IDEMISSOR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = DbLkcEmissorCloseUp
        OnExit = DbLkcEmissorExit
      end
      object DBlkIndicador: TwwDBLookupCombo
        Left = 19
        Top = 66
        Width = 358
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCPARAMEMISSOR'#9'60'#9'Indicador'#9'F')
        LookupTable = CdsIndicador
        LookupField = 'IDPARAMEMISSOR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = DBlkIndicadorCloseUp
        OnExit = DBlkIndicadorExit
      end
    end
  end
  inherited Dock972: TDock97
    Width = 390
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 319
    Width = 390
    inherited tb97Fundo: TToolbar97
      Left = 218
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 49
    end
  end
  inherited pnlTitulo: TPanel
    Width = 390
    inherited lbNomItem: TfcLabel
      Width = 219
      Caption = 'Valor dos Indicadores'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 310
    Top = 215
  end
  inherited ImlPadrao: TImageList
    Left = 296
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 328
    Top = 215
  end
  inherited Cds: TCMClientDataSet
    Active = True
    AfterOpen = CdsAfterOpen
    Left = 292
    Top = 215
    Data = {
      C00000009619E0BD010000001800000006000000000003000000C0000E494450
      4152414D454D4953534F520800040000000000094944454D4953534F52080004
      000000000010444154415245465052454D4953534F5208000800000000000F56
      4C52504152414D454D4953534F5208000400000000001044455343504152414D
      454D4953534F520100490000000100055749445448020002003C001149445245
      47524155534F454D4953534F5208000400000000000100044C43494404000100
      09080000}
  end
  inherited MontaSelect: TMontaSelect
    Left = 264
  end
  inherited CdsAux: TCMClientDataSet
    Active = True
    Left = 292
    Top = 79
    Data = {
      C00000009619E0BD010000001800000002000400000003000000720009494445
      4D4953534F5208000400000000000C5349474C41454D4953534F520100490000
      000100055749445448020002000F0002000D44454641554C545F4F5244455202
      008200010000000200044C434944040001000908000000000000000014CB2341
      0D42414E434F2043454E5452414C00000000000016CB23410543414958410000
      0000000000489F400343534E00000000000012CB23410D5445532E204E414349
      4F4E414C}
  end
  inherited pmnuFixaColunas: TPopupMenu
    Left = 232
    Top = 4
  end
  object Sql: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   V.IDPARAMEMISSOR,'
      '   V.IDEMISSOR,'
      '   V.DATAREFPREMISSOR,'
      '   V.VLRPARAMEMISSOR,'
      '   P.DESCPARAMEMISSOR,'
      '   V.IDREGRAUSOEMISSOR'
      'FROM'
      '  VALPARAMXEMISSOR V,PARAMEMISSOR P'
      'WHERE'
      '  V.IDEMISSOR = 1562215'
      '  AND V.IDPARAMEMISSOR = P.IDPARAMEMISSOR'
      ''
      'ORDER'#9' BY V.IDEMISSOR, V.IDPARAMEMISSOR,V.DATAREFPREMISSOR'
      ' ')
    ClientDataSet = Cds
    Left = 353
    Top = 216
  end
  object SqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT IDEMISSOR, SIGLAEMISSOR'
      ''
      'FROM EMISSOR '
      ''
      'ORDER BY SIGLAEMISSOR')
    ClientDataSet = CdsAux
    Left = 313
    Top = 78
  end
  object DtsAux: TwwDataSource
    DataSet = CdsAux
    Left = 334
    Top = 79
  end
  object CdsIndicador: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 348
    Top = 151
    Data = {
      590100009619E0BD01000000180000000200090000000300000063000E494450
      4152414D454D4953534F5208000400000000001044455343504152414D454D49
      53534F520100490000000100055749445448020002003C000100044C43494404
      000100090800000000000000000000F03F0E4341504954414C20534F4349414C
      000000000000000000401250415452494D4F4E494F204C49515549444F000000
      0000000000084015515444452041C7D54553204F5244494E4152494153000000
      0000000000104018515444452041C7D5455320505245464552454E4349414953
      00000000000000001440054C5543524F000000000000000018400D5245434549
      544120425255544100000000000000001C400A4449564944454E444F53000000
      00000000002040114445504F5349544F53204120564953544100000000000000
      002240195155414E54494441444520544F54414C2044452041C7D54553}
  end
  object DtsIndicador: TwwDataSource
    DataSet = CdsIndicador
    Left = 342
    Top = 127
  end
  object SqlIndicador: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  PEM.IDPARAMEMISSOR,'
      '  PEM.DESCPARAMEMISSOR'
      'FROM   '
      '  PARAMEMISSOR PEM'
      'WHERE  '
      '  IDPARAMEMISSOR NOT IN ( SELECT IDPARAMEMISSOR'
      '                          FROM PARAMXEMISSOR   '
      '                          WHERE IDEMISSOR =   -1)'
      ' ')
    ClientDataSet = CdsIndicador
    Left = 313
    Top = 150
  end
end
