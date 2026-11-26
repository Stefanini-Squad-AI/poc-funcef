inherited dtmRelFichaFinancIndiv: TdtmRelFichaFinancIndiv
  Left = 307
  Top = 184
  Width = 415
  Height = 241
  Caption = 'dtmRelFichaFinancIndiv'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 26
    Top = 53
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
    Left = 26
    Top = 101
  end
  inherited qryExemplo: TwwQuery
    Left = 26
    Top = 148
  end
  inherited rpExemplo: TppReport
    Left = 26
    Top = 5
  end
  object qryFichaFinancIndiv: TwwQuery
    BeforeOpen = qryFichaFinancIndivBeforeOpen
    AfterOpen = qryFichaFinancIndivAfterOpen
    AfterClose = qryFichaFinancIndivAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.NOME,'
      '  PF.DATANASC,'
      '  HST.IDHSTFOLHABENEF,'
      '  HST.IDHSTFOLHABENEF||'#39' - '#39'||HST.HISTORICO AS HISTORICO,'
      '  DECODE(PF.FLGISENTOIRRF, 0, '#39'NÃO'#39', 1, '#39'SIM'#39') AS ISENTO,'
      '  NVL(D.MATRICULA, E.MATRICULA) AS MATRICULA,'
      '  D.NUMSEQUENCIA,'
      
        '  DECODE(HST.FLGTIPOFOLHA, 3, SUBSTR(H.MESCOBRANCA,1,4)||'#39'/13'#39', ' +
        '4,'
      '         SUBSTR(H.MESCOBRANCA,1,4)||'#39'/13'#39', H.MESCOBRANCA) MES,'
      '  DECODE(PD.FLGDESCONTO, 0, H.VALORPROVENTO) AS PROVENTO,'
      '  DECODE(PD.FLGDESCONTO, 1, H.VALORPROVENTO) AS DESCONTO,'
      '  DECODE(PD.FLGESPECIAL, 0,'
      
        '    DECODE(PD.FLGDESCONTO, 2, NVL(H.VALORINFO,H.VALORPROVENTO)||' +
        #39' (I)'#39', 0, NULL, 1,'
      '      DECODE(H.VALORRECEBIDO-H.VALORPROVENTO, 0,'
      
        '        DECODE(NVL(H.VALORINFO,0), 0, NULL, H.VALORINFO||'#39' (I)'#39')' +
        ','
      '          H.VALORRECEBIDO-H.VALORPROVENTO||'#39' (R)'#39')),'
      '          DECODE(H.VALORPROVENTO,0,H.VALORINFO,'
      
        '            NVL(H.VALORPROVENTO,H.VALORINFO))||'#39' (I)'#39') INFORMATI' +
        'VO,'
      '  PD.IDPROVENTO AS CODPROVDESC,'
      '  PD.DESCRICAO AS DESCRICAO'
      ''
      'FROM'
      '  HSTFOLHABENEF HST,'
      '  HISTRUBSAL H,'
      '  PESSOAFISICA PF,'
      '  ELEGPATRO E,'
      '  DEPENTIT D,'
      '  PROVDESC PD,'
      '  PESSOA P'
      ''
      'WHERE HST.IDFUNDACAO = 1'
      'AND 1 = 2'
      '  AND H.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF'
      '  AND H.IDRESPONSAVEL = 6484'
      '  AND H.MESCOBRANCA = '#39'2003/01'#39
      '  AND H.IDTITULAR = 6484'
      '  AND H.IDHSTFOLHABENEF = HST.IDHSTFOLHABENEF'
      '  AND H.IDMODULO = 18'
      '  AND P.IDPESSOA = H.IDRESPONSAVEL'
      '  AND PD.IDPROVENTO = H.IDRUBRICA'
      '  AND H.IDTITULAR = D.IDTITULAR'
      '  AND H.IDRESPONSAVEL = D.IDPESSOA'
      '  AND H.IDTITULAR = E.IDPESSOA'
      '  AND H.IDPATRO = E.IDPESSJUR'
      '  AND H.IDRESPONSAVEL = PF.IDPESSOA'
      ''
      'ORDER BY'
      '  MES,'
      '  HST.IDHSTFOLHABENEF,'
      '  PD.FLGDESCONTO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 110
    Top = 148
  end
  object dsFichaFinancIndiv: TwwDataSource
    DataSet = qryFichaFinancIndiv
    Left = 110
    Top = 101
  end
  object pplFichaFinancIndiv: TppBDEPipeline
    DataSource = dsFichaFinancIndiv
    UserName = 'lFichaFinancIndiv'
    Left = 110
    Top = 53
    object pplFichaFinancIndivppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplFichaFinancIndivppField2: TppField
      FieldAlias = 'DATANASC'
      FieldName = 'DATANASC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object pplFichaFinancIndivppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDHSTFOLHABENEF'
      FieldName = 'IDHSTFOLHABENEF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplFichaFinancIndivppField4: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 93
      DisplayWidth = 93
      Position = 3
    end
    object pplFichaFinancIndivppField5: TppField
      FieldAlias = 'ISENTO'
      FieldName = 'ISENTO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 4
    end
    object pplFichaFinancIndivppField6: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 5
    end
    object pplFichaFinancIndivppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMSEQUENCIA'
      FieldName = 'NUMSEQUENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplFichaFinancIndivppField8: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 7
      DisplayWidth = 7
      Position = 7
    end
    object pplFichaFinancIndivppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROVENTO'
      FieldName = 'PROVENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplFichaFinancIndivppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'DESCONTO'
      FieldName = 'DESCONTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplFichaFinancIndivppField11: TppField
      FieldAlias = 'INFORMATIVO'
      FieldName = 'INFORMATIVO'
      FieldLength = 44
      DisplayWidth = 44
      Position = 10
    end
    object pplFichaFinancIndivppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODPROVDESC'
      FieldName = 'CODPROVDESC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplFichaFinancIndivppField13: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 130
      DisplayWidth = 130
      Position = 12
    end
  end
  object rpFichaFinancIndiv: TppReport
    AutoStop = False
    DataPipeline = pplFichaFinancIndiv
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpFichaFinancIndivBeforePrint
    DeviceType = 'Screen'
    Left = 110
    Top = 5
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33338
      mmPrintPosition = 0
      object ppLabel50: TppLabel
        UserName = 'ppLabel50'
        Caption = 'Ficha Financeira por Versão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 71702
        mmTop = 26988
        mmWidth = 56886
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2117
        mmTop = 1852
        mmWidth = 32808
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5822
        mmLeft = 35719
        mmTop = 2117
        mmWidth = 133615
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
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
        mmLeft = 35719
        mmTop = 8467
        mmWidth = 25400
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 35719
        mmTop = 13758
        mmWidth = 41804
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 35719
        mmTop = 18256
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 35719
        mmTop = 22754
        mmWidth = 6085
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
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
        mmLeft = 43127
        mmTop = 22754
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 56356
        mmTop = 18256
        mmWidth = 26723
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 78846
        mmTop = 13758
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 84667
        mmTop = 18256
        mmWidth = 20108
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object dbCodRubrica: TppDBText
        UserName = 'dbCodRubrica'
        DataField = 'CODPROVDESC'
        DataPipeline = pplFichaFinancIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 529
        mmTop = 529
        mmWidth = 19844
        BandType = 4
      end
      object dbDescrRubrica: TppDBText
        UserName = 'dbDescrRubrica'
        DataField = 'DESCRICAO'
        DataPipeline = pplFichaFinancIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 23283
        mmTop = 529
        mmWidth = 105304
        BandType = 4
      end
      object dbRubProvento: TppDBText
        UserName = 'dbRubProvento'
        DataField = 'PROVENTO'
        DataPipeline = pplFichaFinancIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 137054
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object dbRubDesconto: TppDBText
        UserName = 'dbRubDesconto'
        DataField = 'DESCONTO'
        DataPipeline = pplFichaFinancIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 156634
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object dbRubInformativa: TppDBText
        UserName = 'dbRubInformativa'
        DataField = 'INFORMATIVO'
        DataPipeline = pplFichaFinancIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 175948
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppLabel78: TppLabel
        UserName = 'ppLabel78'
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
        mmWidth = 198173
        BandType = 8
      end
      object ppCalc25: TppSystemVariable
        UserName = 'Calc25'
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
        mmTop = 2910
        mmWidth = 197644
        BandType = 8
      end
      object ppCalc26: TppSystemVariable
        UserName = 'Calc26'
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
        mmTop = 2910
        mmWidth = 198173
        BandType = 8
      end
      object ppLine31: TppLine
        UserName = 'ppLine31'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        PrintBehavior = pbSection
        ResetPageNo = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 5027
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = plAgrupaRub
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 344
          Top = 272
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 56621
            mmPrintPosition = 0
            object lbTituloResumo: TppLabel
              UserName = 'lbTituloResumo'
              Caption = 'Resumo da Ficha Financeira'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 5292
              mmLeft = 62177
              mmTop = 33073
              mmWidth = 57415
              BandType = 1
            end
            object ppLine4: TppLine
              UserName = 'Line4'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 794
              mmLeft = 0
              mmTop = 55827
              mmWidth = 197300
              BandType = 1
            end
            object lbCodRubricaResumo: TppLabel
              UserName = 'lbCodRubricaResumo'
              Caption = 'Rubrica'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 2910
              mmTop = 51329
              mmWidth = 11906
              BandType = 1
            end
            object lbDescrRubricaResumo: TppLabel
              UserName = 'lbDescrRubricaResumo'
              Caption = 'Descrição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 25135
              mmTop = 51329
              mmWidth = 15346
              BandType = 1
            end
            object lbRubProvento: TppLabel
              UserName = 'lbRubProvento'
              Caption = 'Provento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 140229
              mmTop = 51329
              mmWidth = 13758
              BandType = 1
            end
            object lbRubDesconto: TppLabel
              UserName = 'lbRubDesconto'
              Caption = 'Desconto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 168275
              mmTop = 51329
              mmWidth = 14552
              BandType = 1
            end
            object ppDBImage2: TppDBImage
              UserName = 'DBImage2'
              MaintainAspectRatio = True
              Stretch = True
              DataField = 'IMAGEM'
              DataPipeline = ppFundacao
              GraphicType = 'Bitmap'
              ParentDataPipeline = False
              mmHeight = 25135
              mmLeft = 2117
              mmTop = 1852
              mmWidth = 32808
              BandType = 1
            end
            object ppDBText9: TppDBText
              UserName = 'DBText9'
              DataField = 'NOME'
              DataPipeline = ppFundacao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 14
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 5822
              mmLeft = 35719
              mmTop = 2117
              mmWidth = 133615
              BandType = 1
            end
            object ppDBText10: TppDBText
              UserName = 'DBText10'
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
              mmLeft = 35719
              mmTop = 8467
              mmWidth = 25400
              BandType = 1
            end
            object ppDBText11: TppDBText
              UserName = 'DBText11'
              DataField = 'LOGRADOURO'
              DataPipeline = ppFundacao
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3704
              mmLeft = 35719
              mmTop = 13758
              mmWidth = 41804
              BandType = 1
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              DataField = 'BAIRRO'
              DataPipeline = ppFundacao
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3704
              mmLeft = 35719
              mmTop = 18256
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
              mmLeft = 35719
              mmTop = 22754
              mmWidth = 6085
              BandType = 1
            end
            object ppDBText13: TppDBText
              UserName = 'DBText13'
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
              mmLeft = 43127
              mmTop = 22754
              mmWidth = 17198
              BandType = 1
            end
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              DataField = 'CIDADE'
              DataPipeline = ppFundacao
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3704
              mmLeft = 56356
              mmTop = 18256
              mmWidth = 26723
              BandType = 1
            end
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              DataField = 'NUMERO'
              DataPipeline = ppFundacao
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3704
              mmLeft = 78846
              mmTop = 13758
              mmWidth = 17198
              BandType = 1
            end
            object ppDBText16: TppDBText
              UserName = 'DBText16'
              DataField = 'CODESTADO'
              DataPipeline = ppFundacao
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3704
              mmLeft = 84667
              mmTop = 18256
              mmWidth = 20108
              BandType = 1
            end
            object ppLine6: TppLine
              UserName = 'Line6'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 794
              mmLeft = 0
              mmTop = 50536
              mmWidth = 197300
              BandType = 1
            end
            object ppLine7: TppLine
              UserName = 'Line7'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 794
              mmLeft = 0
              mmTop = 38894
              mmWidth = 197300
              BandType = 1
            end
            object ppLabel4: TppLabel
              UserName = 'lbCodRubricaResumo1'
              Caption = 'Nome :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 0
              mmTop = 40217
              mmWidth = 11113
              BandType = 1
            end
            object dbtnome: TppDBText
              UserName = 'dbtnome'
              DataField = 'NOME'
              DataPipeline = plAgrupaRub
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 11906
              mmTop = 40217
              mmWidth = 139436
              BandType = 1
            end
            object ppLabel5: TppLabel
              UserName = 'Label5'
              Caption = 'Sequencial  :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 153723
              mmTop = 40217
              mmWidth = 19844
              BandType = 1
            end
            object dbSequencial: TppDBText
              UserName = 'dbSequencial'
              DataField = 'NUMSEQUENCIA'
              DataPipeline = plAgrupaRub
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 175419
              mmTop = 40217
              mmWidth = 6879
              BandType = 1
            end
            object ppLabel6: TppLabel
              UserName = 'Label6'
              Caption = 'Data de Nascimento :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 0
              mmTop = 45244
              mmWidth = 32808
              BandType = 1
            end
            object dbDatanasc2: TppDBText
              UserName = 'dbDatanasc2'
              AutoSize = True
              DataField = 'DATANASC'
              DataPipeline = plAgrupaRub
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 34396
              mmTop = 45244
              mmWidth = 17727
              BandType = 1
            end
            object ppLabel7: TppLabel
              UserName = 'Label7'
              Caption = 'Isento IRRF :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 153988
              mmTop = 45508
              mmWidth = 19844
              BandType = 1
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              DataField = 'ISENTO'
              DataPipeline = plAgrupaRub
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 175419
              mmTop = 45244
              mmWidth = 12171
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object dbCodRubResumo: TppDBText
              UserName = 'dbCodRubResumo'
              DataField = 'CODPROVDESC'
              DataPipeline = plAgrupaRub
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 2910
              mmTop = 529
              mmWidth = 15346
              BandType = 4
            end
            object dbDescrRubricaResumo: TppDBText
              UserName = 'dbDescrRubricaResumo'
              DataField = 'DESCRICAO'
              DataPipeline = plAgrupaRub
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 25135
              mmTop = 529
              mmWidth = 102923
              BandType = 4
            end
            object dbRubProventoResumo: TppDBText
              UserName = 'dbRubProventoResumo'
              DataField = 'PROVENTO'
              DataPipeline = plAgrupaRub
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 140229
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
            object dbRubDescResumo: TppDBText
              UserName = 'dbRubDescResumo'
              DataField = 'DESCONTO'
              DataPipeline = plAgrupaRub
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 168275
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
          end
          object ppFooterBand2: TppFooterBand
            mmBottomOffset = 0
            mmHeight = 8731
            mmPrintPosition = 0
            object ppCalc16: TppSystemVariable
              UserName = 'Calc16'
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
              mmTop = 3175
              mmWidth = 197644
              BandType = 8
            end
            object ppCalc15: TppSystemVariable
              UserName = 'Calc15'
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
              mmLeft = 0
              mmTop = 3175
              mmWidth = 197909
              BandType = 8
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
            object lbTotGeral: TppLabel
              UserName = 'lbTotGeral'
              AutoSize = False
              Caption = 'Total Geral : '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 108215
              mmTop = 1588
              mmWidth = 19844
              BandType = 7
            end
            object ppLine5: TppLine
              UserName = 'Line5'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 0
              mmTop = 529
              mmWidth = 197300
              BandType = 7
            end
            object lbLiqGeral: TppLabel
              UserName = 'lbLiqGeral'
              Caption = 'Líquido : '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 113506
              mmTop = 6615
              mmWidth = 14552
              BandType = 7
            end
            object dbTotGeralProvento: TppDBCalc
              UserName = 'dbTotGeralProvento'
              DataField = 'PROVENTO'
              DataPipeline = plAgrupaRub
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 140229
              mmTop = 1588
              mmWidth = 17198
              BandType = 7
            end
            object dbTotGeralDesconto: TppDBCalc
              OnPrint = dbTotGeralDescontoPrint
              UserName = 'dbTotGeralDesconto'
              DataField = 'DESCONTO'
              DataPipeline = plAgrupaRub
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 168275
              mmTop = 1588
              mmWidth = 17198
              BandType = 7
            end
            object lbRecebeLiqGeral: TppLabel
              UserName = 'lbRecebeLiqGeral'
              Caption = 'lbRecebeLiqGeral'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 152665
              mmTop = 6615
              mmWidth = 32808
              BandType = 7
            end
          end
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'MES'
      DataPipeline = pplFichaFinancIndiv
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object lbAnoMes: TppLabel
          UserName = 'lbAnoMes'
          Caption = 'Ano / Mês :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 529
          mmTop = 529
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object dbAnoMes: TppDBText
          UserName = 'dbAnoMes'
          DataField = 'MES'
          DataPipeline = pplFichaFinancIndiv
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 18521
          mmTop = 529
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 5292
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'lbAnoMes1'
          Caption = 'Versão :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 47890
          mmTop = 529
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object dbVersao: TppDBText
          UserName = 'dbVersao'
          AutoSize = True
          DataField = 'HISTORICO'
          DataPipeline = pplFichaFinancIndiv
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 61383
          mmTop = 529
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object lbLiqMes: TppLabel
          UserName = 'lbLiqVersao1'
          Caption = 'Líquido do Mês : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 102129
          mmTop = 6350
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 529
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object lbTotMes: TppLabel
          UserName = 'lbTotVersao1'
          Caption = 'Total do Mês : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 106098
          mmTop = 1588
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object dbSumProvMes: TppDBCalc
          UserName = 'dbSumProvMes'
          DataField = 'PROVENTO'
          DataPipeline = pplFichaFinancIndiv
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 137054
          mmTop = 1588
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object dbSumDescMes: TppDBCalc
          OnPrint = dbSumDescMesPrint
          UserName = 'dbSumDescMes'
          DataField = 'DESCONTO'
          DataPipeline = pplFichaFinancIndiv
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 156634
          mmTop = 1588
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object lbRecebeLiqMes: TppLabel
          UserName = 'lbRecebeLiqVersao1'
          Caption = 'lbRecebeLiqMes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 148432
          mmTop = 6350
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'HISTORICO'
      DataPipeline = pplFichaFinancIndiv
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 32544
        mmPrintPosition = 0
        object dbNome: TppDBText
          UserName = 'dbNome'
          DataField = 'NOME'
          DataPipeline = pplFichaFinancIndiv
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 18521
          mmTop = 794
          mmWidth = 55827
          BandType = 3
          GroupNo = 1
        end
        object rpFichaFinancLabel1: TppLabel
          UserName = 'rpFichaFinancLabel1'
          Caption = 'Nome :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 529
          mmTop = 794
          mmWidth = 11113
          BandType = 3
          GroupNo = 1
        end
        object dbMatric: TppDBText
          UserName = 'dbMatric'
          DataField = 'MATRICULA'
          DataPipeline = pplFichaFinancIndiv
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 18521
          mmTop = 5821
          mmWidth = 26194
          BandType = 3
          GroupNo = 1
        end
        object lbMatric: TppLabel
          UserName = 'lbMatric'
          Caption = 'Matrícula :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 529
          mmTop = 5821
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object lbDataNasc: TppLabel
          UserName = 'lbDataNasc'
          Caption = 'Data de Nasc.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 141288
          mmTop = 794
          mmWidth = 22225
          BandType = 3
          GroupNo = 1
        end
        object dbDataNasc: TppDBText
          UserName = 'dbDataNasc'
          DataField = 'DATANASC'
          DataPipeline = pplFichaFinancIndiv
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 165365
          mmTop = 794
          mmWidth = 21696
          BandType = 3
          GroupNo = 1
        end
        object lbRateio: TppLabel
          UserName = 'lbRateio'
          Caption = '% Rateio :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 90488
          mmTop = 5821
          mmWidth = 15610
          BandType = 3
          GroupNo = 1
        end
        object lbIsento: TppLabel
          UserName = 'lbIsento'
          Caption = 'Isento IRRF :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 141288
          mmTop = 5821
          mmWidth = 19844
          BandType = 3
          GroupNo = 1
        end
        object dbIsento: TppDBText
          UserName = 'dbIsento'
          DataField = 'ISENTO'
          DataPipeline = pplFichaFinancIndiv
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 165365
          mmTop = 5821
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object rpFichaFinancLabel4: TppLabel
          UserName = 'rpFichaFinancLabel4'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 529
          mmTop = 26458
          mmWidth = 11906
          BandType = 3
          GroupNo = 1
        end
        object rpFichaFinancLabel5: TppLabel
          UserName = 'rpFichaFinancLabel5'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 23283
          mmTop = 26458
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
        object Provento: TppLabel
          UserName = 'Provento'
          Caption = 'Provento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 137054
          mmTop = 26458
          mmWidth = 13758
          BandType = 3
          GroupNo = 1
        end
        object Desconto: TppLabel
          UserName = 'Desconto'
          Caption = 'Desconto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 156634
          mmTop = 26723
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object rpFichaFinancLine1: TppLine
          UserName = 'rpFichaFinancLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 31485
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
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 175948
          mmTop = 26458
          mmWidth = 17463
          BandType = 3
          GroupNo = 1
        end
        object lbNumSeq: TppLabel
          UserName = 'lbNumSeq'
          Caption = 'Sequencial :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 90488
          mmTop = 794
          mmWidth = 19050
          BandType = 3
          GroupNo = 1
        end
        object dbNumSeq: TppDBText
          UserName = 'dbNumSeq'
          DataField = 'NUMSEQUENCIA'
          DataPipeline = pplFichaFinancIndiv
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 111919
          mmTop = 794
          mmWidth = 7673
          BandType = 3
          GroupNo = 1
        end
        object lbValorRateio: TppLabel
          UserName = 'lbValorRateio'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 112184
          mmTop = 5821
          mmWidth = 25929
          BandType = 3
          GroupNo = 1
        end
        object lbNomeOp1: TppLabel
          UserName = 'lbNomeOp1'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 529
          mmTop = 11642
          mmWidth = 73554
          BandType = 3
          GroupNo = 1
        end
        object lbNomeOp2: TppLabel
          UserName = 'lbNomeOp2'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 529
          mmTop = 16669
          mmWidth = 73819
          BandType = 3
          GroupNo = 1
        end
        object lbNomeOp3: TppLabel
          UserName = 'lbNomeOp3'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 794
          mmTop = 21431
          mmWidth = 73554
          BandType = 3
          GroupNo = 1
        end
        object lbValor1: TppLabel
          UserName = 'lbValor1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 76465
          mmTop = 11377
          mmWidth = 10054
          BandType = 3
          GroupNo = 1
        end
        object lbValor2: TppLabel
          UserName = 'lbValor2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 76465
          mmTop = 16669
          mmWidth = 10054
          BandType = 3
          GroupNo = 1
        end
        object lbValor3: TppLabel
          UserName = 'lbValor3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 76465
          mmTop = 21167
          mmWidth = 10054
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object lbTotVersao: TppLabel
          UserName = 'lbTotVersao'
          Caption = 'Total da Versão : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 101600
          mmTop = 1058
          mmWidth = 26988
          BandType = 5
          GroupNo = 1
        end
        object dbSumProvVersao: TppDBCalc
          UserName = 'dbSumProvVersao'
          DataField = 'PROVENTO'
          DataPipeline = pplFichaFinancIndiv
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 137054
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object dbSumDescVersao: TppDBCalc
          OnPrint = dbSumDescVersaoPrint
          UserName = 'dbSumDescVersao'
          DataField = 'DESCONTO'
          DataPipeline = pplFichaFinancIndiv
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 156634
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object lbLiqVersao: TppLabel
          UserName = 'lbLiqVersao'
          Caption = 'Líquido da Versão : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 98161
          mmTop = 5821
          mmWidth = 30692
          BandType = 5
          GroupNo = 1
        end
        object lbRecebeLiqVersao: TppLabel
          UserName = 'lbRecebeLiqVersao'
          Caption = 'lbRecebeLiqVersao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 144198
          mmTop = 5821
          mmWidth = 29633
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
    Left = 197
    Top = 53
  end
  object dsAgrupaRub: TwwDataSource
    DataSet = qryAgrupaRub
    Left = 197
    Top = 101
  end
  object qryAgrupaRub: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 197
    Top = 148
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
    Top = 148
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
    Top = 101
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 270
    Top = 53
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField11: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField12: TppField
      FieldAlias = 'BARCIDUF'
      FieldName = 'BARCIDUF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
  end
  object qryRateio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  BPV.NOMEVALORBASE1,'
      '  BPP.VALORBASE1,'
      '  BPV.NOMEVALORBASE2,'
      '  BPP.VALORBASE2,'
      '  BPV.NOMEVALORBASE3,'
      '  BPP.VALORBASE3,'
      '  BFC.PERCENTUAL'
      ''
      'FROM'
      '  BENEFPLANOPART BPP,'
      '  BENEFPLANPREV BPV,'
      '  BFCIARIOTITPLAN BFC,'
      '  BENEFICIO B'
      ''
      'WHERE'
      '  BPP.IDPESSOA(+)    = :PIDPESSOA      AND'
      '  BPP.IDPLANOPREV(+) = BPV.IDPLANOPREV AND'
      '  BPP.IDBENEFICIO(+) = BPV.IDBENEFICIO AND'
      '  BPV.FLGREFERENCIA  = 0               AND'
      '  BPV.IDPLANOPREV    = BFC.IDPLANOPREV AND'
      '  BPV.IDBENEFICIO    = BFC.IDBENEFICIO AND'
      '  BFC.IDPESSOA       = :PIDRESPONSAVEL AND'
      '  BFC.IDTITULAR      = :PIDPESSOA      AND'
      '  B.IDBENEFICIO      = BPV.IDBENEFICIO AND'
      '  B.TIPOBENEFICIO    < 99              AND'
      '  BFC.PERCENTUAL     > 0'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 336
    Top = 148
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
