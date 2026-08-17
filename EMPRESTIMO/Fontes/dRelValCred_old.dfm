inherited dtmRelValCred_old: TdtmRelValCred_old
  Left = 275
  Top = 223
  Width = 172
  Height = 157
  Caption = 'dRelValCred'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 24
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
    Left = 24
    Top = 68
  end
  inherited qryExemplo: TwwQuery
    Left = 24
    Top = 80
  end
  inherited rpExemplo: TppReport
    Left = 24
    Top = 8
  end
  object pplValCred: TppBDEPipeline
    DataSource = dtsValCred
    OpenDataSource = False
    UserName = 'lExemplo1'
    Left = 104
    Top = 56
    object pplValCredppField1: TppField
      FieldAlias = 'FLGFORMAPAG'
      FieldName = 'FLGFORMAPAG'
      FieldLength = 18
      DisplayWidth = 18
      Position = 0
    end
    object pplValCredppField2: TppField
      FieldAlias = 'DATACREDITO'
      FieldName = 'DATACREDITO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object pplValCredppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PORTFORMAPAG'
      FieldName = 'PORTFORMAPAG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplValCredppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODFORMAPAG'
      FieldName = 'CODFORMAPAG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplValCredppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOEMPTMO'
      FieldName = 'IDCONTRATOEMPTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplValCredppField6: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 5
    end
    object pplValCredppField7: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object pplValCredppField8: TppField
      FieldAlias = 'NUMBANCO'
      FieldName = 'NUMBANCO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
    object pplValCredppField9: TppField
      FieldAlias = 'NUMAGENCIA'
      FieldName = 'NUMAGENCIA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 8
    end
    object pplValCredppField10: TppField
      FieldAlias = 'CONTACORRENTE'
      FieldName = 'CONTACORRENTE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 9
    end
    object pplValCredppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEVLRPREVISTO'
      FieldName = 'HMEVLRPREVISTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
  end
  object dtsValCred: TwwDataSource
    AutoEdit = False
    DataSet = qryValCred
    Left = 104
    Top = 68
  end
  object qryValCred: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  DECODE(FLGFORMAPAG, '#39'F'#39', '#39'FOLHA DE PAGAMENTO'#39', '#39'CAPCAR'#39') AS FL' +
        'GFORMAPAG,'
      '  DATACREDITO,'
      '  CON.PORTFORMAPAG,'
      '  CON.CODFORMAPAG,'
      '  CON.IDCONTRATOEMPTMO,'
      '  CON.MATRICULA,'
      '  PFO.DESCRICAO,'
      '  BAN.NUMBANCO,'
      '  AGE.NUMAGENCIA,'
      '  CBA.CONTACORRENTE,'
      '  HME.HMEVLRPREVISTO'
      'FROM'
      '  HISTMOVEMPTMO     HME,'
      '  VWCONTRATOEP      CON,'
      '  CONTABANCARIA     CBA,'
      '  AGENCIABANCARIA   AGE,'
      '  BANCO             BAN,'
      '  FORMARECPAG       FRP,'
      '  PORTADORFORMA     PFO'
      'WHERE'
      '      ( CON.IDCONTRATOEMPTMO    = 0 )'
      '  AND ( HME.HMECENTRALIZA       = 1 )'
      '  AND ( HME.HMETIPOMOV          = 0 )'
      '  AND ( HME.HMERECPAG           = '#39'P'#39' )'
      '  AND ( CON.IDCBANCARIA         = CBA.IDCBANCARIA(+) )'
      '  AND ( CBA.IDAGENCIA           = AGE.IDPESSOA(+) )'
      '  AND ( AGE.IDBANCO             = BAN.IDPESSOA(+) )'
      '  AND ( CON.IDCONTRATOEMPTMO    = HME.IDCONTRATOEMPTMO )'
      '  AND ( CON.PORTFORMAPAG        = PFO.CODPORTFORMA(+) )'
      '  AND ( CON.CODFORMAPAG         = FRP.CODFORMA(+) )'
      'ORDER BY'
      
        '  FLGFORMAPAG, DATACREDITO, CON.PORTFORMAPAG, CON.CODFORMAPAG, C' +
        'ON.NOME')
    ValidateWithMask = True
    Left = 104
    Top = 80
    object qryValCredFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      Size = 18
    end
    object qryValCredDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryValCredPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object qryValCredCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object qryValCredIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryValCredMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryValCredDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryValCredNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryValCredNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object qryValCredCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qryValCredHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
  end
  object rptValCred: TppReport
    AutoStop = False
    DataPipeline = pplValCred
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Valores Creditados'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\ProjetosCM5\Emprestimo\Relatórios\Val.creditar 3.rtm'
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 104
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33602
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Valores a Creditar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 265
        mmTop = 8731
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
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
        mmTop = 794
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Período de Datas:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 265
        mmTop = 18521
        mmWidth = 25665
        BandType = 0
      end
      object rptValCred_lblDataIni: TppLabel
        UserName = 'rptValCred_lblDataIni'
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 29104
        mmTop = 18521
        mmWidth = 13758
        BandType = 0
      end
      object rptValCred_lblDataFim: TppLabel
        UserName = 'rptValCred_DataIni1'
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 49477
        mmTop = 18521
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label9'
        Caption = '  a  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 43921
        mmTop = 18521
        mmWidth = 4498
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Forma de Crédito:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 265
        mmTop = 22754
        mmWidth = 26194
        BandType = 0
      end
      object rptValCred_lblFormaCred: TppLabel
        UserName = 'rptValCred_DataIni2'
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 29104
        mmTop = 22754
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Situação do Titular:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 265
        mmTop = 26988
        mmWidth = 27517
        BandType = 0
      end
      object rptValCred_lblSitPart: TppLabel
        UserName = 'rptValCred_lblSitPart'
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 29104
        mmTop = 26988
        mmWidth = 13758
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppLine1: TppLine
        OnPrint = ppLine1Print
        UserName = 'Line1'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object rptValCredShapeDet: TppShape
        OnPrint = rptValCredShapeDetPrint
        UserName = 'rptValCredShapeDet'
        Brush.Color = 13040076
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplValCred
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'NOME'
        DataPipeline = pplValCred
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 38365
        mmTop = 529
        mmWidth = 68792
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'NUMBANCO'
        DataPipeline = pplValCred
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 108479
        mmTop = 529
        mmWidth = 9260
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'NUMAGENCIA'
        DataPipeline = pplValCred
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 118534
        mmTop = 529
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'CONTACORRENTE'
        DataPipeline = pplValCred
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 128588
        mmTop = 529
        mmWidth = 28046
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplValCred
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 165100
        mmTop = 529
        mmWidth = 31750
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText101'
        DataField = 'MATRICULA'
        DataPipeline = pplValCred
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 22225
        mmTop = 529
        mmWidth = 13758
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'LblSistema'
        Caption = 'Empréstimos - Valor a Creditar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 265
        mmTop = 3175
        mmWidth = 40746
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 71173
        mmTop = 3175
        mmWidth = 54769
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170392
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'FLGFORMAPAG'
      DataPipeline = pplValCred
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 1588
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          Brush.Color = clSilver
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 5292
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Total '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 3175
          mmTop = 794
          mmWidth = 7408
          BandType = 5
          GroupNo = 0
        end
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          DataField = 'FLGFORMAPAG'
          DataPipeline = pplValCred
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 14023
          mmTop = 794
          mmWidth = 47890
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'HMEVLRPREVISTO'
          DataPipeline = pplValCred
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 165100
          mmTop = 794
          mmWidth = 31485
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DATACREDITO'
      DataPipeline = pplValCred
      KeepTogether = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 5821
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'DATACREDITO'
          DataPipeline = pplValCred
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 35983
          mmTop = 265
          mmWidth = 26988
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          Caption = 'Data do Crédito'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5292
          mmLeft = 3175
          mmTop = 265
          mmWidth = 31750
          BandType = 3
          GroupNo = 1
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'CODFORMAPAG'
          DataPipeline = pplValCred
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          Visible = False
          mmHeight = 5027
          mmLeft = 64294
          mmTop = 265
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'PORTFORMAPAG'
          DataPipeline = pplValCred
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          Visible = False
          mmHeight = 5027
          mmLeft = 79904
          mmTop = 265
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'HMEVLRPREVISTO'
          DataPipeline = pplValCred
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 165100
          mmTop = 1058
          mmWidth = 31485
          BandType = 5
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label6'
          Caption = 'Total na Data : '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 1588
          mmWidth = 20373
          BandType = 5
          GroupNo = 1
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'DATACREDITO'
          DataPipeline = pplValCred
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 21960
          mmTop = 1588
          mmWidth = 16404
          BandType = 5
          GroupNo = 1
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 1058
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 5292
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'CODFORMAPAG'
      DataPipeline = pplValCred
      KeepTogether = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand3BeforePrint
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLabel5: TppLabel
          UserName = 'Label2'
          Caption = 'Nº do Contrato'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 1058
          mmTop = 2910
          mmWidth = 19579
          BandType = 3
          GroupNo = 2
        end
        object ppLabel6: TppLabel
          UserName = 'Label3'
          Caption = 'Beneficiário'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 38629
          mmTop = 2910
          mmWidth = 15875
          BandType = 3
          GroupNo = 2
        end
        object ppLabel7: TppLabel
          UserName = 'Label4'
          Caption = 'Dados Bancários'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 126207
          mmTop = 2910
          mmWidth = 23019
          BandType = 3
          GroupNo = 2
        end
        object ppLabel8: TppLabel
          UserName = 'Label5'
          Caption = 'Valor a Creditar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 170392
          mmTop = 2910
          mmWidth = 25400
          BandType = 3
          GroupNo = 2
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6085
          mmWidth = 197300
          BandType = 3
          GroupNo = 2
        end
        object ppLabel11: TppLabel
          UserName = 'Label7'
          Caption = 'Matrícula'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 23548
          mmTop = 2910
          mmWidth = 12171
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'PORTFORMAPAG'
      DataPipeline = pplValCred
      KeepTogether = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
end
