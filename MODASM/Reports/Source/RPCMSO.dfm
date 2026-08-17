inherited RptPCMSO: TRptPCMSO
  Left = 254
  Top = 223
  Width = 264
  Height = 266
  Caption = 'RptPCMSO'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpPCMSO
    ConnectionType = cntBDE
  end
  object rpPCMSO: TppReport
    AutoStop = False
    DataPipeline = ppPCMSO
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Left = 208
    Version = '5.5'
    mmColumnWidth = 0
    object rpPCMSOHdrBnd1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object rpPCMSOdbTxt1: TppDBText
        UserName = 'rpPCMSOdbTxt1'
        DataField = 'ESTAB'
        DataPipeline = ppPCMSO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 37306
        mmTop = 2381
        mmWidth = 122767
        BandType = 0
      end
      object rpPCMSODBImage1: TppDBImage
        UserName = 'rpPCMSODBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppIMG
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 13229
        mmLeft = 8996
        mmTop = 1588
        mmWidth = 13229
        BandType = 0
      end
      object rpPCMSOlbl_TITULO_RELAT: TppLabel
        UserName = 'rpPCMSOlbl_TITULO_RELAT'
        AutoSize = False
        Caption = 'rpPCMSOlbl_TITULO_RELAT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 37306
        mmTop = 8996
        mmWidth = 122767
        BandType = 0
      end
    end
    object rpPCMSODtlBnd1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 217223
      mmPrintPosition = 0
      object rpPCMSOShape1: TppShape
        UserName = 'rpPCMSOShape1'
        Brush.Style = bsClear
        mmHeight = 13229
        mmLeft = 3175
        mmTop = 14817
        mmWidth = 189442
        BandType = 4
      end
      object rpPCMSOlbl1: TppLabel
        UserName = 'rpPCMSOlbl1'
        Caption = 'Cargo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 46567
        mmTop = 2910
        mmWidth = 11377
        BandType = 4
      end
      object rpPCMSODBTxt2: TppDBText
        UserName = 'rpPCMSODBTxt2'
        AutoSize = True
        DataField = 'CARGO'
        DataPipeline = ppPCMSO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 60590
        mmTop = 2910
        mmWidth = 12965
        BandType = 4
      end
      object rpPCMSOlbl2: TppLabel
        UserName = 'rpPCMSOlbl2'
        Caption = 'Identificação do Empregado ou Candidato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 10319
        mmWidth = 71173
        BandType = 4
      end
      object rpPCMSOLine1: TppLine
        UserName = 'rpPCMSOLine1'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 12965
        mmLeft = 125942
        mmTop = 14817
        mmWidth = 1323
        BandType = 4
      end
      object rpPCMSOlbl3: TppLabel
        UserName = 'rpPCMSOlbl3'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 52917
        mmTop = 16140
        mmWidth = 9790
        BandType = 4
      end
      object rpPCMSOlbl4: TppLabel
        UserName = 'rpPCMSOlbl4'
        Caption = 'Carteira de Identidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 142082
        mmTop = 16140
        mmWidth = 37306
        BandType = 4
      end
      object rpPCMSODBTxt3: TppDBText
        UserName = 'rpPCMSODBTxt3'
        AutoSize = True
        DataField = 'EMPREGADO'
        DataPipeline = ppPCMSO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 45773
        mmTop = 22490
        mmWidth = 22754
        BandType = 4
      end
      object rpPCMSODBTxt4: TppDBText
        UserName = 'rpPCMSODBTxt4'
        AutoSize = True
        DataField = 'CARTIDENT'
        DataPipeline = ppPCMSO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 149225
        mmTop = 22754
        mmWidth = 20108
        BandType = 4
      end
      object rpPCMSOShape2: TppShape
        UserName = 'rpPCMSOShape2'
        Brush.Style = bsClear
        mmHeight = 13229
        mmLeft = 3175
        mmTop = 37571
        mmWidth = 189442
        BandType = 4
      end
      object rpPCMSOLine2: TppLine
        UserName = 'rpPCMSOLine2'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 12965
        mmLeft = 125942
        mmTop = 37571
        mmWidth = 1323
        BandType = 4
      end
      object rpPCMSOlbl5: TppLabel
        UserName = 'rpPCMSOlbl5'
        Caption = 'Exame Solicitado ou Ocorrência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 33338
        mmWidth = 54240
        BandType = 4
      end
      object rpPCMSOlbl6: TppLabel
        UserName = 'rpPCMSOlbl6'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 53711
        mmTop = 39688
        mmWidth = 7673
        BandType = 4
      end
      object rpPCMSOlbl7: TppLabel
        UserName = 'rpPCMSOlbl7'
        Caption = 'Marcado para'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 146844
        mmTop = 39688
        mmWidth = 23019
        BandType = 4
      end
      object rpPCMSODBTxt5: TppDBText
        UserName = 'rpPCMSODBTxt5'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = ppPCMSO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 46567
        mmTop = 45508
        mmWidth = 20902
        BandType = 4
      end
      object rpPCMSODBTxt6: TppDBText
        UserName = 'rpPCMSODBTxt6'
        AutoSize = True
        DataField = 'DATAPLAN'
        DataPipeline = ppPCMSO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 149490
        mmTop = 45508
        mmWidth = 18521
        BandType = 4
      end
      object rpPCMSOShape3: TppShape
        UserName = 'rpPCMSOShape3'
        Brush.Style = bsClear
        mmHeight = 13229
        mmLeft = 3175
        mmTop = 59531
        mmWidth = 189441
        BandType = 4
      end
      object rpPCMSOlbl8: TppLabel
        UserName = 'rpPCMSOlbl8'
        Caption = 'Local de Realização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 2910
        mmTop = 55033
        mmWidth = 33867
        BandType = 4
      end
      object rpPCMSODBTxt7: TppDBText
        UserName = 'rpPCMSODBTxt7'
        AutoSize = True
        DataField = 'EXAMINADOR'
        DataPipeline = ppPCMSO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 5556
        mmTop = 61383
        mmWidth = 23548
        BandType = 4
      end
      object rpPCMSODBTxt8: TppDBText
        UserName = 'rpPCMSODBTxt8'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppPCMSO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 5556
        mmTop = 66675
        mmWidth = 19844
        BandType = 4
      end
      object rpPCMSODBTxt9: TppDBText
        UserName = 'rpPCMSODBTxt9'
        DataField = 'NOMECIDADE'
        DataPipeline = ppPCMSO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 6085
        mmTop = 84931
        mmWidth = 78581
        BandType = 4
      end
      object rpPCMSOlbl9: TppLabel
        UserName = 'rpPCMSOlbl9'
        Caption = ','
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 85461
        mmTop = 84931
        mmWidth = 1058
        BandType = 4
      end
      object rpPCMSOSysVar1: TppSystemVariable
        UserName = 'rpPCMSOSysVar1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 88371
        mmTop = 84931
        mmWidth = 17463
        BandType = 4
      end
      object rpPCMSOLine3: TppLine
        UserName = 'rpPCMSOLine3'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 109538
        mmTop = 88371
        mmWidth = 82815
        BandType = 4
      end
      object rpPCMSODBTxt10: TppDBText
        UserName = 'rpPCMSODBTxt10'
        AutoSize = True
        DataField = 'ASSINANTE'
        DataPipeline = ppPCMSO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 140759
        mmTop = 90223
        mmWidth = 19844
        BandType = 4
      end
      object rpPCMSORegiaoCand: TppRegion
        UserName = 'rpPCMSORegiaoCand'
        Stretch = True
        mmHeight = 14288
        mmLeft = 3175
        mmTop = 97367
        mmWidth = 189441
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpPCMSOMemo1: TppMemo
          UserName = 'rpPCMSOMemo1'
          Caption = 
            'O não comparecimento do candidato no dia e hora marcados implica' +
            'rá perda da validade da presente Guia, acarretando atraso na sua' +
            ' admissão, podendo resultar na eliminação do candidato.'#13#10
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Lines.Strings = (
            
              'O não comparecimento do candidato no dia e hora marcados implica' +
              'rá perda da validade da presente Guia, acarretando atraso na sua' +
              ' admissão, podendo resultar na eliminação do candidato.')
          Stretch = True
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 10583
          mmLeft = 5556
          mmTop = 99219
          mmWidth = 184944
          BandType = 4
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
      object rpPCMSOLine4: TppLine
        UserName = 'rpPCMSOLine4'
        Pen.Style = psDash
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 3175
        mmTop = 115094
        mmWidth = 189442
        BandType = 4
      end
      object rpPCMSOlbl10: TppLabel
        UserName = 'rpPCMSOlbl10'
        Caption = 'Realização / Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 76200
        mmTop = 118004
        mmWidth = 45773
        BandType = 4
      end
      object rpPCMSOShape4: TppShape
        UserName = 'rpPCMSOShape4'
        Brush.Style = bsClear
        mmHeight = 13229
        mmLeft = 3440
        mmTop = 137848
        mmWidth = 189442
        BandType = 4
      end
      object rpPCMSOlbl11: TppLabel
        UserName = 'rpPCMSOlbl11'
        Caption = 'Cargo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 46831
        mmTop = 125942
        mmWidth = 11377
        BandType = 4
      end
      object rpPCMSODBTxt11: TppDBText
        UserName = 'rpPCMSODBTxt11'
        AutoSize = True
        DataField = 'CARGO'
        DataPipeline = ppPCMSO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 60854
        mmTop = 125942
        mmWidth = 12965
        BandType = 4
      end
      object rpPCMSOlbl12: TppLabel
        UserName = 'rpPCMSOlbl12'
        Caption = 'Identificação do Empregado ou Candidato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 133350
        mmWidth = 71173
        BandType = 4
      end
      object rpPCMSOLine5: TppLine
        UserName = 'rpPCMSOLine5'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 12965
        mmLeft = 126207
        mmTop = 137848
        mmWidth = 1323
        BandType = 4
      end
      object rpPCMSOlbl13: TppLabel
        UserName = 'rpPCMSOlbl13'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 53181
        mmTop = 139171
        mmWidth = 9790
        BandType = 4
      end
      object rpPCMSOlbl14: TppLabel
        UserName = 'rpPCMSOlbl14'
        Caption = 'Carteira de Identidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 142346
        mmTop = 139171
        mmWidth = 37306
        BandType = 4
      end
      object rpPCMSOShape5: TppShape
        UserName = 'rpPCMSOShape5'
        Brush.Style = bsClear
        mmHeight = 13229
        mmLeft = 3440
        mmTop = 160602
        mmWidth = 189442
        BandType = 4
      end
      object rpPCMSODBTxt14: TppDBText
        UserName = 'rpPCMSODBTxt14'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = ppPCMSO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 46831
        mmTop = 168540
        mmWidth = 20902
        BandType = 4
      end
      object rpPCMSODBTxt15: TppDBText
        UserName = 'rpPCMSODBTxt15'
        AutoSize = True
        DataField = 'DATAREAL'
        DataPipeline = ppPCMSO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 149754
        mmTop = 168540
        mmWidth = 18521
        BandType = 4
      end
      object rpPCMSODBTxt12: TppDBText
        UserName = 'rpPCMSODBTxt12'
        AutoSize = True
        DataField = 'EMPREGADO'
        DataPipeline = ppPCMSO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 46038
        mmTop = 145521
        mmWidth = 22754
        BandType = 4
      end
      object rpPCMSODBTxt13: TppDBText
        UserName = 'rpPCMSODBTxt13'
        AutoSize = True
        DataField = 'CARTIDENT'
        DataPipeline = ppPCMSO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 149490
        mmTop = 145786
        mmWidth = 20108
        BandType = 4
      end
      object rpPCMSOLine6: TppLine
        UserName = 'rpPCMSOLine6'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 12965
        mmLeft = 126207
        mmTop = 160602
        mmWidth = 1323
        BandType = 4
      end
      object rpPCMSOlbl15: TppLabel
        UserName = 'rpPCMSOlbl15'
        Caption = 'Exame Solicitado ou Ocorrência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 156104
        mmWidth = 54240
        BandType = 4
      end
      object rpPCMSOlbl16: TppLabel
        UserName = 'rpPCMSOlbl16'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 53975
        mmTop = 162719
        mmWidth = 7673
        BandType = 4
      end
      object rpPCMSOlbl17: TppLabel
        UserName = 'rpPCMSOlbl17'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 155311
        mmTop = 162719
        mmWidth = 7673
        BandType = 4
      end
      object rpPCMSORegiaoAval: TppRegion
        UserName = 'rpPCMSORegiaoAval'
        mmHeight = 8467
        mmLeft = 3440
        mmTop = 181240
        mmWidth = 189442
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpPCMSOlbl18: TppLabel
          UserName = 'rpPCMSOlbl18'
          Caption = 'Avaliação: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 5292
          mmTop = 183621
          mmWidth = 18521
          BandType = 4
        end
        object rpPCMSOdbAval: TppDBText
          UserName = 'rpPCMSOdbAval'
          DataField = 'AVALIACAO'
          DataPipeline = ppPCMSO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 25665
          mmTop = 183621
          mmWidth = 8467
          BandType = 4
        end
        object rpPCMSOdbObsAval: TppDBText
          UserName = 'rpPCMSOdbObsAval'
          AutoSize = True
          DataField = 'OBSAVAL'
          DataPipeline = ppPCMSO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 36248
          mmTop = 183621
          mmWidth = 16404
          BandType = 4
        end
      end
      object rpPCMSORegiaoCID: TppRegion
        UserName = 'rpPCMSORegiaoCID'
        Stretch = True
        mmHeight = 10583
        mmLeft = 3440
        mmTop = 191559
        mmWidth = 189442
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpPCMSODBTxt16: TppDBText
          UserName = 'rpPCMSODBTxt16'
          AutoSize = True
          DataField = 'CODCID'
          DataPipeline = ppPCMSO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 5821
          mmTop = 196586
          mmWidth = 14023
          BandType = 4
        end
        object rpPCMSODBMemo1: TppDBMemo
          UserName = 'rpPCMSODBMemo1'
          KeepTogether = True
          CharWrap = True
          DataField = 'DESCRCID'
          DataPipeline = ppPCMSO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ForceJustifyLastLine = True
          Stretch = True
          Transparent = True
          mmHeight = 3969
          mmLeft = 21960
          mmTop = 196586
          mmWidth = 168011
          BandType = 4
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpPCMSOlbl19: TppLabel
          UserName = 'rpPCMSOlbl19'
          Caption = 'CID (Cod. Intern. Doenças):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 5821
          mmTop = 192352
          mmWidth = 45773
          BandType = 4
        end
      end
      object rpPCMSORegiaoObs: TppRegion
        UserName = 'rpPCMSORegiaoObs'
        Stretch = True
        mmHeight = 10583
        mmLeft = 3440
        mmTop = 203730
        mmWidth = 189442
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpPCMSODBMemo2: TppDBMemo
          UserName = 'rpPCMSODBMemo2'
          KeepTogether = True
          CharWrap = True
          DataField = 'OBSERVACAO'
          DataPipeline = ppPCMSO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ForceJustifyLastLine = True
          Stretch = True
          Transparent = True
          mmHeight = 3969
          mmLeft = 5821
          mmTop = 208757
          mmWidth = 183886
          BandType = 4
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpPCMSOlbl20: TppLabel
          UserName = 'rpPCMSOlbl20'
          Caption = 'Observação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 5821
          mmTop = 204523
          mmWidth = 20373
          BandType = 4
        end
      end
    end
    object rpPCMSOFootBnd1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 21167
      mmPrintPosition = 0
      object rpPCMSODBTxt17: TppDBText
        UserName = 'rpPCMSODBTxt17'
        AutoSize = True
        DataField = 'EXAMINADOR'
        DataPipeline = ppPCMSO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 86519
        mmTop = 14552
        mmWidth = 23548
        BandType = 8
      end
      object rpPCMSOLine7: TppLine
        UserName = 'rpPCMSOLine7'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 57150
        mmTop = 12700
        mmWidth = 82815
        BandType = 8
      end
    end
    object rpPCMSOSmryBnd: TppSummaryBand
      AfterPrint = rpPCMSOSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
    end
  end
  object dsPCMSO: TwwDataSource
    AutoEdit = False
    DataSet = CdsPCMSO
    Left = 209
    Top = 100
  end
  object ppPCMSO: TppBDEPipeline
    DataSource = dsPCMSO
    UserName = 'PCMSO'
    Left = 208
    Top = 48
    object ppPCMSOppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppPCMSOppField2: TppField
      FieldAlias = 'TITRELAT'
      FieldName = 'TITRELAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppPCMSOppField3: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppPCMSOppField4: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppPCMSOppField5: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppPCMSOppField6: TppField
      FieldAlias = 'DATAPLAN'
      FieldName = 'DATAPLAN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppPCMSOppField7: TppField
      FieldAlias = 'CARTIDENT'
      FieldName = 'CARTIDENT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppPCMSOppField8: TppField
      FieldAlias = 'DATAREAL'
      FieldName = 'DATAREAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppPCMSOppField9: TppField
      FieldAlias = 'EXAMINADOR'
      FieldName = 'EXAMINADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppPCMSOppField10: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppPCMSOppField11: TppField
      FieldAlias = 'DESCRCID'
      FieldName = 'DESCRCID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppPCMSOppField12: TppField
      FieldAlias = 'CODCID'
      FieldName = 'CODCID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppPCMSOppField13: TppField
      FieldAlias = 'AVALIACAO'
      FieldName = 'AVALIACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppPCMSOppField14: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppPCMSOppField15: TppField
      FieldAlias = 'NOMECIDADE'
      FieldName = 'NOMECIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppPCMSOppField16: TppField
      FieldAlias = 'ASSINANTE'
      FieldName = 'ASSINANTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppPCMSOppField17: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppPCMSOppField18: TppField
      FieldAlias = 'OBSAVAL'
      FieldName = 'OBSAVAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
  end
  object sqlPCMSO: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ESTAB,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPREGADO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS DESCRICAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS CARGO,'
      '  '#39'1234567890'#39' AS DATAPLAN,'
      '  '#39'123456789012345678901234567890'#39' AS CARTIDENT,'
      '  '#39'1234567890'#39' AS DATAREAL,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EXAMINADOR,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ENDERECO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS DESCRCID,'
      '  '#39'1234567'#39' AS CODCID,'
      '   12345 AS AVALIACAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS OBSERVACAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS NOMECIDADE,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ASSINANTE,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS IMAGEM,'
      '  '#39'1234567890'#39' AS OBSAVAL'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    ClientDataSet = CdsPCMSO
    Left = 209
    Top = 189
  end
  object CdsPCMSO: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 209
    Top = 145
  end
  object ppIMG: TppBDEPipeline
    DataSource = dsIMG
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'IMG'
    Left = 24
    Top = 90
    object ppIMGppField1: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
  end
  object dsIMG: TwwDataSource
    DataSet = CdsIMG
    Left = 24
    Top = 77
  end
  object CdsIMG: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 64
  end
end
