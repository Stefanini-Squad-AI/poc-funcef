inherited dtmRelItensEnvioCapCarPP: TdtmRelItensEnvioCapCarPP
  Left = 364
  Top = 238
  Width = 241
  Height = 161
  Caption = 'dtmRelItensEnvioCapCarPP'
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
  object qryItensEnvioCapCarPP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   1234567890                          AS CODDOCUMENTO,'
      '   30000000325648                      AS NODOCUMENTO,'
      '   '#39'000'#39'                               AS COMPLDOCUMENTO,'
      '   '#39'30000000325648 / 001'#39'              AS NODOCUMENTO_COMPL,'
      '   '#39'A Receber'#39'                         AS REC_PAG,'
      '   '#39'A Receber - 01/01/1980'#39'            AS REC_PAG_DATA,'
      ''
      '   TO_DATE('#39'01/01/1980'#39', '#39'DD/MM/YYYY'#39') AS DATA_REF,'
      ''
      '   30000000658745                      AS IDCONTRATOEMPTMO,'
      '   30000000658745                      AS IDHISTMOVEMPTMO,'
      ''
      '   '#39'1234567890123'#39'                     AS MATRICULA,'
      '   123456789123                        AS INSCRICAONUMERO,'
      ''
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790'#39' AS NOME_PLANO,'
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790'#39' AS NOME_PATRO,'
      ''
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790 / 1234567879012345678790123456787901234567879012345678790' +
        '12345678790'#39' AS NOME_PLANOPATRO,'
      ''
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790'#39' AS TCEDESCRICAO,'
      ''
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790'#39' AS NOME_MUTUARIO,'
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790'#39' AS SIT_PART,'
      ''
      '   '#39'12345678790123456787901234567879012345'#39'  AS EVENTO,'
      '   '#39'12345678790123456787901234567879012345'#39'  AS ORIGEM,'
      ''
      '   '#39'00 / 00 / 00'#39' AS PARCELA,'
      ''
      '   999999.00 AS HMEVLRPREVISTO,'
      '   999999.00 AS HMEVLREFETIVO,'
      '   999999.00 AS VLRNAORECEBIDO'
      ''
      'FROM'
      '   DUAL')
    ValidateWithMask = True
    Left = 136
    Top = 56
    object qryItensEnvioCapCarPPCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryItensEnvioCapCarPPNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object qryItensEnvioCapCarPPCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object qryItensEnvioCapCarPPNODOCUMENTO_COMPL: TStringField
      FieldName = 'NODOCUMENTO_COMPL'
      FixedChar = True
    end
    object qryItensEnvioCapCarPPREC_PAG: TStringField
      FieldName = 'REC_PAG'
      FixedChar = True
      Size = 9
    end
    object qryItensEnvioCapCarPPREC_PAG_DATA: TStringField
      FieldName = 'REC_PAG_DATA'
      FixedChar = True
      Size = 22
    end
    object qryItensEnvioCapCarPPDATA_REF: TDateTimeField
      FieldName = 'DATA_REF'
    end
    object qryItensEnvioCapCarPPIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryItensEnvioCapCarPPIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryItensEnvioCapCarPPMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 13
    end
    object qryItensEnvioCapCarPPINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryItensEnvioCapCarPPNOME_PLANO: TStringField
      FieldName = 'NOME_PLANO'
      FixedChar = True
      Size = 66
    end
    object qryItensEnvioCapCarPPNOME_PATRO: TStringField
      FieldName = 'NOME_PATRO'
      FixedChar = True
      Size = 66
    end
    object qryItensEnvioCapCarPPNOME_PLANOPATRO: TStringField
      FieldName = 'NOME_PLANOPATRO'
      FixedChar = True
      Size = 135
    end
    object qryItensEnvioCapCarPPTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      FixedChar = True
      Size = 66
    end
    object qryItensEnvioCapCarPPNOME_MUTUARIO: TStringField
      FieldName = 'NOME_MUTUARIO'
      FixedChar = True
      Size = 66
    end
    object qryItensEnvioCapCarPPSIT_PART: TStringField
      FieldName = 'SIT_PART'
      FixedChar = True
      Size = 66
    end
    object qryItensEnvioCapCarPPHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryItensEnvioCapCarPPHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryItensEnvioCapCarPPVLRNAORECEBIDO: TFloatField
      FieldName = 'VLRNAORECEBIDO'
    end
    object qryItensEnvioCapCarPPEVENTO: TStringField
      FieldName = 'EVENTO'
      FixedChar = True
      Size = 38
    end
    object qryItensEnvioCapCarPPORIGEM: TStringField
      FieldName = 'ORIGEM'
      FixedChar = True
      Size = 38
    end
    object qryItensEnvioCapCarPPPARCELA: TStringField
      FieldName = 'PARCELA'
      FixedChar = True
      Size = 8
    end
  end
  object pplItensEnvioCapCarPP: TppBDEPipeline
    DataSource = dtsItensEnvioCapCarPP
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lExemplo1'
    Left = 136
    Top = 68
  end
  object dtsItensEnvioCapCarPP: TwwDataSource
    DataSet = qryItensEnvioCapCarPP
    Left = 136
    Top = 80
  end
  object rptItensEnvioCapCarPP: TppReport
    AutoStop = False
    DataPipeline = pplItensEnvioCapCarPP
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Valores a Receber - Folha(s)'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 136
    Top = 8
    Version = '5.5'
    mmColumnWidth = 284300
    object ppHeaderBand1: TppHeaderBand
      BeforePrint = ppHeaderBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 45773
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 
          'Valores Enviados / Recebidos (Financeiro) - por Plano e Patrocin' +
          'adora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 53446
        mmTop = 8731
        mmWidth = 163777
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Período de Datas:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 529
        mmTop = 21431
        mmWidth = 28046
        BandType = 0
      end
      object lblDataIni: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 28310
        mmTop = 21431
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Label4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 53446
        mmTop = 2117
        mmWidth = 163777
        BandType = 0
      end
      object lblDataFim: TppLabel
        UserName = 'lblDataFim'
        AutoSize = False
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 47625
        mmTop = 21431
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = '  a  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 43127
        mmTop = 21431
        mmWidth = 4763
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = 'Evento:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 529
        mmTop = 26458
        mmWidth = 28046
        BandType = 0
      end
      object lblEvento: TppLabel
        UserName = 'lblEvento'
        Caption = '< todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 28310
        mmTop = 26458
        mmWidth = 11906
        BandType = 0
      end
      object lblValorAbsoluto: TppLabel
        UserName = 'lblValorAbsoluto'
        Caption = 'Valores negativos exibidos como positivos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 529
        mmTop = 32544
        mmWidth = 58208
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Participantes cedidos considerados na Patrocinadora "original"'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 529
        mmTop = 37835
        mmWidth = 86254
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppLine4: TppLine
        OnPrint = ppLine4Print
        UserName = 'Line4'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        BlankWhenZero = True
        DataField = 'VLRNAORECEBIDO'
        DataPipeline = pplItensEnvioCapCarPP
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 242094
        mmTop = 794
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'HMEVLREFETIVO'
        DataPipeline = pplItensEnvioCapCarPP
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 227542
        mmTop = 794
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplItensEnvioCapCarPP
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 212990
        mmTop = 794
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplItensEnvioCapCarPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 794
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CODDOCUMENTO'
        DataPipeline = pplItensEnvioCapCarPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 256646
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'NOME_MUTUARIO'
        DataPipeline = pplItensEnvioCapCarPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 40217
        mmTop = 794
        mmWidth = 44979
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'MATRICULA'
        DataPipeline = pplItensEnvioCapCarPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 21167
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'TCEDESCRICAO'
        DataPipeline = pplItensEnvioCapCarPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 89165
        mmTop = 794
        mmWidth = 59531
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'EVENTO'
        DataPipeline = pplItensEnvioCapCarPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 152665
        mmTop = 794
        mmWidth = 39952
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'PARCELA'
        DataPipeline = pplItensEnvioCapCarPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 195527
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 12700
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema1'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 1852
        mmWidth = 25665
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
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
        mmLeft = 87842
        mmTop = 1852
        mmWidth = 94986
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
        mmLeft = 242888
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'DATA_REF'
      DataPipeline = pplItensEnvioCapCarPP
      KeepTogether = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppShape5: TppShape
          UserName = 'Shape5'
          Brush.Color = clSilver
          ParentHeight = True
          ParentWidth = True
          mmHeight = 7408
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 0
        end
        object ppDBText17: TppDBText
          UserName = 'DBText17'
          DataField = 'DATA_REF'
          DataPipeline = pplItensEnvioCapCarPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 179388
          mmTop = 1852
          mmWidth = 89694
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'REC_PAG'
      DataPipeline = pplItensEnvioCapCarPP
      KeepTogether = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderRecPag: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderRecPagBeforePrint
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object ppShape4: TppShape
          UserName = 'Shape4'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 11377
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          ParentHeight = True
          ParentWidth = True
          Position = lpBottom
          Weight = 0.75
          mmHeight = 11377
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Previsto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 216165
          mmTop = 7938
          mmWidth = 9525
          BandType = 3
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Efetivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 232040
          mmTop = 7938
          mmWidth = 8202
          BandType = 3
          GroupNo = 1
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'REC_PAG'
          DataPipeline = pplItensEnvioCapCarPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 1058
          mmWidth = 25929
          BandType = 3
          GroupNo = 1
        end
        object ppLabel15: TppLabel
          OnPrint = ppLabel15Print
          UserName = 'Label15'
          AutoSize = False
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 8467
          mmTop = 7938
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppLabel16: TppLabel
          OnPrint = ppLabel15Print
          UserName = 'Label16'
          AutoSize = False
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 21167
          mmTop = 7938
          mmWidth = 11377
          BandType = 3
          GroupNo = 1
        end
        object ppLabel17: TppLabel
          OnPrint = ppLabel15Print
          UserName = 'Label17'
          AutoSize = False
          Caption = 'Mutuário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 40217
          mmTop = 7938
          mmWidth = 14023
          BandType = 3
          GroupNo = 1
        end
        object ppLabel19: TppLabel
          UserName = 'Label19'
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 243682
          mmTop = 7938
          mmWidth = 11113
          BandType = 3
          GroupNo = 1
        end
        object ppLabel20: TppLabel
          OnPrint = ppLabel15Print
          UserName = 'Label20'
          AutoSize = False
          Caption = 'Tipo de Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 89165
          mmTop = 7938
          mmWidth = 26194
          BandType = 3
          GroupNo = 1
        end
        object ppLabel21: TppLabel
          OnPrint = ppLabel15Print
          UserName = 'Label21'
          Caption = 'Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 198702
          mmTop = 7938
          mmWidth = 8731
          BandType = 3
          GroupNo = 1
        end
        object ppLabel22: TppLabel
          OnPrint = ppLabel15Print
          UserName = 'Label22'
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 257176
          mmTop = 7938
          mmWidth = 13494
          BandType = 3
          GroupNo = 1
        end
        object ppLabel23: TppLabel
          OnPrint = ppLabel15Print
          UserName = 'Label201'
          AutoSize = False
          Caption = 'Evento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 152665
          mmTop = 7938
          mmWidth = 26194
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterRecPag: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 12700
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 5
          GroupNo = 1
        end
        object ppShape2: TppShape
          UserName = 'Shape2'
          mmHeight = 5556
          mmLeft = 211138
          mmTop = 2381
          mmWidth = 45508
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'HMEVLREFETIVO'
          DataPipeline = pplItensEnvioCapCarPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 227542
          mmTop = 3440
          mmWidth = 12700
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'HMEVLRPREVISTO'
          DataPipeline = pplItensEnvioCapCarPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 212990
          mmTop = 3440
          mmWidth = 12700
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'VLRNAORECEBIDO'
          DataPipeline = pplItensEnvioCapCarPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 242094
          mmTop = 3440
          mmWidth = 12700
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NOME_PLANO'
      DataPipeline = pplItensEnvioCapCarPP
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'NOME_PATRO'
      DataPipeline = pplItensEnvioCapCarPP
      KeepTogether = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderPatro: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderPatroBeforePrint
        mmBottomOffset = 0
        mmHeight = 14552
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 14552
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 3
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentHeight = True
          ParentWidth = True
          Position = lpBottom
          Weight = 0.75
          mmHeight = 14552
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 3
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Previsto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 216165
          mmTop = 11113
          mmWidth = 9525
          BandType = 3
          GroupNo = 3
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = 'Efetivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 232040
          mmTop = 11113
          mmWidth = 8202
          BandType = 3
          GroupNo = 3
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'REC_PAG'
          DataPipeline = pplItensEnvioCapCarPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 1058
          mmWidth = 16933
          BandType = 3
          GroupNo = 3
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          AutoSize = True
          DataField = 'NOME_PLANOPATRO'
          DataPipeline = pplItensEnvioCapCarPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 21167
          mmTop = 1058
          mmWidth = 33338
          BandType = 3
          GroupNo = 3
        end
        object ppLabel11: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 8467
          mmTop = 11113
          mmWidth = 10848
          BandType = 3
          GroupNo = 3
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 21167
          mmTop = 11113
          mmWidth = 11377
          BandType = 3
          GroupNo = 3
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          AutoSize = False
          Caption = 'Mutuário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 40217
          mmTop = 11113
          mmWidth = 14023
          BandType = 3
          GroupNo = 3
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 257176
          mmTop = 11113
          mmWidth = 13494
          BandType = 3
          GroupNo = 3
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 243682
          mmTop = 11113
          mmWidth = 11113
          BandType = 3
          GroupNo = 3
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          AutoSize = False
          Caption = 'Tipo de Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 89165
          mmTop = 11113
          mmWidth = 26194
          BandType = 3
          GroupNo = 3
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 198702
          mmTop = 11113
          mmWidth = 8731
          BandType = 3
          GroupNo = 3
        end
        object ppLabel25: TppLabel
          UserName = 'Label25'
          AutoSize = False
          Caption = 'Evento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 152665
          mmTop = 11113
          mmWidth = 26194
          BandType = 3
          GroupNo = 3
        end
      end
      object ppGroupFooterPatro: TppGroupFooterBand
        BeforePrint = ppGroupFooterPatroBeforePrint
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppLine6: TppLine
          UserName = 'Line6'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 10319
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 5
          GroupNo = 3
        end
        object ppShape6: TppShape
          UserName = 'Shape6'
          mmHeight = 5556
          mmLeft = 211138
          mmTop = 2381
          mmWidth = 45508
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'HMEVLREFETIVO'
          DataPipeline = pplItensEnvioCapCarPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 227542
          mmTop = 3440
          mmWidth = 12700
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'HMEVLRPREVISTO'
          DataPipeline = pplItensEnvioCapCarPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 212990
          mmTop = 3440
          mmWidth = 12700
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VLRNAORECEBIDO'
          DataPipeline = pplItensEnvioCapCarPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 242094
          mmTop = 3440
          mmWidth = 12700
          BandType = 5
          GroupNo = 3
        end
        object ppDBText13: TppDBText
          OnPrint = ppDBText13Print
          UserName = 'DBText13'
          DataField = 'NOME_PLANOPATRO'
          DataPipeline = pplItensEnvioCapCarPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 1058
          mmTop = 3440
          mmWidth = 206640
          BandType = 5
          GroupNo = 3
        end
      end
    end
  end
end
