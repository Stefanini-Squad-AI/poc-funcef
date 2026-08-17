inherited cfgRelMapaCota: TcfgRelMapaCota
  Left = 207
  Top = 86
  HelpContext = 540078
  Caption = 'Mapa Gerencial de Rentabilidade por Cotas'
  ClientHeight = 450
  ClientWidth = 580
  FormStyle = fsMDIChild
  Visible = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 580
    Height = 417
    object grpReferencia: TGroupBox
      Left = 8
      Top = 6
      Width = 394
      Height = 55
      Caption = ' Competência de Recebimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label4: TLabel
        Left = 8
        Top = 14
        Width = 24
        Height = 13
        Caption = 'Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 312
        Top = 14
        Width = 23
        Height = 13
        Caption = 'Ano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cboMes: TComboBox
        Left = 8
        Top = 28
        Width = 297
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
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
      object DBspnAno: TwwDBSpinEdit
        Left = 312
        Top = 28
        Width = 73
        Height = 21
        Increment = 1
        MaxValue = 2050
        MinValue = 1980
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
      end
    end
    object grpTipoSegmento: TGroupBox
      Left = 411
      Top = 6
      Width = 156
      Height = 55
      Caption = 'Tipo de Segmento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object rbGerencial: TRadioButton
        Left = 16
        Top = 16
        Width = 113
        Height = 17
        Caption = 'Gerencial'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = True
      end
      object rbSPC: TRadioButton
        Left = 16
        Top = 33
        Width = 113
        Height = 17
        Caption = 'SPC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object cbAlienacaoRenda: TCheckBox
      Left = 10
      Top = 276
      Width = 241
      Height = 17
      Caption = 'Considerar alienação como Renda'
      TabOrder = 2
    end
    object cbExibirResumo: TCheckBox
      Left = 10
      Top = 298
      Width = 137
      Height = 17
      Caption = 'Exibir Resumo'
      TabOrder = 3
    end
    object cbExibirTIRAtuarial: TCheckBox
      Left = 10
      Top = 320
      Width = 129
      Height = 17
      Caption = 'Exibir TIR Atuarial'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object chkCorLinha: TCheckBox
      Left = 10
      Top = 345
      Width = 233
      Height = 17
      Caption = 'Imprimir linhas com cores alternadas: '
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object cboCorLinha: TfcColorCombo
      Left = 247
      Top = 342
      Width = 124
      Height = 21
      AlignmentVertical = fcavCenter
      AutoSelect = False
      ColorDialogOptions = []
      ColorListOptions.ColorWidth = 119
      ColorListOptions.Font.Charset = DEFAULT_CHARSET
      ColorListOptions.Font.Color = clWindowText
      ColorListOptions.Font.Height = -11
      ColorListOptions.Font.Name = 'MS Sans Serif'
      ColorListOptions.Font.Style = []
      ColorListOptions.GreyScaleIncrement = 1
      ColorListOptions.Options = [ccoShowCustomColors]
      CustomColors.Strings = (
        'ColorA=FFFFFF'
        'ColorC=00C0FFFF'
        'ColorD=00C6F9CC'
        'ColorE=00F3E6CD'
        'ColorF=00A0A0A0'
        'ColorG=00BEBEBE'
        'ColorH=00D2D2D2'
        'ColorI=00E3E3E3')
      DropDownCount = 8
      DropDownWidth = 119
      ReadOnly = False
      ShowMatchText = False
      SelectedColor = clWhite
      TabOrder = 6
    end
    object grpPlano: TGroupBox
      Left = 8
      Top = 127
      Width = 559
      Height = 140
      Caption = 'Patrocinadoras / Planos considerados para rentabilidade'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 7
      object Panel2: TPanel
        Left = 2
        Top = 15
        Width = 555
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Bevel1: TBevel
          Left = 0
          Top = 19
          Width = 555
          Height = 6
          Align = alBottom
          Shape = bsBottomLine
        end
        object btnTodos: TSpeedButton
          Left = 489
          Top = 0
          Width = 23
          Height = 22
          Hint = 'Marcar Todos'
          Flat = True
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
          ParentShowHint = False
          ShowHint = True
          OnClick = btnTodosClick
        end
        object btnNenhum: TSpeedButton
          Left = 517
          Top = 0
          Width = 23
          Height = 22
          Hint = 'Desmarcar Todos'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
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
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = btnNenhumClick
        end
      end
      object lstPlano: TCheckListBox
        Left = 2
        Top = 40
        Width = 555
        Height = 98
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
      end
    end
    object grpIndiceCorrecao: TGroupBox
      Left = 8
      Top = 69
      Width = 175
      Height = 50
      Caption = 'Índice de Correção'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      object dblkpIndiceCorrecao: TwwDBLookupCombo
        Left = 8
        Top = 19
        Width = 156
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOESIGLA'#9'6'#9'Moeda'#9'F')
        LookupTable = cdsIndice
        LookupField = 'MOECODIGO'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object grpIndiceAtuarial: TGroupBox
      Left = 193
      Top = 68
      Width = 373
      Height = 51
      Caption = 'Índice Atuarial Projetado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      object Image2: TImage
        Left = 189
        Top = 18
        Width = 18
        Height = 18
        AutoSize = True
        Picture.Data = {
          07544269746D61704E010000424D4E0100000000000076000000280000001200
          0000120000000100040000000000D80000000000000000000000100000001000
          0000000000000000800000800000008080008000000080008000808000008080
          8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00888888888888888888000000888888877777888888000000888888000007
          8888880000008888880FFF078888880000008888880FFF078888880000008888
          880FFF078888880000008877770FFF077777780000008000000FFF0000007800
          000080FFFFFFFFFFFFF07800000080FFFFFFFFFFFFF07800000080FFFFFFFFFF
          FFF0780000008000000FFF000000880000008888880FFF078888880000008888
          880FFF078888880000008888880FFF078888880000008888880FFF0788888800
          0000888888000008888888000000888888888888888888000000}
        Transparent = True
      end
      object Label1: TLabel
        Left = 304
        Top = 17
        Width = 41
        Height = 20
        Caption = '% aa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dblkpIndiceAtuarial: TwwDBLookupCombo
        Left = 11
        Top = 17
        Width = 158
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOESIGLA'#9'6'#9'Moeda'#9'F')
        LookupTable = cdsIndice
        LookupField = 'MOECODIGO'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object edtPerAtuarial: TDBRealEdit
        Left = 229
        Top = 16
        Width = 65
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 3
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 376
      Width = 580
      Height = 41
      Align = alBottom
      TabOrder = 10
      object lblProgress: TLabel
        Left = 9
        Top = 3
        Width = 141
        Height = 13
        Caption = 'Processando Relatório...'
        Visible = False
      end
      object ProgressBar: TProgressBar
        Left = 9
        Top = 19
        Width = 560
        Height = 16
        Min = 0
        Max = 100
        Step = 1
        TabOrder = 0
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 417
    Width = 580
    inherited tb97Fundo: TToolbar97
      Left = 408
      DockPos = 443
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 155
      inherited ToolbarSep971: TToolbarSep97
        Left = 164
      end
      inherited ToolbarSep974: TToolbarSep97
        Left = 247
      end
      inherited bbtnCancelar: TBitBtn
        Left = 166
      end
      object bbtnBI: TBitBtn
        Left = 83
        Top = 0
        Width = 81
        Height = 27
        Caption = 'Gera &BI'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnBIClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777000000000000007707778FF7FF7FF077077788F78F78F07708888877877
          87077077780078F78F077077780E0FF78F0770888870E0777707700000FF0E07
          FF077077770F70E0FF07077777707F0E0F070F7555707FF0E0070F7577704444
          0E070F757770000000E070FFF707777777007700007777777777}
      end
    end
  end
  object cdsIndice: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 217
    Top = 75
    object cdsIndiceMOESIGLA: TStringField
      DisplayLabel = 'Moeda'
      DisplayWidth = 6
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object cdsIndiceMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object cdsIndiceMOEDESC: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'MOEDESC'
      Visible = False
    end
    object cdsIndiceMOEPERIODICIDADE: TStringField
      FieldName = 'MOEPERIODICIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsIndiceFLGPERCVALOR: TStringField
      FieldName = 'FLGPERCVALOR'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object dtsIndice: TwwDataSource
    DataSet = cdsIndice
    Left = 253
    Top = 83
  end
  object cdsPatrosPlanos: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 482
    Top = 155
    Data = {
      610100009619E0BD010000001800000004000400000003000000A10007494450
      4154524F08000400000000000B4944504C414E4F505245560800040000000000
      094E4F4D45504154524F0100490000000100055749445448020002003C00094E
      4F4D45504C414E4F010049000000010005574944544802000200320002000D44
      454641554C545F4F52444552020082000200000003000400044C434944040001
      00090800000000000000000000004000000000008048400F46554E4441C7C34F
      204D4F44454C4F114D4F44454C4F2042454E45464943494F5300000000000000
      0000400000000000002C400F46554E4441C7C34F204D4F44454C4F08506C616E
      6F2042440000000000000000004000000000000008400F46554E4441C7C34F20
      4D4F44454C4F14506C616E6F204344202D2041677265737369766F0000000000
      000000F03F0000000000804840055054522032114D4F44454C4F2042454E4546
      4943494F53}
  end
  object sqlPatrosPlanos: TCMSqlParams
    SQL.Strings = (
      ' SELECT   DISTINCT'
      '          I.IDPATRO,'
      '          P.IDPLANOPREV,'
      '          A.NOME AS NOMEPATRO,'
      '          P.NOME AS NOMEPLANO'
      ' FROM     PLANPREVCONTABIL P,'
      '          PESSOA A,'
      '          PLANOPATROXIMOVEL I'
      ' WHERE    P.IDPLANOPREV = I.IDPLANOPREV'
      '   AND    I.IDPATRO     = A.IDPESSOA'
      ' ORDER BY 3, 4'
      ' '
      ' ')
    ClientDataSet = cdsPatrosPlanos
    Left = 481
    Top = 185
  end
  object cdsMapa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 305
    Top = 163
  end
  object cdsFluxo: TCMClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'IDSEGMENTO;IDIMOVELMESTRE;DATALANCTO'
    Params = <>
    Left = 369
    Top = 165
    Data = {
      800100009619E0BD01000000180000001000000000000300000080010A494453
      45474D454E544F01004900000001000557494454480200020005000E4944494D
      4F56454C4D4553545245080004000000000006414E4F4D455301004900000001
      000557494454480200020006000A444154414C414E43544F0800080000000000
      05415449564F08000400000000000B434F4D50524156454E4441080004000000
      000008414245525455524108000400000000000A46454348414D454E544F0800
      04000000000007564C52434F54410800040000000000095641524D45534E4F4D
      080004000000000009564152414E4F4E4F4D08000400000000000849444D4F44
      554C4F0800040000000000064F524947454D08000400000000000A5245434549
      54414D455308000400000000000A444553504553414D45530800040000000000
      0E524543454954414C495155494441080004000000000002000D44454641554C
      545F4F5244455202008200040000000100020003000400044C43494404000100
      09080000}
  end
  object dtsMapa: TDataSource
    DataSet = cdsMapa
    Left = 305
    Top = 175
  end
  object pplnMapa: TppDBPipeline
    DataSource = dtsMapa
    UserName = 'lnMapa'
    Left = 306
    Top = 186
    object dbpplnppField1: TppField
      FieldAlias = 'ORDEM'
      FieldName = 'ORDEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object dbpplnppField2: TppField
      FieldAlias = 'SEGMENTO'
      FieldName = 'SEGMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object dbpplnppField3: TppField
      FieldAlias = 'IMOVEL_MESTRE'
      FieldName = 'IMOVEL_MESTRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object dbpplnppField4: TppField
      FieldAlias = 'IDSEGMENTO'
      FieldName = 'IDSEGMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object dbpplnppField5: TppField
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object dbpplnppField6: TppField
      FieldAlias = 'FLGTIPOINTERNO'
      FieldName = 'FLGTIPOINTERNO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object dbpplnppField7: TppField
      FieldAlias = 'ORIGEM'
      FieldName = 'ORIGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object dbpplnppField8: TppField
      FieldAlias = 'VALOR_CONTABIL'
      FieldName = 'VALOR_CONTABIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object dbpplnppField9: TppField
      FieldAlias = 'ULTREAVALIA'
      FieldName = 'ULTREAVALIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object dbpplnppField10: TppField
      FieldAlias = 'RECEITA_LIQUIDA_MES'
      FieldName = 'RECEITA_LIQUIDA_MES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object dbpplnppField11: TppField
      FieldAlias = 'RECEITA_LIQUIDA_ANO'
      FieldName = 'RECEITA_LIQUIDA_ANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object dbpplnppField12: TppField
      FieldAlias = 'TITULO'
      FieldName = 'TITULO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object dbpplnppField13: TppField
      FieldAlias = 'RENTAB_MES_NOMINAL'
      FieldName = 'RENTAB_MES_NOMINAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object dbpplnppField14: TppField
      FieldAlias = 'RENTAB_MES_REAL'
      FieldName = 'RENTAB_MES_REAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object dbpplnppField15: TppField
      FieldAlias = 'RENTAB_MES_ATUARIAL'
      FieldName = 'RENTAB_MES_ATUARIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object dbpplnppField16: TppField
      FieldAlias = 'RENTAB_ANO_NOMINAL'
      FieldName = 'RENTAB_ANO_NOMINAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object dbpplnppField17: TppField
      FieldAlias = 'RENTAB_ANO_REAL'
      FieldName = 'RENTAB_ANO_REAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object dbpplnppField18: TppField
      FieldAlias = 'RENTAB_ANO_ATUARIAL'
      FieldName = 'RENTAB_ANO_ATUARIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object dbpplnppField19: TppField
      FieldAlias = 'ULTREAVALANOANT'
      FieldName = 'ULTREAVALANOANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object dbpplnppField20: TppField
      FieldAlias = 'ULTREAVALMESANT'
      FieldName = 'ULTREAVALMESANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object dbpplnppField21: TppField
      FieldAlias = 'ULTREAVAL_NOMINAL'
      FieldName = 'ULTREAVAL_NOMINAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object dbpplnppField22: TppField
      FieldAlias = 'ULTREAVAL_REAL'
      FieldName = 'ULTREAVAL_REAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object dbpplnppField23: TppField
      FieldAlias = 'ULTREAVAL_ATUARIAL'
      FieldName = 'ULTREAVAL_ATUARIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object dbpplnppField24: TppField
      FieldAlias = 'TOTRENTAB_MES_NOMINAL'
      FieldName = 'TOTRENTAB_MES_NOMINAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object dbpplnppField25: TppField
      FieldAlias = 'TOTRENTAB_MES_REAL'
      FieldName = 'TOTRENTAB_MES_REAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object dbpplnppField26: TppField
      FieldAlias = 'TOTRENTAB_MES_ATUARIAL'
      FieldName = 'TOTRENTAB_MES_ATUARIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object dbpplnppField27: TppField
      FieldAlias = 'TOTRENTAB_ANO_NOMINAL'
      FieldName = 'TOTRENTAB_ANO_NOMINAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object dbpplnppField28: TppField
      FieldAlias = 'TOTRENTAB_ANO_REAL'
      FieldName = 'TOTRENTAB_ANO_REAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object dbpplnppField29: TppField
      FieldAlias = 'TOTRENTAB_ANO_ATUARIAL'
      FieldName = 'TOTRENTAB_ANO_ATUARIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object dbpplnppField30: TppField
      FieldAlias = 'FINRENTAB_MES_NOMINAL'
      FieldName = 'FINRENTAB_MES_NOMINAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object dbpplnppField31: TppField
      FieldAlias = 'FINRENTAB_MES_REAL'
      FieldName = 'FINRENTAB_MES_REAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object dbpplnppField32: TppField
      FieldAlias = 'FINRENTAB_MES_ATUARIAL'
      FieldName = 'FINRENTAB_MES_ATUARIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object dbpplnppField33: TppField
      FieldAlias = 'FINRENTAB_ANO_NOMINAL'
      FieldName = 'FINRENTAB_ANO_NOMINAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object dbpplnppField34: TppField
      FieldAlias = 'FINRENTAB_ANO_REAL'
      FieldName = 'FINRENTAB_ANO_REAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object dbpplnppField35: TppField
      FieldAlias = 'FINRENTAB_ANO_ATUARIAL'
      FieldName = 'FINRENTAB_ANO_ATUARIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
  end
  object rptMapa: TppReport
    AutoStop = False
    DataPipeline = pplnMapa
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório Gerencial'
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
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 488
    Top = 240
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pplnMapa'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 42069
      mmPrintPosition = 0
      object pplblEmpresa: TppLabel
        UserName = 'LblEmpresa1'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 265
        mmTop = 1852
        mmWidth = 283369
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Mapa Gerencial de Rentabilidade por Cotas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 1588
        mmTop = 8996
        mmWidth = 279930
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 1588
        mmTop = 18521
        mmWidth = 279930
        BandType = 0
      end
      object ppLogoTipo: TppImage
        UserName = 'ppLogoTipo'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 529
        mmTop = 529
        mmWidth = 15875
        BandType = 0
      end
      object rgParam: TppRegion
        UserName = 'rgParam'
        Pen.Style = psClear
        Pen.Width = 0
        mmHeight = 21960
        mmLeft = 0
        mmTop = 20108
        mmWidth = 283369
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel19: TppLabel
          UserName = 'lblImovelMestre2'
          AutoSize = False
          Caption = 'Mês /Ano de Competência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 2117
          mmTop = 22225
          mmWidth = 55033
          BandType = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          AutoSize = False
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 63765
          mmTop = 22225
          mmWidth = 1852
          BandType = 0
        end
        object pplblCompetencia: TppLabel
          UserName = 'Label16'
          AutoSize = False
          Caption = 'pplblCompetencia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 66146
          mmTop = 22225
          mmWidth = 51329
          BandType = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          AutoSize = False
          Caption = 'Tipo de Segmento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 119592
          mmTop = 21960
          mmWidth = 29104
          BandType = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label201'
          AutoSize = False
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 149490
          mmTop = 21960
          mmWidth = 1852
          BandType = 0
        end
        object pplblTipoSegmento: TppLabel
          UserName = 'lblTipoSegmento'
          AutoSize = False
          Caption = 'pplblTipoSegmento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 152929
          mmTop = 22225
          mmWidth = 38365
          BandType = 0
        end
        object ppLabel27: TppLabel
          UserName = 'Label27'
          AutoSize = False
          Caption = 'Patrocinadoras / Planos selecionados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1852
          mmTop = 26988
          mmWidth = 57944
          BandType = 0
        end
        object ppLabel28: TppLabel
          UserName = 'Label202'
          AutoSize = False
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 63500
          mmTop = 26988
          mmWidth = 1852
          BandType = 0
        end
        object pplblAlienacaoRenda: TppLabel
          UserName = 'lblAlienacaoRenda'
          AutoSize = False
          Caption = '* Não considerando alienação como Renda.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3175
          mmLeft = 1852
          mmTop = 32279
          mmWidth = 63765
          BandType = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = '* Valores em R$ 1.000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3175
          mmLeft = 1852
          mmTop = 36513
          mmWidth = 57679
          BandType = 0
        end
        object ppMemPatroPlano: TppMemo
          UserName = 'MemPatroPlano'
          Caption = 'MemPatroPlano'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 14023
          mmLeft = 66146
          mmTop = 26988
          mmWidth = 158221
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppLabel37: TppLabel
          UserName = 'Label37'
          AutoSize = False
          Caption = 'Correção Real :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 225955
          mmTop = 21960
          mmWidth = 23813
          BandType = 0
        end
        object pplLabelAtu: TppLabel
          UserName = 'lLabelAtu'
          AutoSize = False
          Caption = 'Correção Atuarial :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 225955
          mmTop = 26458
          mmWidth = 29633
          BandType = 0
        end
        object pplIndReal: TppLabel
          UserName = 'lIndReal'
          AutoSize = False
          Caption = 'IGP-DI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 255588
          mmTop = 22225
          mmWidth = 26723
          BandType = 0
        end
        object pplIndAtu: TppLabel
          UserName = 'lIndAtu'
          AutoSize = False
          Caption = 'IGP-DI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 255588
          mmTop = 26723
          mmWidth = 26723
          BandType = 0
        end
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 9790
      mmPrintPosition = 0
      object ppsCor: TppShape
        OnPrint = ppsCorPrint
        UserName = 'sCor'
        Brush.Color = clLime
        Pen.Style = psClear
        mmHeight = 5027
        mmLeft = 7673
        mmTop = 0
        mmWidth = 274373
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'RENTAB_ANO_NOMINAL'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3969
        mmLeft = 217223
        mmTop = 265
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText101'
        DataField = 'RENTAB_ANO_REAL'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3969
        mmLeft = 239448
        mmTop = 265
        mmWidth = 20373
        BandType = 4
      end
      object ppdbtxtRentAtuAno: TppDBText
        UserName = 'dbtxtRentAtuAno'
        DataField = 'RENTAB_ANO_ATUARIAL'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3969
        mmLeft = 261144
        mmTop = 265
        mmWidth = 20373
        BandType = 4
      end
      object dbTxtRentMesNominal: TppDBText
        UserName = 'dbTxtRentMesNominal'
        DataField = 'RENTAB_MES_NOMINAL'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3969
        mmLeft = 149490
        mmTop = 265
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'RENTAB_MES_REAL'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3969
        mmLeft = 171715
        mmTop = 265
        mmWidth = 20373
        BandType = 4
      end
      object ppdbtxtRentAtuMes: TppDBText
        UserName = 'dbtxtRentAtuMes'
        DataField = 'RENTAB_MES_ATUARIAL'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3969
        mmLeft = 193411
        mmTop = 265
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'RECEITA_LIQUIDA_MES'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3969
        mmLeft = 103717
        mmTop = 265
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'RECEITA_LIQUIDA_ANO'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3969
        mmLeft = 125942
        mmTop = 265
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'ULTREAVALIA'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3969
        mmLeft = 79375
        mmTop = 265
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VALOR_CONTABIL'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3969
        mmLeft = 55298
        mmTop = 265
        mmWidth = 20373
        BandType = 4
      end
      object ppNomeAtivo: TppDBText
        UserName = 'NomeAtivo'
        DataField = 'IMOVEL_MESTRE'
        DataPipeline = pplnMapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3969
        mmLeft = 7673
        mmTop = 265
        mmWidth = 44450
        BandType = 4
      end
      object ppsrFluxo: TppSubReport
        OnPrint = ppsrFluxoPrint
        UserName = 'srFluxo'
        DrillDownComponent = ppNomeAtivo
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplnFluxo'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 4763
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplnFluxo
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Relatório Gerencial'
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
          Left = 288
          Top = 216
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplnFluxo'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 9525
            mmPrintPosition = 0
            object ppLabel32: TppLabel
              UserName = 'Label32'
              Caption = 'Fluxo Diário: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 4233
              mmLeft = 7673
              mmTop = 2910
              mmWidth = 22490
              BandType = 1
            end
            object ppDBText28: TppDBText
              UserName = 'DBText28'
              DataField = 'IMOVEL_MESTRE'
              DataPipeline = pplnMapa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold, fsItalic]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'pplnMapa'
              mmHeight = 4233
              mmLeft = 31485
              mmTop = 2910
              mmWidth = 102129
              BandType = 1
            end
          end
          object ppHeaderBand2: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppShape10: TppShape
              OnPrint = ppsCorPrint
              UserName = 'sCor1'
              Brush.Color = clLime
              Pen.Style = psClear
              StretchWithParent = True
              mmHeight = 4233
              mmLeft = 9790
              mmTop = 0
              mmWidth = 273051
              BandType = 4
            end
            object ppDBText1: TppDBText
              UserName = 'DBText1'
              DataField = 'DATALANCTO'
              DataPipeline = pplnFluxo
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplnFluxo'
              mmHeight = 3440
              mmLeft = 9260
              mmTop = 265
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'DBText13'
              BlankWhenZero = True
              DataField = 'ATIVO'
              DataPipeline = pplnFluxo
              DisplayFormat = '#,0;-#,0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplnFluxo'
              mmHeight = 3440
              mmLeft = 28046
              mmTop = 265
              mmWidth = 20638
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              BlankWhenZero = True
              DataField = 'RECEITALIQUIDA'
              DataPipeline = pplnFluxo
              DisplayFormat = '#,0;-#,0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplnFluxo'
              mmHeight = 3440
              mmLeft = 118798
              mmTop = 265
              mmWidth = 23813
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              DataField = 'ABERTURA'
              DataPipeline = pplnFluxo
              DisplayFormat = '#,0.000000;-#,0.000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplnFluxo'
              mmHeight = 3440
              mmLeft = 143669
              mmTop = 265
              mmWidth = 33602
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              DataField = 'FECHAMENTO'
              DataPipeline = pplnFluxo
              DisplayFormat = '#,0.000000;-#,0.000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplnFluxo'
              mmHeight = 3440
              mmLeft = 178859
              mmTop = 265
              mmWidth = 33602
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText201'
              DataField = 'VARMESNOM'
              DataPipeline = pplnFluxo
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplnFluxo'
              mmHeight = 3440
              mmLeft = 242359
              mmTop = 265
              mmWidth = 15610
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'DBText24'
              BlankWhenZero = True
              DataField = 'COMPRAVENDA'
              DataPipeline = pplnFluxo
              DisplayFormat = '#,0;-#,0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplnFluxo'
              mmHeight = 3440
              mmLeft = 50271
              mmTop = 265
              mmWidth = 20638
              BandType = 4
            end
            object ppDBText25: TppDBText
              UserName = 'DBText202'
              DataField = 'VLRCOTA'
              DataPipeline = pplnFluxo
              DisplayFormat = '#,0.000000;-#,0.000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplnFluxo'
              mmHeight = 3440
              mmLeft = 214313
              mmTop = 265
              mmWidth = 21696
              BandType = 4
            end
            object ppDBText26: TppDBText
              UserName = 'DBText26'
              BlankWhenZero = True
              DataField = 'RECEITAMES'
              DataPipeline = pplnFluxo
              DisplayFormat = '#,0;-#,0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplnFluxo'
              mmHeight = 3440
              mmLeft = 72231
              mmTop = 265
              mmWidth = 20638
              BandType = 4
            end
            object ppDBText27: TppDBText
              UserName = 'DBText27'
              BlankWhenZero = True
              DataField = 'DESPESAMES'
              DataPipeline = pplnFluxo
              DisplayFormat = '#,0;-#,0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplnFluxo'
              mmHeight = 3440
              mmLeft = 94721
              mmTop = 265
              mmWidth = 20638
              BandType = 4
            end
            object ppDBText29: TppDBText
              UserName = 'DBText29'
              DataField = 'VARANONOM'
              DataPipeline = pplnFluxo
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplnFluxo'
              mmHeight = 3440
              mmLeft = 264848
              mmTop = 265
              mmWidth = 15610
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppGroup2: TppGroup
            BreakName = 'IDIMOVELMESTRE'
            DataPipeline = pplnFluxo
            OutlineSettings.CreateNode = True
            UserName = 'Group2'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'pplnFluxo'
            object ppGroupHeaderBand2: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 11113
              mmPrintPosition = 0
              object ppLine9: TppLine
                UserName = 'Line9'
                Weight = 0.75
                mmHeight = 1323
                mmLeft = 145521
                mmTop = 2646
                mmWidth = 90752
                BandType = 3
                GroupNo = 0
              end
              object ppLine8: TppLine
                UserName = 'Line8'
                Weight = 0.75
                mmHeight = 1323
                mmLeft = 8996
                mmTop = 2646
                mmWidth = 133350
                BandType = 3
                GroupNo = 0
              end
              object ppLabel11: TppLabel
                UserName = 'Label11'
                AutoSize = False
                Caption = 'Data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 9260
                mmTop = 4763
                mmWidth = 8731
                BandType = 3
                GroupNo = 0
              end
              object ppLabel15: TppLabel
                UserName = 'Label15'
                AutoSize = False
                Caption = 'Ativo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 39952
                mmTop = 4763
                mmWidth = 8731
                BandType = 3
                GroupNo = 0
              end
              object ppLabel18: TppLabel
                UserName = 'Label18'
                AutoSize = False
                Caption = 'C / V'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 58738
                mmTop = 4763
                mmWidth = 12171
                BandType = 3
                GroupNo = 0
              end
              object ppLabel23: TppLabel
                UserName = 'Label23'
                AutoSize = False
                Caption = 'Rec. Liquida'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 118534
                mmTop = 4763
                mmWidth = 24077
                BandType = 3
                GroupNo = 0
              end
              object ppLabel24: TppLabel
                UserName = 'Label24'
                AutoSize = False
                Caption = 'Abertura'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 160073
                mmTop = 5027
                mmWidth = 17198
                BandType = 3
                GroupNo = 0
              end
              object ppLabel25: TppLabel
                UserName = 'Label25'
                AutoSize = False
                Caption = 'Fechamento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 193146
                mmTop = 5027
                mmWidth = 19315
                BandType = 3
                GroupNo = 0
              end
              object ppLabel26: TppLabel
                UserName = 'Label26'
                AutoSize = False
                Caption = 'Valor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 223309
                mmTop = 5027
                mmWidth = 12700
                BandType = 3
                GroupNo = 0
              end
              object ppLabel29: TppLabel
                UserName = 'Label29'
                AutoSize = False
                Caption = 'Mes'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 244740
                mmTop = 5027
                mmWidth = 13229
                BandType = 3
                GroupNo = 0
              end
              object ppLine5: TppLine
                UserName = 'Line5'
                Weight = 0.75
                mmHeight = 2117
                mmLeft = 8731
                mmTop = 8996
                mmWidth = 274638
                BandType = 3
                GroupNo = 0
              end
              object ppLine6: TppLine
                UserName = 'Line6'
                Weight = 0.75
                mmHeight = 1058
                mmLeft = 8731
                mmTop = 0
                mmWidth = 274638
                BandType = 3
                GroupNo = 0
              end
              object ppLabel30: TppLabel
                UserName = 'Label30'
                AutoSize = False
                Caption = 'Receita'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 77788
                mmTop = 4763
                mmWidth = 15081
                BandType = 3
                GroupNo = 0
              end
              object ppLabel31: TppLabel
                UserName = 'Label301'
                AutoSize = False
                Caption = 'Despesa'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 100277
                mmTop = 5027
                mmWidth = 15081
                BandType = 3
                GroupNo = 0
              end
              object ppLabel33: TppLabel
                UserName = 'Label33'
                AutoSize = False
                Caption = 'Movimentação da Carteira'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                mmHeight = 3440
                mmLeft = 52388
                mmTop = 1058
                mmWidth = 44186
                BandType = 3
                GroupNo = 0
              end
              object ppLabel34: TppLabel
                UserName = 'Label34'
                AutoSize = False
                Caption = 'Evolução da Cota'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                mmHeight = 3440
                mmLeft = 176477
                mmTop = 794
                mmWidth = 33338
                BandType = 3
                GroupNo = 0
              end
              object ppLine10: TppLine
                UserName = 'Line10'
                Weight = 0.75
                mmHeight = 1323
                mmLeft = 240507
                mmTop = 2646
                mmWidth = 42598
                BandType = 3
                GroupNo = 0
              end
              object ppLabel35: TppLabel
                UserName = 'Label35'
                AutoSize = False
                Caption = 'Variação %'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                mmHeight = 3440
                mmLeft = 252413
                mmTop = 794
                mmWidth = 22490
                BandType = 3
                GroupNo = 0
              end
              object ppLabel36: TppLabel
                UserName = 'Label36'
                AutoSize = False
                Caption = 'Ano'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 267230
                mmTop = 4763
                mmWidth = 13229
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand2: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 7144
              mmPrintPosition = 0
              object ppLine7: TppLine
                UserName = 'Line7'
                Weight = 0.75
                mmHeight = 2117
                mmLeft = 8731
                mmTop = 1588
                mmWidth = 274638
                BandType = 5
                GroupNo = 0
              end
            end
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppOrcamentoSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 1323
        mmWidth = 281517
        BandType = 8
      end
      object pplblSistema: TppLabel
        UserName = 'LblSistema1'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1058
        mmWidth = 282311
        BandType = 8
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 2646
        mmLeft = 265
        mmTop = 265
        mmWidth = 282046
        BandType = 8
      end
      object ppOrcamentoSystemVariable8: TppSystemVariable
        UserName = 'OrcamentoSystemVariable8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 250825
        mmTop = 1058
        mmWidth = 31485
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppShape9: TppShape
        UserName = 'Shape9'
        Pen.Width = 2
        mmHeight = 6085
        mmLeft = 6085
        mmTop = 0
        mmWidth = 276490
        BandType = 7
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 7938
        mmTop = 1058
        mmWidth = 44450
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'VALOR_CONTABIL'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3704
        mmLeft = 55563
        mmTop = 1058
        mmWidth = 20373
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'ULTREAVALIA'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3704
        mmLeft = 79640
        mmTop = 1058
        mmWidth = 20373
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'RECEITA_LIQUIDA_MES'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3704
        mmLeft = 103981
        mmTop = 1058
        mmWidth = 20373
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'RECEITA_LIQUIDA_ANO'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3704
        mmLeft = 126207
        mmTop = 1058
        mmWidth = 20373
        BandType = 7
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'FINRENTAB_MES_NOMINAL'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3704
        mmLeft = 149754
        mmTop = 1058
        mmWidth = 20373
        BandType = 7
      end
      object ppDBText19: TppDBText
        UserName = 'DBText103'
        DataField = 'FINRENTAB_MES_REAL'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3704
        mmLeft = 171980
        mmTop = 1058
        mmWidth = 20373
        BandType = 7
      end
      object ppdbtxtRentAtuMesTotFinal: TppDBText
        UserName = 'dbtxtRentAtuMesTotFinal'
        DataField = 'FINRENTAB_MES_ATUARIAL'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3704
        mmLeft = 193675
        mmTop = 1058
        mmWidth = 20373
        BandType = 7
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'FINRENTAB_ANO_NOMINAL'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3704
        mmLeft = 217488
        mmTop = 1058
        mmWidth = 20373
        BandType = 7
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'FINRENTAB_ANO_REAL'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3704
        mmLeft = 239713
        mmTop = 1058
        mmWidth = 20373
        BandType = 7
      end
      object ppdbtxtRentAtuAnoTotFinal: TppDBText
        UserName = 'dbtxtRentAtuAnoTotFinal'
        DataField = 'FINRENTAB_ANO_ATUARIAL'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3704
        mmLeft = 261409
        mmTop = 1058
        mmWidth = 20373
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'SEGMENTO'
      DataPipeline = pplnMapa
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplnMapa'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 18521
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          Pen.Color = clWhite
          mmHeight = 6350
          mmLeft = 2117
          mmTop = 265
          mmWidth = 279909
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'SEGMENTO'
          DataPipeline = pplnMapa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 4233
          mmLeft = 3704
          mmTop = 1323
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1588
          mmLeft = 7408
          mmTop = 16933
          mmWidth = 274373
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Nominal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 149490
          mmTop = 12435
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Real'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 171715
          mmTop = 12435
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object pplblRentAtuMes: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Atuarial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 193411
          mmTop = 12435
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Nominal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 217223
          mmTop = 12435
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label101'
          AutoSize = False
          Caption = 'Real'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 239448
          mmTop = 12435
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object pplblRentAtuAno: TppLabel
          UserName = 'lblRentAtuAno'
          AutoSize = False
          Caption = 'Atuarial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 261144
          mmTop = 12435
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 103717
          mmTop = 12435
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label102'
          AutoSize = False
          Caption = 'Ano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 125942
          mmTop = 12435
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Valor Contábil*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7938
          mmLeft = 55298
          mmTop = 8467
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Última Reavaliação*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7938
          mmLeft = 79375
          mmTop = 8467
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppShape2: TppShape
          UserName = 'Shape2'
          mmHeight = 1323
          mmLeft = 103717
          mmTop = 10583
          mmWidth = 42863
          BandType = 3
          GroupNo = 0
        end
        object ppShape3: TppShape
          UserName = 'Shape3'
          Pen.Color = clWhite
          mmHeight = 529
          mmLeft = 103717
          mmTop = 11642
          mmWidth = 42863
          BandType = 3
          GroupNo = 0
        end
        object ppShape4: TppShape
          UserName = 'Shape4'
          mmHeight = 1323
          mmLeft = 149490
          mmTop = 10583
          mmWidth = 64558
          BandType = 3
          GroupNo = 0
        end
        object ppShape5: TppShape
          UserName = 'Shape5'
          Pen.Color = clWhite
          mmHeight = 529
          mmLeft = 149490
          mmTop = 11642
          mmWidth = 64558
          BandType = 3
          GroupNo = 0
        end
        object ppShape6: TppShape
          UserName = 'Shape6'
          mmHeight = 1323
          mmLeft = 217223
          mmTop = 10583
          mmWidth = 64558
          BandType = 3
          GroupNo = 0
        end
        object ppShape7: TppShape
          UserName = 'Shape7'
          Pen.Color = clWhite
          mmHeight = 529
          mmLeft = 217223
          mmTop = 11642
          mmWidth = 64558
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Receita Líquida*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 103717
          mmTop = 6879
          mmWidth = 42863
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'Rentabilidade no Mês (%)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 149490
          mmTop = 6879
          mmWidth = 64558
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          AutoSize = False
          Caption = 'Rentabilidade no Ano (%)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 217223
          mmTop = 6879
          mmWidth = 64558
          BandType = 3
          GroupNo = 0
        end
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          DataField = 'TITULO'
          DataPipeline = pplnMapa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 3970
          mmLeft = 7673
          mmTop = 12436
          mmWidth = 44450
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 16933
        mmPrintPosition = 0
        object ppLine4: TppLine
          UserName = 'Line4'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1588
          mmLeft = 7409
          mmTop = 265
          mmWidth = 274373
          BandType = 5
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'lblImovelMestre1'
          AutoSize = False
          Caption = 'Total do Segmento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 7620
          mmTop = 1059
          mmWidth = 44450
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALOR_CONTABIL'
          DataPipeline = pplnMapa
          DisplayFormat = '#,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 3704
          mmLeft = 55298
          mmTop = 1058
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'ULTREAVALIA'
          DataPipeline = pplnMapa
          DisplayFormat = '#,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 3704
          mmLeft = 79375
          mmTop = 1059
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'RECEITA_LIQUIDA_MES'
          DataPipeline = pplnMapa
          DisplayFormat = '#,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 3704
          mmLeft = 103716
          mmTop = 1059
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'RECEITA_LIQUIDA_ANO'
          DataPipeline = pplnMapa
          DisplayFormat = '#,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 3704
          mmLeft = 125941
          mmTop = 1059
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          DataField = 'TOTRENTAB_MES_NOMINAL'
          DataPipeline = pplnMapa
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 3704
          mmLeft = 149490
          mmTop = 1059
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'TOTRENTAB_MES_REAL'
          DataPipeline = pplnMapa
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 3704
          mmLeft = 171715
          mmTop = 1059
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppdbtxtRentAtuMesTot: TppDBText
          UserName = 'DBText11'
          DataField = 'TOTRENTAB_MES_ATUARIAL'
          DataPipeline = pplnMapa
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 3704
          mmLeft = 193411
          mmTop = 1059
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBText15: TppDBText
          UserName = 'DBText15'
          DataField = 'TOTRENTAB_ANO_NOMINAL'
          DataPipeline = pplnMapa
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 3704
          mmLeft = 217170
          mmTop = 1059
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBText16: TppDBText
          UserName = 'DBText102'
          DataField = 'TOTRENTAB_ANO_REAL'
          DataPipeline = pplnMapa
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 3704
          mmLeft = 239522
          mmTop = 1059
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppdbtxtRentAtuAnoTot: TppDBText
          UserName = 'dbtxtRentAtuAnoTot'
          DataField = 'TOTRENTAB_ANO_ATUARIAL'
          DataPipeline = pplnMapa
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 3704
          mmLeft = 261113
          mmTop = 1059
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppShape8: TppShape
          UserName = 'Shape8'
          Brush.Style = bsClear
          Pen.Color = clWhite
          mmHeight = 4763
          mmLeft = 267494
          mmTop = 12169
          mmWidth = 13229
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650611
        4865616465724265666F72655072696E740B50726F6772616D54797065070B74
        7450726F63656475726506536F75726365065670726F63656475726520486561
        6465724265666F72655072696E743B0D0A626567696E0D0A2020726750617261
        6D2E56697369626C65203A3D20285265706F72742E506167654E6F203D203129
        3B0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060648656164657209
        4576656E744E616D65060B4265666F72655072696E74074576656E7449440218
        0000}
    end
  end
  object dsFluxo: TDataSource
    DataSet = cdsFluxo
    Left = 369
    Top = 177
  end
  object pplnFluxo: TppDBPipeline
    DataSource = dsFluxo
    UserName = 'lnFluxo'
    Left = 369
    Top = 188
    object pplnFluxoppField1: TppField
      FieldAlias = 'IDSEGMENTO'
      FieldName = 'IDSEGMENTO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 0
    end
    object pplnFluxoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVELMESTRE'
      FieldName = 'IDIMOVELMESTRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplnFluxoppField3: TppField
      FieldAlias = 'ANOMES'
      FieldName = 'ANOMES'
      FieldLength = 6
      DisplayWidth = 6
      Position = 2
    end
    object pplnFluxoppField4: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object pplnFluxoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'ATIVO'
      FieldName = 'ATIVO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplnFluxoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'COMPRAVENDA'
      FieldName = 'COMPRAVENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplnFluxoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'ABERTURA'
      FieldName = 'ABERTURA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplnFluxoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'FECHAMENTO'
      FieldName = 'FECHAMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplnFluxoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCOTA'
      FieldName = 'VLRCOTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplnFluxoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VARMESNOM'
      FieldName = 'VARMESNOM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplnFluxoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VARANONOM'
      FieldName = 'VARANONOM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplnFluxoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDMODULO'
      FieldName = 'IDMODULO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplnFluxoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORIGEM'
      FieldName = 'ORIGEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplnFluxoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'RECEITAMES'
      FieldName = 'RECEITAMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplnFluxoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESPESAMES'
      FieldName = 'DESPESAMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplnFluxoppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'RECEITALIQUIDA'
      FieldName = 'RECEITALIQUIDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      ' SELECT   DISTINCT'
      '          I.IDPATRO,'
      '          P.IDPLANOPREV,'
      '          A.NOME AS NOMEPATRO,'
      '          P.NOME AS NOMEPLANO'
      ' FROM     PLANPREVCONTABIL P,'
      '          PESSOA A,'
      '          PLANOPATROXIMOVEL I'
      ' WHERE    P.IDPLANOPREV = I.IDPLANOPREV'
      '   AND    I.IDPATRO     = A.IDPESSOA'
      ' ORDER BY 3, 4'
      ' '
      ' ')
    ClientDataSet = cdsMapa
    Left = 297
    Top = 266
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      'SELECT   I.CODTIPIMOVEL AS IDSEGMENTO,'
      
        '          I.IDIMOVELMESTRE,                                     ' +
        '   '
      
        '          DECODE(I.FLGTIPOINTERNO, '#39'P'#39',                         ' +
        ' '
      
        '                 TO_CHAR( LI.DATAVENCIMENTO, '#39'YYYYMM'#39' ),        ' +
        ' '
      
        '                 TO_CHAR( RP.DATABAIXA, '#39'YYYYMM'#39' ) ) AS ANOMES, ' +
        ' '
      ' DECODE(I.FLGTIPOINTERNO, '#39'P'#39',                         '
      
        '                     LI.DATAVENCIMENTO, RP.DATABAIXA ) AS DATALA' +
        'NCTO, '
      '              0 AS ATIVO,'
      '              0 AS COMPRAVENDA,'
      '              0 AS ABERTURA,'
      '              0 AS FECHAMENTO,'
      '              0 AS VLRCOTA,'
      '              0 AS VARMESNOM,'
      '              0 AS VARANONOM,'
      '           LI.IDMODULO, 1 AS ORIGEM,                         '
      '          NVL( ROUND( SUM( DECODE( I.FLGTIPOINTERNO, '#39'P'#39',  '
      
        '                                   ( DECODE( LI.RECPAG, '#39'R'#39', LI.' +
        'VLRLANCRECEB, 0) ),  '
      
        '                                   ( DECODE( RTRIM( LD.OPERACAO ' +
        '), '#39'5'#39',              '
      
        '                                     DECODE( D.RECPAG, '#39'R'#39', DECO' +
        'DE( LD.DEBCRE, '#39'C'#39', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.V' +
        'ALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0 ), 0 ) )  '
      
        '                                  ) * FT.FATOR ), 2 ), 0 ) AS RE' +
        'CEITAMES,              '
      '          NVL( ROUND( SUM( DECODE( I.FLGTIPOINTERNO, '#39'P'#39', '
      
        '                                   ( DECODE( LI.CODDOCUMENTO, NU' +
        'LL, '
      
        '                                             DECODE( LI.RECPAG, ' +
        #39'P'#39', LI.VLRLANCPAGAR, 0), '
      
        '                                             ( DECODE( RTRIM( LD' +
        '.OPERACAO ), '#39'5'#39', '
      
        '                                               DECODE( D.RECPAG,' +
        ' '#39'P'#39', DECODE( LD.DEBCRE, '#39'D'#39', LD.VALOR * LI.VLRLANCPAGAR / TRD.V' +
        'ALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0 ), 0 ) )' +
        '  ) ), '
      
        '                                   ( DECODE( RTRIM( LD.OPERACAO ' +
        '), '#39'5'#39', '
      
        '                                     DECODE( D.RECPAG, '#39'P'#39', DECO' +
        'DE( LD.DEBCRE, '#39'D'#39', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.V' +
        'ALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0 ), 0 ) ) '
      
        '                                  ) * FT.FATOR ), 2 ), 0 ) AS DE' +
        'SPESAMES, '
      '         NVL( ROUND( SUM((DECODE( I.FLGTIPOINTERNO, '#39'P'#39', '
      
        '                                  ( DECODE(LI.CODDOCUMENTO, NULL' +
        ', '
      
        '                                           DECODE( LI.RECPAG, '#39'R' +
        #39', LI.VLRLANCRECEB, 0), '
      
        '                                           DECODE( RTRIM( LD.OPE' +
        'RACAO ), '#39'5'#39', DECODE( D.RECPAG, '#39'R'#39', DECODE( LD.DEBCRE, '#39'C'#39', LD.' +
        'VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLAN' +
        'CRECEB / TRD.VALOR), 0 ), 0 ) ) ), '
      
        '                                           DECODE( RTRIM( LD.OPE' +
        'RACAO ), '#39'5'#39', DECODE( D.RECPAG, '#39'R'#39', DECODE( LD.DEBCRE, '#39'C'#39', LD.' +
        'VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLAN' +
        'CRECEB / TRD.VALOR), 0 ), 0 ) ) - '
      '                          DECODE( I.FLGTIPOINTERNO, '#39'P'#39', '
      
        '                                  ( DECODE(LI.CODDOCUMENTO, NULL' +
        ', '
      
        '                                           DECODE( LI.RECPAG, '#39'P' +
        #39', LI.VLRLANCPAGAR, 0), '
      
        '                                            ( DECODE( RTRIM( LD.' +
        'OPERACAO ), '#39'5'#39', '
      
        '                                              DECODE( D.RECPAG, ' +
        #39'P'#39', DECODE( LD.DEBCRE, '#39'D'#39', LD.VALOR * LI.VLRLANCPAGAR / TRD.VA' +
        'LOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0 ), 0 ) ) ' +
        ' ) ), '
      
        '                                  ( DECODE( RTRIM( LD.OPERACAO )' +
        ', '#39'5'#39', DECODE( D.RECPAG, '#39'P'#39', DECODE( LD.DEBCRE, '#39'D'#39', LD.VALOR *' +
        ' LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR ' +
        '/ TRD.VALOR), 0 ), 0 ) ) ) '
      
        '                                 ) * FT.FATOR ), 2 ), 0 ) AS REC' +
        'EITALIQUIDA '
      ' FROM     DOCUMENTO         D,   '
      '          LANCTODOCUM       LD,  '
      '          LANCAMENTOSIMOVEL LI,  '
      '          IMOVEL            IM,'
      '          RECBTOPAGTO       RP,  '
      '          TIPOCUSTORECIMOV  TC,  '
      '          ( SELECT   I.IDIMOVEL,        '
      '                     I.IDIMOVELMESTRE,  '
      '                     TI.CODTIPIMOVEL,   '
      '                     TI.DESCTIPOIMOVEL, '
      '                     TI.FLGTIPOINTERNO, '
      
        '                     DECODE( I.IDCARTEIRASPC, NULL, CS1.DESCARTE' +
        'IRASPC, CS2.DESCARTEIRASPC ) AS DESCARTEIRASPC,      '
      
        '                     TO_CHAR( DECODE( I.IDCARTEIRASPC, NULL, TI.' +
        'IDCARTEIRASPC, I.IDCARTEIRASPC ) ) AS IDCARTEIRASPC  '
      '            FROM     IMOVEL            I,                 '
      '                     TIPOIMOVEL        TI,                '
      '                     CARTEIRASPC       CS1,               '
      '                     CARTEIRASPC       CS2                '
      '            WHERE    I.CODTIPIMOVEL    = TI.CODTIPIMOVEL  '
      
        '              AND    TI.IDCARTEIRASPC  = CS1.IDCARTEIRASPC(+)   ' +
        '   '
      
        '              AND    I.IDCARTEIRASPC   = CS2.IDCARTEIRASPC(+) ) ' +
        'I, '
      
        '          ( SELECT    PI.IDIMOVEL,                              ' +
        '   '
      
        '                      PI.IDPATRO,                               ' +
        '   '
      
        '                      PI.IDPLANOPREV,                           ' +
        '   '
      
        '                      DECODE( PI.FLGTIPO, '#39'P'#39', ( PI.PPIPERCENTRA' +
        'TEIO / 100 ), '#39'C'#39', ( PI.PPIPERCENTRATEIO / TT.TOTAL ), NULL ) AS' +
        ' FATOR   '
      '            FROM      PLANOPATROXIMOVEL PI,   '
      '                      ( SELECT    IDIMOVEL,   '
      
        '                                  SUM( PPIPERCENTRATEIO ) AS TOT' +
        'AL '
      '                        FROM      PLANOPATROXIMOVEL      '
      '                        GROUP BY  IDIMOVEL ) TT          '
      '            WHERE     PI.IDIMOVEL = TT.IDIMOVEL ) FT,    '
      '          ( SELECT CODDOCUMENTO,     '
      '                   VALOR             '
      '            FROM   LANCTODOCUM       '
      
        '                   WHERE  RTRIM( OPERACAO ) IN ( '#39'1'#39', '#39'2'#39', '#39'3'#39', ' +
        #39'12'#39' ) ) TRD'
      
        ' WHERE    ( LI.CODDOCUMENTO      = D.CODDOCUMENTO(+)            ' +
        '      )  '
      
        '   AND    ( D.CODDOCUMENTO       = LD.CODDOCUMENTO(+)           ' +
        '      )  '
      
        '   AND    ( D.CODDOCUMENTO       = TRD.CODDOCUMENTO(+)          ' +
        '      )  '
      
        '   AND    ( LD.CODDOCUMENTO      = RP.CODDOCUMENTO(+)           ' +
        '      )  '
      
        '   AND    ( LD.NUMLANCTO         = RP.NUMLANCTO(+)              ' +
        '      )  '
      
        '   AND    ( I.IDIMOVEL           = FT.IDIMOVEL                  ' +
        '      )  '
      
        '   AND    ( I.IDIMOVELMESTRE     = IM.IDIMOVEL                  ' +
        '      )  '
      
        '   AND    ( LI.IDTIPOCUSTORECIMO = TC.IDTIPOCUSTORECIMO         ' +
        '      )  '
      
        '   AND    ( LI.IDIMOVEL          = I.IDIMOVEL                   ' +
        '      )  '
      
        '   AND    ( TC.FLGRENTAB         = 1                            ' +
        '      )  '
      '   AND    ( LI.IDMODULO = 64 )   '
      
        '   AND    ( ((I.FLGTIPOINTERNO <> '#39'P'#39') AND (RP.DATABAIXA BETWEEN' +
        ' '#39'01/01/2005'#39' AND '#39'31/07/2005'#39'  )) OR       '
      
        '            ((I.FLGTIPOINTERNO =  '#39'P'#39') AND (LI.DATAVENCIMENTO BE' +
        'TWEEN '#39'01/01/2005'#39' AND '#39'31/07/2005'#39'  )) )   '
      
        '   AND    ( TO_CHAR( FT.IDPATRO ) || '#39'/'#39' || TO_CHAR( FT.IDPLANOP' +
        'REV ) IN ( '#39'120/20'#39','#39'120/21'#39' ) )  '
      ' GROUP BY I.CODTIPIMOVEL,  '
      '          I.IDIMOVELMESTRE,                                 '
      '          DECODE(I.FLGTIPOINTERNO, '#39'P'#39',                   '
      '                 TO_CHAR( LI.DATAVENCIMENTO, '#39'YYYYMM'#39' ),  '
      '                 TO_CHAR( RP.DATABAIXA, '#39'YYYYMM'#39' ) ),     '
      ' DECODE(I.FLGTIPOINTERNO, '#39'P'#39',               '
      '                     LI.DATAVENCIMENTO, RP.DATABAIXA ),     '
      '              0, 0, 0, 0, 0, 0, 0, 0,'
      '          LI.IDMODULO                                       '
      ' ORDER BY 1, 2, 3, 4'
      ''
      ' '
      ' ')
    ClientDataSet = cdsFluxo
    Left = 379
    Top = 266
  end
  object cdsFluxoSeg: TCMClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'IDSEGMENTO;DATALANCTO'
    Params = <>
    Left = 209
    Top = 165
    Data = {
      800100009619E0BD01000000180000001000000000000300000080010A494453
      45474D454E544F01004900000001000557494454480200020005000E4944494D
      4F56454C4D4553545245080004000000000006414E4F4D455301004900000001
      000557494454480200020006000A444154414C414E43544F0800080000000000
      05415449564F08000400000000000B434F4D50524156454E4441080004000000
      000008414245525455524108000400000000000A46454348414D454E544F0800
      04000000000007564C52434F54410800040000000000095641524D45534E4F4D
      080004000000000009564152414E4F4E4F4D08000400000000000849444D4F44
      554C4F0800040000000000064F524947454D08000400000000000A5245434549
      54414D455308000400000000000A444553504553414D45530800040000000000
      0E524543454954414C495155494441080004000000000002000D44454641554C
      545F4F5244455202008200040000000100020003000400044C43494404000100
      09080000}
  end
  object dsFluxoSeg: TDataSource
    DataSet = cdsFluxoSeg
    Left = 209
    Top = 179
  end
  object rptResumo: TppReport
    AutoStop = False
    DataPipeline = pplnMapa
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório Gerencial - Resumo'
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
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 488
    Top = 299
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pplnMapa'
    object ppTitleBand2: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 57150
      mmPrintPosition = 0
      object lblEmpresaResumo: TppLabel
        UserName = 'lblEmpresaResumo'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 265
        mmTop = 1852
        mmWidth = 281253
        BandType = 1
      end
      object ppLabel38: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Mapa Gerencial de Rentabilidade por Cotas (resumido)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 1588
        mmTop = 8996
        mmWidth = 279930
        BandType = 1
      end
      object ppLine11: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 1588
        mmTop = 17992
        mmWidth = 279930
        BandType = 1
      end
      object ppLabel39: TppLabel
        UserName = 'lblImovelMestre2'
        AutoSize = False
        Caption = 'Mês /Ano de Competência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 1852
        mmTop = 21960
        mmWidth = 55033
        BandType = 1
      end
      object ppLabel40: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 58473
        mmTop = 21960
        mmWidth = 1852
        BandType = 1
      end
      object pplblCompetenciaTot: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'pplblCompetenciaTot'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 61913
        mmTop = 21960
        mmWidth = 51329
        BandType = 1
      end
      object ppLabel41: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = 'Tipo de Segmento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 116946
        mmTop = 21960
        mmWidth = 32544
        BandType = 1
      end
      object ppLabel42: TppLabel
        UserName = 'Label201'
        AutoSize = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 150284
        mmTop = 21960
        mmWidth = 1852
        BandType = 1
      end
      object pplblTipoSegmentoTot: TppLabel
        UserName = 'lblTipoSegmento'
        AutoSize = False
        Caption = 'pplblTipoSegmentoTot'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 153723
        mmTop = 21960
        mmWidth = 38365
        BandType = 1
      end
      object ppLabel45: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Caption = 'Patrocinadoras/Planos selecionados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 27781
        mmWidth = 56092
        BandType = 1
      end
      object ppLabel46: TppLabel
        UserName = 'Label202'
        AutoSize = False
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 58208
        mmTop = 27781
        mmWidth = 1852
        BandType = 1
      end
      object ppLabel47: TppLabel
        UserName = 'lblImovelMestre3'
        AutoSize = False
        Caption = 'Segmento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 7408
        mmTop = 51065
        mmWidth = 44450
        BandType = 1
      end
      object ppLine12: TppLine
        UserName = 'Line10'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 7409
        mmTop = 55563
        mmWidth = 274373
        BandType = 1
      end
      object ppLabel48: TppLabel
        UserName = 'Label33'
        AutoSize = False
        Caption = 'Nominal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 149225
        mmTop = 51065
        mmWidth = 20373
        BandType = 1
      end
      object ppLabel49: TppLabel
        UserName = 'Label103'
        AutoSize = False
        Caption = 'Real'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 171450
        mmTop = 51065
        mmWidth = 20373
        BandType = 1
      end
      object pplblRentAtuMesTot1: TppLabel
        UserName = 'lblRentAtuMesTot1'
        AutoSize = False
        Caption = 'Atuarial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 193146
        mmTop = 51065
        mmWidth = 20373
        BandType = 1
      end
      object ppLabel50: TppLabel
        UserName = 'Label44'
        AutoSize = False
        Caption = 'Nominal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 216959
        mmTop = 51065
        mmWidth = 20373
        BandType = 1
      end
      object ppLabel60: TppLabel
        UserName = 'Label60'
        AutoSize = False
        Caption = 'Real'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 239184
        mmTop = 51065
        mmWidth = 20373
        BandType = 1
      end
      object ppLabel61: TppLabel
        UserName = 'Label61'
        AutoSize = False
        Caption = 'Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 103452
        mmTop = 51065
        mmWidth = 20373
        BandType = 1
      end
      object ppLabel62: TppLabel
        UserName = 'Label62'
        AutoSize = False
        Caption = 'Ano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 125677
        mmTop = 51065
        mmWidth = 20373
        BandType = 1
      end
      object ppLabel63: TppLabel
        UserName = 'Label63'
        AutoSize = False
        Caption = 'Valor Contábil*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 55033
        mmTop = 47096
        mmWidth = 20373
        BandType = 1
      end
      object ppLabel64: TppLabel
        UserName = 'Label64'
        AutoSize = False
        Caption = 'Última Reavaliação*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 79111
        mmTop = 47096
        mmWidth = 20373
        BandType = 1
      end
      object ppShape11: TppShape
        UserName = 'Shape11'
        mmHeight = 1323
        mmLeft = 103452
        mmTop = 49213
        mmWidth = 42863
        BandType = 1
      end
      object ppShape18: TppShape
        UserName = 'Shape18'
        Pen.Color = clWhite
        mmHeight = 529
        mmLeft = 103452
        mmTop = 50271
        mmWidth = 42863
        BandType = 1
      end
      object ppShape19: TppShape
        UserName = 'Shape19'
        mmHeight = 1323
        mmLeft = 149225
        mmTop = 49213
        mmWidth = 64558
        BandType = 1
      end
      object ppShape20: TppShape
        UserName = 'Shape20'
        Pen.Color = clWhite
        mmHeight = 529
        mmLeft = 149225
        mmTop = 50271
        mmWidth = 64558
        BandType = 1
      end
      object ppShape21: TppShape
        UserName = 'Shape21'
        mmHeight = 1323
        mmLeft = 216959
        mmTop = 49213
        mmWidth = 64558
        BandType = 1
      end
      object ppShape22: TppShape
        UserName = 'Shape22'
        Pen.Color = clWhite
        mmHeight = 529
        mmLeft = 216959
        mmTop = 50271
        mmWidth = 64558
        BandType = 1
      end
      object ppLabel65: TppLabel
        UserName = 'Label65'
        AutoSize = False
        Caption = 'Receita Líquida*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 103452
        mmTop = 45508
        mmWidth = 42863
        BandType = 1
      end
      object ppLabel66: TppLabel
        UserName = 'Label66'
        AutoSize = False
        Caption = 'Rentabilidade no Mês (%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 149225
        mmTop = 45508
        mmWidth = 64558
        BandType = 1
      end
      object ppLabel67: TppLabel
        UserName = 'Label67'
        AutoSize = False
        Caption = 'Rentabilidade no Ano (%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 216959
        mmTop = 45508
        mmWidth = 64558
        BandType = 1
      end
      object pplblRentAtuAnoTot1: TppLabel
        UserName = 'lblRentAtuAno1'
        AutoSize = False
        Caption = 'Atuarial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 261144
        mmTop = 51065
        mmWidth = 20373
        BandType = 1
      end
      object ppLogotipoResumo: TppImage
        UserName = 'ppLogoTipo1'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15875
        mmLeft = 529
        mmTop = 529
        mmWidth = 15875
        BandType = 1
      end
      object ppLabel51: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = '* Valores em R$ 1.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 36513
        mmWidth = 59531
        BandType = 1
      end
      object pplblAlienacaoRendaTot: TppLabel
        UserName = 'lblAlienacaoRenda1'
        AutoSize = False
        Caption = '* Não considerando alienação como Renda.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 32808
        mmWidth = 59002
        BandType = 1
      end
      object ppMemPatroPlanoTot: TppMemo
        UserName = 'MemPatroPlanoTot'
        Caption = 'MemPatroPlanoTot'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 13494
        mmLeft = 62442
        mmTop = 27781
        mmWidth = 160073
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel74: TppLabel
        UserName = 'Label74'
        AutoSize = False
        Caption = 'Correção Real :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 224632
        mmTop = 21696
        mmWidth = 23813
        BandType = 1
      end
      object pplLabelAtuTot: TppLabel
        UserName = 'lLabelAtu1'
        AutoSize = False
        Caption = 'Correção Atuarial :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 224632
        mmTop = 26458
        mmWidth = 29633
        BandType = 1
      end
      object pplIndRealTot: TppLabel
        UserName = 'lIndReal1'
        AutoSize = False
        Caption = 'IGP-DI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 254530
        mmTop = 21960
        mmWidth = 26723
        BandType = 1
      end
      object pplIndAtuTot: TppLabel
        UserName = 'lIndAtu1'
        AutoSize = False
        Caption = 'IGP-DI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 254530
        mmTop = 26458
        mmWidth = 26723
        BandType = 1
      end
    end
    object ppHeaderBand3: TppHeaderBand
      PrintOnFirstPage = False
      mmBottomOffset = 0
      mmHeight = 23813
      mmPrintPosition = 0
      object ppLabel52: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 'Mapa de Rentabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 2381
        mmTop = 265
        mmWidth = 279930
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line5'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 2380
        mmTop = 5842
        mmWidth = 279930
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'lblImovelMestre'
        AutoSize = False
        Caption = 'Segmento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 7673
        mmTop = 17198
        mmWidth = 44450
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 7408
        mmTop = 21696
        mmWidth = 274373
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Nominal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 149490
        mmTop = 17198
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel55: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Real'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 171715
        mmTop = 17198
        mmWidth = 20373
        BandType = 0
      end
      object pplblRentAtuMesTot2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Atuarial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 193411
        mmTop = 17198
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Nominal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 217223
        mmTop = 17198
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Real'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 239448
        mmTop = 17198
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel58: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 103717
        mmTop = 17198
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'Label102'
        AutoSize = False
        Caption = 'Ano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 125942
        mmTop = 17198
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel68: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Valor Contábil*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 55298
        mmTop = 13229
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Última Reavaliação*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 79375
        mmTop = 13229
        mmWidth = 20373
        BandType = 0
      end
      object ppShape12: TppShape
        UserName = 'Shape2'
        mmHeight = 1323
        mmLeft = 103717
        mmTop = 15346
        mmWidth = 42863
        BandType = 0
      end
      object ppShape13: TppShape
        UserName = 'Shape3'
        Pen.Color = clWhite
        mmHeight = 529
        mmLeft = 103717
        mmTop = 16404
        mmWidth = 42863
        BandType = 0
      end
      object ppShape14: TppShape
        UserName = 'Shape4'
        mmHeight = 1323
        mmLeft = 149490
        mmTop = 15346
        mmWidth = 64558
        BandType = 0
      end
      object ppShape15: TppShape
        UserName = 'Shape5'
        Pen.Color = clWhite
        mmHeight = 529
        mmLeft = 149490
        mmTop = 16404
        mmWidth = 64558
        BandType = 0
      end
      object ppShape16: TppShape
        UserName = 'Shape6'
        mmHeight = 1323
        mmLeft = 217223
        mmTop = 15346
        mmWidth = 64558
        BandType = 0
      end
      object ppShape17: TppShape
        UserName = 'Shape7'
        Pen.Color = clWhite
        mmHeight = 529
        mmLeft = 217223
        mmTop = 16404
        mmWidth = 64558
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Receita Líquida*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 103717
        mmTop = 11642
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Rentabilidade no Mês (%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 149490
        mmTop = 11642
        mmWidth = 64558
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Rentabilidade no Ano (%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 217223
        mmTop = 11642
        mmWidth = 64558
        BandType = 0
      end
      object pplblRentAtuAnoTot2: TppLabel
        UserName = 'lblRentAtuAno'
        AutoSize = False
        Caption = 'Atuarial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 261113
        mmTop = 17198
        mmWidth = 20373
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1323
        mmWidth = 282311
        BandType = 8
      end
      object pplSistemaResumo: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1323
        mmWidth = 282311
        BandType = 8
      end
      object ppLine15: TppLine
        UserName = 'Line8'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 2646
        mmLeft = 265
        mmTop = 529
        mmWidth = 282046
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 250825
        mmTop = 1323
        mmWidth = 31485
        BandType = 8
      end
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppShape23: TppShape
        UserName = 'Shape9'
        Pen.Width = 2
        mmHeight = 6085
        mmLeft = 5821
        mmTop = 1058
        mmWidth = 276490
        BandType = 7
      end
      object ppLabel73: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 7673
        mmTop = 2117
        mmWidth = 44450
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'VALOR_CONTABIL'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3704
        mmLeft = 55298
        mmTop = 2117
        mmWidth = 20373
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'ULTREAVALIA'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3704
        mmLeft = 79375
        mmTop = 2117
        mmWidth = 20373
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'RECEITA_LIQUIDA_MES'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3704
        mmLeft = 103717
        mmTop = 2117
        mmWidth = 20373
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'RECEITA_LIQUIDA_ANO'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3704
        mmLeft = 125942
        mmTop = 2117
        mmWidth = 20373
        BandType = 7
      end
      object ppDBText37: TppDBText
        UserName = 'DBText18'
        DataField = 'FINRENTAB_MES_NOMINAL'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3704
        mmLeft = 149490
        mmTop = 2117
        mmWidth = 20373
        BandType = 7
      end
      object ppDBText38: TppDBText
        UserName = 'DBText103'
        DataField = 'FINRENTAB_MES_REAL'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3704
        mmLeft = 171715
        mmTop = 2117
        mmWidth = 20373
        BandType = 7
      end
      object ppdbtxtRentAtuMesTotalFinal: TppDBText
        UserName = 'DBText20'
        DataField = 'FINRENTAB_MES_ATUARIAL'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3704
        mmLeft = 193411
        mmTop = 2117
        mmWidth = 20373
        BandType = 7
      end
      object ppDBText40: TppDBText
        UserName = 'DBText21'
        DataField = 'FINRENTAB_ANO_NOMINAL'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3704
        mmLeft = 217223
        mmTop = 2117
        mmWidth = 20373
        BandType = 7
      end
      object ppDBText41: TppDBText
        UserName = 'DBText22'
        DataField = 'FINRENTAB_ANO_REAL'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3704
        mmLeft = 239448
        mmTop = 2117
        mmWidth = 20373
        BandType = 7
      end
      object ppdbtxtRentAtuAnoTotalFinal: TppDBText
        UserName = 'DBText23'
        DataField = 'FINRENTAB_ANO_ATUARIAL'
        DataPipeline = pplnMapa
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplnMapa'
        mmHeight = 3704
        mmLeft = 261144
        mmTop = 2117
        mmWidth = 20373
        BandType = 7
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'SEGMENTO'
      DataPipeline = pplnMapa
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplnMapa'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppShape24: TppShape
          OnPrint = ppsCorPrint
          UserName = 'sCor1'
          Brush.Color = clLime
          Pen.Style = psClear
          mmHeight = 5292
          mmLeft = 7673
          mmTop = 0
          mmWidth = 274903
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALOR_CONTABIL'
          DataPipeline = pplnMapa
          DisplayFormat = '#,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 3440
          mmLeft = 55298
          mmTop = 794
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'ULTREAVALIA'
          DataPipeline = pplnMapa
          DisplayFormat = '#,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 3440
          mmLeft = 79375
          mmTop = 794
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'RECEITA_LIQUIDA_MES'
          DataPipeline = pplnMapa
          DisplayFormat = '#,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 3440
          mmLeft = 103717
          mmTop = 794
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'RECEITA_LIQUIDA_ANO'
          DataPipeline = pplnMapa
          DisplayFormat = '#,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 3440
          mmLeft = 125942
          mmTop = 794
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBText44: TppDBText
          UserName = 'DBText7'
          DataField = 'TOTRENTAB_MES_NOMINAL'
          DataPipeline = pplnMapa
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 3440
          mmLeft = 149490
          mmTop = 794
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBText45: TppDBText
          UserName = 'DBText10'
          DataField = 'TOTRENTAB_MES_REAL'
          DataPipeline = pplnMapa
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 3440
          mmLeft = 171715
          mmTop = 794
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppdbtxtRentAtuMesTotal: TppDBText
          UserName = 'DBText11'
          DataField = 'TOTRENTAB_MES_ATUARIAL'
          DataPipeline = pplnMapa
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 3440
          mmLeft = 193411
          mmTop = 794
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBText47: TppDBText
          UserName = 'DBText15'
          DataField = 'TOTRENTAB_ANO_NOMINAL'
          DataPipeline = pplnMapa
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 3440
          mmLeft = 217223
          mmTop = 794
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBText48: TppDBText
          UserName = 'DBText102'
          DataField = 'TOTRENTAB_ANO_REAL'
          DataPipeline = pplnMapa
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 3440
          mmLeft = 239448
          mmTop = 794
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDbSegmento: TppDBText
          UserName = 'DBText26'
          DataField = 'SEGMENTO'
          DataPipeline = pplnMapa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 3440
          mmLeft = 7673
          mmTop = 794
          mmWidth = 44450
          BandType = 5
          GroupNo = 0
        end
        object ppdbtxtRentAtuAnoTotal: TppDBText
          UserName = 'DBText17'
          DataField = 'TOTRENTAB_ANO_ATUARIAL'
          DataPipeline = pplnMapa
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplnMapa'
          mmHeight = 3440
          mmLeft = 261144
          mmTop = 794
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppsrFluxoSeg: TppSubReport
          OnPrint = ppsrFluxoSegPrint
          UserName = 'srFluxo1'
          DrillDownComponent = ppDbSegmento
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'pplFluxoSeg'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 5292
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport2: TppChildReport
            AutoStop = False
            DataPipeline = pplFluxoSeg
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Relatório Gerencial'
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
            Left = 288
            Top = 216
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplFluxoSeg'
            object ppTitleBand3: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 9525
              mmPrintPosition = 0
              object ppLabel43: TppLabel
                UserName = 'Label32'
                Caption = 'Fluxo Diário: '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold, fsItalic]
                Transparent = True
                mmHeight = 4233
                mmLeft = 7673
                mmTop = 2910
                mmWidth = 22490
                BandType = 1
              end
              object ppDBText31: TppDBText
                UserName = 'DBText28'
                DataField = 'SEGMENTO'
                DataPipeline = pplnMapa
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold, fsItalic]
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'pplnMapa'
                mmHeight = 4233
                mmLeft = 31485
                mmTop = 2910
                mmWidth = 102129
                BandType = 1
              end
            end
            object ppHeaderBand4: TppHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppDetailBand4: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 4233
              mmPrintPosition = 0
              object ppShape25: TppShape
                OnPrint = ppsCorPrint
                UserName = 'sCor1'
                Brush.Color = clLime
                Pen.Style = psClear
                StretchWithParent = True
                mmHeight = 4233
                mmLeft = 9790
                mmTop = 0
                mmWidth = 273051
                BandType = 4
              end
              object ppDBText32: TppDBText
                UserName = 'DBText1'
                DataField = 'DATALANCTO'
                DataPipeline = pplFluxoSeg
                DisplayFormat = 'dd/mm/yyyy'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplFluxoSeg'
                mmHeight = 3440
                mmLeft = 9260
                mmTop = 265
                mmWidth = 17198
                BandType = 4
              end
              object ppDBText33: TppDBText
                UserName = 'DBText13'
                BlankWhenZero = True
                DataField = 'ATIVO'
                DataPipeline = pplFluxoSeg
                DisplayFormat = '#,0;-#,0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplFluxoSeg'
                mmHeight = 3440
                mmLeft = 28046
                mmTop = 265
                mmWidth = 20638
                BandType = 4
              end
              object ppDBText34: TppDBText
                UserName = 'DBText14'
                BlankWhenZero = True
                DataField = 'RECEITALIQUIDA'
                DataPipeline = pplFluxoSeg
                DisplayFormat = '#,0;-#,0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplFluxoSeg'
                mmHeight = 3440
                mmLeft = 118798
                mmTop = 265
                mmWidth = 23813
                BandType = 4
              end
              object ppDBText35: TppDBText
                UserName = 'DBText17'
                DataField = 'ABERTURA'
                DataPipeline = pplFluxoSeg
                DisplayFormat = '#,0.000000;-#,0.000000'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplFluxoSeg'
                mmHeight = 3440
                mmLeft = 143669
                mmTop = 265
                mmWidth = 33602
                BandType = 4
              end
              object ppDBText36: TppDBText
                UserName = 'DBText20'
                DataField = 'FECHAMENTO'
                DataPipeline = pplFluxoSeg
                DisplayFormat = '#,0.000000;-#,0.000000'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplFluxoSeg'
                mmHeight = 3440
                mmLeft = 178859
                mmTop = 265
                mmWidth = 33602
                BandType = 4
              end
              object ppDBText39: TppDBText
                UserName = 'DBText201'
                DataField = 'VARMESNOM'
                DataPipeline = pplFluxoSeg
                DisplayFormat = '#,0.00;-#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplFluxoSeg'
                mmHeight = 3440
                mmLeft = 242359
                mmTop = 265
                mmWidth = 15610
                BandType = 4
              end
              object ppDBText42: TppDBText
                UserName = 'DBText24'
                BlankWhenZero = True
                DataField = 'COMPRAVENDA'
                DataPipeline = pplFluxoSeg
                DisplayFormat = '#,0;-#,0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplFluxoSeg'
                mmHeight = 3440
                mmLeft = 50271
                mmTop = 265
                mmWidth = 20638
                BandType = 4
              end
              object ppDBText43: TppDBText
                UserName = 'DBText202'
                DataField = 'VLRCOTA'
                DataPipeline = pplFluxoSeg
                DisplayFormat = '#,0.000000;-#,0.000000'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplFluxoSeg'
                mmHeight = 3440
                mmLeft = 214313
                mmTop = 265
                mmWidth = 21696
                BandType = 4
              end
              object ppDBText46: TppDBText
                UserName = 'DBText26'
                BlankWhenZero = True
                DataField = 'RECEITAMES'
                DataPipeline = pplFluxoSeg
                DisplayFormat = '#,0;-#,0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplFluxoSeg'
                mmHeight = 3440
                mmLeft = 72231
                mmTop = 265
                mmWidth = 20638
                BandType = 4
              end
              object ppDBText49: TppDBText
                UserName = 'DBText27'
                BlankWhenZero = True
                DataField = 'DESPESAMES'
                DataPipeline = pplFluxoSeg
                DisplayFormat = '#,0;-#,0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplFluxoSeg'
                mmHeight = 3440
                mmLeft = 94721
                mmTop = 265
                mmWidth = 20638
                BandType = 4
              end
              object ppDBText50: TppDBText
                UserName = 'DBText29'
                DataField = 'VARANONOM'
                DataPipeline = pplFluxoSeg
                DisplayFormat = '#,0.00;-#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplFluxoSeg'
                mmHeight = 3440
                mmLeft = 264848
                mmTop = 265
                mmWidth = 15610
                BandType = 4
              end
            end
            object ppSummaryBand4: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroup4: TppGroup
              BreakName = 'IDSEGMENTO'
              DataPipeline = pplFluxoSeg
              OutlineSettings.CreateNode = True
              UserName = 'Group2'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'pplFluxoSeg'
              object ppGroupHeaderBand4: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 11113
                mmPrintPosition = 0
                object ppLine16: TppLine
                  UserName = 'Line9'
                  Weight = 0.75
                  mmHeight = 1323
                  mmLeft = 145521
                  mmTop = 2646
                  mmWidth = 90752
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine17: TppLine
                  UserName = 'Line8'
                  Weight = 0.75
                  mmHeight = 1323
                  mmLeft = 8996
                  mmTop = 2646
                  mmWidth = 133350
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel44: TppLabel
                  UserName = 'Label11'
                  AutoSize = False
                  Caption = 'Data'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 9260
                  mmTop = 4763
                  mmWidth = 8731
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel75: TppLabel
                  UserName = 'Label15'
                  AutoSize = False
                  Caption = 'Ativo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 39952
                  mmTop = 4763
                  mmWidth = 8731
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel76: TppLabel
                  UserName = 'Label18'
                  AutoSize = False
                  Caption = 'C / V'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 58738
                  mmTop = 4763
                  mmWidth = 12171
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel77: TppLabel
                  UserName = 'Label23'
                  AutoSize = False
                  Caption = 'Rec. Liquida'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 118534
                  mmTop = 4763
                  mmWidth = 24077
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel78: TppLabel
                  UserName = 'Label24'
                  AutoSize = False
                  Caption = 'Abertura'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 160073
                  mmTop = 5027
                  mmWidth = 17198
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel79: TppLabel
                  UserName = 'Label25'
                  AutoSize = False
                  Caption = 'Fechamento'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 193146
                  mmTop = 5027
                  mmWidth = 19315
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel80: TppLabel
                  UserName = 'Label26'
                  AutoSize = False
                  Caption = 'Valor'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 223309
                  mmTop = 5027
                  mmWidth = 12700
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel81: TppLabel
                  UserName = 'Label29'
                  AutoSize = False
                  Caption = 'Mes'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 244740
                  mmTop = 5027
                  mmWidth = 13229
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine18: TppLine
                  UserName = 'Line5'
                  Weight = 0.75
                  mmHeight = 2117
                  mmLeft = 8731
                  mmTop = 8996
                  mmWidth = 274638
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine19: TppLine
                  UserName = 'Line6'
                  Weight = 0.75
                  mmHeight = 1058
                  mmLeft = 8731
                  mmTop = 0
                  mmWidth = 274638
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel82: TppLabel
                  UserName = 'Label30'
                  AutoSize = False
                  Caption = 'Receita'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 77788
                  mmTop = 4763
                  mmWidth = 15081
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel83: TppLabel
                  UserName = 'Label301'
                  AutoSize = False
                  Caption = 'Despesa'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 100277
                  mmTop = 5027
                  mmWidth = 15081
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel84: TppLabel
                  UserName = 'Label33'
                  AutoSize = False
                  Caption = 'Movimentação da Carteira'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taCentered
                  mmHeight = 3440
                  mmLeft = 52388
                  mmTop = 1058
                  mmWidth = 44186
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel85: TppLabel
                  UserName = 'Label34'
                  AutoSize = False
                  Caption = 'Evolução da Cota'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taCentered
                  mmHeight = 3440
                  mmLeft = 176477
                  mmTop = 794
                  mmWidth = 33338
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine20: TppLine
                  UserName = 'Line10'
                  Weight = 0.75
                  mmHeight = 1323
                  mmLeft = 240507
                  mmTop = 2646
                  mmWidth = 42598
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel86: TppLabel
                  UserName = 'Label35'
                  AutoSize = False
                  Caption = 'Variação %'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taCentered
                  mmHeight = 3440
                  mmLeft = 252413
                  mmTop = 794
                  mmWidth = 22490
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel87: TppLabel
                  UserName = 'Label36'
                  AutoSize = False
                  Caption = 'Ano'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 267230
                  mmTop = 4763
                  mmWidth = 13229
                  BandType = 3
                  GroupNo = 0
                end
              end
              object ppGroupFooterBand4: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 7144
                mmPrintPosition = 0
                object ppLine21: TppLine
                  UserName = 'Line7'
                  Weight = 0.75
                  mmHeight = 2117
                  mmLeft = 8731
                  mmTop = 1588
                  mmWidth = 274638
                  BandType = 5
                  GroupNo = 0
                end
              end
            end
          end
        end
      end
    end
  end
  object pplFluxoSeg: TppDBPipeline
    DataSource = dsFluxoSeg
    UserName = 'lnFluxo1'
    Left = 210
    Top = 191
    object pplFluxoSegppField1: TppField
      FieldAlias = 'IDSEGMENTO'
      FieldName = 'IDSEGMENTO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 0
    end
    object pplFluxoSegppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVELMESTRE'
      FieldName = 'IDIMOVELMESTRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplFluxoSegppField3: TppField
      FieldAlias = 'ANOMES'
      FieldName = 'ANOMES'
      FieldLength = 6
      DisplayWidth = 6
      Position = 2
    end
    object pplFluxoSegppField4: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object pplFluxoSegppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'ATIVO'
      FieldName = 'ATIVO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplFluxoSegppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'COMPRAVENDA'
      FieldName = 'COMPRAVENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplFluxoSegppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'ABERTURA'
      FieldName = 'ABERTURA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplFluxoSegppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'FECHAMENTO'
      FieldName = 'FECHAMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplFluxoSegppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCOTA'
      FieldName = 'VLRCOTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplFluxoSegppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VARMESNOM'
      FieldName = 'VARMESNOM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplFluxoSegppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VARANONOM'
      FieldName = 'VARANONOM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplFluxoSegppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDMODULO'
      FieldName = 'IDMODULO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplFluxoSegppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORIGEM'
      FieldName = 'ORIGEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplFluxoSegppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'RECEITAMES'
      FieldName = 'RECEITAMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplFluxoSegppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESPESAMES'
      FieldName = 'DESPESAMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplFluxoSegppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'RECEITALIQUIDA'
      FieldName = 'RECEITALIQUIDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
  end
  object cdsCotacaoMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 57
    Top = 163
  end
  object sqlCotacaoMoeda: TCMSqlParams
    SQL.Strings = (
      ' SELECT   DISTINCT'
      '          I.IDPATRO,'
      '          P.IDPLANOPREV,'
      '          A.NOME AS NOMEPATRO,'
      '          P.NOME AS NOMEPLANO'
      ' FROM     PLANPREVCONTABIL P,'
      '          PESSOA A,'
      '          PLANOPATROXIMOVEL I'
      ' WHERE    P.IDPLANOPREV = I.IDPLANOPREV'
      '   AND    I.IDPATRO     = A.IDPESSOA'
      ' ORDER BY 3, 4'
      ' '
      ' ')
    ClientDataSet = cdsCotacaoMoeda
    Left = 57
    Top = 201
  end
end
