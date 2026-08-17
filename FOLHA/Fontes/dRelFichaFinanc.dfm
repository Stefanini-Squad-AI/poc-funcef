inherited dtmRelFichaFinanc: TdtmRelFichaFinanc
  Left = 188
  Top = 174
  Width = 332
  Height = 230
  Caption = 'dtmRelFichaFinanc'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 29
    Top = 55
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
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
    Left = 29
    Top = 103
  end
  inherited qryExemplo: TwwQuery
    Left = 29
    Top = 152
  end
  inherited rpExemplo: TppReport
    Left = 29
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object ppFichaFinanc: TppBDEPipeline
    DataSource = dsFichaFinanc
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'FichaFinanc'
    Left = 106
    Top = 55
  end
  object dsFichaFinanc: TwwDataSource
    DataSet = qryFichaFinanc
    Left = 106
    Top = 103
  end
  object qryFichaFinanc: TwwQuery
    BeforeOpen = qryFichaFinancBeforeOpen
    AfterClose = qryFichaFinancAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.NOME,'
      
        '  DECODE(HST.FLGTIPOFOLHA, 3, SUBSTR(H.MESCOBRANCA, 1, 4)||'#39'/13'#39 +
        ', 4, SUBSTR(H.MESCOBRANCA, 1, 4)||'#39'/13'#39', H.MESCOBRANCA) MES,'
      '  DECODE(PD.FLGDESCONTO, 0, H.VALORPROVENTO) AS PROVENTO,'
      '  DECODE(PD.FLGDESCONTO, 1, H.VALORPROVENTO) AS DESCONTO,'
      '  DECODE(PD.FLGESPECIAL,'
      '    0, DECODE(PD.FLGDESCONTO,'
      '         2, NVL(H.VALORINFO, H.VALORPROVENTO)||'#39' (I)'#39','
      '         0, NULL,'
      '         1, DECODE(H.VALORRECEBIDO-H.VALORPROVENTO,'
      
        '              0, DECODE(NVL(H.VALORINFO, 0), 0, NULL, H.VALORINF' +
        'O||'#39' (I)'#39'),'
      '                H.VALORRECEBIDO-H.VALORPROVENTO||'#39' (R)'#39')),'
      
        '  DECODE(H.VALORPROVENTO, 0, H.VALORINFO, NVL(H.VALORPROVENTO, H' +
        '.VALORINFO))||'#39' (I)'#39') INFORMATIVO,'
      '      PD.IDPROVENTO AS CODPROVDESC,'
      '      PD.DESCRICAO AS DESCRICAO'
      ''
      'FROM'
      '      HSTFOLHABENEF HST,'
      '      HISTRUBSAL H,'
      '      PROVDESC PD,'
      '    PESSOA P'
      'WHERE  HST.IDFUNDACAO = 1'
      'AND 1 = 2'
      'AND  H.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF'
      'AND  H.IDRESPONSAVEL = 6484'
      'AND  H.MESCOBRANCA >= '#39'2003/01'#39
      'AND  H.MESCOBRANCA <= '#39'2003/01'#39
      'AND  H.IDTITULAR = 6484'
      'AND  H.IDHSTFOLHABENEF = HST.IDHSTFOLHABENEF'
      'AND  H.IDMODULO = 18'
      'AND  P.IDPESSOA = H.IDRESPONSAVEL'
      'AND  PD.IDPROVENTO = H.IDRUBRICA'
      'ORDER BY  MES,'
      'PD.FLGDESCONTO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 106
    Top = 152
  end
  object rpFichaFinanc: TppReport
    AutoStop = False
    DataPipeline = ppFichaFinanc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Ficha Financeira dos Beneficiários'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpFichaFinancBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 106
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppFichaFinanc'
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 42863
      mmPrintPosition = 0
      object ppLabel50: TppLabel
        UserName = 'ppLabel50'
        Caption = 'Ficha Financeira Mensal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 75671
        mmTop = 33867
        mmWidth = 48948
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'ppLine15'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 41804
        mmWidth = 197300
        BandType = 0
      end
      object rpFichaFinancDBImage1: TppDBImage
        UserName = 'rpFichaFinancDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 3175
        mmTop = 2646
        mmWidth = 32808
        BandType = 0
      end
      object rpFichaFinancDBText1: TppDBText
        UserName = 'rpFichaFinancDBText1'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5822
        mmLeft = 36777
        mmTop = 2910
        mmWidth = 133615
        BandType = 0
      end
      object rpFichaFinancDBText2: TppDBText
        UserName = 'rpFichaFinancDBText2'
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
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 36777
        mmTop = 9260
        mmWidth = 25929
        BandType = 0
      end
      object rpFichaFinancDBText3: TppDBText
        UserName = 'rpFichaFinancDBText3'
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 36777
        mmTop = 14552
        mmWidth = 41804
        BandType = 0
      end
      object rpFichaFinancDBText4: TppDBText
        UserName = 'rpFichaFinancDBText4'
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 36777
        mmTop = 19050
        mmWidth = 20108
        BandType = 0
      end
      object rpFichaFinancLabel2: TppLabel
        UserName = 'rpFichaFinancLabel2'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 36777
        mmTop = 23548
        mmWidth = 6085
        BandType = 0
      end
      object rpFichaFinancDBText5: TppDBText
        UserName = 'rpFichaFinancDBText5'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 44186
        mmTop = 23548
        mmWidth = 17198
        BandType = 0
      end
      object rpFichaFinancDBText6: TppDBText
        UserName = 'rpFichaFinancDBText6'
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 57415
        mmTop = 19050
        mmWidth = 26723
        BandType = 0
      end
      object rpFichaFinancDBText7: TppDBText
        UserName = 'rpFichaFinancDBText7'
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 79904
        mmTop = 14552
        mmWidth = 17198
        BandType = 0
      end
      object rpFichaFinancDBText8: TppDBText
        UserName = 'rpFichaFinancDBText8'
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 85725
        mmTop = 19050
        mmWidth = 20108
        BandType = 0
      end
    end
    object ppDetailBand8: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object rpFichaFinancDBText11: TppDBText
        UserName = 'rpFichaFinancDBText11'
        DataField = 'CODPROVDESC'
        DataPipeline = ppFichaFinanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFinanc'
        mmHeight = 4233
        mmLeft = 794
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object rpFichaFinancDBText12: TppDBText
        UserName = 'rpFichaFinancDBText12'
        DataField = 'DESCRICAO'
        DataPipeline = ppFichaFinanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFichaFinanc'
        mmHeight = 4233
        mmLeft = 22225
        mmTop = 0
        mmWidth = 107421
        BandType = 4
      end
      object rpFichaFinancDBText13: TppDBText
        UserName = 'rpFichaFinancDBText13'
        DataField = 'PROVENTO'
        DataPipeline = ppFichaFinanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppFichaFinanc'
        mmHeight = 4233
        mmLeft = 133615
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object rpFichaFinancDBText14: TppDBText
        UserName = 'rpFichaFinancDBText14'
        DataField = 'DESCONTO'
        DataPipeline = ppFichaFinanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppFichaFinanc'
        mmHeight = 4233
        mmLeft = 153988
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'INFORMATIVO'
        DataPipeline = ppFichaFinanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppFichaFinanc'
        mmHeight = 4233
        mmLeft = 175419
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 9790
      mmPrintPosition = 0
      object ppLabel52: TppLabel
        UserName = 'ppLabel52'
        AutoSize = False
        Caption = 'Folha de Benefícios'
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
      object ppCalc16: TppSystemVariable
        UserName = 'Calc16'
        AutoSize = False
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3703
        mmLeft = 0
        mmTop = 3175
        mmWidth = 197644
        BandType = 8
      end
      object ppCalc15: TppSystemVariable
        UserName = 'Calc15'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3703
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object ppLine16: TppLine
        UserName = 'ppLine16'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
    end
    object rpFichaFinancSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object rpFichaFinancSubReport1: TppSubReport
        UserName = 'rpFichaFinancSubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        PrintBehavior = pbSection
        ResetPageNo = False
        TraverseAllData = False
        DataPipelineName = 'plAgrupaRub'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 1588
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpFichaFinancChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = plAgrupaRub
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Relatório de Ficha Financeira dos Beneficiários'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'plAgrupaRub'
          object rpFichaFinancChildReport1TitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 51329
            mmPrintPosition = 0
            object rpFichaFinancChildReport1Label1: TppLabel
              UserName = 'rpFichaFinancChildReport1Label1'
              Caption = 'Resumo da Ficha Financeira'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 5292
              mmLeft = 67469
              mmTop = 38100
              mmWidth = 57415
              BandType = 1
            end
            object rpFichaFinancChildReport1Label2: TppLabel
              UserName = 'rpFichaFinancChildReport1Label2'
              Caption = 'Rubrica'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 4763
              mmTop = 46038
              mmWidth = 12965
              BandType = 1
            end
            object rpFichaFinancChildReport1Label3: TppLabel
              UserName = 'rpFichaFinancChildReport1Label3'
              Caption = 'Descrição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 28840
              mmTop = 46038
              mmWidth = 16404
              BandType = 1
            end
            object rpFichaFinancChildReport1Label4: TppLabel
              UserName = 'rpFichaFinancChildReport1Label4'
              Caption = 'Provento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 154252
              mmTop = 46038
              mmWidth = 15346
              BandType = 1
            end
            object rpFichaFinancChildReport1Label5: TppLabel
              UserName = 'rpFichaFinancChildReport1Label5'
              Caption = 'Desconto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 173567
              mmTop = 46038
              mmWidth = 16140
              BandType = 1
            end
            object ppLine63: TppLine
              UserName = 'Line63'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 265
              mmLeft = 0
              mmTop = 50536
              mmWidth = 197300
              BandType = 1
            end
            object ppDBImage1: TppDBImage
              UserName = 'DBImage1'
              MaintainAspectRatio = True
              Stretch = True
              DataField = 'IMAGEM'
              DataPipeline = ppFundacao
              GraphicType = 'Bitmap'
              ParentDataPipeline = False
              DataPipelineName = 'ppFundacao'
              mmHeight = 25135
              mmLeft = 5292
              mmTop = 4763
              mmWidth = 32808
              BandType = 1
            end
            object ppDBText2: TppDBText
              UserName = 'DBText2'
              DataField = 'NOME'
              DataPipeline = ppFundacao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 14
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppFundacao'
              mmHeight = 5822
              mmLeft = 38894
              mmTop = 5027
              mmWidth = 133615
              BandType = 1
            end
            object ppDBText3: TppDBText
              UserName = 'DBText3'
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
              DataPipelineName = 'ppFundacao'
              mmHeight = 4233
              mmLeft = 38894
              mmTop = 11377
              mmWidth = 25929
              BandType = 1
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              DataField = 'LOGRADOURO'
              DataPipeline = ppFundacao
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppFundacao'
              mmHeight = 3704
              mmLeft = 38894
              mmTop = 16669
              mmWidth = 41804
              BandType = 1
            end
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              DataField = 'BAIRRO'
              DataPipeline = ppFundacao
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppFundacao'
              mmHeight = 3704
              mmLeft = 38894
              mmTop = 21167
              mmWidth = 20108
              BandType = 1
            end
            object ppLabel1: TppLabel
              UserName = 'Label1'
              Caption = 'CEP'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 38894
              mmTop = 25665
              mmWidth = 6085
              BandType = 1
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'CEP'
              DataPipeline = ppFundacao
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppFundacao'
              mmHeight = 3704
              mmLeft = 46302
              mmTop = 25665
              mmWidth = 17198
              BandType = 1
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'CIDADE'
              DataPipeline = ppFundacao
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppFundacao'
              mmHeight = 3704
              mmLeft = 59531
              mmTop = 21167
              mmWidth = 26723
              BandType = 1
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              DataField = 'NUMERO'
              DataPipeline = ppFundacao
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppFundacao'
              mmHeight = 3704
              mmLeft = 82021
              mmTop = 16669
              mmWidth = 17198
              BandType = 1
            end
            object ppDBText9: TppDBText
              UserName = 'DBText9'
              DataField = 'CODESTADO'
              DataPipeline = ppFundacao
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppFundacao'
              mmHeight = 3704
              mmLeft = 87842
              mmTop = 21167
              mmWidth = 20108
              BandType = 1
            end
          end
          object rpFichaFinancChildReport1DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object rpFichaFinancChildReport1DBText1: TppDBText
              UserName = 'rpFichaFinancChildReport1DBText1'
              DataField = 'CODPROVDESC'
              DataPipeline = plAgrupaRub
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plAgrupaRub'
              mmHeight = 4233
              mmLeft = 5292
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object rpFichaFinancChildReport1DBText2: TppDBText
              UserName = 'rpFichaFinancChildReport1DBText2'
              DataField = 'DESCRICAO'
              DataPipeline = plAgrupaRub
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plAgrupaRub'
              mmHeight = 4233
              mmLeft = 28575
              mmTop = 0
              mmWidth = 121444
              BandType = 4
            end
            object rpFichaFinancChildReport1DBText3: TppDBText
              UserName = 'rpFichaFinancChildReport1DBText3'
              DataField = 'PROVENTO'
              DataPipeline = plAgrupaRub
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plAgrupaRub'
              mmHeight = 4233
              mmLeft = 152400
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object rpFichaFinancChildReport1DBText4: TppDBText
              UserName = 'rpFichaFinancChildReport1DBText4'
              DataField = 'DESCONTO'
              DataPipeline = plAgrupaRub
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plAgrupaRub'
              mmHeight = 4233
              mmLeft = 172509
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
          end
          object ppFooterBand1: TppFooterBand
            mmBottomOffset = 0
            mmHeight = 8467
            mmPrintPosition = 0
            object ppSystemVariable1: TppSystemVariable
              UserName = 'SystemVariable1'
              VarType = vtDateTime
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 0
              mmTop = 2646
              mmWidth = 197644
              BandType = 8
            end
            object ppSystemVariable2: TppSystemVariable
              UserName = 'SystemVariable2'
              VarType = vtPageSetDesc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 265
              mmTop = 2646
              mmWidth = 197380
              BandType = 8
            end
            object ppLine1: TppLine
              UserName = 'Line1'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 0
              mmTop = 1323
              mmWidth = 197300
              BandType = 8
            end
            object ppLabel2: TppLabel
              UserName = 'Label2'
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
              mmTop = 2646
              mmWidth = 197909
              BandType = 8
            end
          end
          object rpFichaFinancChildReport1SummaryBand1: TppSummaryBand
            BeforePrint = rpFichaFinancChildReport1SummaryBand1BeforePrint
            mmBottomOffset = 0
            mmHeight = 11906
            mmPrintPosition = 0
            object lbprovento1: TppDBCalc
              UserName = 'lbprovento1'
              DataField = 'PROVENTO'
              DataPipeline = plAgrupaRub
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plAgrupaRub'
              mmHeight = 4233
              mmLeft = 152400
              mmTop = 0
              mmWidth = 17198
              BandType = 7
            end
            object lbdesconto1: TppDBCalc
              UserName = 'lbdesconto1'
              DataField = 'DESCONTO'
              DataPipeline = plAgrupaRub
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plAgrupaRub'
              mmHeight = 4233
              mmLeft = 172509
              mmTop = 0
              mmWidth = 17198
              BandType = 7
            end
            object rpFichaFinancChildReport1Label6: TppLabel
              UserName = 'rpFichaFinancChildReport1Label6'
              Caption = 'Total Geral:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 129911
              mmTop = 0
              mmWidth = 19844
              BandType = 7
            end
            object rpFichaFinancChildReport1Label7: TppLabel
              UserName = 'rpFichaFinancChildReport1Label7'
              Caption = 'Liquido  :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 129911
              mmTop = 7673
              mmWidth = 16140
              BandType = 7
            end
            object lbliquido1: TppLabel
              UserName = 'lbliquido1'
              Caption = '0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 169863
              mmTop = 7673
              mmWidth = 1852
              BandType = 7
            end
            object ppLine70: TppLine
              UserName = 'Line70'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 265
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 7
            end
          end
        end
      end
    end
    object rpFichaFinancGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppFichaFinanc
      OutlineSettings.CreateNode = True
      UserName = 'rpFichaFinancGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppFichaFinanc'
      object rpFichaFinancGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object rpFichaFinancDBText9: TppDBText
          UserName = 'rpFichaFinancDBText9'
          DataField = 'NOME'
          DataPipeline = ppFichaFinanc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppFichaFinanc'
          mmHeight = 4233
          mmLeft = 22225
          mmTop = 0
          mmWidth = 50800
          BandType = 3
          GroupNo = 0
        end
        object rpFichaFinancLabel1: TppLabel
          UserName = 'rpFichaFinancLabel1'
          Caption = 'Nome :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 0
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
      end
      object rpFichaFinancGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 1323
        mmPrintPosition = 0
        object rpFichaFinancLine3: TppLine
          UserName = 'rpFichaFinancLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpFichaFinancGroup2: TppGroup
      BreakName = 'MES'
      DataPipeline = ppFichaFinanc
      OutlineSettings.CreateNode = True
      UserName = 'rpFichaFinancGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppFichaFinanc'
      object rpFichaFinancGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object rpFichaFinancDBText10: TppDBText
          UserName = 'rpFichaFinancDBText10'
          DataField = 'MES'
          DataPipeline = ppFichaFinanc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppFichaFinanc'
          mmHeight = 4233
          mmLeft = 22225
          mmTop = 0
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object rpFichaFinancLabel3: TppLabel
          UserName = 'rpFichaFinancLabel3'
          Caption = 'Ano/Mes :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 0
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object rpFichaFinancLabel4: TppLabel
          UserName = 'rpFichaFinancLabel4'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 7144
          mmWidth = 13229
          BandType = 3
          GroupNo = 1
        end
        object rpFichaFinancLabel5: TppLabel
          UserName = 'rpFichaFinancLabel5'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 22225
          mmTop = 7144
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object Provento: TppLabel
          UserName = 'Provento'
          Caption = 'Provento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 135467
          mmTop = 7144
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
        object Desconto: TppLabel
          UserName = 'Desconto'
          Caption = 'Desconto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 155046
          mmTop = 7144
          mmWidth = 16140
          BandType = 3
          GroupNo = 1
        end
        object rpFichaFinancLine1: TppLine
          UserName = 'rpFichaFinancLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 11906
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object lblInformativa: TppLabel
          UserName = 'lblInformativa'
          Caption = 'Informativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 175948
          mmTop = 7144
          mmWidth = 19050
          BandType = 3
          GroupNo = 1
        end
      end
      object rpFichaFinancGroupFooterBand2: TppGroupFooterBand
        BeforePrint = rpFichaFinancGroupFooterBand2BeforePrint
        mmBottomOffset = 0
        mmHeight = 13494
        mmPrintPosition = 0
        object lbprovento: TppDBCalc
          UserName = 'lbprovento'
          DataField = 'PROVENTO'
          DataPipeline = ppFichaFinanc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpFichaFinancGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppFichaFinanc'
          mmHeight = 4233
          mmLeft = 133615
          mmTop = 1852
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object lbdesconto: TppDBCalc
          UserName = 'lbdesconto'
          DataField = 'DESCONTO'
          DataPipeline = ppFichaFinanc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpFichaFinancGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppFichaFinanc'
          mmHeight = 4233
          mmLeft = 153988
          mmTop = 1852
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object rpFichaFinancLine2: TppLine
          UserName = 'rpFichaFinancLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 529
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object rpFichaFinancLabel6: TppLabel
          UserName = 'rpFichaFinancLabel6'
          Caption = 'Total do Mes :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 106627
          mmTop = 1852
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object rpFichaFinancLabel8: TppLabel
          UserName = 'rpFichaFinancLabel8'
          Caption = 'Liquido  :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 106627
          mmTop = 8202
          mmWidth = 15875
          BandType = 5
          GroupNo = 1
        end
        object lbliquido: TppLabel
          UserName = 'lbliquido'
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 152400
          mmTop = 8467
          mmWidth = 1852
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object plAgrupaRub: TppBDEPipeline
    DataSource = dsAgrupaRub
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plAgrupaRub'
    Left = 188
    Top = 55
  end
  object dsAgrupaRub: TwwDataSource
    DataSet = qryAgrupaRub
    Left = 188
    Top = 103
  end
  object qryAgrupaRub: TwwQuery
    AfterOpen = qryAgrupaRubAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' ')
    ValidateWithMask = True
    Left = 188
    Top = 152
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
    Left = 270
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 1
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
    Left = 270
    Top = 103
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 270
    Top = 55
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField11: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 10
    end
    object ppFundacaoppField12: TppField
      FieldAlias = 'BARCIDUF'
      FieldName = 'BARCIDUF'
      FieldLength = 79
      DisplayWidth = 79
      Position = 11
    end
  end
end
