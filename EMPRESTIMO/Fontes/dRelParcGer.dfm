inherited dtmRelParcGer: TdtmRelParcGer
  Left = 455
  Top = 273
  Width = 180
  Height = 171
  Caption = 'dtmRelParcGer'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 24
    Top = 80
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
    Top = 56
  end
  inherited rpExemplo: TppReport
    Left = 24
    Top = 8
  end
  object rptParcGer: TppReport
    AutoStop = False
    DataPipeline = pplParcGer
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Parcelas Geradas por Mês'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 112
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand24: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 38365
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = 15263976
        ParentWidth = True
        mmHeight = 8202
        mmLeft = 0
        mmTop = 30163
        mmWidth = 183542
        BandType = 0
      end
      object LblTiTAdianto: TppLabel
        UserName = 'LblTiTAdianto'
        AutoSize = False
        Caption = 'Parcelas Geradas por Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8731
        mmWidth = 183621
        BandType = 0
      end
      object ppLabel1: TppLabel
        OnPrint = LblEmpresaPrint
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
        mmTop = 1588
        mmWidth = 183621
        BandType = 0
      end
      object ppLabel97: TppLabel
        UserName = 'ppLabel97'
        Caption = 'Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 34396
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel98: TppLabel
        UserName = 'ppLabel98'
        Caption = 'Mutuário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 37306
        mmTop = 34396
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel102: TppLabel
        UserName = 'ppLabel102'
        Caption = 'Nº'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 112448
        mmTop = 30956
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel105: TppLabel
        UserName = 'ppLabel105'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 127529
        mmTop = 30692
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel107: TppLabel
        UserName = 'ppLabel107'
        Caption = 'Forma de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 139965
        mmTop = 30956
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel109: TppLabel
        UserName = 'ppLabel109'
        Caption = 'Tx. de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 158486
        mmTop = 30956
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label1'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 175155
        mmTop = 30956
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Mês de Competência:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 794
        mmTop = 18521
        mmWidth = 29898
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Item:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 794
        mmTop = 23283
        mmWidth = 7938
        BandType = 0
      end
      object lblMesCompetencia: TppLabel
        UserName = 'Label6'
        Caption = 'janeiro / 2000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 30427
        mmTop = 18521
        mmWidth = 17992
        BandType = 0
      end
      object lblItemEmptmo: TppLabel
        UserName = 'Label7'
        Caption = '< Todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 8467
        mmTop = 23283
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label8'
        Caption = 'Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 159015
        mmTop = 34396
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label9'
        Caption = 'Devedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 171450
        mmTop = 34396
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Cobrança'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 139700
        mmTop = 34396
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Previsto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 123561
        mmTop = 34131
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 108215
        mmTop = 34396
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 19844
        mmTop = 34396
        mmWidth = 12171
        BandType = 0
      end
    end
    object ppDetalhe: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Color = clNone
        Pen.Style = psClear
        StretchWithParent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 183542
        BandType = 4
      end
      object ppLine3: TppLine
        OnPrint = ppLine3Print
        UserName = 'Line3'
        ParentHeight = True
        ParentWidth = True
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 183542
        BandType = 4
      end
      object ppDBNumContrato: TppDBText
        UserName = 'DBNumContrato'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplParcGer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 794
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOME'
        DataPipeline = pplParcGer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 37306
        mmTop = 794
        mmWidth = 68527
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PARCELA'
        DataPipeline = pplParcGer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 108744
        mmTop = 794
        mmWidth = 9260
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplParcGer
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 119856
        mmTop = 794
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'COBRANCA'
        DataPipeline = pplParcGer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 135202
        mmTop = 794
        mmWidth = 21960
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'TXJUROS'
        DataPipeline = pplParcGer
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 157957
        mmTop = 794
        mmWidth = 8467
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'SALDODEV'
        DataPipeline = pplParcGer
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 168011
        mmTop = 794
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'MATRICULA'
        DataPipeline = pplParcGer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 19844
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
    end
    object ppFooterBand24: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine45: TppLine
        UserName = 'ppLine45'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 183542
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 265
        mmTop = 3175
        mmWidth = 23019
        BandType = 8
      end
      object ppCalc43: TppSystemVariable
        UserName = 'Calc43'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 79904
        mmTop = 3175
        mmWidth = 23548
        BandType = 8
      end
      object ppCalc44: TppSystemVariable
        UserName = 'Calc44'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 157427
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 5821
        mmLeft = 104511
        mmTop = 3969
        mmWidth = 79111
        BandType = 7
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Pen.Width = 2
        mmHeight = 5821
        mmLeft = 3704
        mmTop = 4233
        mmWidth = 33602
        BandType = 7
      end
      object ppLabel9: TppLabel
        UserName = 'Label2'
        Caption = 'Total:  '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 94986
        mmTop = 5027
        mmWidth = 9260
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplParcGer
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 112713
        mmTop = 5027
        mmWidth = 21696
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplParcGer
        DisplayFormat = '#,0;-#,0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 3175
        mmLeft = 5027
        mmTop = 5292
        mmWidth = 15346
        BandType = 7
      end
      object ppLabel5: TppLabel
        UserName = 'Label3'
        Caption = 'Contratos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 20902
        mmTop = 5292
        mmWidth = 13229
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 183542
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'SALDODEV'
        DataPipeline = pplParcGer
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 160867
        mmTop = 5027
        mmWidth = 21696
        BandType = 7
      end
    end
  end
  object qryParcGer: TwwQuery
    BeforeOpen = qryParcGerBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ITE.ITEDESCRICAO AS ITEM,'
      '       HST.IDCONTRATOEMPTMO,'
      '       PE.NOME,'
      '       '#39'            '#39' AS MATRICULA,'
      '       (HST.HMEPARCELA || '#39' / '#39' || CTE.NUMPARCELAS) AS PARCELA,'
      '       HST.HMEVLRPREVISTO,'
      
        '       (DECODE(HST.HMEFORMACOBRANCA,'#39'F'#39','#39'Folha'#39','#39'Banco'#39')) AS COB' +
        'RANCA,'
      '       (DECODE(HST.FLGENVIO,NULL,'#39'Sim'#39','#39#39')) AS ENVIADO,'
      '       (DECODE(HST.FLGBAIXADO,NULL,'#39'Sim'#39','#39#39')) AS RECEBIDO,'
      
        '       (DECODE(HST.HMECENTRALIZA,1,HST.HMETXJUROS,'#39#39')) AS TXJURO' +
        'S,'
      
        '       (DECODE(HST.HMECENTRALIZA,1,HST.HMESALDODEV,'#39#39')) AS SALDO' +
        'DEV,'
      
        '       (DECODE(HST.HMECENTRALIZA,1,'#39#39',HST.PLNCODIGO)) AS PLANILH' +
        'A,'
      '       HST.HMEANOCOMPETENCIA, HST.HMEMESCOMPETENCIA'
      ''
      
        'FROM PESSOA PE, HISTMOVEMPTMO HST, CONTRATOEMPTMO CTE, ITEMEMPTM' +
        'O ITE, TIPOCONTREMPTMO TCT'
      ''
      'WHERE ( HST.IDCONTRATOEMPTMO = CTE.IDCONTRATOEMPTMO) AND'
      '      ( CTE.IDTIPOCONTREMPTMO = TCT.IDTIPOCONTREMPTMO) AND'
      '      ( HST.IDITEMEMPTMO = ITE.IDITEMEMPTMO ) AND'
      '      ( CTE.IDPESSOA = PE.IDPESSOA(+) ) AND'
      '      ( HST.HMETIPOMOV = 1     ) AND'
      
        '      ( ( HST.FLGESTORNADO IS NULL) OR (HST.FLGESTORNADO = 0) ) ' +
        'AND'
      '      ( HST.HMESEQCOBRANCA = 1 ) AND'
      '      ( HST.HMECENTRALIZA = 1 ) AND'
      '      ( HST.HMEANOCOMPETENCIA = :pANOCOMP ) AND'
      '      ( HST.HMEMESCOMPETENCIA = :pMESCOMP )'
      ''
      
        'ORDER BY DECODE(:pORDEM,1,PE.NOME,HST.IDCONTRATOEMPTMO), HST.HME' +
        'CENTRALIZA DESC, HST.IDITEMEMPTMO')
    ValidateWithMask = True
    Left = 112
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pANOCOMP'
        ParamType = ptInput
        Value = 2001
      end
      item
        DataType = ftInteger
        Name = 'pMESCOMP'
        ParamType = ptInput
        Value = 10
      end
      item
        DataType = ftInteger
        Name = 'pORDEM'
        ParamType = ptInput
        Value = '1'
      end>
    object qryParcGerITEM: TStringField
      FieldName = 'ITEM'
      Size = 40
    end
    object qryParcGerIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryParcGerNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryParcGerPARCELA: TStringField
      FieldName = 'PARCELA'
      Size = 81
    end
    object qryParcGerHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryParcGerCOBRANCA: TStringField
      FieldName = 'COBRANCA'
      Size = 5
    end
    object qryParcGerENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 3
    end
    object qryParcGerRECEBIDO: TStringField
      FieldName = 'RECEBIDO'
      Size = 3
    end
    object qryParcGerTXJUROS: TFloatField
      FieldName = 'TXJUROS'
    end
    object qryParcGerSALDODEV: TFloatField
      FieldName = 'SALDODEV'
    end
    object qryParcGerPLANILHA: TStringField
      FieldName = 'PLANILHA'
      Size = 40
    end
    object qryParcGerHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryParcGerHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryParcGerMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 12
    end
  end
  object dtsParcGer: TwwDataSource
    DataSet = qryParcGer
    Left = 112
    Top = 68
  end
  object pplParcGer: TppDBPipeline
    DataSource = dtsParcGer
    CloseDataSource = True
    UserName = 'lParcGer'
    Left = 112
    Top = 56
  end
end
