inherited dtmRelInscricao: TdtmRelInscricao
  Left = 455
  Top = 273
  Width = 180
  Height = 171
  Caption = 'dtmRelInscricao'
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
  object pplInscricao: TppBDEPipeline
    DataSource = dsInscricao
    UserName = 'lExemplo1'
    Left = 112
    Top = 80
    object pplInscricaoppField1: TppField
      FieldAlias = 'DEVEDOR'
      FieldName = 'DEVEDOR'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplInscricaoppField2: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object pplInscricaoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplInscricaoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSCRICAO'
      FieldName = 'INSCRICAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplInscricaoppField5: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object pplInscricaoppField6: TppField
      FieldAlias = 'DATASOLIC'
      FieldName = 'DATASOLIC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object pplInscricaoppField7: TppField
      FieldAlias = 'DATACREDITO'
      FieldName = 'DATACREDITO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object pplInscricaoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'TAXAJUROS'
      FieldName = 'TAXAJUROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplInscricaoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORSOLIC'
      FieldName = 'VALORSOLIC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplInscricaoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOEPANTERIOR'
      FieldName = 'SALDOEPANTERIOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplInscricaoppField11: TppField
      FieldAlias = 'ITEM'
      FieldName = 'ITEM'
      FieldLength = 50
      DisplayWidth = 50
      Position = 10
    end
    object pplInscricaoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORITEM'
      FieldName = 'VALORITEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplInscricaoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORLIQUIDO'
      FieldName = 'VALORLIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplInscricaoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMPARCELAS'
      FieldName = 'NUMPARCELAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplInscricaoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPARCELA'
      FieldName = 'VALORPARCELA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplInscricaoppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINSCRICAOEMPTMO'
      FieldName = 'IDINSCRICAOEMPTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
  end
  object dsInscricao: TwwDataSource
    DataSet = qryInscricao
    Left = 112
    Top = 68
  end
  object qryInscricao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '    0                                                    AS IDIN' +
        'SCRICAOEMPTMO,'
      
        '    '#39'                                                  '#39' AS DEVE' +
        'DOR,'
      
        '    '#39'                                                  '#39' AS EMPR' +
        'ESA,'
      
        '    0                                                    AS MATR' +
        'ICULA,'
      
        '    0                                                    AS INSC' +
        'RICAO,'
      
        '    '#39'                                                  '#39' AS SITU' +
        'ACAO,'
      
        '    '#39'          '#39'                                         AS DATA' +
        'SOLIC,'
      
        '    '#39'          '#39'                                         AS DATA' +
        'CREDITO,'
      
        '    0                                                    AS TAXA' +
        'JUROS,'
      
        '    0                                                    AS VALO' +
        'RSOLIC,'
      
        '    0                                                    AS SALD' +
        'OEPANTERIOR,'
      
        '    '#39'                                                  '#39' AS ITEM' +
        ','
      
        '    0                                                    AS VALO' +
        'RITEM,'
      
        '    0                                                    AS VALO' +
        'RLIQUIDO,'
      
        '    0                                                    AS NUMP' +
        'ARCELAS,'
      
        '    0                                                    AS VALO' +
        'RPARCELA'
      'FROM'
      '    DUAL'
      'WHERE 1 = 2'
      ''
      ' '
      ' '
      ' ')
    UpdateObject = UpdateInscricao
    ValidateWithMask = True
    Left = 112
    Top = 56
    object qryInscricaoDEVEDOR: TStringField
      FieldName = 'DEVEDOR'
      FixedChar = True
      Size = 50
    end
    object qryInscricaoEMPRESA: TStringField
      FieldName = 'EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qryInscricaoMATRICULA: TFloatField
      FieldName = 'MATRICULA'
    end
    object qryInscricaoINSCRICAO: TFloatField
      FieldName = 'INSCRICAO'
    end
    object qryInscricaoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 50
    end
    object qryInscricaoDATASOLIC: TStringField
      FieldName = 'DATASOLIC'
      FixedChar = True
      Size = 10
    end
    object qryInscricaoDATACREDITO: TStringField
      FieldName = 'DATACREDITO'
      FixedChar = True
      Size = 10
    end
    object qryInscricaoTAXAJUROS: TFloatField
      FieldName = 'TAXAJUROS'
    end
    object qryInscricaoVALORSOLIC: TFloatField
      FieldName = 'VALORSOLIC'
    end
    object qryInscricaoSALDOEPANTERIOR: TFloatField
      FieldName = 'SALDOEPANTERIOR'
    end
    object qryInscricaoITEM: TStringField
      FieldName = 'ITEM'
      FixedChar = True
      Size = 50
    end
    object qryInscricaoVALORITEM: TFloatField
      FieldName = 'VALORITEM'
    end
    object qryInscricaoVALORLIQUIDO: TFloatField
      FieldName = 'VALORLIQUIDO'
    end
    object qryInscricaoNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryInscricaoVALORPARCELA: TFloatField
      FieldName = 'VALORPARCELA'
    end
    object qryInscricaoIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
  end
  object rptInscricao: TppReport
    AutoStop = False
    DataPipeline = pplInscricao
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Análise Contábil'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    SavePrinterSetup = True
    Left = 112
    Top = 8
    Version = '5.5'
    mmColumnWidth = 183542
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26458
      mmPrintPosition = 0
      object ppLabel2: TppLabel
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
        mmLeft = 19050
        mmTop = 1058
        mmWidth = 145257
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'ITEM'
        DataPipeline = pplInscricao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 265
        mmWidth = 80698
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'VALORITEM'
        DataPipeline = pplInscricao
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 88371
        mmTop = 265
        mmWidth = 21167
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'DEVEDOR'
      DataPipeline = pplInscricao
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 55827
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          mmHeight = 6615
          mmLeft = 129382
          mmTop = 0
          mmWidth = 54240
          BandType = 3
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          DataField = 'IDINSCRICAOEMPTMO'
          DataPipeline = pplInscricao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 156898
          mmTop = 1058
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Nº INSCRIÇÃO:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 132557
          mmTop = 1058
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'I.QUALIFICAÇÃO DO DEVEDOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 529
          mmTop = 529
          mmWidth = 48948
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Nome do Devedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 529
          mmTop = 10054
          mmWidth = 27517
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Empresa / Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 88371
          mmTop = 10054
          mmWidth = 30692
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Inscrição Empresa / Situação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 120650
          mmTop = 10054
          mmWidth = 44979
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DEVEDOR'
          DataPipeline = pplInscricao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3969
          mmLeft = 529
          mmTop = 14817
          mmWidth = 80698
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'EMPRESA'
          DataPipeline = pplInscricao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 88371
          mmTop = 14817
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'MATRICULA'
          DataPipeline = pplInscricao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 105040
          mmTop = 14817
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'INSCRICAO'
          DataPipeline = pplInscricao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 120650
          mmTop = 14817
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'SITUACAO'
          DataPipeline = pplInscricao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 138377
          mmTop = 14817
          mmWidth = 44186
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Data da Solicitação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 529
          mmTop = 20373
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Data do Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 88371
          mmTop = 20373
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Taxa de Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 120650
          mmTop = 20373
          mmWidth = 21696
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'DATASOLIC'
          DataPipeline = pplInscricao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 3440
          mmTop = 25135
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          DataField = 'DATACREDITO'
          DataPipeline = pplInscricao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 88371
          mmTop = 25135
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          DataField = 'TAXAJUROS'
          DataPipeline = pplInscricao
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 120650
          mmTop = 25135
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Valor do Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 529
          mmTop = 40746
          mmWidth = 27252
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Valor Líquido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 88371
          mmTop = 40746
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label101'
          Caption = 'Nº Parc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 120650
          mmTop = 40746
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Valor Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 138113
          mmTop = 40746
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'VALORSOLIC'
          DataPipeline = pplInscricao
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 529
          mmTop = 45773
          mmWidth = 27252
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText101'
          DataField = 'VALORLIQUIDO'
          DataPipeline = pplInscricao
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 88371
          mmTop = 45773
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object ppDBText12: TppDBText
          UserName = 'DBText102'
          DataField = 'VALORPARCELA'
          DataPipeline = pplInscricao
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 138113
          mmTop = 45773
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppDBText13: TppDBText
          UserName = 'DBText103'
          DataField = 'NUMPARCELAS'
          DataPipeline = pplInscricao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 120650
          mmTop = 45773
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'Itens do Empréstimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 529
          mmTop = 51065
          mmWidth = 32015
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'II. CONDIÇÕES DO EMPRÉSTIMO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 529
          mmTop = 35454
          mmWidth = 51594
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
  object UpdateInscricao: TUpdateSQL
    InsertSQL.Strings = (
      'insert into DUAL'
      '  (IDINSCRICAOEMPTMO, DEVEDOR, EMPRESA, MATRICULA, INSCRICAO, '
      'SITUACAO, '
      
        '   DATASOLIC, DATACREDITO, TAXAJUROS, VALORSOLIC, SALDOEPANTERIO' +
        'R, '
      'ITEM, '
      '   VALORITEM, VALORLIQUIDO, NUMPARCELAS, VALORPARCELA)'
      'values'
      
        '  (:IDINSCRICAOEMPTMO, :DEVEDOR, :EMPRESA, :MATRICULA, :INSCRICA' +
        'O, '
      ':SITUACAO, '
      '   :DATASOLIC, :DATACREDITO, :TAXAJUROS, :VALORSOLIC, '
      ':SALDOEPANTERIOR, '
      
        '   :ITEM, :VALORITEM, :VALORLIQUIDO, :NUMPARCELAS, :VALORPARCELA' +
        ')')
    Left = 80
    Top = 104
  end
end
