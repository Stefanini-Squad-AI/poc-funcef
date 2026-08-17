inherited dtmRelInscricao: TdtmRelInscricao
  Left = 455
  Top = 273
  Width = 262
  Height = 157
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
    DataPipelineName = 'pplExemplo'
  end
  object pplInscricao: TppBDEPipeline
    DataSource = dsInscricao
    UserName = 'lExemplo1'
    Left = 112
    Top = 80
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
      
        '   '#39'                                                            ' +
        #39'     AS DEVEDOR,'
      
        '   '#39'                                                            ' +
        #39'     AS PATRO,'
      
        '   '#39'             '#39'                                              ' +
        '      AS MATRICULA,'
      
        '   1                                                            ' +
        '        AS INSCRICAONUMERO,'
      
        '   TO_DATE('#39'01/01/2000'#39', '#39'DD/MM/YYYY'#39')                          ' +
        '    AS DATASOLIC,'
      
        '   TO_DATE('#39'01/01/2000'#39', '#39'DD/MM/YYYY'#39')                          ' +
        '    AS DATACREDITO,'
      
        '   0.01                                                         ' +
        '        AS TAXAJUROS,'
      
        '   0.01                                                         ' +
        '        AS VALORSOLIC,'
      
        '   0.01                                                         ' +
        '        AS SALDOEPANTERIOR,'
      
        '   0.01                                                         ' +
        '        AS VALORLIQUIDO,'
      
        '   1                                                            ' +
        '        AS NUMPARCELAS,'
      
        '   0.01                                                         ' +
        '        AS VALORPARCELA,'
      
        '   1                                                            ' +
        '        AS IDINSCRICAOEMPTMO,'
      ''
      
        '   '#39'                                                            ' +
        '                            '#39'       AS ENDERECO,'
      
        '   '#39'                    '#39'                                       ' +
        '      AS BAIRRO,'
      
        '   '#39'                                        '#39'                   ' +
        '      AS CIDADE,'
      
        '   '#39'   '#39'                                                        ' +
        '      AS ESTADO,'
      
        '   '#39'         '#39'                                                  ' +
        '      AS CEP,'
      ''
      
        '   '#39'              '#39'                                             ' +
        '      AS CPF,'
      
        '   '#39'                                                  '#39'         ' +
        '      AS SIT_PART,'
      ''
      
        '   '#39'                                                            ' +
        #39'     AS BANCO,                '
      
        '   '#39'               '#39'                                            ' +
        '      AS NUMAGENCIA,           '
      
        '   '#39'               '#39'                                            ' +
        '      AS CONTA,                '
      
        '   '#39' '#39'                                                          ' +
        '      AS TIPOCONTA,            '
      ''
      
        '   TO_DATE('#39'01/01/2000'#39', '#39'DD/MM/YYYY'#39')                          ' +
        '      AS DATAPRIMPARC,'
      ''
      
        '   '#39'                                        '#39'                   ' +
        '      AS ITEM,'
      
        '   0.01                                                         ' +
        '      AS VLR_ITEM'
      ''
      'FROM'
      '   DUAL'
      ' '
      ' ')
    UpdateObject = updInscricao
    ValidateWithMask = True
    Left = 112
    Top = 56
    object qryInscricaoDEVEDOR: TStringField
      FieldName = 'DEVEDOR'
      FixedChar = True
      Size = 60
    end
    object qryInscricaoPATRO: TStringField
      FieldName = 'PATRO'
      FixedChar = True
      Size = 60
    end
    object qryInscricaoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 13
    end
    object qryInscricaoDATASOLIC: TDateTimeField
      FieldName = 'DATASOLIC'
    end
    object qryInscricaoDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
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
    object qryInscricaoENDERECO: TStringField
      FieldName = 'ENDERECO'
      FixedChar = True
      Size = 88
    end
    object qryInscricaoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      FixedChar = True
    end
    object qryInscricaoCIDADE: TStringField
      FieldName = 'CIDADE'
      FixedChar = True
      Size = 40
    end
    object qryInscricaoESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 3
    end
    object qryInscricaoCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 9
    end
    object qryInscricaoCPF: TStringField
      FieldName = 'CPF'
      FixedChar = True
      Size = 14
    end
    object qryInscricaoBANCO: TStringField
      FieldName = 'BANCO'
      FixedChar = True
      Size = 60
    end
    object qryInscricaoNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object qryInscricaoCONTA: TStringField
      FieldName = 'CONTA'
      FixedChar = True
      Size = 15
    end
    object qryInscricaoTIPOCONTA: TStringField
      FieldName = 'TIPOCONTA'
      FixedChar = True
      Size = 1
    end
    object qryInscricaoDATAPRIMPARC: TDateTimeField
      FieldName = 'DATAPRIMPARC'
    end
    object qryInscricaoITEM: TStringField
      FieldName = 'ITEM'
      FixedChar = True
      Size = 40
    end
    object qryInscricaoVLR_ITEM: TFloatField
      FieldName = 'VLR_ITEM'
    end
    object qryInscricaoINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryInscricaoSIT_PART: TStringField
      FieldName = 'SIT_PART'
      FixedChar = True
      Size = 50
    end
  end
  object rptInscricao: TppReport
    AutoStop = False
    DataPipeline = pplInscricao
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Seleção automática'
    PrinterSetup.DocumentName = 'Empréstimo - Análise Contábil'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = '\\cmapl\Lex_E120n_Desenv_Hotal'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\ProjetosCM5\Bin\INSCRICAO.rtm'
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    SavePrinterSetup = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 112
    Top = 8
    Version = '7.04'
    mmColumnWidth = 183542
    DataPipelineName = 'pplInscricao'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 52123
      mmPrintPosition = 0
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'ENDERECO'
        DataPipeline = pplInscricao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplInscricao'
        mmHeight = 3440
        mmLeft = 26194
        mmTop = 12965
        mmWidth = 84931
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'DEVEDOR'
        DataPipeline = pplInscricao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplInscricao'
        mmHeight = 4233
        mmLeft = 26194
        mmTop = 7408
        mmWidth = 89429
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'BAIRRO'
        DataPipeline = pplInscricao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplInscricao'
        mmHeight = 3440
        mmLeft = 26194
        mmTop = 17727
        mmWidth = 36513
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'ESTADO'
        DataPipeline = pplInscricao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplInscricao'
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 17727
        mmWidth = 9790
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'CIDADE'
        DataPipeline = pplInscricao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplInscricao'
        mmHeight = 3440
        mmLeft = 63765
        mmTop = 17727
        mmWidth = 36513
        BandType = 0
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Weight = 0.75
        mmHeight = 3175
        mmLeft = 175419
        mmTop = 51594
        mmWidth = 8202
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 51594
        mmWidth = 8202
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'CEP'
        DataPipeline = pplInscricao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplInscricao'
        mmHeight = 3440
        mmLeft = 26194
        mmTop = 21696
        mmWidth = 15346
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 14023
      mmPrintPosition = 0
      object ppRegion8: TppRegion
        Tag = 1
        UserName = 'Region8'
        mmHeight = 7408
        mmLeft = 0
        mmTop = 6615
        mmWidth = 183357
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppDBText23: TppDBText
          UserName = 'DBText23'
          DataField = 'ITEM'
          DataPipeline = pplInscricao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplInscricao'
          mmHeight = 3704
          mmLeft = 1323
          mmTop = 8467
          mmWidth = 76200
          BandType = 4
        end
        object ppDBText30: TppDBText
          UserName = 'DBText30'
          DataField = 'VLR_ITEM'
          DataPipeline = pplInscricao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInscricao'
          mmHeight = 3440
          mmLeft = 79375
          mmTop = 8467
          mmWidth = 15081
          BandType = 4
        end
      end
      object ppRegion9: TppRegion
        Tag = 1
        UserName = 'Region9'
        Brush.Color = clSilver
        mmHeight = 6879
        mmLeft = 0
        mmTop = 0
        mmWidth = 183621
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel14: TppLabel
          Tag = 1
          UserName = 'Label14'
          Caption = 'ITENS DE EMPRÉSTIMO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 76465
          mmTop = 1323
          mmWidth = 41010
          BandType = 4
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 12700
      mmPrintPosition = 0
      object ppLine22: TppLine
        UserName = 'Line22'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 11377
        mmWidth = 6615
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 177271
        mmTop = 12435
        mmWidth = 6615
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDINSCRICAOEMPTMO'
      DataPipeline = pplInscricao
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplInscricao'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 84138
        mmPrintPosition = 0
        object ppLabel2: TppLabel
          UserName = 'LblEmpresa1'
          Caption = 'PEDIDO DE CONCESSÃO DE EMPRÉSTIMO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 14
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5821
          mmLeft = 48683
          mmTop = 5821
          mmWidth = 103188
          BandType = 3
          GroupNo = 0
        end
        object ppRegion1: TppRegion
          UserName = 'Region1'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 5292
          mmLeft = 0
          mmTop = 25665
          mmWidth = 183621
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel1: TppLabel
            UserName = 'Label1'
            Caption = 'QUALIFICAÇÃO DO MUTUÁRIO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 4233
            mmLeft = 71173
            mmTop = 26459
            mmWidth = 53181
            BandType = 3
            GroupNo = 0
          end
          object ppLabel37: TppLabel
            UserName = 'Label37'
            AutoSize = False
            Caption = 'Nº INSCRIÇÃO:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 1588
            mmTop = 26459
            mmWidth = 22225
            BandType = 3
            GroupNo = 0
          end
          object ppDBText28: TppDBText
            UserName = 'DBText28'
            DataField = 'IDINSCRICAOEMPTMO'
            DataPipeline = pplInscricao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplInscricao'
            mmHeight = 3440
            mmLeft = 26194
            mmTop = 26459
            mmWidth = 15346
            BandType = 3
            GroupNo = 0
          end
        end
        object ppRegion2: TppRegion
          UserName = 'Region2'
          ParentWidth = True
          mmHeight = 28310
          mmLeft = 0
          mmTop = 30956
          mmWidth = 183621
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel4: TppLabel
            UserName = 'Label2'
            AutoSize = False
            Caption = 'NOME DO MUTÁRIO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 1058
            mmTop = 32279
            mmWidth = 27781
            BandType = 3
            GroupNo = 0
          end
          object ppLine2: TppLine
            UserName = 'Line1'
            Position = lpLeft
            Weight = 0.75
            mmHeight = 18256
            mmLeft = 112977
            mmTop = 31221
            mmWidth = 529
            BandType = 3
            GroupNo = 0
          end
          object ppLabel6: TppLabel
            UserName = 'Label4'
            AutoSize = False
            Caption = 'INSCRIÇÃO / SITUAÇÃO DO PARTICIPANTE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 3440
            mmLeft = 114829
            mmTop = 32279
            mmWidth = 68527
            BandType = 3
            GroupNo = 0
          end
          object ppLine3: TppLine
            UserName = 'Line3'
            ParentWidth = True
            Weight = 0.75
            mmHeight = 529
            mmLeft = 0
            mmTop = 40746
            mmWidth = 183621
            BandType = 3
            GroupNo = 0
          end
          object ppLine4: TppLine
            UserName = 'Line4'
            Position = lpLeft
            Weight = 0.75
            mmHeight = 18256
            mmLeft = 44450
            mmTop = 41011
            mmWidth = 529
            BandType = 3
            GroupNo = 0
          end
          object ppLabel5: TppLabel
            UserName = 'Label3'
            AutoSize = False
            Caption = 'BANCO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 1058
            mmTop = 50007
            mmWidth = 25400
            BandType = 3
            GroupNo = 0
          end
          object ppLine5: TppLine
            UserName = 'Line5'
            ParentWidth = True
            Weight = 0.75
            mmHeight = 265
            mmLeft = 0
            mmTop = 49213
            mmWidth = 183621
            BandType = 3
            GroupNo = 0
          end
          object ppLabel7: TppLabel
            UserName = 'Label5'
            AutoSize = False
            Caption = 'AGÊNCIA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 46302
            mmTop = 50007
            mmWidth = 29104
            BandType = 3
            GroupNo = 0
          end
          object ppLine6: TppLine
            UserName = 'Line6'
            Position = lpLeft
            Weight = 0.75
            mmHeight = 9525
            mmLeft = 105834
            mmTop = 49477
            mmWidth = 265
            BandType = 3
            GroupNo = 0
          end
          object ppLine7: TppLine
            UserName = 'Line7'
            Position = lpLeft
            Weight = 0.75
            mmHeight = 9260
            mmLeft = 152665
            mmTop = 49213
            mmWidth = 529
            BandType = 3
            GroupNo = 0
          end
          object ppLabel8: TppLabel
            UserName = 'Label6'
            AutoSize = False
            Caption = 'CONTA CORRENTE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 106363
            mmTop = 50007
            mmWidth = 38894
            BandType = 3
            GroupNo = 0
          end
          object ppLabel9: TppLabel
            UserName = 'Label7'
            AutoSize = False
            Caption = 'TIPO DE CONTA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 3440
            mmLeft = 154252
            mmTop = 50007
            mmWidth = 24871
            BandType = 3
            GroupNo = 0
          end
          object ppLabel34: TppLabel
            UserName = 'Label34'
            AutoSize = False
            Caption = 'CPF'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 1058
            mmTop = 41275
            mmWidth = 9790
            BandType = 3
            GroupNo = 0
          end
          object ppLabel33: TppLabel
            UserName = 'Label33'
            AutoSize = False
            Caption = 'EMPRESA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 45773
            mmTop = 41275
            mmWidth = 37306
            BandType = 3
            GroupNo = 0
          end
          object ppLabel3: TppLabel
            UserName = 'Label8'
            AutoSize = False
            Caption = 'MATRÍCULA EMPRESA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 115359
            mmTop = 41275
            mmWidth = 48419
            BandType = 3
            GroupNo = 0
          end
          object ppDBText1: TppDBText
            UserName = 'DBText1'
            DataField = 'DEVEDOR'
            DataPipeline = pplInscricao
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 7
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplInscricao'
            mmHeight = 2910
            mmLeft = 2910
            mmTop = 36777
            mmWidth = 107686
            BandType = 3
            GroupNo = 0
          end
          object ppDBText2: TppDBText
            UserName = 'DBText2'
            DataField = 'CPF'
            DataPipeline = pplInscricao
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 7
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplInscricao'
            mmHeight = 2910
            mmLeft = 3175
            mmTop = 45509
            mmWidth = 36513
            BandType = 3
            GroupNo = 0
          end
          object ppDBText3: TppDBText
            UserName = 'DBText3'
            DataField = 'MATRICULA'
            DataPipeline = pplInscricao
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 7
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplInscricao'
            mmHeight = 2910
            mmLeft = 117211
            mmTop = 45509
            mmWidth = 18521
            BandType = 3
            GroupNo = 0
          end
          object ppDBText4: TppDBText
            UserName = 'DBText4'
            DataField = 'INSCRICAO'
            DataPipeline = pplInscricao
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 7
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplInscricao'
            mmHeight = 2646
            mmLeft = 115623
            mmTop = 36777
            mmWidth = 22225
            BandType = 3
            GroupNo = 0
          end
          object ppDBText5: TppDBText
            UserName = 'DBText5'
            DataField = 'BANCO'
            DataPipeline = pplInscricao
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 7
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplInscricao'
            mmHeight = 2910
            mmLeft = 1588
            mmTop = 53711
            mmWidth = 40481
            BandType = 3
            GroupNo = 0
          end
          object ppDBText6: TppDBText
            UserName = 'DBText6'
            DataField = 'AGENCIA'
            DataPipeline = pplInscricao
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 7
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplInscricao'
            mmHeight = 2910
            mmLeft = 46038
            mmTop = 53711
            mmWidth = 56621
            BandType = 3
            GroupNo = 0
          end
          object ppDBText7: TppDBText
            UserName = 'DBText7'
            DataField = 'CONTA'
            DataPipeline = pplInscricao
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 7
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplInscricao'
            mmHeight = 2910
            mmLeft = 106363
            mmTop = 53711
            mmWidth = 38894
            BandType = 3
            GroupNo = 0
          end
          object ppDBText8: TppDBText
            UserName = 'DBText8'
            DataField = 'TIPOCONTA'
            DataPipeline = pplInscricao
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 7
            Font.Style = []
            TextAlignment = taCentered
            Transparent = True
            DataPipelineName = 'pplInscricao'
            mmHeight = 2910
            mmLeft = 154252
            mmTop = 53711
            mmWidth = 24871
            BandType = 3
            GroupNo = 0
          end
          object ppDBText16: TppDBText
            UserName = 'DBText16'
            DataField = 'EMPRESA'
            DataPipeline = pplInscricao
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 7
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplInscricao'
            mmHeight = 2910
            mmLeft = 46038
            mmTop = 45509
            mmWidth = 64029
            BandType = 3
            GroupNo = 0
          end
          object ppDBText15: TppDBText
            UserName = 'DBText15'
            DataField = 'SITUACAO'
            DataPipeline = pplInscricao
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 7
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplInscricao'
            mmHeight = 2646
            mmLeft = 140759
            mmTop = 36777
            mmWidth = 40481
            BandType = 3
            GroupNo = 0
          end
        end
        object ppRegion4: TppRegion
          UserName = 'Region4'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 5821
          mmLeft = 0
          mmTop = 59002
          mmWidth = 183621
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel10: TppLabel
            UserName = 'Label9'
            Caption = 'CONDIÇÕES DO EMPRÉSTIMO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 71702
            mmTop = 60061
            mmWidth = 52388
            BandType = 3
            GroupNo = 0
          end
        end
        object ppRegion3: TppRegion
          UserName = 'Region3'
          mmHeight = 19315
          mmLeft = 0
          mmTop = 64823
          mmWidth = 183621
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLine8: TppLine
            UserName = 'Line8'
            ParentWidth = True
            Weight = 0.75
            mmHeight = 265
            mmLeft = 0
            mmTop = 74877
            mmWidth = 183621
            BandType = 3
            GroupNo = 0
          end
          object ppLabel11: TppLabel
            UserName = 'Label10'
            AutoSize = False
            Caption = 'VALOR CONTRATO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 1323
            mmTop = 66146
            mmWidth = 28840
            BandType = 3
            GroupNo = 0
          end
          object ppLabel12: TppLabel
            UserName = 'Label101'
            AutoSize = False
            Caption = 'SALDO DO EP ANTERIOR(-)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 48419
            mmTop = 66146
            mmWidth = 37571
            BandType = 3
            GroupNo = 0
          end
          object ppLabel17: TppLabel
            UserName = 'Label17'
            AutoSize = False
            Caption = 'TAXA JUROS 1º PERÍODO(a.m)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 138113
            mmTop = 66146
            mmWidth = 42863
            BandType = 3
            GroupNo = 0
          end
          object ppLabel18: TppLabel
            UserName = 'Label18'
            AutoSize = False
            Caption = 'NÚMERO DE PARCELAS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 1323
            mmTop = 75936
            mmWidth = 32808
            BandType = 3
            GroupNo = 0
          end
          object ppLabel38: TppLabel
            UserName = 'Label38'
            AutoSize = False
            Caption = 'VALOR LÍQUIDO(=)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 48154
            mmTop = 75936
            mmWidth = 28840
            BandType = 3
            GroupNo = 0
          end
          object ppDBText10: TppDBText
            UserName = 'DBText10'
            DataField = 'VALORSOLIC'
            DataPipeline = pplInscricao
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 7
            Font.Style = []
            TextAlignment = taCentered
            Transparent = True
            DataPipelineName = 'pplInscricao'
            mmHeight = 2910
            mmLeft = 1323
            mmTop = 70644
            mmWidth = 28840
            BandType = 3
            GroupNo = 0
          end
          object ppDBText11: TppDBText
            UserName = 'DBText101'
            DataField = 'VALORLIQUIDO'
            DataPipeline = pplInscricao
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 7
            Font.Style = []
            TextAlignment = taCentered
            Transparent = True
            DataPipelineName = 'pplInscricao'
            mmHeight = 2910
            mmLeft = 48154
            mmTop = 80169
            mmWidth = 28840
            BandType = 3
            GroupNo = 0
          end
          object ppDBText12: TppDBText
            UserName = 'DBText102'
            DataField = 'SALDOEPANTERIOR'
            DataPipeline = pplInscricao
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 7
            Font.Style = []
            TextAlignment = taCentered
            Transparent = True
            DataPipelineName = 'pplInscricao'
            mmHeight = 2910
            mmLeft = 48419
            mmTop = 70644
            mmWidth = 37571
            BandType = 3
            GroupNo = 0
          end
          object ppDBText13: TppDBText
            UserName = 'DBText103'
            DataField = 'TAXAJUROS'
            DataPipeline = pplInscricao
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 7
            Font.Style = []
            TextAlignment = taCentered
            Transparent = True
            DataPipelineName = 'pplInscricao'
            mmHeight = 2910
            mmLeft = 137848
            mmTop = 70379
            mmWidth = 43127
            BandType = 3
            GroupNo = 0
          end
          object ppDBText14: TppDBText
            UserName = 'DBText14'
            DataField = 'NUMPARCELAS'
            DataPipeline = pplInscricao
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 7
            Font.Style = []
            TextAlignment = taCentered
            Transparent = True
            DataPipelineName = 'pplInscricao'
            mmHeight = 2910
            mmLeft = 1852
            mmTop = 80169
            mmWidth = 32808
            BandType = 3
            GroupNo = 0
          end
          object ppLabel15: TppLabel
            UserName = 'Label15'
            AutoSize = False
            Caption = 'TAXA ADMINISTRAÇÃO(-)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 94192
            mmTop = 66675
            mmWidth = 36777
            BandType = 3
            GroupNo = 0
          end
          object ppDBText27: TppDBText
            UserName = 'DBText27'
            DataField = 'VLRTXDEADM'
            DataPipeline = pplInscricao
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 7
            Font.Style = []
            TextAlignment = taCentered
            Transparent = True
            DataPipelineName = 'pplInscricao'
            mmHeight = 2910
            mmLeft = 94192
            mmTop = 71173
            mmWidth = 36777
            BandType = 3
            GroupNo = 0
          end
          object ppLine9: TppLine
            Tag = 1
            UserName = 'Line9'
            Position = lpLeft
            Weight = 0.75
            mmHeight = 9790
            mmLeft = 89694
            mmTop = 65088
            mmWidth = 529
            BandType = 3
            GroupNo = 0
          end
          object ppLine10: TppLine
            Tag = 1
            UserName = 'Line10'
            Position = lpLeft
            Weight = 0.75
            mmHeight = 9525
            mmLeft = 44186
            mmTop = 65617
            mmWidth = 265
            BandType = 3
            GroupNo = 0
          end
          object ppLine12: TppLine
            Tag = 1
            UserName = 'Line101'
            Position = lpLeft
            Weight = 0.75
            mmHeight = 9525
            mmLeft = 136525
            mmTop = 65352
            mmWidth = 265
            BandType = 3
            GroupNo = 0
          end
          object ppLine13: TppLine
            Tag = 1
            UserName = 'Line102'
            Position = lpLeft
            Weight = 0.75
            mmHeight = 8467
            mmLeft = 44186
            mmTop = 74877
            mmWidth = 529
            BandType = 3
            GroupNo = 0
          end
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 104511
        mmPrintPosition = 0
        object ppRegion7: TppRegion
          UserName = 'Region7'
          mmHeight = 26723
          mmLeft = 0
          mmTop = 76729
          mmWidth = 183621
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel22: TppLabel
            UserName = 'Label22'
            Caption = 'LOCAL E DATA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 1323
            mmTop = 77787
            mmWidth = 21167
            BandType = 5
            GroupNo = 0
          end
          object ppLine17: TppLine
            UserName = 'Line17'
            Weight = 0.75
            mmHeight = 265
            mmLeft = 14817
            mmTop = 95779
            mmWidth = 76465
            BandType = 5
            GroupNo = 0
          end
          object ppLine20: TppLine
            UserName = 'Line20'
            Weight = 0.75
            mmHeight = 265
            mmLeft = 105304
            mmTop = 96044
            mmWidth = 76465
            BandType = 5
            GroupNo = 0
          end
          object ppLabel24: TppLabel
            UserName = 'Label24'
            Caption = 'ASSINATURA DO MUTUÁRIO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 35190
            mmTop = 97631
            mmWidth = 39423
            BandType = 5
            GroupNo = 0
          end
          object ppLabel25: TppLabel
            UserName = 'Label25'
            Caption = 'ASSINATURA E CARIMBO DO ATENDENTE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 118534
            mmTop = 97631
            mmWidth = 58473
            BandType = 5
            GroupNo = 0
          end
          object ppLabel30: TppLabel
            UserName = 'Label30'
            Caption = 'Local,'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 1852
            mmTop = 84402
            mmWidth = 10054
            BandType = 5
            GroupNo = 0
          end
        end
        object ppRichText2: TppRichText
          UserName = 'RichText2'
          Caption = 'RichText2'
          RichText = 
            '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fc' +
            'harset0 MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\qc\f0\fs20 O MUTU\' +
            #39'c1RIO SOMENTE PODER\'#39'c1 DESISTIR DO PEDIDO DE EMPR\'#39'c9STIMO SE ' +
            'MANIFESTAR ESTA INTEN\'#39'c7\'#39'c3O ANTES DE SER CREDITADO O VALOR EM' +
            ' SUA CONTA CORRENTE OU NA SUA FOLHA DE  SAL\'#39'c1RIOS/BENEF\'#39'cdCIO' +
            'S.\par'#13#10'\par'#13#10'NO CASO DE DESLIGAMENTO DA PREVID\'#39'caNCIA A LIQUID' +
            'A\'#39'c7\'#39'c3O ANTECIPADA SER\'#39'c1 OBRIGAT\'#39'd3RIA.\par'#13#10'}'#13#10
          mmHeight = 17463
          mmLeft = 1588
          mmTop = 57679
          mmWidth = 180711
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
        end
        object ppRegion6: TppRegion
          UserName = 'Region6'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 7408
          mmLeft = 0
          mmTop = 48419
          mmWidth = 183621
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel21: TppLabel
            UserName = 'Label201'
            Caption = 'IMPORTANTE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 82815
            mmTop = 50007
            mmWidth = 23283
            BandType = 5
            GroupNo = 0
          end
          object ppShape1: TppShape
            UserName = 'Shape1'
            ParentWidth = True
            mmHeight = 21167
            mmLeft = 0
            mmTop = 55562
            mmWidth = 183621
            BandType = 5
            GroupNo = 0
          end
        end
        object ppRegion5: TppRegion
          UserName = 'Region5'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 48154
          mmLeft = 0
          mmTop = 0
          mmWidth = 183621
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel20: TppLabel
            UserName = 'Label20'
            Caption = 'DECLARAÇÃO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 82550
            mmTop = 530
            mmWidth = 25135
            BandType = 5
            GroupNo = 0
          end
          object ppShape2: TppShape
            UserName = 'Shape2'
            ParentWidth = True
            mmHeight = 44979
            mmLeft = 0
            mmTop = 4763
            mmWidth = 183621
            BandType = 5
            GroupNo = 0
          end
          object ppRichText1: TppRichText
            UserName = 'RichText1'
            Caption = 'RichText1'
            RichText = 
              '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fc' +
              'harset0 MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\f0\fs20 Declaro qu' +
              'e tenho conhecimento das condi\'#39'e7\'#39'f5es e das normas da Previd\' +
              #39'eancia para concess\'#39'e3o de Empr\'#39'e9stimo.\par'#13#10'\par'#13#10'Declaro a' +
              'inda estar ciente das condi\'#39'e7\'#39'f5es contratuais que se encontr' +
              'am registradas no ........, sob o n.\'#39'ba ....................., ' +
              'com as quais concordo e recebo nesta data.\par'#13#10'\par'#13#10'Declaro ta' +
              'mb\'#39'e9m estar e de acordo, que as parcelas mensais sejam descont' +
              'adas da folha de pagamento de minha empregadora, no caso de Part' +
              'icipante, ou da folha de benef\'#39'edcios da  Previd\'#39'eancia, no ca' +
              'so de Assistidos e Licenciados.\par'#13#10'\par'#13#10'Estou ciente que as p' +
              'arcelas que, por qualquer motivo, deixarem de ser descontadas so' +
              'bre as folhas acima citadas, dever\'#39'e3o ser recolhidas diretamen' +
              'te \'#39'e0 Previd\'#39'eancia.\fs16\par'#13#10'}'#13#10
            mmHeight = 39952
            mmLeft = 1058
            mmTop = 6085
            mmWidth = 181505
            BandType = 5
            GroupNo = 0
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
          end
        end
      end
    end
  end
  object updInscricao: TUpdateSQL
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
    Left = 192
    Top = 56
  end
end
