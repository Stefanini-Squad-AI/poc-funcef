inherited FrmCalculo: TFrmCalculo
  Left = 247
  Top = 86
  Caption = 'Executa Simulação Atuarial '
  ClientHeight = 434
  ClientWidth = 442
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 442
    Height = 348
    ParentShowHint = False
    ShowHint = True
    object Bevel1: TBevel
      Left = 8
      Top = 163
      Width = 409
      Height = 173
    end
    object Label1: TLabel
      Left = 16
      Top = 167
      Width = 226
      Height = 13
      Caption = 'Indique o Grupo de Hipóteses a utilizar '
    end
    object Label2: TLabel
      Left = 16
      Top = 209
      Width = 142
      Height = 13
      Caption = 'Indique o Filtro a utilizar '
    end
    object Label3: TLabel
      Left = 16
      Top = 252
      Width = 210
      Height = 13
      Caption = 'Indique o Grupo de Regras a utilizar '
    end
    object Label4: TLabel
      Left = 16
      Top = 12
      Width = 268
      Height = 13
      Caption = 'Indique o nome de referência desta Simulação '
    end
    object Label5: TLabel
      Left = 16
      Top = 111
      Width = 100
      Height = 13
      Caption = 'Data de Cadastro'
    end
    object Label6: TLabel
      Left = 17
      Top = 53
      Width = 159
      Height = 13
      Caption = 'Observações da Simulação '
    end
    object SB1: TSpeedButton
      Left = 154
      Top = 112
      Width = 65
      Height = 41
      Hint = 'Impede que a Simulação seja Alterada '
      Caption = '&Publicar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
        0EEE333377777777777733330FF00FBFB0EE33337F37733F377733330F0BFB0B
        FB0E33337F73FF73337733330FF000BFBFB033337F377733333733330FFF0BFB
        FBF033337FFF733F333733300000BF0FBFB03FF77777F3733F37000FBFB0F0FB
        0BF077733FF7F7FF7337E0FB00000000BF0077F377777777F377E0BFBFBFBFB0
        F0F077F3333FFFF7F737E0FBFB0000000FF077F3337777777337E0BFBFBFBFB0
        FFF077F3333FFFF73FF7E0FBFB00000F000077FF337777737777E00FBFBFB0FF
        0FF07773FFFFF7337F37003000000FFF0F037737777773337F7333330FFFFFFF
        003333337FFFFFFF773333330000000003333333777777777333}
      Layout = blGlyphTop
      NumGlyphs = 2
      OnClick = SB1Click
    end
    object Label7: TLabel
      Left = 16
      Top = 292
      Width = 103
      Height = 13
      Caption = 'Tabela Biométrica'
    end
    object SB2: TSpeedButton
      Left = 221
      Top = 112
      Width = 65
      Height = 41
      Hint = 'Executa a Simulação '
      Caption = '&Executar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      OnClick = SB2Click
    end
    object SB3: TSpeedButton
      Left = 288
      Top = 112
      Width = 65
      Height = 41
      Hint = 'Gera relatório a partir do resultado da Simulação'
      Caption = '&Resultado'
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
        000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
        FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
        FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
        0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
        05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
        55557F7777777555555500000005555555557777777555555555}
      Layout = blGlyphTop
      NumGlyphs = 2
      OnClick = SB3Click
    end
    object Sb4: TSpeedButton
      Left = 357
      Top = 112
      Width = 65
      Height = 41
      Hint = 'Relatório contendo as informações usadas na Simulação'
      Caption = '&Histórico'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
        000557777777777777750BBBBBBBBBBBBBB07F5555FFFFFFF5570BBBB0000000
        BBB07F5557777777FF570BBB077BBB770BB07F557755555775570BBBBBBBBBBB
        BBB07F5555FFFFFFF5570BBBB0000000BBB07F5557777777F5570BBBB0FFFFF0
        BBB07F5557FFFFF7F5570BBBB0000000BBB07F555777777755570BBBBBBBBBBB
        BBB07FFFFFFFFFFFFFF700000000000000007777777777777777500FFFFFFFFF
        F005577FF555FFFFF7755500FFF00000005555775FF7777777F5550F777FFFFF
        F055557F777FFF5557F5550000000FFF00555577777775FF77F5550777777000
        7055557FFFFFF777F7F555000000000000555577777777777755}
      Layout = blGlyphTop
      NumGlyphs = 2
      OnClick = Sb4Click
    end
    object LC4: TwwDBLookupCombo
      Left = 17
      Top = 306
      Width = 384
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'40'#9'Descrição'
        'IDTABELA'#9'10'#9'Código da Tabela')
      DataField = 'IDTABELA'
      DataSource = ds
      LookupTable = QryTabBio
      LookupField = 'IDTABELA'
      Options = [loColLines, loRowLines, loTitles]
      Enabled = False
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnNotInList = LC4NotInList
    end
    object LC1: TwwDBLookupCombo
      Left = 17
      Top = 184
      Width = 384
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'40'#9'Descrição da Hipótese '
        'IDGRUPOHIPOTESE'#9'10'#9'Código')
      DataField = 'IDGRUPOHIPOTESE'
      DataSource = ds
      LookupTable = QryHipoteses
      LookupField = 'IDGRUPOHIPOTESE'
      Options = [loColLines, loRowLines, loTitles]
      Enabled = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnNotInList = LC1NotInList
    end
    object LC2: TwwDBLookupCombo
      Left = 17
      Top = 226
      Width = 384
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAOFILTRO'#9'40'#9'DESCRICAOFILTRO'
        'IDFILTRO'#9'10'#9'IDFILTRO'
        'IDTABELA'#9'10'#9'IDTABELA')
      DataField = 'IDFILTRO'
      DataSource = ds
      LookupTable = QryFiltros
      LookupField = 'IDFILTRO'
      Options = [loColLines, loRowLines, loTitles]
      Enabled = False
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnNotInList = LC2NotInList
    end
    object LC3: TwwDBLookupCombo
      Left = 17
      Top = 266
      Width = 384
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'40'#9'Descrição da Regra '
        'IDGRUPOREGRA'#9'10'#9'Código ')
      DataField = 'IDGRUPOREGRA'
      DataSource = ds
      LookupTable = QryRegras
      LookupField = 'IDGRUPOREGRA'
      Options = [loColLines, loRowLines, loTitles]
      Enabled = False
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnNotInList = LC3NotInList
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 27
      Width = 401
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 0
    end
    object DBMemo1: TDBMemo
      Left = 16
      Top = 67
      Width = 401
      Height = 38
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
    object DateEdit1: TCMDateTimePicker
      Left = 17
      Top = 128
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
      TabOrder = 2
    end
    object Panel2: TPanel
      Left = 16
      Top = 47
      Width = 401
      Height = 57
      BevelInner = bvLowered
      BevelOuter = bvNone
      BorderStyle = bsSingle
      TabOrder = 6
      Visible = False
      object Label8: TLabel
        Left = 20
        Top = 8
        Width = 165
        Height = 13
        Caption = 'Aguarde, Processando ........'
      end
      object PrgBar1: TProgressBar
        Left = 15
        Top = 25
        Width = 354
        Height = 16
        Min = 0
        Max = 100
        TabOrder = 0
      end
    end
  end
  inherited Dock972: TDock97
    Width = 442
  end
  inherited Dock971: TDock97
    Top = 395
    Width = 442
    inherited tb97Fundo: TToolbar97
      Left = 201
      DockPos = 201
      inherited bbtnSair: TBitBtn
        OnClick = SairClick
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ds: TwwDataSource
    DataSet = QrySimulacoes
    Left = 357
    Top = 77
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 289
    Top = 5
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 362
    Top = 4
  end
  object DsHipoteses: TwwDataSource
    DataSet = QryHipoteses
    Left = 108
    Top = 234
  end
  object QryHipoteses: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDGRUPOHIPOTESE,DESCRICAO,OBSERVACAO'
      'FROM CM.GRUPOSDEHIPOTESES '
      'ORDER BY IDGRUPOHIPOTESE')
    ValidateWithMask = True
    Left = 20
    Top = 234
    object QryHipotesesDESCRICAO: TStringField
      DisplayLabel = 'Descrição da Hipótese '
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = 'GRUPOSDEHIPOTESES.DESCRICAO'
      Size = 60
    end
    object QryHipotesesIDGRUPOHIPOTESE: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDGRUPOHIPOTESE'
      Origin = 'GRUPOSDEHIPOTESES.IDGRUPOHIPOTESE'
    end
  end
  object DsFiltros: TwwDataSource
    DataSet = QryFiltros
    Left = 52
    Top = 277
  end
  object QryFiltros: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  DESCRICAOFILTRO,IDFILTRO,IDTABELA,MONTASQL'
      'FROM CM.TABFILTROSQL '
      'ORDER BY IDTABELA,IDFILTRO')
    ValidateWithMask = True
    Left = 20
    Top = 277
  end
  object DsRegras: TwwDataSource
    DataSet = QryRegras
    Left = 76
    Top = 319
  end
  object QryRegras: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPOREGRA,DESCRICAO,OBSERVACAO                     '
      'FROM CM.GRUPOSDEREGRAS'
      'ORDER BY IDGRUPOREGRA')
    ValidateWithMask = True
    Left = 20
    Top = 311
  end
  object QrySimulacoes: TwwQuery
    BeforePost = QrySimulacoesBeforePost
    AfterScroll = QrySimulacoesAfterScroll
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT IDSIMULACAO,NOME,IDTABELA,IDGRUPOREGRA,                  ' +
        '          '
      
        '               DESCRICAO,DATA,IDGRUPOHIPOTESE,PUBLICADA,        ' +
        '                       '
      '               IDFILTRO                                '
      'FROM CM.SIMULACOES '
      'ORDER BY IDSIMULACAO')
    ValidateWithMask = True
    Left = 279
    Top = 77
  end
  object QryAuxiliar: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 307
    Top = 260
  end
  object QryTabBio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTABELA,DESCRICAO'
      'FROM CM.TABBIO'
      'ORDER BY IDTABELA ')
    ValidateWithMask = True
    Left = 20
    Top = 358
    object QryTabBioDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = 'TABBIO.DESCRICAO'
      Size = 60
    end
    object QryTabBioIDTABELA: TFloatField
      DisplayLabel = 'Código da Tabela'
      DisplayWidth = 10
      FieldName = 'IDTABELA'
      Origin = 'TABBIO.IDTABELA'
    end
  end
  object DsTabBio: TwwDataSource
    DataSet = QryTabBio
    Left = 50
    Top = 359
  end
  object DsSimulacao: TwwDataSource
    DataSet = QrySimulacao
    Left = 252
    Top = 222
  end
  object QrySimulacao: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    ValidateWithMask = True
    Left = 191
    Top = 222
  end
  object SalvarArq: TSaveDialog
    DefaultExt = '*.txt'
    FileName = '*.txt'
    Filter = '*.txt|*.txt'
    InitialDir = 'd:\simulacoes'
    Title = 'Crie o nome do arquivo(TXT) com máximo de 8 caracteres'
    Left = 48
    Top = 135
  end
  object TRegra
    IdCalculo = 0
    IdEmpresa = 0
  end
end
