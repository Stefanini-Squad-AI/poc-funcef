inherited FrmConfigRelatorioMT: TFrmConfigRelatorioMT
  Left = 303
  Top = 197
  Caption = 'Configuração de Relatórios MT'
  ClientHeight = 198
  ClientWidth = 548
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 548
    Height = 112
    object PnlImprime: TPanel
      Left = 1
      Top = 1
      Width = 546
      Height = 110
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Label2: TLabel
        Left = 20
        Top = 21
        Width = 121
        Height = 13
        Caption = 'Descrição do Modelo'
      end
      object CmbModelo: TCMDBLookupCombo
        Left = 19
        Top = 42
        Width = 505
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MODELOCARTA'#9'60'#9'Descrição')
        LookupTable = CdsModelo
        LookupField = 'IDCARTACOBRANCA'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object PnlCadastro: TPanel
      Left = 1
      Top = 1
      Width = 546
      Height = 110
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 17
        Top = 27
        Width = 121
        Height = 13
        Caption = 'Descrição do Modelo'
      end
      object DeRelatorio: TwwDBEdit
        Left = 17
        Top = 44
        Width = 388
        Height = 21
        DataField = 'MODELOCARTA'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object BtnDesenho: TBitBtn
        Left = 419
        Top = 29
        Width = 114
        Height = 46
        Caption = '&Desenho'
        TabOrder = 1
        OnClick = BtnDesenhoClick
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
    end
  end
  inherited Dock972: TDock97
    Width = 548
  end
  inherited Dock971: TDock97
    Top = 159
    Width = 548
    inherited tb97Fundo: TToolbar97
      Left = 296
      inherited sep1: TToolbarSep97
        Left = 245
      end
      inherited sep3: TToolbarSep97
        Left = 161
      end
      object BtnImprime: TToolbarButton97 [2]
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        AllowAllUp = True
        Caption = ' &Imprime'
        Flat = False
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
        Opaque = False
        Spacing = 0
        OnClick = BtnImprimeClick
      end
      inherited bbtnSair: TBitBtn
        Left = 80
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 127
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 322
    Top = 69
  end
  inherited ds: TwwDataSource
    Left = 18
    Top = 114
  end
  inherited ImlPadrao: TImageList
    Left = 322
    Top = 21
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 262
    Top = 20
  end
  inherited Cds: TCMClientDataSet
    Left = 18
    Top = 67
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Modelo'
    Colunas.Strings = (
      'CARTACOBRANCA.MODELOCARTA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CARTACOBRANCA')
    CamposChave.Strings = (
      'CARTACOBRANCA.IDCARTACOBRANCA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 262
    Top = 67
  end
  object Sql: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  IDCARTACOBRANCA, MODELOCARTA, IDREPORTS, ORIGEMCM, FLGTIPOCART' +
        'A'
      'FROM'
      '  CARTACOBRANCA'
      'WHERE'
      '  (IDCARTACOBRANCA = :IDCARTACOBRANCA)')
    ClientDataSet = Cds
    Left = 18
    Top = 20
  end
  object MergeMenu: TMainMenu
    Left = 386
    Top = 112
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
      Caption = '&Rlatório'
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
  object DsgnCM: TppDesigner
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
    Report = RptModelo
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 322
    Top = 112
  end
  object RptModelo: TppReport
    AutoStop = False
    DataPipeline = PpDados
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Teste.Txt'
    Template.Format = ftASCII
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Language = lgPortugueseBrazil
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 264
    Top = 112
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpDados'
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 16140
      mmPrintPosition = 0
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {00}
    end
  end
  object PpDados: TppBDEPipeline
    DataSource = DsDados
    UserName = 'PpDados'
    Left = 202
    Top = 112
  end
  object DsDados: TwwDataSource
    DataSet = CdsDados
    Left = 140
    Top = 112
  end
  object CdsModelo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 79
    Top = 67
  end
  object SqlModelo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  IDCARTACOBRANCA, MODELOCARTA, IDREPORTS, ORIGEMCM, FLGTIPOCART' +
        'A'
      'FROM'
      '  CARTACOBRANCA'
      'WHERE'
      '  (FLGTIPOCARTA = :FLGTIPOCARTA)')
    ClientDataSet = CdsModelo
    Left = 79
    Top = 20
  end
  object SqlDados: TCMSqlParams
    ClientDataSet = CdsDados
    Left = 140
    Top = 20
  end
  object CdsDados: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 140
    Top = 67
  end
  object SqlReports: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   REPORTS.NAME,'
      '   REPORTS.IDREPORTS,'
      '   REPORTS.ORIGEMCM,'
      '   REPORTS.TEMPLATE'
      'FROM'
      '  REPORTS'
      'WHERE'
      '   (REPORTS.IDREPORTS = :IDREPORTS) AND'
      '   (REPORTS.ORIGEMCM  = :ORIGEMCM)')
    ClientDataSet = CdsReports
    Left = 201
    Top = 20
  end
  object CdsReports: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 201
    Top = 67
  end
end
