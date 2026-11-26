inherited frmTratamentoConvenio: TfrmTratamentoConvenio
  Left = 280
  Top = 272
  HelpContext = 180018
  Caption = 'Tratamento de Convênio'
  ClientHeight = 426
  ClientWidth = 790
  WindowState = wsMaximized
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 790
    Height = 387
    object fctvInformacoes: TfcTreeView
      Left = 1
      Top = 96
      Width = 788
      Height = 200
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      Indent = 19
      Items.StreamVersion = 1
      Items.Data = {00000000}
      ParentFont = False
      TabOrder = 0
    end
    object pnlParametros: TPanel
      Left = 1
      Top = 1
      Width = 788
      Height = 54
      Align = alTop
      TabOrder = 1
      object fcbtnRecupera: TfcShapeBtn
        Left = 495
        Top = 2
        Width = 151
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Obtêm Informações'
        Color = clBtnFace
        DitherColor = clWhite
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
        Offsets.TextX = 5
        ParentClipping = True
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        Shape = bsRoundRect
        TabOrder = 3
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = fcbtnRecuperaClick
      end
      object fcbtnSalvar: TfcShapeBtn
        Left = 495
        Top = 26
        Width = 151
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Salva árvore'
        Color = clBtnFace
        DitherColor = clWhite
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
        Offsets.TextX = 5
        ParentClipping = True
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        Shape = bsRoundRect
        TabOrder = 4
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = fcbtnSalvarClick
      end
      object grpMesRef: TGroupBox
        Left = 1
        Top = 1
        Width = 161
        Height = 52
        Align = alLeft
        Caption = ' Mês e Ano de Processamento '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object cmbMes: TComboBox
          Left = 14
          Top = 17
          Width = 90
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
          OnExit = VerificaAbono
          Items.Strings = (
            'Janeiro'
            'Fevereiro'
            'Março'
            'Abril'
            'Maio'
            'Junho'
            'Julho'
            'Agosto'
            'Setembro'
            'Outubro'
            'Novembro'
            'Dezembro')
        end
        object spnedAno: TSpinEdit
          Left = 106
          Top = 17
          Width = 47
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxValue = 2100
          MinValue = 1950
          ParentFont = False
          TabOrder = 1
          Value = 1950
          OnExit = VerificaAbono
        end
      end
      object fcbtnExpande: TfcShapeBtn
        Left = 647
        Top = 1
        Width = 138
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Expande árvore'
        Color = clBtnFace
        DitherColor = clWhite
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFFFF55555000000000055555577777777775F55500B8B8B8B8
          B05555775F555555575F550F0B8B8B8B8B05557F75F555555575550BF0B8B8B8
          B8B0557F575FFFFFFFF7550FBF0000000000557F557777777777500BFBFBFBFB
          0555577F555555557F550B0FBFBFBFBF05557F7F555555FF75550F0BFBFBF000
          55557F75F555577755550BF0BFBF0B0555557F575FFF757F55550FB700007F05
          55557F557777557F55550BFBFBFBFB0555557F555555557F55550FBFBFBFBF05
          55557FFFFFFFFF7555550000000000555555777777777755555550FBFB055555
          5555575FFF755555555557000075555555555577775555555555}
        NumGlyphs = 2
        Offsets.TextX = 5
        ParentClipping = True
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        Shape = bsRoundRect
        TabOrder = 5
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = fcbtnExpandeClick
      end
      object fcbtnComprime: TfcShapeBtn
        Left = 647
        Top = 25
        Width = 138
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Comprime árvore'
        Color = clBtnFace
        DitherColor = clWhite
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFB
          FB0555557F555555557F55500FBFBFBFBF0555577F555555557F550B0BFBFBFB
          FB05557F7F555555557F500F0FBFBFBFBF05577F7F555555557F0B0B0BFBFBFB
          FB057F7F7F555555557F0F0F0FBFBFBFBF057F7F7FFFFFFFFF750B0B00000000
          00557F7F7777777777550F0FB0FBFB0F05557F7FF75FFF7575550B0007000070
          55557F777577775755550FB0FBFB0F0555557FF75FFF75755555000700007055
          5555777577775755555550FBFB0555555555575FFF7555555555570000755555
          5555557777555555555555555555555555555555555555555555}
        NumGlyphs = 2
        Offsets.TextX = 5
        ParentClipping = True
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        Shape = bsRoundRect
        TabOrder = 6
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = fcbtnComprimeClick
      end
      object gboxDataPagamento: TGroupBox
        Left = 272
        Top = 1
        Width = 111
        Height = 52
        Align = alLeft
        Caption = ' Data de Pagamento '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object dtpDtPagamento: TCMDateTimePicker
          Left = 12
          Top = 19
          Width = 85
          Height = 21
          Hint = 
            'Não informar para a data ser calculada de acordo com o cadastro ' +
            'dos layouts'
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
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          ShowButton = True
          TabOrder = 0
        end
      end
      object gboxIndicaAbono: TGroupBox
        Left = 162
        Top = 1
        Width = 110
        Height = 52
        Align = alLeft
        Caption = ' Opções de Busca  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object cbboxAbono: TwwDBComboBox
          Left = 8
          Top = 18
          Width = 94
          Height = 21
          ShowButton = True
          Style = csDropDownList
          MapList = False
          AllowClearKey = False
          AutoDropDown = True
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            'Com abono'
            'Sem abono'
            'Apenas abono')
          ItemIndex = 0
          Sorted = False
          TabOrder = 0
          UnboundDataType = wwDefault
        end
      end
      object gboxDataLancamento: TGroupBox
        Left = 383
        Top = 1
        Width = 111
        Height = 52
        Align = alLeft
        Caption = ' Data do Lançamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        object dtpDtLancamento: TCMDateTimePicker
          Left = 12
          Top = 19
          Width = 85
          Height = 21
          Hint = 
            'Não informar para a data ser calculada de acordo com o cadastro ' +
            'dos layouts'
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
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          ShowButton = True
          TabOrder = 0
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 55
      Width = 788
      Height = 41
      Align = alTop
      TabOrder = 2
      object GroupBox2: TGroupBox
        Left = 4
        Top = 1
        Width = 482
        Height = 34
        Caption = 'Situação da Integração Contábil-Financeira'
        TabOrder = 0
        object lblContabil: TLabel
          Left = 4
          Top = 16
          Width = 60
          Height = 13
          Caption = 'lblContabil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblfinanc: TLabel
          Left = 248
          Top = 16
          Width = 49
          Height = 13
          Caption = 'lblfinanc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object memResult: TMemo
      Left = 1
      Top = 296
      Width = 788
      Height = 90
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  inherited Dock971: TDock97
    Top = 387
    Width = 790
    inherited tb97Fundo: TToolbar97
      Left = 377
      DockPos = 377
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 99
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 99
        Caption = '&Processar'
        Enabled = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 102
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 579
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 529
    Top = 20
  end
  object sdFile: TSaveDialog
    Left = 584
    Top = 72
  end
  object qryAux1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 529
    Top = 77
  end
  object qryConvLote: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDFUNDACAO, IDPROCCONV, IDLOTE, IDLAYOUT, IDFAVORECIDO, I' +
        'DRUBRICA,'
      
        '       TOTALIMPORTADO, TOTALNAOPROC, TOTALPROCINTEG, TOTALPROCPA' +
        'RC,'
      
        '       VALORIMPORTADO, VALORNAOPROC, VALORPROCINTEG, VALORPROCPA' +
        'RC,'
      
        '       FLGTIPOCONVENIO, FLGTRATARESIDUO, IDLOTEEXCESSO, CODDOCUM' +
        'ENTO,'
      '       99999999 AS INDICECAP,CARACNATUREZA'
      'FROM PROCCONVENIOLOTE'
      'WHERE 1=2'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updConvLote
    ValidateWithMask = True
    Left = 672
    Top = 288
  end
  object updConvLote: TUpdateSQL
    ModifySQL.Strings = (
      'update PROCCONVENIOLOTE'
      'set'
      '  IDFUNDACAO = :IDFUNDACAO,'
      '  IDPROCCONV = :IDPROCCONV,'
      '  IDLOTE = :IDLOTE,'
      '  IDLAYOUT = :IDLAYOUT,'
      '  IDFAVORECIDO = :IDFAVORECIDO,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  TOTALIMPORTADO = :TOTALIMPORTADO,'
      '  TOTALNAOPROC = :TOTALNAOPROC,'
      '  TOTALPROCINTEG = :TOTALPROCINTEG,'
      '  TOTALPROCPARC = :TOTALPROCPARC,'
      '  VALORIMPORTADO = :VALORIMPORTADO,'
      '  VALORNAOPROC = :VALORNAOPROC,'
      '  VALORPROCINTEG = :VALORPROCINTEG,'
      '  VALORPROCPARC = :VALORPROCPARC,'
      '  FLGTIPOCONVENIO = :FLGTIPOCONVENIO,'
      '  FLGTRATARESIDUO = :FLGTRATARESIDUO,'
      '  IDLOTEEXCESSO = :IDLOTEEXCESSO,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  CARACNATUREZA = :CARACNATUREZA'
      'where'
      '  IDFUNDACAO = :OLD_IDFUNDACAO and'
      '  IDPROCCONV = :OLD_IDPROCCONV and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDLAYOUT = :OLD_IDLAYOUT and'
      '  IDFAVORECIDO = :OLD_IDFAVORECIDO and'
      '  IDRUBRICA = :OLD_IDRUBRICA')
    InsertSQL.Strings = (
      'insert into PROCCONVENIOLOTE'
      '  (IDFUNDACAO, IDPROCCONV, IDLOTE, IDLAYOUT, IDFAVORECIDO, '
      'IDRUBRICA, TOTALIMPORTADO, '
      '   TOTALNAOPROC, TOTALPROCINTEG, TOTALPROCPARC, VALORIMPORTADO, '
      'VALORNAOPROC, '
      '   VALORPROCINTEG, VALORPROCPARC, FLGTIPOCONVENIO, '
      'FLGTRATARESIDUO, IDLOTEEXCESSO, '
      '   CODDOCUMENTO, CARACNATUREZA)'
      'values'
      '  (:IDFUNDACAO, :IDPROCCONV, :IDLOTE, :IDLAYOUT, :IDFAVORECIDO, '
      ':IDRUBRICA, '
      '   :TOTALIMPORTADO, :TOTALNAOPROC, :TOTALPROCINTEG, '
      ':TOTALPROCPARC, :VALORIMPORTADO, '
      '   :VALORNAOPROC, :VALORPROCINTEG, :VALORPROCPARC, '
      ':FLGTIPOCONVENIO, :FLGTRATARESIDUO, '
      '   :IDLOTEEXCESSO, :CODDOCUMENTO, :CARACNATUREZA)')
    DeleteSQL.Strings = (
      'delete from PROCCONVENIOLOTE'
      'where'
      '  IDFUNDACAO = :OLD_IDFUNDACAO and'
      '  IDPROCCONV = :OLD_IDPROCCONV and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDLAYOUT = :OLD_IDLAYOUT and'
      '  IDFAVORECIDO = :OLD_IDFAVORECIDO and'
      '  IDRUBRICA = :OLD_IDRUBRICA')
    Left = 672
    Top = 240
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 529
    Top = 133
  end
  object qryLote: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 350
    Top = 124
  end
  object qryTmpDesc: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 272
    Top = 178
  end
  object qryRubricaXPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      PRV.FLGDESCONTO,'
      '      RXP.CODCENTRORESPON,'
      '      RXP.UNIDNEGOC,'
      '      RXP.CODTIPRECDES,'
      '      RXP.RECPAG,'
      '      RXP.PLACONTAD,'
      '      RXP.PLANO,'
      '      RXP.PLACONTAC,'
      '      PLP.NOME'
      'FROM'
      '    RUBRICAXPLANO RXP,'
      '    PLANPREV PLP,'
      '    PROVDESC PRV'
      'WHERE'
      '     RXP.IDPESSJUR = :IDPESSJUR'
      '     AND RXP.IDRUBRICA = :IDRUBRICA'
      '     AND RXP.IDPLANOPREV = :IDPLANOPREV'
      '     AND PLP.IDPLANOPREV = :IDPLANOPREV'
      '     AND PRV.IDPROVENTO = RXP.IDRUBRICA'
      '')
    ValidateWithMask = True
    Left = 454
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryAux3: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 529
    Top = 189
  end
  object qryaux4: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 529
    Top = 245
  end
  object qryconvlote2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDFUNDACAO, IDPROCCONV, IDLOTE, IDLAYOUT, IDFAVORECIDO, I' +
        'DRUBRICA,'
      
        '       TOTALIMPORTADO, TOTALNAOPROC, TOTALPROCINTEG, TOTALPROCPA' +
        'RC,'
      
        '       VALORIMPORTADO, VALORNAOPROC, VALORPROCINTEG, VALORPROCPA' +
        'RC,'
      
        '       FLGTIPOCONVENIO, FLGTRATARESIDUO, IDLOTEEXCESSO, CODDOCUM' +
        'ENTO,'
      '       99999999 AS INDICECAP,CARACNATUREZA'
      'FROM PROCCONVENIOLOTE'
      'WHERE 1=2'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpdConvLote2
    ValidateWithMask = True
    Left = 656
    Top = 120
  end
  object UpdConvLote2: TUpdateSQL
    ModifySQL.Strings = (
      'update PROCCONVENIOLOTE'
      'set'
      '  IDFUNDACAO = :IDFUNDACAO,'
      '  IDPROCCONV = :IDPROCCONV,'
      '  IDLOTE = :IDLOTE,'
      '  IDLAYOUT = :IDLAYOUT,'
      '  IDFAVORECIDO = :IDFAVORECIDO,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  TOTALIMPORTADO = :TOTALIMPORTADO,'
      '  TOTALNAOPROC = :TOTALNAOPROC,'
      '  TOTALPROCINTEG = :TOTALPROCINTEG,'
      '  TOTALPROCPARC = :TOTALPROCPARC,'
      '  VALORIMPORTADO = :VALORIMPORTADO,'
      '  VALORNAOPROC = :VALORNAOPROC,'
      '  VALORPROCINTEG = :VALORPROCINTEG,'
      '  VALORPROCPARC = :VALORPROCPARC,'
      '  FLGTIPOCONVENIO = :FLGTIPOCONVENIO,'
      '  FLGTRATARESIDUO = :FLGTRATARESIDUO,'
      '  IDLOTEEXCESSO = :IDLOTEEXCESSO,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  CARACNATUREZA = :CARACNATUREZA'
      'where'
      '  IDFUNDACAO = :OLD_IDFUNDACAO and'
      '  IDPROCCONV = :OLD_IDPROCCONV and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDLAYOUT = :OLD_IDLAYOUT and'
      '  IDFAVORECIDO = :OLD_IDFAVORECIDO and'
      '  IDRUBRICA = :OLD_IDRUBRICA')
    InsertSQL.Strings = (
      'insert into PROCCONVENIOLOTE'
      '  (IDFUNDACAO, IDPROCCONV, IDLOTE, IDLAYOUT, IDFAVORECIDO, '
      'IDRUBRICA, TOTALIMPORTADO, '
      '   TOTALNAOPROC, TOTALPROCINTEG, TOTALPROCPARC, VALORIMPORTADO, '
      'VALORNAOPROC, '
      '   VALORPROCINTEG, VALORPROCPARC, FLGTIPOCONVENIO, '
      'FLGTRATARESIDUO, IDLOTEEXCESSO, '
      '   CODDOCUMENTO, CARACNATUREZA)'
      'values'
      '  (:IDFUNDACAO, :IDPROCCONV, :IDLOTE, :IDLAYOUT, :IDFAVORECIDO, '
      ':IDRUBRICA, '
      '   :TOTALIMPORTADO, :TOTALNAOPROC, :TOTALPROCINTEG, '
      ':TOTALPROCPARC, :VALORIMPORTADO, '
      '   :VALORNAOPROC, :VALORPROCINTEG, :VALORPROCPARC, '
      ':FLGTIPOCONVENIO, :FLGTRATARESIDUO, '
      '   :IDLOTEEXCESSO, :CODDOCUMENTO, :CARACNATUREZA)')
    DeleteSQL.Strings = (
      'delete from PROCCONVENIOLOTE'
      'where'
      '  IDFUNDACAO = :OLD_IDFUNDACAO and'
      '  IDPROCCONV = :OLD_IDPROCCONV and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDLAYOUT = :OLD_IDLAYOUT and'
      '  IDFAVORECIDO = :OLD_IDFAVORECIDO and'
      '  IDRUBRICA = :OLD_IDRUBRICA')
    Left = 656
    Top = 176
  end
  object qryAux5: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 529
    Top = 301
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select plainativa, platipo, plasubconta, placcust'
      'from planoconta'
      'where placonta = :placonta'
      'and plano = :plano'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 185
    Top = 126
    ParamData = <
      item
        DataType = ftString
        Name = 'placonta'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'plano'
        ParamType = ptUnknown
      end>
  end
end
