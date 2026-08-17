inherited FrmAlteraLote: TFrmAlteraLote
  Left = 12
  Top = 56
  HelpContext = 30037
  BorderStyle = bsSingle
  Caption = 'Altera Lote'
  ClientHeight = 473
  ClientWidth = 780
  Position = poDefault
  Scaled = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 780
    Height = 434
    object Panel1: TPanel
      Left = 5
      Top = 229
      Width = 770
      Height = 50
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object bbtnincluir: TBitBtn
        Left = 88
        Top = 12
        Width = 150
        Height = 28
        Caption = '&Incluir Documento'
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
        Left = 254
        Top = 12
        Width = 150
        Height = 28
        Caption = '&Excluir Documento'
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
      object bbtnConfirma: TBitBtn
        Left = 420
        Top = 12
        Width = 150
        Height = 28
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
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777700000007777777777777777700000007777777772077777700000007777
          7777222077777000000077777772222077777000000070000022202207777000
          000070FFF222F07220777000000070F8882FF07720777000000070FFFFFFF077
          72077000000070F88888F07777207000000070FFFFFFF07777720000000070F8
          8777F07777772000000070FFFF00007777777000000070F88707077777777000
          000070FFFF007777777770000000700000077777777770000000777777777777
          777770000000}
        Layout = blGlyphRight
        Spacing = 2
      end
      object BtnCancela: TBitBtn
        Left = 586
        Top = 12
        Width = 150
        Height = 28
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
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777770
          9977700000007777997777099777700000007777799770997777700000007777
          7799099777777000000077777777997777777000000070000009999777777000
          000070FFFF99F99977777000000070F88997F09997777000000070FF99FFF079
          99777000000070F88888F07799777000000070FFFFFFF07779777000000070F8
          8777F07777777000000070FFFF00007777777000000070F88707077777777000
          000070FFFF007777777770000000700000077777777770000000777777777777
          777770000000}
        Layout = blGlyphRight
        Spacing = 2
      end
    end
    object TPanel
      Left = 5
      Top = 69
      Width = 770
      Height = 160
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelWidth = 2
      TabOrder = 0
      object dbgrdDocumentos: TwwDBGrid
        Left = 2
        Top = 32
        Width = 766
        Height = 126
        Selected.Strings = (
          'NOME'#9'50'#9'Fornecedor'
          'NODOCUMENTO'#9'20'#9'Documento'
          'COMPLDOCUMENTO'#9'3'#9'Cpl'
          'DATAPROGRAMADA'#9'12'#9'Data Prog'
          'DATAVENCTO'#9'12'#9'Data Venc'
          'SALDO'#9'20'#9'Saldo')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        OnMultiSelectRecord = dbgrdDocumentosMultiSelectRecord
        FixedCols = 0
        ShowHorzScrollBar = False
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
        OnCalcCellColors = dbgrdDocumentosCalcCellColors
        IndicatorColor = icBlack
      end
      object Panel8: TPanel
        Left = 2
        Top = 2
        Width = 766
        Height = 30
        Align = alTop
        BevelInner = bvLowered
        BevelWidth = 2
        Caption = 'Documentos Pendentes para pagamento'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel2: TPanel
      Left = 5
      Top = 279
      Width = 770
      Height = 150
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelWidth = 2
      TabOrder = 1
      object dbgrdLotePagto: TwwDBGrid
        Left = 2
        Top = 32
        Width = 766
        Height = 116
        Selected.Strings = (
          'NOME'#9'50'#9'Fornecedor'
          'NODOCUMENTO'#9'20'#9'Número do Doumento'
          'COMPLDOCUMENTO'#9'3'#9'Cpl'
          'DATAPROGRAMADA'#9'12'#9'Data Prog'
          'DATAVENCTO'#9'12'#9'Data Venc'
          'VALOR'#9'20'#9'Valor')
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
        IndicatorColor = icBlack
      end
      object Pnldocpago: TPanel
        Left = 2
        Top = 2
        Width = 766
        Height = 30
        Align = alTop
        BevelInner = bvLowered
        BevelWidth = 2
        Caption = 'Documentos a Serem Pagos No Lote Selecionado'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel3: TPanel
      Left = 5
      Top = 5
      Width = 770
      Height = 64
      Align = alTop
      TabOrder = 3
      object lblDataProgramada: TLabel
        Left = 403
        Top = 11
        Width = 99
        Height = 13
        Caption = 'Data Programada'
      end
      object lblDocumento: TLabel
        Left = 509
        Top = 11
        Width = 65
        Height = 13
        Caption = 'Documento'
        Color = clBtnFace
        ParentColor = False
      end
      object bbtnSelecionaDoc: TToolbarButton97
        Left = 672
        Top = 5
        Width = 91
        Height = 53
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
        Layout = blGlyphTop
        WordWrap = True
        OnClick = bbtnSelecionaDocClick
      end
      object Label3: TLabel
        Left = 286
        Top = 11
        Width = 26
        Height = 13
        Caption = 'Lote'
      end
      object dtedDataProg: TCMDateTimePicker
        Left = 403
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
      object dblkcmbloteIni: TwwDBLookupCombo
        Left = 286
        Top = 28
        Width = 109
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NUMLOTE'#9'10'#9'Lote'#9'F')
        LookupTable = qryLotePagto
        LookupField = 'NUMLOTE'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkcmbloteIni1CloseUp
      end
      object LckDoc: TwwDBLookupCombo
        Left = 508
        Top = 27
        Width = 153
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NODOCUMENTO'#9'10'#9'Nº DOC'#9'F'
          'COMPLDOCUMENTO'#9'3'#9'COMPL'#9'F')
        LookupTable = QryDocPendentes
        LookupField = 'NODOCUMENTO'
        Options = [loColLines, loTitles]
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 434
    Width = 780
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 30037
      end
    end
  end
  inherited CPForCli: TCMProcuraForCli
    Left = 15
    Top = 10
    Width = 270
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 27
    Top = 123
  end
  object updsqlDocumento: TUpdateSQL
    ModifySQL.Strings = (
      'update DOCUMENTO'
      'set'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  SISCODORIGEM = :SISCODORIGEM,'
      '  MOECODIGO = :MOECODIGO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  IDFORCLI = :IDFORCLI,'
      '  CODTIPDOC = :CODTIPDOC,'
      '  RECPAG = :RECPAG,'
      '  NODOCUMENTO = :NODOCUMENTO,'
      '  COMPLDOCUMENTO = :COMPLDOCUMENTO,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  DATAVENCTO = :DATAVENCTO,'
      '  DATAPROGRAMADA = :DATAPROGRAMADA,'
      '  STATUS = :STATUS,'
      '  NUMFATURA = :NUMFATURA,'
      '  OPERACAO = :OPERACAO,'
      '  IDUSUARIOINCLUSAO = :IDUSUARIOINCLUSAO,'
      '  NUMSLIP = :NUMSLIP,'
      '  EMISBLOQ = :EMISBLOQ'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    InsertSQL.Strings = (
      'insert into DOCUMENTO'
      
        '  (CODDOCUMENTO, IDPESSOA, CODPORTFORMA, SISCODORIGEM, MOECODIGO' +
        ', UNIDNEGOC, '
      
        '   IDFORCLI, CODTIPDOC, RECPAG, NODOCUMENTO, COMPLDOCUMENTO, DAT' +
        'AEMISSAO, '
      
        '   DATAVENCTO, DATAPROGRAMADA, STATUS, NUMFATURA, OPERACAO, IDUS' +
        'UARIOINCLUSAO, '
      '   NUMSLIP, EMISBLOQ)'
      'values'
      
        '  (:CODDOCUMENTO, :IDPESSOA, :CODPORTFORMA, :SISCODORIGEM, :MOEC' +
        'ODIGO, '
      
        '   :UNIDNEGOC, :IDFORCLI, :CODTIPDOC, :RECPAG, :NODOCUMENTO, :CO' +
        'MPLDOCUMENTO, '
      
        '   :DATAEMISSAO, :DATAVENCTO, :DATAPROGRAMADA, :STATUS, :NUMFATU' +
        'RA, :OPERACAO, '
      '   :IDUSUARIOINCLUSAO, :NUMSLIP, :EMISBLOQ)')
    DeleteSQL.Strings = (
      'delete from DOCUMENTO'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    Left = 573
    Top = 389
  end
  object updsqlLotexdocum: TUpdateSQL
    ModifySQL.Strings = (
      'update LOTEXDOCUM'
      'set'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  VALOR = :VALOR,'
      '  NUMLOTE = :NUMLOTE,'
      '  FLGBAIXA = :FLGBAIXA'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO and'
      '  NUMLOTE = :OLD_NUMLOTE')
    InsertSQL.Strings = (
      'insert into LOTEXDOCUM'
      '  (CODDOCUMENTO, VALOR, NUMLOTE, FLGBAIXA)'
      'values'
      '  (:CODDOCUMENTO, :VALOR, :NUMLOTE, :FLGBAIXA)')
    DeleteSQL.Strings = (
      'delete from LOTEXDOCUM'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO and'
      '  NUMLOTE = :OLD_NUMLOTE')
    Left = 576
    Top = 341
  end
  object qryLotePagto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NUMLOTE'
      'FROM    LotePagto'
      'WHERE (FLAGEMISSAO IS NULL OR  FLAGEMISSAO = '#39'0'#39')    AND'
      '               (FLAGCANCEL IS NULL OR FLAGCANCEL = '#39'  '#39')       '
      'ORDER BY NUMLOTE')
    ValidateWithMask = True
    Left = 20
    Top = 405
  end
  object qryDocumentos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      
        'SELECT (0)as SALDO,DOCUMENTO.idforcli,DOCUMENTO.CODDOCUMENTO,DOC' +
        'UMENTO.IDPESSOA,DOCUMENTO.NoDOCUMENTO,DOCUMENTO.COMPLDOCUMENTO,'
      
        #9'DOCUMENTO.DATAPROGRAMADA,DOCUMENTO.DATAVENCTO,DOCUMENTO.RECPAG,' +
        'PESSOA.NOME,DOCUMENTO.STATUS'
      '   FROM DOCUMENTO,PESSOA'
      'WHERE DOCUMENTO.IDFORCLI=PESSOA.IDPESSOA AND'
      
        '               (STATUS='#39'0'#39' or  STATUS='#39'1'#39'  or (STATUS is  NULL) ' +
        ')  '
      '               AND (OPERACAO=2 OR OPERACAO=3) AND'
      '               DOCUMENTO.RECPAG='#39'P'#39' AND'
      'DOCUMENTO.IDPESSOA=2'
      
        'ORDER BY  PESSOA.NOME ,DOCUMENTO.DATAPROGRAMADA, DOCUMENTO.NoDOC' +
        'UMENTO'
      '')
    UpdateObject = updsqlDocumento
    ValidateWithMask = True
    Left = 352
    Top = 405
    object qryDocumentosNOME: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryDocumentosNODOCUMENTO: TFloatField
      DisplayLabel = 'Documento'
      DisplayWidth = 20
      FieldName = 'NODOCUMENTO'
    end
    object qryDocumentosCOMPLDOCUMENTO: TStringField
      DisplayLabel = 'Cpl'
      DisplayWidth = 3
      FieldName = 'COMPLDOCUMENTO'
      Origin = 'DOCUMENTO.COMPLDOCUMENTO'
      Size = 3
    end
    object qryDocumentosDATAPROGRAMADA: TDateTimeField
      DisplayLabel = 'Data Prog'
      DisplayWidth = 12
      FieldName = 'DATAPROGRAMADA'
      Origin = 'DOCUMENTO.DATAPROGRAMADA'
    end
    object qryDocumentosDATAVENCTO: TDateTimeField
      DisplayLabel = 'Data Venc'
      DisplayWidth = 12
      FieldName = 'DATAVENCTO'
      Origin = 'DOCUMENTO.DATAVENCTO'
    end
    object qryDocumentosSALDO: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 20
      FieldName = 'SALDO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryDocumentosDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'DOCUMENTO'
      Visible = False
      Size = 50
      Calculated = True
    end
    object qryDocumentosIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'DOCUMENTO.IDPESSOA'
      Visible = False
    end
    object qryDocumentosCODDOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
      Visible = False
    end
    object qryDocumentosRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
      Visible = False
      Size = 1
    end
    object qryDocumentosSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
      Visible = False
      Size = 1
    end
    object qryDocumentosIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Visible = False
    end
  end
  object dslotexdocum: TwwDataSource
    DataSet = qryLoteXDocum
    Left = 269
    Top = 405
  end
  object dsdocumento: TwwDataSource
    DataSet = qryDocumentos
    Left = 186
    Top = 405
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 710
    Top = 389
  end
  object wwQuery1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 667
    Top = 373
  end
  object UpdateSQL1: TUpdateSQL
    Left = 103
    Top = 405
  end
  object qryLoteXDocum: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   PESS.NOME,   '
      'DOC.DATAPROGRAMADA,   '
      'DOC.IDPESSOA,         '
      'DOC.DATAVENCTO,       '
      'DOC.NoDOCUMENTO,      '
      'DOC.COMPLDOCUMENTO,      '
      'DOC.CODDOCUMENTO,     '
      'DOC.OPERACAO,         '
      'LOTEPAG.FLAGEMISSAO,  '
      'LOTEX.VALOR,          '
      'LOTEX.NUMLOTE,        '
      'LOTEX.FLGBAIXA        '
      'FROM'
      'DOCUMENTO DOC,'
      'PESSOA PESS,'
      'LOTEXDOCUM LOTEX,'
      'LOTEPAGTO LOTEPAG'
      'WHERE   1=2'
      '')
    UpdateObject = updsqlLotexdocum
    ValidateWithMask = True
    Left = 434
    Top = 405
    object qryLoteXDocumNOME: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = '"CM.PESSOA".NOME'
      Size = 60
    end
    object qryLoteXDocumNODOCUMENTO: TFloatField
      DisplayLabel = 'Número do Doumento'
      DisplayWidth = 20
      FieldName = 'NODOCUMENTO'
      Origin = '"CM.DOCUMENTO".NODOCUMENTO'
    end
    object qryLoteXDocumCOMPLDOCUMENTO: TStringField
      DisplayLabel = 'Cpl'
      DisplayWidth = 3
      FieldName = 'COMPLDOCUMENTO'
      Origin = '"CM.DOCUMENTO".COMPLDOCUMENTO'
      Size = 3
    end
    object qryLoteXDocumDATAPROGRAMADA: TDateTimeField
      DisplayLabel = 'Data Prog'
      DisplayWidth = 12
      FieldName = 'DATAPROGRAMADA'
      Origin = '"CM.DOCUMENTO".DATAPROGRAMADA'
    end
    object qryLoteXDocumDATAVENCTO: TDateTimeField
      DisplayLabel = 'Data Venc'
      DisplayWidth = 12
      FieldName = 'DATAVENCTO'
      Origin = '"CM.DOCUMENTO".DATAVENCTO'
    end
    object qryLoteXDocumVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 20
      FieldName = 'VALOR'
      Origin = '"CM.LOTEXDOCUM".VALOR'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryLoteXDocumNUMLOTE: TFloatField
      DisplayLabel = 'Lote'
      DisplayWidth = 10
      FieldName = 'NUMLOTE'
      Origin = '"CM.LOTEXDOCUM".NUMLOTE'
      Visible = False
    end
    object qryLoteXDocumIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.DOCUMENTO".IDPESSOA'
      Visible = False
    end
    object qryLoteXDocumCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = '"CM.DOCUMENTO".CODDOCUMENTO'
      Visible = False
    end
    object qryLoteXDocumOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Origin = '"CM.DOCUMENTO".OPERACAO'
      Visible = False
      Size = 2
    end
    object qryLoteXDocumFLAGEMISSAO: TStringField
      FieldName = 'FLAGEMISSAO'
      Origin = '"CM.LOTEPAGTO".FLAGEMISSAO'
      Visible = False
      Size = 1
    end
    object qryLoteXDocumFLGBAIXA: TStringField
      FieldName = 'FLGBAIXA'
      Origin = '"CM.LOTEXDOCUM".FLGBAIXA'
      Visible = False
      Size = 1
    end
  end
  object QryDocPendentes: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'select DISTINCT'
      '  NoDOCUMENTO,'
      '  COMPLDOCUMENTO,'
      '  CODDOCUMENTO'
      'FROM'
      '  DOCUMENTO'
      'WHERE'
      '  1=2'
      'ORDER BY'
      '  NODOCUMENTO,'
      '  COMPLDOCUMENTO')
    ValidateWithMask = True
    Left = 285
    Top = 158
    object QryDocPendentesNODOCUMENTO: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = 'Nº DOC'
      DisplayWidth = 10
      FieldName = 'NODOCUMENTO'
      Origin = 'DOCUMENTO.NODOCUMENTO'
    end
    object QryDocPendentesCOMPLDOCUMENTO: TStringField
      DisplayLabel = 'COMPL'
      DisplayWidth = 3
      FieldName = 'COMPLDOCUMENTO'
      Origin = 'DOCUMENTO.COMPLDOCUMENTO'
      Size = 3
    end
    object QryDocPendentesCODDOCUMENTO: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = 'Nº DOC'
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
      Visible = False
    end
  end
end
