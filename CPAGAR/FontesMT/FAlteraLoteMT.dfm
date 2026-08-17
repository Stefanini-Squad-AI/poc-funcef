inherited FrmAlteraLoteMT: TFrmAlteraLoteMT
  Left = 160
  Top = 167
  BorderStyle = bsSingle
  Caption = 'Altera Lote'
  ClientHeight = 473
  ClientWidth = 803
  Position = poDefault
  Scaled = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 803
    Height = 434
    object Splitter1: TSplitter
      Left = 1
      Top = 225
      Width = 801
      Height = 5
      Cursor = crVSplit
      Align = alTop
    end
    object Panel1: TPanel
      Left = 1
      Top = 230
      Width = 801
      Height = 56
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 2
      object Label3: TLabel
        Left = 14
        Top = 7
        Width = 26
        Height = 13
        Caption = 'Lote'
      end
      object bbtnincluir: TBitBtn
        Left = 154
        Top = 17
        Width = 150
        Height = 28
        Caption = '&Incluir documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = bbtnincluirClick
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777700000007777777777777777700000007777777777777777700000007777
          7777777777777000000077777777777777777000000070000000007777777000
          000070FFFFF0207777777000000070F77702200000077000000070FFF0222222
          22077000000070F88702200000077000000070FFFFF0207777777000000070F8
          8777007777777000000070FFFF00007777777000000070F88707077777777000
          000070FFFF007777777770000000700000077777777770000000777777777777
          777770000000}
        Layout = blGlyphRight
      end
      object bbtnExcluir: TBitBtn
        Left = 318
        Top = 17
        Width = 150
        Height = 28
        Caption = '&Excluir documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = bbtnExcluirClick
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777700000007777777777777777700000007777777777770777700000007777
          7777777700777000000077777777000009077000000070000000099999907000
          000070FFFFFF000009077000000070F87777F07700777000000070FFFFFFF077
          07777000000070F88777F07777777000000070FFFFFFF07777777000000070F8
          8777707777777000000070FFFF00007777777000000070F88707077777777000
          000070FFFF007777777770000000700000077777777770000000777777777777
          777770000000}
        Layout = blGlyphRight
      end
      object dblkcmbloteIni: TwwDBLookupCombo
        Left = 14
        Top = 24
        Width = 115
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NUMLOTE'#9'10'#9'Lote'#9'F'
          'DATAEMISSAO'#9'14'#9'Data emissão'#9'F'
          'FAVORECIDO'#9'40'#9'Favorecido'#9'F')
        LookupTable = cdsLotePagto
        LookupField = 'NUMLOTE'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkcmbloteIni1CloseUp
      end
    end
    object TPanel
      Left = 1
      Top = 65
      Width = 801
      Height = 160
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelWidth = 2
      TabOrder = 0
      object dbgrdDocumentos: TwwDBGrid
        Left = 2
        Top = 26
        Width = 797
        Height = 132
        Selected.Strings = (
          'NOME'#9'50'#9'Fornecedor'#9'F'
          'NODOCUMENTO'#9'20'#9'Nº Documento'#9'F'
          'COMPLDOCUMENTO'#9'3'#9'Cpl'#9'F'
          'DATAPROGRAMADA'#9'12'#9'Data Prog'#9'F'
          'DATAVENCTO'#9'12'#9'Data Venc'#9'F'
          'VALOR'#9'20'#9'Saldo'#9'F'
          'NUMBANCO'#9'10'#9'Banco'#9'F'
          'NUMAGENCIA'#9'15'#9'Agência'#9'F'
          'CONTACORRENTE'#9'15'#9'Conta Corrente'#9'F'
          'PLANOPREV'#9'112'#9'Planos Previdenciários'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        OnMultiSelectRecord = dbgrdDocumentosMultiSelectRecord
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsdocumento
        EditCalculated = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'Small Fonts'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = True
        UseTFields = False
        OnCalcCellColors = dbgrdDocumentosCalcCellColors
        OnTitleButtonClick = dbgrdDocumentosTitleButtonClick
        IndicatorColor = icBlack
      end
      object Panel8: TPanel
        Left = 2
        Top = 2
        Width = 797
        Height = 24
        Align = alTop
        BevelInner = bvLowered
        BevelWidth = 2
        Caption = 'Documentos pendentes para pagamento'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 286
      Width = 801
      Height = 147
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelWidth = 2
      TabOrder = 1
      object dbgrdLotePagto: TwwDBGrid
        Left = 2
        Top = 27
        Width = 797
        Height = 118
        Selected.Strings = (
          'NOME'#9'50'#9'Fornecedor'
          'NODOCUMENTO'#9'20'#9'Nº Doumento'#9'F'
          'COMPLDOCUMENTO'#9'3'#9'Cpl'
          'DATAPROGRAMADA'#9'12'#9'Data Prog'
          'DATAVENCTO'#9'12'#9'Data Venc'
          'VALOR'#9'20'#9'Saldo'
          'NUMBANCO'#9'10'#9'Banco'
          'NUMAGENCIA'#9'15'#9'Agência'
          'CONTACORRENTE'#9'15'#9'Conta Corrente'
          'PLANOPREV'#9'112'#9'Planos Previdenciários')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        OnMultiSelectRecord = dbgrdLotePagtoMultiSelectRecord
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dslotexdocum
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'Small Fonts'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = True
        OnCalcCellColors = dbgrdDocumentosCalcCellColors
        OnTitleButtonClick = dbgrdLotePagtoTitleButtonClick
        IndicatorColor = icBlack
      end
      object Pnldocpago: TPanel
        Left = 2
        Top = 2
        Width = 797
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        BevelWidth = 2
        Caption = 'Documentos a pagar no lote selecionado'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 801
      Height = 64
      Align = alTop
      TabOrder = 3
      object lblDataProgramada: TLabel
        Left = 299
        Top = 11
        Width = 98
        Height = 13
        Caption = 'Data programada'
      end
      object lblDocumento: TLabel
        Left = 413
        Top = 11
        Width = 65
        Height = 13
        Caption = 'Documento'
        Color = clBtnFace
        ParentColor = False
      end
      object bbtnSelecionaDoc: TToolbarButton97
        Left = 584
        Top = 21
        Width = 153
        Height = 30
        Caption = '&Exibe Documentos'
        Flat = False
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777700000007777777777777777700000007777777774F77777700000007777
          7777444F77777000000077777774444F777770000000700000444F44F7777000
          000070FFF444F0744F777000000070F8884FF0774F777000000070FFFFFFF077
          74F77000000070F88888F077774F7000000070FFFFFFF0777774F000000070F8
          8777F07777774000000070FFFF00007777777000000070F88707077777777000
          000070FFFF007777777770000000700000077777777770000000777777777777
          777770000000}
        Layout = blGlyphRight
        WordWrap = True
        OnClick = bbtnSelecionaDocClick
      end
      object dtedDataProg: TCMDateTimePicker
        Left = 299
        Top = 28
        Width = 98
        Height = 21
        Hint = 'Data Programada para Pagamento'
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
        ParentShowHint = False
        ShowHint = True
        ShowButton = True
        TabOrder = 0
      end
      object LckDoc: TwwDBLookupCombo
        Left = 412
        Top = 27
        Width = 153
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NODOCUMENTO'#9'10'#9'Nº DOC'#9'F'
          'COMPLDOCUMENTO'#9'3'#9'COMPL'#9'F')
        LookupTable = cdsDocPendentes
        LookupField = 'NODOCUMENTO'
        Options = [loColLines, loTitles]
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 434
    Width = 803
    inherited tb97Fundo: TToolbar97
      Left = 432
      DockPos = 432
      inherited sep1: TToolbarSep97
        Left = 255
      end
      inherited bbtnSair: TBitBtn
        Left = 170
        Width = 85
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 257
        Width = 85
      end
      object bbtnConfirma: TBitBtn
        Left = 0
        Top = 0
        Width = 85
        Height = 33
        Caption = 'C&onfirmar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = bbtnConfirmaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        Spacing = 2
      end
      object BtnCancela: TBitBtn
        Left = 85
        Top = 0
        Width = 85
        Height = 33
        Caption = '&Cancelar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = BtnCancelaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
          19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
          19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
          190878F877787778887887917F919F71908887F88788878887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited CPForCli: TCMProcuraForCli
    Left = 15
    Top = 10
    Width = 270
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 712
    Top = 163
  end
  object dslotexdocum: TwwDataSource
    DataSet = cdsLotexDocum
    Left = 345
    Top = 322
  end
  object dsdocumento: TwwDataSource
    DataSet = cdsDocumentos
    Left = 400
    Top = 125
  end
  object cdsDocPendentes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 680
    Top = 164
  end
  object cdsLotePagto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 570
    Top = 164
  end
  object cdsDocumentos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 265
    Top = 124
    object cdsDocumentosNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsDocumentosNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object cdsDocumentosCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object cdsDocumentosDATAPROGRAMADA: TDateTimeField
      FieldName = 'DATAPROGRAMADA'
    end
    object cdsDocumentosDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object cdsDocumentosVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object cdsDocumentosNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object cdsDocumentosNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object cdsDocumentosCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object cdsDocumentosPLANOPREV: TStringField
      FieldName = 'PLANOPREV'
      FixedChar = True
      Size = 112
    end
    object cdsDocumentosCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object cdsDocumentosSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object cdsDocumentosNUMLOTE: TFloatField
      FieldName = 'NUMLOTE'
    end
  end
  object cdsLotexDocum: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 220
    Top = 329
    object cdsLotexDocumNOME: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 50
      FieldName = 'NOME'
      Size = 60
    end
    object cdsLotexDocumNODOCUMENTO: TFloatField
      DisplayLabel = 'Nº Doumento'
      DisplayWidth = 20
      FieldName = 'NODOCUMENTO'
    end
    object cdsLotexDocumCOMPLDOCUMENTO: TStringField
      DisplayLabel = 'Cpl'
      DisplayWidth = 3
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object cdsLotexDocumDATAPROGRAMADA: TDateTimeField
      DisplayLabel = 'Data Prog'
      DisplayWidth = 12
      FieldName = 'DATAPROGRAMADA'
    end
    object cdsLotexDocumDATAVENCTO: TDateTimeField
      DisplayLabel = 'Data Venc'
      DisplayWidth = 12
      FieldName = 'DATAVENCTO'
    end
    object cdsLotexDocumVALOR: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 20
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object cdsLotexDocumNUMBANCO: TStringField
      DisplayLabel = 'Banco'
      DisplayWidth = 10
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object cdsLotexDocumNUMAGENCIA: TStringField
      DisplayLabel = 'Agência'
      DisplayWidth = 15
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object cdsLotexDocumCONTACORRENTE: TStringField
      DisplayLabel = 'Conta Corrente'
      DisplayWidth = 15
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object cdsLotexDocumPLANOPREV: TStringField
      DisplayLabel = 'Planos Previdenciários'
      DisplayWidth = 112
      FieldName = 'PLANOPREV'
      FixedChar = True
      Size = 112
    end
    object cdsLotexDocumIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object cdsLotexDocumCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object cdsLotexDocumSALDO: TFloatField
      FieldName = 'SALDO'
      Visible = False
    end
    object cdsLotexDocumNUMLOTE: TFloatField
      FieldName = 'NUMLOTE'
      Visible = False
    end
    object cdsLotexDocumCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
  end
  object verificaradLote: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   IDPROCESSO '
      'FROM '
      '   LOTEPAGTO '
      'WHERE '
      '   NUMLOTE = :NUMLOTE')
    ClientDataSet = cdsVerificaradlote
    Left = 489
    Top = 313
  end
  object cdsVerificaradlote: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 569
    Top = 311
  end
end
