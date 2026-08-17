inherited dtmRelValsRecebPatro: TdtmRelValsRecebPatro
  Left = 405
  Top = 178
  Width = 373
  Height = 245
  Caption = 'dtmRelValsRecebPatro'
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
  object qryRelValRecebPatro: TwwQuery
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT '
      '  PATRO.NOME,'
      '  H.MESCOBRANCA,'
      '  RECEBIDOS.MESCOBRANCA,'
      '  SUM(H.VALORRECEBIDO) AS TOTALRECEBIDO,'
      '  NVL(RECEBIDOS.QTDREC, 0) AS QTDREC,'
      '  SUM(H.VALORESPERADO) AS TOTALESPERADO,'
      '  COUNT(*) AS QTDTOTAL'
      
        'FROM HSTCONTRIBASS H, PESSOA PATRO , (SELECT COUNT(*) AS QTDREC,' +
        ' MESCOBRANCA, IDPESSJUR FROM HSTCONTRIBASS '
      #9#9#9#9'           WHERE VALORRECEBIDO IS NOT NULL AND '
      
        '                                             VALORRECEBIDO > 0 A' +
        'ND '
      
        '                                             MESCOBRANCA = '#39'2003' +
        '/05'#39' AND'
      '                                             SITRECEBIMENTO > 2'
      
        '                                             GROUP BY MESCOBRANC' +
        'A, IDPESSJUR) RECEBIDOS'
      '  '
      'WHERE H.MESCOBRANCA = '#39'2003/05'#39' AND'
      '      H.MESCOBRANCA = RECEBIDOS.MESCOBRANCA(+) AND'
      '      H.IDPESSJUR   = RECEBIDOS.IDPESSJUR(+)   AND '
      '      H.IDPESSJUR   = PATRO.IDPESSOA'
      'AND   1 = 2'
      
        'GROUP BY PATRO.NOME, H.MESCOBRANCA, RECEBIDOS.QTDREC, RECEBIDOS.' +
        'MESCOBRANCA'
      'ORDER BY H.MESCOBRANCA DESC, PATRO.NOME ASC'
      '  ')
    ValidateWithMask = True
    Left = 48
    Top = 80
  end
  object DsValRecebPatro: TwwDataSource
    DataSet = qryRelValRecebPatro
    Left = 128
    Top = 96
  end
  object ppDBPipeValRecebPatro: TppDBPipeline
    DataSource = DsValRecebPatro
    UserName = 'DBPipeValRecebPatro'
    Left = 192
    Top = 112
    object ppDBPipeValRecebPatroppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeValRecebPatroppField2: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 1
    end
    object ppDBPipeValRecebPatroppField3: TppField
      FieldAlias = 'MESCOBRANCA_1'
      FieldName = 'MESCOBRANCA_1'
      FieldLength = 7
      DisplayWidth = 7
      Position = 2
    end
    object ppDBPipeValRecebPatroppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALRECEBIDO'
      FieldName = 'TOTALRECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPipeValRecebPatroppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDREC'
      FieldName = 'QTDREC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPipeValRecebPatroppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALESPERADO'
      FieldName = 'TOTALESPERADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDBPipeValRecebPatroppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDTOTAL'
      FieldName = 'QTDTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object ppReportValRecebPatro: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeValRecebPatro
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
    Left = 280
    Top = 128
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 44979
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 3969
        mmLeft = 12700
        mmTop = 41010
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Mês de Cobrança'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 3969
        mmLeft = 101600
        mmTop = 41010
        mmWidth = 26458
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Quant. Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 3969
        mmLeft = 136525
        mmTop = 41010
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Valor Esperado Total R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 3969
        mmLeft = 159544
        mmTop = 41010
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Quant. Recebido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 3969
        mmLeft = 200290
        mmTop = 41010
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Valor RecebidoTotal R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 3969
        mmLeft = 229394
        mmTop = 41010
        mmWidth = 33867
        BandType = 0
      end
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
      object ppDBText9: TppDBText
        UserName = 'DBText9'
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
      object ppDBText10: TppDBText
        UserName = 'DBText10'
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
      object ppDBText11: TppDBText
        UserName = 'DBText11'
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
      object ppDBText12: TppDBText
        UserName = 'DBText12'
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
      object ppDBText13: TppDBText
        UserName = 'DBText13'
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
      object ppDBText14: TppDBText
        UserName = 'DBText14'
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
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 40217
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label8'
        Caption = 'Demonstrativo de Valores Calculados X Recebidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 5292
        mmLeft = 94986
        mmTop = 32015
        mmWidth = 102923
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppShape1: TppShape
        OnPrint = ppShape1Print
        UserName = 'Shape1'
        Pen.Style = psClear
        mmHeight = 3440
        mmLeft = 265
        mmTop = 0
        mmWidth = 284428
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'QTDTOTAL'
        DataPipeline = ppDBPipeValRecebPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 136525
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'TOTALESPERADO'
        DataPipeline = ppDBPipeValRecebPatro
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 164308
        mmTop = 0
        mmWidth = 29633
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'QTDREC'
        DataPipeline = ppDBPipeValRecebPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 200290
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'TOTALRECEBIDO'
        DataPipeline = ppDBPipeValRecebPatro
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 233363
        mmTop = 0
        mmWidth = 29633
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MESCOBRANCA'
        DataPipeline = ppDBPipeValRecebPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 0
        mmWidth = 25929
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NOME'
        DataPipeline = ppDBPipeValRecebPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 12435
        mmTop = 0
        mmWidth = 84402
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel1: TppLabel
        OnPrint = LblSistemaPrint
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
        mmTop = 3175
        mmWidth = 284163
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
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
        mmLeft = 257969
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppLabel8: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Totais Gerais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 107421
        mmTop = 2117
        mmWidth = 19844
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'QTDTOTAL'
        DataPipeline = ppDBPipeValRecebPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 136525
        mmTop = 2116
        mmWidth = 16669
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 136525
        mmTop = 794
        mmWidth = 17727
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 164308
        mmTop = 794
        mmWidth = 30691
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'TOTALESPERADO'
        DataPipeline = ppDBPipeValRecebPatro
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 164308
        mmTop = 2117
        mmWidth = 29633
        BandType = 7
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 200290
        mmTop = 794
        mmWidth = 24077
        BandType = 7
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 233363
        mmTop = 794
        mmWidth = 30691
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'QTDREC'
        DataPipeline = ppDBPipeValRecebPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 200290
        mmTop = 2117
        mmWidth = 23019
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'TOTALRECEBIDO'
        DataPipeline = ppDBPipeValRecebPatro
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 233363
        mmTop = 2117
        mmWidth = 29633
        BandType = 7
      end
    end
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
    Left = 322
    Top = 90
  end
end
