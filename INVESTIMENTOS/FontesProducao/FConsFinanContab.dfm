inherited FrmConsFinanContab: TFrmConsFinanContab
  Left = 115
  Top = 62
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Consulta'
  ClientHeight = 553
  ClientWidth = 800
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 800
    Height = 467
    inherited Bevel2: TBevel
      Width = 798
    end
    object Splitter1: TSplitter [1]
      Left = 394
      Top = 98
      Width = 4
      Height = 368
      Cursor = crHSplit
      Color = clNavy
      ParentColor = False
    end
    inherited pnlTitulo: TPanel
      Width = 798
      inherited lbNomItem: TfcLabel
        Width = 213
        Caption = 'Financeiro e Contábil'
      end
    end
    object PnlFinanc: TPanel
      Left = 1
      Top = 98
      Width = 393
      Height = 368
      Align = alLeft
      TabOrder = 1
      object DbgFinanc: TwwDBGrid
        Left = 1
        Top = 26
        Width = 391
        Height = 341
        Hint = 'Clique com o botão direito para Fixar Colunas'
        Selected.Strings = (
          'DATAEMISSAO'#9'10'#9'Data'#9'F'
          'HISTORICOCOMPL'#9'22'#9'Histórico'
          'VALOR'#9'15'#9'Valor'
          'CODDOCUMENTO'#9'10'#9'Documento')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
        Align = alClient
        Color = clWhite
        DataSource = DsFinanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = []
        Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icYellow
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 391
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = 'Financeiro'
        Color = clNavy
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object BtExcFinanc: TSpeedButton
          Left = 1
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Excluir o registro selecionado|'
          AllowAllUp = True
          GroupIndex = 1
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 0
          OnClick = BtExcFinancClick
        end
      end
    end
    object PnlContab: TPanel
      Left = 398
      Top = 98
      Width = 401
      Height = 368
      Align = alClient
      TabOrder = 2
      object DbgContab: TwwDBGrid
        Left = 1
        Top = 26
        Width = 399
        Height = 341
        Hint = 'Clique com o botão direito para Fixar Colunas'
        Selected.Strings = (
          'PLNDATDIA'#9'10'#9'Data'
          'LACHIST1'#9'22'#9'Histórico'
          'LACVALOR'#9'16'#9'Valor'
          'PLNCODIGO'#9'10'#9'Planilha')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
        Align = alClient
        Color = clWhite
        DataSource = DsContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = []
        Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icYellow
      end
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 399
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = 'Contábil'
        Color = clNavy
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object BtExcContab: TSpeedButton
          Left = 1
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Excluir o registro selecionado|'
          AllowAllUp = True
          GroupIndex = 1
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 0
          OnClick = BtExcContabClick
        end
      end
    end
    object PnlConsulta: TPanel
      Left = 1
      Top = 45
      Width = 798
      Height = 53
      Align = alTop
      TabOrder = 3
      object GroupBox1: TGroupBox
        Left = 8
        Top = 4
        Width = 360
        Height = 43
        Caption = 'Período'
        TabOrder = 0
        object Label1: TLabel
          Left = 170
          Top = 21
          Width = 20
          Height = 13
          Caption = 'Até'
        end
        object dDataIni: TCMDateTimePicker
          Left = 37
          Top = 17
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
          TabOrder = 0
        end
        object dDataFim: TCMDateTimePicker
          Left = 205
          Top = 17
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
          TabOrder = 1
        end
      end
      object BitBtn1: TBitBtn
        Left = 392
        Top = 8
        Width = 80
        Height = 33
        Caption = '&Executar'
        Default = True
        ModalResult = 1
        TabOrder = 1
        OnClick = BitBtn1Click
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
      end
    end
  end
  inherited Dock972: TDock97
    Width = 800
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 514
    Width = 800
    inherited tb97Fundo: TToolbar97
      Left = 346
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 169
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Executar'
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 392
  end
  inherited MontaSelect: TMontaSelect
    Left = 341
  end
  inherited ImlPadrao: TImageList
    Left = 297
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 252
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select * from dual')
  end
  object QryFinanc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     D.DATAEMISSAO, D.CODDOCUMENTO, L.VALOR, L.HISTORICOCOMPL'
      'FROM'
      
        '     DOCUMENTO D, LANCTODOCUM  L, OPERACAOINVEST OI, HISTCARTINV' +
        ' HI, HISTFUNDO HF,'
      
        '     HISTRENFIX HR, OPEREMPACOES EM, OPERACAODIREITO OD, OPERREN' +
        'FIX OP,  OPERACAOFUNDO OPF,'
      '     PEDIDOFUNDO PF, BOLETA BL, OPERCONTACOES OC'
      'WHERE'
      '     D.IDMODULO         = 79              AND'
      
        '     D.DATAEMISSAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND TO' +
        '_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39') AND'
      '     L.CODDOCUMENTO(+)  = D.CODDOCUMENTO  AND'
      
        '    (OI.CODFINANCEIRO||HI.CODDOCUMENTO||HF.CODDOCUMENTO||HR.CODD' +
        'OCUMENTO||EM.CODDOCUMENTO||OD.CODDOCUMENTO||OP.CODDOCUMENTO||OPF' +
        '.PLNCODIGO||PF.PLNCODIGO||BL.CODDOCUMENTO||OC.CODDOCUMENTO) IS N' +
        'ULL AND'
      '     OI.CODFINANCEIRO(+)= D.CODDOCUMENTO  AND'
      '     HI.CODDOCUMENTO(+) = D.CODDOCUMENTO  AND'
      '     HF.CODDOCUMENTO(+) = D.CODDOCUMENTO  AND'
      '     HR.CODDOCUMENTO(+) = D.CODDOCUMENTO  AND'
      '     EM.CODDOCUMENTO(+) = D.CODDOCUMENTO  AND'
      '     OD.CODDOCUMENTO(+) = D.CODDOCUMENTO  AND'
      '     OP.CODDOCUMENTO(+) = D.CODDOCUMENTO  AND'
      '    OPF.CODDOCUMENTO(+) = D.CODDOCUMENTO  AND'
      '     PF.CODDOCUMENTO(+) = D.CODDOCUMENTO  AND'
      '     BL.CODDOCUMENTO(+) = D.CODDOCUMENTO  AND'
      '     OC.CODDOCUMENTO(+) = D.CODDOCUMENTO'
      'ORDER BY  D.DATAEMISSAO, D.CODDOCUMENTO')
    ValidateWithMask = True
    Left = 26
    Top = 222
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end>
    object QryFinancDATAEMISSAO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAEMISSAO'
    end
    object QryFinancHISTORICOCOMPL: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 22
      FieldName = 'HISTORICOCOMPL'
      Size = 60
    end
    object QryFinancVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 15
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryFinancCODDOCUMENTO: TFloatField
      DisplayLabel = 'Documento'
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
    end
  end
  object DsFinanc: TwwDataSource
    DataSet = QryFinanc
    Left = 26
    Top = 270
  end
  object QryContab: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.PLNDATDIA, P.PLNCODIGO, L.LACVALOR, L.LACHIST1, L.LACDE' +
        'BCRE'
      
        'FROM PLANILHA P,LANCAMENTO L, HISTCARTINV HI, HISTFUNDO HF, HIST' +
        'RENFIX HR, OPERRENFIX OP,'
      
        '     OPEREMPACOES EM, HISTEMPACOES HE, OPERACAODIREITO OD, OPERA' +
        'CAOFUNDO OPF, PEDIDOFUNDO PF,'
      
        '     BOLETA BL, HISTCOTAINTEGRALIZA HC, OPERCONTACOES OC, HISTCO' +
        'NTACOES HA'
      'WHERE L.LACVALOR > 0'
      '  AND P.IDMODULO = 79'
      
        '  AND P.PLNDATDIA BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND TO_' +
        'DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      '  AND L.PLNCODIGO(+) = P.PLNCODIGO'
      
        '  AND (HI.PLNCODIGO||HF.PLNCODIGO||HR.PLNCODIGO||OP.PLNCODIGO||E' +
        'M.PLNCODIGO||HE.PLNCODIGO||OD.PLNCODIGO||OPF.PLNCODIGO||PF.PLNCO' +
        'DIGO||BL.PLNCODIGO||HC.PLNCODIGO||OC.PLNCODIGO||HA.PLNCODIGO) IS' +
        ' NULL '
      '  AND HI.PLNCODIGO(+) = P.PLNCODIGO '
      '  AND HF.PLNCODIGO(+) = P.PLNCODIGO '
      '  AND HR.PLNCODIGO(+) = P.PLNCODIGO '
      '  AND OP.PLNCODIGO(+) = P.PLNCODIGO '
      '  AND EM.PLNCODIGO(+) = P.PLNCODIGO '
      '  AND HE.PLNCODIGO(+) = P.PLNCODIGO '
      '  AND OD.PLNCODIGO(+) = P.PLNCODIGO'
      '  AND OPF.PLNCODIGO(+) = P.PLNCODIGO'
      '  AND PF.PLNCODIGO(+) = P.PLNCODIGO'
      '  AND BL.PLNCODIGO(+) = P.PLNCODIGO'
      '  AND HC.PLNCODIGO(+) = P.PLNCODIGO'
      '  AND OC.PLNCODIGO(+) = P.PLNCODIGO'
      '  AND HA.PLNCODIGO(+) = P.PLNCODIGO'
      ''
      'ORDER BY P.PLNDATDIA, P.PLNCODIGO')
    ValidateWithMask = True
    Left = 418
    Top = 222
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end>
    object QryContabPLNDATDIA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'PLNDATDIA'
    end
    object QryContabLACHIST1: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 22
      FieldName = 'LACHIST1'
      Size = 40
    end
    object QryContabLACVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 16
      FieldName = 'LACVALOR'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryContabPLNCODIGO: TFloatField
      DisplayLabel = 'Planilha'
      DisplayWidth = 10
      FieldName = 'PLNCODIGO'
    end
  end
  object DsContab: TwwDataSource
    DataSet = QryContab
    Left = 422
    Top = 270
  end
  object QryRecbtoPagto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM RECBTOPAGTO WHERE CODDOCUMENTO =:CODDOCUMENTO')
    ValidateWithMask = True
    Left = 407
    Top = 53
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryLanctoDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM LANCTODOCUM WHERE CODDOCUMENTO = :CODDOCUMENTO')
    ValidateWithMask = True
    Left = 443
    Top = 53
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryLotexDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'DELETE FROM LOTEXDOCUM WHERE CODDOCUMENTO =:CODDOCUMENTO AND FLG' +
        'BAIXA <> '#39'B'#39' ')
    ValidateWithMask = True
    Left = 483
    Top = 53
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryRateioDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM RATEIODOCUM WHERE CODDOCUMENTO =:CODDOCUMENTO ')
    ValidateWithMask = True
    Left = 519
    Top = 53
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryDocumento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM DOCUMENTO WHERE CODDOCUMENTO =:CODDOCUMENTO ')
    ValidateWithMask = True
    Left = 603
    Top = 53
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryLancamento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM LANCAMENTO WHERE PLNCODIGO =:PLNCODIGO')
    ValidateWithMask = True
    Left = 563
    Top = 54
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end>
  end
  object QryPlanilha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM PLANILHA WHERE PLNCODIGO =:PLNCODIGO')
    ValidateWithMask = True
    Left = 647
    Top = 53
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end>
  end
  object qryIRLitigio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM IRLITIGIO WHERE PLNCODIGO = :PLNCODIGO')
    ValidateWithMask = True
    Left = 686
    Top = 53
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptResult
      end>
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 104
    Top = 222
  end
end
