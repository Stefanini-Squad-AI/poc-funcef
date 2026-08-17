inherited frmCadLayoutOrcMT: TfrmCadLayoutOrcMT
  Left = 349
  Top = 170
  HelpContext = 520028
  Caption = 'Cadastro de Layouts dos Demonstrativos Orçamentários'
  ClientHeight = 402
  ClientWidth = 424
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 424
    Height = 316
    object Label4: TLabel
      Left = 24
      Top = 56
      Width = 99
      Height = 13
      Caption = 'Tipo do Relatório'
    end
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 130
      Height = 13
      Caption = 'Relatório Customizável'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 96
      Width = 93
      Height = 13
      Caption = 'Nome do Layout'
    end
    object Label3: TLabel
      Left = 24
      Top = 152
      Width = 50
      Height = 13
      Caption = 'Legenda'
    end
    object Bevel1: TBevel
      Left = 24
      Top = 144
      Width = 377
      Height = 9
      Shape = bsTopLine
    end
    object MemReports: TMemo
      Left = 24
      Top = 112
      Width = 241
      Height = 21
      Lines.Strings = (
        'MemReports')
      ScrollBars = ssBoth
      TabOrder = 4
      Visible = False
    end
    object btnDesenho: TBitBtn
      Left = 280
      Top = 32
      Width = 121
      Height = 61
      Caption = '&Desenho'
      TabOrder = 0
      OnClick = btnDesenhoClick
      Glyph.Data = {
        1E040000424D1E04000000000000760000002800000030000000270000000100
        040000000000A803000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8777777777777777888888888888888888888880000000000000000000000007
        888888888888888888888880FBFBFBFBFBFBFBFBFBFBFB078888888888888888
        88888880B0BFBFB0BFBFB0BFBFB0BF07888888888888888888888880F0FB0BF0
        FB0BF0FB0BF0FB07888888888888888888888880000000000000000000000008
        88888888888888888888888880EEEEEEEEEEEEE0788888888888888888888888
        8888888880EEEEEEEEEEEE078888888888888888888888888888888880EE0000
        0EEEE07F8F8F8F8888888888888888888888888880EE0870EEEE07F8F8F8F8F8
        88888888888888888888888880EE080EEEE0077F8F8F8F888888888888888888
        8888888880EE00EEEE0770007788888888888888888888888888888880EE0EEE
        E07887F70077888888888888888888888888888880EEEEEE078887FF77077788
        88888888888888888888888880EEEEE08888887FF70088778888888888888888
        8888888880EEEE088888887FF033087778888888888888888888888880EEE088
        88888880F003307778888888888888888888888880EE0888888888880BB03307
        78778888888888888888888880E088888888888880BB03307888888888888888
        888888888008888888888888880BB03308777777787888888888888880888888
        888888888880BB0330F888888877888888888888888888888888888888880BB0
        3308877777777788888888888888888888888888888880BB0330888777777777
        8888888888888888888888888888880BB0330888877777777888888888888888
        8888888888888880BB0330888880000008888888888888888888888888888888
        0BB03308888880008888888888888888888888888888888880BB006088888888
        88888888888888888888888888888888880B0E00088888888888888888888888
        88888888888888888880E0870088888888888888888888888888888888888888
        88880F887088888888888888888888888888888888888888888880F808888888
        8888888888888888888888888888888888888800888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888}
    end
    object dbcboTipo: TwwDBComboBox
      Left = 24
      Top = 72
      Width = 241
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      DataField = 'FLGTIPOLAYOUT'
      DataSource = ds
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        '1 - Normal'#9'1'
        '2 - Colunado Mensal '#9'2')
      Sorted = False
      TabOrder = 1
      UnboundDataType = wwDefault
    end
    object dblkRelatorio: TwwDBLookupCombo
      Left = 24
      Top = 32
      Width = 241
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMERELATORC'#9'40'#9'NOMERELATORC')
      DataField = 'IDRELATORC'
      DataSource = ds
      LookupTable = CdsRelatorio
      LookupField = 'IDRELATORC'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dbeNome: TwwDBEdit
      Left = 24
      Top = 112
      Width = 377
      Height = 21
      DataField = 'NOMELAYOUT'
      DataSource = ds
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 424
  end
  inherited Dock971: TDock97
    Top = 363
    Width = 424
    inherited tb97Fundo: TToolbar97
      Left = 252
      DockPos = 255
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520028
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 83
      DockPos = 86
    end
    object NomeCampo: TMemo
      Left = 8
      Top = 0
      Width = 65
      Height = 33
      Lines.Strings = (
        'NomeCampo')
      TabOrder = 2
      Visible = False
      WordWrap = False
    end
    object DscCampo: TMemo
      Left = 32
      Top = 4
      Width = 65
      Height = 33
      Lines.Strings = (
        'DscCampo')
      TabOrder = 3
      Visible = False
      WordWrap = False
    end
  end
  object memLog: TRichEdit [3]
    Left = 21
    Top = 216
    Width = 377
    Height = 129
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'DESCRIÇÃO DAS COLUNAS DOS RELATÓRIOS'
      ''
      '********** DEMONSTRATIVO DE LAYOUT NORMAL *********'
      ''
      'SaldoRealPerEAT   - Valor Realizado no Período - Exercício Atual'
      'SaldoOrcPerEAT    - Valor Orçado no Período - Exercício Atual'
      
        'DifOrcRealPerEAT  - Diferença Orçado x Realizado no Período - Ex' +
        'ercício Atual'
      
        'AV_RealPerEAT     - Análise Vertical Valor Realizado no Período ' +
        '- Exercício Atual'
      
        'AV_OrcPerEAT      - Análise Vertical Valor Orçado no Período - E' +
        'xercício Atual'
      
        'AH_OrcRealPerEAT  - Análise Horizontal Orçado x Realizado no Per' +
        'íodo - Exercício Atual'
      'SaldoRealAcumEAT  - Valor Realizado Acumulado - Exercício Atual'
      'SaldoOrcAcumEAT   - Valor Orçado Acumulado - Exercício Atual'
      
        'DifOrcRealAcumEAT - Diferença Orçado x Realizado Acumulado - Exe' +
        'rcício Atual'
      
        'AV_RealAcumEAT    - Análise Vertical Valor Realizado Acumulado -' +
        ' Exercício Atual'
      
        'AV_OrcAcumEAT     - Análise Vertical Valor Orçado Acumulado - Ex' +
        'ercício Atual'
      
        'AH_OrcRealAcumEAT - Análise Horizontal Orçado x Realizado Acumul' +
        'ado - Exercício Atual'
      
        'SaldoRealPerEAN   - Valor Realizado no Período - Exercício Anter' +
        'ior'
      
        'DifExAtuAntPer    - Diferença Exercício Atual x Exercício Anteri' +
        'or no Período'
      
        'AV_RealPerEAN     - Análise Vertical Valor Realizado no Período ' +
        '- Exercício Anterior'
      
        'AH_ExAtuAntPer    - Análise Horizontal Exercício Atual x Exercíc' +
        'io Anterior no Período'
      
        'SaldoRealAcumEAN  - Valor Realizado Acumulado - Exercício Anteri' +
        'or'
      
        'DifExAtuAntAcum   - Diferença Exercício Atual x Exercício Anteri' +
        'or Acumulado'
      
        'AV_RealAcumEAN    - Análise Vertical Valor Realizado Acumulado -' +
        ' Exercício Anterior'
      
        'AH_ExAtuAntAcum   - Análise Horizontal Exercício Atual x Exercíc' +
        'io Anterior Acumulado'
      
        'SaldoReaPerAntEAT - Valor Realizado no Período Anterior - Exercí' +
        'cio Atual'
      
        'DifPerAtuAntEAT   - Diferença Período Atual x Período Anterior -' +
        ' Exercício Atual'
      
        'AV_RealPerAntEAT  - Análise Vertical Valor Realizado no Período ' +
        'Anterior - Exer. Atual'
      
        'AH_PerAtuAntEAT   - Análise Horizontal Período Atual x Período A' +
        'nterior - Exer. Atual'
      'FlagTipoNegativo  - Flag de Cálculo Interna (não usar)'
      'NomeContaInd      - Nome da Conta Orçamentária Indentada'
      'NomeConta         - Nome da Conta Orçamentária'
      'NumLinha          - Número da Linha do Relatório'
      'CodigoConta       - Código da Conta Orçamentária'
      'CodigoConta100    - Código da Conta Orçamentária para 100%'
      'Indentacao        - Indentação da Conta (não usar)'
      
        'NumDecimais       - Número de casas decimais para exibição (não ' +
        'usar)'
      
        'FlagMonetaria     - Flag indicativa se a Conta é Monetária ou nã' +
        'o'
      'FlagInterna1      - Flag de Cálculo Interna (não usar)'
      'Linha1            - Flag indicativa de Espaço entre os elementos'
      
        'Linha2            - Flag indicativa de Linha Fina entre os eleme' +
        'ntos'
      
        'Linha3            - Flag indicativa de Linha Grossa entre os ele' +
        'mentos'
      
        'Linha4            - Flag indicativa de Linha Dupla entre os elem' +
        'entos'
      'Periodo           - Período inicial dos Parâmetros do Relatório'
      'Exercicio         - Exercício dos Parâmetros do Relatório'
      ''
      ''
      ''
      '********** DEMONSTRATIVO DE LAYOUT COLUNADO MENSAL *********'
      ''
      'R01_Janeiro a'
      
        'R12_Dezembro      - Valores Realizados dos meses de Janeiro e De' +
        'zembro'
      'AR01_Janeiro a'
      
        'AR12_Dezembro     - Valores Acumulados Realizados dos meses de J' +
        'aneiro e Dezembro'
      'O01_Janeiro a'
      
        'O12_Dezembro      - Valores Orçados dos meses de Janeiro e Dezem' +
        'bro'
      'AO01_Janeiro a'
      
        'AO12_Dezembro     - Valores Acumulados Orçados dos meses de Jane' +
        'iro e Dezembro'
      'FlagTipoNegativo  - Flag de Cálculo Interna (não usar)'
      'NomeContaInd      - Nome da Conta Orçamentária Indentada'
      'NomeConta         - Nome da Conta Orçamentária'
      'NumLinha          - Número da Linha do Relatório'
      'CodigoConta       - Código da Conta Orçamentária'
      'CodigoConta100    - Código da Conta Orçamentária para 100%'
      'Indentacao        - Indentação da Conta (não usar)'
      
        'NumDecimais       - Número de casas decimais para exibição (não ' +
        'usar)'
      
        'FlagMonetaria     - Flag indicativa se a Conta é Monetária ou nã' +
        'o'
      'FlagInterna1      - Flag de Cálculo Interna (não usar)'
      'Linha1            - Flag indicativa de Espaço entre os elementos'
      
        'Linha2            - Flag indicativa de Linha Fina entre os eleme' +
        'ntos'
      
        'Linha3            - Flag indicativa de Linha Grossa entre os ele' +
        'mentos'
      
        'Linha4            - Flag indicativa de Linha Dupla entre os elem' +
        'entos'
      'Periodo           - Período inicial dos Parâmetros do Relatório'
      'Exercicio         - Exercício dos Parâmetros do Relatório')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 3
    WordWrap = False
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 34
    Top = 234
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 189
    Top = 234
  end
  inherited ImlPadrao: TImageList
    Left = 86
    Top = 234
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyDelete = CmeCadastroApplyDelete
    Left = 137
    Top = 270
  end
  inherited Cds: TCMClientDataSet
    Left = 137
    Top = 234
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RELATORC.NOMERELATORC'
      'DESENHOORC.NOMELAYOUT')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Relatório'
      'Nome do Layout')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'DESENHOORC'
      'RELATORC')
    CamposChave.Strings = (
      'DESENHOORC.IDDESENHOORC')
    Filtro.Strings = (
      'DESENHOORC.IDRELATORC = RELATORC.IDRELATORC')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '40'
      '40')
    Left = 86
    Top = 270
  end
  object DsgnCM: TppDesigner
    AllowDataSettingsChange = True
    Caption = 'Gerador de Relatórios e Gráficos'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000033333300003333330000000000000003BBBBBB3003BBBBBB30000
      00000000003BBBBBB3003BBBBBB30000000000000003BBBB3003BBBBBB300000
      000000000003BBBB3003BBBBB3000000000000000003BBBB3003BBBB30000000
      000000000003BBBBB33BBBBB30000000000000000003BBBBBBBBBBB300000000
      000000000003BBBBBBBBBBB300000000000000700003BBBB333BBBBB30000000
      000000800003BBBB3003BBBBB30000000000F8F00003BBBB3003BBBBB3000000
      008F8F800003BBBB3003BBBBB3000070F8F877F80003BBBB333BBBBBB300007F
      8F00F08F003BBBBBBBBBBBBB3000007800FFF048003BBBBBBBBBBBB300000000
      FFFFF08F8003333333333330000070FFFFCCF804F07000000000000000007FFF
      CCFFFF0F8F0000000000000000007FCCFFFCCF074807000000000000000078FF
      FCCFFFF08F80700000000000000007FCCFFFCCF044F8070000000000000007FF
      FFCCFFFF0F8F8000000000000000078FCCFFFCCF07F77000000000000000007F
      FFFCCFFFF07000000000000000000078FCCFFFCCFF0700000000000000000007
      FFFFCCFFFF80000000000000000000078FCCFFFF877000000000000000000000
      7FFFFF8770000000000000000000000007FF8770000000000000000000000000
      007770000000000000000000000000000000000000000000000000000000FFFE
      0781FFFC0300FFFC0300FFFE0601FFFE0603FFFE0607FFFE0007FFFE000FFFFE
      000FFFDE0007FF0E0603FC0E0603F00E0603C0060003C0040007C004000FC002
      001F0001FFFF0001FFFF0000FFFF00007FFF80003FFF80003FFF80007FFFC001
      FFFFC000FFFFE000FFFFE001FFFFF007FFFFF81FFFFFFC7FFFFFFFFFFFFF}
    MergeMenu = MergeMenu
    Position = poScreenCenter
    ShowComponents = [scLabel, scMemo, scRichText, scCalc, scImage, scShape, scLine, scBarCode, scTeeChart, scDBText, scDBMemo, scDBRichText, scDBCalc, scDBImage, scDBBarCode, scDBTeeChart, scRegion]
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    OnCreate = DsgnCMCreate
    Left = 344
    Top = 234
  end
  object ppRelatorio: TppBDEPipeline
    DataSource = ds
    UserName = 'Relatorio'
    Left = 292
    Top = 304
    object ppRelatorioppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDDESENHOORC'
      FieldName = 'IDDESENHOORC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppRelatorioppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRELATORC'
      FieldName = 'IDRELATORC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppRelatorioppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDREPORTS'
      FieldName = 'IDREPORTS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppRelatorioppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORIGEMCM'
      FieldName = 'ORIGEMCM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppRelatorioppField5: TppField
      FieldAlias = 'FLGTIPOLAYOUT'
      FieldName = 'FLGTIPOLAYOUT'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
    object ppRelatorioppField6: TppField
      FieldAlias = 'NOMELAYOUT'
      FieldName = 'NOMELAYOUT'
      FieldLength = 40
      DisplayWidth = 40
      Position = 5
    end
  end
  object DsConsulta: TwwDataSource
    DataSet = CdsDemoNormal
    Left = 241
    Top = 270
  end
  object MergeMenu: TMainMenu
    Left = 34
    Top = 270
    object mniFile: TMenuItem
      Caption = '&Arquivo'
      GroupIndex = 10
      object mniFileSave: TMenuItem
        Caption = '&Salvar'
        ShortCut = 16467
        OnClick = mniFileSaveClick
      end
      object mniFileLine3: TMenuItem
        Caption = '-'
      end
      object mniFilePageSetup: TMenuItem
        Caption = 'Configurar &Página'
        OnClick = mniFilePageSetupClick
      end
      object mniFilePrintToFileSetup: TMenuItem
        Caption = 'Configuração da Impressão Para &Arquivo'
        OnClick = mniFilePrintToFileSetupClick
      end
      object mniFileLine4: TMenuItem
        Caption = '-'
      end
      object mniFilePrint: TMenuItem
        Caption = '&Imprimir'
        ShortCut = 16464
        OnClick = mniFilePrintClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
    object MnuRlatorio: TMenuItem
      Caption = '&Relatório'
      GroupIndex = 60
      Visible = False
      object MnuTitulo: TMenuItem
        Caption = '&Título'
      end
      object MnuSumario: TMenuItem
        Caption = '&Sumário'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object MnuCabecalho: TMenuItem
        Caption = '&Cabeçalho'
      end
      object MnuRodape: TMenuItem
        Caption = '&Rodapé'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object MnuGrupos: TMenuItem
        Caption = '&Grupos'
        ShortCut = 16455
      end
      object MnuLInha: TMenuItem
        Caption = '-'
        ShortCut = 189
      end
      object MnuRetrato: TMenuItem
        Caption = '&Retrato'
      end
      object MnuPaisagem: TMenuItem
        Caption = '&Paisagem'
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object MnuUnidades: TMenuItem
        Caption = '&Unidades'
        object MnuPixelsTela: TMenuItem
          Caption = 'Pixels de &Tela'
        end
        object MnuPixelsImpressora: TMenuItem
          Caption = 'Pixels de &Impressora'
        end
        object MnuPolegada: TMenuItem
          Caption = '&Polegada'
        end
        object MnuMilimetros: TMenuItem
          Caption = '&Milímetros'
        end
        object MnuMMilimetros: TMenuItem
          Caption = '&Milhares de Milímetros'
        end
      end
    end
  end
  object DsqDemoColMes: TwwDataSource
    DataSet = CdsDemoColMes
    Left = 241
    Top = 234
  end
  object ppDemoColMes: TppBDEPipeline
    DataSource = DsqDemoColMes
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'DemoColMens'
    Left = 292
    Top = 234
    object ppDemoColMesppField1: TppField
      FieldAlias = 'R01_JANEIRO'
      FieldName = 'R01_JANEIRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField2: TppField
      FieldAlias = 'R02_FEVEREIRO'
      FieldName = 'R02_FEVEREIRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField3: TppField
      FieldAlias = 'R03_MARCO'
      FieldName = 'R03_MARCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField4: TppField
      FieldAlias = 'R04_ABRIL'
      FieldName = 'R04_ABRIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField5: TppField
      FieldAlias = 'R05_MAIO'
      FieldName = 'R05_MAIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField6: TppField
      FieldAlias = 'R06_JUNHO'
      FieldName = 'R06_JUNHO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField7: TppField
      FieldAlias = 'R07_JULHO'
      FieldName = 'R07_JULHO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField8: TppField
      FieldAlias = 'R08_AGOSTO'
      FieldName = 'R08_AGOSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField9: TppField
      FieldAlias = 'R09_SETEMBRO'
      FieldName = 'R09_SETEMBRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField10: TppField
      FieldAlias = 'R10_OUTUBRO'
      FieldName = 'R10_OUTUBRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField11: TppField
      FieldAlias = 'R11_NOVEMBRO'
      FieldName = 'R11_NOVEMBRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField12: TppField
      FieldAlias = 'R12_DEZEMBRO'
      FieldName = 'R12_DEZEMBRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField13: TppField
      FieldAlias = 'SOMALINHAREAL'
      FieldName = 'SOMALINHAREAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField14: TppField
      FieldAlias = 'O01_JANEIRO'
      FieldName = 'O01_JANEIRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField15: TppField
      FieldAlias = 'O02_FEVEREIRO'
      FieldName = 'O02_FEVEREIRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField16: TppField
      FieldAlias = 'O03_MARCO'
      FieldName = 'O03_MARCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField17: TppField
      FieldAlias = 'O04_ABRIL'
      FieldName = 'O04_ABRIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField18: TppField
      FieldAlias = 'O05_MAIO'
      FieldName = 'O05_MAIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField19: TppField
      FieldAlias = 'O06_JUNHO'
      FieldName = 'O06_JUNHO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField20: TppField
      FieldAlias = 'O07_JULHO'
      FieldName = 'O07_JULHO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField21: TppField
      FieldAlias = 'O08_AGOSTO'
      FieldName = 'O08_AGOSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField22: TppField
      FieldAlias = 'O09_SETEMBRO'
      FieldName = 'O09_SETEMBRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField23: TppField
      FieldAlias = 'O10_OUTUBRO'
      FieldName = 'O10_OUTUBRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField24: TppField
      FieldAlias = 'O11_NOVEMBRO'
      FieldName = 'O11_NOVEMBRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField25: TppField
      FieldAlias = 'O12_DEZEMBRO'
      FieldName = 'O12_DEZEMBRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField26: TppField
      FieldAlias = 'SOMALINHAORC'
      FieldName = 'SOMALINHAORC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField27: TppField
      FieldAlias = 'AR01_JANEIRO'
      FieldName = 'AR01_JANEIRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField28: TppField
      FieldAlias = 'AR02_FEVEREIRO'
      FieldName = 'AR02_FEVEREIRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField29: TppField
      FieldAlias = 'AR03_MARCO'
      FieldName = 'AR03_MARCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField30: TppField
      FieldAlias = 'AR04_ABRIL'
      FieldName = 'AR04_ABRIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField31: TppField
      FieldAlias = 'AR05_MAIO'
      FieldName = 'AR05_MAIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField32: TppField
      FieldAlias = 'AR06_JUNHO'
      FieldName = 'AR06_JUNHO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField33: TppField
      FieldAlias = 'AR07_JULHO'
      FieldName = 'AR07_JULHO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField34: TppField
      FieldAlias = 'AR08_AGOSTO'
      FieldName = 'AR08_AGOSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField35: TppField
      FieldAlias = 'AR09_SETEMBRO'
      FieldName = 'AR09_SETEMBRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField36: TppField
      FieldAlias = 'AR10_OUTUBRO'
      FieldName = 'AR10_OUTUBRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField37: TppField
      FieldAlias = 'AR11_NOVEMBRO'
      FieldName = 'AR11_NOVEMBRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField38: TppField
      FieldAlias = 'AR12_DEZEMBRO'
      FieldName = 'AR12_DEZEMBRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField39: TppField
      FieldAlias = 'SOMALINHAAREAL'
      FieldName = 'SOMALINHAAREAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField40: TppField
      FieldAlias = 'AO01_JANEIRO'
      FieldName = 'AO01_JANEIRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField41: TppField
      FieldAlias = 'AO02_FEVEREIRO'
      FieldName = 'AO02_FEVEREIRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField42: TppField
      FieldAlias = 'AO03_MARCO'
      FieldName = 'AO03_MARCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField43: TppField
      FieldAlias = 'AO04_ABRIL'
      FieldName = 'AO04_ABRIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField44: TppField
      FieldAlias = 'AO05_MAIO'
      FieldName = 'AO05_MAIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField45: TppField
      FieldAlias = 'AO06_JUNHO'
      FieldName = 'AO06_JUNHO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField46: TppField
      FieldAlias = 'AO07_JULHO'
      FieldName = 'AO07_JULHO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField47: TppField
      FieldAlias = 'AO08_AGOSTO'
      FieldName = 'AO08_AGOSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField48: TppField
      FieldAlias = 'AO09_SETEMBRO'
      FieldName = 'AO09_SETEMBRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField49: TppField
      FieldAlias = 'AO10_OUTUBRO'
      FieldName = 'AO10_OUTUBRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField50: TppField
      FieldAlias = 'AO11_NOVEMBRO'
      FieldName = 'AO11_NOVEMBRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField51: TppField
      FieldAlias = 'AO12_DEZEMBRO'
      FieldName = 'AO12_DEZEMBRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField52: TppField
      FieldAlias = 'SOMALINHAAORC'
      FieldName = 'SOMALINHAAORC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 51
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField53: TppField
      FieldAlias = 'FLAGTIPONEGATIVO'
      FieldName = 'FLAGTIPONEGATIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 52
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField54: TppField
      FieldAlias = 'NOMECONTAIND'
      FieldName = 'NOMECONTAIND'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 53
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField55: TppField
      FieldAlias = 'NOMECONTA'
      FieldName = 'NOMECONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 54
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField56: TppField
      FieldAlias = 'NUMLINHA'
      FieldName = 'NUMLINHA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 55
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField57: TppField
      FieldAlias = 'INDENTACAO'
      FieldName = 'INDENTACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 56
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField58: TppField
      FieldAlias = 'NUMDECIMAIS'
      FieldName = 'NUMDECIMAIS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 57
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField59: TppField
      FieldAlias = 'FLAGINTERNA1'
      FieldName = 'FLAGINTERNA1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 58
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField60: TppField
      FieldAlias = 'FLAGMONETARIA'
      FieldName = 'FLAGMONETARIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 59
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField61: TppField
      FieldAlias = 'LINHA1'
      FieldName = 'LINHA1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 60
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField62: TppField
      FieldAlias = 'LINHA2'
      FieldName = 'LINHA2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 61
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField63: TppField
      FieldAlias = 'LINHA3'
      FieldName = 'LINHA3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 62
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField64: TppField
      FieldAlias = 'LINHA4'
      FieldName = 'LINHA4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 63
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField65: TppField
      FieldAlias = 'PERIODO'
      FieldName = 'PERIODO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 64
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField66: TppField
      FieldAlias = 'EXERCICIO'
      FieldName = 'EXERCICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 65
      Searchable = False
      Sortable = False
    end
    object ppDemoColMesppField67: TppField
      FieldAlias = 'CODIGOCONTA'
      FieldName = 'CODIGOCONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 66
      Searchable = False
      Sortable = False
    end
  end
  object ppConsulta: TppBDEPipeline
    DataSource = DsConsulta
    UserName = 'Consulta'
    Left = 292
    Top = 270
    object ppConsultappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOORCPEREAT'
      FieldName = 'SALDOORCPEREAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppConsultappField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOORCACUMEAT'
      FieldName = 'SALDOORCACUMEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppConsultappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOREALPEREAT'
      FieldName = 'SALDOREALPEREAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppConsultappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOREALACUMEAT'
      FieldName = 'SALDOREALACUMEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppConsultappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOREALPEREAN'
      FieldName = 'SALDOREALPEREAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppConsultappField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOREALACUMEAN'
      FieldName = 'SALDOREALACUMEAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppConsultappField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOREALAEAT'
      FieldName = 'SALDOREALAEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppConsultappField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOREALACUMAEAT'
      FieldName = 'SALDOREALACUMAEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppConsultappField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOORCAEAT'
      FieldName = 'SALDOORCAEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppConsultappField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOORCACUMAEAT'
      FieldName = 'SALDOORCACUMAEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppConsultappField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'AV_ORCPEREAT'
      FieldName = 'AV_ORCPEREAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppConsultappField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'AV_ORCACUMEAT'
      FieldName = 'AV_ORCACUMEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppConsultappField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'AV_REALPEREAT'
      FieldName = 'AV_REALPEREAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppConsultappField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'AV_REALACUMEAT'
      FieldName = 'AV_REALACUMEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppConsultappField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'AV_REALPEREAN'
      FieldName = 'AV_REALPEREAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppConsultappField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'AV_REALACUMEAN'
      FieldName = 'AV_REALACUMEAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppConsultappField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'AV_ORCAEAT'
      FieldName = 'AV_ORCAEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppConsultappField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'AV_ORCACUMAEAT'
      FieldName = 'AV_ORCACUMAEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppConsultappField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'AV_REALAEAT'
      FieldName = 'AV_REALAEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppConsultappField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'AV_REALACUMAEAT'
      FieldName = 'AV_REALACUMAEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppConsultappField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFORCREALPEREAT'
      FieldName = 'DIFORCREALPEREAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppConsultappField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFORCREALACUMEAT'
      FieldName = 'DIFORCREALACUMEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppConsultappField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFORCREALPEREAN'
      FieldName = 'DIFORCREALPEREAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppConsultappField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFORCREALACUMEAN'
      FieldName = 'DIFORCREALACUMEAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppConsultappField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFORCREALAEAT'
      FieldName = 'DIFORCREALAEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppConsultappField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFORCREAACUMAEAT'
      FieldName = 'DIFORCREAACUMAEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppConsultappField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'AH_ORCREALPEREAT'
      FieldName = 'AH_ORCREALPEREAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppConsultappField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'AH_ORCREALACUMEAT'
      FieldName = 'AH_ORCREALACUMEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object ppConsultappField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'AH_EXATUANTPER'
      FieldName = 'AH_EXATUANTPER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object ppConsultappField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'AH_PERATUANTEAT'
      FieldName = 'AH_PERATUANTEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object ppConsultappField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'AH_EXATUANTACUM'
      FieldName = 'AH_EXATUANTACUM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object ppConsultappField32: TppField
      FieldAlias = 'FLAGTIPONEGATIVO'
      FieldName = 'FLAGTIPONEGATIVO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 31
    end
    object ppConsultappField33: TppField
      FieldAlias = 'NOMECONTAIND'
      FieldName = 'NOMECONTAIND'
      FieldLength = 78
      DisplayWidth = 78
      Position = 32
    end
    object ppConsultappField34: TppField
      FieldAlias = 'NOMECONTA'
      FieldName = 'NOMECONTA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 33
    end
    object ppConsultappField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMLINHA'
      FieldName = 'NUMLINHA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object ppConsultappField36: TppField
      FieldAlias = 'INDENTACAO'
      FieldName = 'INDENTACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 35
    end
    object ppConsultappField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMDECIMAIS'
      FieldName = 'NUMDECIMAIS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object ppConsultappField38: TppField
      FieldAlias = 'FLAGINTERNA1'
      FieldName = 'FLAGINTERNA1'
      FieldLength = 1
      DisplayWidth = 1
      Position = 37
    end
    object ppConsultappField39: TppField
      FieldAlias = 'FLAGMONETARIA'
      FieldName = 'FLAGMONETARIA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 38
    end
    object ppConsultappField40: TppField
      FieldAlias = 'LINHA1'
      FieldName = 'LINHA1'
      FieldLength = 1
      DisplayWidth = 1
      Position = 39
    end
    object ppConsultappField41: TppField
      FieldAlias = 'LINHA2'
      FieldName = 'LINHA2'
      FieldLength = 1
      DisplayWidth = 1
      Position = 40
    end
    object ppConsultappField42: TppField
      FieldAlias = 'LINHA3'
      FieldName = 'LINHA3'
      FieldLength = 1
      DisplayWidth = 1
      Position = 41
    end
    object ppConsultappField43: TppField
      FieldAlias = 'PERIODO'
      FieldName = 'PERIODO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 42
    end
    object ppConsultappField44: TppField
      FieldAlias = 'EXERCICIO'
      FieldName = 'EXERCICIO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 43
    end
    object ppConsultappField45: TppField
      FieldAlias = 'LINHA4'
      FieldName = 'LINHA4'
      FieldLength = 1
      DisplayWidth = 1
      Position = 44
    end
    object ppConsultappField46: TppField
      FieldAlias = 'CODIGOCONTA'
      FieldName = 'CODIGOCONTA'
      FieldLength = 25
      DisplayWidth = 25
      Position = 45
    end
    object ppConsultappField47: TppField
      FieldAlias = 'CODIGOCONTA100'
      FieldName = 'CODIGOCONTA100'
      FieldLength = 25
      DisplayWidth = 25
      Position = 46
    end
  end
  object RptCM: TppReport
    AutoStop = False
    DataPipeline = ppDemoColMes
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 344
    Top = 303
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppDemoColMes'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataPipeline = ppDemoColMes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemoColMes'
        mmHeight = 3969
        mmLeft = 45244
        mmTop = 6350
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object CdsReports: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 191
  end
  object CdsRelatorio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 191
  end
  object CdsDemoColMes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 138
    Top = 191
  end
  object CdsDemoNormal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 189
    Top = 191
  end
end
