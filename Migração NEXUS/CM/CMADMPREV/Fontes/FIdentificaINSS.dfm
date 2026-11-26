inherited frmIdentificaINSS: TfrmIdentificaINSS
  Left = 344
  Top = 159
  HelpContext = 160093
  BorderStyle = bsSingle
  Caption = 'Identificação de Processos'
  ClientHeight = 450
  ClientWidth = 766
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 766
    Height = 411
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 764
      Height = 164
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 6
        Width = 52
        Height = 13
        Caption = 'Mês/Ano'
      end
      object DBgrdDetConc: TwwDBGrid
        Left = 194
        Top = 4
        Width = 560
        Height = 155
        Selected.Strings = (
          'NUMPROCINSS'#9'13'#9'Num.Proc.INSS'#9'F'
          'ESPECIE'#9'7'#9'Espécie'#9'F'
          'DIB'#9'10'#9'DIB'#9'F'
          'NOME'#9'35'#9'Nome'#9'F'
          'NOMEMANTENEDORA'#9'20'#9'Mantenedora'#9'F'
          'PLANOCONTABIL'#9'20'#9'Entidade Contábil'#9'F'
          'CODCONCESSORINSS'#9'8'#9'Órgão Concessor'#9'F'
          'CODMANTENEDORINSS'#9'8'#9'Órgão Mantenedor'#9'F'
          'CODSINONIMO'#9'10'#9'Código Sinônimo'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        OnRowChanged = DBgrdDetConcRowChanged
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsBeneficiario
        ReadOnly = True
        TabOrder = 5
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
      object btnProcurar: TButton
        Left = 7
        Top = 136
        Width = 183
        Height = 23
        Caption = 'Procurar na base'
        TabOrder = 4
        OnClick = btnProcurarClick
      end
      object cboMes: TComboBox
        Left = 8
        Top = 21
        Width = 129
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        OnChange = cboMesExit
        OnExit = cboMesExit
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
      object grpTipo: TRadioGroup
        Left = 8
        Top = 46
        Width = 137
        Height = 62
        Caption = 'Tipo de Procura'
        ItemIndex = 0
        Items.Strings = (
          '1o Nome'
          '1o e 2o Nomes'
          'Possui o Texto')
        TabOrder = 2
      end
      object edPossui: TEdit
        Left = 7
        Top = 112
        Width = 183
        Height = 21
        TabOrder = 3
      end
      object DBspnAno: TwwDBSpinEdit
        Left = 136
        Top = 21
        Width = 57
        Height = 21
        Increment = 1
        TabOrder = 1
        UnboundDataType = wwDefault
        OnExit = cboMesExit
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 165
      Width = 764
      Height = 245
      Align = alClient
      TabOrder = 1
      object Label4: TLabel
        Left = 9
        Top = 166
        Width = 75
        Height = 13
        Caption = 'Mantenedora'
      end
      object Label5: TLabel
        Left = 261
        Top = 166
        Width = 101
        Height = 13
        Caption = 'Entidade Contábil'
      end
      object Label2: TLabel
        Left = 8
        Top = 204
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label15: TLabel
        Left = 136
        Top = 204
        Width = 116
        Height = 13
        Caption = 'Data de Início (DIB)'
      end
      object Label6: TLabel
        Left = 513
        Top = 166
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object Panel11: TPanel
        Left = 478
        Top = 4
        Width = 276
        Height = 20
        BevelOuter = bvNone
        Caption = 'Reembolso INSS'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
      end
      object DBgrdReembolso: TwwDBGrid
        Left = 478
        Top = 24
        Width = 277
        Height = 141
        Selected.Strings = (
          'MESREFERENCIA'#9'8'#9'Ref.'
          'RUBRICAINSS'#9'8'#9'Rubrica'
          'SINAL'#9'5'#9'Sinal'
          'VALORINSS'#9'11'#9'Valor'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsReembolso
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object DBcboMantenedora: TwwDBLookupCombo
        Left = 9
        Top = 180
        Width = 242
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Mantenedora'#9'F'
          'CODMANTENEDORA'#9'10'#9'Código'#9'F')
        LookupTable = qryMantenedora
        LookupField = 'CODMANTENEDORA'
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = DBcboMantenedoraChange
      end
      object DBcboPlanPrevContab: TwwDBLookupCombo
        Left = 261
        Top = 180
        Width = 242
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'Entidade'#9'F'
          'IDPLANOPREV'#9'10'#9'Código'#9'F')
        LookupTable = qryPlanPrevContab
        LookupField = 'IDPLANOPREV'
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = DBcboPlanPrevContabCloseUp
        OnExit = DBcboPlanPrevContabExit
      end
      object edtDIB: TCMDateTimePicker
        Left = 136
        Top = 218
        Width = 113
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DIB'
        DataSource = dsBeneficiario
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
        TabOrder = 6
      end
      object edMatricula: TDBEdit
        Left = 8
        Top = 218
        Width = 105
        Height = 21
        DataField = 'MATRICULA'
        DataSource = dsPessoa
        TabOrder = 5
      end
      object DBcboPlanoPrevidenciario: TwwDBLookupCombo
        Left = 513
        Top = 180
        Width = 242
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'Nome'#9'F'
          'IDPLANOPREV'#9'10'#9'Código'#9'F')
        LookupTable = qryLookPLANO
        LookupField = 'IDPLANOPREV'
        Options = [loTitles]
        Style = csDropDownList
        Enabled = False
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object DBgrdPessoa: TwwDBGrid
        Left = 10
        Top = 23
        Width = 455
        Height = 142
        Selected.Strings = (
          'MATRICULA'#9'13'#9'Matricula'#9'F'
          'NOME'#9'30'#9'Nome'#9'F'
          'PATRO'#9'15'#9'Patrocinadora'#9'F'
          'DESCRICAO'#9'25'#9'Situação'#9'F'
          'NUMDOCUMENTO'#9'18'#9'CPF'#9'F'
          'DATANASC'#9'18'#9'Nascimento'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        OnRowChanged = DBgrdPessoaRowChanged
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsPessoa
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel2: TPanel
        Left = 10
        Top = 4
        Width = 454
        Height = 19
        BevelOuter = bvNone
        BorderWidth = 1
        Caption = 'Pessoas Homônimas'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
      end
    end
  end
  inherited Dock971: TDock97
    Top = 411
    Width = 766
    inherited tb97Fundo: TToolbar97
      Left = 261
      DockPos = 261
      inherited sep1: TToolbarSep97
        Left = 180
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 97
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 99
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 182
      end
      object Identificar: TBitBtn
        Left = 0
        Top = 0
        Width = 97
        Height = 33
        Caption = '&Identificar'
        TabOrder = 2
        OnClick = IdentificarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 987
    TargetsData = (
      1
      1
      (
        ''
        'DisplayLabel'
        0))
  end
  object OpenDialog1: TOpenDialog
    Left = 584
    Top = 112
  end
  object UpdateSQL1: TUpdateSQL
    Left = 376
    Top = 264
  end
  object ppLeituraArq: TppBDEPipeline
    UserName = 'LeituraArq'
    Left = 672
    Top = 256
    object ppLeituraArqppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RUBRICA'
      FieldName = 'RUBRICA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 6
      Position = 0
    end
    object ppLeituraArqppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTIDADE'
      FieldName = 'QUANTIDADE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 8
      Position = 1
    end
    object ppLeituraArqppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 25
      Position = 2
    end
    object ppLeituraArqppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 4
      Position = 3
    end
    object ppLeituraArqppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORINFO'
      FieldName = 'VALORINFO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
  end
  object prLeituaArq: TppReport
    AutoStop = False
    DataPipeline = ppLeituraArq
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
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
    Left = 672
    Top = 240
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppLeituraArq'
    object ppHeaderBand15: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 44715
      mmPrintPosition = 0
      object ppDBImage14: TppDBImage
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
      object ppDBText212: TppDBText
        UserName = 'DBText41'
        AutoSize = True
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 14817
        BandType = 0
      end
      object ppDBText213: TppDBText
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
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText214: TppDBText
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
      object ppDBText215: TppDBText
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
        mmLeft = 96044
        mmTop = 12965
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText216: TppDBText
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
      object ppDBText217: TppDBText
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
      object ppDBText218: TppDBText
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
      object ppLabel206: TppLabel
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
      object ppDBText219: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel210: TppLabel
        UserName = 'Label65'
        Caption = 'Resultado da Leitura do Arquivo DataPrev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 58208
        mmTop = 27517
        mmWidth = 84931
        BandType = 0
      end
      object ppLine62: TppLine
        UserName = 'Line9'
        Pen.Color = clWindowText
        Pen.Width = 3
        Position = lpBottom
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 33338
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel212: TppLabel
        UserName = 'Label212'
        Caption = 'Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 30427
        mmTop = 39423
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel214: TppLabel
        UserName = 'Label214'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 76729
        mmTop = 39423
        mmWidth = 19579
        BandType = 0
      end
      object ppLine64: TppLine
        UserName = 'Line64'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 529
        mmTop = 43921
        mmWidth = 225161
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 130969
        mmTop = 39423
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 39423
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Valor Info.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 168275
        mmTop = 39423
        mmWidth = 17463
        BandType = 0
      end
    end
    object ppDetailBand16: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object shp1: TppShape
        UserName = 'shp1'
        Pen.Color = clWhite
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 4
      end
      object ppDBText220: TppDBText
        UserName = 'DBText220'
        DataField = 'RUBRICA'
        DataPipeline = ppLeituraArq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3175
        mmLeft = 30427
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText221: TppDBText
        UserName = 'DBText221'
        DataField = 'QUANTIDADE'
        DataPipeline = ppLeituraArq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3175
        mmLeft = 79111
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = ppLeituraArq
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3175
        mmLeft = 130440
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2201'
        DataField = 'TIPO'
        DataPipeline = ppLeituraArq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'VALORINFO'
        DataPipeline = ppLeituraArq
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3175
        mmLeft = 176213
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
    end
    object ppFooterBand15: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine63: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel213: TppLabel
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
        mmWidth = 284163
        BandType = 8
      end
      object ppSystemVariable27: TppSystemVariable
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
        mmLeft = 0
        mmTop = 3175
        mmWidth = 197644
        BandType = 8
      end
    end
    object ppSummaryBand13: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = ppLeituraArq
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3175
        mmLeft = 119856
        mmTop = 0
        mmWidth = 20108
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        AutoSize = True
        DataField = 'QUANTIDADE'
        DataPipeline = ppLeituraArq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3175
        mmLeft = 67733
        mmTop = 0
        mmWidth = 28575
        BandType = 7
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Total Geral :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 43656
        mmTop = 0
        mmWidth = 16140
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        AutoSize = True
        DataField = 'VALORINFO'
        DataPipeline = ppLeituraArq
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLeituraArq'
        mmHeight = 3175
        mmLeft = 159015
        mmTop = 0
        mmWidth = 26723
        BandType = 7
      end
    end
  end
  object ppdsnLeituraArq: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = prLeituaArq
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 672
    Top = 224
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
    Left = 592
    Top = 256
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
    Left = 592
    Top = 240
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 592
    Top = 224
  end
  object qryAux: TwwQuery
    AutoCalcFields = False
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 384
    Top = 208
  end
  object dsPessoa: TwwDataSource
    DataSet = qryPessoa
    Left = 192
    Top = 272
  end
  object qryPessoa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '  SELECT'
      '   NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA,'
      '   PES.IDPESSOA,'
      '   DEP.IDTITULAR,'
      '   PES.NOME,'
      '   PFI.DATANASC,'
      '   PES.NUMDOCUMENTO,'
      '   SIT.DESCRICAO,'
      '   PTR.NOME AS PATRO,'
      '   PPP.IDPLANOPREV'
      ''
      'FROM'
      '   PESSOA       PES,'
      '   PESSOA       PTR,'
      '       PESSOAFISICA PFI,'
      '       ELEGPATRO    ELP,'
      '       DEPENTIT     DEP,'
      '   PARTPREVPLAN PPP,'
      '   SITPART      SIT'
      ''
      'WHERE'
      '       PES.NOME            LIKE :NOME'
      '   AND PES.IDPESSOA        = PFI.IDPESSOA'
      '   AND PES.IDPESSOA        = ELP.IDPESSOA(+)'
      '   AND PES.IDPESSOA        = DEP.IDPESSOA(+)'
      '   AND DEP.IDPESSOA        = PPP.IDPESSOA(+)'
      '   AND PPP.IDSITPART       = SIT.IDSITPART(+)'
      '   AND ELP.IDPESSJUR       = PTR.IDPESSOA(+)'
      '   AND PPP.FLGDESATIVADO   = 0'
      ''
      'ORDER BY'
      '   PES.NOME')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 192
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NOME'
        ParamType = ptUnknown
      end>
    object qryPessoaMATRICULA: TStringField
      DisplayLabel = 'Matricula'
      DisplayWidth = 13
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryPessoaNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'NOME'
      Size = 60
    end
    object qryPessoaPATRO: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 15
      FieldName = 'PATRO'
      Size = 60
    end
    object qryPessoaDESCRICAO: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 25
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryPessoaNUMDOCUMENTO: TStringField
      DisplayLabel = 'CPF'
      DisplayWidth = 18
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryPessoaDATANASC: TDateTimeField
      DisplayLabel = 'Nascimento'
      DisplayWidth = 18
      FieldName = 'DATANASC'
    end
    object qryPessoaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryPessoaIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryPessoaIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Visible = False
    end
  end
  object qryBeneficiario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  T.NUMPROCINSS,'
      '  T.NOME,'
      '  '#39'NÃO IDENTIFICADA'#39' AS NOMEMANTENEDORA,'
      '  '#39'NÃO IDENTIFICADO'#39' AS PLANOCONTABIL,'
      '  MIN(T.DIB) AS DIB,'
      '  T.ESPECIE,'
      '  T.CODCONCESSORINSS,'
      '  T.CODMANTENEDORINSS,'
      '  T.CODSINONIMO  '
      '  '
      ''
      'FROM'
      '  TEMPCONCINSS T'
      ''
      'WHERE'
      '   T.MESPROCESSAMENTO =:MESPROCESSAMENTO'
      ''
      'GROUP BY'
      '  T.NUMPROCINSS,'
      '  T.NOME,'
      '  T.ESPECIE,'
      '  T.CODCONCESSORINSS,'
      '  T.CODMANTENEDORINSS,'
      '  T.CODSINONIMO'
      ''
      'ORDER BY'
      '  T.NOME')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 88
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'mesprocessamento'
        ParamType = ptUnknown
        Value = '2003/12'
      end>
    object qryBeneficiarioNUMPROCINSS: TStringField
      DisplayLabel = 'Num.Proc.INSS'
      DisplayWidth = 13
      FieldName = 'NUMPROCINSS'
      Size = 15
    end
    object qryBeneficiarioESPECIE: TStringField
      DisplayLabel = 'Espécie'
      DisplayWidth = 7
      FieldName = 'ESPECIE'
      Size = 6
    end
    object qryBeneficiarioDIB: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DIB'
    end
    object qryBeneficiarioNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 35
      FieldName = 'NOME'
      Size = 60
    end
    object qryBeneficiarioNOMEMANTENEDORA: TStringField
      DisplayLabel = 'Mantenedora'
      DisplayWidth = 20
      FieldName = 'NOMEMANTENEDORA'
      FixedChar = True
      Size = 16
    end
    object qryBeneficiarioPLANOCONTABIL: TStringField
      DisplayLabel = 'Entidade Contábil'
      DisplayWidth = 20
      FieldName = 'PLANOCONTABIL'
      FixedChar = True
      Size = 16
    end
    object qryBeneficiarioCODCONCESSORINSS: TStringField
      DisplayLabel = 'Órgão Concessor'
      DisplayWidth = 8
      FieldName = 'CODCONCESSORINSS'
      Size = 8
    end
    object qryBeneficiarioCODMANTENEDORINSS: TStringField
      DisplayLabel = 'Órgão Mantenedor'
      DisplayWidth = 8
      FieldName = 'CODMANTENEDORINSS'
      Size = 8
    end
    object qryBeneficiarioCODSINONIMO: TFloatField
      DisplayLabel = 'Código Sinônimo'
      DisplayWidth = 10
      FieldName = 'CODSINONIMO'
    end
  end
  object dsMantenedora: TwwDataSource
    DataSet = qryMantenedora
    Left = 280
    Top = 272
  end
  object qryMantenedora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODMANTENEDORA, NOME'
      'FROM MANTENEDORA'
      'ORDER BY NOME'
      ''
      ''
      ''
      ''
      ' ')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 280
    Top = 256
  end
  object dsBeneficiario: TwwDataSource
    DataSet = qryBeneficiario
    Left = 112
    Top = 160
  end
  object qryReembolso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT D.MESREFERENCIA, D.MESPROCESSAMENTO AS MESCOBRANCA, D.NUM' +
        'PROCINSS,'
      '       D.VLRRUBRICA1 AS VALORINSS,'
      '       DECODE(SUBSTR(CODRUBRICA1,1,1),'#39'9'#39','
      
        '          DECODE(SUBSTR(CODRUBRICA1,1,2),'#39'91'#39','#39'(-)'#39','#39'92'#39','#39'(+)'#39') ' +
        ','
      '          DECODE(SUBSTR(CODRUBRICA1,2,1),'#39'1'#39','#39'(+)'#39','#39'2'#39','#39'(-)'#39'),'
      
        '          DECODE(SUBSTR(CODRUBRICA1,1,2),'#39'10'#39','#39'(-)'#39','#39'30'#39','#39'(+)'#39') ' +
        ')'
      '       AS SINAL,'
      
        '       CODRUBRICA1 AS RUBRICAINSS, TO_CHAR(CODRUBRICA1) AS DESCR' +
        'RUBRICA, TOTAL.VALOR'
      'FROM TEMPCONCINSS D,'
      '     (SELECT SUM(DECODE(SUBSTR(CODRUBRICA1,1,1),'#39'9'#39','
      
        '          DECODE(SUBSTR(CODRUBRICA1,1,2),'#39'91'#39',-VLRRUBRICA1,'#39'92'#39',' +
        'VLRRUBRICA1) ,'
      
        '          DECODE(SUBSTR(CODRUBRICA1,2,1),'#39'1'#39',VLRRUBRICA1,'#39'2'#39',-VL' +
        'RRUBRICA1),'
      
        '          DECODE(SUBSTR(CODRUBRICA1,1,2),'#39'10'#39',-VLRRUBRICA1,'#39'30'#39',' +
        'VLRRUBRICA1) )) AS VALOR'
      '      FROM TEMPCONCINSS H'
      '      WHERE (H.NUMPROCINSS      = :numproc)  AND'
      '            (H.MESPROCESSAMENTO = :mesprocessamento ) ) TOTAL'
      'WHERE (D.NUMPROCINSS      = :numproc) AND'
      '      (D.MESPROCESSAMENTO = :mesprocessamento )'
      ''
      'ORDER BY MESCOBRANCA DESC'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 192
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptUnknown
        Value = '1003167354'
      end
      item
        DataType = ftString
        Name = 'mesprocessamento'
        ParamType = ptUnknown
        Value = '2003/12'
      end
      item
        DataType = ftString
        Name = 'numproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mesprocessamento'
        ParamType = ptUnknown
      end>
  end
  object dsReembolso: TwwDataSource
    DataSet = qryReembolso
    Left = 192
    Top = 192
  end
  object qryPlanPrevContab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME'
      'FROM   PLANPREVCONTABIL'
      'WHERE  NVL(ATIVO,'#39'S'#39') = '#39'S'#39
      'ORDER BY NOME'
      ''
      '')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 280
    Top = 208
    object qryPlanPrevContabNOME: TStringField
      DisplayLabel = 'Entidade'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.NOME'
      Size = 50
    end
    object qryPlanPrevContabIDPLANOPREV: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.IDPLANOPREV'
    end
  end
  object dsPlanPrevContab: TwwDataSource
    DataSet = qryPlanPrevContab
    Left = 280
    Top = 192
  end
  object qryFolhaFuncef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  B.IDPLANOPREV,'
      '  B.IDPLANPREVCONTAB,'
      '  B.NUMPROCINSS,'
      '  B.DATAINICIOINSS AS DIB'
      ''
      'FROM'
      '  BENEFBFCIARIO B,'
      '  BENEFPLANPREV BF'
      ''
      'WHERE'
      '      BF.FLGREFERENCIA = 1'
      '  AND B.IDPESSOA       = :PIDPESSOA'
      '  AND B.IDTITULAR      = :PIDTITULAR'
      '  AND B.IDPLANOPREV    = BF.IDPLANOPREV'
      '  AND B.IDBENEFICIO    = BF.IDBENEFICIO')
    PictureMasks.Strings = (
      'MES'#9'999,999,999.99'#9'T'#9'T')
    ValidateWithMask = True
    Left = 120
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTITULAR'
        ParamType = ptInput
      end>
    object qryFolhaFuncefIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPLANOPREV'
    end
    object qryFolhaFuncefNUMPROCINSS: TStringField
      FieldName = 'NUMPROCINSS'
      Origin = 'BASEDADOS.BENEFBFCIARIO.NUMPROCINSS'
      Size = 15
    end
    object qryFolhaFuncefDIB: TDateTimeField
      FieldName = 'DIB'
      Origin = 'BASEDADOS.BENEFBFCIARIO.DATAINICIOINSS'
    end
    object qryFolhaFuncefIDPLANPREVCONTAB: TFloatField
      FieldName = 'IDPLANPREVCONTAB'
      Origin = 'BASEDADOS.BENEFBFCIARIO.IDPLANPREVCONTAB'
    end
  end
  object dsFolhaFuncef: TwwDataSource
    DataSet = qryFolhaFuncef
    Left = 120
    Top = 256
  end
  object qryDeleteTempConc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM'
      '   TEMPCONCINSS T'
      'WHERE'
      '       T.NUMPROCINSS      =:PNUMPROCINSS'
      '   AND T.MESPROCESSAMENTO =:PMESPROCESSAMENTO')
    ValidateWithMask = True
    Left = 688
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'PNUMPROCINSS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESPROCESSAMENTO'
        ParamType = ptInput
      end>
  end
  object qryInsertDetConc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into detconcinss'
      '('
      'NUMPROCINSS,'
      'IDPESSOA,'
      'SEQUENCIAL,'
      'FLGGLOSA,'
      'FLGTRATADO,'
      'NUMPROCINSS_AUX,'
      'OBSERVACAO,'
      'RUBRICAINSS,'
      'CODMANTENEDORA,'
      'MATRICULA,'
      'FLGMANUAL,'
      'RMREAJ,'
      'APREAJ,'
      'ESPECIE,'
      'DIB,'
      'IDRUBRICA,'
      'MESREFERENCIA,'
      'IDBENEFICIO,'
      'NOME,'
      'MESCOBRANCA,'
      'SINONIMO,'
      'IDPLANOPREV,'
      'VALORINSS,'
      'VALORMANT,'
      'CODCONCESSORINSS,'
      'CODMANTENEDORINSS,'
      'FLGATIVO,'
      'IDPLANOPREVPREV,'
      'CODSINONIMO,'
      'DTINICIOCRED,'
      'DTFIMCRED'
      ')'
      'values'
      '('
      ':PNUMPROCINSS,'
      ':PIDPESSOA,'
      ':PSEQUENCIAL,'
      ':PFLGGLOSA,'
      ':PFLGTRATADO,'
      ':PNUMPROCINSS_AUX,'
      ':POBSERVACAO,'
      ':PRUBRICAINSS,'
      ':PCODMANTENEDORA,'
      ':PMATRICULA,'
      ':PFLGMANUAL,'
      ':PRMREAJ,'
      ':PAPREAJ,'
      ':PESPECIE,'
      ':PDIB,'
      ':PIDRUBRICA,'
      ':PMESREFERENCIA,'
      ':PIDBENEFICIO,'
      ':PNOME,'
      ':PMESCOBRANCA,'
      ':PSINONIMO,'
      ':PIDPLANOPREV,'
      ':PVALORINSS,'
      ':PVALORMANT,'
      ':PCODCONCESSORINSS,'
      ':PCODMANTENEDORINSS,'
      ':PFLGATIVO,'
      ':PIDPLANOPREVPREV,'
      ':PCODSINONIMO,'
      ':PDTINICIOCRED,'
      ':PDTFIMCRED'
      ')'
      ' ')
    ValidateWithMask = True
    Left = 480
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'PNUMPROCINSS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PSEQUENCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PFLGGLOSA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PFLGTRATADO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMPROCINSS_AUX'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'POBSERVACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PRUBRICAINSS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODMANTENEDORA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMATRICULA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PFLGMANUAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRMREAJ'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PAPREAJ'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PESPECIE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDIB'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDRUBRICA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDBENEFICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PSINONIMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVALORINSS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVALORMANT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODCONCESSORINSS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODMANTENEDORINSS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PFLGATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PIDPLANOPREVPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PCODSINONIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDTINICIOCRED'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDTFIMCRED'
        ParamType = ptUnknown
      end>
  end
  object qryTempConcINSS: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPESSOA,'
      '   NOME,'
      '   CODRUBRICA1,'
      '   CODRUBRICA2,'
      '   CODRUBRICA3,'
      '   CODRUBRICA4,'
      '   VLRRUBRICA1,'
      '   VLRRUBRICA2,'
      '   VLRRUBRICA3,'
      '   VLRRUBRICA4,'
      '   DATALEITURA,'
      '   OBS,'
      '   MOTIVO,'
      '   MESPROCESSAMENTO,'
      '   MESREFERENCIA,'
      '   NUMPROCINSS,'
      '   ESPECIE,'
      '   CODCONCESSORINSS,'
      '   CODMANTENEDORINSS,'
      '   MATRICULA,'
      '   RMREAJ,'
      '   APREAJ,'
      '   FLGMANUAL,'
      '   DIB,'
      '  CODSINONIMO,'
      ' DTINICIOCRED,'
      ' DTFIMCRED'
      ''
      'FROM'
      '   TEMPCONCINSS'
      'WHERE'
      '       NUMPROCINSS      =:PNUMPROCINSS'
      '   AND MESPROCESSAMENTO =:PMESPROCESSAMENTO')
    ValidateWithMask = True
    Left = 488
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'PNUMPROCINSS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESPROCESSAMENTO'
        ParamType = ptInput
      end>
    object qryTempConcINSSIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".IDPESSOA'
    end
    object qryTempConcINSSNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".NOME'
      Size = 60
    end
    object qryTempConcINSSCODRUBRICA1: TFloatField
      FieldName = 'CODRUBRICA1'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".CODRUBRICA1'
    end
    object qryTempConcINSSCODRUBRICA2: TFloatField
      FieldName = 'CODRUBRICA2'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".CODRUBRICA2'
    end
    object qryTempConcINSSCODRUBRICA3: TFloatField
      FieldName = 'CODRUBRICA3'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".CODRUBRICA3'
    end
    object qryTempConcINSSCODRUBRICA4: TFloatField
      FieldName = 'CODRUBRICA4'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".CODRUBRICA4'
    end
    object qryTempConcINSSVLRRUBRICA1: TFloatField
      FieldName = 'VLRRUBRICA1'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".VLRRUBRICA1'
    end
    object qryTempConcINSSVLRRUBRICA2: TFloatField
      FieldName = 'VLRRUBRICA2'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".VLRRUBRICA2'
    end
    object qryTempConcINSSVLRRUBRICA3: TFloatField
      FieldName = 'VLRRUBRICA3'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".VLRRUBRICA3'
    end
    object qryTempConcINSSVLRRUBRICA4: TFloatField
      FieldName = 'VLRRUBRICA4'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".VLRRUBRICA4'
    end
    object qryTempConcINSSDATALEITURA: TDateTimeField
      FieldName = 'DATALEITURA'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".DATALEITURA'
    end
    object qryTempConcINSSOBS: TStringField
      FieldName = 'OBS'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".OBS'
      Size = 200
    end
    object qryTempConcINSSMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".MOTIVO'
      Size = 30
    end
    object qryTempConcINSSMESPROCESSAMENTO: TStringField
      FieldName = 'MESPROCESSAMENTO'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".MESPROCESSAMENTO'
      FixedChar = True
      Size = 7
    end
    object qryTempConcINSSMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryTempConcINSSNUMPROCINSS: TStringField
      FieldName = 'NUMPROCINSS'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".NUMPROCINSS'
      Size = 15
    end
    object qryTempConcINSSESPECIE: TStringField
      FieldName = 'ESPECIE'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".ESPECIE'
      Size = 6
    end
    object qryTempConcINSSCODCONCESSORINSS: TStringField
      FieldName = 'CODCONCESSORINSS'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".CODCONCESSORINSS'
      Size = 8
    end
    object qryTempConcINSSCODMANTENEDORINSS: TStringField
      FieldName = 'CODMANTENEDORINSS'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".CODMANTENEDORINSS'
      Size = 8
    end
    object qryTempConcINSSMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".MATRICULA'
      Size = 13
    end
    object qryTempConcINSSRMREAJ: TFloatField
      FieldName = 'RMREAJ'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".RMREAJ'
    end
    object qryTempConcINSSAPREAJ: TFloatField
      FieldName = 'APREAJ'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".APREAJ'
    end
    object qryTempConcINSSFLGMANUAL: TFloatField
      FieldName = 'FLGMANUAL'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".FLGMANUAL'
    end
    object qryTempConcINSSDIB: TDateTimeField
      FieldName = 'DIB'
      Origin = 'BASEDADOS."CM.TEMPCONCINSS".DIB'
    end
    object qryTempConcINSSCODSINONIMO: TFloatField
      FieldName = 'CODSINONIMO'
      Origin = 'BASEDADOS.TEMPCONCINSS.CODSINONIMO'
    end
    object qryTempConcINSSDTINICIOCRED: TDateTimeField
      FieldName = 'DTINICIOCRED'
      Origin = 'BASEDADOS.TEMPCONCINSS.DTINICIOCRED'
    end
    object qryTempConcINSSDTFIMCRED: TDateTimeField
      FieldName = 'DTFIMCRED'
      Origin = 'BASEDADOS.TEMPCONCINSS.DTFIMCRED'
    end
  end
  object qrySequencial: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MAX(SEQUENCIAL) AS SEQUENCIAL'
      'FROM'
      '   DETCONCINSS'
      'WHERE'
      '       MESCOBRANCA =:PMESCOBRANCA'
      '   AND IDPESSOA    =:PIDPESSOA')
    ValidateWithMask = True
    Left = 568
    Top = 48
    ParamData = <
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qrySequencialSEQUENCIAL: TFloatField
      FieldName = 'SEQUENCIAL'
      Origin = 'BASEDADOS."CM.DETCONCINSS".SEQUENCIAL'
    end
  end
  object qryRubricaXINSS: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   RXI.IDRUBRICA,'
      '   RXI.RUBRICAINSS,'
      '   RXI.FLGRUBCENTRAL,'
      '   RXI.FLGRATEIOPLANO,'
      '   PVD.CODPROVDESC,'
      '   PVD.DESCRPROVDESC,'
      '   PVD.DESCRICAO'
      ''
      'FROM'
      '   RUBRICAXINSS RXI,'
      '   PROVDESC     PVD'
      ''
      'WHERE'
      '       RXI.RUBRICAINSS =:PRUBRICAINSS'
      '   AND RXI.IDRUBRICA   = PVD.IDPROVENTO(+)')
    ValidateWithMask = True
    Left = 584
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'PRUBRICAINSS'
        ParamType = ptInput
        Value = 0
      end>
    object qryRubricaXINSSIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
      Origin = 'BASEDADOS.RUBRICAXINSS.IDRUBRICA'
    end
    object qryRubricaXINSSRUBRICAINSS: TFloatField
      FieldName = 'RUBRICAINSS'
      Origin = 'BASEDADOS.RUBRICAXINSS.RUBRICAINSS'
    end
    object qryRubricaXINSSFLGRUBCENTRAL: TFloatField
      FieldName = 'FLGRUBCENTRAL'
      Origin = 'BASEDADOS.RUBRICAXINSS.FLGRUBCENTRAL'
    end
    object qryRubricaXINSSCODPROVDESC: TStringField
      FieldName = 'CODPROVDESC'
      Size = 15
    end
    object qryRubricaXINSSDESCRPROVDESC: TStringField
      FieldName = 'DESCRPROVDESC'
      Size = 130
    end
    object qryRubricaXINSSDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 130
    end
    object qryRubricaXINSSFLGRATEIOPLANO: TFloatField
      FieldName = 'FLGRATEIOPLANO'
    end
  end
  object qryLookPLANO: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PLP.IDPLANOPREV, PLP.NOME'
      ''
      'FROM'
      '  PLANPREV         PLP,'
      '  PLANPREVCONTABIL PPC'
      ''
      'WHERE'
      '      PPC.IDPLANOPREV     =:PIDPLANOPREV'
      '  AND PPC.IDPLANOPREVPREV = PLP.IDPLANOPREV'
      ''
      'ORDER BY'
      '  PLP.NOME')
    ValidateWithMask = True
    Left = 688
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.NOME'
      Size = 50
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.IDPLANOPREV'
    end
  end
  object cdsHRS: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHRS'
    Left = 232
    Top = 72
    object cdsHRSIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object cdsHRSIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object cdsHRSIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object cdsHRSQUANT: TFloatField
      FieldName = 'QUANT'
    end
  end
  object dspHRS: TDataSetProvider
    DataSet = qryHRS
    Constraints = True
    Left = 232
    Top = 60
  end
  object qryHRS: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  HRS.IDPESSOA, HRS.IDTITULAR, HRS.IDRUBRICA,'
      '  COUNT(DISTINCT(HRS.IDPLANOCONTABIL)) AS QUANT'
      ''
      'FROM'
      '  HISTRUBSAL      HRS,'
      '  CONJUNTORUBRICA CJR,'
      '  CONJUNTORUBXRUB CXR'
      ''
      'WHERE'
      '      HRS.MESCOBRANCA       =:PMESCOBRANCA'
      '  AND HRS.IDMODULO          = 18'
      '  AND HRS.FONTEPAGADORA     = 2'
      '  AND CJR.IDCONJUNTORUBRICA = -1'
      '  AND CJR.IDCONJUNTORUBRICA = CXR.IDCONJUNTORUBRICA'
      '  AND CXR.IDRUBRICA         = HRS.IDRUBRICA'
      ''
      'GROUP BY'
      '  HRS.IDPESSOA, HRS.IDTITULAR, HRS.IDRUBRICA'
      ''
      'HAVING'
      '  COUNT(DISTINCT(HRS.IDPLANOCONTABIL)) > 1'
      ''
      'ORDER BY'
      '  HRS.IDPESSOA, HRS.IDTITULAR, HRS.IDRUBRICA')
    ValidateWithMask = True
    Left = 232
    Top = 48
    ParamData = <
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end>
    object qryHRSIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.HISTRUBSAL.IDPESSOA'
    end
    object qryHRSIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.HISTRUBSAL.IDTITULAR'
    end
    object qryHRSIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
      Origin = 'BASEDADOS.HISTRUBSAL.IDRUBRICA'
    end
    object qryHRSQUANT: TFloatField
      FieldName = 'QUANT'
      Origin = 'BASEDADOS.HISTRUBSAL.IDPLANOCONTABIL'
    end
  end
  object qryHRSPessoa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HRS.IDPLANOCONTABIL, HRS.IDPESSOA, HRS.IDTITULAR,'
      '   SUM(HRS.VALORPROVENTO) AS VALOR'
      ''
      'FROM'
      '   HISTRUBSAL      HRS,'
      '   CONJUNTORUBRICA CJR,'
      '   CONJUNTORUBXRUB CXR'
      ''
      'WHERE'
      '       HRS.MESCOBRANCA        =:PMESCOBRANCA'
      '   AND HRS.IDPESSOA           =:PIDPESSOA'
      '   AND HRS.IDTITULAR          =:PIDTITULAR'
      '   AND HRS.IDMODULO           = 18'
      '   AND HRS.FONTEPAGADORA      = 2'
      '   AND CJR.IDCONJUNTORUBRICA  = -1'
      '   AND CJR.IDCONJUNTORUBRICA  = CXR.IDCONJUNTORUBRICA'
      '   AND CXR.IDRUBRICA          = HRS.IDRUBRICA'
      ''
      'GROUP BY'
      '   HRS.IDPLANOCONTABIL, HRS.IDPESSOA, HRS.IDTITULAR'
      ''
      'ORDER BY'
      '   SUM(HRS.VALORPROVENTO) DESC')
    ValidateWithMask = True
    Left = 304
    Top = 48
    ParamData = <
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTITULAR'
        ParamType = ptInput
      end>
    object qryHRSPessoaIDPLANOCONTABIL: TFloatField
      FieldName = 'IDPLANOCONTABIL'
    end
    object qryHRSPessoaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryHRSPessoaIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryHRSPessoaVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object qryPlanPrevXContabil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   IDPLANOPREV, IDPLANOPREVPREV, NOME'
      'FROM'
      '  PLANPREVCONTABIL'
      'WHERE'
      '      IDPLANOPREV     = :PIDPLANOPREV'
      '  AND IDPLANOPREVPREV = :PIDPLANOPREVPREV'
      '')
    ValidateWithMask = True
    Left = 385
    Top = 105
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREVPREV'
        ParamType = ptInput
      end>
    object qryPlanPrevXContabilIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.IDPLANOPREV'
    end
    object qryPlanPrevXContabilIDPLANOPREVPREV: TFloatField
      FieldName = 'IDPLANOPREVPREV'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.IDPLANOPREVPREV'
    end
    object qryPlanPrevXContabilNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.NOME'
      Size = 50
    end
  end
end
