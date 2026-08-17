inherited frmEnvioPeriodico: TfrmEnvioPeriodico
  Left = 216
  Top = 117
  Caption = 'Envio de Periódicos'
  ClientHeight = 506
  ClientWidth = 1193
  ParentBiDiMode = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1193
    Height = 400
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1191
      Height = 89
      Align = alTop
      TabOrder = 0
      object Label6: TLabel
        Left = 16
        Top = 47
        Width = 131
        Height = 13
        Caption = 'Opção de Visualização'
      end
      object lblTot_consistente: TLabel
        Left = 304
        Top = 55
        Width = 142
        Height = 13
        Caption = 'Total de consistentes: 0 '
      end
      object lblTotal_incosistente: TLabel
        Left = 304
        Top = 69
        Width = 148
        Height = 13
        Caption = 'Total de inconsistentes: 0'
      end
      object RGFormato: TRadioGroup
        Left = 755
        Top = 5
        Width = 181
        Height = 57
        Caption = ' Formatos: '
        Columns = 2
        Items.Strings = (
          '.ZIP'
          '.PER')
        TabOrder = 1
        OnClick = RGFormatoClick
      end
      object DBCOpcaoVis: TwwDBComboBox
        Left = 17
        Top = 60
        Width = 208
        Height = 21
        ShowButton = True
        Style = csOwnerDrawFixed
        MapList = False
        AllowClearKey = False
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Receber Revista'
          'Não Receber Revista'
          'Todos')
        Sorted = False
        TabOrder = 0
        UnboundDataType = wwDefault
        OnChange = DBCOpcaoVisChange
      end
      object btnSelecionar: TBitBtn
        Left = 240
        Top = 56
        Width = 49
        Height = 25
        Enabled = False
        TabOrder = 2
        OnClick = btnSelecionarClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
          840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FFFF
          FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFF
          FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
          0000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF0000008400FF00
          FF00FF00FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFF
          FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00000084000000
          8400FF00FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FF000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00000084000000
          840000008400FF00FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF00
          0000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF000000
          8400000084000000840000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FF000000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
          FF000000840000000000FFFF0000FF00FF00FFFF0000FF00FF00000000008484
          0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
          FF0000000000FFFF0000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF000000
          0000FFFFFF00FFFFFF00FFFFFF008484840084848400FF00FF00FF00FF00FF00
          FF0000000000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF00FFFF00000000
          0000FFFFFF008484840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000FFFF0000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF000000
          000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF00FFFF00000000
          0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000FF00FF00FFFF0000FF00FF00FFFF000000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 5
        Width = 729
        Height = 39
        Caption = ' Situação do Participante '
        TabOrder = 3
        object ChkAtivo: TCheckBox
          Left = 6
          Top = 16
          Width = 60
          Height = 17
          Caption = 'Ativos'
          TabOrder = 0
          OnClick = ChkAtivoClick
        end
        object ChkAssis: TCheckBox
          Left = 76
          Top = 16
          Width = 80
          Height = 17
          Caption = 'Assistidos'
          TabOrder = 1
          Visible = False
          OnClick = ChkAssisClick
        end
        object ChkCed: TCheckBox
          Left = 311
          Top = 16
          Width = 68
          Height = 17
          Caption = 'Cedidos'
          TabOrder = 2
          OnClick = ChkCedClick
        end
        object ChkFacul: TCheckBox
          Left = 392
          Top = 16
          Width = 92
          Height = 17
          Caption = 'Facultativos'
          TabOrder = 3
          OnClick = ChkFaculClick
        end
        object ChkLicenc: TCheckBox
          Left = 499
          Top = 16
          Width = 90
          Height = 17
          Caption = 'Licenciados'
          TabOrder = 4
          OnClick = ChkLicencClick
        end
        object ChkNaoAssis: TCheckBox
          Left = 603
          Top = 16
          Width = 115
          Height = 17
          Caption = 'Não Associados'
          TabOrder = 5
          OnClick = ChkNaoAssisClick
        end
        object ChkApose: TCheckBox
          Left = 84
          Top = 16
          Width = 101
          Height = 17
          Caption = 'Aposentados'
          TabOrder = 6
          OnClick = ChkAposeClick
        end
        object ChkPensi: TCheckBox
          Left = 204
          Top = 16
          Width = 93
          Height = 17
          Caption = 'Pensionistas'
          TabOrder = 7
          OnClick = ChkPensiClick
        end
      end
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 90
      Width = 1191
      Height = 309
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = 'Envio de Periódicos'
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 1183
          Height = 161
          Align = alTop
          TabOrder = 0
          object wwDBGrid1: TwwDBGrid
            Left = 2
            Top = 15
            Width = 1179
            Height = 144
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = ds
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = True
            OnTitleButtonClick = wwDBGrid1TitleButtonClick
            IndicatorColor = icBlack
          end
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 161
          Width = 1183
          Height = 120
          Align = alClient
          Caption = ' Informações Inconsistentes '
          TabOrder = 1
          object wwDBGrid2: TwwDBGrid
            Left = 2
            Top = 15
            Width = 1089
            Height = 103
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = DSInconc
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = True
            OnTitleButtonClick = wwDBGrid2TitleButtonClick
            OnDblClick = wwDBGrid2DblClick
            IndicatorColor = icBlack
          end
          object pnl1: TPanel
            Left = 1091
            Top = 15
            Width = 90
            Height = 103
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object btnAtualiza: TBitBtn
              Left = 5
              Top = 2
              Width = 82
              Height = 33
              Hint = 
                'Atualizar as informações de inconsistentes para consistentes cas' +
                'o'#13#10'todas as informações estão preenchidas corretamente.'
              Caption = '&Atualizar'
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btnAtualizaClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
                3333333777333777FF33339993707399933333773337F3777FF3399933000339
                9933377333777F3377F3399333707333993337733337333337FF993333333333
                399377F33333F333377F993333303333399377F33337FF333373993333707333
                333377F333777F333333993333101333333377F333777F3FFFFF993333000399
                999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
                99933773FF777F3F777F339993707399999333773F373F77777F333999999999
                3393333777333777337333333999993333333333377777333333}
              NumGlyphs = 2
            end
          end
        end
      end
    end
    object Panel2: TPanel
      Left = 384
      Top = 92
      Width = 524
      Height = 20
      BevelOuter = bvNone
      TabOrder = 2
      object Label5: TLabel
        Left = 146
        Top = 6
        Width = 93
        Height = 13
        Alignment = taRightJustify
        Caption = '          Matricula'
      end
      object wwIncrementalSearch1: TwwIncrementalSearch
        Left = 242
        Top = 0
        Width = 274
        Height = 21
        DataSource = ds
        SearchField = 'matricula'
        TabOrder = 0
      end
    end
    object pnlAguarde: TPanel
      Left = 362
      Top = 203
      Width = 461
      Height = 65
      BevelInner = bvLowered
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 467
    Width = 1193
    object Label1: TLabel [0]
      Left = 5
      Top = 12
      Width = 38
      Height = 13
      Caption = 'Altura:'
    end
    object Label2: TLabel [1]
      Left = 101
      Top = 12
      Width = 48
      Height = 13
      Caption = 'Largura:'
    end
    object Label4: TLabel [2]
      Left = 203
      Top = 12
      Width = 77
      Height = 13
      Caption = 'Comprimento:'
    end
    object Label3: TLabel [3]
      Left = 337
      Top = 12
      Width = 33
      Height = 13
      Caption = 'Peso:'
    end
    object Label7: TLabel [4]
      Left = 427
      Top = 12
      Width = 44
      Height = 13
      Caption = 'Edição:'
    end
    inherited tb97Fundo: TToolbar97
      Left = 775
      DockPos = 775
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 610
      DockPos = 610
      inherited ToolbarSep971: TToolbarSep97
        Left = 79
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 79
        Caption = '&Confirmar'
        ParentBiDiMode = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 82
        Width = 79
        OnClick = bbtnCancelarClick
      end
    end
    object BtnImprimir: TBitBtn
      Left = 527
      Top = 2
      Width = 82
      Height = 33
      Caption = '&Imprimir'
      TabOrder = 2
      OnClick = BtnImprimirClick
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
    object DBEAltura: TwwDBEdit
      Left = 44
      Top = 9
      Width = 50
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      MaxLength = 8
      ParentFont = False
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnChange = DBEAlturaChange
    end
    object DBELargura: TwwDBEdit
      Left = 148
      Top = 9
      Width = 50
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      MaxLength = 8
      ParentFont = False
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnChange = DBELarguraChange
    end
    object DBEComprimento: TwwDBEdit
      Left = 279
      Top = 9
      Width = 50
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      MaxLength = 8
      ParentFont = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnChange = DBEComprimentoChange
    end
    object DBEPeso: TwwDBEdit
      Left = 369
      Top = 9
      Width = 50
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      MaxLength = 8
      ParentFont = False
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnChange = DBEPesoChange
    end
    object DBEEdicao: TwwDBEdit
      Left = 471
      Top = 9
      Width = 50
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnChange = DBEEdicaoChange
    end
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 400
    Width = 1193
    Height = 67
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label8: TLabel
      Left = 7
      Top = 11
      Width = 95
      Height = 13
      Caption = 'Número do Lote:'
    end
    object Label9: TLabel
      Left = 175
      Top = 11
      Width = 118
      Height = 13
      Caption = 'Sequencial Correios:'
    end
    object Label10: TLabel
      Left = 351
      Top = 11
      Width = 103
      Height = 13
      Caption = 'Data de Inserção:'
    end
    object lbl1: TLabel
      Left = 7
      Top = 38
      Width = 107
      Height = 13
      Caption = 'Último Sequencial:'
    end
    object lbl2: TLabel
      Left = 199
      Top = 38
      Width = 93
      Height = 13
      Caption = 'Última Inserção:'
    end
    object DBELote: TwwDBEdit
      Left = 103
      Top = 9
      Width = 50
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      MaxLength = 4
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnChange = DBEEdicaoChange
    end
    object DBESeqCorreio: TwwDBEdit
      Left = 295
      Top = 9
      Width = 50
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      MaxLength = 6
      ParentFont = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnChange = DBEEdicaoChange
    end
    object DBEDUltimoSequencial: TwwDBEdit
      Left = 119
      Top = 36
      Width = 66
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnChange = DBEEdicaoChange
    end
    object DBEDUltimoInsercao: TwwDBEdit
      Left = 295
      Top = 36
      Width = 79
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnChange = DBEEdicaoChange
    end
    object medtDataInsercao: TwwDBDateTimePicker
      Left = 456
      Top = 8
      Width = 113
      Height = 20
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ShowButton = True
      TabOrder = 2
      DisplayFormat = 'DD/MM/YYYY'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 899
    Top = 139
  end
  object Zip1: TZipMaster
    Verbose = False
    Trace = False
    AddCompLevel = 9
    AddOptions = []
    ExtrOptions = []
    Unattended = False
    SFXPath = 'ZipSFX.bin'
    SFXOverWriteMode = OvrConfirm
    SFXCaption = 'Self-extracting Archive'
    KeepFreeOnDisk1 = 0
    VersionInfo = '1.52 M'
    Left = 901
    Top = 186
  end
  object updds: TUpdateSQL
    InsertSQL.Strings = (
      '')
    Left = 755
    Top = 147
  end
  object QRYTMP: TwwQuery
    CachedUpdates = True
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'select *'
      'from( select to_char('#39'  '#39') as UF'
      '                 , 0  as QTD'
      '         from dual)'
      'where trim(uf) is not null'
      'order by UF')
    UpdateObject = UPDTMP
    ValidateWithMask = True
    Left = 677
    Top = 333
    object QRYTMPUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object QRYTMPQTD: TFloatField
      FieldName = 'QTD'
    end
  end
  object UPDTMP: TUpdateSQL
    Left = 677
    Top = 380
  end
  object UPDInconc: TUpdateSQL
    InsertSQL.Strings = (
      '')
    Left = 763
    Top = 331
  end
  object rptDemonstrativo: TppReport
    AutoStop = False
    DataPipeline = ppDemonstrativo
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 438
    Top = 329
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppDemonstrativo'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 38100
      mmPrintPosition = 0
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D616765500C0000FFD8FFE000104A46494600010101006000
          600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
          0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
          3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
          3232323232323232323232323232323232323232323232323232323232323232
          32323232323232323232323232FFC00011080067007203012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7FA
          2A1F31A8F31A8026A2A1F31A97CC34012D151893D4572DF11BC512F853C1D3EA
          36A07DA5DD6084B0C8566CF27F234E3172764075267883EC32287FEE93CD499A
          F8C67D5350B9BC6BB9EFEE64B9277199A56DD9F5CE78FC2BDE3E0BF8C6FF005D
          B2BCD275399EE26B10AF1CF21CB346490031EE411D6BA2AE19C23CD71D8F56A2
          A3327A52798D5CC225A2A1F31A8F31A8026A2A1F31AA4425864D003A8A28A008
          7CB3ED4796D535713E3DF8890F815EC965D364BCFB5062364A136E31D720FAD5
          462E4EC80EC3CB6A4208EA2BC77FE1A12CFF00E85D9FFF000297FF0089A46FDA
          0ACCF5F0ECFF00F816BFFC4D6BF57ABD80F62AE7BC6FE1A1E2BF0ADD6961C473
          1C49039E8245E99FCCD79EFF00C34059FF00D0BB71F85DAFFF00135734EF8EDA
          3DCDE2C57FA5DD5942C71E7798250A7DC0038A6A8D58BBD86793DCF80BC59697
          8D68FA05FBC8AC5434509746F70C38239EB5ED7F09FC0D75E15D3AEAF7524097
          F7BB41881CF9718E80FBE49AF43B3BB82F6CA3BAB599268245DD1C887208F506
          BCEBC49F19342D0EF5ACECE09754990ED90C4C1507D1B07354EAD4AAB9120B9E
          8D462BC73FE17FD9E7FE45DB8FFC0B5FFE26957F682B31FF0032ECFF00F816BF
          FC4D47D5EAF6158F64F2DA8F2DABC77FE1A12D3FE85D9FFF000297FF0089ADDF
          087C5EB7F17788A0D1E3D1E5B669559BCC69D580DA33D00F6A4E8544AED01E8D
          E5B7B53D14A8C1A514B588051451400567EA5A1E97AC18CEA36305D7979D9E6A
          E76E7AE2B428A13B6C0601F04F863FE80765FF007E8521F05786003FF123B2FF
          00BF42B6AE9DD2DA478C65D54951EF5C8E93A8EA126AC8AF249207243A37403F
          A57162B32586AB0A524DF31BD2A12A909493D8BCDE09F0C3A156D0AC883C11E5
          D7CF1F117C3B69E18F17CF61605FECC5165456EA991D33F5AFA97DABE71F8D1F
          F23FBFFD7B47FCABD8C2CA5CF6B98A2F7843C4B7F61F077C51141211F6378E38
          9B3CA2CCDB5B1E98EA2BCE749B21A8EB16562CE516E2658CB01D327922BADF0E
          FF00C925F1AFFD77B2FF00D195CEF85FFE46CD27FEBED3F9D75C55B99AFEB419
          F4BD97C3FF000B69F691DB47A35B3AC631BE45DCCDEE4D5B4F0578608FF901D9
          7FDFB15B4DD4FD6B9DF115E5E5BC90A44EF1C2464B2F193F5AF071B8DFAAD175
          A5776EC5D1A4EACD4132C8F04F860FFCC0EC7FEFD0AB363E17D134CBA5BAB1D2
          ED6DE750409234C119A93429EE2E34B47B9CEFC9193D48F5AD2CD6B46BBAD4D4
          D5ECD1138B849C5F4168A28AB2428A28A002A95FB6A0BB3EC2903673BBCD278F
          4C63F1ABB486B3A90E78F2DDAF42A32E577B5CE7AF352D66C23135C5B5A98B38
          2509E3F5A2EB5D820B3867B6810CD382718C631EB56BC4BFF2067FF797F9D727
          3FFC79D97D1BF9D7CCE618AAF84AB2A709B7EEA6AFAB4EF6D0F4F0F4A9D68A93
          56D7A75D0E912E35C7456F22D06467049FF1AF04F8C0666F1BE6E0209BECC9B8
          274AFA3D54EC5C9EC2BE75F8D1FF0023FBFF00D7B47FCABEAF2EA0E9D4BB9B96
          9D7FE18F3E7514B4514BD0A9E1DFF924BE35FF00AEF65FFA32B9CF0CE7FE12AD
          271D7ED49FCEBA3F0EFF00C925F1A7FD77B2FF00D195CEF8639F15E93FF5F69F
          CEBD55F6BFAE841F52B4BAEEF6C4366464E33BBFC6A2B2D65A5BC7B2D4608D59
          727819191F5CD6E37DE3F5AE42E3FE4659FEA7F957C6660EA613D9CE336EF2B3
          4F5563B30EA3579938A565D0D2835AD42FEE244D3EDA0F293BC99E076E86B46D
          1F576B9517715AAC383931E73593E10E7ED5FF0001FEB5D456995AA988A11AF5
          2A3BB6F4E9BF6B138AE5A7374E3156403039A01CD0466851815EC9C62D145140
          11824507269075A90F4A6062F88FFE40D27FBCB5CB4FFF001E765F46FE75D66B
          D1493692E91A33B6E070A326B9B9AC2ECDA5A0FB34B95073F29E39AF90CF294E
          589938A6FDD5FF00A51EBE065154D5DF57F91D7293B17E82BE77F8D1FF0023FB
          FF00D7B47FCABE885E117E82BC13E2FE8DAADEF8E1A6B4D2EFAE22FB3A0F321B
          6775CFA640AFB7C2594F53C9EA63F877FE492F8D3FEBBD97FE8CAE73C31FF235
          E93FF5F69FCEBB1D0744D5E2F85DE2FB69349D41279A6B43144D6AE19C093276
          8C64E3DAB03C37E1ED722F13E97249A2EA491ADCA1676B4900033D49238AEC52
          5EF6BFD580FAA09F9CFD6B93B839F12CC7DCFF002AEADBEF1E7BD73335A5CB78
          826956090A1270C14E3A57C8679094A9D3E557F791D982694A57EC4DE12EB75F
          45FEB5D39C9AE77C316D3C1F69F3A278F2171B8633D6BA451C56D92C5C705052
          567AFE6C8C634EBC9A13185A54E94ADF7685E95EA1CA2D145140118EB58DE23F
          16E8DE168E07D5EE8C0272563C216C90327A56E6D1E95E31F1FF00FE3D345E3A
          CAFF00CAB4A51539A8B03B6D2BE2578575AD4E0D3EC350696EA73B635F29864F
          D715A1A3F8CB43F115FDD69FA6DD34B736E09917CB65C60ED3C9F7AE63C1D61A
          B8D4EDA4D43C1BA1585B2C0592F2D625F34360639F7E6B91F83B85F88DE228DB
          01B130DA4F7130AD1D38D9B5D067A6D9F8CB43D435D9F45B6BB67D420DDE6446
          3200DBF7B9A9342F19E87E25B99ED349BEF3678065D194A1C648E33D79F4AF28
          F06E25F8E1AE327CE99B9F9872318F5AE2FC3B3EA9A26A3378A74F05A1D3AE55
          6E94778DC9EBEC707F4AD3D845DECFA20B1F4668FE31D175CD52EF4AD3EF1E5B
          CB5566950A30C00C14F3DF922A9EABF11FC2BA3DDBDA5E6AC82743B592305F69
          F438AF24F87BA834BE24F196A7641C3B6957371083D41DC081F5CD6BFC1DF0FE
          87ACF87F5ABAD52D60BA9FCEF2D9A6018C69B73919E87393BA94A8C6376FA582
          C7A8CFE29D120F0F9D70DFC7269A3199E2F9C0C903A0FAD62A7C5EF052AE0EA8
          D9EA7F70FF00E15C7EB569E16B0F84DAEDBF85EFCDDC2258DA7DD2162ADBC0FE
          9DBD2B2FC1D61E269FC3169269FE0EF0D6A16A73B6E6F610D2BF3CE49342A50B
          37AEFE8163D5B54F883E1BD1E0B19AF6F9A34BE816E2022263BA33D0F038A7E8
          3F10BC37E23D4469FA65F19AE4A1709E5B0E075E48AF2AF8C513C7AFF86215B5
          855D6DE3516E8A0479DFF700FEEF6FA57A2F836C3548B539A4D4FC25A2692163
          FDDCF631A87639E991DB1512A7154D480EDD8E5684E94B8A00C573885A28A280
          0AE47C71E02B6F1BC566971792DB7D998B02881B39FAD14538C9C5DD01D4C10F
          910471039D8A1727BE062BCFBC41F0874BD635B9756B4D42EF4D9E6E6516C701
          9BB91C8C67BD14538CE51774C0D1F077C3DD2FC1AB7325B4935C5DDCAEC92E25
          EBB7D00EDCD47E18F873A7F872DB55B633BDEC1A900B2A4A800039E9CFBD1453
          7526EF77B80CF06FC32B1F076A9777F6D7B35C0B881A0F2A64180A581FC7A62B
          1EFF00E0B6953DF5C4FA7EAB7FA74339CB5BC272BCF51D471ED4514FDACEF7B8
          1B03E1A69107832E7C3768F2411DC9569AE701A476041C9FF0ED5811FC0CB544
          0B1F893528D07454E00FC035145355A6BA81B7AAFC2BB4D5BFB0FCED52E41D26
          28E3562A18CBB5B765893D6BBFC5145439396E02D1451520145145007FFFD9}
        mmHeight = 28046
        mmLeft = 3175
        mmTop = 0
        mmWidth = 26194
        BandType = 0
      end
      object ppShape51: TppShape
        UserName = 'Shape17'
        mmHeight = 9790
        mmLeft = 64558
        mmTop = 28310
        mmWidth = 44979
        BandType = 0
      end
      object ppShape54: TppShape
        UserName = 'Shape54'
        mmHeight = 9790
        mmLeft = 109538
        mmTop = 28310
        mmWidth = 35983
        BandType = 0
      end
      object ppShape55: TppShape
        UserName = 'Shape55'
        mmHeight = 9790
        mmLeft = 145786
        mmTop = 28310
        mmWidth = 52388
        BandType = 0
      end
      object ppShape56: TppShape
        UserName = 'Shape56'
        mmHeight = 9790
        mmLeft = 198173
        mmTop = 28310
        mmWidth = 14552
        BandType = 0
      end
      object ppShape57: TppShape
        UserName = 'Shape57'
        mmHeight = 9790
        mmLeft = 212725
        mmTop = 28310
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Endereço'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 66146
        mmTop = 29104
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Bairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 110861
        mmTop = 32015
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label11'
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 147638
        mmTop = 32015
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 201613
        mmTop = 31485
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label102'
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 213784
        mmTop = 31485
        mmWidth = 4233
        BandType = 0
      end
      object ppShape36: TppShape
        UserName = 'Shape35'
        mmHeight = 9790
        mmLeft = 265
        mmTop = 28311
        mmWidth = 17198
        BandType = 0
      end
      object ppShape37: TppShape
        UserName = 'Shape37'
        mmHeight = 9790
        mmLeft = 17727
        mmTop = 28310
        mmWidth = 46567
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Matricula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3387
        mmLeft = 3546
        mmTop = 32014
        mmWidth = 12488
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3387
        mmLeft = 19315
        mmTop = 32014
        mmWidth = 7874
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label61'
        Caption = 'Envio de Periódicos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6646
        mmLeft = 110612
        mmTop = 7408
        mmWidth = 53679
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 9790
        mmLeft = 219869
        mmTop = 28310
        mmWidth = 64558
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Observação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 221457
        mmTop = 31486
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Informações Inconsistente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6646
        mmLeft = 101836
        mmTop = 15346
        mmWidth = 71247
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label101'
        Caption = 'Residencial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 66146
        mmTop = 32544
        mmWidth = 17727
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 3440
        mmLeft = 64558
        mmTop = 0
        mmWidth = 44979
        BandType = 4
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        mmHeight = 3440
        mmLeft = 109802
        mmTop = 0
        mmWidth = 35719
        BandType = 4
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        mmHeight = 3440
        mmLeft = 145521
        mmTop = 0
        mmWidth = 52917
        BandType = 4
      end
      object ppShape16: TppShape
        UserName = 'Shape23'
        mmHeight = 3440
        mmLeft = 265
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppShape17: TppShape
        UserName = 'Shape25'
        mmHeight = 3440
        mmLeft = 17727
        mmTop = 0
        mmWidth = 46567
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'MATRICULA'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 2910
        mmLeft = 1323
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'NOME'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 2910
        mmLeft = 18256
        mmTop = 0
        mmWidth = 44450
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'LOGRADOURO'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 2910
        mmLeft = 64823
        mmTop = 0
        mmWidth = 43921
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'BAIRRO'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 2910
        mmLeft = 110331
        mmTop = 0
        mmWidth = 34396
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CIDADE'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 2910
        mmLeft = 145786
        mmTop = 0
        mmWidth = 50800
        BandType = 4
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 3440
        mmLeft = 198173
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 3440
        mmLeft = 212725
        mmTop = 0
        mmWidth = 7144
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CEP'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 2910
        mmLeft = 197909
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'UF'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 2910
        mmLeft = 213519
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        mmHeight = 3440
        mmLeft = 219869
        mmTop = 0
        mmWidth = 64823
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'OBS'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 2921
        mmLeft = 220398
        mmTop = 0
        mmWidth = 63500
        BandType = 4
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'MATRICULA'
      DataPipeline = ppDemonstrativo
      KeepTogether = True
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDemonstrativo'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDemonstrativo: TppDBPipeline
    DataSource = DSInconc
    UserName = 'Demonstrativo'
    Left = 490
    Top = 345
  end
  object rptDemonstrativo_Consistente: TppReport
    AutoStop = False
    DataPipeline = ppDemonstrativo_Consistente
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 318
    Top = 137
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppDemonstrativo_Consistente'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 38100
      mmPrintPosition = 0
      object ppImage2: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D616765500C0000FFD8FFE000104A46494600010101006000
          600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
          0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
          3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
          3232323232323232323232323232323232323232323232323232323232323232
          32323232323232323232323232FFC00011080067007203012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7FA
          2A1F31A8F31A8026A2A1F31A97CC34012D151893D4572DF11BC512F853C1D3EA
          36A07DA5DD6084B0C8566CF27F234E3172764075267883EC32287FEE93CD499A
          F8C67D5350B9BC6BB9EFEE64B9277199A56DD9F5CE78FC2BDE3E0BF8C6FF005D
          B2BCD275399EE26B10AF1CF21CB346490031EE411D6BA2AE19C23CD71D8F56A2
          A3327A52798D5CC225A2A1F31A8F31A8026A2A1F31AA4425864D003A8A28A008
          7CB3ED4796D535713E3DF8890F815EC965D364BCFB5062364A136E31D720FAD5
          462E4EC80EC3CB6A4208EA2BC77FE1A12CFF00E85D9FFF000297FF0089A46FDA
          0ACCF5F0ECFF00F816BFFC4D6BF57ABD80F62AE7BC6FE1A1E2BF0ADD6961C473
          1C49039E8245E99FCCD79EFF00C34059FF00D0BB71F85DAFFF00135734EF8EDA
          3DCDE2C57FA5DD5942C71E7798250A7DC0038A6A8D58BBD86793DCF80BC59697
          8D68FA05FBC8AC5434509746F70C38239EB5ED7F09FC0D75E15D3AEAF7524097
          F7BB41881CF9718E80FBE49AF43B3BB82F6CA3BAB599268245DD1C887208F506
          BCEBC49F19342D0EF5ACECE09754990ED90C4C1507D1B07354EAD4AAB9120B9E
          8D462BC73FE17FD9E7FE45DB8FFC0B5FFE26957F682B31FF0032ECFF00F816BF
          FC4D47D5EAF6158F64F2DA8F2DABC77FE1A12D3FE85D9FFF000297FF0089ADDF
          087C5EB7F17788A0D1E3D1E5B669559BCC69D580DA33D00F6A4E8544AED01E8D
          E5B7B53D14A8C1A514B588051451400567EA5A1E97AC18CEA36305D7979D9E6A
          E76E7AE2B428A13B6C0601F04F863FE80765FF007E8521F05786003FF123B2FF
          00BF42B6AE9DD2DA478C65D54951EF5C8E93A8EA126AC8AF249207243A37403F
          A57162B32586AB0A524DF31BD2A12A909493D8BCDE09F0C3A156D0AC883C11E5
          D7CF1F117C3B69E18F17CF61605FECC5165456EA991D33F5AFA97DABE71F8D1F
          F23FBFFD7B47FCABD8C2CA5CF6B98A2F7843C4B7F61F077C51141211F6378E38
          9B3CA2CCDB5B1E98EA2BCE749B21A8EB16562CE516E2658CB01D327922BADF0E
          FF00C925F1AFFD77B2FF00D195CEF85FFE46CD27FEBED3F9D75C55B99AFEB419
          F4BD97C3FF000B69F691DB47A35B3AC631BE45DCCDEE4D5B4F0578608FF901D9
          7FDFB15B4DD4FD6B9DF115E5E5BC90A44EF1C2464B2F193F5AF071B8DFAAD175
          A5776EC5D1A4EACD4132C8F04F860FFCC0EC7FEFD0AB363E17D134CBA5BAB1D2
          ED6DE750409234C119A93429EE2E34B47B9CEFC9193D48F5AD2CD6B46BBAD4D4
          D5ECD1138B849C5F4168A28AB2428A28A002A95FB6A0BB3EC2903673BBCD278F
          4C63F1ABB486B3A90E78F2DDAF42A32E577B5CE7AF352D66C23135C5B5A98B38
          2509E3F5A2EB5D820B3867B6810CD382718C631EB56BC4BFF2067FF797F9D727
          3FFC79D97D1BF9D7CCE618AAF84AB2A709B7EEA6AFAB4EF6D0F4F0F4A9D68A93
          56D7A75D0E912E35C7456F22D06467049FF1AF04F8C0666F1BE6E0209BECC9B8
          274AFA3D54EC5C9EC2BE75F8D1FF0023FBFF00D7B47FCABEAF2EA0E9D4BB9B96
          9D7FE18F3E7514B4514BD0A9E1DFF924BE35FF00AEF65FFA32B9CF0CE7FE12AD
          271D7ED49FCEBA3F0EFF00C925F1A7FD77B2FF00D195CEF8639F15E93FF5F69F
          CEBD55F6BFAE841F52B4BAEEF6C4366464E33BBFC6A2B2D65A5BC7B2D4608D59
          727819191F5CD6E37DE3F5AE42E3FE4659FEA7F957C6660EA613D9CE336EF2B3
          4F5563B30EA3579938A565D0D2835AD42FEE244D3EDA0F293BC99E076E86B46D
          1F576B9517715AAC383931E73593E10E7ED5FF0001FEB5D456995AA988A11AF5
          2A3BB6F4E9BF6B138AE5A7374E3156403039A01CD0466851815EC9C62D145140
          11824507269075A90F4A6062F88FFE40D27FBCB5CB4FFF001E765F46FE75D66B
          D1493692E91A33B6E070A326B9B9AC2ECDA5A0FB34B95073F29E39AF90CF294E
          589938A6FDD5FF00A51EBE065154D5DF57F91D7293B17E82BE77F8D1FF0023FB
          FF00D7B47FCABE885E117E82BC13E2FE8DAADEF8E1A6B4D2EFAE22FB3A0F321B
          6775CFA640AFB7C2594F53C9EA63F877FE492F8D3FEBBD97FE8CAE73C31FF235
          E93FF5F69FCEBB1D0744D5E2F85DE2FB69349D41279A6B43144D6AE19C093276
          8C64E3DAB03C37E1ED722F13E97249A2EA491ADCA1676B4900033D49238AEC52
          5EF6BFD580FAA09F9CFD6B93B839F12CC7DCFF002AEADBEF1E7BD73335A5CB78
          826956090A1270C14E3A57C8679094A9D3E557F791D982694A57EC4DE12EB75F
          45FEB5D39C9AE77C316D3C1F69F3A278F2171B8633D6BA451C56D92C5C705052
          567AFE6C8C634EBC9A13185A54E94ADF7685E95EA1CA2D145140118EB58DE23F
          16E8DE168E07D5EE8C0272563C216C90327A56E6D1E95E31F1FF00FE3D345E3A
          CAFF00CAB4A51539A8B03B6D2BE2578575AD4E0D3EC350696EA73B635F29864F
          D715A1A3F8CB43F115FDD69FA6DD34B736E09917CB65C60ED3C9F7AE63C1D61A
          B8D4EDA4D43C1BA1585B2C0592F2D625F34360639F7E6B91F83B85F88DE228DB
          01B130DA4F7130AD1D38D9B5D067A6D9F8CB43D435D9F45B6BB67D420DDE6446
          3200DBF7B9A9342F19E87E25B99ED349BEF3678065D194A1C648E33D79F4AF28
          F06E25F8E1AE327CE99B9F9872318F5AE2FC3B3EA9A26A3378A74F05A1D3AE55
          6E94778DC9EBEC707F4AD3D845DECFA20B1F4668FE31D175CD52EF4AD3EF1E5B
          CB5566950A30C00C14F3DF922A9EABF11FC2BA3DDBDA5E6AC82743B592305F69
          F438AF24F87BA834BE24F196A7641C3B6957371083D41DC081F5CD6BFC1DF0FE
          87ACF87F5ABAD52D60BA9FCEF2D9A6018C69B73919E87393BA94A8C6376FA582
          C7A8CFE29D120F0F9D70DFC7269A3199E2F9C0C903A0FAD62A7C5EF052AE0EA8
          D9EA7F70FF00E15C7EB569E16B0F84DAEDBF85EFCDDC2258DA7DD2162ADBC0FE
          9DBD2B2FC1D61E269FC3169269FE0EF0D6A16A73B6E6F610D2BF3CE49342A50B
          37AEFE8163D5B54F883E1BD1E0B19AF6F9A34BE816E2022263BA33D0F038A7E8
          3F10BC37E23D4469FA65F19AE4A1709E5B0E075E48AF2AF8C513C7AFF86215B5
          855D6DE3516E8A0479DFF700FEEF6FA57A2F836C3548B539A4D4FC25A2692163
          FDDCF631A87639E991DB1512A7154D480EDD8E5684E94B8A00C573885A28A280
          0AE47C71E02B6F1BC566971792DB7D998B02881B39FAD14538C9C5DD01D4C10F
          910471039D8A1727BE062BCFBC41F0874BD635B9756B4D42EF4D9E6E6516C701
          9BB91C8C67BD14538CE51774C0D1F077C3DD2FC1AB7325B4935C5DDCAEC92E25
          EBB7D00EDCD47E18F873A7F872DB55B633BDEC1A900B2A4A800039E9CFBD1453
          7526EF77B80CF06FC32B1F076A9777F6D7B35C0B881A0F2A64180A581FC7A62B
          1EFF00E0B6953DF5C4FA7EAB7FA74339CB5BC272BCF51D471ED4514FDACEF7B8
          1B03E1A69107832E7C3768F2411DC9569AE701A476041C9FF0ED5811FC0CB544
          0B1F893528D07454E00FC035145355A6BA81B7AAFC2BB4D5BFB0FCED52E41D26
          28E3562A18CBB5B765893D6BBFC5145439396E02D1451520145145007FFFD9}
        mmHeight = 28046
        mmLeft = 3175
        mmTop = 0
        mmWidth = 26194
        BandType = 0
      end
      object ppShape6: TppShape
        UserName = 'Shape17'
        mmHeight = 9790
        mmLeft = 64558
        mmTop = 28310
        mmWidth = 44979
        BandType = 0
      end
      object ppShape7: TppShape
        UserName = 'Shape54'
        mmHeight = 9790
        mmLeft = 109538
        mmTop = 28310
        mmWidth = 35983
        BandType = 0
      end
      object ppShape10: TppShape
        UserName = 'Shape55'
        mmHeight = 9790
        mmLeft = 145786
        mmTop = 28310
        mmWidth = 52388
        BandType = 0
      end
      object ppShape11: TppShape
        UserName = 'Shape56'
        mmHeight = 9790
        mmLeft = 198173
        mmTop = 28310
        mmWidth = 14552
        BandType = 0
      end
      object ppShape12: TppShape
        UserName = 'Shape57'
        mmHeight = 9790
        mmLeft = 212725
        mmTop = 28310
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label10'
        Caption = 'Endereço'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 66146
        mmTop = 29104
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label15'
        Caption = 'Bairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 110861
        mmTop = 32015
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label11'
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 147638
        mmTop = 32015
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label19'
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 201613
        mmTop = 31485
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label102'
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 213784
        mmTop = 31485
        mmWidth = 4233
        BandType = 0
      end
      object ppShape13: TppShape
        UserName = 'Shape35'
        mmHeight = 9790
        mmLeft = 265
        mmTop = 28311
        mmWidth = 17198
        BandType = 0
      end
      object ppShape14: TppShape
        UserName = 'Shape37'
        mmHeight = 9790
        mmLeft = 17727
        mmTop = 28310
        mmWidth = 46567
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label29'
        Caption = 'Matricula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3387
        mmLeft = 3546
        mmTop = 32014
        mmWidth = 12488
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label30'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3387
        mmLeft = 19315
        mmTop = 32014
        mmWidth = 7874
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label61'
        Caption = 'Envio de Periódicos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6646
        mmLeft = 110612
        mmTop = 7408
        mmWidth = 53679
        BandType = 0
      end
      object ppShape15: TppShape
        UserName = 'Shape3'
        mmHeight = 9790
        mmLeft = 219869
        mmTop = 28310
        mmWidth = 64558
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label1'
        Caption = 'Observação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 221457
        mmTop = 31486
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label2'
        Caption = 'Informações Consistente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6615
        mmLeft = 103989
        mmTop = 15346
        mmWidth = 66940
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label101'
        Caption = 'Residencial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 66146
        mmTop = 32544
        mmWidth = 17727
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppShape18: TppShape
        UserName = 'Shape4'
        mmHeight = 3440
        mmLeft = 64558
        mmTop = 0
        mmWidth = 44979
        BandType = 4
      end
      object ppShape19: TppShape
        UserName = 'Shape8'
        mmHeight = 3440
        mmLeft = 109802
        mmTop = 0
        mmWidth = 35719
        BandType = 4
      end
      object ppShape20: TppShape
        UserName = 'Shape9'
        mmHeight = 3440
        mmLeft = 145521
        mmTop = 0
        mmWidth = 52917
        BandType = 4
      end
      object ppShape21: TppShape
        UserName = 'Shape23'
        mmHeight = 3440
        mmLeft = 265
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppShape22: TppShape
        UserName = 'Shape25'
        mmHeight = 3440
        mmLeft = 17727
        mmTop = 0
        mmWidth = 46567
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText7'
        DataField = 'MATRICULA'
        DataPipeline = ppDemonstrativo_Consistente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDemonstrativo_Consistente'
        mmHeight = 2910
        mmLeft = 1323
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText8'
        DataField = 'NOME'
        DataPipeline = ppDemonstrativo_Consistente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo_Consistente'
        mmHeight = 2910
        mmLeft = 18256
        mmTop = 0
        mmWidth = 44450
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText1'
        DataField = 'LOGRADOURO'
        DataPipeline = ppDemonstrativo_Consistente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo_Consistente'
        mmHeight = 2910
        mmLeft = 64823
        mmTop = 0
        mmWidth = 43921
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText2'
        DataField = 'BAIRRO'
        DataPipeline = ppDemonstrativo_Consistente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo_Consistente'
        mmHeight = 2910
        mmLeft = 110331
        mmTop = 0
        mmWidth = 34396
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText3'
        DataField = 'CIDADE'
        DataPipeline = ppDemonstrativo_Consistente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDemonstrativo_Consistente'
        mmHeight = 2910
        mmLeft = 145786
        mmTop = 0
        mmWidth = 50800
        BandType = 4
      end
      object ppShape23: TppShape
        UserName = 'Shape1'
        mmHeight = 3440
        mmLeft = 198173
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object ppShape24: TppShape
        UserName = 'Shape2'
        mmHeight = 3440
        mmLeft = 212725
        mmTop = 0
        mmWidth = 7144
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText4'
        DataField = 'CEP'
        DataPipeline = ppDemonstrativo_Consistente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDemonstrativo_Consistente'
        mmHeight = 2910
        mmLeft = 197909
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText5'
        DataField = 'UF'
        DataPipeline = ppDemonstrativo_Consistente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDemonstrativo_Consistente'
        mmHeight = 2910
        mmLeft = 213519
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object ppShape25: TppShape
        UserName = 'Shape5'
        mmHeight = 3440
        mmLeft = 219869
        mmTop = 0
        mmWidth = 64823
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText6'
        DataField = 'OBS'
        DataPipeline = ppDemonstrativo_Consistente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo_Consistente'
        mmHeight = 2921
        mmLeft = 220398
        mmTop = 0
        mmWidth = 63500
        BandType = 4
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'MATRICULA'
      DataPipeline = ppDemonstrativo_Consistente
      KeepTogether = True
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDemonstrativo_Consistente'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object ppDemonstrativo_Consistente: TppDBPipeline
    DataSource = ds
    UserName = 'Demonstrativo1'
    Left = 322
    Top = 185
  end
  object Sp_Atualiza_Endereco: TStoredProc
    DatabaseName = 'BaseDados'
    StoredProcName = 'CM.PR_CADPREV_ENVPER_ATUALIZAEND'
    Left = 568
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDENDERECO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PLOGRADOURO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODESTADO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCOMPLEMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PBAIRRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCEP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PTIPOENDERECO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PRESULTADO'
        ParamType = ptOutput
      end>
  end
  object qryDS: TwwQuery
    CachedUpdates = True
    BeforePost = qryDSBeforePost
    OnNewRecord = qryDSNewRecord
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    SessionName = 'Default'
    UpdateObject = updds
    ControlType.Strings = (
      'VALOR;CheckBox;S;N')
    ValidateWithMask = True
    Left = 72
    Top = 163
    object strngfldDSVALOR: TStringField
      DisplayLabel = 'Receber~ Revista'
      DisplayWidth = 8
      FieldName = 'VALOR'
      Size = 30
    end
    object strngfldDSMATRICULA: TStringField
      DisplayLabel = 'Matricula'
      DisplayWidth = 10
      FieldName = 'MATRICULA'
      Size = 13
    end
    object strngfldDSNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 25
      FieldName = 'NOME'
      Size = 60
    end
    object strngfldDSLOGRADOURO: TStringField
      DisplayLabel = 'Endereço~Residencial'
      DisplayWidth = 24
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object strngfldDSBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 15
      FieldName = 'BAIRRO'
    end
    object strngfldDSCIDADE: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 25
      FieldName = 'CIDADE'
    end
    object strngfldDSUF: TStringField
      DisplayLabel = 'Estado '
      DisplayWidth = 6
      FieldName = 'UF'
      FixedChar = True
      Size = 3
    end
    object strngfldDSCEP: TStringField
      DisplayWidth = 8
      FieldName = 'CEP'
      Size = 8
    end
    object qryDSCOD_LOTACAO: TStringField
      DisplayLabel = 'Código Unid Lotação'
      FieldName = 'COD_LOTACAO'
    end
    object strngfldDSNOME_LOTACAO: TStringField
      DisplayLabel = 'Nome Unid~Lotação'
      DisplayWidth = 30
      FieldName = 'NOME_LOTACAO'
      Size = 60
    end
    object strngfldDSEND_LOTACAO: TStringField
      DisplayLabel = 'Endereço Unid~Lotação'
      DisplayWidth = 30
      FieldName = 'END_LOTACAO'
      Size = 60
    end
    object strngfldDSCIDADE_LOTACAO: TStringField
      DisplayLabel = 'Cidade Unid~Lotação'
      DisplayWidth = 25
      FieldName = 'CIDADE_LOTACAO'
      Size = 50
    end
    object strngfldDSUF_LOTACAO: TStringField
      DisplayLabel = 'Estado Unid~Lotação'
      DisplayWidth = 9
      FieldName = 'UF_LOTACAO'
      Size = 3
    end
    object strngfldDSNUMERO: TStringField
      FieldName = 'NUMERO'
      Visible = False
      Size = 8
    end
    object strngfldDSCOMERCIAL: TStringField
      FieldName = 'COMERCIAL'
      Visible = False
      Size = 1
    end
    object strngfldDSCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Visible = False
    end
    object strngfldDSNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object qryDSIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
  end
  object ds: TwwDataSource
    DataSet = qryDS
    Left = 147
    Top = 179
  end
  object qrydsaux: TwwQuery
    CachedUpdates = True
    OnNewRecord = qryDSNewRecord
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT MATRICULA,'
      '       NOME,'
      '       LOGRADOURO,'
      '       NUMERO,'
      '       COMERCIAL,'
      '       COMPLEMENTO,'
      '       BAIRRO,'
      '       CEP,'
      '       CIDADE,'
      '       UF,'
      '       NUMDOCUMENTO,'
      '       IDPESSOA,'
      '       VALOR,'
      '       COD_LOTACAO,'
      '       NOME_LOTACAO,'
      '       END_LOTACAO,'
      '       CIDADE_LOTACAO,'
      '       UF_LOTACAO'
      'FROM ('
      '-- FACULTATIVOS'
      '      SELECT  EL.MATRICULA,'
      '              EP.Idendereco,'
      '              P.NOME,'
      '              EP.LOGRADOURO,'
      '              DECODE (EP.NUMERO,NULL,'#39'S/N'#39',EP.NUMERO) AS NUMERO,'
      '              DECODE (EP.TIPOENDERECO,'#39'R'#39','#39'N'#39','#39'S'#39') AS COMERCIAL,'
      '              EP.COMPLEMENTO,'
      '              EP.BAIRRO,'
      '              EP.CEP,'
      '              /*SIG 33967 - início */'
      '              --UPPER(EP.CIDADE) CIDADE,               '
      '              --EP.CODESTADO UF,'
      '              UPPER(NVL(C.NOME,EP.CIDADE)) CIDADE,   '
      '              NVL(C.UF,EP.CODESTADO) UF,'
      '              /*SIG 33967 - Término */'
      '              P.NUMDOCUMENTO,'
      '              P.IDPESSOA,'
      '              P.VALOR,'
      '              '#39#39' COD_LOTACAO,'
      '              '#39#39' NOME_LOTACAO,'
      '              '#39#39' END_LOTACAO,'
      '              '#39#39' CIDADE_LOTACAO,'
      '              '#39#39' UF_LOTACAO'
      
        '      FROM     (SELECT PES.*,DECODE(:TIPO,'#39'T'#39','#39'S'#39',NVL((SELECT VA' +
        'LOR'
      
        '                                                      FROM   PES' +
        'SOAPARAM PR'
      
        '                                                     WHERE  SYSD' +
        'ATE BETWEEN PR.DATAINICIO AND NVL(PR.DATAFIM,SYSDATE)'
      
        '                                                       AND  PR.I' +
        'DPARAM  = 129'
      
        '                                                       AND  PR.I' +
        'DPESSOA = PES.IDPESSOA'
      
        '                                                       AND  ROWN' +
        'UM      = 1),'#39'N'#39')) VALOR'
      '               FROM PESSOA PES)P,'
      '              ELEGPATRO EL,'
      '              PARTPREVPLAN PP,'
      '              PESSOAFISICA PF,'
      '              ENDPESS EP,'
      '              CIDADES C -- SIG 33967'
      ''
      '      WHERE   EP.LOGRADOURO is not null and              '
      '              EP.CEP is not null and'
      '              --EP.CIDADE is not null  and        -- SIG 33967  '
      
        '              NVL(C.NOME,EP.CIDADE) is not null AND  -- SIG 3396' +
        '7 '
      
        '              EP.IDCIDADES = C.IDCIDADES(+) AND   -- SIG 33967  ' +
        ' '
      '              P.IDPESSOA = EL.IDPESSOA AND'
      '              P.IDPESSOA = PP.IDPESSOA AND'
      '              P.IDPESSOA   = PF.IDPESSOA AND'
      '              P.IDPESSOA   = EP.IDPESSOA (+) AND'
      '              PP.DATACANCELAMENTO IS NULL AND'
      '              PF.DATAMORTE IS NULL AND'
      '              PP.IDPESSJUR = 91008 AND'
      '              PP.IDSITPART IN (2,7,3,6,41,58,63,65) AND'
      '              P.TIPO = '#39'F'#39' AND'
      
        '              EP.IDENDERECO = NVL(P.IDENDCORRESP,(SELECT  MAX(EN' +
        '.IDENDERECO)'
      
        '                                                    FROM  ENDPES' +
        'S EN'
      
        '                                                    WHERE EN.IDP' +
        'ESSOA(+) = EP.IDPESSOA)) AND'
      '              PP.IDPLANOPREV = (SELECT MAX(PART.IDPLANOPREV)'
      '                                  FROM PARTPREVPLAN PART'
      '                                 WHERE PART.IDSITPLANOPREV <> 3'
      
        '                                   AND PART.IDPESSOA = EL.IDPESS' +
        'OA'
      
        '                                   AND PART.IDPESSJUR = EL.IDPES' +
        'SJUR) AND'
      '              NOT EXISTS (SELECT 1'
      '                          FROM  BENEFBFCIARIO BF'
      
        '                          WHERE BF.IDPESSOA         = EL.IDPESSO' +
        'A'
      
        '                          AND   BF.IDTITULAR        = EL.IDPESSO' +
        'A'
      '                          AND   BF.FONTEPAGADORA    = 1'
      '                          AND   BF.IDTPPAGTOBENEFIC = 1'
      '                          AND   BF.IDSITBENEFICIO   = 1)'
      
        '           AND (NVL(P.VALOR,'#39'N'#39') = :TIPO OR :TIPO = '#39'T'#39' )       ' +
        '                   '
      '                          AND'
      ''
      '             :FACULT = '#39'S'#39
      ''
      ''
      '      UNION'
      '      -- LICENCIADOS'
      '      SELECT  EL.MATRICULA,'
      '              EP.Idendereco,'
      '              P.NOME,'
      '              EP.LOGRADOURO,'
      '              DECODE (EP.NUMERO,NULL,'#39'S/N'#39',EP.NUMERO) AS NUMERO,'
      '              DECODE (EP.TIPOENDERECO,'#39'R'#39','#39'N'#39','#39'S'#39') AS COMERCIAL,'
      '              EP.COMPLEMENTO,'
      '              EP.BAIRRO,'
      '              EP.CEP,'
      '              /*SIG 33967 - início */'
      '              --UPPER(EP.CIDADE) CIDADE,               '
      '              --EP.CODESTADO UF,'
      '              UPPER(NVL(C.NOME,EP.CIDADE)) CIDADE,   '
      '              NVL(C.UF,EP.CODESTADO) UF,'
      '              /*SIG 33967 - Término */'
      '              P.NUMDOCUMENTO,'
      '              P.IDPESSOA,'
      '              P.VALOR,'
      '              '#39#39' COD_LOTACAO,'
      '              '#39#39' NOME_LOTACAO,'
      '              '#39#39' END_LOTACAO,'
      '              '#39#39' CIDADE_LOTACAO,'
      '              '#39#39' UF_LOTACAO'
      '      FROM'
      '            (SELECT PES.*,DECODE(:TIPO,'#39'T'#39','#39'S'#39',NVL((SELECT VALOR'
      
        '                                                      FROM   PES' +
        'SOAPARAM PR'
      
        '                                                     WHERE  SYSD' +
        'ATE BETWEEN PR.DATAINICIO AND NVL(PR.DATAFIM,SYSDATE)'
      
        '                                                       AND  PR.I' +
        'DPARAM  = 129'
      
        '                                                       AND  PR.I' +
        'DPESSOA = PES.IDPESSOA'
      
        '                                                       AND  ROWN' +
        'UM      = 1),'#39'N'#39')) VALOR'
      '               FROM PESSOA PES)P,'
      '           ELEGPATRO EL,'
      '           SITFUNC SF,'
      '           PARTPREVPLAN PP,'
      '           PESSOAFISICA PF,'
      '           ENDPESS EP,'
      '           CIDADES C -- SIG 33967'
      '           '
      '      WHERE   EP.LOGRADOURO is not null and             '
      '              EP.CEP is not null and'
      '              --EP.CIDADE is not null and        -- SIG 33967  '
      '              NVL(C.NOME,EP.CIDADE)is not null AND -- SIG 33967 '
      '              EP.IDCIDADES = C.IDCIDADES(+) AND   -- SIG 33967'
      '           P.IDPESSOA = EL.IDPESSOA AND'
      '           P.IDPESSOA = PP.IDPESSOA AND'
      '           P.IDPESSOA = PF.IDPESSOA AND'
      '           P.IDPESSOA = EP.IDPESSOA (+) AND'
      '           EL.IDSITFUNC = SF.IDSITFUNC AND'
      '           PP.DATACANCELAMENTO IS NULL AND'
      '           PF.DATAMORTE IS NULL AND'
      '           PP.DATACANCELAMENTO IS NULL AND'
      '           PP.IDSITPLANOPREV = 1 AND'
      '           PP.FLGDESATIVADO = 0 AND'
      
        '           EL.IDSITFUNC IN (3,5,6,22,40,41,42,43,44,45,47,48,49,' +
        '51,52,54,55,65,66,67,69,70,73) AND'
      '           PP.IDPESSJUR = 91008 AND'
      '           P.TIPO = '#39'F'#39' AND'
      
        '           EP.IDENDERECO = NVL(P.IDENDCORRESP,(SELECT MAX(EN.IDE' +
        'NDERECO) FROM ENDPESS EN WHERE'
      
        '                                                  EN.IDPESSOA(+)' +
        ' = EL.IDPESSOA)) AND'
      
        '           PP.IDPLANOPREV = (SELECT MAX(PART.IDPLANOPREV) FROM P' +
        'ARTPREVPLAN PART'
      
        '                                         WHERE PART.IDSITPLANOPR' +
        'EV <> 3'
      
        '                                         AND   PART.IDPESSOA = E' +
        'L.IDPESSOA'
      
        '                                         AND   PART.IDPESSJUR = ' +
        'EL.IDPESSJUR) AND'
      '            NOT EXISTS (SELECT 1'
      '                        FROM BENEFBFCIARIO BF'
      '                        WHERE BF.IDPESSOA = EL.IDPESSOA'
      '                        AND   BF.IDTITULAR = EL.IDPESSOA'
      '                        AND   BF.FONTEPAGADORA = 1'
      '                        AND   BF.IDTPPAGTOBENEFIC = 1'
      '                        AND   BF.IDSITBENEFICIO = 1) '
      
        'AND (NVL(P.VALOR,'#39'N'#39') = :TIPO OR :TIPO = '#39'T'#39' )                  ' +
        '                                '
      '                        AND'
      '           :LICENC = '#39'S'#39
      ''
      '      UNION'
      ''
      '      -- RELATÓRIO DE ASSISTIDOS'
      ''
      '      SELECT  EL.MATRICULA,'
      '              EP.Idendereco,'
      '              P.NOME,'
      '              EP.LOGRADOURO,'
      '              DECODE (EP.NUMERO,NULL,'#39'S/N'#39',EP.NUMERO) AS NUMERO,'
      '              DECODE (EP.TIPOENDERECO,'#39'R'#39','#39'N'#39','#39'S'#39') AS COMERCIAL,'
      '              EP.COMPLEMENTO,'
      '              EP.BAIRRO,'
      '              EP.CEP,'
      '              /*SIG 33967 - início */'
      '              --UPPER(EP.CIDADE) CIDADE,               '
      '              --EP.CODESTADO UF,'
      '              UPPER(NVL(C.NOME,EP.CIDADE)) CIDADE,   '
      '              NVL(C.UF,EP.CODESTADO) UF,'
      '              /*SIG 33967 - Término */'
      '              P.NUMDOCUMENTO,'
      '              P.IDPESSOA,'
      '              P.VALOR,'
      '              '#39#39' COD_LOTACAO,'
      '              '#39#39' NOME_LOTACAO,'
      '              '#39#39' END_LOTACAO,'
      '              '#39#39' CIDADE_LOTACAO,'
      '              '#39#39' UF_LOTACAO'
      '       FROM   ELEGPATRO EL,'
      
        '               (SELECT PES.*,DECODE(:TIPO,'#39'T'#39','#39'S'#39',NVL((SELECT VA' +
        'LOR'
      
        '                                                      FROM   PES' +
        'SOAPARAM PR'
      
        '                                                     WHERE  SYSD' +
        'ATE BETWEEN PR.DATAINICIO AND NVL(PR.DATAFIM,SYSDATE)'
      
        '                                                       AND  PR.I' +
        'DPARAM  = 129'
      
        '                                                       AND  PR.I' +
        'DPESSOA = PES.IDPESSOA'
      
        '                                                       AND  ROWN' +
        'UM      = 1),'#39'N'#39')) VALOR'
      '               FROM PESSOA PES)P,'
      '              DEPENTIT DP,'
      '              BENEFBFCIARIO BF,'
      '              PESSOAFISICA PF,'
      '              ENDPESS EP,'
      '              CIDADES C -- SIG 33967'
      '              '
      '       WHERE  EP.LOGRADOURO is not null  and '
      '              EP.CEP is not null and '
      '              --EP.CIDADE is not null  and        -- SIG 33967  '
      '              NVL(C.NOME,EP.CIDADE)is not null AND -- SIG 33967 '
      '              EP.IDCIDADES = C.IDCIDADES(+) AND   -- SIG 33967 '
      '              EL.IDPESSOA = P.IDPESSOA       AND'
      '              DP.IDPESSOA = P.IDPESSOA       AND'
      '              DP.IDPESSOA = BF.IDPESSOA      AND'
      '              DP.IDPESSOA = PF.IDPESSOA      AND'
      '              DP.IDPESSOA = EP.IDPESSOA   (+)AND              '
      '              BF.IDSITBENEFICIO   = 1 AND'
      '              BF.IDTPPAGTOBENEFIC = 1 AND'
      '              BF.FONTEPAGADORA    = 1 AND'
      
        '              EP.IDENDERECO       = NVL(P.IDENDCORRESP,(SELECT M' +
        'AX(EN.IDENDERECO)'
      
        '                                                        FROM   E' +
        'NDPESS EN'
      
        '                                                        WHERE  E' +
        'N.IDPESSOA(+) = DP.IDPESSOA))'
      
        'AND (NVL(P.VALOR,'#39'N'#39') = :TIPO OR :TIPO = '#39'T'#39' )                  ' +
        '                                                                '
      '                                                         AND'
      '             :ASSIS = '#39'S'#39
      ''
      '     GROUP BY EL.MATRICULA,'
      '              EP.Idendereco,'
      '              P.NOME,'
      '              EP.LOGRADOURO,'
      '              EP.NUMERO,'
      '              EP.TIPOENDERECO,'
      '              EP.COMPLEMENTO,'
      '              EP.BAIRRO,'
      '              EP.CEP,'
      '              /*SIG 33967 - início */'
      '              --EP.CIDADE,               '
      '              --EP.CODESTADO,'
      '              NVL(C.NOME,EP.CIDADE),   '
      '              NVL(C.UF,EP.CODESTADO),'
      '              /*SIG 33967 - Término */'
      '              EP.CODESTADO,'
      '              P.NUMDOCUMENTO,'
      '              P.IDPESSOA,'
      '              P.VALOR'
      ''
      '   UNION'
      ''
      '      -- RELATÓRIO DE CEDIDOS'
      ''
      '      SELECT'
      '              EL.MATRICULA,'
      '              EP.Idendereco,'
      '              P.NOME,'
      '              EP.LOGRADOURO,'
      '              DECODE (EP.NUMERO,NULL,'#39'S/N'#39',EP.NUMERO) AS NUMERO,'
      
        '              DECODE (EP.TIPOENDERECO,'#39'R'#39','#39'N'#39','#39'S'#39')    AS COMERCI' +
        'AL,'
      '              EP.COMPLEMENTO,'
      '              EP.BAIRRO,'
      '              EP.CEP,'
      '              /*SIG 33967 - início */'
      '              --UPPER(EP.CIDADE) CIDADE,               '
      '              --EP.CODESTADO UF,'
      '              UPPER(NVL(C.NOME,EP.CIDADE)) CIDADE,   '
      '              NVL(C.UF,EP.CODESTADO) UF,'
      '              /*SIG 33967 - Término */'
      '              P.NUMDOCUMENTO,'
      '              P.IDPESSOA,'
      '              P.VALOR,'
      '              '#39#39' COD_LOTACAO,'
      '              '#39#39' NOME_LOTACAO,'
      '              '#39#39' END_LOTACAO,'
      '              '#39#39' CIDADE_LOTACAO,'
      '              '#39#39' UF_LOTACAO'
      ''
      '      FROM'
      
        '                (SELECT PES.*,DECODE(:TIPO,'#39'T'#39','#39'S'#39',NVL((SELECT V' +
        'ALOR'
      
        '                                                      FROM   PES' +
        'SOAPARAM PR'
      
        '                                                     WHERE  SYSD' +
        'ATE BETWEEN PR.DATAINICIO AND NVL(PR.DATAFIM,SYSDATE)'
      
        '                                                       AND  PR.I' +
        'DPARAM  = 129'
      
        '                                                       AND  PR.I' +
        'DPESSOA = PES.IDPESSOA'
      
        '                                                       AND  ROWN' +
        'UM      = 1),'#39'N'#39')) VALOR'
      '               FROM PESSOA PES)P,'
      '               ELEGPATRO EL,'
      '               SITFUNC SF,'
      '               PARTPREVPLAN PP,'
      '               PESSOAFISICA PF,'
      '               ENDPESS EP,'
      '               CIDADES C -- SIG 33967'
      ''
      '      WHERE   EP.LOGRADOURO is not null  and '
      '              EP.CEP is not null and '
      '              --EP.CIDADE is not null  and        -- SIG 33967  '
      '              NVL(C.NOME,EP.CIDADE)is not null AND -- SIG 33967 '
      '              EP.IDCIDADES = C.IDCIDADES(+) AND   -- SIG 33967 '
      '               P.IDPESSOA = EL.IDPESSOA AND'
      '               P.IDPESSOA = PP.IDPESSOA AND'
      '               P.IDPESSOA = PF.IDPESSOA AND'
      '               P.IDPESSOA = EP.IDPESSOA (+) AND'
      '               EL.IDSITFUNC = SF.IDSITFUNC AND'
      '               PP.DATACANCELAMENTO IS NULL AND'
      '               PF.DATAMORTE IS NULL AND'
      '               PP.DATACANCELAMENTO IS NULL AND'
      '               PP.IDSITPLANOPREV = 1 AND'
      '               PP.FLGDESATIVADO = 0 AND'
      '               PP.IDPESSJUR = 91008 AND'
      '               P.TIPO = '#39'F'#39' AND'
      
        '               EP.IDENDERECO = NVL(P.IDENDCORRESP,(SELECT MAX(EN' +
        '.IDENDERECO) FROM ENDPESS EN WHERE'
      
        '                                                      EN.IDPESSO' +
        'A(+) = EL.IDPESSOA)) AND'
      
        '               PP.IDPLANOPREV = (SELECT MAX(PART.IDPLANOPREV) FR' +
        'OM PARTPREVPLAN PART'
      
        '                                             WHERE PART.IDSITPLA' +
        'NOPREV <> 3'
      
        '                                             AND   PART.IDPESSOA' +
        ' = EL.IDPESSOA'
      
        '                                             AND   PART.IDPESSJU' +
        'R = EL.IDPESSJUR) AND'
      '               NOT EXISTS (SELECT 1 FROM BENEFBFCIARIO BF'
      
        '                                  WHERE BF.IDPESSOA         = EL' +
        '.IDPESSOA'
      
        '                                  AND   BF.IDTITULAR        = EL' +
        '.IDPESSOA'
      '                                  AND   BF.FONTEPAGADORA    = 1'
      '                                  AND   BF.IDTPPAGTOBENEFIC = 1'
      '                                  AND   BF.IDSITBENEFICIO   = 1)'
      '               AND EXISTS ( SELECT 1'
      '                            FROM  HISTRUBSAL HS'
      '                            WHERE HS.IDPESSOA = P.IDPESSOA'
      
        '                            AND   HS.MESCOBRANCA = TO_CHAR(ADD_M' +
        'ONTHS(SYSDATE, -1), '#39'YYYY/MM'#39')'
      
        '                            AND   HS.IDRUBRICA IN ('#39'35575'#39','#39'3493' +
        '6'#39','#39'35590'#39','#39'35607'#39','#39'39435'#39'))'
      
        'AND (NVL(P.VALOR,'#39'N'#39') = :TIPO OR :TIPO = '#39'T'#39' )                  ' +
        '                                    '
      '                            AND'
      '             :CED = '#39'S'#39
      ''
      '      UNION'
      '      -- NAO ASSOCIADOS'
      '      SELECT  E.MATRICULA,'
      '              ENDP.Idendereco,'
      '              P.NOME,'
      '              ENDP.LOGRADOURO,'
      
        '              DECODE (ENDP.NUMERO,NULL,'#39'S/N'#39',ENDP.NUMERO) AS NUM' +
        'ERO,'
      
        '              DECODE (ENDP.TIPOENDERECO,'#39'R'#39','#39'N'#39','#39'S'#39') AS COMERCIA' +
        'L,'
      '              ENDP.COMPLEMENTO,'
      '              ENDP.BAIRRO,'
      '              ENDP.CEP,'
      '              /*SIG 33967 - início */'
      '              --UPPER(ENDP.CIDADE) CIDADE,               '
      '              --ENDP.CODESTADO UF,'
      '              UPPER(NVL(CENDP.NOME,ENDP.CIDADE)) CIDADE,   '
      '              NVL(CENDP.UF,ENDP.CODESTADO) UF,'
      '              /*SIG 33967 - Término */'
      '              P.NUMDOCUMENTO,'
      '              P.IDPESSOA,'
      '              P.VALOR,'
      '              F.NUMFILIAL COD_LOTACAO,'
      '              P1.NOME NOME_LOTACAO,'
      '              EP.LOGRADOURO END_LOTACAO,'
      '              UPPER(C.NOME) CIDADE_LOTACAO,'
      '              C.UF UF_LOTACAO'
      '      FROM'
      
        '              ELEGPATRO E, FILIALPESSOA F, PARTPREVPLAN PP, PESS' +
        'OA P1, SITFUNC S,'
      
        '               (SELECT PES.*,DECODE(:TIPO,'#39'T'#39','#39'S'#39',NVL((SELECT VA' +
        'LOR'
      
        '                                                      FROM   PES' +
        'SOAPARAM PR'
      
        '                                                     WHERE  SYSD' +
        'ATE BETWEEN PR.DATAINICIO AND NVL(PR.DATAFIM,SYSDATE)'
      
        '                                                       AND  PR.I' +
        'DPARAM  = 129'
      
        '                                                       AND  PR.I' +
        'DPESSOA = PES.IDPESSOA'
      
        '                                                       AND  ROWN' +
        'UM      = 1),'#39'N'#39')) VALOR'
      '               FROM PESSOA PES)P,'
      '              SITPART SP, ENDPESS EP, ENDPESS ENDP, CIDADES C,'
      '              CIDADES CENDP -- SIG 33967'
      ''
      '      WHERE   ENDP.LOGRADOURO is not null  and '
      '              ENDP.CEP is not null and '
      
        '              --ENDP.CIDADE is not null  and        -- SIG 33967' +
        '  '
      
        '              NVL(C.NOME,ENDP.CIDADE)is not null AND -- SIG 3396' +
        '7 '
      
        '              ENDP.IDCIDADES = CENDP.IDCIDADES(+) AND   -- SIG 3' +
        '3967 '
      
        '              ENDP.IDPESSOA = P.IDPESSOA AND            -- SIG 3' +
        '3967'
      
        '              ENDP.IDENDERECO    = (SELECT MAX(ENDP1.IDENDERECO)' +
        ' FROM ENDPESS ENDP1 WHERE ENDP1.IDPESSOA = P.IDPESSOA ) AND'
      '              E.IDPESSOA = P.IDPESSOA        AND'
      '              E.IDPESSOA = PP.IDPESSOA    (+)AND'
      '              PP.IDPLANOPREV IS NULL         AND'
      '              E.IDESTAB = F.IDFILIALPESSOA   AND'
      '              F.IDFILIALPESSOA = P1.IDPESSOA AND'
      '              F.IDFILIALPESSOA = EP.IDPESSOA AND'
      
        '              EP.IDENDERECO    = (SELECT MAX(END1.IDENDERECO) FR' +
        'OM ENDPESS END1 WHERE END1.IDPESSOA = F.IDFILIALPESSOA) AND'
      '              E.IDSITFUNC      = S.IDSITFUNC AND'
      '              S.TIPOSIT        = '#39'A'#39'         AND'
      '              E.IDPESSJUR      = 91008       AND'
      '              E.DATADEMISSAO IS NULL         AND'
      '              PP.IDSITPART     = SP.IDSITPART (+) AND'
      
        '              (SP.FLGINTERNO   = '#39'AT'#39' OR SP.FLGINTERNO = '#39'MP'#39' OR' +
        ' SP.FLGINTERNO IS NULL)  AND'
      
        '              (PP.IDPLANOPREV IS NULL  OR  (PP.IDPLANOPREV IS NO' +
        'T NULL AND PP.FLGDESATIVADO =1))'
      'AND (NVL(P.VALOR,'#39'N'#39') = :TIPO OR :TIPO = '#39'T'#39' )'
      '               AND'
      '              EP.IDCIDADES = C.IDCIDADES(+)  AND'
      ''
      '              :NAOASSOC = '#39'S'#39
      ''
      '      GROUP BY E.MATRICULA,'
      '               ENDP.Idendereco,'
      '               P.NOME,'
      '               ENDP.LOGRADOURO,'
      '               ENDP.NUMERO,'
      '               ENDP.TIPOENDERECO ,'
      '               ENDP.COMPLEMENTO,'
      '               ENDP.BAIRRO,'
      '               ENDP.CEP,'
      '              /*SIG 33967 - início */'
      '               --ENDP.CIDADE,'
      '               --ENDP.CODESTADO ,'
      '               NVL(CENDP.NOME,ENDP.CIDADE),   '
      '               NVL(CENDP.UF,ENDP.CODESTADO),'
      '               /*SIG 33967 - Término */'
      '               P.NUMDOCUMENTO,'
      '               P.IDPESSOA,'
      '               P.VALOR,'
      '               F.NUMFILIAL,'
      '               P1.NOME,'
      '               EP.LOGRADOURO,'
      '               C.NOME,'
      '               C.UF'
      ''
      '      UNION'
      '       -- ATIVOS'
      'SELECT /*RULE*/ '
      '       DISTINCT'
      '       EL.MATRICULA,'
      '       E.Idendereco,'
      '       P.NOME,'
      '       E.LOGRADOURO,'
      '       DECODE (E.NUMERO,NULL,'#39'S/N'#39',E.NUMERO) AS NUMERO,'
      '       DECODE (E.TIPOENDERECO,'#39'R'#39','#39'N'#39','#39'S'#39') AS COMERCIAL,'
      '       E.COMPLEMENTO,'
      '       E.BAIRRO,'
      '       E.CEP,'
      '       /*SIG 33967 - início */'
      '       --UPPER(E.CIDADE) CIDADE,               '
      '       --E.CODESTADO UF,'
      '       UPPER(NVL(C.NOME,E.CIDADE)) CIDADE,   '
      '       NVL(C.UF,E.CODESTADO) UF,'
      '       /*SIG 33967 - Término */'
      '       P.NUMDOCUMENTO,'
      '       P.IDPESSOA,'
      '       PARAMETRO.VALOR,'
      '       FP.NUMFILIAL AS COD_LOTACAO,'
      '       PFF.NOME AS NOME_LOTACAO,'
      '       EP.LOGRADOURO AS END_LOTACAO,'
      '       UPPER(EP.CIDADE) AS CIDADE_LOTACAO,'
      '       EP.CODESTADO AS UF_LOTACAO'
      '  FROM (SELECT DISTINCT BFC.IDPESSOA'
      '          FROM BENEFBFCIARIO BFC) BF'
      '        RIGHT JOIN PARTPREVPLAN PP ON PP.IDPESSOA = BF.IDPESSOA'
      '        JOIN ELEGPATRO EL          ON EL.IDPESSOA = PP.IDPESSOA'
      
        '        JOIN PESSOA P               ON  P.IDPESSOA  = PP.IDPESSO' +
        'A'
      
        '        JOIN ENDPESS E              ON  E.IDPESSOA  = PP.IDPESSO' +
        'A'
      
        '        JOIN PESSOAFISICA PF        ON  PF.IDPESSOA = PP.IDPESSO' +
        'A'
      
        '        JOIN FILIALPESSOA FP        ON  FP.IDFILIALPESSOA = EL.I' +
        'DESTAB'
      
        '        JOIN PESSOA PFF             ON  PFF.IDPESSOA      = FP.I' +
        'DFILIALPESSOA'
      
        '        JOIN ENDPESS EP             ON  EP.IDPESSOA       = FP.I' +
        'DFILIALPESSOA'
      
        '        LEFT JOIN CIDADES C         ON  C.IDCIDADES       = E.ID' +
        'CIDADES  -- SIG 33967 '
      
        '        JOIN  (SELECT PES.IDPESSOA,DECODE(:TIPO,'#39'T'#39','#39'S'#39',NVL((SEL' +
        'ECT VALOR'
      
        '                                                      FROM   PES' +
        'SOAPARAM PR'
      
        '                                                     WHERE  SYSD' +
        'ATE BETWEEN PR.DATAINICIO AND NVL(PR.DATAFIM,SYSDATE)'
      
        '                                                       AND  PR.I' +
        'DPARAM  = 129'
      
        '                                                       AND  PR.I' +
        'DPESSOA = PES.IDPESSOA'
      
        '                                                       AND  ROWN' +
        'UM      = 1),'#39'N'#39')) VALOR'
      
        '       FROM PESSOA PES  )PARAMETRO ON  PARAMETRO.IDPESSOA = P.ID' +
        'PESSOA'
      'WHERE '
      '      E.LOGRADOURO is not null  and '
      '      E.CEP is not null and '
      '     -- E.CIDADE is not null and          -- SIG 33967 '
      '      NVL(C.NOME,E.CIDADE)is not null AND -- SIG 33967 '
      '      (NVL(PARAMETRO.VALOR,'#39'N'#39') = :TIPO OR :TIPO = '#39'T'#39' )AND'
      '      PP.IDSITPART IN (1,2,33) AND'
      '      P.TIPO = '#39'F'#39'             AND'
      '      PP.DATACANCELAMENTO IS NULL AND'
      '      PF.DATAMORTE        IS NULL AND'
      
        '      E.IDENDERECO  = (SELECT MAX (EE.IDENDERECO) FROM ENDPESS E' +
        'E WHERE EE.IDPESSOA = PP.IDPESSOA)  AND'
      
        '      EP.IDENDERECO = (SELECT MAX (EEE.IDENDERECO) FROM ENDPESS ' +
        'EEE WHERE EEE.IDPESSOA = FP.IDFILIALPESSOA) AND'
      '      :ATIVOS = '#39'S'#39
      '      '
      'UNION'
      '   '
      '       -- APOSENTADOS'
      'SELECT '
      '       DISTINCT'
      '       EL.MATRICULA,'
      '       E.Idendereco,'
      '       P.NOME,'
      '       E.LOGRADOURO,'
      '       DECODE (E.NUMERO,NULL,'#39'S/N'#39',E.NUMERO) AS NUMERO,'
      '       DECODE (E.TIPOENDERECO,'#39'R'#39','#39'N'#39','#39'S'#39') AS COMERCIAL,'
      '       E.COMPLEMENTO,'
      '       E.BAIRRO,'
      '       E.CEP,'
      '       /*SIG 33967 - início */'
      '       --UPPER(E.CIDADE) CIDADE,               '
      '       --E.CODESTADO UF,'
      '       UPPER(NVL(C.NOME,E.CIDADE)) CIDADE,   '
      '       NVL(C.UF,E.CODESTADO) UF,'
      '       /*SIG 33967 - Término */'
      '       P.NUMDOCUMENTO,'
      '       P.IDPESSOA,'
      '       PARAMETRO.VALOR,'
      '       FP.NUMFILIAL AS COD_LOTACAO,'
      '       PFF.NOME AS NOME_LOTACAO,'
      '       EP.LOGRADOURO AS END_LOTACAO,'
      '       UPPER(EP.CIDADE) AS CIDADE_LOTACAO,'
      '       EP.CODESTADO AS UF_LOTACAO'
      '  FROM (SELECT DISTINCT BFC.IDPESSOA'
      '          FROM BENEFBFCIARIO BFC) BF'
      '        RIGHT JOIN PARTPREVPLAN PP ON PP.IDPESSOA = BF.IDPESSOA'
      '        JOIN ELEGPATRO EL          ON EL.IDPESSOA = PP.IDPESSOA'
      
        '        JOIN PESSOA P               ON  P.IDPESSOA  = PP.IDPESSO' +
        'A'
      
        '        JOIN ENDPESS E              ON  E.IDPESSOA  = PP.IDPESSO' +
        'A'
      
        '        JOIN PESSOAFISICA PF        ON  PF.IDPESSOA = PP.IDPESSO' +
        'A'
      
        '        JOIN FILIALPESSOA FP        ON  FP.IDFILIALPESSOA = EL.I' +
        'DESTAB'
      
        '        JOIN PESSOA PFF             ON  PFF.IDPESSOA      = FP.I' +
        'DFILIALPESSOA'
      
        '        JOIN ENDPESS EP             ON  EP.IDPESSOA       = FP.I' +
        'DFILIALPESSOA'
      
        '        LEFT JOIN CIDADES C         ON  C.IDCIDADES       = E.ID' +
        'CIDADES  -- SIG 33967 '
      
        '        JOIN  (SELECT PES.IDPESSOA,DECODE(:TIPO,'#39'T'#39','#39'S'#39',NVL((SEL' +
        'ECT VALOR'
      
        '                                                      FROM   PES' +
        'SOAPARAM PR'
      
        '                                                     WHERE  SYSD' +
        'ATE BETWEEN PR.DATAINICIO AND NVL(PR.DATAFIM,SYSDATE)'
      
        '                                                       AND  PR.I' +
        'DPARAM  = 129'
      
        '                                                       AND  PR.I' +
        'DPESSOA = PES.IDPESSOA'
      
        '                                                       AND  ROWN' +
        'UM      = 1),'#39'N'#39')) VALOR'
      
        '       FROM PESSOA PES  )PARAMETRO ON  PARAMETRO.IDPESSOA = P.ID' +
        'PESSOA'
      'WHERE '
      '      E.LOGRADOURO is not null  and '
      '      E.CEP is not null and '
      '     -- E.CIDADE is not null and          -- SIG 33967 '
      '      NVL(C.NOME,E.CIDADE)is not null AND -- SIG 33967 '
      '      (NVL(PARAMETRO.VALOR,'#39'N'#39') = :TIPO OR :TIPO = '#39'T'#39' )AND'
      '      PP.IDSITPART IN (4,11,12) AND'
      '      P.TIPO = '#39'F'#39'             AND'
      '      PP.DATACANCELAMENTO IS NULL AND'
      '      PF.DATAMORTE        IS NULL AND'
      
        '      E.IDENDERECO  = (SELECT MAX (EE.IDENDERECO) FROM ENDPESS E' +
        'E WHERE EE.IDPESSOA = PP.IDPESSOA)  AND'
      
        '      EP.IDENDERECO = (SELECT MAX (EEE.IDENDERECO) FROM ENDPESS ' +
        'EEE WHERE EEE.IDPESSOA = FP.IDFILIALPESSOA) AND'
      '      :APOSE = '#39'S'#39
      ''
      'UNION'
      '   '
      '       -- PENSIONISTAS'
      'SELECT '
      '       DISTINCT'
      '       EL.MATRICULA,'
      '       E.Idendereco,'
      '       P.NOME,'
      '       E.LOGRADOURO,'
      '       DECODE (E.NUMERO,NULL,'#39'S/N'#39',E.NUMERO) AS NUMERO,'
      '       DECODE (E.TIPOENDERECO,'#39'R'#39','#39'N'#39','#39'S'#39') AS COMERCIAL,'
      '       E.COMPLEMENTO,'
      '       E.BAIRRO,'
      '       E.CEP,'
      '       /*SIG 33967 - início */'
      '       --UPPER(E.CIDADE) CIDADE,               '
      '       --E.CODESTADO UF,'
      '       UPPER(NVL(C.NOME,E.CIDADE)) CIDADE,   '
      '       NVL(C.UF,E.CODESTADO) UF,'
      '       /*SIG 33967 - Término */'
      '       P.NUMDOCUMENTO,'
      '       P.IDPESSOA,'
      '       PARAMETRO.VALOR,'
      '       FP.NUMFILIAL AS COD_LOTACAO,'
      '       PFF.NOME AS NOME_LOTACAO,'
      '       EP.LOGRADOURO AS END_LOTACAO,'
      '       UPPER(EP.CIDADE) AS CIDADE_LOTACAO,'
      '       EP.CODESTADO AS UF_LOTACAO'
      '  FROM (SELECT DISTINCT BFC.IDPESSOA'
      '          FROM BENEFBFCIARIO BFC) BF'
      '        RIGHT JOIN DEPENTIT DP ON DP.IDPESSOA = BF.IDPESSOA'
      '        JOIN ELEGPATRO EL          ON EL.IDPESSOA = DP.IDPESSOA'
      
        '        JOIN PESSOA P               ON  P.IDPESSOA  = DP.IDPESSO' +
        'A'
      
        '        JOIN ENDPESS E              ON  E.IDPESSOA  = DP.IDPESSO' +
        'A'
      
        '        JOIN PESSOAFISICA PF        ON  PF.IDPESSOA = DP.IDPESSO' +
        'A'
      
        '        JOIN FILIALPESSOA FP        ON  FP.IDFILIALPESSOA = EL.I' +
        'DESTAB'
      
        '        JOIN PESSOA PFF             ON  PFF.IDPESSOA      = FP.I' +
        'DFILIALPESSOA'
      
        '        JOIN ENDPESS EP             ON  EP.IDPESSOA       = FP.I' +
        'DFILIALPESSOA'
      
        '        LEFT JOIN CIDADES C         ON  C.IDCIDADES       = E.ID' +
        'CIDADES  -- SIG 33967 '
      
        '        JOIN  (SELECT PES.IDPESSOA,DECODE(:TIPO,'#39'T'#39','#39'S'#39',NVL((SEL' +
        'ECT VALOR'
      
        '                                                      FROM   PES' +
        'SOAPARAM PR'
      
        '                                                     WHERE  SYSD' +
        'ATE BETWEEN PR.DATAINICIO AND NVL(PR.DATAFIM,SYSDATE)'
      
        '                                                       AND  PR.I' +
        'DPARAM  = 129'
      
        '                                                       AND  PR.I' +
        'DPESSOA = PES.IDPESSOA'
      
        '                                                       AND  ROWN' +
        'UM      = 1),'#39'N'#39')) VALOR'
      
        '       FROM PESSOA PES  )PARAMETRO ON  PARAMETRO.IDPESSOA = P.ID' +
        'PESSOA'
      'WHERE '
      '      E.LOGRADOURO is not null  and '
      '      E.CEP is not null and '
      '     -- E.CIDADE is not null and          -- SIG 33967 '
      '      NVL(C.NOME,E.CIDADE)is not null AND -- SIG 33967 '
      '      (NVL(PARAMETRO.VALOR,'#39'N'#39') = :TIPO OR :TIPO = '#39'T'#39' )AND'
      '      DP.IDDEPENDENCIA IN ('#39'FIL'#39','#39'COM'#39') AND'
      '      P.TIPO = '#39'F'#39'             AND'
      '      PF.DATAMORTE        IS NULL AND'
      
        '      E.IDENDERECO  = (SELECT MAX (EE.IDENDERECO) FROM ENDPESS E' +
        'E WHERE EE.IDPESSOA = DP.IDPESSOA)  AND'
      
        '      EP.IDENDERECO = (SELECT MAX (EEE.IDENDERECO) FROM ENDPESS ' +
        'EEE WHERE EEE.IDPESSOA = FP.IDFILIALPESSOA) AND'
      '      :PENSI = '#39'S'#39
      ''
      ')      ')
    ControlType.Strings = (
      'VALOR;CheckBox;S;N')
    ValidateWithMask = True
    Left = 704
    Top = 171
    ParamData = <
      item
        DataType = ftString
        Name = 'Tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FACULT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LICENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ASSIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CED'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAOASSOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ATIVOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'APOSE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PENSI'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayLabel = 'Receber~ Revista'
      DisplayWidth = 8
      FieldName = 'VALOR'
      Size = 30
    end
    object StringField2: TStringField
      DisplayLabel = 'Matricula'
      DisplayWidth = 10
      FieldName = 'MATRICULA'
      ReadOnly = True
      Size = 13
    end
    object StringField3: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 25
      FieldName = 'NOME'
      Size = 60
    end
    object StringField4: TStringField
      DisplayLabel = 'Endereço~Residencial'
      DisplayWidth = 24
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object StringField5: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 15
      FieldName = 'BAIRRO'
    end
    object StringField6: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 25
      FieldName = 'CIDADE'
      Size = 50
    end
    object StringField7: TStringField
      DisplayLabel = 'Estado '
      DisplayWidth = 3
      FieldName = 'UF'
      FixedChar = True
      Size = 3
    end
    object StringField8: TStringField
      DisplayWidth = 8
      FieldName = 'CEP'
      Size = 8
    end
    object StringField9: TStringField
      DisplayLabel = 'Nome Unid~Lotação'
      DisplayWidth = 30
      FieldName = 'nome_lotacao'
      Size = 60
    end
    object StringField10: TStringField
      DisplayLabel = 'Endereço Unid~Lotação'
      DisplayWidth = 30
      FieldName = 'end_lotacao'
      Size = 60
    end
    object StringField11: TStringField
      DisplayLabel = 'Cidade Unid~Lotação'
      DisplayWidth = 25
      FieldName = 'cidade_lotacao'
      Size = 50
    end
    object StringField12: TStringField
      DisplayLabel = 'Estado Unid~Lotação'
      DisplayWidth = 3
      FieldName = 'uf_lotacao'
      Size = 3
    end
    object StringField13: TStringField
      DisplayLabel = 'Código Unid~Lotação'
      DisplayWidth = 15
      FieldName = 'cod_lotacao'
      Visible = False
      Size = 15
    end
    object StringField14: TStringField
      DisplayWidth = 18
      FieldName = 'Numdocumento'
      Visible = False
      Size = 18
    end
    object StringField15: TStringField
      DisplayWidth = 20
      FieldName = 'COMPLEMENTO'
      Visible = False
    end
    object StringField16: TStringField
      DisplayWidth = 10
      FieldName = 'COMERCIAL'
      Visible = False
      Size = 1
    end
    object StringField17: TStringField
      DisplayWidth = 8
      FieldName = 'NUMERO'
      Visible = False
      Size = 8
    end
    object FloatField1: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    OnNewRecord = qryDSNewRecord
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT MATRICULA,'
      '       NOME,'
      '       LOGRADOURO,'
      '       NUMERO,'
      '       COMERCIAL,'
      '       COMPLEMENTO,'
      '       BAIRRO,'
      '       CEP,'
      '       CIDADE,'
      '       UF,'
      '       NUMDOCUMENTO,'
      '       IDPESSOA,'
      '       VALOR,'
      '       COD_LOTACAO,'
      '       NOME_LOTACAO,'
      '       END_LOTACAO,'
      '       CIDADE_LOTACAO,'
      '       UF_LOTACAO'
      'FROM ('
      '-- FACULTATIVOS'
      '      SELECT  EL.MATRICULA,'
      '              EP.Idendereco,'
      '              P.NOME,'
      '              EP.LOGRADOURO,'
      '              DECODE (EP.NUMERO,NULL,'#39'S/N'#39',EP.NUMERO) AS NUMERO,'
      '              DECODE (EP.TIPOENDERECO,'#39'R'#39','#39'N'#39','#39'S'#39') AS COMERCIAL,'
      '              EP.COMPLEMENTO,'
      '              EP.BAIRRO,'
      '              EP.CEP,'
      '              UPPER(EP.CIDADE) CIDADE,'
      '              EP.CODESTADO UF,'
      '              P.NUMDOCUMENTO,'
      '              P.IDPESSOA,'
      '              P.VALOR,'
      '              '#39#39' COD_LOTACAO,'
      '              '#39#39' NOME_LOTACAO,'
      '              '#39#39' END_LOTACAO,'
      '              '#39#39' CIDADE_LOTACAO,'
      '              '#39#39' UF_LOTACAO'
      
        '      FROM     (SELECT PES.*,DECODE(:TIPO,'#39'T'#39','#39'S'#39',NVL((SELECT VA' +
        'LOR'
      
        '                                                      FROM   PES' +
        'SOAPARAM PR'
      
        '                                                     WHERE  SYSD' +
        'ATE BETWEEN PR.DATAINICIO AND NVL(PR.DATAFIM,SYSDATE)'
      
        '                                                       AND  PR.I' +
        'DPARAM  = 129'
      
        '                                                       AND  PR.I' +
        'DPESSOA = PES.IDPESSOA'
      
        '                                                       AND  ROWN' +
        'UM      = 1),'#39'N'#39')) VALOR'
      '               FROM PESSOA PES)P,'
      '              ELEGPATRO EL,'
      '              PARTPREVPLAN PP,'
      '              PESSOAFISICA PF,'
      '              ENDPESS EP'
      ''
      '      WHERE   EP.LOGRADOURO is not null and              '
      '              EP.BAIRRO is not null and'
      '              EP.CEP is not null and'
      '              EP.CIDADE is not null  and     '
      '              P.IDPESSOA = EL.IDPESSOA AND'
      '              P.IDPESSOA = PP.IDPESSOA AND'
      '              P.IDPESSOA   = PF.IDPESSOA AND'
      '              P.IDPESSOA   = EP.IDPESSOA (+) AND'
      '              PP.DATACANCELAMENTO IS NULL AND'
      '              PF.DATAMORTE IS NULL AND'
      '              PP.IDPESSJUR = 91008 AND'
      '              PP.IDSITPART IN (2,7,3,6,41,58,63,65) AND'
      '              P.TIPO = '#39'F'#39' AND'
      
        '              EP.IDENDERECO = NVL(P.IDENDCORRESP,(SELECT  MAX(EN' +
        '.IDENDERECO)'
      
        '                                                    FROM  ENDPES' +
        'S EN'
      
        '                                                    WHERE EN.IDP' +
        'ESSOA(+) = EP.IDPESSOA)) AND'
      '              PP.IDPLANOPREV = (SELECT MAX(PART.IDPLANOPREV)'
      '                                  FROM PARTPREVPLAN PART'
      '                                 WHERE PART.IDSITPLANOPREV <> 3'
      
        '                                   AND PART.IDPESSOA = EL.IDPESS' +
        'OA'
      
        '                                   AND PART.IDPESSJUR = EL.IDPES' +
        'SJUR) AND'
      '              NOT EXISTS (SELECT 1'
      '                          FROM  BENEFBFCIARIO BF'
      
        '                          WHERE BF.IDPESSOA         = EL.IDPESSO' +
        'A'
      
        '                          AND   BF.IDTITULAR        = EL.IDPESSO' +
        'A'
      '                          AND   BF.FONTEPAGADORA    = 1'
      '                          AND   BF.IDTPPAGTOBENEFIC = 1'
      '                          AND   BF.IDSITBENEFICIO   = 1)'
      
        '           AND (NVL(P.VALOR,'#39'N'#39') = :TIPO OR :TIPO = '#39'T'#39' )       ' +
        '                   '
      '                          AND'
      ''
      '             :FACULT = '#39'S'#39
      ''
      ''
      '      UNION'
      '      -- LICENCIADOS'
      '      SELECT  EL.MATRICULA,'
      '              EP.Idendereco,'
      '              P.NOME,'
      '              EP.LOGRADOURO,'
      '              DECODE (EP.NUMERO,NULL,'#39'S/N'#39',EP.NUMERO) AS NUMERO,'
      '              DECODE (EP.TIPOENDERECO,'#39'R'#39','#39'N'#39','#39'S'#39') AS COMERCIAL,'
      '              EP.COMPLEMENTO,'
      '              EP.BAIRRO,'
      '              EP.CEP,'
      '              UPPER(EP.CIDADE) CIDADE,'
      '              EP.CODESTADO UF,'
      '              P.NUMDOCUMENTO,'
      '              P.IDPESSOA,'
      '              P.VALOR,'
      '              '#39#39' COD_LOTACAO,'
      '              '#39#39' NOME_LOTACAO,'
      '              '#39#39' END_LOTACAO,'
      '              '#39#39' CIDADE_LOTACAO,'
      '              '#39#39' UF_LOTACAO'
      '      FROM'
      '            (SELECT PES.*,DECODE(:TIPO,'#39'T'#39','#39'S'#39',NVL((SELECT VALOR'
      
        '                                                      FROM   PES' +
        'SOAPARAM PR'
      
        '                                                     WHERE  SYSD' +
        'ATE BETWEEN PR.DATAINICIO AND NVL(PR.DATAFIM,SYSDATE)'
      
        '                                                       AND  PR.I' +
        'DPARAM  = 129'
      
        '                                                       AND  PR.I' +
        'DPESSOA = PES.IDPESSOA'
      
        '                                                       AND  ROWN' +
        'UM      = 1),'#39'N'#39')) VALOR'
      '               FROM PESSOA PES)P,'
      '           ELEGPATRO EL,'
      '           SITFUNC SF,'
      '           PARTPREVPLAN PP,'
      '           PESSOAFISICA PF,'
      '           ENDPESS EP'
      '      WHERE   EP.LOGRADOURO is not null and             '
      '              EP.BAIRRO is not null and'
      '              EP.CEP is not null and'
      '              EP.CIDADE is not null and'
      '           P.IDPESSOA = EL.IDPESSOA AND'
      '           P.IDPESSOA = PP.IDPESSOA AND'
      '           P.IDPESSOA = PF.IDPESSOA AND'
      '           P.IDPESSOA = EP.IDPESSOA (+) AND'
      '           EL.IDSITFUNC = SF.IDSITFUNC AND'
      '           PP.DATACANCELAMENTO IS NULL AND'
      '           PF.DATAMORTE IS NULL AND'
      '           PP.DATACANCELAMENTO IS NULL AND'
      '           PP.IDSITPLANOPREV = 1 AND'
      '           PP.FLGDESATIVADO = 0 AND'
      
        '           EL.IDSITFUNC IN (3,5,6,22,40,41,42,43,44,45,47,48,49,' +
        '51,52,54,55,65,66,67,69,70,73) AND'
      '           PP.IDPESSJUR = 91008 AND'
      '           P.TIPO = '#39'F'#39' AND'
      
        '           EP.IDENDERECO = NVL(P.IDENDCORRESP,(SELECT MAX(EN.IDE' +
        'NDERECO) FROM ENDPESS EN WHERE'
      
        '                                                  EN.IDPESSOA(+)' +
        ' = EL.IDPESSOA)) AND'
      
        '           PP.IDPLANOPREV = (SELECT MAX(PART.IDPLANOPREV) FROM P' +
        'ARTPREVPLAN PART'
      
        '                                         WHERE PART.IDSITPLANOPR' +
        'EV <> 3'
      
        '                                         AND   PART.IDPESSOA = E' +
        'L.IDPESSOA'
      
        '                                         AND   PART.IDPESSJUR = ' +
        'EL.IDPESSJUR) AND'
      '            NOT EXISTS (SELECT 1'
      '                        FROM BENEFBFCIARIO BF'
      '                        WHERE BF.IDPESSOA = EL.IDPESSOA'
      '                        AND   BF.IDTITULAR = EL.IDPESSOA'
      '                        AND   BF.FONTEPAGADORA = 1'
      '                        AND   BF.IDTPPAGTOBENEFIC = 1'
      '                        AND   BF.IDSITBENEFICIO = 1) '
      
        'AND (NVL(P.VALOR,'#39'N'#39') = :TIPO OR :TIPO = '#39'T'#39' )                  ' +
        '                                '
      '                        AND'
      '           :LICENC = '#39'S'#39
      ''
      ''
      '      UNION'
      ''
      '      -- RELATÓRIO DE ASSISTIDOS'
      ''
      '      SELECT  EL.MATRICULA,'
      '              EP.Idendereco,'
      '              P.NOME,'
      '              EP.LOGRADOURO,'
      '              DECODE (EP.NUMERO,NULL,'#39'S/N'#39',EP.NUMERO) AS NUMERO,'
      '              DECODE (EP.TIPOENDERECO,'#39'R'#39','#39'N'#39','#39'S'#39') AS COMERCIAL,'
      '              EP.COMPLEMENTO,'
      '              EP.BAIRRO,'
      '              EP.CEP,'
      '              UPPER(EP.CIDADE) CIDADE,'
      '              EP.CODESTADO UF,'
      '              P.NUMDOCUMENTO,'
      '              P.IDPESSOA,'
      '              P.VALOR,'
      '              '#39#39' COD_LOTACAO,'
      '              '#39#39' NOME_LOTACAO,'
      '              '#39#39' END_LOTACAO,'
      '              '#39#39' CIDADE_LOTACAO,'
      '              '#39#39' UF_LOTACAO'
      '       FROM   ELEGPATRO EL,'
      
        '               (SELECT PES.*,DECODE(:TIPO,'#39'T'#39','#39'S'#39',NVL((SELECT VA' +
        'LOR'
      
        '                                                      FROM   PES' +
        'SOAPARAM PR'
      
        '                                                     WHERE  SYSD' +
        'ATE BETWEEN PR.DATAINICIO AND NVL(PR.DATAFIM,SYSDATE)'
      
        '                                                       AND  PR.I' +
        'DPARAM  = 129'
      
        '                                                       AND  PR.I' +
        'DPESSOA = PES.IDPESSOA'
      
        '                                                       AND  ROWN' +
        'UM      = 1),'#39'N'#39')) VALOR'
      '               FROM PESSOA PES)P,'
      '              DEPENTIT DP,'
      '              BENEFBFCIARIO BF,'
      '              PESSOAFISICA PF,'
      '              ENDPESS EP'
      '              '
      '       WHERE  EP.LOGRADOURO is not null  and '
      '              EP.BAIRRO is not null and '
      '              EP.CEP is not null and '
      '              EP.CIDADE is not null and '
      '              EL.IDPESSOA = P.IDPESSOA       AND'
      '              DP.IDPESSOA = P.IDPESSOA       AND'
      '              DP.IDPESSOA = BF.IDPESSOA      AND'
      '              DP.IDPESSOA = PF.IDPESSOA      AND'
      '              DP.IDPESSOA = EP.IDPESSOA   (+)AND              '
      '              BF.IDSITBENEFICIO   = 1 AND'
      '              BF.IDTPPAGTOBENEFIC = 1 AND'
      '              BF.FONTEPAGADORA    = 1 AND'
      
        '              EP.IDENDERECO       = NVL(P.IDENDCORRESP,(SELECT M' +
        'AX(EN.IDENDERECO)'
      
        '                                                        FROM   E' +
        'NDPESS EN'
      
        '                                                        WHERE  E' +
        'N.IDPESSOA(+) = DP.IDPESSOA))'
      
        'AND (NVL(P.VALOR,'#39'N'#39') = :TIPO OR :TIPO = '#39'T'#39' )                  ' +
        '                                                                '
      '                                                         AND'
      '             :ASSIS = '#39'S'#39
      ''
      '     GROUP BY EL.MATRICULA,'
      '              EP.Idendereco,'
      '              P.NOME,'
      '              EP.LOGRADOURO,'
      '              EP.NUMERO,'
      '              EP.TIPOENDERECO,'
      '              EP.COMPLEMENTO,'
      '              EP.BAIRRO,'
      '              EP.CEP,'
      '              EP.CIDADE,'
      '              EP.CODESTADO,'
      '              P.NUMDOCUMENTO,'
      '              P.IDPESSOA,'
      '              P.VALOR'
      ''
      '   UNION'
      ''
      '      -- RELATÓRIO DE CEDIDOS'
      ''
      '      SELECT'
      '              EL.MATRICULA,'
      '              EP.Idendereco,'
      '              P.NOME,'
      '              EP.LOGRADOURO,'
      '              DECODE (EP.NUMERO,NULL,'#39'S/N'#39',EP.NUMERO) AS NUMERO,'
      
        '              DECODE (EP.TIPOENDERECO,'#39'R'#39','#39'N'#39','#39'S'#39')    AS COMERCI' +
        'AL,'
      '              EP.COMPLEMENTO,'
      '              EP.BAIRRO,'
      '              EP.CEP,'
      '              UPPER(EP.CIDADE) CIDADE,'
      '              EP.CODESTADO UF,'
      '              P.NUMDOCUMENTO,'
      '              P.IDPESSOA,'
      '              P.VALOR,'
      '              '#39#39' COD_LOTACAO,'
      '              '#39#39' NOME_LOTACAO,'
      '              '#39#39' END_LOTACAO,'
      '              '#39#39' CIDADE_LOTACAO,'
      '              '#39#39' UF_LOTACAO'
      ''
      '      FROM'
      
        '                (SELECT PES.*,DECODE(:TIPO,'#39'T'#39','#39'S'#39',NVL((SELECT V' +
        'ALOR'
      
        '                                                      FROM   PES' +
        'SOAPARAM PR'
      
        '                                                     WHERE  SYSD' +
        'ATE BETWEEN PR.DATAINICIO AND NVL(PR.DATAFIM,SYSDATE)'
      
        '                                                       AND  PR.I' +
        'DPARAM  = 129'
      
        '                                                       AND  PR.I' +
        'DPESSOA = PES.IDPESSOA'
      
        '                                                       AND  ROWN' +
        'UM      = 1),'#39'N'#39')) VALOR'
      '               FROM PESSOA PES)P,'
      '               ELEGPATRO EL,'
      '               SITFUNC SF,'
      '               PARTPREVPLAN PP,'
      '               PESSOAFISICA PF,'
      '               ENDPESS EP'
      ''
      '      WHERE   EP.LOGRADOURO is not null  and '
      '              EP.BAIRRO is not null and '
      '              EP.CEP is not null and '
      '              EP.CIDADE is not null and '
      '               P.IDPESSOA = EL.IDPESSOA AND'
      '               P.IDPESSOA = PP.IDPESSOA AND'
      '               P.IDPESSOA = PF.IDPESSOA AND'
      '               P.IDPESSOA = EP.IDPESSOA (+) AND'
      '               EL.IDSITFUNC = SF.IDSITFUNC AND'
      '               PP.DATACANCELAMENTO IS NULL AND'
      '               PF.DATAMORTE IS NULL AND'
      '               PP.DATACANCELAMENTO IS NULL AND'
      '               PP.IDSITPLANOPREV = 1 AND'
      '               PP.FLGDESATIVADO = 0 AND'
      '               PP.IDPESSJUR = 91008 AND'
      '               P.TIPO = '#39'F'#39' AND'
      
        '               EP.IDENDERECO = NVL(P.IDENDCORRESP,(SELECT MAX(EN' +
        '.IDENDERECO) FROM ENDPESS EN WHERE'
      
        '                                                      EN.IDPESSO' +
        'A(+) = EL.IDPESSOA)) AND'
      
        '               PP.IDPLANOPREV = (SELECT MAX(PART.IDPLANOPREV) FR' +
        'OM PARTPREVPLAN PART'
      
        '                                             WHERE PART.IDSITPLA' +
        'NOPREV <> 3'
      
        '                                             AND   PART.IDPESSOA' +
        ' = EL.IDPESSOA'
      
        '                                             AND   PART.IDPESSJU' +
        'R = EL.IDPESSJUR) AND'
      '               NOT EXISTS (SELECT 1 FROM BENEFBFCIARIO BF'
      
        '                                  WHERE BF.IDPESSOA         = EL' +
        '.IDPESSOA'
      
        '                                  AND   BF.IDTITULAR        = EL' +
        '.IDPESSOA'
      '                                  AND   BF.FONTEPAGADORA    = 1'
      '                                  AND   BF.IDTPPAGTOBENEFIC = 1'
      '                                  AND   BF.IDSITBENEFICIO   = 1)'
      '               AND EXISTS ( SELECT 1'
      '                            FROM  HISTRUBSAL HS'
      '                            WHERE HS.IDPESSOA = P.IDPESSOA'
      
        '                            AND   HS.MESCOBRANCA = TO_CHAR(ADD_M' +
        'ONTHS(SYSDATE, -1), '#39'YYYY/MM'#39')'
      
        '                            AND   HS.IDRUBRICA IN ('#39'35575'#39','#39'3493' +
        '6'#39','#39'35590'#39','#39'35607'#39','#39'39435'#39'))'
      
        'AND (NVL(P.VALOR,'#39'N'#39') = :TIPO OR :TIPO = '#39'T'#39' )                  ' +
        '                                    '
      '                            AND'
      '             :CED = '#39'S'#39
      ''
      '      UNION'
      '      -- NAO ASSOCIADOS'
      '      SELECT  E.MATRICULA,'
      '              ENDP.Idendereco,'
      '              P.NOME,'
      '              ENDP.LOGRADOURO,'
      
        '              DECODE (ENDP.NUMERO,NULL,'#39'S/N'#39',ENDP.NUMERO) AS NUM' +
        'ERO,'
      
        '              DECODE (ENDP.TIPOENDERECO,'#39'R'#39','#39'N'#39','#39'S'#39') AS COMERCIA' +
        'L,'
      '              ENDP.COMPLEMENTO,'
      '              ENDP.BAIRRO,'
      '              ENDP.CEP,'
      '              UPPER(ENDP.CIDADE) CIDADE,'
      '              ENDP.CODESTADO UF,'
      '              P.NUMDOCUMENTO,'
      '              P.IDPESSOA,'
      '              P.VALOR,'
      '              F.NUMFILIAL COD_LOTACAO,'
      '              P1.NOME NOME_LOTACAO,'
      '              EP.LOGRADOURO END_LOTACAO,'
      '              UPPER(C.NOME) CIDADE_LOTACAO,'
      '              C.UF UF_LOTACAO'
      '      FROM'
      
        '              ELEGPATRO E, FILIALPESSOA F, PARTPREVPLAN PP, PESS' +
        'OA P1, SITFUNC S,'
      
        '               (SELECT PES.*,DECODE(:TIPO,'#39'T'#39','#39'S'#39',NVL((SELECT VA' +
        'LOR'
      
        '                                                      FROM   PES' +
        'SOAPARAM PR'
      
        '                                                     WHERE  SYSD' +
        'ATE BETWEEN PR.DATAINICIO AND NVL(PR.DATAFIM,SYSDATE)'
      
        '                                                       AND  PR.I' +
        'DPARAM  = 129'
      
        '                                                       AND  PR.I' +
        'DPESSOA = PES.IDPESSOA'
      
        '                                                       AND  ROWN' +
        'UM      = 1),'#39'N'#39')) VALOR'
      '               FROM PESSOA PES)P,'
      '              SITPART SP, ENDPESS EP, ENDPESS ENDP, CIDADES C'
      ''
      '      WHERE   ENDP.LOGRADOURO is not null  and '
      '              ENDP.BAIRRO is not null and '
      '              ENDP.CEP is not null and '
      '              ENDP.CIDADE is not null and '
      
        '              ENDP.IDENDERECO    = (SELECT MAX(ENDP1.IDENDERECO)' +
        ' FROM ENDPESS ENDP1 WHERE ENDP1.IDPESSOA = P.IDPESSOA ) AND'
      '              E.IDPESSOA = P.IDPESSOA        AND'
      '              E.IDPESSOA = PP.IDPESSOA    (+)AND'
      '              PP.IDPLANOPREV IS NULL         AND'
      '              E.IDESTAB = F.IDFILIALPESSOA   AND'
      '              F.IDFILIALPESSOA = P1.IDPESSOA AND'
      '              F.IDFILIALPESSOA = EP.IDPESSOA AND'
      
        '              EP.IDENDERECO    = (SELECT MAX(END1.IDENDERECO) FR' +
        'OM ENDPESS END1 WHERE END1.IDPESSOA = F.IDFILIALPESSOA) AND'
      '              E.IDSITFUNC      = S.IDSITFUNC AND'
      '              S.TIPOSIT        = '#39'A'#39'         AND'
      '              E.IDPESSJUR      = 91008       AND'
      '              E.DATADEMISSAO IS NULL         AND'
      '              PP.IDSITPART     = SP.IDSITPART (+) AND'
      
        '              (SP.FLGINTERNO   = '#39'AT'#39' OR SP.FLGINTERNO = '#39'MP'#39' OR' +
        ' SP.FLGINTERNO IS NULL)  AND'
      
        '              (PP.IDPLANOPREV IS NULL  OR  (PP.IDPLANOPREV IS NO' +
        'T NULL AND PP.FLGDESATIVADO =1))'
      'AND (NVL(P.VALOR,'#39'N'#39') = :TIPO OR :TIPO = '#39'T'#39' )'
      '               AND'
      '              EP.IDCIDADES = C.IDCIDADES(+)  AND'
      ''
      '              :NAOASSOC = '#39'S'#39
      ''
      '      GROUP BY E.MATRICULA,'
      '               ENDP.Idendereco,'
      '               P.NOME,'
      '               ENDP.LOGRADOURO,'
      '               ENDP.NUMERO,'
      '               ENDP.TIPOENDERECO ,'
      '               ENDP.COMPLEMENTO,'
      '               ENDP.BAIRRO,'
      '               ENDP.CEP,'
      '               ENDP.CIDADE,'
      '               ENDP.CODESTADO ,'
      '               P.NUMDOCUMENTO,'
      '               P.IDPESSOA,'
      '               P.VALOR,'
      '               F.NUMFILIAL,'
      '               P1.NOME,'
      '               EP.LOGRADOURO,'
      '               C.NOME,'
      '               C.UF'
      ''
      '      UNION'
      '       -- ATIVOS'
      'SELECT /*RULE*/ '
      '       DISTINCT'
      '       EL.MATRICULA,'
      '       E.Idendereco,'
      '       P.NOME,'
      '       E.LOGRADOURO,'
      '       DECODE (E.NUMERO,NULL,'#39'S/N'#39',E.NUMERO) AS NUMERO,'
      '       DECODE (E.TIPOENDERECO,'#39'R'#39','#39'N'#39','#39'S'#39') AS COMERCIAL,'
      '       E.COMPLEMENTO,'
      '       E.BAIRRO,'
      '       E.CEP,'
      '       UPPER (E.CIDADE) AS CIDADE,'
      '       E.CODESTADO AS UF,'
      '       P.NUMDOCUMENTO,'
      '       P.IDPESSOA,'
      '       PARAMETRO.VALOR,'
      '       FP.NUMFILIAL AS COD_LOTACAO,'
      '       PFF.NOME AS NOME_LOTACAO,'
      '       EP.LOGRADOURO AS END_LOTACAO,'
      '       UPPER(EP.CIDADE) AS CIDADE_LOTACAO,'
      '       EP.CODESTADO AS UF_LOTACAO'
      '  FROM (SELECT DISTINCT BFC.IDPESSOA'
      '          FROM BENEFBFCIARIO BFC) BF'
      '        RIGHT JOIN PARTPREVPLAN PP ON PP.IDPESSOA = BF.IDPESSOA'
      '        JOIN ELEGPATRO EL          ON EL.IDPESSOA = PP.IDPESSOA'
      
        '        JOIN PESSOA P               ON  P.IDPESSOA  = PP.IDPESSO' +
        'A'
      
        '        JOIN ENDPESS E              ON  E.IDPESSOA  = PP.IDPESSO' +
        'A'
      
        '        JOIN PESSOAFISICA PF        ON  PF.IDPESSOA = PP.IDPESSO' +
        'A'
      
        '        JOIN FILIALPESSOA FP        ON  FP.IDFILIALPESSOA = EL.I' +
        'DESTAB'
      
        '        JOIN PESSOA PFF             ON  PFF.IDPESSOA      = FP.I' +
        'DFILIALPESSOA'
      
        '        JOIN ENDPESS EP             ON  EP.IDPESSOA       = FP.I' +
        'DFILIALPESSOA'
      
        '        JOIN  (SELECT PES.IDPESSOA,DECODE(:TIPO,'#39'T'#39','#39'S'#39',NVL((SEL' +
        'ECT VALOR'
      
        '                                                      FROM   PES' +
        'SOAPARAM PR'
      
        '                                                     WHERE  SYSD' +
        'ATE BETWEEN PR.DATAINICIO AND NVL(PR.DATAFIM,SYSDATE)'
      
        '                                                       AND  PR.I' +
        'DPARAM  = 129'
      
        '                                                       AND  PR.I' +
        'DPESSOA = PES.IDPESSOA'
      
        '                                                       AND  ROWN' +
        'UM      = 1),'#39'N'#39')) VALOR'
      
        '       FROM PESSOA PES  )PARAMETRO ON  PARAMETRO.IDPESSOA = P.ID' +
        'PESSOA'
      'WHERE '
      '      E.LOGRADOURO is not null  and '
      '      E.BAIRRO is not null and '
      '      E.CEP is not null and '
      '      E.CIDADE is not null and'
      '      (NVL(PARAMETRO.VALOR,'#39'N'#39') = :TIPO OR :TIPO = '#39'T'#39' )AND'
      '      PP.IDSITPART IN (1,2,33) AND'
      '      P.TIPO = '#39'F'#39'             AND'
      '      PP.DATACANCELAMENTO IS NULL AND'
      '      PF.DATAMORTE        IS NULL AND'
      
        '      E.IDENDERECO  = (SELECT MAX (EE.IDENDERECO) FROM ENDPESS E' +
        'E WHERE EE.IDPESSOA = PP.IDPESSOA)  AND'
      
        '      EP.IDENDERECO = (SELECT MAX (EEE.IDENDERECO) FROM ENDPESS ' +
        'EEE WHERE EEE.IDPESSOA = FP.IDFILIALPESSOA) AND'
      '      :ATIVOS = '#39'S'#39')'
      ''
      '')
    ControlType.Strings = (
      'VALOR;CheckBox;S;N')
    ValidateWithMask = True
    Left = 792
    Top = 235
    ParamData = <
      item
        DataType = ftString
        Name = 'Tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FACULT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LICENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ASSIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CED'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAOASSOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ATIVOS'
        ParamType = ptUnknown
      end>
    object StringField31: TStringField
      DisplayLabel = 'Receber~ Revista'
      DisplayWidth = 8
      FieldName = 'VALOR'
      Size = 30
    end
    object StringField36: TStringField
      DisplayLabel = 'Matricula'
      DisplayWidth = 10
      FieldName = 'MATRICULA'
      ReadOnly = True
      Size = 13
    end
    object StringField37: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 25
      FieldName = 'NOME'
      Size = 60
    end
    object StringField38: TStringField
      DisplayLabel = 'Endereço~Residencial'
      DisplayWidth = 24
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object StringField39: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 15
      FieldName = 'BAIRRO'
    end
    object StringField40: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 25
      FieldName = 'CIDADE'
      Size = 50
    end
    object StringField41: TStringField
      DisplayLabel = 'Estado '
      DisplayWidth = 3
      FieldName = 'UF'
      FixedChar = True
      Size = 3
    end
    object StringField42: TStringField
      DisplayWidth = 8
      FieldName = 'CEP'
      Size = 8
    end
    object StringField43: TStringField
      DisplayLabel = 'Nome Unid~Lotação'
      DisplayWidth = 30
      FieldName = 'nome_lotacao'
      Size = 60
    end
    object StringField44: TStringField
      DisplayLabel = 'Endereço Unid~Lotação'
      DisplayWidth = 30
      FieldName = 'end_lotacao'
      Size = 60
    end
    object StringField45: TStringField
      DisplayLabel = 'Cidade Unid~Lotação'
      DisplayWidth = 25
      FieldName = 'cidade_lotacao'
      Size = 50
    end
    object StringField46: TStringField
      DisplayLabel = 'Estado Unid~Lotação'
      DisplayWidth = 3
      FieldName = 'uf_lotacao'
      Size = 3
    end
    object StringField47: TStringField
      DisplayLabel = 'Código Unid~Lotação'
      DisplayWidth = 15
      FieldName = 'cod_lotacao'
      Visible = False
      Size = 15
    end
    object StringField48: TStringField
      DisplayWidth = 18
      FieldName = 'Numdocumento'
      Visible = False
      Size = 18
    end
    object StringField49: TStringField
      DisplayWidth = 20
      FieldName = 'COMPLEMENTO'
      Visible = False
    end
    object StringField50: TStringField
      DisplayWidth = 10
      FieldName = 'COMERCIAL'
      Visible = False
      Size = 1
    end
    object StringField51: TStringField
      DisplayWidth = 8
      FieldName = 'NUMERO'
      Visible = False
      Size = 8
    end
    object FloatField5: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
  end
  object QRYInconc: TwwQuery
    CachedUpdates = True
    OnNewRecord = qryDSNewRecord
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    SessionName = 'Default'
    ValidateWithMask = True
    Left = 48
    Top = 323
    object StringField52: TStringField
      DisplayLabel = 'Matricula'
      DisplayWidth = 13
      FieldName = 'MATRICULA'
      Size = 13
    end
    object StringField53: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'NOME'
      Size = 60
    end
    object StringField54: TStringField
      DisplayLabel = 'Endereço~Residencial'
      DisplayWidth = 30
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object StringField55: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 20
      FieldName = 'BAIRRO'
    end
    object StringField56: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 20
      FieldName = 'CIDADE'
    end
    object StringField57: TStringField
      DisplayWidth = 8
      FieldName = 'CEP'
      Size = 8
    end
    object StringField58: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 3
      FieldName = 'UF'
      FixedChar = True
      Size = 3
    end
    object StringField65: TStringField
      DisplayLabel = 'Código Unid Lotação'
      DisplayWidth = 15
      FieldName = 'COD_LOTACAO'
      Visible = False
      Size = 15
    end
    object StringField59: TStringField
      DisplayLabel = 'Nome Unid~Lotação'
      DisplayWidth = 30
      FieldName = 'NOME_LOTACAO'
      Size = 60
    end
    object StringField60: TStringField
      DisplayLabel = 'Endereço~Lotação'
      DisplayWidth = 30
      FieldName = 'END_LOTACAO'
      Size = 60
    end
    object StringField61: TStringField
      DisplayLabel = 'Cidade~Lotação'
      DisplayWidth = 30
      FieldName = 'CIDADE_LOTACAO'
      Size = 50
    end
    object StringField62: TStringField
      DisplayLabel = 'Estado~Lotação'
      DisplayWidth = 3
      FieldName = 'UF_LOTACAO'
      Size = 3
    end
    object StringField63: TStringField
      DisplayLabel = 'Observação'
      DisplayWidth = 40
      FieldName = 'OBS'
      Size = 27
    end
    object FloatField6: TFloatField
      DisplayWidth = 10
      FieldName = 'ATUALIZAR'
      Visible = False
    end
    object StringField64: TStringField
      DisplayWidth = 18
      FieldName = 'NUMDOCUMENTO'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object FloatField7: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object FloatField8: TFloatField
      DisplayWidth = 10
      FieldName = 'IDENDERECO'
      Visible = False
    end
    object StringField66: TStringField
      DisplayWidth = 8
      FieldName = 'NUMERO'
      Visible = False
      Size = 8
    end
    object StringField67: TStringField
      DisplayWidth = 1
      FieldName = 'COMERCIAL'
      Visible = False
      Size = 1
    end
    object StringField68: TStringField
      DisplayWidth = 20
      FieldName = 'COMPLEMENTO'
      Visible = False
    end
  end
  object DspInconc: TDataSetProvider
    DataSet = QRYInconc
    Constraints = True
    Left = 120
    Top = 320
  end
  object cdsIncons: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'FACULT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LICENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ASSIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CED'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAOASSOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ATIVOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'APOSE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PENSI'
        ParamType = ptUnknown
      end>
    ProviderName = 'DspInconc'
    Left = 181
    Top = 318
    object strngfldInconsMATRICULA: TStringField
      DisplayLabel = 'Matricula'
      DisplayWidth = 13
      FieldName = 'MATRICULA'
      Size = 13
    end
    object strngfldInconsNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'NOME'
      Size = 60
    end
    object strngfldInconsLOGRADOURO: TStringField
      DisplayLabel = 'Endereço~Residencial'
      DisplayWidth = 30
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object strngfldInconsBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 20
      FieldName = 'BAIRRO'
    end
    object strngfldInconsCIDADE: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 20
      FieldName = 'CIDADE'
    end
    object strngfldInconsCEP: TStringField
      DisplayWidth = 8
      FieldName = 'CEP'
      Size = 8
    end
    object strngfldInconsUF: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 3
      FieldName = 'UF'
      FixedChar = True
      Size = 3
    end
    object strngfldInconsCOD_LOTACAO: TStringField
      DisplayLabel = 'Código Unid Lotação'
      DisplayWidth = 15
      FieldName = 'COD_LOTACAO'
      Visible = False
      Size = 15
    end
    object strngfldInconsNOME_LOTACAO: TStringField
      DisplayLabel = 'Nome Unid~Lotação'
      DisplayWidth = 30
      FieldName = 'NOME_LOTACAO'
      Size = 60
    end
    object strngfldInconsEND_LOTACAO: TStringField
      DisplayLabel = 'Endereço~Lotação'
      DisplayWidth = 30
      FieldName = 'END_LOTACAO'
      Size = 60
    end
    object strngfldInconsCIDADE_LOTACAO: TStringField
      DisplayLabel = 'Cidade~Lotação'
      DisplayWidth = 30
      FieldName = 'CIDADE_LOTACAO'
      Size = 50
    end
    object strngfldInconsUF_LOTACAO: TStringField
      DisplayLabel = 'Estado~Lotação'
      DisplayWidth = 3
      FieldName = 'UF_LOTACAO'
      Size = 3
    end
    object strngfldInconsOBS: TStringField
      DisplayLabel = 'Observação'
      DisplayWidth = 40
      FieldName = 'OBS'
      Size = 27
    end
    object cdsInconsATUALIZAR: TFloatField
      DisplayWidth = 10
      FieldName = 'ATUALIZAR'
      Visible = False
    end
    object strngfldInconsNUMDOCUMENTO: TStringField
      DisplayWidth = 18
      FieldName = 'NUMDOCUMENTO'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object cdsInconsIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object cdsInconsIDENDERECO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDENDERECO'
      Visible = False
    end
    object strngfldInconsNUMERO: TStringField
      DisplayWidth = 8
      FieldName = 'NUMERO'
      Visible = False
      Size = 8
    end
    object strngfldInconsCOMERCIAL: TStringField
      DisplayWidth = 1
      FieldName = 'COMERCIAL'
      Visible = False
      Size = 1
    end
    object strngfldInconsCOMPLEMENTO: TStringField
      DisplayWidth = 20
      FieldName = 'COMPLEMENTO'
      Visible = False
    end
  end
  object DSInconc: TwwDataSource
    DataSet = cdsIncons
    Left = 235
    Top = 323
  end
  object QRYInconcaux: TwwQuery
    CachedUpdates = True
    OnNewRecord = qryDSNewRecord
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT   Idendereco,'
      '       MATRICULA,'
      '       NOME,'
      '       LOGRADOURO,'
      '       NUMERO,'
      '       COMERCIAL,'
      '       COMPLEMENTO,'
      '       BAIRRO,'
      '       CEP,'
      '       CIDADE,'
      '       UF,'
      '       NUMDOCUMENTO,'
      '       IDPESSOA,'
      '       COD_LOTACAO,'
      '       NOME_LOTACAO,'
      '       END_LOTACAO,'
      '       CIDADE_LOTACAO,'
      '       UF_LOTACAO,'
      
        '       substr(decode(UF,null,'#39', UF'#39')||decode(CIDADE,null,'#39', CIDA' +
        'DE'#39')||decode(Logradouro,null,'#39', Logradouro'#39')||decode(CEP,null,'#39',' +
        ' CEP'#39'),3,50) OBS,'
      '       0 ATUALIZAR'
      'FROM ('
      '-- FACULTATIVOS'
      '      SELECT  EL.MATRICULA,'
      '              EP.Idendereco,'
      '              P.NOME,'
      '              EP.LOGRADOURO,'
      '              DECODE (EP.NUMERO,NULL,'#39'S/N'#39',EP.NUMERO) AS NUMERO,'
      '              DECODE (EP.TIPOENDERECO,'#39'R'#39','#39'N'#39','#39'S'#39') AS COMERCIAL,'
      '              EP.COMPLEMENTO,'
      '              EP.BAIRRO,'
      '              EP.CEP,'
      '              /*SIG 33967 - início */'
      '              --UPPER(EP.CIDADE) CIDADE,               '
      '              --EP.CODESTADO UF,'
      '              UPPER(NVL(C.NOME,EP.CIDADE)) CIDADE,   '
      '              NVL(C.UF,EP.CODESTADO) UF,'
      '              /*SIG 33967 - Término */'
      '              P.NUMDOCUMENTO,'
      '              P.IDPESSOA,'
      '              '#39#39' COD_LOTACAO,'
      '              '#39#39' NOME_LOTACAO,'
      '              '#39#39' END_LOTACAO,'
      '              '#39#39' CIDADE_LOTACAO,'
      '              '#39#39' UF_LOTACAO'
      '      FROM    PESSOA P,'
      '              ELEGPATRO EL,'
      '              PARTPREVPLAN PP,'
      '              PESSOAFISICA PF,'
      '              ENDPESS EP,'
      '              CIDADES C -- SIG 33967'
      ''
      '      WHERE  (EP.LOGRADOURO is null or'
      '              EP.CEP is  null or'
      '              -- EP.CIDADE is null)  and -- SIG 33967'
      '              NVL(C.NOME,EP.CIDADE) is null) and -- SIG 33967 '
      '              EP.IDCIDADES = C.IDCIDADES(+) AND   -- SIG 33967'
      '              P.IDPESSOA = EL.IDPESSOA AND'
      '              P.IDPESSOA = PP.IDPESSOA AND'
      '              P.IDPESSOA   = PF.IDPESSOA AND'
      '              P.IDPESSOA   = EP.IDPESSOA (+) AND'
      '              PP.DATACANCELAMENTO IS NULL AND'
      '              PF.DATAMORTE IS NULL AND'
      '              PP.IDPESSJUR = 91008 AND'
      '              PP.IDSITPART IN (2,7,3,6,41,58,63,65) AND'
      '              P.TIPO = '#39'F'#39' AND'
      
        '              EP.IDENDERECO = NVL(P.IDENDCORRESP,(SELECT  MAX(EN' +
        '.IDENDERECO)'
      
        '                                                    FROM  ENDPES' +
        'S EN'
      
        '                                                    WHERE EN.IDP' +
        'ESSOA(+) = EP.IDPESSOA)) AND'
      '              PP.IDPLANOPREV = (SELECT MAX(PART.IDPLANOPREV)'
      '                                  FROM PARTPREVPLAN PART'
      '                                 WHERE PART.IDSITPLANOPREV <> 3'
      
        '                                   AND PART.IDPESSOA = EL.IDPESS' +
        'OA'
      
        '                                   AND PART.IDPESSJUR = EL.IDPES' +
        'SJUR) AND'
      '              NOT EXISTS (SELECT 1'
      '                          FROM  BENEFBFCIARIO BF'
      
        '                          WHERE BF.IDPESSOA         = EL.IDPESSO' +
        'A'
      
        '                          AND   BF.IDTITULAR        = EL.IDPESSO' +
        'A'
      '                          AND   BF.FONTEPAGADORA    = 1'
      '                          AND   BF.IDTPPAGTOBENEFIC = 1'
      '                          AND   BF.IDSITBENEFICIO   = 1)'
      '                          AND'
      ''
      '             :FACULT = '#39'S'#39
      ''
      ''
      '      UNION'
      '      -- LICENCIADOS'
      '      SELECT  EL.MATRICULA,'
      '              EP.Idendereco,'
      '              P.NOME,'
      '              EP.LOGRADOURO,'
      '              DECODE (EP.NUMERO,NULL,'#39'S/N'#39',EP.NUMERO) AS NUMERO,'
      '              DECODE (EP.TIPOENDERECO,'#39'R'#39','#39'N'#39','#39'S'#39') AS COMERCIAL,'
      '              EP.COMPLEMENTO,'
      '              EP.BAIRRO,'
      '              EP.CEP,'
      '              /*SIG 33967 - início */'
      '              --UPPER(EP.CIDADE) CIDADE,               '
      '              --EP.CODESTADO UF,'
      '              UPPER(NVL(C.NOME,EP.CIDADE)) CIDADE,   '
      '              NVL(C.UF,EP.CODESTADO) UF,'
      '              /*SIG 33967 - Término */'
      '              P.NUMDOCUMENTO,'
      '              P.IDPESSOA,'
      '              '#39#39' COD_LOTACAO,'
      '              '#39#39' NOME_LOTACAO,'
      '              '#39#39' END_LOTACAO,'
      '              '#39#39' CIDADE_LOTACAO,'
      '              '#39#39' UF_LOTACAO'
      '      FROM PESSOA P,'
      '           ELEGPATRO EL,'
      '           SITFUNC SF,'
      '           PARTPREVPLAN PP,'
      '           PESSOAFISICA PF,'
      '           ENDPESS EP,'
      '           CIDADES C -- SIG 33967'
      '      WHERE'
      '          (EP.LOGRADOURO is null or'
      '              EP.CEP is  null or'
      '             -- EP.CIDADE is null)  and -- SIG 33967'
      '             NVL(C.NOME,EP.CIDADE) is null) and -- SIG 33967'
      '           EP.IDCIDADES = C.IDCIDADES(+) AND   -- SIG 33967'
      '           P.IDPESSOA = EL.IDPESSOA AND'
      '           P.IDPESSOA = PP.IDPESSOA AND'
      '           P.IDPESSOA = PF.IDPESSOA AND'
      '           P.IDPESSOA = EP.IDPESSOA (+) AND'
      '           EL.IDSITFUNC = SF.IDSITFUNC AND'
      '           PP.DATACANCELAMENTO IS NULL AND'
      '           PF.DATAMORTE IS NULL AND'
      '           PP.DATACANCELAMENTO IS NULL AND'
      '           PP.IDSITPLANOPREV = 1 AND'
      '           PP.FLGDESATIVADO = 0 AND'
      
        '           EL.IDSITFUNC IN (3,5,6,22,40,41,42,43,44,45,47,48,49,' +
        '51,52,54,55,65,66,67,69,70,73) AND'
      '           PP.IDPESSJUR = 91008 AND'
      '           P.TIPO = '#39'F'#39' AND'
      
        '           EP.IDENDERECO = NVL(P.IDENDCORRESP,(SELECT MAX(EN.IDE' +
        'NDERECO) FROM ENDPESS EN WHERE'
      
        '                                                  EN.IDPESSOA(+)' +
        ' = EL.IDPESSOA)) AND'
      
        '           PP.IDPLANOPREV = (SELECT MAX(PART.IDPLANOPREV) FROM P' +
        'ARTPREVPLAN PART'
      
        '                                         WHERE PART.IDSITPLANOPR' +
        'EV <> 3'
      
        '                                         AND   PART.IDPESSOA = E' +
        'L.IDPESSOA'
      
        '                                         AND   PART.IDPESSJUR = ' +
        'EL.IDPESSJUR) AND'
      '            NOT EXISTS (SELECT 1'
      '                        FROM BENEFBFCIARIO BF'
      '                        WHERE BF.IDPESSOA = EL.IDPESSOA'
      '                        AND   BF.IDTITULAR = EL.IDPESSOA'
      '                        AND   BF.FONTEPAGADORA = 1'
      '                        AND   BF.IDTPPAGTOBENEFIC = 1'
      '                        AND   BF.IDSITBENEFICIO = 1)'
      ''
      '                        AND'
      '           :LICENC = '#39'S'#39
      ''
      '      UNION'
      ''
      '      -- RELATÓRIO DE ASSISTIDOS'
      ''
      '      SELECT  EL.MATRICULA,'
      '              EP.Idendereco,'
      '              P.NOME,'
      '              EP.LOGRADOURO,'
      '              DECODE (EP.NUMERO,NULL,'#39'S/N'#39',EP.NUMERO) AS NUMERO,'
      '              DECODE (EP.TIPOENDERECO,'#39'R'#39','#39'N'#39','#39'S'#39') AS COMERCIAL,'
      '              EP.COMPLEMENTO,'
      '              EP.BAIRRO,'
      '              EP.CEP,'
      '              /*SIG 33967 - início */'
      '              --UPPER(EP.CIDADE) CIDADE,               '
      '              --EP.CODESTADO UF,'
      '              UPPER(NVL(C.NOME,EP.CIDADE)) CIDADE,   '
      '              NVL(C.UF,EP.CODESTADO) UF,'
      '              /*SIG 33967 - Término */'
      '              P.NUMDOCUMENTO,'
      '              P.IDPESSOA,'
      '              '#39#39' COD_LOTACAO,'
      '              '#39#39' NOME_LOTACAO,'
      '              '#39#39' END_LOTACAO,'
      '              '#39#39' CIDADE_LOTACAO,'
      '              '#39#39' UF_LOTACAO'
      '       FROM   ELEGPATRO EL,'
      '               PESSOA P,'
      '              DEPENTIT DP,'
      '              BENEFBFCIARIO BF,'
      '              PESSOAFISICA PF,'
      '              ENDPESS EP,'
      '              CIDADES C -- SIG 33967'
      ''
      '       WHERE  (EP.LOGRADOURO is null or'
      '              EP.CEP is  null or'
      '              -- EP.CIDADE is null)  and -- SIG 33967'
      '              NVL(C.NOME,EP.CIDADE) is null) and -- SIG 33967'
      '              EP.IDCIDADES = C.IDCIDADES(+) AND   -- SIG 33967'
      '              EL.IDPESSOA = P.IDPESSOA       AND'
      '              DP.IDPESSOA = P.IDPESSOA       AND'
      '              DP.IDPESSOA = BF.IDPESSOA      AND'
      '              DP.IDPESSOA = PF.IDPESSOA      AND'
      '              DP.IDPESSOA = EP.IDPESSOA   (+)AND'
      '              BF.IDSITBENEFICIO   = 1 AND'
      '              BF.IDTPPAGTOBENEFIC = 1 AND'
      '              BF.FONTEPAGADORA    = 1 AND'
      
        '              EP.IDENDERECO       = NVL(P.IDENDCORRESP,(SELECT M' +
        'AX(EN.IDENDERECO)'
      
        '                                                        FROM   E' +
        'NDPESS EN'
      
        '                                                        WHERE  E' +
        'N.IDPESSOA(+) = DP.IDPESSOA))'
      ''
      '                                                         AND'
      '             :ASSIS = '#39'S'#39
      ''
      '     GROUP BY EL.MATRICULA,'
      '              EP.Idendereco,'
      '              P.NOME,'
      '              EP.LOGRADOURO,'
      '              EP.NUMERO,'
      '              EP.TIPOENDERECO,'
      '              EP.COMPLEMENTO,'
      '              EP.BAIRRO,'
      '              EP.CEP,'
      '              /*SIG 33967 - início */'
      '              --EP.CIDADE,               '
      '              --EP.CODESTADO,'
      '              NVL(C.NOME,EP.CIDADE),   '
      '              NVL(C.UF,EP.CODESTADO),'
      '              /*SIG 33967 - Término */'
      '              P.NUMDOCUMENTO,'
      '              P.IDPESSOA'
      ''
      '   UNION'
      ''
      '      -- RELATÓRIO DE CEDIDOS'
      ''
      '      SELECT'
      '              EL.MATRICULA,'
      '              EP.Idendereco,'
      '              P.NOME,'
      '              EP.LOGRADOURO,'
      '              DECODE (EP.NUMERO,NULL,'#39'S/N'#39',EP.NUMERO) AS NUMERO,'
      
        '              DECODE (EP.TIPOENDERECO,'#39'R'#39','#39'N'#39','#39'S'#39')    AS COMERCI' +
        'AL,'
      '              EP.COMPLEMENTO,'
      '              EP.BAIRRO,'
      '              EP.CEP,'
      '              /*SIG 33967 - início */'
      '              --UPPER(EP.CIDADE) CIDADE,               '
      '              --EP.CODESTADO UF,'
      '              UPPER(NVL(C.NOME,EP.CIDADE)) CIDADE,   '
      '              NVL(C.UF,EP.CODESTADO) UF,'
      '              /*SIG 33967 - Término */'
      '              P.NUMDOCUMENTO,'
      '              P.IDPESSOA,'
      '              '#39#39' COD_LOTACAO,'
      '              '#39#39' NOME_LOTACAO,'
      '              '#39#39' END_LOTACAO,'
      '              '#39#39' CIDADE_LOTACAO,'
      '              '#39#39' UF_LOTACAO'
      ''
      '      FROM     PESSOA P,'
      '               ELEGPATRO EL,'
      '               SITFUNC SF,'
      '               PARTPREVPLAN PP,'
      '               PESSOAFISICA PF,'
      '               ENDPESS EP,'
      '               CIDADES C -- SIG 33967'
      ''
      '      WHERE'
      '             (EP.LOGRADOURO is null or'
      '              EP.CEP is  null or'
      '              -- EP.CIDADE is null)  and -- SIG 33967'
      '              NVL(C.NOME,EP.CIDADE) is null) and -- SIG 33967'
      '              EP.IDCIDADES = C.IDCIDADES(+) AND   -- SIG 33967'
      '               P.IDPESSOA = EL.IDPESSOA AND'
      '               P.IDPESSOA = PP.IDPESSOA AND'
      '               P.IDPESSOA = PF.IDPESSOA AND'
      '               P.IDPESSOA = EP.IDPESSOA (+) AND'
      '               EL.IDSITFUNC = SF.IDSITFUNC AND'
      '               PP.DATACANCELAMENTO IS NULL AND'
      '               PF.DATAMORTE IS NULL AND'
      '               PP.DATACANCELAMENTO IS NULL AND'
      '               PP.IDSITPLANOPREV = 1 AND'
      '               PP.FLGDESATIVADO = 0 AND'
      '               PP.IDPESSJUR = 91008 AND'
      '               P.TIPO = '#39'F'#39' AND'
      
        '               EP.IDENDERECO = NVL(P.IDENDCORRESP,(SELECT MAX(EN' +
        '.IDENDERECO) FROM ENDPESS EN WHERE'
      
        '                                                      EN.IDPESSO' +
        'A(+) = EL.IDPESSOA)) AND'
      
        '               PP.IDPLANOPREV = (SELECT MAX(PART.IDPLANOPREV) FR' +
        'OM PARTPREVPLAN PART'
      
        '                                             WHERE PART.IDSITPLA' +
        'NOPREV <> 3'
      
        '                                             AND   PART.IDPESSOA' +
        ' = EL.IDPESSOA'
      
        '                                             AND   PART.IDPESSJU' +
        'R = EL.IDPESSJUR) AND'
      '               NOT EXISTS (SELECT 1 FROM BENEFBFCIARIO BF'
      
        '                                  WHERE BF.IDPESSOA         = EL' +
        '.IDPESSOA'
      
        '                                  AND   BF.IDTITULAR        = EL' +
        '.IDPESSOA'
      '                                  AND   BF.FONTEPAGADORA    = 1'
      '                                  AND   BF.IDTPPAGTOBENEFIC = 1'
      '                                  AND   BF.IDSITBENEFICIO   = 1)'
      '               AND EXISTS ( SELECT 1'
      '                            FROM  HISTRUBSAL HS'
      '                            WHERE HS.IDPESSOA = P.IDPESSOA'
      
        '                            AND   HS.MESCOBRANCA = TO_CHAR(ADD_M' +
        'ONTHS(SYSDATE, -1), '#39'YYYY/MM'#39')'
      
        '                            AND   HS.IDRUBRICA IN ('#39'35575'#39','#39'3493' +
        '6'#39','#39'35590'#39','#39'35607'#39','#39'39435'#39'))'
      ''
      '                            AND'
      '             :CED = '#39'S'#39
      ''
      '      UNION'
      '      -- NAO ASSOCIADOS'
      '      SELECT  E.MATRICULA,'
      '              ENDP.Idendereco,'
      '              P.NOME,'
      '              ENDP.LOGRADOURO,'
      
        '              DECODE (ENDP.NUMERO,NULL,'#39'S/N'#39',ENDP.NUMERO) AS NUM' +
        'ERO,'
      
        '              DECODE (ENDP.TIPOENDERECO,'#39'R'#39','#39'N'#39','#39'S'#39') AS COMERCIA' +
        'L,'
      '              ENDP.COMPLEMENTO,'
      '              ENDP.BAIRRO,'
      '              ENDP.CEP,'
      '              /*SIG 33967 - início */'
      '              --UPPER(ENDP.CIDADE) CIDADE,               '
      '              --ENDP.CODESTADO UF,'
      '              UPPER(NVL(CENDP.NOME,ENDP.CIDADE)) CIDADE,   '
      '              NVL(CENDP.UF,ENDP.CODESTADO) UF,'
      '              /*SIG 33967 - Término */'
      '              P.NUMDOCUMENTO,'
      '              P.IDPESSOA,'
      '              F.NUMFILIAL COD_LOTACAO,'
      '              P1.NOME NOME_LOTACAO,'
      '              EP.LOGRADOURO END_LOTACAO,'
      '              UPPER(C.NOME) CIDADE_LOTACAO,'
      '              C.UF UF_LOTACAO'
      '      FROM'
      
        '              ELEGPATRO E, FILIALPESSOA F, PARTPREVPLAN PP, PESS' +
        'OA P1, SITFUNC S, PESSOA P,'
      '              SITPART SP, ENDPESS EP, ENDPESS ENDP, CIDADES C,'
      '              CIDADES CENDP -- SIG 33967'
      ''
      '      WHERE'
      '             (ENDP.LOGRADOURO is null or'
      '              ENDP.CEP is  null or'
      '              --ENDP.CIDADE is null)  and    -- SIG 33967 '
      
        '              NVL(CENDP.NOME,ENDP.CIDADE) is null)  and -- SIG 3' +
        '3967 '
      
        '              ENDP.IDCIDADES = CENDP.IDCIDADES(+) AND   -- SIG 3' +
        '3967 '
      
        '              ENDP.IDPESSOA = P.IDPESSOA AND            -- SIG 3' +
        '3967'
      
        '              ENDP.IDENDERECO    = (SELECT MAX(ENDP1.IDENDERECO)' +
        ' FROM ENDPESS ENDP1 WHERE ENDP1.IDPESSOA = P.IDPESSOA ) AND'
      '              E.IDPESSOA = P.IDPESSOA        AND'
      '              E.IDPESSOA = PP.IDPESSOA    (+)AND'
      '              PP.IDPLANOPREV IS NULL         AND'
      '              E.IDESTAB = F.IDFILIALPESSOA   AND'
      '              F.IDFILIALPESSOA = P1.IDPESSOA AND'
      '              F.IDFILIALPESSOA = EP.IDPESSOA AND'
      
        '              EP.IDENDERECO    = (SELECT MAX(END1.IDENDERECO) FR' +
        'OM ENDPESS END1 WHERE END1.IDPESSOA = F.IDFILIALPESSOA) AND'
      '              E.IDSITFUNC      = S.IDSITFUNC AND'
      '              S.TIPOSIT        = '#39'A'#39'         AND'
      '              E.IDPESSJUR      = 91008       AND'
      '              E.DATADEMISSAO IS NULL         AND'
      '              PP.IDSITPART     = SP.IDSITPART (+) AND'
      
        '              (SP.FLGINTERNO   = '#39'AT'#39' OR SP.FLGINTERNO = '#39'MP'#39' OR' +
        ' SP.FLGINTERNO IS NULL)  AND'
      
        '              (PP.IDPLANOPREV IS NULL  OR  (PP.IDPLANOPREV IS NO' +
        'T NULL AND PP.FLGDESATIVADO =1))'
      '               AND'
      '              EP.IDCIDADES = C.IDCIDADES(+)  AND'
      ''
      '              :NAOASSOC = '#39'S'#39
      ''
      '      GROUP BY E.MATRICULA,'
      '               ENDP.Idendereco,'
      '               P.NOME,'
      '               ENDP.LOGRADOURO,'
      '               ENDP.NUMERO,'
      '               ENDP.TIPOENDERECO ,'
      '               ENDP.COMPLEMENTO,'
      '               ENDP.BAIRRO,'
      '               ENDP.CEP,'
      '               /*SIG 33967 - início */'
      '               --ENDP.CIDADE,'
      '               --ENDP.CODESTADO ,'
      '               NVL(CENDP.NOME,ENDP.CIDADE),   '
      '               NVL(CENDP.UF,ENDP.CODESTADO),'
      '               /*SIG 33967 - Término */'
      '               P.NUMDOCUMENTO,'
      '               P.IDPESSOA,'
      '               F.NUMFILIAL,'
      '               P1.NOME,'
      '               EP.LOGRADOURO,'
      '               C.NOME,'
      '               C.UF'
      ''
      '      UNION'
      '       -- ATIVOS'
      'SELECT /*RULE*/'
      '       DISTINCT'
      '       EL.MATRICULA,'
      '       E.Idendereco,'
      '       P.NOME,'
      '       E.LOGRADOURO,'
      '       DECODE (E.NUMERO,NULL,'#39'S/N'#39',E.NUMERO) AS NUMERO,'
      '       DECODE (E.TIPOENDERECO,'#39'R'#39','#39'N'#39','#39'S'#39') AS COMERCIAL,'
      '       E.COMPLEMENTO,'
      '       E.BAIRRO,'
      '       E.CEP,'
      '       /*SIG 33967 - início */'
      '       --UPPER(E.CIDADE) CIDADE,               '
      '       --E.CODESTADO UF,'
      '       UPPER(NVL(C.NOME,E.CIDADE)) CIDADE,   '
      '       NVL(C.UF,E.CODESTADO) UF,'
      '       /*SIG 33967 - Término */'
      '       P.NUMDOCUMENTO,'
      '       P.IDPESSOA,'
      '       FP.NUMFILIAL AS COD_LOTACAO,'
      '       PFF.NOME AS NOME_LOTACAO,'
      '       EP.LOGRADOURO AS END_LOTACAO,'
      '       UPPER(EP.CIDADE) AS CIDADE_LOTACAO,'
      '       EP.CODESTADO AS UF_LOTACAO'
      '  FROM (SELECT DISTINCT BFC.IDPESSOA'
      '          FROM BENEFBFCIARIO BFC) BF'
      '        RIGHT JOIN PARTPREVPLAN PP ON PP.IDPESSOA = BF.IDPESSOA'
      '        JOIN ELEGPATRO EL          ON EL.IDPESSOA = PP.IDPESSOA'
      
        '        JOIN PESSOA P               ON  P.IDPESSOA  = PP.IDPESSO' +
        'A'
      
        '        JOIN ENDPESS E              ON  E.IDPESSOA  = PP.IDPESSO' +
        'A'
      
        '        JOIN PESSOAFISICA PF        ON  PF.IDPESSOA = PP.IDPESSO' +
        'A'
      
        '        JOIN FILIALPESSOA FP        ON  FP.IDFILIALPESSOA = EL.I' +
        'DESTAB'
      
        '        JOIN PESSOA PFF             ON  PFF.IDPESSOA      = FP.I' +
        'DFILIALPESSOA'
      
        '        JOIN ENDPESS EP             ON  EP.IDPESSOA       = FP.I' +
        'DFILIALPESSOA'
      
        '        LEFT JOIN CIDADES C         ON  C.IDCIDADES = E.IDCIDADE' +
        'S  -- SIG 33967 '
      
        '        JOIN   PESSOA PARAMETRO ON  PARAMETRO.IDPESSOA = P.IDPES' +
        'SOA'
      'WHERE'
      '      (E.LOGRADOURO is null or'
      '       E.CEP is  null or'
      '       -- E.CIDADE is null)  and -- SIG 33967'
      '       NVL(C.NOME,E.CIDADE) is null) and -- SIG 33967 '
      '      PP.IDSITPART IN (1,2,33) AND'
      '      P.TIPO = '#39'F'#39'             AND'
      '      PP.DATACANCELAMENTO IS NULL AND'
      '      PF.DATAMORTE        IS NULL AND'
      
        '      E.IDENDERECO  = (SELECT MAX (EE.IDENDERECO) FROM ENDPESS E' +
        'E WHERE EE.IDPESSOA = PP.IDPESSOA)  AND'
      
        '      EP.IDENDERECO = (SELECT MAX (EEE.IDENDERECO) FROM ENDPESS ' +
        'EEE WHERE EEE.IDPESSOA = FP.IDFILIALPESSOA) AND'
      '      :ATIVOS = '#39'S'#39
      ''
      'UNION      '
      '      '
      '       -- APOSENTADORIA'
      'SELECT '
      '       DISTINCT'
      '       EL.MATRICULA,'
      '       E.Idendereco,'
      '       P.NOME,'
      '       E.LOGRADOURO,'
      '       DECODE (E.NUMERO,NULL,'#39'S/N'#39',E.NUMERO) AS NUMERO,'
      '       DECODE (E.TIPOENDERECO,'#39'R'#39','#39'N'#39','#39'S'#39') AS COMERCIAL,'
      '       E.COMPLEMENTO,'
      '       E.BAIRRO,'
      '       E.CEP,'
      '       /*SIG 33967 - início */'
      '       --UPPER(E.CIDADE) CIDADE,               '
      '       --E.CODESTADO UF,'
      '       UPPER(NVL(C.NOME,E.CIDADE)) CIDADE,   '
      '       NVL(C.UF,E.CODESTADO) UF,'
      '       /*SIG 33967 - Término */'
      '       P.NUMDOCUMENTO,'
      '       P.IDPESSOA,'
      '       FP.NUMFILIAL AS COD_LOTACAO,'
      '       PFF.NOME AS NOME_LOTACAO,'
      '       EP.LOGRADOURO AS END_LOTACAO,'
      '       UPPER(EP.CIDADE) AS CIDADE_LOTACAO,'
      '       EP.CODESTADO AS UF_LOTACAO'
      '  FROM (SELECT DISTINCT BFC.IDPESSOA'
      '          FROM BENEFBFCIARIO BFC) BF'
      '        RIGHT JOIN PARTPREVPLAN PP ON PP.IDPESSOA = BF.IDPESSOA'
      '        JOIN ELEGPATRO EL          ON EL.IDPESSOA = PP.IDPESSOA'
      
        '        JOIN PESSOA P               ON  P.IDPESSOA  = PP.IDPESSO' +
        'A'
      
        '        JOIN ENDPESS E              ON  E.IDPESSOA  = PP.IDPESSO' +
        'A'
      
        '        JOIN PESSOAFISICA PF        ON  PF.IDPESSOA = PP.IDPESSO' +
        'A'
      
        '        JOIN FILIALPESSOA FP        ON  FP.IDFILIALPESSOA = EL.I' +
        'DESTAB'
      
        '        JOIN PESSOA PFF             ON  PFF.IDPESSOA      = FP.I' +
        'DFILIALPESSOA'
      
        '        JOIN ENDPESS EP             ON  EP.IDPESSOA       = FP.I' +
        'DFILIALPESSOA'
      
        '        LEFT JOIN CIDADES C         ON  C.IDCIDADES       = E.ID' +
        'CIDADES  -- SIG 33967'
      
        '        JOIN   PESSOA PARAMETRO ON  PARAMETRO.IDPESSOA = P.IDPES' +
        'SOA'
      'WHERE'
      '      (E.LOGRADOURO is null or'
      '       E.CEP is  null or'
      '       -- E.CIDADE is null)  and -- SIG 33967'
      '       NVL(C.NOME,E.CIDADE) is null) and  -- SIG 33967 '
      '      PP.IDSITPART IN (4,11,12) AND'
      '      P.TIPO = '#39'F'#39'             AND'
      '      PP.DATACANCELAMENTO IS NULL AND'
      '      PF.DATAMORTE        IS NULL AND'
      
        '      E.IDENDERECO  = (SELECT MAX (EE.IDENDERECO) FROM ENDPESS E' +
        'E WHERE EE.IDPESSOA = PP.IDPESSOA)  AND'
      
        '      EP.IDENDERECO = (SELECT MAX (EEE.IDENDERECO) FROM ENDPESS ' +
        'EEE WHERE EEE.IDPESSOA = FP.IDFILIALPESSOA) AND'
      '      :APOSE = '#39'S'#39'      '
      '      '
      'UNION      '
      '      '
      '       -- PENSIONISTAS'
      'SELECT '
      '       DISTINCT'
      '       EL.MATRICULA,'
      '       E.Idendereco,'
      '       P.NOME,'
      '       E.LOGRADOURO,'
      '       DECODE (E.NUMERO,NULL,'#39'S/N'#39',E.NUMERO) AS NUMERO,'
      '       DECODE (E.TIPOENDERECO,'#39'R'#39','#39'N'#39','#39'S'#39') AS COMERCIAL,'
      '       E.COMPLEMENTO,'
      '       E.BAIRRO,'
      '       E.CEP,'
      '       /*SIG 33967 - início */'
      '       --UPPER(E.CIDADE) CIDADE,               '
      '       --E.CODESTADO UF,'
      '       UPPER(NVL(C.NOME,E.CIDADE)) CIDADE,   '
      '       NVL(C.UF,E.CODESTADO) UF,'
      '       /*SIG 33967 - Término */'
      '       P.NUMDOCUMENTO,'
      '       P.IDPESSOA,'
      '       FP.NUMFILIAL AS COD_LOTACAO,'
      '       PFF.NOME AS NOME_LOTACAO,'
      '       EP.LOGRADOURO AS END_LOTACAO,'
      '       UPPER(EP.CIDADE) AS CIDADE_LOTACAO,'
      '       EP.CODESTADO AS UF_LOTACAO'
      '  FROM (SELECT DISTINCT BFC.IDPESSOA'
      '          FROM BENEFBFCIARIO BFC) BF'
      '        RIGHT JOIN DEPENTIT DP ON DP.IDPESSOA = BF.IDPESSOA'
      '        JOIN ELEGPATRO EL          ON EL.IDPESSOA = DP.IDPESSOA'
      
        '        JOIN PESSOA P               ON  P.IDPESSOA  = DP.IDPESSO' +
        'A'
      
        '        JOIN ENDPESS E              ON  E.IDPESSOA  = DP.IDPESSO' +
        'A'
      
        '        JOIN PESSOAFISICA PF        ON  PF.IDPESSOA = DP.IDPESSO' +
        'A'
      
        '        JOIN FILIALPESSOA FP        ON  FP.IDFILIALPESSOA = EL.I' +
        'DESTAB'
      
        '        JOIN PESSOA PFF             ON  PFF.IDPESSOA      = FP.I' +
        'DFILIALPESSOA'
      
        '        JOIN ENDPESS EP             ON  EP.IDPESSOA       = FP.I' +
        'DFILIALPESSOA'
      
        '        LEFT JOIN CIDADES C         ON  C.IDCIDADES       = E.ID' +
        'CIDADES  -- SIG 33967 '
      
        '        JOIN   PESSOA PARAMETRO ON  PARAMETRO.IDPESSOA = P.IDPES' +
        'SOA'
      'WHERE'
      '      (E.LOGRADOURO is null or'
      '       E.CEP is  null or'
      '       -- E.CIDADE is null)  and -- SIG 33967'
      '       NVL(C.NOME,E.CIDADE) is null) and -- SIG 33967 '
      '      DP.IDDEPENDENCIA IN ('#39'FIL'#39','#39'COM'#39') AND'
      '      P.TIPO = '#39'F'#39'             AND'
      '      PF.DATAMORTE        IS NULL AND'
      
        '      E.IDENDERECO  = (SELECT MAX (EE.IDENDERECO) FROM ENDPESS E' +
        'E WHERE EE.IDPESSOA = DP.IDPESSOA)  AND'
      
        '      EP.IDENDERECO = (SELECT MAX (EEE.IDENDERECO) FROM ENDPESS ' +
        'EEE WHERE EEE.IDPESSOA = FP.IDFILIALPESSOA) AND'
      '      :PENSI = '#39'S'#39'      '
      '      '
      ')')
    ControlType.Strings = (
      'VALOR;CheckBox;S;N')
    ValidateWithMask = True
    Left = 360
    Top = 331
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FACULT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LICENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ASSIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CED'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NAOASSOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ATIVOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'APOSE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PENSI'
        ParamType = ptUnknown
      end>
    object StringField18: TStringField
      DisplayLabel = 'Matricula'
      DisplayWidth = 13
      FieldName = 'MATRICULA'
      Size = 13
    end
    object StringField19: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'NOME'
      Size = 60
    end
    object StringField20: TStringField
      DisplayLabel = 'Endereço~Residencial'
      DisplayWidth = 30
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object StringField21: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 20
      FieldName = 'BAIRRO'
    end
    object StringField22: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 20
      FieldName = 'CIDADE'
    end
    object StringField23: TStringField
      DisplayWidth = 8
      FieldName = 'CEP'
      Size = 8
    end
    object StringField24: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 3
      FieldName = 'UF'
      FixedChar = True
      Size = 3
    end
    object StringField25: TStringField
      DisplayLabel = 'Nome Unid~Lotação'
      DisplayWidth = 30
      FieldName = 'NOME_LOTACAO'
      Size = 60
    end
    object StringField26: TStringField
      DisplayLabel = 'Endereço~Lotação'
      DisplayWidth = 30
      FieldName = 'END_LOTACAO'
      Size = 60
    end
    object StringField27: TStringField
      DisplayLabel = 'Cidade~Lotação'
      DisplayWidth = 30
      FieldName = 'CIDADE_LOTACAO'
      Size = 50
    end
    object StringField28: TStringField
      DisplayLabel = 'Estado~Lotação'
      DisplayWidth = 3
      FieldName = 'UF_LOTACAO'
      Size = 3
    end
    object StringField29: TStringField
      DisplayLabel = 'Observação'
      DisplayWidth = 40
      FieldName = 'OBS'
      Size = 27
    end
    object FloatField2: TFloatField
      DisplayWidth = 10
      FieldName = 'ATUALIZAR'
      Visible = False
    end
    object StringField30: TStringField
      DisplayWidth = 18
      FieldName = 'NUMDOCUMENTO'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object FloatField3: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object StringField32: TStringField
      DisplayWidth = 15
      FieldName = 'COD_LOTACAO'
      Visible = False
      Size = 15
    end
    object FloatField4: TFloatField
      DisplayWidth = 10
      FieldName = 'IDENDERECO'
      Visible = False
    end
    object StringField33: TStringField
      DisplayWidth = 8
      FieldName = 'NUMERO'
      Visible = False
      Size = 8
    end
    object StringField34: TStringField
      DisplayWidth = 1
      FieldName = 'COMERCIAL'
      Visible = False
      Size = 1
    end
    object StringField35: TStringField
      DisplayWidth = 20
      FieldName = 'COMPLEMENTO'
      Visible = False
    end
  end
end
