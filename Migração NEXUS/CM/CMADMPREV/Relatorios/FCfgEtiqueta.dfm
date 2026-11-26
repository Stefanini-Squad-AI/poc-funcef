inherited frmCfgEtiqueta: TfrmCfgEtiqueta
  Left = 384
  Top = 344
  Caption = 'Etiquetas de Endereço'
  ClientHeight = 278
  ClientWidth = 527
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 527
    Height = 192
    object Label1: TLabel
      Left = 13
      Top = 17
      Width = 111
      Height = 13
      Caption = 'Modelo da Etiqueta'
    end
    object DeEtiqueta: TwwDBEdit
      Left = 13
      Top = 32
      Width = 373
      Height = 21
      DataField = 'MODELOETIQ'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object BtnDesenho: TBitBtn
      Left = 397
      Top = 17
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
    object GroupBox1: TGroupBox
      Left = 14
      Top = 67
      Width = 497
      Height = 109
      Caption = ' Configuração Para Impressora Matricial '
      TabOrder = 2
      object Label2: TLabel
        Left = 8
        Top = 23
        Width = 46
        Height = 13
        Caption = 'Colunas'
      end
      object Label3: TLabel
        Left = 292
        Top = 23
        Width = 112
        Height = 13
        Caption = 'Linhas Por Etiqueta'
      end
      object Label4: TLabel
        Left = 8
        Top = 52
        Width = 195
        Height = 13
        Caption = 'Caracteres ( largura ) Por Etiqueta'
      end
      object Label5: TLabel
        Left = 292
        Top = 52
        Width = 129
        Height = 13
        Caption = 'Linhas Entre Etiquetas'
      end
      object BtnTestaImpressao: TToolbarButton97
        Left = 292
        Top = 71
        Width = 190
        Height = 27
        AllowAllUp = True
        Caption = 'Página de Teste'
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
        WordWrap = True
        OnClick = BtnTestaImpressaoClick
      end
      object Label6: TLabel
        Left = 8
        Top = 82
        Width = 215
        Height = 13
        Caption = 'Caracteres ( Espaço ) Entre Etiquetas'
      end
      object SedtColuna: TwwDBSpinEdit
        Left = 231
        Top = 17
        Width = 49
        Height = 21
        Increment = 1
        MaxValue = 8
        DataField = 'NUMCOLUNAS'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
      end
      object SedtLinhas: TwwDBSpinEdit
        Left = 434
        Top = 17
        Width = 49
        Height = 21
        Increment = 1
        MaxValue = 999
        MinValue = 4
        DataField = 'NUMLINHAS'
        DataSource = ds
        TabOrder = 2
        UnboundDataType = wwDefault
      end
      object SedtEtiq: TwwDBSpinEdit
        Left = 434
        Top = 46
        Width = 49
        Height = 21
        Increment = 1
        MaxValue = 999
        DataField = 'NUMLINHASESPACO'
        DataSource = ds
        TabOrder = 3
        UnboundDataType = wwDefault
      end
      object SedtLargura: TwwDBSpinEdit
        Left = 231
        Top = 46
        Width = 49
        Height = 21
        Increment = 1
        MaxValue = 999
        DataField = 'NUMCHARLARGURA'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object SedEspEtiq: TwwDBSpinEdit
        Left = 231
        Top = 76
        Width = 49
        Height = 21
        Increment = 1
        MaxValue = 999
        DataField = 'NUMCHARENTREETIQ'
        DataSource = ds
        TabOrder = 4
        UnboundDataType = wwDefault
      end
    end
  end
  inherited Dock972: TDock97
    Width = 527
  end
  inherited Dock971: TDock97
    Top = 239
    Width = 527
    inherited tb97Fundo: TToolbar97
      Left = 355
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 186
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 447
    Top = 3
    TargetsData = (
      1
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 314
    Top = 3
  end
  inherited ImlPadrao: TImageList
    Left = 414
    Top = 3
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 348
    Top = 3
  end
  inherited Cds: TCMClientDataSet
    Left = 280
    Top = 3
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ETIQUETA.MODELOETIQ')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Modelo')
    Tabelas.Strings = (
      'ETIQUETA')
    CamposChave.Strings = (
      'ETIQUETA.IDETIQUETA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 381
    Top = 3
  end
  object DsConsulta: TwwDataSource
    DataSet = CdsConsulta
    Left = 277
    Top = 243
  end
  object ppConsulta: TppBDEPipeline
    DataSource = DsConsulta
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'Consulta'
    Left = 232
    Top = 243
    object ppConsultappField1: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppConsultappField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppConsultappField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppConsultappField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppConsultappField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppConsultappField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppConsultappField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppConsultappField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppConsultappField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppConsultappField10: TppField
      FieldAlias = 'CONTATO'
      FieldName = 'CONTATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppConsultappField11: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppConsultappField12: TppField
      FieldAlias = 'SITFUNDACAO'
      FieldName = 'SITFUNDACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppConsultappField13: TppField
      FieldAlias = 'MENSAGEM'
      FieldName = 'MENSAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
  end
  object DsgnCM: TppDesigner
    Caption = 'Gerdor de Relatórios e Gráficos'
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
    Report = RptCM
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    OnCreate = DsgnCMCreate
    Left = 143
    Top = 243
  end
  object MergeMenu: TMainMenu
    Left = 98
    Top = 243
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
  object RptCM: TppReport
    AutoStop = False
    DataPipeline = ppConsulta
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.Format = ftASCII
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 187
    Top = 243
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppConsulta'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object SQL: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDETIQUETA,'
      '   MODELOETIQ,'
      '   IDREPORTS,'
      '   ORIGEMCM,'
      '   NUMCOLUNAS,'
      '   NUMCHARLARGURA,'
      '   NUMLINHAS,'
      '   NUMLINHASESPACO,'
      '   NUMCHARENTREETIQ'
      'FROM'
      '   ETIQUETA'
      'WHERE'
      '   IDETIQUETA= :IDETIQUETA'
      ' ')
    ClientDataSet = Cds
    Left = 247
    Top = 3
  end
  object SQLConsulta: TCMSqlParams
    SQL.Strings = (
      'Select'
      
        ' P.IdPessoa, P.RazaoSocial As Nome, E.Logradouro, E.Numero, E.Co' +
        'mplemento, E.Bairro,'
      
        ' C.nome as Cidade, Es.CodEstado, E.Cep, CP.Nome AS Contato, '#39'   ' +
        '            '#39' AS MATRICULA, '
      ' '#39'               '#39' AS SITFUNDACAO, '#39'               '#39' AS MENSAGEM'
      'From'
      ' Pessoa P,'
      ' EndPess E,'
      ' Cidades c,'
      ' ContatoPess CP,'
      ' Estado Es'
      'Where'
      ' (E.Idpessoa = P.IdPessoa) And'
      ' (E.IDCIDADES = C.IDCIDADES(+)) And'
      ' (ES.IDESTADO(+) = C.IDESTADO) And'
      ' (E.IDENDERECO(+) = P.IDENDCOMERCIAL) And'
      ' (CP.IDENDERECO(+) = P.IDENDCOMERCIAL) And'
      ' (RowNum < 10)'
      ''
      ' '
      ' ')
    ClientDataSet = CdsConsulta
    Left = 440
    Top = 239
  end
  object CdsConsulta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 243
    object CdsConsultaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object CdsConsultaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object CdsConsultaLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object CdsConsultaNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object CdsConsultaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object CdsConsultaBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object CdsConsultaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object CdsConsultaCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object CdsConsultaCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object CdsConsultaCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 50
    end
    object CdsConsultaMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 15
    end
    object CdsConsultaSITFUNDACAO: TStringField
      FieldName = 'SITFUNDACAO'
      FixedChar = True
      Size = 15
    end
    object CdsConsultaMENSAGEM: TStringField
      FieldName = 'MENSAGEM'
      FixedChar = True
      Size = 15
    end
  end
  object SQLReports: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   REPORTS.NAME,'
      '   REPORTS.IDREPORTS,'
      '   REPORTS.ORIGEMCM,'
      '   REPORTS.TEMPLATE'
      'FROM'
      '  CM.REPORTS'
      'WHERE'
      '   (REPORTS.IDREPORTS = :IDREPORTS) AND'
      '   (REPORTS.ORIGEMCM  = :ORIGEMCM)')
    ClientDataSet = CdsReports
    Left = 408
    Top = 239
  end
  object CdsReports: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 243
  end
end
