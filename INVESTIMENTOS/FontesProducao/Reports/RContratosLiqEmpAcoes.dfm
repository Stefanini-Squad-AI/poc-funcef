inherited DmRContratosLiqEmpAcoes: TDmRContratosLiqEmpAcoes
  Left = 384
  Top = 146
  Width = 364
  Height = 424
  Caption = 'DmRContratosLiqEmpAcoes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 189
    Top = 24
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplExemploppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
  end
  inherited dsExemplo: TwwDataSource
    Left = 127
    Top = 24
  end
  inherited qryExemplo: TwwQuery
    Left = 66
    Top = 24
  end
  inherited rpExemplo: TppReport
    Left = 250
    Top = 24
    DataPipelineName = 'pplExemplo'
  end
  object dsRContratosLiqEmpAcoes: TwwDataSource
    AutoEdit = False
    DataSet = qryRContratosLiqEmpAcoes
    Left = 69
    Top = 244
  end
  object qryRContratosLiqEmpAcoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NUMCONTRATOCUSTODIA,'
      '       DATAOPER,'
      '       DATAVENCTO,'
      '       DSCMOVIMENTO,'
      '       QTDOPER,'
      '       PU,'
      '       TAXA,'
      '       VALORCONTRATO,'
      '       VALOROPER,'
      '       RECEITA,'
      '       SALDO,'
      '       TIPOLANCAMENTO,'
      '       PLANOPATRO,'
      '       DSCINVEST,'
      '       CORRET'
      '  FROM (SELECT HE.NUMCONTRATOCUSTODIA,'
      '               HE.DATAHISTEMPACOES AS DATAOPER,'
      '               HE.DATAHISTEMPACOES AS DATAVENCTO,'
      '               CASE'
      '                 WHEN HE.TIPOMOVIMENTO = 2 THEN'
      '                  '#39'Reversao Parcial'#39
      '                 WHEN HE.TIPOMOVIMENTO = 3 THEN'
      '                  '#39'Reversao Total'#39
      '                 WHEN HE.TIPOMOVIMENTO = 6 THEN'
      '                  '#39'Reversao Inadimplência'#39
      
        '                 WHEN HE.TIPOMOVIMENTO = 5 AND TIPOLANCAMENTO = ' +
        #39'I'#39' THEN'
      '                  '#39'Juros Importados'#39
      
        '                 WHEN HE.TIPOMOVIMENTO = 5 AND TIPOLANCAMENTO = ' +
        #39'C'#39' THEN'
      '                  '#39'Juros na Reversao'#39
      
        '                 WHEN HE.TIPOMOVIMENTO = 5 AND TIPOLANCAMENTO = ' +
        #39'J'#39' THEN'
      '                  '#39'Juros de Ajuste'#39
      '               END AS DSCMOVIMENTO,'
      '               HE.QTDHISTEMPACOES AS QTDOPER,'
      '               0.00 PU,'
      '               0.00 TAXA,'
      '               0.00 VALORCONTRATO,'
      '               CASE'
      '                 WHEN HE.TIPOMOVIMENTO IN (2, 3, 6) THEN'
      '                  0.00'
      '                 WHEN HE.TIPOMOVIMENTO = 5 THEN'
      '                  HE.VLRJUROSIMPORTA'
      '               END AS VALOROPER,'
      '               CASE'
      '                 WHEN HE.TIPOMOVIMENTO IN (2, 3, 6) THEN'
      '                  ABS(NVL(HE.VLRJUROSIMPORTA, 0))'
      '                 WHEN HE.TIPOMOVIMENTO = 5 THEN'
      '                  0.00'
      '               END AS RECEITA,'
      '               (CASE'
      '                 WHEN HE.TIPOMOVIMENTO IN (2, 3, 6) THEN'
      '                  0.00'
      '                 WHEN HE.TIPOMOVIMENTO = 5 THEN'
      '                  HE.VLRJUROSIMPORTA'
      '               END -'
      '               CASE'
      '                 WHEN HE.TIPOMOVIMENTO IN (2, 3, 6) THEN'
      '                  ABS(NVL(HE.VLRJUROSIMPORTA, 0))'
      '                 WHEN HE.TIPOMOVIMENTO = 5 THEN'
      '                  0.00'
      '               END ) as SALDO,'
      '               HE.TIPOLANCAMENTO,'
      '               '#39#39' PLANOPATRO,'
      '               '#39#39' DSCINVEST,'
      '               '#39#39' CORRET'
      '          FROM HISTEMPACOES@TST HE'
      '         WHERE HE.NUMCONTRATOCUSTODIA = '#39'11568570'#39
      '           AND HE.TIPOMOVIMENTO IN (2, 3, 5, 6)'
      ''
      '        UNION'
      ''
      '        SELECT OE.NUMCONTRATOCUSTODIA,'
      '               OE.DATAOPERACAO AS DATAOPER,'
      '               OE.datavencoper AS DATAVENCTO,'
      '               CASE'
      '                 WHEN OE.TIPOMOVIMENTO = 1 THEN'
      '                  '#39'Concessão'#39
      '                 WHEN OE.TIPOMOVIMENTO = 4 THEN'
      '                  '#39'Repactuação'#39
      '                 WHEN OE.TIPOMOVIMENTO = 7 THEN'
      '                  '#39'Inadimplência'#39
      '               END AS DSCMOVIMENTO,'
      '               OE.qtdoperacao AS QTDOPER,'
      '               OE.puoperacao PU,'
      '               OE.taxaoperacao TAXA,'
      '               OE.vlroperacao VALORCONTRATO,'
      '               0.00 VALOROPER,'
      '               0.00 RECEITA,'
      '               0.00 SALDO,               '
      '               OE.TIPOLANCAMENTO,'
      '               pp.PLANPRVCONTABPATRO PLANOPATRO,'
      '               ab.siglaacaobolsa     DSCINVEST,'
      '               CV.SGLCORRETVALORES CORRET'
      
        '         FROM OPEREMPACOES OE, vwplanprevctbpatr pp, acoesxbolsa' +
        ' ab, CORRETVALORES CV'
      '         WHERE OE.NUMCONTRATOCUSTODIA = '#39'11568570'#39
      '           AND OE.TIPOMOVIMENTO IN (1, 4, 7)'
      '           AND pp.idplanprevctbpatr = OE.idplanprevctbpatr'
      '           AND ab.idacao = OE.idinvestimento'
      '           AND CV.IDCORRETVALORES = OE.IDCORRETVALORES  )'
      ' ORDER BY NUMCONTRATOCUSTODIA, DATAOPER, TIPOLANCAMENTO'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 70
    Top = 174
    object qryRContratosLiqEmpAcoesNUMCONTRATOCUSTODIA: TStringField
      DisplayLabel = 'Nº Contrato'
      DisplayWidth = 15
      FieldName = 'NUMCONTRATOCUSTODIA'
      FixedChar = True
    end
    object qryRContratosLiqEmpAcoesDATAOPER: TDateTimeField
      DisplayLabel = 'Data Oper.'
      DisplayWidth = 14
      FieldName = 'DATAOPER'
    end
    object qryRContratosLiqEmpAcoesDATAVENCTO: TDateTimeField
      DisplayLabel = 'Data Vencto.'
      DisplayWidth = 15
      FieldName = 'DATAVENCTO'
    end
    object qryRContratosLiqEmpAcoesDSCMOVIMENTO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 31
      FieldName = 'DSCMOVIMENTO'
      Size = 22
    end
    object qryRContratosLiqEmpAcoesQTDOPER: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 12
      FieldName = 'QTDOPER'
      DisplayFormat = '###,###,##0'
    end
    object qryRContratosLiqEmpAcoesPU: TFloatField
      DisplayWidth = 10
      FieldName = 'PU'
    end
    object qryRContratosLiqEmpAcoesTAXA: TFloatField
      DisplayLabel = 'Taxa'
      DisplayWidth = 10
      FieldName = 'TAXA'
      DisplayFormat = '#,##0.00'
    end
    object qryRContratosLiqEmpAcoesVALORCONTRATO: TFloatField
      DisplayLabel = 'Valor Contrato'
      DisplayWidth = 15
      FieldName = 'VALORCONTRATO'
      DisplayFormat = '#,##0.00'
    end
    object qryRContratosLiqEmpAcoesVALOROPER: TFloatField
      DisplayLabel = 'Valor Oper.'
      DisplayWidth = 15
      FieldName = 'VALOROPER'
      DisplayFormat = '#,##0.00'
    end
    object qryRContratosLiqEmpAcoesRECEITA: TFloatField
      DisplayLabel = 'Receita'
      DisplayWidth = 13
      FieldName = 'RECEITA'
      DisplayFormat = '#,##0.00'
    end
    object qryRContratosLiqEmpAcoesTIPOLANCAMENTO: TStringField
      DisplayWidth = 1
      FieldName = 'TIPOLANCAMENTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryRContratosLiqEmpAcoesPLANOPATRO: TStringField
      FieldName = 'PLANOPATRO'
      Visible = False
      Size = 113
    end
    object qryRContratosLiqEmpAcoesDSCINVEST: TStringField
      FieldName = 'DSCINVEST'
      Visible = False
      Size = 10
    end
    object qryRContratosLiqEmpAcoesCORRET: TStringField
      FieldName = 'CORRET'
      Visible = False
      Size = 10
    end
    object qryRContratosLiqEmpAcoesSALDO: TFloatField
      FieldName = 'SALDO'
      Visible = False
    end
  end
  object rpRContratosLiqEmpAcoes: TppReport
    AutoStop = False
    DataPipeline = pplRContratosLiqEmpAcoes
    NoDataBehaviors = [ndBlankReport]
    OnStartPage = rpRContratosLiqEmpAcoesxStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Posição dos Contratos'
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
    Left = 68
    Top = 100
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplRContratosLiqEmpAcoes'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28046
      mmPrintPosition = 0
      object lblPosicao: TppLabel
        UserName = 'Label11'
        Caption = 'Posição dos Contratos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 38312
        BandType = 0
      end
      object ppLabel12: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 24871
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppDBImage2: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmOperComum.pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object lblPeriodo: TppLabel
        UserName = 'LPeriodo4'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 11853
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 6085
        mmLeft = 0
        mmTop = 21431
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label2'
        Caption = 'Data Oper.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 6085
        mmTop = 23019
        mmWidth = 14139
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label3'
        Caption = 'Data Vencto.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 23283
        mmTop = 23019
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label4'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 127000
        mmTop = 23019
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label5'
        Caption = 'PU'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 154517
        mmTop = 23019
        mmWidth = 3969
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label6'
        Caption = 'Valor Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 180711
        mmTop = 23019
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label7'
        Caption = 'Taxa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 169334
        mmTop = 23019
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label10'
        Caption = 'Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 88371
        mmTop = 23019
        mmWidth = 17484
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label12'
        Caption = 'Receita'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 213784
        mmTop = 23019
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label13'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 264584
        mmTop = 23019
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label102'
        Caption = 'Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 43656
        mmTop = 23019
        mmWidth = 13039
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label14'
        Caption = 'Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 240771
        mmTop = 23019
        mmWidth = 7673
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppShape2: TppShape
        OnPrint = shpRenFixSaldoDetPaiPrint
        UserName = 'shpRenFixSaldoDetPai'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'DATAOPER'
        DataPipeline = pplRContratosLiqEmpAcoes
        DisplayFormat = 'DD/MM/YYYY'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRContratosLiqEmpAcoes'
        mmHeight = 3429
        mmLeft = 5292
        mmTop = 265
        mmWidth = 14732
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText7'
        BlankWhenZero = True
        DataField = 'PU'
        DataPipeline = pplRContratosLiqEmpAcoes
        DisplayFormat = '#,##0.00000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRContratosLiqEmpAcoes'
        mmHeight = 3440
        mmLeft = 144992
        mmTop = 265
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText8'
        BlankWhenZero = True
        DataField = 'VALORCONTRATO'
        DataPipeline = pplRContratosLiqEmpAcoes
        DisplayFormat = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRContratosLiqEmpAcoes'
        mmHeight = 3440
        mmLeft = 178594
        mmTop = 265
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText9'
        BlankWhenZero = True
        DataField = 'TAXA'
        DataPipeline = pplRContratosLiqEmpAcoes
        DisplayFormat = '##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRContratosLiqEmpAcoes'
        mmHeight = 3440
        mmLeft = 163513
        mmTop = 265
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText13'
        BlankWhenZero = True
        DataField = 'QTDOPER'
        DataPipeline = pplRContratosLiqEmpAcoes
        DisplayFormat = '###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRContratosLiqEmpAcoes'
        mmHeight = 3429
        mmLeft = 121709
        mmTop = 265
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'ppdbDescInvest3'
        DataField = 'DSCMOVIMENTO'
        DataPipeline = pplRContratosLiqEmpAcoes
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplRContratosLiqEmpAcoes'
        mmHeight = 3440
        mmLeft = 43127
        mmTop = 265
        mmWidth = 42598
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText10'
        DataField = 'DATAVENCTO'
        DataPipeline = pplRContratosLiqEmpAcoes
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplRContratosLiqEmpAcoes'
        mmHeight = 3429
        mmLeft = 23283
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText101'
        BlankWhenZero = True
        DataField = 'RECEITA'
        DataPipeline = pplRContratosLiqEmpAcoes
        DisplayFormat = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRContratosLiqEmpAcoes'
        mmHeight = 3440
        mmLeft = 202936
        mmTop = 265
        mmWidth = 21430
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText5'
        BlankWhenZero = True
        DataField = 'VALOROPER'
        DataPipeline = pplRContratosLiqEmpAcoes
        DisplayFormat = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRContratosLiqEmpAcoes'
        mmHeight = 3440
        mmLeft = 227013
        mmTop = 265
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText1'
        DataField = 'DSCINVEST'
        DataPipeline = pplRContratosLiqEmpAcoes
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplRContratosLiqEmpAcoes'
        mmHeight = 3440
        mmLeft = 88106
        mmTop = 265
        mmWidth = 30956
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel32: TppLabel
        OnPrint = LblSistemaPrint
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
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 258498
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
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
        mmLeft = 0
        mmTop = 3175
        mmWidth = 284428
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppShape5: TppShape
          UserName = 'shpRenFixSaldoDetPai1'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 0
          mmTop = 264
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'DBText2'
          DataField = 'PLANOPATRO'
          DataPipeline = pplRContratosLiqEmpAcoes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplRContratosLiqEmpAcoes'
          mmHeight = 3387
          mmLeft = 34660
          mmTop = 794
          mmWidth = 88371
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label101'
          Caption = 'Plano / Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 794
          mmTop = 794
          mmWidth = 31750
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppLabel2: TppLabel
          UserName = 'Label9'
          Caption = 'Totais do Plano/Patro..........'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Tahoma'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3429
          mmLeft = 75936
          mmTop = 529
          mmWidth = 40047
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'RECEITA'
          DataPipeline = pplRContratosLiqEmpAcoes
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Tahoma'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRContratosLiqEmpAcoes'
          mmHeight = 3440
          mmLeft = 202936
          mmTop = 529
          mmWidth = 21430
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'VALOROPER'
          DataPipeline = pplRContratosLiqEmpAcoes
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Tahoma'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRContratosLiqEmpAcoes'
          mmHeight = 3440
          mmLeft = 227278
          mmTop = 529
          mmWidth = 21430
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'SALDO'
          DataPipeline = pplRContratosLiqEmpAcoes
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Tahoma'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRContratosLiqEmpAcoes'
          mmHeight = 3440
          mmLeft = 251090
          mmTop = 529
          mmWidth = 21430
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'QTDOPER'
          DataPipeline = pplRContratosLiqEmpAcoes
          DisplayFormat = '###,###,##0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Tahoma'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRContratosLiqEmpAcoes'
          mmHeight = 3440
          mmLeft = 121709
          mmTop = 529
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NUMCONTRATOCUSTODIA'
      DataPipeline = pplRContratosLiqEmpAcoes
      KeepTogether = True
      OutlineSettings.CreateNode = True
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplRContratosLiqEmpAcoes'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppDBText15: TppDBText
          UserName = 'DBText3'
          DataField = 'NUMCONTRATOCUSTODIA'
          DataPipeline = pplRContratosLiqEmpAcoes
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Tahoma'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplRContratosLiqEmpAcoes'
          mmHeight = 3810
          mmLeft = 22490
          mmTop = 794
          mmWidth = 19844
          BandType = 3
          GroupNo = 1
        end
        object ppLabel13: TppLabel
          UserName = 'Label1'
          Caption = 'Contrato:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Tahoma'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3810
          mmLeft = 4233
          mmTop = 794
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'SALDO'
          DataPipeline = pplRContratosLiqEmpAcoes
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Tahoma'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRContratosLiqEmpAcoes'
          mmHeight = 3429
          mmLeft = 251090
          mmTop = 1588
          mmWidth = 21430
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALOROPER'
          DataPipeline = pplRContratosLiqEmpAcoes
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Tahoma'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRContratosLiqEmpAcoes'
          mmHeight = 3429
          mmLeft = 227013
          mmTop = 1588
          mmWidth = 21430
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'RECEITA'
          DataPipeline = pplRContratosLiqEmpAcoes
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Tahoma'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRContratosLiqEmpAcoes'
          mmHeight = 3429
          mmLeft = 202936
          mmTop = 1588
          mmWidth = 21430
          BandType = 5
          GroupNo = 1
        end
        object ppLabel1: TppLabel
          UserName = 'Label8'
          Caption = 'Totais do Contrato................'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Tahoma'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3429
          mmLeft = 75936
          mmTop = 1588
          mmWidth = 40555
          BandType = 5
          GroupNo = 1
        end
        object ppLine3: TppLine
          UserName = 'Line4'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 202142
          mmTop = 794
          mmWidth = 70644
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'QTDOPER'
          DataPipeline = pplRContratosLiqEmpAcoes
          DisplayFormat = '###,###,##0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Tahoma'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRContratosLiqEmpAcoes'
          mmHeight = 3440
          mmLeft = 121709
          mmTop = 1588
          mmWidth = 20902
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object pplRContratosLiqEmpAcoes: TppBDEPipeline
    DataSource = dsRContratosLiqEmpAcoes
    UserName = 'lRContratosLiqEmpAcoes'
    Left = 223
    Top = 100
    object pplRContratosLiqEmpAcoesppField1: TppField
      FieldAlias = 'NUMCONTRATOCUSTODIA'
      FieldName = 'NUMCONTRATOCUSTODIA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplRContratosLiqEmpAcoesppField2: TppField
      FieldAlias = 'DATAOPER'
      FieldName = 'DATAOPER'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 14
      Position = 1
    end
    object pplRContratosLiqEmpAcoesppField3: TppField
      FieldAlias = 'DATAVENCTO'
      FieldName = 'DATAVENCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 15
      Position = 2
    end
    object pplRContratosLiqEmpAcoesppField4: TppField
      FieldAlias = 'DSCMOVIMENTO'
      FieldName = 'DSCMOVIMENTO'
      FieldLength = 22
      DisplayWidth = 31
      Position = 3
    end
    object pplRContratosLiqEmpAcoesppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDOPER'
      FieldName = 'QTDOPER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 12
      Position = 4
    end
    object pplRContratosLiqEmpAcoesppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PU'
      FieldName = 'PU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplRContratosLiqEmpAcoesppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'TAXA'
      FieldName = 'TAXA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplRContratosLiqEmpAcoesppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORCONTRATO'
      FieldName = 'VALORCONTRATO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 7
    end
    object pplRContratosLiqEmpAcoesppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOROPER'
      FieldName = 'VALOROPER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 8
    end
    object pplRContratosLiqEmpAcoesppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'RECEITA'
      FieldName = 'RECEITA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 13
      Position = 9
    end
    object pplRContratosLiqEmpAcoesppField11: TppField
      FieldAlias = 'TIPOLANCAMENTO'
      FieldName = 'TIPOLANCAMENTO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 10
    end
    object pplRContratosLiqEmpAcoesppField12: TppField
      FieldAlias = 'PLANOPATRO'
      FieldName = 'PLANOPATRO'
      FieldLength = 113
      DisplayWidth = 113
      Position = 11
    end
    object pplRContratosLiqEmpAcoesppField13: TppField
      FieldAlias = 'DSCINVEST'
      FieldName = 'DSCINVEST'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object pplRContratosLiqEmpAcoesppField14: TppField
      FieldAlias = 'CORRET'
      FieldName = 'CORRET'
      FieldLength = 10
      DisplayWidth = 10
      Position = 13
    end
    object pplRContratosLiqEmpAcoesppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
  end
end
