inherited dtmRelFat: TdtmRelFat
  Left = 397
  Top = 161
  Width = 366
  Height = 286
  Caption = 'dtmRelFat'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
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
  object qryRelFat: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PJ.NOME AS PATRO,'
      '  COUNT(*) AS TOTALREG,'
      '  NVL(MESANT.QTDMESANT, 0) AS QTDMESANT,'
      '  NVL(MESANT.TOTALMESANT, 0) AS TOTALMESANT,'
      '  HT.MESCOBRANCA,'
      '  SUM(HT.VALORESPERADO) AS TOTAL_BRUTO,'
      '  (SUM(HT.VALORESPERADO) / ((PD.PERCIOF/100)+1)) AS TOTLIQUIDO,'
      
        '  ((SUM(HT.VALORESPERADO) / ((PD.PERCIOF/100)+1)) * (PD.PERCIOF/' +
        '100)) AS TOTIOF,'
      
        '  ((SUM(HT.VALORESPERADO) / ((PD.PERCIOF/100)+1)) * (PD.PERCPROL' +
        'ABORE/100)) AS TOTPROLABORE,'
      '  PD.NOME AS PRODUTO,'
      '  PD.PERCIOF,'
      '  PD.PERCPROLABORE'
      'FROM '
      '    PESSOA PJ,'
      '    HSTCONTRIBASS HT,'
      '    PRODASS PD,'
      '    PLANASS PL,'
      '    (SELECT'
      
        '    HT.IDPESSJUR, COUNT(*) AS QTDMESANT, SUM(HT.VALORESPERADO) A' +
        'S TOTALMESANT'
      '    FROM PARTASS PT,'
      '    PESSOA PE,'
      '    PESSOA PJ,'
      '    PESSOA BN,'
      '    PESSOAFISICA PF,'
      '    PARTPREVPLAN PV,'
      '    ELEGPATRO EL,'
      '    HSTCONTRIBASS HT,'
      '    BENEFASS BF,'
      '    CONTASS CT,'
      '    SITPLANOASS SP,'
      '    PLANPREV PR,'
      '    SITPART ST,'
      '    PRODASS PD,'
      '    PLANASS PL'
      '  WHERE'
      '    HT.MESCOBRANCA = :MesAnt AND'
      '    PT.IDPESSOA = PV.IDPESSOA AND'
      '    EL.IDPESSJUR = HT.IDPESSJUR AND /**/'
      '    PT.IDPESSJUR = PV.IDPESSJUR AND'
      '    PT.IDPESSOA = EL.IDPESSOA AND'
      '    PT.IDPESSJUR = EL.IDPESSJUR AND'
      '    PT.IDPESSOA = PE.IDPESSOA AND'
      '    PT.IDPESSOA = PF.IDPESSOA AND'
      '    BF.IDPLANOPREV = PV.IDPLANOPREV AND'
      '    BF.IDPESSJUR = PV.IDPESSJUR AND'
      '    BF.IDTITULAR = PV.IDPESSOA AND'
      '    BF.FLGATIVO = CT.FLGATIVO AND'
      '    BF.IDPLANOPREV = CT.IDPLANOPREV AND'
      '    BF.IDPESSJUR = CT.IDPESSJUR AND'
      '    BF.IDPLANASS = PT.IDPLANASS AND'
      '    PT.IDPESSJUR = PV.IDPESSJUR AND'
      '    PT.IDPESSJUR = PJ.IDPESSOA AND'
      '    PT.IDPESSOA = BF.IDTITULAR AND'
      '    PT.IDPESSOA = CT.IDTITULAR AND'
      '    PT.IDSITPART = SP.IDSITPLANOASS AND'
      '    PT.IDPLANOPREV = PR.IDPLANOPREV AND'
      '    PT.IDPLANOPREV = PV.IDPLANOPREV AND'
      '    PT.IDPESSJUR = PV.IDPESSJUR AND'
      '    HT.IDPLANOPREV = PV.IDPLANOPREV AND'
      '    HT.IDPESSJUR = PV.IDPESSJUR AND'
      '    HT.IDPLANOPREV = PV.IDPLANOPREV AND'
      '    HT.IDPESSJUR = PV.IDPESSJUR AND'
      '    HT.IDTITULAR = PV.IDPESSOA AND'
      '    HT.IDPLANASS = PT.IDPLANASS AND'
      '    PV.IDPESSOA = PT.IDPESSOA AND'
      '    PV.IDPESSOA = PF.IDPESSOA AND'
      '    PV.IDPESSOA = BF.IDTITULAR AND'
      '    PV.IDPESSJUR = PJ.IDPESSOA AND'
      '    PV.IDSITPART = ST.IDSITPART AND'
      '    PV.IDPLANOPREV = PR.IDPLANOPREV AND'
      '    BF.FLGATIVO = CT.FLGATIVO AND'
      '    BF.IDPLANOPREV = CT.IDPLANOPREV AND'
      '    BF.IDPESSJUR = CT.IDPESSJUR AND'
      '    BF.IDDEPENDENTE = BN.IDPESSOA AND'
      '    BF.IDTITULAR = CT.IDTITULAR AND'
      '    HT.IDTITULAR = PT.IDPESSOA AND'
      '    HT.IDPLANASS = PL.IDPLANASS AND'
      '    PD.IDPRODASS = PL.IDPRODASS AND'
      '    CT.FLGATIVO = BF.FLGATIVO AND'
      '    BF.IDPLANASS = CT.IDPLANASS AND /**/'
      '    BF.IDPLANOPREV = CT.IDPLANOPREV AND'
      '    BF.IDPESSJUR = CT.IDPESSJUR AND'
      '    PT.IDPLANASS = CT.IDPLANASS AND /**/'
      '    PT.IDPLANOPREV = PV.IDPLANOPREV AND'
      '    PT.IDPESSJUR = PV.IDPESSJUR AND'
      '    PV.IDPESSOA = PT.IDPESSOA AND'
      '    HT.IDPLANOPREV = PV.IDPLANOPREV AND'
      '    HT.IDPESSJUR = PV.IDPESSJUR AND'
      '    HT.IDPLANASS = PT.IDPLANASS AND'
      '    HT.IDTITULAR = PV.IDPESSOA AND'
      '    HT.VALORESPERADO > 0'
      '  GROUP BY HT.IDPESSJUR'
      '  ) MESANT'
      'WHERE'
      '  HT.MESCOBRANCA = :MesCorr AND'
      '  HT.IDPLANASS = PL.IDPLANASS AND'
      '  PD.IDPRODASS = PL.IDPRODASS AND'
      '  HT.IDPESSJUR = PJ.IDPESSOA AND'#9
      '  HT.VALORESPERADO > 0 AND'
      '  HT.IDPESSJUR = MESANT.IDPESSJUR(+)'
      ''
      
        'GROUP BY HT.MESCOBRANCA, PJ.NOME, PD.PERCIOF, PD.PERCPROLABORE, ' +
        'MESANT.QTDMESANT, MESANT.TOTALMESANT, PD.NOME'
      'ORDER BY PJ.NOME'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 32
    Top = 96
    ParamData = <
      item
        DataType = ftString
        Name = 'MesAnt'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mesCorr'
        ParamType = ptUnknown
      end>
  end
  object DsRelFat: TwwDataSource
    DataSet = qryRelFat
    Left = 88
    Top = 96
  end
  object ppPipeRelFat: TppBDEPipeline
    DataSource = DsRelFat
    UserName = 'PipeRelFat'
    Left = 152
    Top = 96
    object ppPipeRelFatppField1: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppPipeRelFatppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALREG'
      FieldName = 'TOTALREG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppPipeRelFatppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDMESANT'
      FieldName = 'QTDMESANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppPipeRelFatppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALMESANT'
      FieldName = 'TOTALMESANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppPipeRelFatppField5: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 4
    end
    object ppPipeRelFatppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL_BRUTO'
      FieldName = 'TOTAL_BRUTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppPipeRelFatppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTLIQUIDO'
      FieldName = 'TOTLIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppPipeRelFatppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTIOF'
      FieldName = 'TOTIOF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppPipeRelFatppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTPROLABORE'
      FieldName = 'TOTPROLABORE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppPipeRelFatppField10: TppField
      FieldAlias = 'PRODUTO'
      FieldName = 'PRODUTO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 9
    end
    object ppPipeRelFatppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCIOF'
      FieldName = 'PERCIOF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppPipeRelFatppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCPROLABORE'
      FieldName = 'PERCPROLABORE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
  end
  object ppRrelFat: TppReport
    AutoStop = False
    DataPipeline = ppPipeRelFat
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
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
    DeviceType = 'Screen'
    Left = 216
    Top = 96
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 40481
      mmPrintPosition = 0
      object ppDBImage1: TppDBImage
        UserName = 'DBImage101'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppPipeFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 46831
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CEP'
        DataPipeline = ppPipeFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 54240
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'BAIRRO'
        DataPipeline = ppPipeFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 46831
        mmTop = 17463
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CIDADE'
        DataPipeline = ppPipeFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 67469
        mmTop = 17463
        mmWidth = 26988
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CODESTADO'
        DataPipeline = ppPipeFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 94986
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'NUMERO'
        DataPipeline = ppPipeFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 89959
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'LOGRADOURO'
        DataPipeline = ppPipeFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 46831
        mmTop = 12965
        mmWidth = 41804
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppPipeFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 46831
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText1101'
        DataField = 'NOME'
        DataPipeline = ppPipeFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 46831
        mmTop = 1323
        mmWidth = 133615
        BandType = 0
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 26988
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'rpLabelTitulo1'
        Caption = 'FATURA MENSAL'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 3175
        mmTop = 27517
        mmWidth = 36248
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'PRODUTO'
        DataPipeline = ppPipeRelFat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 2910
        mmTop = 34396
        mmWidth = 174096
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        Caption = 'Ano/Mês de Ref.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 178859
        mmTop = 29369
        mmWidth = 28840
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = 'Ano/Mês de Cobrança: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 179123
        mmTop = 34396
        mmWidth = 39423
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'MESCOBRANCA'
        DataPipeline = ppPipeRelFat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 218546
        mmTop = 34396
        mmWidth = 18521
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        Color = 15658734
        DataField = 'MESCOBRANCA'
        DataPipeline = ppPipeRelFat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 218546
        mmTop = 29369
        mmWidth = 18785
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 54769
      mmPrintPosition = 0
      object ppDBText9: TppDBText
        UserName = 'rpdivergerecebimentoDBText102'
        DataField = 'PATRO'
        DataPipeline = ppPipeRelFat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 6615
        mmTop = 10848
        mmWidth = 50536
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBTextPAnt1'
        DataField = 'TOTALMESANT'
        DataPipeline = ppPipeRelFat
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 71438
        mmTop = 10848
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'QTDMESANT'
        DataPipeline = ppPipeRelFat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 59531
        mmTop = 10848
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBTextVAtual1'
        DataField = 'TOTALREG'
        DataPipeline = ppPipeRelFat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 169069
        mmTop = 10848
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBTextPAtual1'
        DataField = 'TOTAL_BRUTO'
        DataPipeline = ppPipeRelFat
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 180446
        mmTop = 10848
        mmWidth = 23813
        BandType = 4
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 3969
        mmTop = 21167
        mmWidth = 239713
        BandType = 4
      end
      object ppLine21: TppLine
        UserName = 'Line103'
        Pen.Style = psInsideFrame
        Weight = 0.75
        mmHeight = 794
        mmLeft = 4233
        mmTop = 23813
        mmWidth = 134409
        BandType = 4
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Pen.Style = psInsideFrame
        Weight = 0.75
        mmHeight = 794
        mmLeft = 4498
        mmTop = 38629
        mmWidth = 134144
        BandType = 4
      end
      object ppLine26: TppLine
        UserName = 'Line26'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 13494
        mmLeft = 36777
        mmTop = 24606
        mmWidth = 265
        BandType = 4
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Caption = 'Prêmio Total Líquido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 71173
        mmTop = 26988
        mmWidth = 31221
        BandType = 4
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = 'IOF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 41275
        mmTop = 26988
        mmWidth = 9790
        BandType = 4
      end
      object ppLabel27: TppLabel
        UserName = 'Label202'
        AutoSize = False
        Caption = 'Prêmio Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 6350
        mmTop = 26988
        mmWidth = 27781
        BandType = 4
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Caption = 'Pró-Labore'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 106098
        mmTop = 26988
        mmWidth = 19579
        BandType = 4
      end
      object ppLine27: TppLine
        UserName = 'Line27'
        Pen.Style = psInsideFrame
        Weight = 0.75
        mmHeight = 794
        mmLeft = 4233
        mmTop = 24342
        mmWidth = 134409
        BandType = 4
      end
      object ppLine28: TppLine
        UserName = 'Line28'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 13494
        mmLeft = 68792
        mmTop = 24606
        mmWidth = 265
        BandType = 4
      end
      object ppLine29: TppLine
        UserName = 'Line29'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 4498
        mmTop = 38100
        mmWidth = 134144
        BandType = 4
      end
      object ppLine30: TppLine
        UserName = 'ppLine201'
        Pen.Style = psDash
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 53181
        mmWidth = 284300
        BandType = 4
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 6879
        mmTop = 5821
        mmWidth = 27781
        BandType = 4
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = 'Vidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 59796
        mmTop = 5821
        mmWidth = 11113
        BandType = 4
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        AutoSize = False
        Caption = 'Saldo do Mês Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 59796
        mmTop = 2381
        mmWidth = 35190
        BandType = 4
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        AutoSize = False
        Caption = 'Prêmio Mensal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 71173
        mmTop = 5821
        mmWidth = 23813
        BandType = 4
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        AutoSize = False
        Caption = 'Vidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 96309
        mmTop = 5821
        mmWidth = 11113
        BandType = 4
      end
      object ppLabel34: TppLabel
        UserName = 'Label102'
        AutoSize = False
        Caption = 'Prêmio Mensal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 107686
        mmTop = 5821
        mmWidth = 23813
        BandType = 4
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        AutoSize = False
        Caption = 'Inclusões'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 96309
        mmTop = 2381
        mmWidth = 35190
        BandType = 4
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        AutoSize = False
        Caption = 'Exclusões'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 132821
        mmTop = 2381
        mmWidth = 35190
        BandType = 4
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        AutoSize = False
        Caption = 'Prêmio Mensal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 144198
        mmTop = 5821
        mmWidth = 23813
        BandType = 4
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        AutoSize = False
        Caption = 'Saldo do Mês Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 169069
        mmTop = 2381
        mmWidth = 35190
        BandType = 4
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        AutoSize = False
        Caption = 'Vidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 169069
        mmTop = 5821
        mmWidth = 11113
        BandType = 4
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        AutoSize = False
        Caption = 'Prêmio Mensal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 180711
        mmTop = 5821
        mmWidth = 23548
        BandType = 4
      end
      object ppLine31: TppLine
        UserName = 'Line31'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20373
        mmLeft = 95515
        mmTop = 794
        mmWidth = 265
        BandType = 4
      end
      object ppLine32: TppLine
        UserName = 'Line32'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20373
        mmLeft = 59002
        mmTop = 794
        mmWidth = 265
        BandType = 4
      end
      object ppLine33: TppLine
        UserName = 'Line33'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20373
        mmLeft = 132027
        mmTop = 794
        mmWidth = 265
        BandType = 4
      end
      object ppLine34: TppLine
        UserName = 'Line34'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20373
        mmLeft = 168540
        mmTop = 794
        mmWidth = 265
        BandType = 4
      end
      object ppLine35: TppLine
        UserName = 'Line35'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 3969
        mmTop = 794
        mmWidth = 239713
        BandType = 4
      end
      object ppLine36: TppLine
        UserName = 'Line36'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20108
        mmLeft = 204788
        mmTop = 1058
        mmWidth = 265
        BandType = 4
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        AutoSize = False
        Caption = 'Total Bruto (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 206375
        mmTop = 5821
        mmWidth = 35190
        BandType = 4
      end
      object ppLine37: TppLine
        UserName = 'Line37'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 13494
        mmLeft = 103717
        mmTop = 24606
        mmWidth = 265
        BandType = 4
      end
      object ppLine38: TppLine
        UserName = 'Line38'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 15081
        mmLeft = 138377
        mmTop = 23813
        mmWidth = 265
        BandType = 4
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        AutoSize = False
        Caption = 'Vidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 132821
        mmTop = 5821
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'TOTAL_BRUTO'
        DataPipeline = ppPipeRelFat
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 212461
        mmTop = 11113
        mmWidth = 23813
        BandType = 4
      end
      object ppLine41: TppLine
        UserName = 'Line41'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20108
        mmLeft = 243417
        mmTop = 1058
        mmWidth = 265
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText8'
        DataField = 'TOTAL_BRUTO'
        DataPipeline = ppPipeRelFat
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 11113
        mmTop = 32544
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'TOTIOF'
        DataPipeline = ppPipeRelFat
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 43921
        mmTop = 32544
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'TOTLIQUIDO'
        DataPipeline = ppPipeRelFat
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 73290
        mmTop = 32544
        mmWidth = 25135
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'TOTPROLABORE'
        DataPipeline = ppPipeRelFat
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 108215
        mmTop = 32544
        mmWidth = 26723
        BandType = 4
      end
      object ppVariable2: TppVariable
        UserName = 'Variable1'
        AutoSize = False
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 96309
        mmTop = 10583
        mmWidth = 11113
        BandType = 4
      end
      object ppVariable3: TppVariable
        UserName = 'Variable3'
        AutoSize = False
        CalcOrder = 1
        DataType = dtDouble
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 107686
        mmTop = 10583
        mmWidth = 23813
        BandType = 4
      end
      object ppVariable4: TppVariable
        UserName = 'Variable4'
        AutoSize = False
        CalcOrder = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 132821
        mmTop = 10583
        mmWidth = 11113
        BandType = 4
      end
      object ppVariable5: TppVariable
        UserName = 'Variable5'
        AutoSize = False
        CalcOrder = 3
        DataType = dtDouble
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 144198
        mmTop = 10583
        mmWidth = 23813
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20373
        mmLeft = 3704
        mmTop = 1058
        mmWidth = 265
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 15081
        mmLeft = 4233
        mmTop = 23813
        mmWidth = 265
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText9'
        DataField = 'PERCIOF'
        DataPipeline = ppPipeRelFat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 51329
        mmTop = 26988
        mmWidth = 6879
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 58738
        mmTop = 26988
        mmWidth = 2117
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 133086
        mmTop = 26988
        mmWidth = 2117
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'PERCPROLABORE'
        DataPipeline = ppPipeRelFat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 125942
        mmTop = 26988
        mmWidth = 6879
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLabel51: TppLabel
        UserName = 'LabelSistema1'
        AutoSize = False
        Caption = 'AdmAssistencial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 1323
        mmWidth = 103188
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 27517
        mmTop = 1323
        mmWidth = 213519
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 242623
        mmTop = 1323
        mmWidth = 30692
        BandType = 8
      end
      object ppLine40: TppLine
        UserName = 'Line40'
        Pen.Style = psInsideFrame
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel46: TppLabel
        UserName = 'Label46'
        AutoSize = False
        Caption = 'Total Valor Pro-Labore (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 154516
        mmTop = 22225
        mmWidth = 39952
        BandType = 7
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        AutoSize = False
        Caption = 'Total Prêmio Líquido (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 96309
        mmTop = 22225
        mmWidth = 37305
        BandType = 7
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        AutoSize = False
        Caption = 'Total Valor IOF (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 55298
        mmTop = 22225
        mmWidth = 28047
        BandType = 7
      end
      object ppLabel49: TppLabel
        UserName = 'Label49'
        AutoSize = False
        Caption = 'Total Prêmio Bruto (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 8731
        mmTop = 22225
        mmWidth = 34130
        BandType = 7
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        Caption = 'TOTAL GERAL DA FATURA'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        mmHeight = 4763
        mmLeft = 7144
        mmTop = 14023
        mmWidth = 50800
        BandType = 7
      end
      object ppLine39: TppLine
        UserName = 'Line39'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 1058
        mmWidth = 284300
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'TOTAL_BRUTO'
        DataPipeline = ppPipeRelFat
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 8730
        mmTop = 26459
        mmWidth = 34130
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'TOTIOF'
        DataPipeline = ppPipeRelFat
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 55298
        mmTop = 26459
        mmWidth = 28047
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'TOTLIQUIDO'
        DataPipeline = ppPipeRelFat
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 96309
        mmTop = 26459
        mmWidth = 37305
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'TOTPROLABORE'
        DataPipeline = ppPipeRelFat
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 154516
        mmTop = 26459
        mmWidth = 39952
        BandType = 7
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'PATRO'
      DataPipeline = ppPipeRelFat
      KeepTogether = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65314F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F757263650C1001000070726F636564757265205661
        726961626C65314F6E43616C63287661722056616C75653A2056617269616E74
        293B0D0A626567696E0D0A76616C7565203A3D20303B0D0A2020696620285069
        706552656C4661745B27544F54414C524547275D203E205069706552656C4661
        745B275154444D4553414E54275D2920616E640D0A2020202020285069706552
        656C4661745B275154444D4553414E54275D203E203029207468656E0D0A2020
        202056616C7565203A3D205069706552656C4661745B27544F54414C52454727
        5D202D205069706552656C4661745B275154444D4553414E54275D0D0A202065
        6C73650D0A2020202056616C7565203A3D20303B20200D0A202020200D0A656E
        643B0D0A0D436F6D706F6E656E744E616D6506095661726961626C6531094576
        656E744E616D6506064F6E43616C63074576656E74494402210001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D65060F566172696162
        6C65334F6E43616C630B50726F6772616D54797065070B747450726F63656475
        726506536F757263650C1901000070726F636564757265205661726961626C65
        334F6E43616C63287661722056616C75653A2056617269616E74293B0D0A6265
        67696E0D0A76616C7565203A3D20303B20200D0A202069662028506970655265
        6C4661745B27544F54414C524547275D203E205069706552656C4661745B2751
        54444D4553414E54275D2920616E640D0A2020202020285069706552656C4661
        745B275154444D4553414E54275D203E203029207468656E0D0A202020205661
        6C7565203A3D205069706552656C4661745B27544F54414C5F425255544F275D
        202D205069706552656C4661745B27544F54414C4D4553414E54275D0D0A2020
        656C73650D0A2020202056616C7565203A3D20303B20200D0A202020200D0A0D
        0A656E643B0D0A0D436F6D706F6E656E744E616D6506095661726961626C6533
        094576656E744E616D6506064F6E43616C63074576656E74494402210001060F
        5472614576656E7448616E646C65720B50726F6772616D4E616D65060F566172
        6961626C65344F6E43616C630B50726F6772616D54797065070B747450726F63
        656475726506536F7572636506EB70726F636564757265205661726961626C65
        344F6E43616C63287661722056616C75653A2056617269616E74293B0D0A6265
        67696E0D0A76616C7565203A3D20303B0D0A2020696620285069706552656C46
        61745B27544F54414C524547275D203C205069706552656C4661745B27515444
        4D4553414E54275D29207468656E0D0A2020202056616C7565203A3D20506970
        6552656C4661745B275154444D4553414E54275D202D205069706552656C4661
        745B27544F54414C524547275D200D0A2020656C73650D0A2020202056616C75
        65203A3D20303B20200D0A202020200D0A0D0A656E643B0D0A0D436F6D706F6E
        656E744E616D6506095661726961626C6534094576656E744E616D6506064F6E
        43616C63074576656E74494402210001060F5472614576656E7448616E646C65
        720B50726F6772616D4E616D65060F5661726961626C65354F6E43616C630B50
        726F6772616D54797065070B747450726F63656475726506536F7572636506ED
        70726F636564757265205661726961626C65354F6E43616C6328766172205661
        6C75653A2056617269616E74293B0D0A626567696E0D0A76616C7565203A3D20
        303B0D0A20206966205069706552656C4661745B27544F54414C524547275D20
        3C205069706552656C4661745B275154444D4553414E54275D207468656E0D0A
        2020202056616C7565203A3D205069706552656C4661745B27544F54414C4D45
        53414E54275D202D205069706552656C4661745B27544F54414C5F425255544F
        275D0D0A2020656C73650D0A2020202056616C7565203A3D20303B20200D0A20
        2020200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650609566172
        6961626C6535094576656E744E616D6506064F6E43616C63074576656E744944
        02210000}
    end
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 297
    Top = 50
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
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
    ValidateWithMask = True
    Left = 298
    Top = 98
  end
  object ppPipeFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'PipeFundacao'
    Left = 288
    Top = 8
    object ppPipeFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppPipeFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppPipeFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppPipeFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppPipeFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppPipeFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppPipeFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppPipeFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppPipeFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppPipeFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
end
