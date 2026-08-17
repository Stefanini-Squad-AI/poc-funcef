inherited FrmWzExecApuraOrc: TFrmWzExecApuraOrc
  Left = 92
  Top = 186
  HelpContext = 520072
  Caption = 'Apuração Orçamentária'
  ClientHeight = 414
  ClientWidth = 768
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 768
    Height = 375
    inherited PagControle: TPageControl
      Width = 766
      Height = 373
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 758
          Caption = 'Apuração orçamentária [ parâmetros ]'
        end
        object Panel1: TPanel
          Left = 0
          Top = 24
          Width = 758
          Height = 339
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label2: TLabel
            Left = 12
            Top = 26
            Width = 40
            Height = 13
            Caption = 'Origem'
          end
          object Bevel1: TBevel
            Left = 8
            Top = 40
            Width = 199
            Height = 49
          end
          object lblExercicio: TLabel
            Left = 16
            Top = 48
            Width = 55
            Height = 13
            Caption = 'Exercício'
          end
          object lblPeriodo: TLabel
            Left = 96
            Top = 48
            Width = 46
            Height = 13
            Caption = 'Período'
          end
          object Label4: TLabel
            Left = 294
            Top = 25
            Width = 44
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Destino'
          end
          object Bevel2: TBevel
            Left = 294
            Top = 40
            Width = 321
            Height = 49
            Anchors = [akTop, akRight]
          end
          object Label14: TLabel
            Left = 512
            Top = 46
            Width = 69
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Período Fim'
          end
          object Label13: TLabel
            Left = 392
            Top = 46
            Width = 64
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Período Ini'
          end
          object Label3: TLabel
            Left = 304
            Top = 46
            Width = 55
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Exercício'
          end
          object Label10: TLabel
            Left = 13
            Top = 144
            Width = 35
            Height = 13
            Caption = 'Inicial'
          end
          object Label11: TLabel
            Left = 76
            Top = 144
            Width = 42
            Height = 13
            Caption = 'Dígitos'
          end
          object Label12: TLabel
            Left = 139
            Top = 144
            Width = 55
            Height = 13
            Caption = 'Conteúdo'
          end
          object Label6: TLabel
            Left = 12
            Top = 123
            Width = 168
            Height = 13
            Caption = 'Calcular as Contas - Posição:'
          end
          object Label15: TLabel
            Left = 16
            Top = 212
            Width = 45
            Height = 13
            Caption = 'Fórmula'
          end
          object Bevel3: TBevel
            Left = 376
            Top = 159
            Width = 238
            Height = 90
            Anchors = [akTop, akRight]
          end
          object dblkExercicio: TwwDBLookupCombo
            Left = 16
            Top = 62
            Width = 65
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'EXERCICIO'#9'10'#9'EXERCICIO')
            LookupTable = cdsExercicios
            LookupField = 'EXERCICIO'
            Style = csDropDownList
            DropDownWidth = 8
            ParentFont = False
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
            OnChange = dblkExercicioChange
          end
          object dblkPeriodo: TwwDBLookupCombo
            Left = 96
            Top = 62
            Width = 105
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MES'#9'9'#9'MES'#9'F')
            LookupTable = cdsPeriodo
            LookupField = 'PERIODO'
            Style = csDropDownList
            DropDownWidth = 8
            ParentFont = False
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object spExercicioDest: TwwDBSpinEdit
            Left = 304
            Top = 62
            Width = 68
            Height = 21
            Anchors = [akTop, akRight]
            Increment = 1
            TabOrder = 2
            UnboundDataType = wwDefault
          end
          object dbComboPeriodoIni: TwwDBComboBox
            Left = 392
            Top = 62
            Width = 97
            Height = 21
            Anchors = [akTop, akRight]
            ShowButton = True
            Style = csDropDown
            MapList = False
            AllowClearKey = False
            ShowMatchText = True
            DropDownCount = 8
            ItemHeight = 0
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
            ItemIndex = 0
            Sorted = False
            TabOrder = 3
            UnboundDataType = wwDefault
          end
          object dbComboPeriodoFim: TwwDBComboBox
            Left = 512
            Top = 62
            Width = 97
            Height = 21
            Anchors = [akTop, akRight]
            ShowButton = True
            Style = csDropDown
            MapList = False
            AllowClearKey = False
            ShowMatchText = True
            DropDownCount = 8
            ItemHeight = 0
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
            ItemIndex = 11
            Sorted = False
            TabOrder = 4
            UnboundDataType = wwDefault
          end
          object edConteudo1: TEdit
            Left = 136
            Top = 159
            Width = 188
            Height = 21
            TabOrder = 7
          end
          object sePosFim1: TwwDBSpinEdit
            Left = 73
            Top = 159
            Width = 49
            Height = 21
            Increment = 1
            TabOrder = 6
            UnboundDataType = wwDefault
          end
          object sePosIni1: TwwDBSpinEdit
            Left = 14
            Top = 159
            Width = 49
            Height = 21
            Increment = 1
            TabOrder = 5
            UnboundDataType = wwDefault
          end
          object ChkSimula: TCheckBox
            Left = 388
            Top = 151
            Width = 129
            Height = 17
            Anchors = [akTop, akRight]
            Caption = 'Apenas &Simulação'
            Checked = True
            State = cbChecked
            TabOrder = 8
            OnClick = ChkSimulaClick
          end
          object dblkformula: TwwDBLookupCombo
            Left = 16
            Top = 228
            Width = 313
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME'#9'F')
            LookupTable = cdsFormula
            LookupField = 'IDFORMORCADO'
            TabOrder = 11
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object chkExclui: TCheckBox
            Left = 399
            Top = 183
            Width = 189
            Height = 17
            Anchors = [akTop, akRight]
            Caption = 'E&xclui Orçamento no Destino'
            TabOrder = 9
            OnClick = chkExcluiClick
          end
          object chkCalc: TCheckBox
            Left = 399
            Top = 205
            Width = 171
            Height = 17
            Anchors = [akTop, akRight]
            Caption = 'Calcula Novo Orçamento'
            TabOrder = 10
            OnClick = chkCalcClick
          end
        end
      end
      inherited TabSheet1: TTabSheet
        Caption = 'TabSimulacao'
        inherited fcLabel1: TfcLabel
          Width = 758
          Caption = 'Apuração orçamentária [ resultado ]'
        end
        object Panel4: TPanel
          Left = 0
          Top = 24
          Width = 758
          Height = 339
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object dbgrdSaldo: TwwDBGrid
            Left = 1
            Top = 1
            Width = 756
            Height = 240
            Hint = 'Clique com obotão direito do mouse para imprimir.'
            TabStop = False
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alTop
            DataSource = dsSaldo
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
            ParentShowHint = False
            PopupMenu = PopupMenuPrint
            ReadOnly = True
            ShowHint = True
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = True
            OnTitleButtonClick = dbgrdSaldoTitleButtonClick
            OnDrawDataCell = dbgrdSaldoDrawDataCell
            IndicatorColor = icBlack
            OnUpdateFooter = dbgrdSaldoUpdateFooter
          end
          object Panel2: TPanel
            Left = 1
            Top = 241
            Width = 756
            Height = 23
            Align = alTop
            BevelOuter = bvLowered
            TabOrder = 1
            object Label1: TLabel
              Left = 5
              Top = 6
              Width = 129
              Height = 13
              Caption = 'Log do processamento'
            end
          end
          object meErros: TwwDBRichEdit
            Left = 1
            Top = 264
            Width = 756
            Height = 74
            ScrollBars = ssBoth
            Align = alClient
            AutoURLDetect = False
            PopupMenu = PopupMenu1
            PrintJobName = 'Log de Operações'
            TabOrder = 2
            WordWrap = False
            PopupOptions = []
            EditorOptions = []
            EditorCaption = 'Edit Rich Text'
            EditorPosition.Left = 0
            EditorPosition.Top = 0
            EditorPosition.Width = 0
            EditorPosition.Height = 0
            MeasurementUnits = muInches
            PrintMargins.Top = 1
            PrintMargins.Bottom = 1
            PrintMargins.Left = 1
            PrintMargins.Right = 1
            RichEditVersion = 2
            Data = {
              750000007B5C727466315C616E73695C616E7369637067313235325C64656666
              305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
              4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
              5C706172645C625C66305C667331345C7061720D0A7D0D0A00}
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 375
    Width = 768
    inherited tb97Fundo: TToolbar97
      Left = 328
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520072
      end
      inherited btnConfirmar: TfcShapeBtn
        OnClick = btnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 411
    Top = 11
    TargetsData = (
      1
      3
      (
        'TRichEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  object cdsOutput: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 504
    Top = 312
  end
  object cdsExercicios: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 160
  end
  object cdsFormula: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 393
    Top = 309
  end
  object cdsSaldo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 632
    Top = 208
    object cdsSaldoNOMEFORMULA: TStringField
      DisplayLabel = 'Fórmula'
      DisplayWidth = 21
      FieldName = 'NOMEFORMULA'
      FixedChar = True
      Size = 30
    end
    object cdsSaldoIDCONTAORCAMEN: TStringField
      DisplayLabel = 'Código da Conta'
      DisplayWidth = 15
      FieldName = 'IDCONTAORCAMEN'
      Size = 30
    end
    object cdsSaldoNOMECONTAORCAMEN: TStringField
      DisplayLabel = 'Nome da~Conta'
      DisplayWidth = 30
      FieldName = 'NOMECONTAORCAMEN'
      FixedChar = True
      Size = 34
    end
    object cdsSaldoEXERCICIO: TFloatField
      DisplayLabel = 'Exercício'
      DisplayWidth = 7
      FieldName = 'EXERCICIO'
    end
    object cdsSaldoPERIODO: TFloatField
      DisplayLabel = 'Período'
      DisplayWidth = 6
      FieldName = 'PERIODO'
    end
    object cdsSaldoVALORBASE: TFloatField
      DisplayLabel = 'Valor~Base'
      DisplayWidth = 20
      FieldName = 'VALORBASE'
      DisplayFormat = '#,##0.00;(#,##0.00)'
    end
    object cdsSaldoCOTACAO: TFloatField
      DisplayLabel = 'Cotação~%'
      DisplayWidth = 10
      FieldName = 'COTACAO'
    end
    object cdsSaldoFATORAPLICADO: TFloatField
      DisplayLabel = 'Fator~Aplicado'
      DisplayWidth = 10
      FieldName = 'FATORAPLICADO'
    end
    object cdsSaldoVLRORCADO: TFloatField
      DisplayLabel = 'Valor~Orçado'
      DisplayWidth = 20
      FieldName = 'VLRORCADO'
      DisplayFormat = '#,##0.00;(#,##0.00)'
    end
    object cdsSaldoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object cdsSaldoIDPLANOORCAMEN: TFloatField
      FieldName = 'IDPLANOORCAMEN'
      Visible = False
    end
    object cdsSaldoDATAREFERENCIA: TDateTimeField
      FieldName = 'DATAREFERENCIA'
      Visible = False
    end
    object cdsSaldoVLRREALIZADO: TFloatField
      FieldName = 'VLRREALIZADO'
      Visible = False
    end
    object cdsSaldoVLRRESERVADO: TFloatField
      FieldName = 'VLRRESERVADO'
      Visible = False
    end
    object cdsSaldoVLRCOMPROMETIDO: TFloatField
      FieldName = 'VLRCOMPROMETIDO'
      Visible = False
    end
    object cdsSaldoVLRORCACUM: TFloatField
      FieldName = 'VLRORCACUM'
      Visible = False
    end
    object cdsSaldoVLRREALACUM: TFloatField
      FieldName = 'VLRREALACUM'
      Visible = False
    end
    object cdsSaldoFLGSIMULAATIVO: TStringField
      FieldName = 'FLGSIMULAATIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsSaldoIDCRITERIORATORC: TFloatField
      FieldName = 'IDCRITERIORATORC'
      Visible = False
    end
    object cdsSaldoPERCUTILRATEIO2: TFloatField
      FieldName = 'PERCUTILRATEIO'
      Visible = False
    end
    object cdsSaldoVLRRATEIOORI2: TFloatField
      FieldName = 'VLRRATEIOORI'
      Visible = False
    end
    object cdsSaldoVLRORCADO_12: TFloatField
      FieldName = 'VLRORCADO_1'
      Visible = False
    end
  end
  object cdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 112
  end
  object SqlExercicios: TCMSqlParams
    SQL.Strings = (
      'select '
      '  distinct exercicio '
      'from saldoorcado '
      'order by exercicio desc')
    ClientDataSet = cdsExercicios
    Left = 672
    Top = 160
  end
  object sqlSaldo: TCMSqlParams
    SQL.Strings = (
      
        'SELECT S.*, 0 AS VALORBASE, '#39'___________________________________' +
        '_______________'#39' AS NOMECONTAORCAMEN, 0 AS FATORAPLICADO, VLRORC' +
        'ADO, 0 AS COTACAO, '#39'______________________________'#39' AS NOMEFORMU' +
        'LA'
      'FROM SALDOORCADO S'
      'WHERE (S.IDCONTAORCAMEN = -1) AND (S.IDPLANOORCAMEN = -1) AND'
      '      (S.IDPESSOA = -1) AND (S.EXERCICIO = -1)'
      'ORDER BY S.EXERCICIO, S.PERIODO')
    ClientDataSet = cdsSaldo
    Left = 696
    Top = 208
  end
  object dsSaldo: TwwDataSource
    AutoEdit = False
    DataSet = cdsSaldo
    Left = 664
    Top = 208
  end
  object sqlPeriodo: TCMSqlParams
    SQL.Strings = (
      'select distinct periodo,'
      
        '       decode(periodo, 1, '#39'Janeiro'#39', 2, '#39'Fevereiro'#39', 3, '#39'Março'#39',' +
        ' '
      
        '                       4, '#39'Abril'#39', 5, '#39'Maio'#39', 6, '#39'Junho'#39', 7, '#39'Ju' +
        'lho'#39','
      
        '                       8, '#39'Agosto'#39', 9, '#39'Stembro'#39', 10, '#39'Outubro'#39',' +
        ' '
      '                       11, '#39'Novembro'#39', 12, '#39'Dezembro'#39') as mes'
      'from saldoorcado where exercicio = :exercicio'
      'order by periodo '
      '')
    ClientDataSet = cdsPeriodo
    Left = 672
    Top = 112
  end
  object sqlFormula: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  F.IDFORMORCADO, '
      '  NVL(F.NOME, '#39'SEM NOME'#39' ) AS NOME'
      'FROM FORMORCADO F'
      'ORDER BY F.NOME')
    ClientDataSet = cdsFormula
    Left = 425
    Top = 309
  end
  object PopupMenu1: TPopupMenu
    Left = 142
    Top = 323
    object Salvar1: TMenuItem
      Caption = '&Salvar'
      OnClick = Salvar1Click
    end
    object Imprimir1: TMenuItem
      Caption = '&Imprimir'
      OnClick = Imprimir1Click
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Arquivo Texto(*.txt)|*.txt'
    Left = 493
    Top = 10
  end
  object ppRApura: TppReport
    AutoStop = False
    DataPipeline = ppBDEApura
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = ppRApuraBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ShowCancelDialog = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 645
    Top = 23
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEApura'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25665
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Apuração orçamentária para o Exercício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 32808
        mmTop = 12436
        mmWidth = 81227
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'EXERCICIO'
        DataPipeline = ppBDEApura
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 5027
        mmLeft = 114829
        mmTop = 12436
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Código da conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 60061
        mmTop = 21167
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Período'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 177008
        mmTop = 21431
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Valor Base'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 196057
        mmTop = 21431
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Cotação %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 214842
        mmTop = 21431
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Fator Aplicado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 233628
        mmTop = 21431
        mmWidth = 24606
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Valor Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 261410
        mmTop = 21431
        mmWidth = 21960
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 16933
        mmLeft = 5556
        mmTop = 2117
        mmWidth = 21167
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5027
        mmLeft = 32808
        mmTop = 3175
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Fórmula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4763
        mmTop = 21431
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Exercício de Origem:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 155840
        mmTop = 4763
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Período de Origem: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 155840
        mmTop = 794
        mmWidth = 27252
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Exercício de Destino: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 217488
        mmTop = 794
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Período de Destino Inicial: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 217488
        mmTop = 4763
        mmWidth = 36513
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Período de Destino Final: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 217488
        mmTop = 8731
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Fórmula:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 155840
        mmTop = 8731
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Contas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 155840
        mmTop = 12436
        mmWidth = 10583
        BandType = 0
      end
      object lblperiodoOrigem: TppLabel
        UserName = 'lblperiodoOrigem'
        Caption = 'lblperOrigemIni'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 183886
        mmTop = 794
        mmWidth = 19315
        BandType = 0
      end
      object lblexercicioOrigem: TppLabel
        UserName = 'lblexercicioOrigem'
        Caption = 'lbl'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 184944
        mmTop = 4763
        mmWidth = 2910
        BandType = 0
      end
      object lblFormula: TppLabel
        UserName = 'lblFormula'
        Caption = 'lblFormula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 168540
        mmTop = 8731
        mmWidth = 13229
        BandType = 0
      end
      object lblContas: TppLabel
        UserName = 'lblContas'
        Caption = 'lblContas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 166952
        mmTop = 12436
        mmWidth = 11906
        BandType = 0
      end
      object lblExercioDestino: TppLabel
        UserName = 'lblExercicioDest'
        Caption = 'lblContas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 247650
        mmTop = 794
        mmWidth = 11906
        BandType = 0
      end
      object lblPeriodoDestinoIni: TppLabel
        UserName = 'lblPeriodoInicial'
        Caption = 'lblContas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 254794
        mmTop = 4763
        mmWidth = 11906
        BandType = 0
      end
      object lblPeriodoDestinoFim: TppLabel
        UserName = 'lblPeriodoFinal'
        Caption = 'lblContas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 253471
        mmTop = 8731
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 111654
        mmTop = 21431
        mmWidth = 10054
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape1: TppShape
        OnPrint = ppShape1Print
        UserName = 'Shape1'
        Brush.Color = 15658734
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 264
        mmWidth = 284163
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'IDCONTAORCAMEN'
        DataPipeline = ppBDEApura
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 3175
        mmLeft = 59531
        mmTop = 529
        mmWidth = 27252
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'EXERCICIO'
        DataPipeline = ppBDEApura
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 3175
        mmLeft = 182827
        mmTop = 529
        mmWidth = 8467
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'PERIODO'
        DataPipeline = ppBDEApura
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 3175
        mmLeft = 178594
        mmTop = 529
        mmWidth = 3175
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'VALORBASE'
        DataPipeline = ppBDEApura
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 3175
        mmLeft = 196586
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'COTACAO'
        DataPipeline = ppBDEApura
        DisplayFormat = '#,##0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 3175
        mmLeft = 218017
        mmTop = 529
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'FATORAPLICADO'
        DataPipeline = ppBDEApura
        DisplayFormat = '#,##0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 3175
        mmLeft = 234157
        mmTop = 529
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'VLRORCADO'
        DataPipeline = ppBDEApura
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 3175
        mmLeft = 264584
        mmTop = 529
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'NOMEFORMULA'
        DataPipeline = ppBDEApura
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsUnderline]
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 3175
        mmLeft = 3440
        mmTop = 529
        mmWidth = 55298
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 181505
        mmTop = 529
        mmWidth = 794
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'NOMECONTAORCAMEN'
        DataPipeline = ppBDEApura
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 3175
        mmLeft = 111390
        mmTop = 529
        mmWidth = 66146
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Página'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 136790
        mmTop = 529
        mmWidth = 9260
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 147373
        mmTop = 529
        mmWidth = 7938
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
        mmHeight = 3440
        mmLeft = 259557
        mmTop = 792
        mmWidth = 24871
        BandType = 8
      end
      object ppLabel309: TppLabel
        UserName = 'ppLabel206'
        AutoSize = False
        Caption = 'Planejamento e Orçamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 529
        mmWidth = 284957
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 529
        mmTop = 265
        mmWidth = 283898
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        AutoSize = True
        DataField = 'VALORBASE'
        DataPipeline = ppBDEApura
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 3440
        mmLeft = 186267
        mmTop = 265
        mmWidth = 28310
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'VLRORCADO'
        DataPipeline = ppBDEApura
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 3440
        mmLeft = 254001
        mmTop = 265
        mmWidth = 28840
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 1588
        mmTop = 0
        mmWidth = 282840
        BandType = 7
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Totais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 36248
        mmTop = 265
        mmWidth = 10319
        BandType = 7
      end
    end
  end
  object ppBDEApura: TppBDEPipeline
    DataSource = dsSaldo
    UserName = 'BDEApura'
    Left = 685
    Top = 23
    object ppBDEApurappField1: TppField
      FieldAlias = 'NOMEFORMULA'
      FieldName = 'NOMEFORMULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBDEApurappField2: TppField
      FieldAlias = 'IDCONTAORCAMEN'
      FieldName = 'IDCONTAORCAMEN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDEApurappField3: TppField
      FieldAlias = 'NOMECONTAORCAMEN'
      FieldName = 'NOMECONTAORCAMEN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBDEApurappField4: TppField
      FieldAlias = 'EXERCICIO'
      FieldName = 'EXERCICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBDEApurappField5: TppField
      FieldAlias = 'PERIODO'
      FieldName = 'PERIODO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBDEApurappField6: TppField
      FieldAlias = 'VALORBASE'
      FieldName = 'VALORBASE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBDEApurappField7: TppField
      FieldAlias = 'COTACAO'
      FieldName = 'COTACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBDEApurappField8: TppField
      FieldAlias = 'FATORAPLICADO'
      FieldName = 'FATORAPLICADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBDEApurappField9: TppField
      FieldAlias = 'VLRORCADO'
      FieldName = 'VLRORCADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppBDEApurappField10: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppBDEApurappField11: TppField
      FieldAlias = 'IDPLANOORCAMEN'
      FieldName = 'IDPLANOORCAMEN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppBDEApurappField12: TppField
      FieldAlias = 'DATAREFERENCIA'
      FieldName = 'DATAREFERENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppBDEApurappField13: TppField
      FieldAlias = 'VLRREALIZADO'
      FieldName = 'VLRREALIZADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppBDEApurappField14: TppField
      FieldAlias = 'VLRRESERVADO'
      FieldName = 'VLRRESERVADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppBDEApurappField15: TppField
      FieldAlias = 'VLRCOMPROMETIDO'
      FieldName = 'VLRCOMPROMETIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppBDEApurappField16: TppField
      FieldAlias = 'VLRORCACUM'
      FieldName = 'VLRORCACUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppBDEApurappField17: TppField
      FieldAlias = 'VLRREALACUM'
      FieldName = 'VLRREALACUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppBDEApurappField18: TppField
      FieldAlias = 'FLGSIMULAATIVO'
      FieldName = 'FLGSIMULAATIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppBDEApurappField19: TppField
      FieldAlias = 'IDCRITERIORATORC'
      FieldName = 'IDCRITERIORATORC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppBDEApurappField20: TppField
      FieldAlias = 'PERCUTILRATEIO'
      FieldName = 'PERCUTILRATEIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppBDEApurappField21: TppField
      FieldAlias = 'VLRRATEIOORI'
      FieldName = 'VLRRATEIOORI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppBDEApurappField22: TppField
      FieldAlias = 'VLRORCADO_1'
      FieldName = 'VLRORCADO_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
  end
  object PopupMenuPrint: TPopupMenu
    Left = 173
    Top = 323
    object Ordenao1: TMenuItem
      Caption = '&Ordenação'
      object popchkContaPeriodo: TMenuItem
        Caption = 'C&onta e Período'
        OnClick = popchkContaPeriodoClick
      end
      object popchkConta: TMenuItem
        Caption = '&Conta'
        OnClick = popchkContaClick
      end
      object popchkPeriodo: TMenuItem
        Caption = '&Período'
        OnClick = popchkPeriodoClick
      end
      object popchkGrid: TMenuItem
        Caption = 'Do &Grid'
        Checked = True
        Default = True
        Enabled = False
        OnClick = popchkGridClick
      end
    end
    object MenuItem2: TMenuItem
      Caption = '&Imprimir'
      OnClick = MenuItem2Click
    end
  end
  object sqlFundacao: TCMSqlParams
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P,  FUNDACAO F,  ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE '
      '     ( P.IDPESSOA =  F.IDPESSOA) AND'
      '     ( P.IDPESSOA =  E.IDPESSOA) AND'
      '     (E.IDCIDADES   = C.IDCIDADES)  AND'
      '     ( P.IDIMAGEM = I.IDIMAGEM)'
      ' ')
    ClientDataSet = cdsFundacao
    Left = 709
    Top = 311
  end
  object cdsFundacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 645
    Top = 311
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 613
    Top = 311
  end
  object dsFundacao: TwwDataSource
    DataSet = cdsFundacao
    Left = 677
    Top = 311
  end
end
