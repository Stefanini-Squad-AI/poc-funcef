inherited frmExecApuracaoOrc: TfrmExecApuracaoOrc
  Left = 120
  Top = 134
  HelpContext = 120028
  Caption = 'Apuração Orçamentária'
  ClientHeight = 312
  ClientWidth = 593
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 593
    Height = 273
    inherited PagControle: TPageControl
      Width = 591
      Height = 271
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 583
          Caption = 'Apuração Orçamentária [ Parâmetros ]'
        end
        object Label2: TLabel
          Left = 24
          Top = 90
          Width = 45
          Height = 13
          Caption = 'Fórmula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inline molContrato: TmolContrato
          Left = 16
          Top = 40
          Width = 553
          inherited edtContrato: TEdit
            Width = 481
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 488
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 512
          end
        end
        object dbcboFormula: TwwDBLookupCombo
          Left = 24
          Top = 104
          Width = 481
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Nome'#9'F')
          LookupTable = cdsFormulas
          LookupField = 'IDFORMORCADO'
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object GroupBox1: TGroupBox
          Left = 24
          Top = 144
          Width = 377
          Height = 73
          Caption = ' Período de Apuração '
          TabOrder = 2
          object Label13: TLabel
            Left = 8
            Top = 22
            Width = 24
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Mês'
          end
          object Label14: TLabel
            Left = 202
            Top = 22
            Width = 24
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Mês'
          end
          object Label3: TLabel
            Left = 106
            Top = 22
            Width = 23
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Ano'
          end
          object Label1: TLabel
            Left = 225
            Top = 41
            Width = 19
            Height = 13
            Caption = 'até'
          end
          object Label4: TLabel
            Left = 300
            Top = 22
            Width = 23
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Ano'
          end
          object dbComboPeriodoIni: TwwDBComboBox
            Left = 8
            Top = 38
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
            TabOrder = 0
            UnboundDataType = wwDefault
          end
          object dbComboPeriodoFim: TwwDBComboBox
            Left = 202
            Top = 38
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
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object spExercicioIni: TwwDBSpinEdit
            Left = 106
            Top = 38
            Width = 68
            Height = 21
            Anchors = [akTop, akRight]
            Increment = 1
            TabOrder = 2
            UnboundDataType = wwDefault
          end
          object spExercicioFim: TwwDBSpinEdit
            Left = 300
            Top = 38
            Width = 68
            Height = 21
            Anchors = [akTop, akRight]
            Increment = 1
            TabOrder = 3
            UnboundDataType = wwDefault
          end
        end
        object GroupBox2: TGroupBox
          Left = 405
          Top = 144
          Width = 124
          Height = 73
          Caption = ' Apuração para '
          TabOrder = 3
          object Label5: TLabel
            Left = 26
            Top = 22
            Width = 55
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Exercício'
          end
          object spnAnoApura: TwwDBSpinEdit
            Left = 24
            Top = 38
            Width = 68
            Height = 21
            Anchors = [akTop, akRight]
            Increment = 1
            TabOrder = 0
            UnboundDataType = wwDefault
          end
        end
        object chkExclui: TCheckBox
          Left = 26
          Top = 231
          Width = 189
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'E&xclui Apuração já calculada'
          TabOrder = 4
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 499
          Caption = 'Apuração Orçamentária [ Contratos a Processar ]'
        end
        object dbgContratos: TwwDBGrid
          Left = 0
          Top = 32
          Width = 580
          Height = 225
          ControlType.Strings = (
            'FLGPROCESSA;CheckBox;1;0')
          Selected.Strings = (
            'FLGPROCESSA'#9'3'#9' '
            'NOMECONTRATO'#9'73'#9'Contrato')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          DataSource = dsContratos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnDblClick = dbgContratosDblClick
          IndicatorColor = icBlack
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 2
        TabVisible = False
        object fcLabel2: TfcLabel
          Left = 0
          Top = 0
          Width = 374
          Height = 24
          Align = alTop
          Caption = 'Apuração Orçamentária [ Resultado ]'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
        end
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 34
          Width = 581
          Height = 221
          Selected.Strings = (
            'CODCONTRATOEMPR'#9'15'#9'Código'#9'F'
            'NOMECONTRATO'#9'30'#9'Contrato'#9'F'
            'NOME_ITEM'#9'30'#9'Item'#9'F'
            'MES'#9'3'#9'Mês'#9'F'
            'QTDE'#9'10'#9'Qtde.'#9'F'
            'VALOR'#9'10'#9'Valor'#9'F'
            'FORMA'#9'30'#9'Forma de cálculo'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsOrcamento
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          PopupMenu = PopupMenuPrint
          TabOrder = 0
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
      end
    end
  end
  inherited Dock971: TDock97
    Top = 273
    Width = 593
    inherited tb97Fundo: TToolbar97
      Left = 153
      inherited btnConfirmar: TfcShapeBtn
        OnClick = btnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 27
    Top = 283
  end
  object cdsContratos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 149
    Top = 263
  end
  object cdsOrcamento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsOrcamentoCalcFields
    Left = 541
    Top = 175
    object cdsOrcamentoCODCONTRATOEMPR: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 15
      FieldName = 'CODCONTRATOEMPR'
    end
    object cdsOrcamentoNOMECONTRATO: TStringField
      DisplayLabel = 'Contrato'
      DisplayWidth = 30
      FieldName = 'NOMECONTRATO'
      Size = 60
    end
    object cdsOrcamentoNOME_ITEM: TStringField
      DisplayLabel = 'Item'
      DisplayWidth = 30
      FieldName = 'NOME_ITEM'
      Size = 200
    end
    object cdsOrcamentoMES: TFloatField
      DisplayLabel = 'Mês'
      DisplayWidth = 3
      FieldName = 'MES'
    end
    object cdsOrcamentoQTDE: TFloatField
      DisplayLabel = 'Qtde.'
      DisplayWidth = 10
      FieldName = 'QTDE'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsOrcamentoVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALOR'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsOrcamentoFORMA: TStringField
      DisplayLabel = 'Forma de cálculo'
      DisplayWidth = 30
      FieldName = 'FORMA'
      FixedChar = True
      Size = 30
    end
    object cdsOrcamentoIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
      Visible = False
    end
    object cdsOrcamentoIDOBJETO: TFloatField
      FieldName = 'IDOBJETO'
      Visible = False
    end
    object cdsOrcamentoIDITEM: TFloatField
      FieldName = 'IDITEM'
      Visible = False
    end
    object cdsOrcamentoANO: TFloatField
      FieldName = 'ANO'
      Visible = False
    end
    object cdsOrcamentoTOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOTAL'
      Visible = False
      Calculated = True
    end
  end
  object dsContratos: TDataSource
    DataSet = cdsContratos
    Left = 213
    Top = 263
  end
  object sqlContratos: TCMSqlParams
    SQL.Strings = (
      '   SELECT distinct'
      '       0 as flgprocessa,'
      '       CON.IDCONTRATO,'
      '       CON.NOMECONTRATO'
      '   FROM'
      '       CONTRATOCONTR CON,'
      '       RATEIOCENTROCUSTO RCC,'
      '       OBJETOSXITEMCONTR OIC'
      '   WHERE'
      '       RCC.IDCONTRATO     = CON.IDCONTRATO'
      '   AND OIC.IDCONTRATO     = CON.IDCONTRATO'
      '   AND CON.FLGFIMCONTRATO <> '#39'E'#39
      '   AND OIC.IDFORMORCADO   IS NOT NULL'
      '   AND RCC.IDCONTAORCAMEN IS NOT NULL')
    ClientDataSet = cdsContratos
    Left = 77
    Top = 263
  end
  object cdsFormulas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 317
    Top = 263
  end
  object dsFormulas: TDataSource
    DataSet = cdsFormulas
    Left = 381
    Top = 263
  end
  object sqlFormulas: TCMSqlParams
    SQL.Strings = (
      '      SELECT IDFORMORCADO,'
      '             NOME,'
      '             DESCRICAO,'
      '             BASEARREDONDAMENTO,'
      '             BASECALCULO'
      '        FROM FORMORCADO'
      '        ORDER BY NOME'
      '')
    ClientDataSet = cdsFormulas
    Left = 429
    Top = 239
  end
  object dsOrcamento: TDataSource
    DataSet = cdsOrcamento
    Left = 541
    Top = 223
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'select'
      '   c.codcontratoempr,'
      '   c.nomecontrato,'
      '   i.nome_item,'
      '   co.idcontrato,'
      '   co.idobjeto,'
      '   co.iditem,'
      '   co.ano,'
      '   co.mes,'
      '   co.qtde,'
      '   co.valor,'
      '   (co.qtde*co.valor) AS TOTAL,'
      '   '#39'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'#39' as forma'
      'from'
      '   CONTRATOXORCAMEN CO,'
      '   contratocontr c,'
      '   itemcontratual i'
      'where'
      '    co.idcontrato = c.idcontrato'
      'and i.iditem = co.iditem   '
      ' ')
    ClientDataSet = cdsOrcamento
    Left = 533
    Top = 119
  end
  object PopupMenuPrint: TPopupMenu
    Left = 261
    Top = 107
    object MenuItem2: TMenuItem
      Caption = '&Imprimir'
      OnClick = MenuItem2Click
    end
  end
  object ppRApura: TppReport
    AutoStop = False
    DataPipeline = ppBDEApura
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ShowCancelDialog = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 333
    Top = 71
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEApura'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35190
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Apuração Orçamentária para o Exercício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 43656
        mmTop = 13758
        mmWidth = 82021
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'ANO'
        DataPipeline = ppBDEApura
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 5027
        mmLeft = 127529
        mmTop = 13758
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Período Inicial:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1323
        mmTop = 25665
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Período Final: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1852
        mmTop = 30163
        mmWidth = 19844
        BandType = 0
      end
      object lblPeriodoIni: TppLabel
        UserName = 'lblPeriodoInicial'
        Caption = 'lblContas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 22754
        mmTop = 25665
        mmWidth = 11906
        BandType = 0
      end
      object lblPeriodoFinal: TppLabel
        UserName = 'lblPeriodoFinal'
        Caption = 'lblContas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 22754
        mmTop = 30427
        mmWidth = 11906
        BandType = 0
      end
      object pplFundacao: TppLabel
        UserName = 'lFundacao'
        Caption = 'lFundacao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 88106
        mmTop = 3704
        mmWidth = 21167
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = 15658734
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'QTDE'
        DataPipeline = ppBDEApura
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 3440
        mmLeft = 39952
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'VALOR'
        DataPipeline = ppBDEApura
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 3440
        mmLeft = 63236
        mmTop = 529
        mmWidth = 26723
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'MES'
        DataPipeline = ppBDEApura
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 3440
        mmLeft = 15875
        mmTop = 529
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'TOTAL'
        DataPipeline = ppBDEApura
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 3440
        mmLeft = 103452
        mmTop = 529
        mmWidth = 26723
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'FORMA'
        DataPipeline = ppBDEApura
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBDEApura'
        mmHeight = 3440
        mmLeft = 134673
        mmTop = 529
        mmWidth = 61913
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4763
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
        mmLeft = 83608
        mmTop = 265
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
        mmLeft = 94192
        mmTop = 265
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
        mmLeft = 172509
        mmTop = 265
        mmWidth = 24871
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 3969
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel309: TppLabel
        UserName = 'ppLabel206'
        AutoSize = False
        Caption = 'Contratos e Projetos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'IDCONTRATO'
      DataPipeline = ppBDEApura
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEApura'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Contrato:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 5292
          mmTop = 529
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'CODCONTRATOEMPR'
          DataPipeline = ppBDEApura
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDEApura'
          mmHeight = 3440
          mmLeft = 19844
          mmTop = 529
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'NOMECONTRATO'
          DataPipeline = ppBDEApura
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDEApura'
          mmHeight = 3440
          mmLeft = 45773
          mmTop = 529
          mmWidth = 136525
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Total do Contrato:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 11113
          mmTop = 529
          mmWidth = 24606
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          AutoSize = True
          DataField = 'QTDE'
          DataPipeline = ppBDEApura
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEApura'
          mmHeight = 3440
          mmLeft = 38629
          mmTop = 529
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = ppBDEApura
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEApura'
          mmHeight = 3440
          mmLeft = 69586
          mmTop = 529
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          AutoSize = True
          DataField = 'TOTAL'
          DataPipeline = ppBDEApura
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEApura'
          mmHeight = 3440
          mmLeft = 110331
          mmTop = 529
          mmWidth = 19844
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDITEM'
      DataPipeline = ppBDEApura
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEApura'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9525
        mmPrintPosition = 0
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Item:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 7938
          mmTop = 529
          mmWidth = 6879
          BandType = 3
          GroupNo = 1
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'NOME_ITEM'
          DataPipeline = ppBDEApura
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDEApura'
          mmHeight = 3440
          mmLeft = 20108
          mmTop = 529
          mmWidth = 160867
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 19315
          mmTop = 5821
          mmWidth = 5556
          BandType = 3
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 41540
          mmTop = 5821
          mmWidth = 15610
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 82815
          mmTop = 5821
          mmWidth = 7144
          BandType = 3
          GroupNo = 1
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 121709
          mmTop = 5821
          mmWidth = 6615
          BandType = 3
          GroupNo = 1
        end
        object ppLabel11: TppLabel
          UserName = 'Label101'
          Caption = 'Forma de Apuração'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 134673
          mmTop = 5821
          mmWidth = 27252
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          AutoSize = True
          DataField = 'QTDE'
          DataPipeline = ppBDEApura
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEApura'
          mmHeight = 3440
          mmLeft = 38629
          mmTop = 529
          mmWidth = 18521
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = ppBDEApura
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEApura'
          mmHeight = 3440
          mmLeft = 69586
          mmTop = 529
          mmWidth = 20373
          BandType = 5
          GroupNo = 1
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Total do Item:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 17198
          mmTop = 794
          mmWidth = 18521
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          AutoSize = True
          DataField = 'TOTAL'
          DataPipeline = ppBDEApura
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEApura'
          mmHeight = 3440
          mmLeft = 110331
          mmTop = 529
          mmWidth = 19844
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object ppBDEApura: TppBDEPipeline
    DataSource = dsOrcamento
    UserName = 'BDEApura'
    Left = 405
    Top = 71
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsOrcamento
    UserName = 'Fundacao'
    Left = 349
    Top = 127
  end
  object cdsContratoProcessa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 373
    Top = 215
  end
  object cdsItens: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 285
    Top = 215
  end
end
