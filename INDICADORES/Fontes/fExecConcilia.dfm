inherited frmExecConcilia: TfrmExecConcilia
  Left = 79
  Top = 135
  HelpContext = 4390006
  Caption = 'Conciliação de Indicadores'
  ClientHeight = 338
  ClientWidth = 634
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 634
    Height = 299
    inherited PagControle: TPageControl
      Width = 632
      Height = 297
      ActivePage = TabSheet1
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 624
          Caption = 'Conciliação de Indicadores [ Seleção ]'
        end
        inline molImovel1: TmolImovel
          Left = 40
          Top = 48
          Width = 521
          inherited edtImovel: TEdit
            Width = 457
          end
          inherited btnBuscaImovel: TBitBtn
            Left = 464
          end
          inherited btnLimpaImovel: TBitBtn
            Left = 488
          end
        end
        inline molContratoLoja1: TmolContratoLoja
          Left = 40
          Top = 104
          Width = 521
          TabOrder = 1
          inherited edtContrato: TEdit
            Width = 457
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 464
            OnClick = molContratoLoja1btnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 488
          end
        end
        object Panel2: TPanel
          Left = 48
          Top = 183
          Width = 289
          Height = 74
          TabOrder = 2
          object Label15: TLabel
            Left = 24
            Top = 18
            Width = 135
            Height = 13
            Caption = 'Competência (mês/ano)'
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 194
            Top = 36
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object cboMes: TComboBox
            Left = 24
            Top = 36
            Width = 161
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
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
        end
        object rgIndicador: TRadioGroup
          Left = 368
          Top = 178
          Width = 185
          Height = 78
          Caption = 'Indicador'
          ItemIndex = 0
          Items.Strings = (
            'ABL'
            'Aluguel Mínimo')
          TabOrder = 3
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 624
          Caption = 'Conciliação de Indicadores [ Divergências ]'
        end
        object dbgProrrogar: TwwDBGrid
          Left = 0
          Top = 24
          Width = 624
          Height = 217
          ControlType.Strings = (
            'CAL_ENCERRAR;CheckBox;1;0'
            'CHKBOX;CheckBox;1;0')
          Selected.Strings = (
            'NUMCONTRATO'#9'10'#9'Nr. Contrato'#9'T'
            'NOMCONTRATO'#9'45'#9'Nome do Contrato'#9'T'
            'VLRCAL'#9'12'#9'Valor Calculado'#9'T'
            'VLRIMP'#9'12'#9'Valor Importado'#9'T'
            'IMONOME'#9'60'#9'Imovel'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsConcilia
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object Panel1: TPanel
          Left = 0
          Top = 241
          Width = 624
          Height = 46
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          object btnImprime: TfcShapeBtn
            Left = 14
            Top = 7
            Width = 81
            Height = 33
            Hint = 'Imprime relatório de divergências'
            Caption = 'Imprimir'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
              0003377777777777777308888888888888807F33333333333337088888888888
              88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
              8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
              8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
              03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
              03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
              33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
              33333337FFFF7733333333300000033333333337777773333333}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            ParentShowHint = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            ShowHint = True
            TabOrder = 0
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnImprimeClick
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 299
    Width = 634
    inherited tb97Fundo: TToolbar97
      Left = 248
      inherited sep1: TToolbarSep97
        Left = 299
      end
      inherited CMSeparaWizard2: TToolbarSep97
        Left = 83
      end
      inherited CMSeparaWizard1: TToolbarSep97
        Left = 166
      end
      inherited bbtnSair: TBitBtn
        Left = 218
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 301
      end
      inherited btnContinuar: TfcShapeBtn
        Left = 85
        Caption = 'Confirmar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
      end
      inherited btnConfirmar: TfcShapeBtn
        Left = 191
        Width = 27
        Visible = False
      end
    end
  end
  object Query1: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IM.IMONOME,'
      '       CL.IDCONTRATO,'
      '       CL.NUMCONTRATO,'
      '       CL.NOMCONTRATO,'
      '       NVL(CAL.VLRAPURACAONUM,0) AS VLRCAL,'
      '       NVL(IMP.VLRAPURACAONUM,0) AS VLRIMP'
      '  FROM IMOVEL IM,'
      '       ('
      '        SELECT IDIMOVEL, IDCONTRATO, NUMCONTRATO, NOMCONTRATO'
      '          FROM INDCONTRATOLOJA CL'
      
        '         WHERE ( ( CL.DATINICIO  <= TO_DATE('#39'01/01/2002'#39') AND CL' +
        '.DATTERMINO >= TO_DATE('#39'31/01/2002'#39') )'
      '               OR CL.FLGINDETERMINADO = '#39'S'#39' )'
      '           AND CL.IDIMOVEL = 1227'
      '        ) CL,'
      '        ('
      
        '          SELECT IDIMOVEL, IDCONTRATO, IDINDICADOR, VLRAPURACAON' +
        'UM'
      '            FROM INDAPURACAO'
      '           WHERE TIPOINCLUSAO = '#39'C'#39
      '             AND IDINDICADOR = 9'
      '             AND MESCOMPETENCIA = 1'
      '             AND ANOCOMPETENCIA = 2002'
      '        ) CAL,'
      '        ('
      
        '          SELECT IDIMOVEL, IDCONTRATO, IDINDICADOR, VLRAPURACAON' +
        'UM'
      '            FROM INDAPURACAO'
      '           WHERE TIPOINCLUSAO = '#39'I'#39
      '             AND IDINDICADOR = 9'
      '             AND MESCOMPETENCIA = 1'
      '             AND ANOCOMPETENCIA = 2002'
      '        ) IMP'
      ''
      '  WHERE CL.IDCONTRATO = CAL.IDCONTRATO(+)'
      '    AND CL.IDCONTRATO = IMP.IDCONTRATO(+)'
      '    AND CL.IDIMOVEL   = IM.IDIMOVEL'
      'ORDER BY IMONOME, NOMCONTRATO'
      ''
      ''
      '')
    Left = 489
    Top = 19
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Constraints = True
    Left = 489
    Top = 11
  end
  object dsConcilia: TDataSource
    DataSet = cdsConcilia
    Left = 329
    Top = 51
  end
  object cdsConcilia: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 329
    Top = 65
    object cdsConciliaIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
    end
    object cdsConciliaNOMCONTRATO: TStringField
      FieldName = 'NOMCONTRATO'
      Size = 60
    end
    object cdsConciliaVLRCAL: TFloatField
      FieldName = 'VLRCAL'
      DisplayFormat = '###,##0.00'
    end
    object cdsConciliaVLRIMP: TFloatField
      FieldName = 'VLRIMP'
      DisplayFormat = '###,##0.00'
    end
    object cdsConciliaNUMCONTRATO: TStringField
      FieldName = 'NUMCONTRATO'
    end
    object cdsConciliaIMONOME: TStringField
      FieldName = 'IMONOME'
      Size = 60
    end
  end
  object pplConcilia: TppBDEPipeline
    DataSource = dsConcilia
    UserName = 'lConcilia'
    Left = 137
    Top = 220
  end
  object ppConcilia: TppReport
    AutoStop = False
    DataPipeline = pplConcilia
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    ModalPreview = False
    Left = 137
    Top = 235
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 14023
      mmPrintPosition = 0
      object lblEmpresa: TppLabel
        UserName = 'LblEmpresa'
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
        mmLeft = 0
        mmTop = 1058
        mmWidth = 197380
        BandType = 0
      end
      object lblRptTitulo: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Divergências de Apuração'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8202
        mmWidth = 197380
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NUMCONTRATO'
        DataPipeline = pplConcilia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 794
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'NOMCONTRATO'
        DataPipeline = pplConcilia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 20638
        mmTop = 794
        mmWidth = 77523
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VLRIMP'
        DataPipeline = pplConcilia
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 111125
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VLRCAL'
        DataPipeline = pplConcilia
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 140494
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppOrcamentoSystemVariable7: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 3175
        mmWidth = 196850
        BandType = 8
      end
      object lblSistema: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 196850
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
        mmLeft = 170657
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
      object ppOrcamentoLine5: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IMONOME'
      DataPipeline = pplConcilia
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 13229
        mmPrintPosition = 0
        object lblCompetencia: TppLabel
          UserName = 'lblCompetencia'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4763
          mmLeft = 138907
          mmTop = 0
          mmWidth = 57415
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          ShiftWithParent = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 5821
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'IMONOME'
          DataPipeline = pplConcilia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4763
          mmLeft = 0
          mmTop = 0
          mmWidth = 130175
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 7408
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 20638
          mmTop = 7408
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Valor Importado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 102394
          mmTop = 7408
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Valor Calculado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 131763
          mmTop = 7408
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line4'
          ParentWidth = True
          ShiftWithParent = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 11641
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
end
