inherited DtmRelResRubrica: TDtmRelResRubrica
  Left = 311
  Top = 194
  Width = 267
  Height = 222
  Caption = 'DtmRelResRubrica'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 25
    Top = 56
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
    Left = 25
    Top = 104
  end
  inherited qryExemplo: TwwQuery
    Left = 25
    Top = 147
  end
  inherited rpExemplo: TppReport
    Left = 25
    Top = 11
  end
  object qryRelResumoRubrica: TwwQuery
    BeforeOpen = qryRelResumoRubricaBeforeOpen
    AfterOpen = qryRelResumoRubricaAfterOpen
    AfterClose = qryRelResumoRubricaAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.NOME,'
      '  PL.NOME AS NOMEPLANO,'
      '  PD.CODPROVDESC,'
      '  PD.DESCRPROVDESC,'
      '  HST.IDHSTFOLHABENEF||'#39' - '#39'||HST.HISTORICO AS DESCRVERSAOLOTE,'
      '  DECODE(PD.FLGDESCONTO,0,'#39'Provento'#39','#39'Desconto'#39'),'
      '  COUNT(H.IDRUBRICA) AS TOTRUB,'
      '  COUNT(DISTINCT H.IDRESPONSAVEL) AS TOTREC,'
      '  DECODE(PD.FLGDESCONTO,'
      '    2, SUM(H.VALORINFO)||'#39' (I)'#39','
      '    0, NULL,'
      '    1, DECODE(SUM(H.VALORRECEBIDO-H.VALORPROVENTO),'
      '         0, DECODE(SUM(H.VALORINFO),'
      '              0, NULL, SUM(H.VALORINFO)||'#39' (I)'#39'),'
      '            SUM(H.VALORRECEBIDO-H.VALORPROVENTO)||'#39' (R)'#39')) INFORMATIVO,'
      '  SUM(DECODE(PD.FLGDESCONTO, 0, H.VALORPROVENTO, 0)) AS PROVENTOS,'
      '  SUM(DECODE(PD.FLGDESCONTO, 1, H.VALORPROVENTO, 0)) AS DESCONTOS,'
      '  SUM(DECODE(PD.FLGDESCONTO, 0, H.VALORPROVENTO, 0) -'
      '      DECODE(PD.FLGDESCONTO, 1, H.VALORPROVENTO, 0)) AS LIQ,'
      '  '#39'A'#39' AS QUEBRA'
      'FROM'
      '  HISTRUBSAL H,'
      '  PROVDESC PD,'
      '  PESSOA P,'
      '  HSTFOLHABENEF HST,'
      '  PLANPREVCONTABIL PL'
      'WHERE HST.IDHSTFOLHABENEF in (69,68)'
      'AND 1 = 2'
      '  AND HST.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF'
      '  AND H.IDPESSJUR = 1'
      '  AND P.IDPESSOA = H.IDPATRO'
      '  AND PL.IDPLANOPREV = H.IDPLANOCONTABIL'
      '  AND PD.IDPROVENTO = H.IDRUBRICA'
      '  AND (H.FLGESTORNO IS NULL OR H.FLGESTORNO = 0)'
      'GROUP BY'
      '  PD.CODPROVDESC,'
      '  PD.DESCRPROVDESC,'
      '  PD.FLGDESCONTO,'
      '  P.NOME,'
      '  PL.NOME,'
      '  HST.IDHSTFOLHABENEF,'
      '  HST.HISTORICO'
      'ORDER BY'
      '  HST.HISTORICO,'
      '  P.NOME,'
      '  PL.NOME,'
      '  DECODE(PD.FLGDESCONTO, 0, '#39'PROVENTO'#39', '#39'DESCONTO'#39') DESC,'
      '  PD.CODPROVDESC')
    ValidateWithMask = True
    Left = 117
    Top = 147
  end
  object qrRelResumoRubrica: TppReport
    AutoStop = False
    DataPipeline = plRelResumoRubrica
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Resumo de Rubricas'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    BeforePrint = qrRelResumoRubricaBeforePrint
    DeviceType = 'Screen'
    Left = 117
    Top = 16
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand27: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 51065
      mmPrintPosition = 0
      object ppLabel159: TppLabel
        UserName = 'ppLabel159'
        Caption = 'Relatório de Resumo de Rubricas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 109273
        mmTop = 28840
        mmWidth = 67998
        BandType = 0
      end
      object ppLine59: TppLine
        UserName = 'ppLine59'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 34660
        mmWidth = 284300
        BandType = 0
      end
      object qrlblMesRef: TppLabel
        UserName = 'qrlblMesRef'
        Caption = '-'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 159015
        mmTop = 46831
        mmWidth = 2117
        BandType = 0
      end
      object qrRelResumoRubricaDBText1: TppDBText
        UserName = 'qrRelResumoRubricaDBText1'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object qrRelResumoRubricaDBText2: TppDBText
        UserName = 'qrRelResumoRubricaDBText2'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object qrRelResumoRubricaDBText7: TppDBText
        UserName = 'qrRelResumoRubricaDBText7'
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
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object qrRelResumoRubricaDBImage1: TppDBImage
        UserName = 'qrRelResumoRubricaDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object qrRelResumoRubricaDBText8: TppDBText
        UserName = 'qrRelResumoRubricaDBText8'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 15875
        BandType = 0
      end
      object qrRelResumoRubricaDBText9: TppDBText
        UserName = 'qrRelResumoRubricaDBText9'
        AutoSize = True
        DataField = 'BARCIDUF'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14288
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 27781
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand28: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object qrRelResumoRubricaDBText3: TppDBText
        UserName = 'qrRelResumoRubricaDBText3'
        DataField = 'CODPROVDESC'
        DataPipeline = plRelResumoRubrica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object qrRelResumoRubricaDBText4: TppDBText
        UserName = 'qrRelResumoRubricaDBText4'
        DataField = 'DESCRPROVDESC'
        DataPipeline = plRelResumoRubrica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 17992
        mmTop = 0
        mmWidth = 126736
        BandType = 4
      end
      object qrRelResumoRubricaDBText11: TppDBText
        UserName = 'qrRelResumoRubricaDBText11'
        DataField = 'TOTRUB'
        DataPipeline = plRelResumoRubrica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 177007
        mmTop = 0
        mmWidth = 15081
        BandType = 4
      end
      object qrRelResumoRubricaDBText5: TppDBText
        UserName = 'qrRelResumoRubricaDBText5'
        BlankWhenZero = True
        DataField = 'PROVENTOS'
        DataPipeline = plRelResumoRubrica
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 195263
        mmTop = 0
        mmWidth = 26723
        BandType = 4
      end
      object qrRelResumoRubricaDBText6: TppDBText
        UserName = 'qrRelResumoRubricaDBText6'
        BlankWhenZero = True
        DataField = 'DESCONTOS'
        DataPipeline = plRelResumoRubrica
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 224367
        mmTop = 0
        mmWidth = 26723
        BandType = 4
      end
      object dbQuantRec: TppDBText
        UserName = 'dbQuantRec'
        DataField = 'TOTREC'
        DataPipeline = plRelResumoRubrica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 155311
        mmTop = 0
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        BlankWhenZero = True
        DataField = 'INFORMATIVO'
        DataPipeline = plRelResumoRubrica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 254001
        mmTop = 0
        mmWidth = 26723
        BandType = 4
      end
    end
    object ppFooterBand27: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppLine62: TppLine
        UserName = 'ppLine62'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel174: TppLabel
        UserName = 'ppLabel174'
        AutoSize = False
        Caption = 'Folha de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2910
        mmWidth = 280194
        BandType = 8
      end
      object ppCalc43: TppSystemVariable
        UserName = 'Calc43'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 254265
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc44: TppSystemVariable
        UserName = 'Calc44'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 130969
        mmTop = 2910
        mmWidth = 18785
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 11906
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 7
      end
      object ppLabel1: TppLabel
        UserName = 'lblToPatro1'
        Caption = 'Totais do Relatório:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 111125
        mmTop = 1058
        mmWidth = 33602
        BandType = 7
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Líquido do Relatório:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 108744
        mmTop = 5821
        mmWidth = 35983
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'TOTRUB'
        DataPipeline = plRelResumoRubrica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 177007
        mmTop = 1058
        mmWidth = 15080
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'lblSomaProventos1'
        DataField = 'PROVENTOS'
        DataPipeline = plRelResumoRubrica
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 195263
        mmTop = 1058
        mmWidth = 26723
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'lblSomaDescontos1'
        DataField = 'DESCONTOS'
        DataPipeline = plRelResumoRubrica
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 224367
        mmTop = 1058
        mmWidth = 26723
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'LIQ'
        DataPipeline = plRelResumoRubrica
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 195263
        mmTop = 5821
        mmWidth = 26723
        BandType = 7
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 10583
        mmWidth = 284300
        BandType = 7
      end
      object ppDBCalc13: TppDBCalc
        UserName = 'DBCalc13'
        DataField = 'TOTREC'
        DataPipeline = plRelResumoRubrica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 155311
        mmTop = 1058
        mmWidth = 15081
        BandType = 7
      end
    end
    object qrRelResumoRubricaGroup1: TppGroup
      BreakName = 'DESCRVERSAOLOTE'
      DataPipeline = plRelResumoRubrica
      NewPage = True
      UserName = 'qrRelResumoRubricaGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object qrRelResumoRubricaGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object dbHistorico: TppDBText
          UserName = 'dbHistorico'
          DataField = 'DESCRVERSAOLOTE'
          DataPipeline = plRelResumoRubrica
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 35719
          mmTop = 529
          mmWidth = 111390
          BandType = 3
          GroupNo = 0
        end
        object qrRelResumoRubricaLabel1: TppLabel
          UserName = 'qrRelResumoRubricaLabel1'
          AutoSize = False
          Caption = 'Referência    :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2381
          mmTop = 529
          mmWidth = 31485
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 5556
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object ResTotLoteOuVersao: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object lblSomaProventos: TppDBCalc
          UserName = 'lblSomaProventos'
          DataField = 'PROVENTOS'
          DataPipeline = plRelResumoRubrica
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = qrRelResumoRubricaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 195263
          mmTop = 1058
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object lblSomaDescontos: TppDBCalc
          UserName = 'lblSomaDescontos'
          DataField = 'DESCONTOS'
          DataPipeline = plRelResumoRubrica
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = qrRelResumoRubricaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 224367
          mmTop = 1058
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object lblTotLoteOuVersao: TppLabel
          UserName = 'lblTotLoteOuVersao'
          Caption = 'Totais da Versão:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 115094
          mmTop = 1058
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
        object lblLiqLoteOuVersao: TppLabel
          UserName = 'lblLiqLoteOuVersao'
          Caption = 'Líquido da Versão:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 112448
          mmTop = 5821
          mmWidth = 32279
          BandType = 5
          GroupNo = 0
        end
        object qrRelResumoRubricaDBCalc1: TppDBCalc
          UserName = 'qrRelResumoRubricaDBCalc1'
          DataField = 'TOTRUB'
          DataPipeline = plRelResumoRubrica
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = qrRelResumoRubricaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 177007
          mmTop = 1058
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object qrRelResumoRubricaLine1: TppLine
          UserName = 'qrRelResumoRubricaLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object qrRelResumoRubricaDBCalc2: TppDBCalc
          UserName = 'qrRelResumoRubricaDBCalc2'
          DataField = 'LIQ'
          DataPipeline = plRelResumoRubrica
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = qrRelResumoRubricaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 195263
          mmTop = 5821
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'TOTREC'
          DataPipeline = plRelResumoRubrica
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = qrRelResumoRubricaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 155311
          mmTop = 1058
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = plRelResumoRubrica
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8202
        mmPrintPosition = 0
        object lblCaptionPatro: TppLabel
          UserName = 'lblCaptionPatro'
          AutoSize = False
          Caption = 'Patrocinadora :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2381
          mmTop = 529
          mmWidth = 31485
          BandType = 3
          GroupNo = 1
        end
        object qrRelResumoRubricaDBText10: TppDBText
          UserName = 'qrRelResumoRubricaDBText10'
          DataField = 'NOME'
          DataPipeline = plRelResumoRubrica
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 35719
          mmTop = 529
          mmWidth = 111390
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 11113
        mmPrintPosition = 0
        object lblToPatro: TppLabel
          UserName = 'lblToPatro'
          Caption = 'Totais da Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 102923
          mmTop = 1058
          mmWidth = 41804
          BandType = 5
          GroupNo = 1
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'TOTRUB'
          DataPipeline = plRelResumoRubrica
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 177007
          mmTop = 1058
          mmWidth = 15081
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'PROVENTOS'
          DataPipeline = plRelResumoRubrica
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 195263
          mmTop = 1058
          mmWidth = 26723
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'DESCONTOS'
          DataPipeline = plRelResumoRubrica
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 224367
          mmTop = 1058
          mmWidth = 26723
          BandType = 5
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Líquido da Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 100542
          mmTop = 6085
          mmWidth = 44186
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'LIQ'
          DataPipeline = plRelResumoRubrica
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 195263
          mmTop = 6085
          mmWidth = 26723
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'TOTREC'
          DataPipeline = plRelResumoRubrica
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 155311
          mmTop = 1058
          mmWidth = 15081
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'NOMEPLANO'
      DataPipeline = plRelResumoRubrica
      KeepTogether = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14288
        mmPrintPosition = 0
        object qrRelResumoRubricaLabel9: TppLabel
          UserName = 'qrRelResumoRubricaLabel9'
          AutoSize = False
          Caption = 'Plano Contábil:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2381
          mmTop = 1852
          mmWidth = 31485
          BandType = 3
          GroupNo = 2
        end
        object ppDBText2: TppDBText
          UserName = 'qrRelResumoRubricaDBText101'
          DataField = 'NOMEPLANO'
          DataPipeline = plRelResumoRubrica
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 35719
          mmTop = 1852
          mmWidth = 111390
          BandType = 3
          GroupNo = 2
        end
        object qrRelResumoRubricaLabel3: TppLabel
          UserName = 'qrRelResumoRubricaLabel3'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 17992
          mmTop = 8996
          mmWidth = 16933
          BandType = 3
          GroupNo = 2
        end
        object qrRelResumoRubricaLabel2: TppLabel
          UserName = 'qrRelResumoRubricaLabel2'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 8996
          mmWidth = 13229
          BandType = 3
          GroupNo = 2
        end
        object ppLine60: TppLine
          UserName = 'ppLine60'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 13229
          mmWidth = 284300
          BandType = 3
          GroupNo = 2
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Recebedores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 151607
          mmTop = 8996
          mmWidth = 22225
          BandType = 3
          GroupNo = 2
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Rubricas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 177007
          mmTop = 8996
          mmWidth = 15081
          BandType = 3
          GroupNo = 2
        end
        object qrRelResumoRubricaLabel8: TppLabel
          UserName = 'qrRelResumoRubricaLabel8'
          Caption = 'Quant.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 178859
          mmTop = 3969
          mmWidth = 11377
          BandType = 3
          GroupNo = 2
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Quant.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 157163
          mmTop = 3969
          mmWidth = 11377
          BandType = 3
          GroupNo = 2
        end
        object qrRelResumoRubricaLabel4: TppLabel
          UserName = 'qrRelResumoRubricaLabel4'
          Caption = 'Proventos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 204523
          mmTop = 8996
          mmWidth = 17463
          BandType = 3
          GroupNo = 2
        end
        object qrRelResumoRubricaLabel5: TppLabel
          UserName = 'qrRelResumoRubricaLabel5'
          Caption = 'Descontos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 233098
          mmTop = 8996
          mmWidth = 17992
          BandType = 3
          GroupNo = 2
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Informativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 261409
          mmTop = 8996
          mmWidth = 19315
          BandType = 3
          GroupNo = 2
        end
        object lblPlano: TppLabel
          UserName = 'lblPlano'
          Caption = '-'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 50006
          mmTop = 7673
          mmWidth = 2117
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 11113
        mmPrintPosition = 0
        object ppLine6: TppLine
          UserName = 'Line6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 2
        end
        object ppLabel8: TppLabel
          UserName = 'lblToPatro2'
          Caption = 'Totais do Plano Contábil:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 101336
          mmTop = 1058
          mmWidth = 43392
          BandType = 5
          GroupNo = 2
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Líquido do Plano Contábil:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 98954
          mmTop = 6085
          mmWidth = 45773
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'TOTREC'
          DataPipeline = plRelResumoRubrica
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 155311
          mmTop = 1058
          mmWidth = 15081
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'TOTRUB'
          DataPipeline = plRelResumoRubrica
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 177007
          mmTop = 1058
          mmWidth = 15081
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc14'
          DataField = 'DESCONTOS'
          DataPipeline = plRelResumoRubrica
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 224367
          mmTop = 1058
          mmWidth = 26723
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'PROVENTOS'
          DataPipeline = plRelResumoRubrica
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 195263
          mmTop = 1058
          mmWidth = 26723
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'DBCalc16'
          DataField = 'LIQ'
          DataPipeline = plRelResumoRubrica
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 195263
          mmTop = 6085
          mmWidth = 26723
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object plRelResumoRubrica: TppBDEPipeline
    DataSource = dsRelResumoRubrica
    SkipWhenNoRecords = False
    UserName = 'plRelResumoRubrica'
    Left = 117
    Top = 56
  end
  object dsRelResumoRubrica: TwwDataSource
    DataSet = qryRelResumoRubrica
    Left = 117
    Top = 104
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME          , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO        , E.COMPLEMENTO, E.BAIRRO    ,'
      '       C.NOME AS CIDADE, C.CODESTADO  , E.CEP       , I.IMAGEM, '
      '       (E.LOGRADOURO||'#39', '#39'||E.NUMERO) AS ENDERECO   ,'
      '       (E.BAIRRO||'#39' - '#39'||C.NOME||'#39' - '#39'||C.CODESTADO) AS BARCIDUF'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ValidateWithMask = True
    Left = 207
    Top = 147
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 2002
      end>
    object qryFundacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryFundacaoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryFundacaoLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object qryFundacaoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object qryFundacaoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object qryFundacaoBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qryFundacaoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qryFundacaoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Size = 3
    end
    object qryFundacaoCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryFundacaoIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qryFundacaoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 70
    end
    object qryFundacaoBARCIDUF: TStringField
      FieldName = 'BARCIDUF'
      Size = 79
    end
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 207
    Top = 104
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 207
    Top = 56
  end
end
