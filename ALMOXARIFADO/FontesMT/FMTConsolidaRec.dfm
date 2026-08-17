inherited FrmMTConsolidaRec: TFrmMTConsolidaRec
  Left = 127
  Top = 180
  Caption = 'Recebimentos Consolidados'
  ClientHeight = 387
  ClientWidth = 914
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 914
    Height = 348
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 912
      Height = 60
      Align = alTop
      BevelOuter = bvNone
      BevelWidth = 2
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label7: TLabel
        Left = 232
        Top = 8
        Width = 201
        Height = 13
        Caption = 'Grupo de Produtos (caso desejado)'
      end
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 66
        Height = 13
        Caption = 'Data Inicial'
      end
      object Label2: TLabel
        Left = 120
        Top = 8
        Width = 59
        Height = 13
        Caption = 'Data Final'
      end
      object dblcGrupoProd: TwwDBLookupCombo
        Left = 232
        Top = 24
        Width = 225
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCGRUPOPROD'#9'30'#9'Descrição'
          'CODGRUPOPROD'#9'10'#9'Código')
        LookupTable = cdsGrupoProd
        LookupField = 'CODGRUPOPROD'
        Options = [loTitles]
        Style = csDropDownList
        Color = clWhite
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object edDataI: TCMDateTimePicker
        Left = 8
        Top = 24
        Width = 98
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ShowButton = True
        TabOrder = 0
      end
      object EdDataF: TCMDateTimePicker
        Left = 120
        Top = 24
        Width = 97
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ShowButton = True
        TabOrder = 1
      end
      object btnSelecionar: TBitBtn
        Left = 504
        Top = 8
        Width = 98
        Height = 42
        Caption = '&Selecionar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnSelecionarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
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
      object btnImprimir: TBitBtn
        Left = 608
        Top = 8
        Width = 98
        Height = 42
        Caption = '&imprimir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = btnImprimirClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
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
      end
    end
    object grdinvent: TwwDBGrid
      Left = 1
      Top = 61
      Width = 912
      Height = 265
      Hint = 'Click na coluna para ordenar'
      Selected.Strings = (
        'CODARTIGO'#9'14'#9'Código'#9'F'
        'DESCRICAO'#9'35'#9'Descrição'#9'F'
        'QUANT'#9'10'#9'Quantidade'#9'F'
        'CODMEDIDA'#9'5'#9'Unidade'#9'F'
        'VALOR'#9'10'#9'Valor~Unitário'#9'F'
        'DESCGRUPOPROD'#9'35'#9'Grupo~Produto'#9'F'
        'VLRTOTITEM'#9'10'#9'Valor Total~por Item'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      BorderStyle = bsNone
      Color = clWhite
      DataSource = dsResumo
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = True
      UseTFields = False
      OnTitleButtonClick = grdinventTitleButtonClick
      IndicatorColor = icBlack
    end
    object Panel1: TPanel
      Left = 1
      Top = 326
      Width = 912
      Height = 21
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object Label3: TLabel
        Left = 666
        Top = 0
        Width = 105
        Height = 21
        Align = alRight
        Alignment = taRightJustify
        Caption = 'Valor Total Geral :'
      end
      object varTotGeral: TRealEdit
        Left = 771
        Top = 0
        Width = 121
        Height = 21
        Align = alRight
        Alignment = taRightJustify
        Enabled = False
        Lines.Strings = (
          '0,00')
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object Panel3: TPanel
        Left = 892
        Top = 0
        Width = 20
        Height = 21
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 348
    Width = 914
    object lbStatus: TLabel [0]
      Left = 16
      Top = 0
      Width = 191
      Height = 16
      Caption = 'Convertendo quantidades...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    inherited tb97Fundo: TToolbar97
      Left = 565
      DockPos = 565
    end
    object pgBar: TProgressBar
      Left = 16
      Top = 16
      Width = 369
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 1
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 771
    Top = 3
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object cdsGrupoProd: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 80
  end
  object spReq: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '       IT.CODARTIGO,'
      
        '       ( P.DESCPROD || '#39'-'#39' || A.CODTAMANHO || '#39'-'#39' || A.CODCOR ) ' +
        'AS DESCRICAO,'
      '       SUM( IT.QTDERECEBDEVOL ) AS QUANT,'
      '       IT.CODMEDIDA ,'
      '       SUM( IT.VLRUNITARIO ) AS VALOR,'
      '       GP.DESCGRUPOPROD,'
      
        '       ( SUM(IT.VLRUNITARIO) * SUM(IT.QTDERECEBDEVOL) ) AS VLRTO' +
        'TITEM'
      
        '  FROM NFRECEBDEVOL NF INNER JOIN ITENSRECEBDEVOL IT ON IT.IDNFR' +
        'ECEBDEVOL = NF.IDNFRECEBDEVOL'
      
        '                       INNER JOIN ARTIGO A           ON A.CODART' +
        'IGO       = IT.CODARTIGO '
      
        '                       INNER JOIN PRODUTO P          ON P.CODPRO' +
        'DUTO      = A.CODPRODUTO'
      
        '                       INNER JOIN GRUPPROD GP        ON GP.CODGR' +
        'UPOPROD   = P.CODGRUPOPROD'
      
        ' WHERE NF.DATAENTDEVOL BETWEEN TO_DATE(-1,'#39'DD/MM/YYYY'#39') AND TO_D' +
        'ATE(-2,'#39'DD/MM/YYYY'#39')'
      ' GROUP BY '
      '          IT.CODARTIGO,'
      
        '          ( P.DESCPROD || '#39'-'#39' || A.CODTAMANHO || '#39'-'#39' || A.CODCOR' +
        ' ),'
      '          IT.CODMEDIDA, '
      '          GP.DESCGRUPOPROD'
      ''
      ''
      ' ')
    Left = 504
    Top = 192
  end
  object CdsReq: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 144
  end
  object dsResumo: TwwDataSource
    AutoEdit = False
    DataSet = CdsResumo
    Left = 648
    Top = 120
  end
  object CdsResumo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 648
    Top = 72
  end
  object ppResumo: TppReport
    AutoStop = False
    DataPipeline = bdeResumo
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
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 648
    Top = 216
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'bdeResumo'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 10319
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 6350
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 12700
        mmTop = 6350
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 80698
        mmTop = 6350
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 97367
        mmTop = 6085
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Valor Unid.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 112184
        mmTop = 6350
        mmWidth = 14859
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Grupo de Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 128852
        mmTop = 6350
        mmWidth = 23813
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 9525
        mmWidth = 194205
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Valor Total por Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 167746
        mmTop = 6350
        mmWidth = 26194
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Recebimento Consolidado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5842
        mmLeft = 0
        mmTop = 0
        mmWidth = 197115
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CODARTIGO'
        DataPipeline = bdeResumo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeResumo'
        mmHeight = 3175
        mmLeft = 529
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DESCRICAO'
        DataPipeline = bdeResumo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeResumo'
        mmHeight = 3175
        mmLeft = 12700
        mmTop = 265
        mmWidth = 65088
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'QUANT'
        DataPipeline = bdeResumo
        DisplayFormat = '#,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeResumo'
        mmHeight = 3175
        mmLeft = 78581
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VALOR'
        DataPipeline = bdeResumo
        DisplayFormat = '#,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeResumo'
        mmHeight = 3175
        mmLeft = 109802
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'CODMEDIDA'
        DataPipeline = bdeResumo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeResumo'
        mmHeight = 3175
        mmLeft = 99484
        mmTop = 0
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DESCGRUPOPROD'
        DataPipeline = bdeResumo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeResumo'
        mmHeight = 3175
        mmLeft = 128852
        mmTop = 265
        mmWidth = 37042
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VLRTOTITEM'
        DataPipeline = bdeResumo
        DisplayFormat = '#,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeResumo'
        mmHeight = 3260
        mmLeft = 176742
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'VLRTOTITEM'
        DataPipeline = bdeResumo
        DisplayFormat = '#,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeResumo'
        mmHeight = 3969
        mmLeft = 178065
        mmTop = 1058
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Valor Total Geral :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 150284
        mmTop = 1588
        mmWidth = 24077
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 5821
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 7
      end
    end
  end
  object bdeResumo: TppBDEPipeline
    DataSource = dsResumo
    UserName = 'bdeResumo'
    Left = 648
    Top = 168
    object bdeResumoppField1: TppField
      FieldAlias = 'CODARTIGO'
      FieldName = 'CODARTIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object bdeResumoppField2: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object bdeResumoppField6: TppField
      FieldAlias = 'QUANT'
      FieldName = 'QUANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object bdeResumoppField4: TppField
      FieldAlias = 'CODMEDIDA'
      FieldName = 'CODMEDIDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object bdeResumoppField7: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object bdeResumoppField9: TppField
      FieldAlias = 'DESCGRUPOPROD'
      FieldName = 'DESCGRUPOPROD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object bdeResumoppField3: TppField
      FieldAlias = 'VLRTOTITEM'
      FieldName = 'VLRTOTITEM'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
  end
end
