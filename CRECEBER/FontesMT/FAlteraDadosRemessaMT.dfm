inherited FrmAlteraDadosRemessaMT: TFrmAlteraDadosRemessaMT
  Left = 511
  Top = 246
  HelpContext = 40044
  BorderStyle = bsSingle
  Caption = 'Gera Remessa Para Alteração'
  ClientHeight = 506
  ClientWidth = 785
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 785
    Height = 467
    object Panel1: TPanel [0]
      Left = 1
      Top = 1
      Width = 783
      Height = 120
      Align = alTop
      TabOrder = 0
      object bbtnSelecionaDoc: TToolbarButton97
        Left = 894
        Top = 41
        Width = 65
        Height = 49
        Caption = '&Seleciona'
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
      object Label2: TLabel
        Left = 27
        Top = 13
        Width = 102
        Height = 13
        Caption = 'Tipo de Cobrança'
      end
      object lblDataProgramada: TLabel
        Left = 312
        Top = 13
        Width = 99
        Height = 13
        Caption = 'Data Programada'
      end
      object Label1: TLabel
        Left = 978
        Top = 45
        Width = 83
        Height = 13
        Caption = 'Nosso Número'
        Visible = False
      end
      object lblDocumento: TLabel
        Left = 423
        Top = 13
        Width = 97
        Height = 13
        Hint = 'Um ou mais documentos, separados por vírgula'
        Caption = 'Nº Documento(s)'
        ParentShowHint = False
        ShowHint = True
      end
      object DbLcPortador: TwwDBLookupCombo
        Left = 27
        Top = 28
        Width = 282
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'Descrição')
        LookupTable = CdsBanco
        LookupField = 'CODPORTFORMA'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = DbLcPortadorCloseUp
      end
      object dtedDataProg: TCMDateTimePicker
        Left = 312
        Top = 28
        Width = 102
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
        TabOrder = 1
        DisplayFormat = 'dd/MM/yyyy'
      end
      object EdtNossoNum: TEdit
        Left = 977
        Top = 60
        Width = 165
        Height = 21
        TabOrder = 3
        Visible = False
      end
      object mmoDocumento: TMemo
        Left = 423
        Top = 28
        Width = 462
        Height = 76
        Hint = 'Um ou mais documentos, separados por vírgula'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
    end
    inherited CPForCli: TCMProcuraForCli
      Left = 28
      Top = 52
      Width = 387
      Height = 53
      TabOrder = 1
      TabStop = True
    end
    object Panel2: TPanel
      Left = 1
      Top = 504
      Width = 783
      Height = 483
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelWidth = 2
      Caption = 'Panel2'
      TabOrder = 5
      object GrdDocSel: TwwDBGrid
        Left = 2
        Top = 33
        Width = 779
        Height = 448
        Selected.Strings = (
          'NOME'#9'45'#9'Cliente'
          'NOSSONUMERO'#9'20'#9'Nosso Número'
          'NODOCUMENTO'#9'20'#9'Número do Doumento'
          'COMPLDOCUMENTO'#9'3'#9'Cpl'
          'DATAPROGRAMADA'#9'10'#9'Data Prog'
          'VALOR'#9'20'#9'Valor')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsDocSel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyOptions = []
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'Small Fonts'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = True
        OnCalcCellColors = GrdDocEmitCalcCellColors
        IndicatorColor = icBlack
      end
      object Pnldocpago: TPanel
        Left = 2
        Top = 2
        Width = 779
        Height = 31
        Align = alTop
        BevelInner = bvLowered
        BevelWidth = 2
        Caption = 'Documentos a Serem Alterados na Nova Remessa'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
    end
    object TPanel
      Left = 1
      Top = 121
      Width = 783
      Height = 332
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelWidth = 2
      TabOrder = 3
      object Panel8: TPanel
        Left = 2
        Top = 2
        Width = 779
        Height = 30
        Align = alTop
        BevelInner = bvLowered
        BevelWidth = 2
        Caption = 'Documentos Emitidos Via Cobrança Eletrônica'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object GrdDocEmit: TwwDBGrid
        Left = 2
        Top = 32
        Width = 779
        Height = 298
        Selected.Strings = (
          'NOME'#9'45'#9'Cliente'
          'NOSSONUMERO'#9'20'#9'Nosso Número'
          'NODOCUMENTO'#9'20'#9'Número do Doumento'
          'COMPLDOCUMENTO'#9'3'#9'Cpl'
          'DATAPROGRAMADA'#9'10'#9'Data Prog'
          'VALOR'#9'20'#9'Valor')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsDocEmit
        EditCalculated = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyOptions = []
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'Small Fonts'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = True
        OnCalcCellColors = GrdDocEmitCalcCellColors
        IndicatorColor = icBlack
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 453
      Width = 783
      Height = 51
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 4
      object bbtnincluir: TBitBtn
        Left = 552
        Top = 14
        Width = 150
        Height = 28
        Caption = '&Incluir Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
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
        Left = 718
        Top = 14
        Width = 150
        Height = 28
        Caption = '&Excluir Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
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
      object GroupBox2: TGroupBox
        Left = 27
        Top = 2
        Width = 516
        Height = 46
        Caption = ' Código da Operação'
        TabOrder = 0
        object CmbOperacao: TComboBox
          Left = 6
          Top = 17
          Width = 504
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
        end
      end
    end
    object PnlCamposParaAlteracao: TPanel
      Left = 381
      Top = 77
      Width = 361
      Height = 377
      BevelInner = bvLowered
      BevelWidth = 2
      TabOrder = 2
      Visible = False
      object Panel5: TPanel
        Left = 4
        Top = 4
        Width = 353
        Height = 22
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = 'Selecione os Campos a Serem Alterados Na Remessa'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object SpeedButton1: TSpeedButton
          Left = 333
          Top = 2
          Width = 18
          Height = 18
          Caption = 'X'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton1Click
        end
      end
      object CklCampos: TCMchklistbox
        Left = 4
        Top = 26
        Width = 353
        Height = 318
        GlyphChecked.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FF00F000000000000F00F0FFFFFFFFFF0F00F0FFF0FFFFFF0F00F0FF000FFFFF
          0F00F0F00000FFFF0F00F0F00F000FFF0F00F0F0FFF000FF0F00F0FFFFFF000F
          0F00F0FFFFFFF00F0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F00000000000
          0F00FFFFFFFFFFFFFF00}
        GlyphUnchecked.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FF00F000000000000F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF
          0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF
          0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F0FFFFFFFFFF0F00F00000000000
          0F00FFFFFFFFFFFFFF00}
        GlyphTopMargin = 0
        GlyphLeftMargin = 0
        TextLeftMargin = 0
        ReadOnly = False
        Align = alClient
        ItemHeight = 16
        ItemIndex = 0
        TabOrder = 1
      end
      object Panel4: TPanel
        Left = 4
        Top = 344
        Width = 353
        Height = 29
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object BtnContinuar: TBitBtn
          Left = 251
          Top = 2
          Width = 99
          Height = 25
          Caption = 'Continuar'
          TabOrder = 0
          OnClick = bbtnConfirmarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00370777033333
            3330337F3F7F33333F3787070003333707303F737773333373F7007703333330
            700077337F3333373777887007333337007733F773F333337733700070333333
            077037773733333F7F37703707333300080737F373333377737F003333333307
            78087733FFF3337FFF7F33300033330008073F3777F33F777F73073070370733
            078073F7F7FF73F37FF7700070007037007837773777F73377FF007777700730
            70007733FFF77F37377707700077033707307F37773F7FFF7337080777070003
            3330737F3F7F777F333778080707770333333F7F737F3F7F3333080787070003
            33337F73FF737773333307800077033333337337773373333333}
          NumGlyphs = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 467
    Width = 785
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 40044
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 143
    Top = 149
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object SqlBanco: TCMSqlParams
    ClientDataSet = CdsBanco
    Left = 143
    Top = 106
  end
  object SqlDocEmit: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT (0) As VALOR,'
      '       E.CEP, ES.CODESTADO,'
      '       C.NOME AS CIDADE, E.BAIRRO,'
      '       E.COMPLEMENTO, E.NUMERO,'
      '       E.LOGRADOURO, P.NUMDOCUMENTO,'
      '       P.RAZAOSOCIAL AS NOME,'
      '       D.VALORDESCONTO, D.DATALIMITE,'
      '       D.DATAPROGRAMADA, D.CODPORTFORMA,'
      '       D.DATAVENCTO, D.NOSSONUMERO,'
      '       D.DATAEMISSAO, D.NODOCUMENTO, M.MOESIGLA,'
      '       D.CODDOCUMENTO, P.TIPO, D.COMPLDOCUMENTO,'
      '       E.TIPOENDERECO,  AB.NUMAGENCIA,'
      '       PC.NOCONTACORR AS NUMCONTA,'
      
        '       F.JUROSPORDIA AS VALORJUROS,    D.IDFORCLI,    F.NUMRAZAO' +
        'CC,'
      '       ('#39'N'#39') AS FLGGRUPO'
      'FROM'
      
        '   PESSOA P, DOCUMENTO D, PORTADORFORMA F , MOEDA M, AGENCIABANC' +
        'ARIA AB, PORTADORCONTA PC,'
      '   ENDPESS E, CIDADES C, ESTADO ES WHERE  1=2'
      ''
      ' '
      ' '
      ' ')
    ClientDataSet = CdsDocEmi
    Left = 85
    Top = 107
  end
  object DsDocEmit: TwwDataSource
    DataSet = CdsDocEmi
    Left = 85
    Top = 150
  end
  object SqlDocSel: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT (0) As VALOR,'
      '   E.CEP, ES.CODESTADO, C.NOME AS CIDADE,'
      '   E.BAIRRO, E.COMPLEMENTO, E.NUMERO,'
      '   E.LOGRADOURO, P.NUMDOCUMENTO,'
      '   P.RAZAOSOCIAL AS NOME,'
      
        '   D.VALORDESCONTO, D.DATALIMITE, D.DATAPROGRAMADA, D.CODPORTFOR' +
        'MA, D.DATAVENCTO,'
      
        '   D.NOSSONUMERO, D.DATAEMISSAO, D.NODOCUMENTO, M.MOESIGLA, D.CO' +
        'DDOCUMENTO, P.TIPO,'
      
        '   D.COMPLDOCUMENTO, E.TIPOENDERECO,  AB.NUMAGENCIA, PC.NOCONTAC' +
        'ORR AS NUMCONTA,'
      '   F.JUROSPORDIA AS VALORJUROS,'
      '   D.IDFORCLI,   F.NUMRAZAOCC,'
      
        '   ('#39'N'#39') AS FLGGRUPO,  ('#39'N'#39') AS FLGGRUPO, (0) AS VALOROM, ('#39'01'#39')' +
        ' AS CODOCORRENCIA'
      'FROM'
      
        '    PESSOA P, DOCUMENTO D, PORTADORFORMA F , MOEDA M, AGENCIABAN' +
        'CARIA AB, PORTADORCONTA PC,'
      '    ENDPESS E, CIDADES C, ESTADO ES WHERE  1=2'
      ''
      ''
      ' ')
    ClientDataSet = CdsDocSel
    Left = 53
    Top = 322
  end
  object DsDocSel: TwwDataSource
    DataSet = CdsDocSel
    Left = 53
    Top = 369
  end
  object CdsDocEmi: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 85
    Top = 193
    Data = {
      7C0300009619E0BD01000000180000001B0000000000030000007C030556414C
      4F52080004000000000003434550010049000000010005574944544802000200
      080009434F4445535441444F0100490000000200075355425459504502004900
      0A00466978656443686172000557494454480200020003000643494441444501
      004900000001000557494454480200020032000642414952524F010049000000
      01000557494454480200020014000B434F4D504C454D454E544F010049000000
      0100055749445448020002001400064E554D45524F0100490000000100055749
      4454480200020008000A4C4F475241444F55524F010049000000010005574944
      5448020002003C000C4E554D444F43554D454E544F0100490000000200075355
      4254595045020049000A00466978656443686172000557494454480200020012
      00044E4F4D450100490000000100055749445448020002003C000D56414C4F52
      444553434F4E544F08000400000000000A444154414C494D4954450800080000
      0000000E4441544150524F4752414D41444108000800000000000C434F44504F
      5254464F524D4108000400000000000A4441544156454E43544F080008000000
      00000B4E4F53534F4E554D45524F010049000000010005574944544802000200
      14000B44415441454D495353414F08000800000000000B4E4F444F43554D454E
      544F0800040000000000084D4F455349474C4101004900000001000557494454
      48020002000A000C434F44444F43554D454E544F080004000000000004544950
      4F01004900000002000753554254595045020049000A00466978656443686172
      000557494454480200020001000E434F4D504C444F43554D454E544F01004900
      000002000753554254595045020049000A004669786564436861720005574944
      54480200020003000C5449504F454E44455245434F0100490000000200075355
      4254595045020049000A00466978656443686172000557494454480200020005
      000A4E554D4147454E4349410100490000000200075355425459504502004900
      0A0046697865644368617200055749445448020002000F00084E554D434F4E54
      4101004900000002000753554254595045020049000A00466978656443686172
      00055749445448020002000F000A56414C4F524A55524F530800040000000000
      084944464F52434C4908000400000000000100044C4349440400010009080000}
  end
  object CdsDocSel: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 53
    Top = 416
    Data = {
      7C0300009619E0BD01000000180000001B0000000000030000007C030556414C
      4F52080004000000000003434550010049000000010005574944544802000200
      080009434F4445535441444F0100490000000200075355425459504502004900
      0A00466978656443686172000557494454480200020003000643494441444501
      004900000001000557494454480200020032000642414952524F010049000000
      01000557494454480200020014000B434F4D504C454D454E544F010049000000
      0100055749445448020002001400064E554D45524F0100490000000100055749
      4454480200020008000A4C4F475241444F55524F010049000000010005574944
      5448020002003C000C4E554D444F43554D454E544F0100490000000200075355
      4254595045020049000A00466978656443686172000557494454480200020012
      00044E4F4D450100490000000100055749445448020002003C000D56414C4F52
      444553434F4E544F08000400000000000A444154414C494D4954450800080000
      0000000E4441544150524F4752414D41444108000800000000000C434F44504F
      5254464F524D4108000400000000000A4441544156454E43544F080008000000
      00000B4E4F53534F4E554D45524F010049000000010005574944544802000200
      14000B44415441454D495353414F08000800000000000B4E4F444F43554D454E
      544F0800040000000000084D4F455349474C4101004900000001000557494454
      48020002000A000C434F44444F43554D454E544F080004000000000004544950
      4F01004900000002000753554254595045020049000A00466978656443686172
      000557494454480200020001000E434F4D504C444F43554D454E544F01004900
      000002000753554254595045020049000A004669786564436861720005574944
      54480200020003000C5449504F454E44455245434F0100490000000200075355
      4254595045020049000A00466978656443686172000557494454480200020005
      000A4E554D4147454E4349410100490000000200075355425459504502004900
      0A0046697865644368617200055749445448020002000F00084E554D434F4E54
      4101004900000002000753554254595045020049000A00466978656443686172
      00055749445448020002000F000A56414C4F524A55524F530800040000000000
      084944464F52434C4908000400000000000100044C4349440400010009080000}
  end
  object CdsBanco: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 143
    Top = 192
  end
end
