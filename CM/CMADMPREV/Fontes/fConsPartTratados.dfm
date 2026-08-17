inherited frmConsPartTratados: TfrmConsPartTratados
  Left = 0
  Top = 24
  HelpContext = 160094
  Caption = 'Consulta Participantes Tratados'
  ClientHeight = 501
  ClientWidth = 792
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 792
    Height = 462
    object Panel2: TPanel
      Left = 1
      Top = 384
      Width = 790
      Height = 77
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object Label2: TLabel
        Left = 9
        Top = 6
        Width = 69
        Height = 13
        Caption = 'Observação'
      end
      object wwDBRichEdit1: TwwDBRichEdit
        Left = 2
        Top = 5
        Width = 786
        Height = 70
        Align = alBottom
        AutoURLDetect = False
        DataField = 'OBSERVACAO'
        DataSource = dsPartTratado
        PrintJobName = 'Delphi 5'
        TabOrder = 0
        EditorCaption = 'Edit Rich Text'
        EditorPosition.Left = 0
        EditorPosition.Top = 0
        EditorPosition.Width = 0
        EditorPosition.Height = 0
        MeasurementUnits = muInches
        PrintMargins.Top = 1
        PrintMargins.Bottom = 1
        PrintMargins.Left = 1
        PrintMargins.Right = 1
        RichEditVersion = 2
        Data = {
          750000007B5C727466315C616E73695C616E7369637067313235325C64656666
          305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
          4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
          5C706172645C625C66305C667331345C7061720D0A7D0D0A00}
      end
    end
    object grpDadosParticipantes: TGroupBox
      Left = 1
      Top = 1
      Width = 790
      Height = 132
      Align = alTop
      Caption = 'Participante'
      TabOrder = 0
      object Label6: TLabel
        Left = 150
        Top = 52
        Width = 92
        Height = 13
        Caption = 'Nº do Benefício'
      end
      object Label7: TLabel
        Left = 6
        Top = 52
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label16: TLabel
        Left = 433
        Top = 53
        Width = 129
        Height = 13
        Caption = 'Descrição da Espécie '
      end
      object Label17: TLabel
        Left = 318
        Top = 52
        Width = 46
        Height = 13
        Caption = 'Espécie'
      end
      object Label1: TLabel
        Left = 6
        Top = 15
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object Label3: TLabel
        Left = 6
        Top = 91
        Width = 101
        Height = 13
        Caption = 'Entidade Contábil'
      end
      object Label4: TLabel
        Left = 433
        Top = 91
        Width = 75
        Height = 13
        Caption = 'Mantenedora'
      end
      object Label5: TLabel
        Left = 230
        Top = 91
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object btnProcurar: TBitBtn
        Left = 568
        Top = 11
        Width = 152
        Height = 44
        Hint = 'Procurar participante'
        Caption = '&Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnProcurarClick
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
      object lblParticipante: TStaticText
        Left = 6
        Top = 29
        Width = 512
        Height = 21
        AutoSize = False
        BorderStyle = sbsSunken
        TabOrder = 1
      end
      object lblMatricula: TStaticText
        Left = 6
        Top = 67
        Width = 115
        Height = 21
        AutoSize = False
        BorderStyle = sbsSunken
        TabOrder = 2
      end
      object lblNumBenef: TStaticText
        Left = 150
        Top = 67
        Width = 139
        Height = 21
        AutoSize = False
        BorderStyle = sbsSunken
        TabOrder = 3
      end
      object lblEspecie: TStaticText
        Left = 318
        Top = 67
        Width = 104
        Height = 21
        AutoSize = False
        BorderStyle = sbsSunken
        TabOrder = 4
      end
      object lblBeneficio: TStaticText
        Left = 433
        Top = 67
        Width = 353
        Height = 21
        AutoSize = False
        BorderStyle = sbsSunken
        TabOrder = 5
      end
      object lblEntidade: TStaticText
        Left = 6
        Top = 105
        Width = 219
        Height = 21
        AutoSize = False
        BorderStyle = sbsSunken
        TabOrder = 6
      end
      object stMantenedora: TStaticText
        Left = 433
        Top = 105
        Width = 353
        Height = 21
        AutoSize = False
        BorderStyle = sbsSunken
        TabOrder = 7
      end
      object EdPlanPrev: TStaticText
        Left = 230
        Top = 105
        Width = 193
        Height = 21
        AutoSize = False
        BorderStyle = sbsSunken
        TabOrder = 8
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 133
      Width = 790
      Height = 251
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object dbgrdTratados: TwwDBGrid
        Left = 2
        Top = 2
        Width = 786
        Height = 247
        Selected.Strings = (
          'MESCOBRANCA'#9'7'#9'Cobrança'
          'MESREFERENCIA'#9'7'#9'Referência'
          'RUBRICAINSS'#9'10'#9'Código INSS'
          'VALORINSS'#9'10'#9'Valor'
          'RUBRICA'#9'130'#9'Descriçao da Rubrica')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsPartTratado
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock971: TDock97
    Top = 462
    Width = 792
    inherited tb97Fundo: TToolbar97
      Left = 585
      DockPos = 585
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 307
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 226
        Caption = '&Ok'
      end
      inherited bbtnCancelar: TBitBtn
        Left = 310
      end
      object btnListagem: TBitBtn
        Left = 113
        Top = 0
        Width = 113
        Height = 33
        Caption = 'Lista Individ.'
        Enabled = False
        TabOrder = 2
        OnClick = btnListagemClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
      object BitBtn1: TBitBtn
        Left = 0
        Top = 0
        Width = 113
        Height = 33
        Caption = 'Lista Total'
        TabOrder = 3
        OnClick = BitBtn1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 483
    TargetsData = (
      1
      2
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        ''
        'Filter'
        0))
  end
  object qryPartTratado: TwwQuery
    AfterOpen = qryPartTratadoAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT D.MESCOBRANCA, D.MESREFERENCIA, P.NOME, D.NUMPROCINSS,'
      '       PPC.NOME PLANO, PD.DESCRICAO RUBRICA, B.NOME NOME_BENEF,'
      '       B.CODBENEFICIO, NVL(EL.MATRICULA,D.MATRICULA) MATRICULA,'
      '       D.OBSERVACAO, D.VALORINSS, D.SEQUENCIAL, D.RUBRICAINSS'
      'FROM DETCONCINSS D, PESSOA P, PROVDESC PD, PLANPREVCONTABIL PPC,'
      '     BENEFICIO B, ELEGPATRO EL'
      'WHERE D.IDPESSOA      = :IDPESSOA'
      '  AND D.IDPESSOA      = P.IDPESSOA'
      '  AND PD.IDPROVENTO   = D.IDRUBRICA'
      '  AND PPC.IDPLANOPREV = D.IDPLANOPREV'
      '  AND B.IDBENEFICIO   = D.IDBENEFICIO'
      '  AND EL.IDPESSOA(+)  = D.IDPESSOA'
      '  AND D.FLGTRATADO    = 1'
      'ORDER BY 1,2'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 677
    Top = 177
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = ''
      end>
  end
  object dsPartTratado: TwwDataSource
    DataSet = qryPartTratado
    Left = 677
    Top = 225
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.NOME'
      'D.NUMPROCINSS'
      'D.MESCOBRANCA'
      'D.MESREFERENCIA')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Participante'
      'Número Benefício'
      'Cobrança (AAAA/MM)'
      'Referência (AAAA/MM)')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DETCONCINSS D'
      'PESSOA P'
      'ELEGPATRO EL')
    CamposChave.Strings = (
      'P.IDPESSOA'
      'D.NUMPROCINSS'
      'D.MESCOBRANCA')
    Filtro.Strings = (
      'P.IDPESSOA = D.IDPESSOA'
      'D.IDPESSOA = EL.IDPESSOA(+)'
      'D.FLGTRATADO = 1')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '15'
      '10'
      '7')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    BeforeOpenCds = MontaSelect1BeforeOpenCds
    Left = 749
    Top = 13
  end
  object ppPartTratados: TppBDEPipeline
    DataSource = dsPartTratado
    UserName = 'PartTratados'
    Left = 357
    Top = 403
  end
  object ppdsnPartTratados: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = rpPartTratados
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 504
    Top = 405
  end
  object rpPartTratados: TppReport
    AutoStop = False
    DataPipeline = ppPartTratados
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 429
    Top = 405
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppPartTratados'
    object ppHeaderBand13: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 37042
      mmPrintPosition = 0
      object ppDBImage12: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText185: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 14817
        BandType = 0
      end
      object ppDBText186: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7673
        mmWidth = 25400
        BandType = 0
      end
      object ppDBText187: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 12965
        mmWidth = 20373
        BandType = 0
      end
      object ppDBText188: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 94986
        mmTop = 12435
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText189: TppDBText
        UserName = 'DBText48'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 96044
        mmTop = 17463
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText190: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 17463
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText191: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel182: TppLabel
        UserName = 'Label56'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText192: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel183: TppLabel
        UserName = 'Label65'
        Caption = 'Relação de Participantes Tratados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 102394
        mmTop = 27781
        mmWidth = 69321
        BandType = 0
      end
      object ppLine53: TppLine
        UserName = 'Line9'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 794
        mmLeft = 1588
        mmTop = 33338
        mmWidth = 283898
        BandType = 0
      end
    end
    object ppDetailBand14: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MESCOBRANCA'
        DataPipeline = ppPartTratados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPartTratados'
        mmHeight = 3969
        mmLeft = 794
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'RUBRICA'
        DataPipeline = ppPartTratados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPartTratados'
        mmHeight = 3969
        mmLeft = 64294
        mmTop = 0
        mmWidth = 106363
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'VALORINSS'
        DataPipeline = ppPartTratados
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPartTratados'
        mmHeight = 3969
        mmLeft = 40746
        mmTop = 0
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppPartTratados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPartTratados'
        mmHeight = 3969
        mmLeft = 19844
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = True
        DataField = 'OBSERVACAO'
        DataPipeline = ppPartTratados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Stretch = True
        TextAlignment = taFullJustified
        Transparent = True
        DataPipelineName = 'ppPartTratados'
        mmHeight = 12700
        mmLeft = 174890
        mmTop = 0
        mmWidth = 108479
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand13: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine54: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel185: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Administraçao Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2910
        mmWidth = 280459
        BandType = 8
      end
      object ppSystemVariable25: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 125148
        mmTop = 3175
        mmWidth = 19844
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 263261
        mmTop = 3175
        mmWidth = 17198
        BandType = 8
      end
    end
    object ppSummaryBand12: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 12171
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakType = btCustomField
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 13758
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Style = bsClear
          mmHeight = 11906
          mmLeft = 0
          mmTop = 529
          mmWidth = 283369
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Participante:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 1588
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'NOME'
          DataPipeline = ppPartTratados
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppPartTratados'
          mmHeight = 4233
          mmLeft = 23813
          mmTop = 1588
          mmWidth = 110596
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Matrícula:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 143140
          mmTop = 1588
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          DataField = 'MATRICULA'
          DataPipeline = ppPartTratados
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppPartTratados'
          mmHeight = 4233
          mmLeft = 161396
          mmTop = 1588
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Cobrança'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 6879
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 19844
          mmTop = 6879
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 51858
          mmTop = 6879
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 64558
          mmTop = 6879
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Observação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 174361
          mmTop = 6085
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ValidateWithMask = True
    Left = 352
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 248
    Top = 65530
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 440
  end
  object qryBeneficiario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT D.IDPESSOA, P.NOME, D.MATRICULA, D.IDPLANOPREVPREV,'
      
        '       PL.NOME AS PLANOCONTABIL,NVL(B.NOME,BB.NOME) AS NOMEBENEF' +
        'ICIO,'
      '       D.ESPECIE, PL.IDPLANOPREV, D.NUMPROCINSS,'
      '       PP.NOME AS NOMEPLANO'
      'FROM DETCONCINSS D, PESSOA P, BENEFBFCIARIO BF,'
      '     BENEFICIO B, BENEFICIO BB, PLANPREVCONTABIL PL,'
      '     PLANPREV PP,'
      '     (SELECT DISTINCT NUMPROCINSS, ESPECIE FROM DETCONCINSS D'
      '      WHERE (D.NUMPROCINSS  = :NUMPROC)          AND'
      '           (D.ESPECIE IS NOT NULL)) DETESPECIE,'
      '     (SELECT DISTINCT BPP.IDPLANOPREV, BPP.IDBENEFICIO'
      '      FROM BENEFPLANPREV BPP'
      '      WHERE FLGREFERENCIA = 1) BP'
      'WHERE (D.NUMPROCINSS  = :NUMPROC)          AND'
      '      (D.FLGMANUAL    = 0 )                AND'
      '      (D.IDPESSOA     = P.IDPESSOA(+))     AND'
      '      (D.IDPESSOA     = BF.IDPESSOA(+))    AND'
      '      (BF.IDBENEFICIO = B.IDBENEFICIO(+))  AND'
      '      (BF.IDPLANOPREV = BP.IDPLANOPREV(+)) AND'
      '      (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+)) AND'
      '      (BF.IDBENEFICIO = BP.IDBENEFICIO(+)) AND'
      '      (D.IDPLANOPREV = PL.IDPLANOPREV(+))  AND'
      '      (D.NUMPROCINSS = DETESPECIE.NUMPROCINSS(+)) AND'
      '      (TRIM(DETESPECIE.ESPECIE) = TRIM(BB.CODBENEFICIO(+)))'
      ''
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 689
    Top = 291
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMPROC'
        ParamType = ptUnknown
        Value = '1218161229'
      end
      item
        DataType = ftFloat
        Name = 'NUMPROC'
        ParamType = ptUnknown
      end>
  end
  object qryMantenedora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT NVL(M.CODMANTENEDORA,'#39'14'#39') AS CODMANTENEDORA,'
      '                NVL(M.NOME,'#39'FUNCEF'#39') AS NOMEMANTENEDORA'
      'FROM DETCONCINSS D, MANTENEDORA M'
      'WHERE (D.NUMPROCINSS  = :NUMPROC) AND'
      '      (D.FLGMANUAL = 0)           AND'
      '      (D.CODMANTENEDORA = M.CODMANTENEDORA(+))'
      ''
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 625
    Top = 291
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMPROC'
        ParamType = ptUnknown
        Value = '1218161229'
      end>
  end
end
