inherited FrmAltPercContribLote: TFrmAltPercContribLote
  Left = 248
  Top = 115
  Caption = 'Alteração de Percentual de Contribuição em Lote'
  ClientHeight = 436
  ClientWidth = 865
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 865
    Height = 350
    object Label1: TLabel
      Left = 387
      Top = 324
      Width = 17
      Height = 13
      Caption = 'De'
    end
    object Label2: TLabel
      Left = 520
      Top = 324
      Width = 19
      Height = 13
      Caption = 'até'
    end
    object GroupBox1: TGroupBox
      Left = 9
      Top = 20
      Width = 856
      Height = 279
      Caption = 'Histórico de Contribuições'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object grdHistorico: TwwDBGrid
        Left = 7
        Top = 17
        Width = 843
        Height = 235
        Selected.Strings = (
          'MATRICULA'#9'10'#9'Matrícula'
          'NOME'#9'40'#9'Nome'
          'PLANO'#9'18'#9'Plano'
          'PERCETUAL_ATUAL'#9'10'#9'Percentual~Atual'
          'PERCENTUAL_NOVO'#9'10'#9'Novo~Percentual'
          'DATA'#9'10'#9'Data~Requerimento'
          'DATACAIXA'#9'10'#9'Data~Caixa'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsHstContrib
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -12
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object btnExcluir: TBitBtn
        Left = 713
        Top = 251
        Width = 71
        Height = 25
        Hint = 'Excluir'
        Caption = 'Excluir'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnExcluirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
          03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
          33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
          0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
          3333333337FFF7F3333333333000003333333333377777333333}
        NumGlyphs = 2
      end
      object btnLimpar: TBitBtn
        Left = 785
        Top = 251
        Width = 66
        Height = 25
        Hint = 'Limpar'
        Caption = 'Limpar'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnLimparClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555FFFFFFFFFF5F5557777777777505555777777777757F55555555555555
          055555555555FF5575F555555550055030555555555775F7F7F55555550FB000
          005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
          B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
          305555577F555557F7F5550E0BFBFB003055557575F55577F7F550EEE0BFB0B0
          305557FF575F5757F7F5000EEE0BFBF03055777FF575FFF7F7F50000EEE00000
          30557777FF577777F7F500000E05555BB05577777F75555777F5500000555550
          3055577777555557F7F555000555555999555577755555577755}
        NumGlyphs = 2
      end
    end
    object GroupBox2: TGroupBox
      Left = 9
      Top = 300
      Width = 288
      Height = 47
      Caption = 'Formatos:'
      TabOrder = 1
      object chkpdf: TCheckBox
        Left = 11
        Top = 21
        Width = 57
        Height = 17
        Caption = 'Pdf'
        TabOrder = 0
      end
      object chktxt: TCheckBox
        Left = 68
        Top = 21
        Width = 49
        Height = 17
        Caption = 'Txt'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object chkXls: TCheckBox
        Left = 126
        Top = 21
        Width = 57
        Height = 17
        Caption = 'Excel'
        TabOrder = 2
      end
      object chkRelatorio: TCheckBox
        Left = 195
        Top = 21
        Width = 82
        Height = 17
        Caption = 'Relatório'
        TabOrder = 3
      end
    end
    object dtInicio: TCMDateTimePicker
      Left = 410
      Top = 317
      Width = 105
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
    object dtFim: TCMDateTimePicker
      Left = 545
      Top = 317
      Width = 105
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
      TabOrder = 3
    end
  end
  inherited Dock972: TDock97
    Width = 865
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 397
    Width = 865
    inherited tb97Fundo: TToolbar97
      Left = 693
      DockPos = 866
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 443
      DockPos = 535
      inherited ToolbarSep971: TToolbarSep97
        Left = 0
      end
      object btnArquivo: TSpeedButton [1]
        Left = 165
        Top = 0
        Width = 81
        Height = 33
        Caption = 'Arquivos'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        OnClick = btnArquivoClick
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 84
      end
      inherited bbtnCancelar: TBitBtn
        Left = 3
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 448
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 579
    Top = 6
  end
  inherited upd: TUpdateSQL
    Left = 611
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Left = 677
    Top = 65534
  end
  inherited ImlPadrao: TImageList
    Left = 497
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 652
    Top = 14
  end
  inherited qry: TwwQuery
    Left = 546
    Top = 65534
  end
  object QryHstContrib: TQuery
    AfterScroll = QryHstContribAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ''
      '1 AS MATRICULA,'
      '1 AS NOME,           '
      '1 AS IDPLANOPREV,    '
      '1 AS PLANO,          '
      '1 AS IDCONTRIBUICAO, '
      '1 AS CONTRIBUICAO,   '
      '1 AS PERCETUAL_ATUAL,'
      '1 AS PERCENTUAL_NOVO,'
      #39'A'#39' AS idROWID,        '
      '1 AS DATA,     '
      '1 AS TIPO_ARQUIVO,   '
      '1 AS IDPESSJUR,'
      '1 DATACAIXA,     '
      '1 AS IDPESSOA     '
      'FROM DUAL'
      ' '
      ' ')
    Left = 160
    Top = 187
  end
  object dsHstContrib: TDataSource
    DataSet = QryHstContrib
    Left = 152
    Top = 235
  end
  object QExportPDF: TQExport3PDF
    DataSet = QryHstContrib
    ExportedFields.Strings = (
      'MATRICULA'
      'DATA'
      'PERCETUAL_ATUAL'
      'PERCENTUAL_NOVO'
      'TIPO_ARQUIVO')
    About = '(Sobre - Planus - Exportação de Dados)'
    _Version = '3.36'
    FileName = 'c:\renato.pdf'
    Options.PageOptions.MarginLeft = 1.17
    Options.PageOptions.MarginRight = 0.57
    Options.PageOptions.MarginTop = 0.78
    Options.PageOptions.MarginBottom = 0.78
    Options.CaptionFont.FontSize = 7
    ColumnsWidth.Strings = (
      '100'
      '200'
      '100'
      '100')
    Left = 760
    Top = 155
  end
  object QExportXLS: TQExport3XLS
    DataSet = QryHstContrib
    ExportedFields.Strings = (
      'MATRICULA'
      'DATA'
      'PERCETUAL_ATUAL'
      'PERCENTUAL_NOVO'
      'TIPO_ARQUIVO')
    About = '(Sobre - Planus - Exportação de Dados)'
    _Version = '3.36'
    FileName = 'c:\renato.xls'
    Options.PageFooter = 'Page &P of &N'
    Options.SheetTitle = 'Sheet 1'
    Options.CaptionsFormat.Font.Style = [xfsBold]
    Options.HyperlinkFormat.Font.Color = clrBlue
    Options.HyperlinkFormat.Font.Underline = fulSingle
    Options.NoteFormat.Alignment.Horizontal = halLeft
    Options.NoteFormat.Alignment.Vertical = valTop
    Options.NoteFormat.Font.Size = 8
    Options.NoteFormat.Font.Style = [xfsBold]
    Options.NoteFormat.Font.Name = 'Tahoma'
    FieldFormats = <>
    StripStyles = <>
    Hyperlinks = <>
    Notes = <>
    Charts = <>
    Sheets = <>
    Pictures = <>
    Images = <>
    Cells = <>
    MergedCells = <>
    Left = 760
    Top = 203
  end
  object ppRelatorio: TppReport
    AutoStop = False
    DataPipeline = DsRelatorio
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 456
    Top = 147
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'DsRelatorio'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 48154
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'FUNCEF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 20
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 8202
        mmLeft = 95515
        mmTop = 8996
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 
          'Listagem de Alterações do Histórico de Percentual de Contribuiçõ' +
          'es (Valor Atual)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 529
        mmTop = 34660
        mmWidth = 151077
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 39158
        mmWidth = 197644
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 529
        mmTop = 43868
        mmWidth = 15494
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 22496
        mmTop = 43868
        mmWidth = 9779
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 94192
        mmTop = 43656
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Percentual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 4233
        mmLeft = 119327
        mmTop = 40217
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 124090
        mmTop = 43656
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Percentual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 4233
        mmLeft = 138907
        mmTop = 39952
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Novo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 144198
        mmTop = 43656
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 162984
        mmTop = 39952
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Requer.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 160867
        mmTop = 43656
        mmWidth = 11853
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label101'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 180182
        mmTop = 40481
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'CAIXA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 178859
        mmTop = 43921
        mmWidth = 9790
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'MATRICULA'
        DataPipeline = DsRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DsRelatorio'
        mmHeight = 3598
        mmLeft = 529
        mmTop = 794
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PARTICIPANTE'
        DataPipeline = DsRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DsRelatorio'
        mmHeight = 3598
        mmLeft = 22490
        mmTop = 794
        mmWidth = 70115
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PLANO'
        DataPipeline = DsRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DsRelatorio'
        mmHeight = 3704
        mmLeft = 93398
        mmTop = 529
        mmWidth = 26194
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'Percentual'
        DataPipeline = DsRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DsRelatorio'
        mmHeight = 3704
        mmLeft = 120121
        mmTop = 529
        mmWidth = 18521
        BandType = 4
      end
      object ppLblDataCaixa: TppLabel
        UserName = 'LblDataCaixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 177271
        mmTop = 265
        mmWidth = 17727
        BandType = 4
      end
      object ppLabel14: TppLabel
        OnPrint = ppLabel14Print
        UserName = 'LblPercentual_old'
        Caption = 'Percentual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3260
        mmLeft = 142061
        mmTop = 794
        mmWidth = 13547
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DATAINSCRICAO'
        DataPipeline = DsRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DsRelatorio'
        mmHeight = 3704
        mmLeft = 157957
        mmTop = 794
        mmWidth = 16404
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 2117
      mmPrintPosition = 0
    end
  end
  object DsRelatorio: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DsRelatorio'
    Left = 456
    Top = 211
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 264
    Top = 179
  end
  object QryRelatorio: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      
        'SELECT PPP.TRGDTINCLUSAO,PPP.IDPESSJUR,EL.MATRICULA,HSTC.DTINICI' +
        'O AS DATAINSCRICAO, CTP.VALORBASE1 AS CONTRIBUICAO, DECODE(PPP.T' +
        'IPOOPCAOIR,'#39'1'#39','#39'PROGRESSIVA'#39','#39'REGRESSIVA'#39') AS OPCAOIR, PP.NOME A' +
        'S PLANO, P.NOME AS PARTICIPANTE, PPP.IDPLANOPREV'
      ', HSTC.Percentual'
      ',nvl((select max(Seqproposta)'
      ''
      '   from  HSTPERCONTRIBPREV HST'
      '   WHERE HST.DTFIM IS not NULL'
      '   and   HST.IDPESSJUR           = PPP.IDPESSJUR'
      '   AND   HST.IDPESSOA            = PPP.IDPESSOA'
      '   AND   HST.IDPLANOPREV         = PPP.IDPLANOPREV'
      
        '   AND   HST.IDCONTRIBUICAO      = CTP.IDCONTRIBUICAO),0) Seqpro' +
        'posta_max'
      ''
      
        'FROM   PARTPREVPLAN PPP, CONTRIBPREVPARTP CTP, ELEGPATRO EL, PLA' +
        'NPREV PP, PESSOA P, HSTPERCONTRIBPREV HSTC'
      ''
      'WHERE HSTC.DTFIM IS NULL'
      'and HSTC.IDPESSJUR           = PPP.IDPESSJUR(+)'
      'AND HSTC.IDPESSOA            = PPP.IDPESSOA(+)'
      'AND HSTC.IDPLANOPREV         = PPP.IDPLANOPREV(+)'
      'AND HSTC.IDCONTRIBUICAO      = CTP.IDCONTRIBUICAO'
      'and  PPP.FLGINSCRICAOLOTE = 1'
      
        'AND   ((TRUNC(HSTC.DTINICIO) >= :PDTINICIO )AND (TRUNC(HSTC.DTIN' +
        'ICIO) <= :PDATAFIM ))'
      'AND   CTP.IDCONTRIBUICAO = 1'
      'AND   PPP.IDPESSJUR    = CTP.IDPESSJUR'
      'AND   PPP.IDPESSOA     = CTP.IDPESSOA'
      'AND   PPP.IDPLANOPREV  = CTP.IDPLANOPREV'
      'AND   PPP.IDPESSJUR    = EL.IDPESSJUR'
      'AND   PPP.IDPESSOA     = EL.IDPESSOA'
      'AND   PPP.IDPLANOPREV  = PP.IDPLANOPREV'
      'AND   PPP.IDPESSOA     = P.IDPESSOA'
      
        'GROUP BY PPP.TRGDTINCLUSAO,PPP.IDPESSJUR,EL.MATRICULA, HSTC.DTIN' +
        'ICIO , CTP.VALORBASE1 , PPP.TIPOOPCAOIR, PP.NOME, P.NOME,PPP.IDP' +
        'LANOPREV,HSTC.Percentual,ppp.IDPESSJUR,ppp.IDPESSOA'
      ',PPP.IDPLANOPREV'
      ',CTP.IDCONTRIBUICAO'
      ' '
      ' '
      ' '
      ' ')
    Left = 568
    Top = 165
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDTINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAFIM'
        ParamType = ptUnknown
      end>
  end
  object DataSource1: TDataSource
    DataSet = QryRelatorio
    Left = 560
    Top = 224
  end
  object QryRelatorio_aux: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select HSTC.Percentual Percentual_ant'
      'from  HSTPERCONTRIBPREV HSTC'
      'WHERE HSTC.Seqproposta = :pSeqproposta ')
    Left = 568
    Top = 109
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pSeqproposta'
        ParamType = ptUnknown
      end>
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 256
    Top = 99
  end
end
