inherited dtmRelAlteracaoBenefPagos: TdtmRelAlteracaoBenefPagos
  Left = 251
  Top = 258
  Width = 260
  Height = 225
  Caption = 'dtmRelAlteracaoBenefPagos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 29
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
    Left = 29
    Top = 101
  end
  inherited qryExemplo: TwwQuery
    Left = 29
    Top = 149
  end
  inherited rpExemplo: TppReport
    Left = 29
    Top = 5
  end
  object ppBenefAlter: TppBDEPipeline
    DataSource = dsBenefAlter
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'BenefAlter'
    Left = 112
    Top = 53
  end
  object dsBenefAlter: TwwDataSource
    DataSet = qryBenefAlter
    Left = 112
    Top = 101
  end
  object qryBenefAlter: TwwQuery
    BeforeOpen = qryBenefAlterBeforeOpen
    AfterOpen = qryBenefAlterAfterOpen
    AfterClose = qryBenefAlterAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PP.INSCRICAONUMERO        AS INSCRICAO    , '
      '       EL.MATRICULA              AS MATRICULA    , '
      '       SUBSTR(P1.NOME,1,30)      AS TITULAR      , '
      '       SUBSTR(P2.NOME,1,30)      AS BENEFICIARIO , '
      '       H1.VALORPREV              AS V_ANTERIOR   , '
      '       H2.VALORPREV              AS V_CORRENTE   ,'
      '       H2.VALORPREV-H1.VALORPREV AS DIFERENÇA    ,'
      '       PT.NOME                   AS PATROCINADORA,'
      '       PL.NOME                   AS PLANO        ,'
      '       BE.NOME                   AS BENEFICIO'
      'FROM HSTBENEFBFCIARIO H1, PARTPREVPLAN PP, PESSOA    P1,'
      '     HSTBENEFBFCIARIO H2, ELEGPATRO    EL, PESSOA    P2,'
      '     PESSOA           PT, PLANPREV     PL, BENEFICIO BE'
      'WHERE H1.MES           = :MESANT'
      'AND   H2.MES           = :MESATU'
      'AND   H1.IDTITULAR     = H2.IDTITULAR'
      'AND   H1.IDPESSOA      = H2.IDPESSOA'
      'AND   H1.IDPESSJUR     = H2.IDPESSJUR'
      'AND   H1.IDPLANOPREV   = H2.IDPLANOPREV'
      'AND   H1.IDBENEFICIO   = H2.IDBENEFICIO'
      'AND   H1.VALORPREV    <> H2.VALORPREV'
      'AND   PP.IDPESSOA      = H1.IDTITULAR '
      'AND   PP.IDPESSJUR     = H1.IDPESSJUR'
      'AND   PP.IDPLANOPREV   = H1.IDPLANOPREV'
      'AND   PP.SEQPROPOSTA   = 1'
      'AND   PP.FLGDESATIVADO = 0'
      'AND   EL.IDPESSOA      = H1.IDTITULAR '
      'AND   EL.IDPESSJUR     = H1.IDPESSJUR'
      'AND   P1.IDPESSOA      = H1.IDTITULAR'
      'AND   P2.IDPESSOA      = H1.IDPESSOA'
      'AND   H1.IDPESSJUR     = PT.IDPESSOA'
      'AND   H1.IDPLANOPREV   = PL.IDPLANOPREV'
      'AND   H1.IDBENEFICIO   = BE.IDBENEFICIO'
      'ORDER BY PT.NOME, PL.NOME, '
      '         BE.NOME, P2.NOME')
    ValidateWithMask = True
    Left = 112
    Top = 149
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MESANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MESATU'
        ParamType = ptUnknown
      end>
  end
  object rpBenefAlter: TppReport
    AutoStop = False
    DataPipeline = ppBenefAlter
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Rendas Alteradas'
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
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpBenefAlterBeforePrint
    DeviceType = 'Screen'
    Left = 112
    Top = 5
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 47890
      mmPrintPosition = 0
      object rpBenefAlterLabel10: TppLabel
        UserName = 'rpBenefAlterLabel10'
        Caption = 'Relatório de Alteração de Benefícios Pagos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 55033
        mmTop = 34660
        mmWidth = 87842
        BandType = 0
      end
      object rpBenefAlterDBImage1: TppDBImage
        UserName = 'rpBenefAlterDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 3175
        mmTop = 2646
        mmWidth = 32544
        BandType = 0
      end
      object rpBenefAlterDBText9: TppDBText
        UserName = 'rpBenefAlterDBText9'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 36777
        mmTop = 2910
        mmWidth = 133615
        BandType = 0
      end
      object rpBenefAlterDBText10: TppDBText
        UserName = 'rpBenefAlterDBText10'
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
        mmLeft = 36777
        mmTop = 9260
        mmWidth = 25929
        BandType = 0
      end
      object rpBenefAlterDBText11: TppDBText
        UserName = 'rpBenefAlterDBText11'
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
        mmLeft = 36777
        mmTop = 14552
        mmWidth = 41804
        BandType = 0
      end
      object rpBenefAlterDBText12: TppDBText
        UserName = 'rpBenefAlterDBText12'
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
        mmLeft = 36777
        mmTop = 19050
        mmWidth = 20108
        BandType = 0
      end
      object rpBenefAlterLabel9: TppLabel
        UserName = 'rpBenefAlterLabel9'
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
        mmWidth = 5027
        BandType = 0
      end
      object rpBenefAlterDBText13: TppDBText
        UserName = 'rpBenefAlterDBText13'
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
        mmLeft = 44186
        mmTop = 23548
        mmWidth = 17198
        BandType = 0
      end
      object rpBenefAlterDBText14: TppDBText
        UserName = 'rpBenefAlterDBText14'
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
        mmLeft = 57415
        mmTop = 19050
        mmWidth = 26723
        BandType = 0
      end
      object rpBenefAlterDBText15: TppDBText
        UserName = 'rpBenefAlterDBText15'
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
        mmLeft = 79904
        mmTop = 14552
        mmWidth = 17198
        BandType = 0
      end
      object rpBenefAlterDBText16: TppDBText
        UserName = 'rpBenefAlterDBText16'
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
        mmLeft = 85725
        mmTop = 19050
        mmWidth = 20108
        BandType = 0
      end
      object rpBenefAlterLabel16: TppLabel
        UserName = 'rpBenefAlterLabel16'
        Caption = 'REFERÊNCIA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 265
        mmTop = 43921
        mmWidth = 19315
        BandType = 0
      end
      object lblReferencia: TppLabel
        UserName = 'lblReferencia'
        Caption = 'lblReferencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 24871
        mmTop = 43921
        mmWidth = 19844
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object rpBenefAlterDBText4: TppDBText
        UserName = 'rpBenefAlterDBText4'
        DataField = 'INSCRICAO'
        DataPipeline = ppBenefAlter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object rpBenefAlterDBText5: TppDBText
        UserName = 'rpBenefAlterDBText5'
        DataField = 'MATRICULA'
        DataPipeline = ppBenefAlter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 18785
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object rpBenefAlterDBText6: TppDBText
        UserName = 'rpBenefAlterDBText6'
        DataField = 'TITULAR'
        DataPipeline = ppBenefAlter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 40481
        mmTop = 0
        mmWidth = 73025
        BandType = 4
      end
      object rpBenefAlterDBText7: TppDBText
        UserName = 'rpBenefAlterDBText7'
        DataField = 'BENEFICIARIO'
        DataPipeline = ppBenefAlter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 116417
        mmTop = 0
        mmWidth = 73025
        BandType = 4
      end
      object rpBenefAlterDBText8: TppDBText
        UserName = 'rpBenefAlterDBText8'
        DataField = 'V_ANTERIOR'
        DataPipeline = ppBenefAlter
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 196057
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
      object rpBenefAlterDBText17: TppDBText
        UserName = 'rpBenefAlterDBText17'
        DataField = 'V_CORRENTE'
        DataPipeline = ppBenefAlter
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 218282
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
      object rpBenefAlterDBText18: TppDBText
        UserName = 'rpBenefAlterDBText18'
        DataField = 'DIFERENÇA'
        DataPipeline = ppBenefAlter
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 242623
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11113
      mmPrintPosition = 0
      object ppLabel15: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel15'
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
        mmTop = 2646
        mmWidth = 262203
        BandType = 8
      end
      object ppLine14: TppLine
        UserName = 'ppLine14'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1323
        mmWidth = 284300
        BandType = 8
      end
      object ppCalc13: TppSystemVariable
        UserName = 'Calc13'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 110596
        mmTop = 2646
        mmWidth = 18785
        BandType = 8
      end
      object ppCalc14: TppSystemVariable
        UserName = 'Calc14'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 235744
        mmTop = 2646
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpBenefAlterSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
    end
    object rpBenefAlterGroup1: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = ppBenefAlter
      UserName = 'rpBenefAlterGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpBenefAlterGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object rpBenefAlterLabel1: TppLabel
          UserName = 'rpBenefAlterLabel1'
          Caption = 'PATROCINADORA :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 32015
          BandType = 3
          GroupNo = 0
        end
        object rpBenefAlterDBText1: TppDBText
          UserName = 'rpBenefAlterDBText1'
          AutoSize = True
          DataField = 'PATROCINADORA'
          DataPipeline = ppBenefAlter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 33602
          mmTop = 0
          mmWidth = 30956
          BandType = 3
          GroupNo = 0
        end
      end
      object rpBenefAlterGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object rpBenefAlterLabel15: TppLabel
          UserName = 'rpBenefAlterLabel15'
          Caption = 'TOTAL PATROCINADORA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 168011
          mmTop = 0
          mmWidth = 42333
          BandType = 5
          GroupNo = 0
        end
        object rpBenefAlterDBCalc3: TppDBCalc
          UserName = 'rpBenefAlterDBCalc3'
          AutoSize = True
          DataField = 'DIFERENÇA'
          DataPipeline = ppBenefAlter
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpBenefAlterGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 228336
          mmTop = 0
          mmWidth = 33867
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpBenefAlterGroup2: TppGroup
      BreakName = 'PLANO'
      DataPipeline = ppBenefAlter
      UserName = 'rpBenefAlterGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpBenefAlterGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object rpBenefAlterLabel2: TppLabel
          UserName = 'rpBenefAlterLabel2'
          Caption = 'PLANO :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 17992
          mmTop = 0
          mmWidth = 14023
          BandType = 3
          GroupNo = 1
        end
        object rpBenefAlterDBText2: TppDBText
          UserName = 'rpBenefAlterDBText2'
          AutoSize = True
          DataField = 'PLANO'
          DataPipeline = ppBenefAlter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 33602
          mmTop = 0
          mmWidth = 11906
          BandType = 3
          GroupNo = 1
        end
      end
      object rpBenefAlterGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object rpBenefAlterDBCalc2: TppDBCalc
          UserName = 'rpBenefAlterDBCalc2'
          AutoSize = True
          DataField = 'DIFERENÇA'
          DataPipeline = ppBenefAlter
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpBenefAlterGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 228336
          mmTop = 0
          mmWidth = 33867
          BandType = 5
          GroupNo = 1
        end
        object rpBenefAlterLabel14: TppLabel
          UserName = 'rpBenefAlterLabel14'
          Caption = 'TOTAL PLANO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 168011
          mmTop = 0
          mmWidth = 24342
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object rpBenefAlterGroup3: TppGroup
      BreakName = 'BENEFICIO'
      DataPipeline = ppBenefAlter
      NewPage = True
      UserName = 'rpBenefAlterGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpBenefAlterGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14288
        mmPrintPosition = 0
        object rpBenefAlterLabel3: TppLabel
          UserName = 'rpBenefAlterLabel3'
          Caption = 'BENEFÍCIO :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 11642
          mmTop = 0
          mmWidth = 20373
          BandType = 3
          GroupNo = 2
        end
        object rpBenefAlterDBText3: TppDBText
          UserName = 'rpBenefAlterDBText3'
          AutoSize = True
          DataField = 'BENEFICIO'
          DataPipeline = ppBenefAlter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 33602
          mmTop = 0
          mmWidth = 19315
          BandType = 3
          GroupNo = 2
        end
        object rpBenefAlterLine1: TppLine
          UserName = 'rpBenefAlterLine1'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 13229
          mmWidth = 284428
          BandType = 3
          GroupNo = 2
        end
        object rpBenefAlterLabel4: TppLabel
          UserName = 'rpBenefAlterLabel4'
          Caption = 'Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 8996
          mmWidth = 15081
          BandType = 3
          GroupNo = 2
        end
        object rpBenefAlterLabel5: TppLabel
          UserName = 'rpBenefAlterLabel5'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 19844
          mmTop = 8996
          mmWidth = 15610
          BandType = 3
          GroupNo = 2
        end
        object rpBenefAlterLabel6: TppLabel
          UserName = 'rpBenefAlterLabel6'
          Caption = 'Titular'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 40481
          mmTop = 8996
          mmWidth = 10848
          BandType = 3
          GroupNo = 2
        end
        object rpBenefAlterLabel7: TppLabel
          UserName = 'rpBenefAlterLabel7'
          Caption = 'Beneficiário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 116417
          mmTop = 8996
          mmWidth = 20373
          BandType = 3
          GroupNo = 2
        end
        object rpBenefAlterLabel8: TppLabel
          UserName = 'rpBenefAlterLabel8'
          Caption = 'Vlr Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 196321
          mmTop = 8996
          mmWidth = 19315
          BandType = 3
          GroupNo = 2
        end
        object rpBenefAlterLabel11: TppLabel
          UserName = 'rpBenefAlterLabel11'
          Caption = 'Vlr Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 223309
          mmTop = 8996
          mmWidth = 14552
          BandType = 3
          GroupNo = 2
        end
        object rpBenefAlterLabel12: TppLabel
          UserName = 'rpBenefAlterLabel12'
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 246063
          mmTop = 8996
          mmWidth = 16140
          BandType = 3
          GroupNo = 2
        end
      end
      object rpBenefAlterGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object rpBenefAlterLabel13: TppLabel
          UserName = 'rpBenefAlterLabel13'
          Caption = 'TOTAL BENEFÍCIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 168011
          mmTop = 0
          mmWidth = 30692
          BandType = 5
          GroupNo = 2
        end
        object rpBenefAlterDBCalc1: TppDBCalc
          UserName = 'rpBenefAlterDBCalc1'
          AutoSize = True
          DataField = 'DIFERENÇA'
          DataPipeline = ppBenefAlter
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpBenefAlterGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 228336
          mmTop = 0
          mmWidth = 33867
          BandType = 5
          GroupNo = 2
        end
      end
    end
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
    Left = 197
    Top = 149
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 2002
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
    Left = 197
    Top = 101
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 197
    Top = 53
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
