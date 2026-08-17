inherited cfgRelMapaTIR: TcfgRelMapaTIR
  Left = 167
  Top = 102
  HelpContext = 540084
  Caption = 'Mapa Gerencial de Rentabilidade TIR'
  ClientHeight = 446
  ClientWidth = 575
  FormStyle = fsMDIChild
  Visible = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 575
    Height = 372
    object Label2: TLabel
      Left = 9
      Top = 71
      Width = 199
      Height = 13
      Caption = 'Apropriar receitas/despesas no dia'
    end
    object grpReferencia: TGroupBox
      Left = 7
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
        OnChange = cboMesChange
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
        OnChange = DBspnAnoChange
      end
    end
    object grpPlano: TGroupBox
      Left = 7
      Top = 114
      Width = 559
      Height = 222
      Caption = 'Patrocinadoras / Planos considerados para rentabilidade'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 6
      object dbctrlgrd: TDBCtrlGrid
        Left = 2
        Top = 41
        Width = 555
        Height = 179
        Align = alClient
        AllowDelete = False
        AllowInsert = False
        ColCount = 1
        Color = clBtnFace
        DataSource = dtsPatrosPlanos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        PanelBorder = gbNone
        PanelHeight = 89
        PanelWidth = 539
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        RowCount = 2
        object bvlLine: TBevel
          Left = 0
          Top = 82
          Width = 539
          Height = 7
          Align = alBottom
          Shape = bsBottomLine
        end
        object dbtxtNomePatro: TDBText
          Left = 120
          Top = 6
          Width = 97
          Height = 17
          DataField = 'NOMEPATRO'
          DataSource = dtsPatrosPlanos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LlblPatro: TLabel
          Left = 30
          Top = 6
          Width = 84
          Height = 13
          Caption = 'Patrocinadora:'
        end
        object lblPlano: TLabel
          Left = 234
          Top = 6
          Width = 37
          Height = 13
          Caption = 'Plano:'
        end
        object dbtxtNomePlano: TDBText
          Left = 276
          Top = 6
          Width = 252
          Height = 17
          DataField = 'NOMEPLANO'
          DataSource = dtsPatrosPlanos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbcbFlgUsa: TDBCheckBox
          Left = 8
          Top = 5
          Width = 17
          Height = 17
          DataField = 'FLGUSA'
          DataSource = dtsPatrosPlanos
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object grpIndiceAtuarial: TGroupBox
          Left = 216
          Top = 23
          Width = 313
          Height = 46
          Caption = 'Índice Atuarial Projetado'
          TabOrder = 2
          object Image2: TImage
            Left = 176
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
            Left = 266
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
          object dbedtPerAtuarialSoma: TDBEdit
            Left = 198
            Top = 17
            Width = 59
            Height = 21
            DataField = 'PERCATUARIAL'
            DataSource = dtsPatrosPlanos
            TabOrder = 1
          end
          object dblkpIndiceAtuarial: TwwDBLookupCombo
            Left = 11
            Top = 17
            Width = 158
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOESIGLA'#9'6'#9'Moeda'#9'F')
            DataField = 'INDICEATUARIAL'
            DataSource = dtsPatrosPlanos
            LookupTable = cdsIndice
            LookupField = 'MOECODIGO'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
        end
        object grpIndiceCorrecao: TGroupBox
          Left = 26
          Top = 23
          Width = 175
          Height = 46
          Caption = 'Índice de Correção'
          TabOrder = 1
          object dblkpIndiceCorrecao: TwwDBLookupCombo
            Left = 10
            Top = 17
            Width = 159
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOESIGLA'#9'6'#9'Moeda'#9'F')
            DataField = 'INDICECORRECAO'
            DataSource = dtsPatrosPlanos
            LookupTable = cdsIndice
            LookupField = 'MOECODIGO'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
        end
      end
      object Panel2: TPanel
        Left = 2
        Top = 15
        Width = 555
        Height = 26
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Bevel1: TBevel
          Left = 0
          Top = 20
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
    end
    object cbExibirResumo: TCheckBox
      Left = 410
      Top = 67
      Width = 137
      Height = 17
      Caption = 'Exibir Resumo'
      TabOrder = 4
    end
    object cbExibirTIRAtuarial: TCheckBox
      Left = 410
      Top = 91
      Width = 129
      Height = 17
      Caption = 'Exibir TIR Atuarial'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object cbAlienacaoRenda: TCheckBox
      Left = 7
      Top = 91
      Width = 241
      Height = 17
      Caption = 'Considerar alienação como Renda'
      TabOrder = 3
    end
    object edtDia: TEdit
      Left = 214
      Top = 68
      Width = 35
      Height = 21
      TabOrder = 2
      Text = '05'
      OnExit = edtDiaExit
      OnKeyPress = edtDiaKeyPress
    end
    object grpTipoSegmento: TGroupBox
      Left = 410
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
    object chkCorLinha: TCheckBox
      Left = 9
      Top = 345
      Width = 233
      Height = 17
      Caption = 'Imprimir linhas com cores alternadas: '
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object cboCorLinha: TfcColorCombo
      Left = 245
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
      TabOrder = 8
    end
  end
  inherited Dock971: TDock97
    Top = 413
    Width = 575
    inherited tb97Fundo: TToolbar97
      Left = 403
      DockPos = 458
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 231
      DockPos = 286
      inherited bbtnConfirmar: TBitBtn
        Default = False
        ModalResult = 0
      end
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 372
    Width = 575
    Height = 41
    Align = alBottom
    TabOrder = 2
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
      Width = 554
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 0
      Visible = False
    end
  end
  object cdsPatrosPlanos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 72
    object cdsPatrosPlanosIDPATRO: TFloatField
      DisplayLabel = 'Id. Patro'
      FieldName = 'IDPATRO'
    end
    object cdsPatrosPlanosIDPLANOPREV: TFloatField
      DisplayLabel = 'Id. Plano'
      FieldName = 'IDPLANOPREV'
    end
    object cdsPatrosPlanosNOMEPATRO: TStringField
      DisplayLabel = 'Nome da Patrocinadora'
      FieldName = 'NOMEPATRO'
      Size = 60
    end
    object cdsPatrosPlanosNOMEPLANO: TStringField
      DisplayLabel = 'Nome do Plano'
      FieldName = 'NOMEPLANO'
      Size = 60
    end
    object cdsPatrosPlanosFLGUSA: TFloatField
      DisplayLabel = 'Utiliza'
      FieldName = 'FLGUSA'
    end
    object cdsPatrosPlanosINDICECORRECAO: TFloatField
      DisplayLabel = 'Índice de correção'
      FieldName = 'INDICECORRECAO'
    end
    object cdsPatrosPlanosINDICEATUARIAL: TFloatField
      DisplayLabel = 'Índice Atuarial'
      FieldName = 'INDICEATUARIAL'
    end
    object cdsPatrosPlanosPERCATUARIAL: TFloatField
      DisplayLabel = 'Percentual Atuarial'
      FieldName = 'PERCATUARIAL'
      DisplayFormat = '##0.0#'
      EditFormat = '000.00'
    end
  end
  object dtsPatrosPlanos: TDataSource
    DataSet = cdsPatrosPlanos
    Left = 352
    Top = 72
  end
  object dtsIndice: TwwDataSource
    DataSet = cdsIndice
    Left = 165
    Top = 139
  end
  object cdsIndice: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 113
    Top = 139
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
  object cdsReceitaLiquida: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'IDSEGMENTO;IDIMOVELMESTRE;ORIGEM;ANOMES;IDPATRO;IDPLANOPREV'
    Params = <>
    Left = 64
    Top = 252
  end
  object cdsAlienacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 240
  end
  object cdsUltReavaliacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 296
    object cdsUltReavaliacaoIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object cdsUltReavaliacaoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object cdsUltReavaliacaoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object cdsUltReavaliacaoIDSEGMENTO: TStringField
      FieldName = 'IDSEGMENTO'
    end
    object cdsUltReavaliacaoORIGEM: TFloatField
      FieldName = 'ORIGEM'
    end
    object cdsUltReavaliacaoULTREAVALIA: TFloatField
      FieldName = 'ULTREAVALIA'
    end
  end
  object cdsSaldoAlienPlanoPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 61
    Top = 295
  end
  object cdsReceitaLiquidaAlienacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 178
    Top = 246
  end
  object cdsUltReavaliacaoMesAnt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 296
    object cdsUltReavaliacaoMesAntIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object cdsUltReavaliacaoMesAntIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object cdsUltReavaliacaoMesAntIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object cdsUltReavaliacaoMesAntIDSEGMENTO: TStringField
      FieldName = 'IDSEGMENTO'
    end
    object cdsUltReavaliacaoMesAntORIGEM: TFloatField
      FieldName = 'ORIGEM'
    end
    object cdsUltReavaliacaoMesAntULTREAVALIA: TFloatField
      FieldName = 'ULTREAVALIA'
    end
  end
  object cdsUltReavaliacaoAnoAnt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 280
    object cdsUltReavaliacaoAnoAntIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object cdsUltReavaliacaoAnoAntIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object cdsUltReavaliacaoAnoAntIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object cdsUltReavaliacaoAnoAntIDSEGMENTO: TStringField
      FieldName = 'IDSEGMENTO'
    end
    object cdsUltReavaliacaoAnoAntORIGEM: TFloatField
      FieldName = 'ORIGEM'
    end
    object cdsUltReavaliacaoAnoAntULTREAVALIA: TFloatField
      FieldName = 'ULTREAVALIA'
    end
  end
  object cdsFundoImob: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 471
    Top = 241
  end
  object cdsReceitaFundoImob: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 274
    Top = 246
  end
  object cdsSaldoFundoImob: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 410
    Top = 246
  end
end
