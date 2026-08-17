inherited cfgRelTIRPorProjeto: TcfgRelTIRPorProjeto
  Left = 77
  Top = 89
  HelpContext = 540085
  BorderIcons = [biSystemMenu]
  Caption = 'TIR por Projeto'
  ClientHeight = 325
  ClientWidth = 667
  FormStyle = fsMDIChild
  Visible = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 667
    Height = 251
    object grpReferencia: TGroupBox
      Left = 8
      Top = 78
      Width = 213
      Height = 62
      Caption = 'Competência Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label4: TLabel
        Left = 9
        Top = 18
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
        Left = 140
        Top = 18
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
        Left = 9
        Top = 32
        Width = 123
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
        Left = 140
        Top = 32
        Width = 64
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
    object grpSegmento: TGroupBox
      Left = 12
      Top = 10
      Width = 209
      Height = 49
      Caption = 'Segmento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object dblkpSegmento: TwwDBLookupCombo
        Left = 9
        Top = 19
        Width = 192
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOIMOVEL'#9'60'#9'Segmento'#9'F')
        LookupTable = cdsSegmento
        LookupField = 'CODTIPIMOVEL'
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object grpIndicesTIR: TGroupBox
      Left = 231
      Top = 10
      Width = 210
      Height = 130
      Caption = 'Índices de correção da TIR (a.a.)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 3
      object Label1: TLabel
        Left = 13
        Top = 23
        Width = 42
        Height = 13
        Caption = 'Fluxo 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 13
        Top = 79
        Width = 42
        Height = 13
        Caption = 'Fluxo 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dblkpIndTIR1: TwwDBLookupCombo
        Left = 13
        Top = 39
        Width = 185
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOESIGLA'#9'6'#9'Moeda'#9'F')
        LookupTable = cdsIndice
        LookupField = 'MOECODIGO'
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object dblkpIndTIR2: TwwDBLookupCombo
        Left = 13
        Top = 95
        Width = 185
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOESIGLA'#9'6'#9'Moeda'#9'F')
        LookupTable = cdsIndice
        LookupField = 'MOECODIGO'
        ParentFont = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object grpPercentuais: TGroupBox
      Left = 451
      Top = 63
      Width = 205
      Height = 146
      Caption = 'Percentuais VPL (a.a.)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object Label6: TLabel
        Left = 9
        Top = 18
        Width = 42
        Height = 13
        Caption = 'Fluxo 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 153
        Top = 32
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
      object Label7: TLabel
        Left = 9
        Top = 59
        Width = 42
        Height = 13
        Caption = 'Fluxo 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 153
        Top = 74
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
      object Label10: TLabel
        Left = 9
        Top = 101
        Width = 42
        Height = 13
        Caption = 'Fluxo 3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 153
        Top = 115
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
      object edtPerVPL1: TDBEdit
        Left = 10
        Top = 32
        Width = 138
        Height = 21
        DataField = 'PerVPL1'
        DataSource = dtsPercentuaisVPL
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object edtPerVPL3: TDBEdit
        Left = 10
        Top = 115
        Width = 138
        Height = 21
        DataField = 'PerVPL3'
        DataSource = dtsPercentuaisVPL
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object edtPerVPL2: TDBEdit
        Left = 10
        Top = 73
        Width = 138
        Height = 21
        DataField = 'PerVPL2'
        DataSource = dtsPercentuaisVPL
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object grpIndicePayPack: TGroupBox
      Left = 231
      Top = 160
      Width = 210
      Height = 49
      Caption = 'Índice de correção do Pay Back'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object dblkpIndicePayBack: TwwDBLookupCombo
        Left = 9
        Top = 18
        Width = 191
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOESIGLA'#9'6'#9'Moeda'#9'F')
        LookupTable = cdsIndice
        LookupField = 'MOECODIGO'
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object grpDia: TGroupBox
      Left = 12
      Top = 160
      Width = 209
      Height = 49
      Caption = 'Apropriar receitas no dia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object edtDia: TEdit
        Left = 14
        Top = 20
        Width = 35
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = '05'
        OnExit = edtDiaExit
        OnKeyPress = edtDiaKeyPress
      end
    end
    object GroupBox1: TGroupBox
      Left = 451
      Top = 10
      Width = 205
      Height = 48
      Caption = 'Índice de correção do VPL (a.a.)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object dblkpIndiceVPL: TwwDBLookupCombo
        Left = 9
        Top = 18
        Width = 187
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOESIGLA'#9'6'#9'Moeda'#9'F')
        LookupTable = cdsIndice
        LookupField = 'MOECODIGO'
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object chkCorLinha: TCheckBox
      Left = 9
      Top = 222
      Width = 233
      Height = 17
      Caption = 'Imprimir linhas com cores alternadas: '
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object cboCorLinha: TfcColorCombo
      Left = 245
      Top = 218
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
    Top = 292
    Width = 667
    inherited tb97Fundo: TToolbar97
      Left = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 251
    Width = 667
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
      Width = 648
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 0
      Visible = False
    end
  end
  object cdsIndice: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 6
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
    Left = 849
    Top = 190
  end
  object cdsPercentuaisVPL: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 62
    object cdsPercentuaisVPLPerVPL1: TFloatField
      FieldName = 'PerVPL1'
    end
    object cdsPercentuaisVPLPerVPL2: TFloatField
      FieldName = 'PerVPL2'
    end
    object cdsPercentuaisVPLPerVPL3: TFloatField
      FieldName = 'PerVPL3'
    end
  end
  object dtsPercentuaisVPL: TDataSource
    DataSet = cdsPercentuaisVPL
    Left = 848
    Top = 134
  end
  object cdsSegmento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 115
    Top = 8
    object cdsSegmentoCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object cdsSegmentoDESCTIPOIMOVEL: TStringField
      DisplayLabel = 'Segmento'
      DisplayWidth = 60
      FieldName = 'DESCTIPOIMOVEL'
      Size = 60
    end
  end
  object dtsSegmento: TDataSource
    DataSet = cdsSegmento
    Left = 848
    Top = 80
  end
  object cdsReceitaLiquida: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'IDSEGMENTO;IDIMOVELMESTRE;ORIGEM;ANOMES;IDPATRO;IDPLANOPREV'
    Params = <>
    Left = 167
    Top = 113
  end
  object cdsUltReavaliacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 56
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
  object PopupMenu1: TPopupMenu
    Left = 600
    Top = 216
    object pmuNrIndice: TMenuItem
      Caption = 'Gera nr. indice'
      OnClick = pmuNrIndiceClick
    end
  end
end
