inherited dtmRelatEspecificos: TdtmRelatEspecificos
  Left = 209
  Top = 25
  Width = 501
  Height = 516
  Caption = 'dtmRelatEspecificos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 150
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
    Left = 92
  end
  inherited rpExemplo: TppReport
    Left = 215
    DataPipelineName = 'pplExemplo'
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL,'
      
        '       RTRIM(E.LOGRADOURO)||'#39' - '#39'||RTRIM(E.NUMERO)||'#39' '#39'||RTRIM(E' +
        '.COMPLEMENTO)||'#39' - '#39'||'
      
        '       RTRIM(E.BAIRRO)||'#39' - '#39'||RTRIM(C.NOME)||'#39' - '#39'||RTRIM(ES.CO' +
        'DESTADO) AS LOGRADOURO,'
      '       E.IDENDERECO,E.CEP, I.IMAGEM'
      'FROM   PESSOA P, ENDPESS E, IMAGENS I, CIDADES C, ESTADO ES'
      'WHERE ( P.IDPESSOA      = :pFundacao      )'
      'AND   ( E.IDENDERECO(+) = P.IDENDCOMERCIAL)'
      'AND   ( C.IDCIDADES(+)  = E.IDCIDADES     )'
      'AND   ( ES.IDESTADO(+)  = C.IDESTADO      )'
      'AND   ( I.IDIMAGEM(+)   = P.IDIMAGEM      )'
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 312
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 364
    Top = 16
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 422
    Top = 16
  end
  object ppEnquadramento: TppBDEPipeline
    DataSource = dsEnquadramento
    UserName = 'Enquadramento'
    Left = 153
    Top = 73
    object ppEnquadramentoppField1: TppField
      FieldAlias = 'NOMEPESSOA'
      FieldName = 'NOMEPESSOA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppEnquadramentoppField2: TppField
      FieldAlias = 'CPF'
      FieldName = 'CPF'
      FieldLength = 18
      DisplayWidth = 18
      Position = 1
    end
    object ppEnquadramentoppField3: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppEnquadramentoppField4: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 3
    end
    object ppEnquadramentoppField5: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object ppEnquadramentoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'GRUPORELATORIO'
      FieldName = 'GRUPORELATORIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppEnquadramentoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'SECAORELATORIO'
      FieldName = 'SECAORELATORIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppEnquadramentoppField8: TppField
      FieldAlias = 'DATAINICIO'
      FieldName = 'DATAINICIO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object ppEnquadramentoppField9: TppField
      FieldAlias = 'DATAFINAL'
      FieldName = 'DATAFINAL'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object ppEnquadramentoppField10: TppField
      FieldAlias = 'NOMEITEM'
      FieldName = 'NOMEITEM'
      FieldLength = 5
      DisplayWidth = 5
      Position = 9
    end
    object ppEnquadramentoppField11: TppField
      FieldAlias = 'VALORITEM'
      FieldName = 'VALORITEM'
      FieldLength = 40
      DisplayWidth = 40
      Position = 10
    end
    object ppEnquadramentoppField12: TppField
      FieldAlias = 'DESCGRUPO'
      FieldName = 'DESCGRUPO'
      FieldLength = 29
      DisplayWidth = 29
      Position = 11
    end
    object ppEnquadramentoppField13: TppField
      FieldAlias = 'DESCITEM'
      FieldName = 'DESCITEM'
      FieldLength = 40
      DisplayWidth = 40
      Position = 12
    end
  end
  object dsEnquadramento: TwwDataSource
    DataSet = qryEnquadramento
    Left = 95
    Top = 73
  end
  object qryEnquadramento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.NOME AS NOMEPESSOA, P.NUMDOCUMENTO AS CPF, PAT.NOME AS ' +
        'PATROCINADORA,'
      '       EL.MATRICULA, PL.NOME AS PLANO,'
      
        '       EVOLUCAO.GRUPORELATORIO, EVOLUCAO.SECAORELATORIO, EVOLUCA' +
        'O.DATAINICIO,'
      
        '       EVOLUCAO.DATAFINAL, EVOLUCAO.NOMEITEM, EVOLUCAO.VALORITEM' +
        ', EVOLUCAO.DESCGRUPO ,'
      '       EVOLUCAO.DESCITEM'
      
        'FROM   PESSOA P, PESSOA PAT, ELEGPATRO EL, PARTPREVPLAN PP, PLAN' +
        'PREV PL,'
      '       (SELECT 1 AS GRUPORELATORIO,'
      '               1 AS SECAORELATORIO,'
      '               EV.IDPESSOA,'
      '               EV.DATAINICIO, EV.DATAFINAL,'
      '               '#39'CARGO'#39' AS NOMEITEM,'
      '               CEXT.CODIGO AS VALORITEM,'
      '               CEXT.TITULO AS DESCITEM,'
      '               '#39'1 - SITUAÇÃO FUNCIONAL NO PBC'#39' AS DESCGRUPO'
      
        '       FROM    PESSOA P, PESSOA PAT, PESSOAFISICA PF, EVOLFUNCPR' +
        'EV EV,'
      '               CARGOEXT CEXT'
      '       WHERE   EV.IDPESSOA       = :IDPESSOA'
      '       AND     P.IDPESSOA        = EV.IDPESSOA'
      '       AND     PF.IDPESSOA       = EV.IDPESSOA'
      '       AND     PAT.IDPESSOA      = EV.IDPESSJUR'
      '       AND     CEXT.IDCARGOEXT   = EV.IDCARGOEXT'
      '       UNION'
      '       SELECT  1 AS GRUPORELATORIO,'
      '               2 AS SECAORELATORIO,'
      '               EV.IDPESSOA,'
      '               EV.DATAINICIO, EV.DATAFINAL,'
      '               '#39'ATS'#39' AS NOMEITEM,'
      '               TO_CHAR(EV.PERCATS) AS VALORITEM,'
      '               '#39' '#39' AS DESCITEM,'
      '                 '#39'1 - SITUAÇÃO FUNCIONAL NO PBC'#39' AS DESCGRUPO'
      
        '       FROM    PESSOA P, PESSOA PAT, PESSOAFISICA PF, EVOLFUNCPR' +
        'EV EV'
      '       WHERE   EV.IDPESSOA       = :IDPESSOA'
      '       AND     P.IDPESSOA        = EV.IDPESSOA'
      '       AND     PF.IDPESSOA       = EV.IDPESSOA'
      '       AND     PAT.IDPESSOA      = EV.IDPESSJUR'
      '       AND     EV.PERCATS IS NOT NULL'
      '       AND     EV.PERCATS > 0 ) EVOLUCAO'
      'WHERE  EVOLUCAO.IDPESSOA = :IDPESSOA'
      'AND    P.IDPESSOA        = EVOLUCAO.IDPESSOA'
      'AND    EL.IDPESSOA       = EVOLUCAO.IDPESSOA'
      'AND    PAT.IDPESSOA      = EL.IDPESSJUR'
      'AND    PP.IDPESSJUR      = EL.IDPESSJUR'
      'AND    PP.IDPESSOA       = EL.IDPESSOA'
      'AND    PL.IDPLANOPREV    = PP.IDPLANOPREV'
      'ORDER BY GRUPORELATORIO, SECAORELATORIO, DATAINICIO DESC')
    ValidateWithMask = True
    Left = 37
    Top = 73
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '82359'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object rpEnquadramento: TppReport
    AutoStop = False
    DataPipeline = ppEnquadramento
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    DeviceType = 'Screen'
    OnPreviewFormClose = rpEnquadramentoPreviewFormClose
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 212
    Top = 73
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppEnquadramento'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Demonstrativo de Cálculo de Enquadramento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 52652
        mmTop = 18521
        mmWidth = 91811
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24077
        mmWidth = 197300
        BandType = 0
      end
      object ppDBImage2: TppDBImage
        UserName = 'rpBoletasDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 19844
        mmLeft = 265
        mmTop = 1588
        mmWidth = 31485
        BandType = 0
      end
      object ppDBText29: TppDBText
        UserName = 'rpBoletasDBText1'
        AutoSize = True
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
        mmHeight = 5821
        mmLeft = 32808
        mmTop = 1323
        mmWidth = 14817
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'rpBoletasDBText2'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5027
        mmLeft = 32808
        mmTop = 7673
        mmWidth = 30163
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'rpBoletasDBText31'
        AutoSize = True
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
        mmHeight = 3175
        mmLeft = 32808
        mmTop = 13229
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'rpBoletasLabel24'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 106627
        mmTop = 13229
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText44: TppDBText
        UserName = 'rpBoletasDBText36'
        AutoSize = True
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
        mmHeight = 3175
        mmLeft = 113771
        mmTop = 13229
        mmWidth = 5821
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VALORITEM'
        DataPipeline = ppEnquadramento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEnquadramento'
        mmHeight = 3704
        mmLeft = 11377
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DATAINICIO'
        DataPipeline = ppEnquadramento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEnquadramento'
        mmHeight = 3704
        mmLeft = 33073
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DATAFINAL'
        DataPipeline = ppEnquadramento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEnquadramento'
        mmHeight = 3703
        mmLeft = 56886
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'DESCITEM'
        DataPipeline = ppEnquadramento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEnquadramento'
        mmHeight = 3175
        mmLeft = 78317
        mmTop = 265
        mmWidth = 14552
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentHeight = True
        Position = lpRight
        Weight = 0.75
        mmHeight = 4498
        mmLeft = 197300
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 4233
        mmWidth = 197300
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4498
        mmLeft = 30956
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4498
        mmLeft = 54769
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line102'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4498
        mmLeft = 76729
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
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
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'AdmPREV'
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
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand11: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppSubEnqSecao2: TppSubReport
        UserName = 'SubEnqSecao2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppEnqSecao2'
        mmHeight = 4763
        mmLeft = 0
        mmTop = 264
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppEnqSecao2
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 381
          Top = 249
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppEnqSecao2'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 12171
            mmPrintPosition = 0
            object ppShape4: TppShape
              UserName = 'Shape4'
              Brush.Color = clSilver
              mmHeight = 5027
              mmLeft = 0
              mmTop = 7144
              mmWidth = 87842
              BandType = 1
            end
            object ppLabel7: TppLabel
              UserName = 'Label7'
              Caption = '2 - SITUAÇÃO FUNCIONAL NA DIB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 4763
              mmTop = 2381
              mmWidth = 45244
              BandType = 1
            end
            object ppLabel8: TppLabel
              UserName = 'Label8'
              Caption = 'COMPONENTES'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 4763
              mmTop = 8202
              mmWidth = 21431
              BandType = 1
            end
            object ppLabel9: TppLabel
              UserName = 'Label9'
              Caption = 'VALOR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 69321
              mmTop = 8202
              mmWidth = 10054
              BandType = 1
            end
            object ppLine13: TppLine
              UserName = 'Line13'
              ParentWidth = True
              Style = lsDouble
              Weight = 0.75
              mmHeight = 794
              mmLeft = 0
              mmTop = 529
              mmWidth = 197300
              BandType = 1
            end
            object ppLine23: TppLine
              UserName = 'Line23'
              Position = lpRight
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 52123
              mmTop = 7673
              mmWidth = 265
              BandType = 1
            end
            object ppShape10: TppShape
              UserName = 'Shape10'
              Brush.Color = clSilver
              mmHeight = 5027
              mmLeft = 109538
              mmTop = 7144
              mmWidth = 87842
              BandType = 1
            end
            object ppLabel106: TppLabel
              UserName = 'Label106'
              Caption = 'COMPONENTES'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 115359
              mmTop = 8202
              mmWidth = 21431
              BandType = 1
            end
            object ppLabel107: TppLabel
              UserName = 'Label107'
              Caption = 'PERCENTUAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 174361
              mmTop = 8202
              mmWidth = 18521
              BandType = 1
            end
            object ppLine43: TppLine
              UserName = 'Line43'
              Position = lpRight
              Weight = 0.75
              mmHeight = 5027
              mmLeft = 170392
              mmTop = 7144
              mmWidth = 265
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object ppDBText1: TppDBText
              UserName = 'DBText1'
              DataField = 'DESCITEM'
              DataPipeline = ppEnqSecao2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppEnqSecao2'
              mmHeight = 3175
              mmLeft = 4763
              mmTop = 794
              mmWidth = 46831
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'VALORITEM'
              DataPipeline = ppEnqSecao2
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppEnqSecao2'
              mmHeight = 3175
              mmLeft = 62177
              mmTop = 794
              mmWidth = 17198
              BandType = 4
            end
            object ppLine16: TppLine
              UserName = 'Line16'
              Position = lpBottom
              Weight = 0.75
              mmHeight = 265
              mmLeft = 0
              mmTop = 4498
              mmWidth = 87577
              BandType = 4
            end
            object ppLine17: TppLine
              UserName = 'Line17'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4763
              mmLeft = 0
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine18: TppLine
              UserName = 'Line18'
              ParentHeight = True
              Position = lpRight
              Weight = 0.75
              mmHeight = 4763
              mmLeft = 87313
              mmTop = 0
              mmWidth = 529
              BandType = 4
            end
            object ppLine25: TppLine
              UserName = 'Line25'
              ParentHeight = True
              Position = lpRight
              Weight = 0.75
              mmHeight = 4763
              mmLeft = 52123
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppDBText27: TppDBText
              UserName = 'DBText27'
              DataField = 'DESCITEMPERC'
              DataPipeline = ppEnqSecao2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppEnqSecao2'
              mmHeight = 3175
              mmLeft = 115359
              mmTop = 794
              mmWidth = 48154
              BandType = 4
            end
            object ppDBText31: TppDBText
              UserName = 'DBText31'
              BlankWhenZero = True
              DataField = 'PERCITEM'
              DataPipeline = ppEnqSecao2
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppEnqSecao2'
              mmHeight = 3175
              mmLeft = 175684
              mmTop = 794
              mmWidth = 17198
              BandType = 4
            end
            object ppLine54: TppLine
              UserName = 'Line54'
              Position = lpBottom
              Weight = 0.75
              mmHeight = 265
              mmLeft = 109802
              mmTop = 4498
              mmWidth = 87577
              BandType = 4
            end
            object ppLine61: TppLine
              UserName = 'Line61'
              ParentHeight = True
              Position = lpRight
              Weight = 0.75
              mmHeight = 4763
              mmLeft = 196850
              mmTop = 0
              mmWidth = 529
              BandType = 4
            end
            object ppLine62: TppLine
              UserName = 'Line62'
              ParentHeight = True
              Position = lpRight
              Weight = 0.75
              mmHeight = 4763
              mmLeft = 170392
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine63: TppLine
              UserName = 'Line63'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4763
              mmLeft = 109538
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 11113
            mmPrintPosition = 0
            object ppShape5: TppShape
              UserName = 'Shape5'
              Brush.Color = clSilver
              mmHeight = 5027
              mmLeft = 0
              mmTop = 0
              mmWidth = 87842
              BandType = 7
            end
            object ppSubEnqSecao3: TppSubReport
              UserName = 'SubEnqSecao3'
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              TraverseAllData = False
              DataPipelineName = 'ppEnqSecao3'
              mmHeight = 5027
              mmLeft = 0
              mmTop = 6085
              mmWidth = 197300
              BandType = 7
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object ppChildReport2: TppChildReport
                AutoStop = False
                DataPipeline = ppEnqSecao3
                PrinterSetup.BinName = 'Default'
                PrinterSetup.DocumentName = 'PpModeloReport1'
                PrinterSetup.PaperName = 'A4 210 x 297 mm'
                PrinterSetup.PrinterName = 'Default'
                PrinterSetup.mmMarginBottom = 6350
                PrinterSetup.mmMarginLeft = 6350
                PrinterSetup.mmMarginRight = 6350
                PrinterSetup.mmMarginTop = 6350
                PrinterSetup.mmPaperHeight = 297000
                PrinterSetup.mmPaperWidth = 210000
                PrinterSetup.PaperSize = 9
                Template.SaveTo = stDatabase
                Left = 237
                Top = 120
                Version = '7.04'
                mmColumnWidth = 0
                DataPipelineName = 'ppEnqSecao3'
                object ppTitleBand2: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 13758
                  mmPrintPosition = 0
                  object ppShape1: TppShape
                    UserName = 'Shape1'
                    Brush.Color = clSilver
                    mmHeight = 5821
                    mmLeft = 0
                    mmTop = 7938
                    mmWidth = 88106
                    BandType = 1
                  end
                  object ppLabel10: TppLabel
                    UserName = 'Label10'
                    Caption = '3 - MÉDIA DOS VALORES NO PBC'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 4763
                    mmTop = 2910
                    mmWidth = 45244
                    BandType = 1
                  end
                  object ppLine26: TppLine
                    UserName = 'Line26'
                    ParentWidth = True
                    Style = lsDouble
                    Weight = 0.75
                    mmHeight = 1058
                    mmLeft = 0
                    mmTop = 1058
                    mmWidth = 197300
                    BandType = 1
                  end
                  object ppLabel11: TppLabel
                    UserName = 'Label1'
                    Caption = 'COMPONENTES'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3175
                    mmLeft = 4498
                    mmTop = 9260
                    mmWidth = 21696
                    BandType = 1
                  end
                  object ppLabel12: TppLabel
                    UserName = 'Label12'
                    Caption = 'VALOR'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    TextAlignment = taRightJustified
                    Transparent = True
                    mmHeight = 3704
                    mmLeft = 69056
                    mmTop = 9260
                    mmWidth = 10054
                    BandType = 1
                  end
                  object ppLine30: TppLine
                    UserName = 'Line30'
                    Position = lpRight
                    Weight = 0.75
                    mmHeight = 5292
                    mmLeft = 52123
                    mmTop = 8202
                    mmWidth = 265
                    BandType = 1
                  end
                end
                object ppDetailBand3: TppDetailBand
                  mmBottomOffset = 0
                  mmHeight = 4498
                  mmPrintPosition = 0
                  object ppDBText9: TppDBText
                    UserName = 'DBText9'
                    AutoSize = True
                    DataField = 'DESCITEM'
                    DataPipeline = ppEnqSecao3
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppEnqSecao3'
                    mmHeight = 3175
                    mmLeft = 4498
                    mmTop = 529
                    mmWidth = 14552
                    BandType = 4
                  end
                  object ppDBText10: TppDBText
                    UserName = 'DBText10'
                    DataField = 'VALORITEM'
                    DataPipeline = ppEnqSecao3
                    DisplayFormat = '#,0.00;-#,0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppEnqSecao3'
                    mmHeight = 3175
                    mmLeft = 61913
                    mmTop = 529
                    mmWidth = 17198
                    BandType = 4
                  end
                  object ppLine32: TppLine
                    UserName = 'Line32'
                    Position = lpBottom
                    Weight = 0.75
                    mmHeight = 265
                    mmLeft = 265
                    mmTop = 4233
                    mmWidth = 87577
                    BandType = 4
                  end
                  object ppLine33: TppLine
                    UserName = 'Line33'
                    ParentHeight = True
                    Position = lpLeft
                    Weight = 0.75
                    mmHeight = 4498
                    mmLeft = 0
                    mmTop = 0
                    mmWidth = 265
                    BandType = 4
                  end
                  object ppLine34: TppLine
                    UserName = 'Line34'
                    ParentHeight = True
                    Position = lpRight
                    Weight = 0.75
                    mmHeight = 4498
                    mmLeft = 87577
                    mmTop = 0
                    mmWidth = 529
                    BandType = 4
                  end
                  object ppLine35: TppLine
                    UserName = 'Line35'
                    ParentHeight = True
                    Position = lpRight
                    Weight = 0.75
                    mmHeight = 4498
                    mmLeft = 52123
                    mmTop = 0
                    mmWidth = 265
                    BandType = 4
                  end
                end
                object ppSummaryBand2: TppSummaryBand
                  NewPage = True
                  PrintHeight = phDynamic
                  mmBottomOffset = 0
                  mmHeight = 5027
                  mmPrintPosition = 0
                  object ppSubEnqSecao4: TppSubReport
                    UserName = 'SubEnqSecao4'
                    ExpandAll = False
                    NewPrintJob = False
                    OutlineSettings.CreateNode = True
                    TraverseAllData = False
                    DataPipelineName = 'ppEnqSecao4'
                    mmHeight = 5027
                    mmLeft = 0
                    mmTop = 0
                    mmWidth = 197300
                    BandType = 7
                    mmBottomOffset = 0
                    mmOverFlowOffset = 0
                    mmStopPosition = 0
                    object ppChildReport3: TppChildReport
                      AutoStop = False
                      DataPipeline = ppEnqSecao4
                      PrinterSetup.BinName = 'Default'
                      PrinterSetup.DocumentName = 'PpModeloReport1'
                      PrinterSetup.PaperName = 'A4 210 x 297 mm'
                      PrinterSetup.PrinterName = 'Default'
                      PrinterSetup.mmMarginBottom = 6350
                      PrinterSetup.mmMarginLeft = 6350
                      PrinterSetup.mmMarginRight = 6350
                      PrinterSetup.mmMarginTop = 6350
                      PrinterSetup.mmPaperHeight = 297000
                      PrinterSetup.mmPaperWidth = 210000
                      PrinterSetup.PaperSize = 9
                      Template.SaveTo = stDatabase
                      Left = 246
                      Top = 156
                      Version = '7.04'
                      mmColumnWidth = 0
                      DataPipelineName = 'ppEnqSecao4'
                      object ppTitleBand3: TppTitleBand
                        mmBottomOffset = 0
                        mmHeight = 9525
                        mmPrintPosition = 0
                        object ppLabel17: TppLabel
                          UserName = 'Label17'
                          Caption = 'VALORES NO PBC - PARA SIMPLES CONFERÊNCIA'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 10
                          Font.Style = [fsBold]
                          Transparent = True
                          mmHeight = 4233
                          mmLeft = 54240
                          mmTop = 1588
                          mmWidth = 88636
                          BandType = 1
                        end
                        object ppLine14: TppLine
                          UserName = 'Line14'
                          ParentWidth = True
                          Weight = 0.75
                          mmHeight = 265
                          mmLeft = 0
                          mmTop = 7408
                          mmWidth = 197300
                          BandType = 1
                        end
                      end
                      object ppDetailBand4: TppDetailBand
                        mmBottomOffset = 0
                        mmHeight = 4233
                        mmPrintPosition = 0
                        object ppShapeEnqValorTotais: TppShape
                          UserName = 'ShapeEnqValorTotais'
                          ParentHeight = True
                          mmHeight = 4233
                          mmLeft = 170127
                          mmTop = 0
                          mmWidth = 26723
                          BandType = 4
                        end
                        object ppShape8: TppShape
                          UserName = 'Shape8'
                          ParentHeight = True
                          mmHeight = 4233
                          mmLeft = 265
                          mmTop = 0
                          mmWidth = 164836
                          BandType = 4
                        end
                        object ppDBText12: TppDBText
                          UserName = 'DBText12'
                          DataField = 'MESANO'
                          DataPipeline = ppEnqSecao4
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 9
                          Font.Style = []
                          TextAlignment = taRightJustified
                          Transparent = True
                          DataPipelineName = 'ppEnqSecao4'
                          mmHeight = 3704
                          mmLeft = 10848
                          mmTop = 529
                          mmWidth = 17198
                          BandType = 4
                        end
                        object ppDBText13: TppDBText
                          UserName = 'DBText13'
                          DataField = 'COLUNA1'
                          DataPipeline = ppEnqSecao4
                          DisplayFormat = '#,0.00;-#,0.00'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 9
                          Font.Style = []
                          TextAlignment = taRightJustified
                          Transparent = True
                          DataPipelineName = 'ppEnqSecao4'
                          mmHeight = 3704
                          mmLeft = 42598
                          mmTop = 529
                          mmWidth = 17198
                          BandType = 4
                        end
                        object ppDBText14: TppDBText
                          UserName = 'DBText14'
                          DataField = 'COLUNA2'
                          DataPipeline = ppEnqSecao4
                          DisplayFormat = '#,0.00;-#,0.00'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 9
                          Font.Style = []
                          TextAlignment = taRightJustified
                          Transparent = True
                          DataPipelineName = 'ppEnqSecao4'
                          mmHeight = 3704
                          mmLeft = 76200
                          mmTop = 529
                          mmWidth = 17198
                          BandType = 4
                        end
                        object ppDBText15: TppDBText
                          UserName = 'DBText15'
                          DataField = 'COLUNA3'
                          DataPipeline = ppEnqSecao4
                          DisplayFormat = '#,0.00;-#,0.00'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 9
                          Font.Style = []
                          TextAlignment = taRightJustified
                          Transparent = True
                          DataPipelineName = 'ppEnqSecao4'
                          mmHeight = 3704
                          mmLeft = 109802
                          mmTop = 529
                          mmWidth = 17198
                          BandType = 4
                        end
                        object ppDBText16: TppDBText
                          UserName = 'DBText16'
                          DataField = 'COLUNA4'
                          DataPipeline = ppEnqSecao4
                          DisplayFormat = '#,0.00;-#,0.00'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 9
                          Font.Style = []
                          TextAlignment = taRightJustified
                          Transparent = True
                          DataPipelineName = 'ppEnqSecao4'
                          mmHeight = 3704
                          mmLeft = 143404
                          mmTop = 529
                          mmWidth = 17198
                          BandType = 4
                        end
                        object ppLblSubEnq4ValorColuna5: TppDBText
                          UserName = 'LblSubEnq4ValorColuna5'
                          DataField = 'COLUNA5'
                          DataPipeline = ppEnqSecao4
                          DisplayFormat = '#,0.00;-#,0.00'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 9
                          Font.Style = []
                          TextAlignment = taRightJustified
                          Transparent = True
                          DataPipelineName = 'ppEnqSecao4'
                          mmHeight = 3704
                          mmLeft = 177007
                          mmTop = 529
                          mmWidth = 17198
                          BandType = 4
                        end
                        object ppLine29: TppLine
                          UserName = 'Line29'
                          ParentHeight = True
                          Position = lpRight
                          Weight = 0.75
                          mmHeight = 4233
                          mmLeft = 30427
                          mmTop = 0
                          mmWidth = 794
                          BandType = 4
                        end
                        object ppLine31: TppLine
                          UserName = 'Line31'
                          ParentHeight = True
                          Position = lpRight
                          Weight = 0.75
                          mmHeight = 4233
                          mmLeft = 63765
                          mmTop = 0
                          mmWidth = 794
                          BandType = 4
                        end
                        object ppLine39: TppLine
                          UserName = 'Line39'
                          ParentHeight = True
                          Position = lpRight
                          Weight = 0.75
                          mmHeight = 4233
                          mmLeft = 97631
                          mmTop = 0
                          mmWidth = 265
                          BandType = 4
                        end
                        object ppLine41: TppLine
                          UserName = 'Line41'
                          ParentHeight = True
                          Position = lpRight
                          Weight = 0.75
                          mmHeight = 4233
                          mmLeft = 130969
                          mmTop = 0
                          mmWidth = 794
                          BandType = 4
                        end
                      end
                      object ppSummaryBand3: TppSummaryBand
                        mmBottomOffset = 0
                        mmHeight = 0
                        mmPrintPosition = 0
                      end
                      object ppGroup5: TppGroup
                        BreakName = 'GRUPO'
                        DataPipeline = ppEnqSecao4
                        OutlineSettings.CreateNode = True
                        ReprintOnSubsequentPage = False
                        UserName = 'Group5'
                        mmNewColumnThreshold = 0
                        mmNewPageThreshold = 0
                        DataPipelineName = 'ppEnqSecao4'
                        object ppGroupHeaderBand5: TppGroupHeaderBand
                          BeforePrint = ppGroupHeaderBand5BeforePrint
                          mmBottomOffset = 0
                          mmHeight = 8731
                          mmPrintPosition = 0
                          object ppShapeEnqTituloTotais: TppShape
                            UserName = 'ShapeEnqTituloTotais'
                            mmHeight = 8996
                            mmLeft = 170127
                            mmTop = 0
                            mmWidth = 26723
                            BandType = 3
                            GroupNo = 0
                          end
                          object ppShape7: TppShape
                            UserName = 'Shape7'
                            mmHeight = 8996
                            mmLeft = 265
                            mmTop = 0
                            mmWidth = 164836
                            BandType = 3
                            GroupNo = 0
                          end
                          object ppLabel18: TppLabel
                            UserName = 'Label18'
                            Caption = 'MM/AAAA'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Name = 'Arial'
                            Font.Size = 9
                            Font.Style = [fsBold]
                            TextAlignment = taRightJustified
                            Transparent = True
                            mmHeight = 3969
                            mmLeft = 12435
                            mmTop = 265
                            mmWidth = 15610
                            BandType = 3
                            GroupNo = 0
                          end
                          object ppLblSubEnq4TituloColuna1: TppLabel
                            UserName = 'LblSubEnq4TituloColuna1'
                            CharWrap = True
                            AutoSize = False
                            Caption = 'ADICIONAL NOTURNO'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Name = 'Arial'
                            Font.Size = 9
                            Font.Style = [fsBold]
                            TextAlignment = taRightJustified
                            Transparent = True
                            WordWrap = True
                            mmHeight = 8467
                            mmLeft = 36513
                            mmTop = 264
                            mmWidth = 23283
                            BandType = 3
                            GroupNo = 0
                          end
                          object ppLblSubEnq4TituloColuna2: TppLabel
                            UserName = 'LblSubEnq4TituloColuna2'
                            CharWrap = True
                            AutoSize = False
                            Caption = 'COLUNA2'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Name = 'Arial'
                            Font.Size = 9
                            Font.Style = [fsBold]
                            TextAlignment = taRightJustified
                            Transparent = True
                            WordWrap = True
                            mmHeight = 8467
                            mmLeft = 70115
                            mmTop = 264
                            mmWidth = 23283
                            BandType = 3
                            GroupNo = 0
                          end
                          object ppLblSubEnq4TituloColuna3: TppLabel
                            UserName = 'LblSubEnq4TituloColuna3'
                            CharWrap = True
                            AutoSize = False
                            Caption = 'COLUNA3'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Name = 'Arial'
                            Font.Size = 9
                            Font.Style = [fsBold]
                            TextAlignment = taRightJustified
                            Transparent = True
                            WordWrap = True
                            mmHeight = 8467
                            mmLeft = 103717
                            mmTop = 264
                            mmWidth = 23283
                            BandType = 3
                            GroupNo = 0
                          end
                          object ppLblSubEnq4TituloColuna4: TppLabel
                            UserName = 'LblSubEnq4TituloColuna4'
                            CharWrap = True
                            AutoSize = False
                            Caption = 'COLUNA4'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Name = 'Arial'
                            Font.Size = 9
                            Font.Style = [fsBold]
                            TextAlignment = taRightJustified
                            Transparent = True
                            WordWrap = True
                            mmHeight = 8467
                            mmLeft = 137319
                            mmTop = 264
                            mmWidth = 23283
                            BandType = 3
                            GroupNo = 0
                          end
                          object ppLblSubEnq4TituloColuna5: TppLabel
                            UserName = 'LblSubEnq4TituloColuna5'
                            CharWrap = True
                            AutoSize = False
                            Caption = 'TOTAIS'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Name = 'Arial'
                            Font.Size = 9
                            Font.Style = [fsBold]
                            TextAlignment = taRightJustified
                            Transparent = True
                            WordWrap = True
                            mmHeight = 8467
                            mmLeft = 172244
                            mmTop = 264
                            mmWidth = 23283
                            BandType = 3
                            GroupNo = 0
                          end
                          object ppLine15: TppLine
                            UserName = 'Line15'
                            Position = lpRight
                            Weight = 0.75
                            mmHeight = 8996
                            mmLeft = 30956
                            mmTop = 0
                            mmWidth = 265
                            BandType = 3
                            GroupNo = 0
                          end
                          object ppLine19: TppLine
                            UserName = 'Line19'
                            Position = lpRight
                            Weight = 0.75
                            mmHeight = 8996
                            mmLeft = 64294
                            mmTop = 0
                            mmWidth = 265
                            BandType = 3
                            GroupNo = 0
                          end
                          object ppLine22: TppLine
                            UserName = 'Line22'
                            Position = lpRight
                            Weight = 0.75
                            mmHeight = 8996
                            mmLeft = 97631
                            mmTop = 0
                            mmWidth = 265
                            BandType = 3
                            GroupNo = 0
                          end
                          object ppLine27: TppLine
                            UserName = 'Line27'
                            Position = lpRight
                            Weight = 0.75
                            mmHeight = 8996
                            mmLeft = 131498
                            mmTop = 0
                            mmWidth = 265
                            BandType = 3
                            GroupNo = 0
                          end
                        end
                        object ppGroupFooterBand5: TppGroupFooterBand
                          mmBottomOffset = 0
                          mmHeight = 2910
                          mmPrintPosition = 0
                        end
                      end
                    end
                  end
                end
                object ppGroup4: TppGroup
                  BreakName = 'ppLabel12'
                  BreakType = btCustomField
                  KeepTogether = True
                  OutlineSettings.CreateNode = True
                  UserName = 'Group4'
                  mmNewColumnThreshold = 0
                  mmNewPageThreshold = 0
                  DataPipelineName = ''
                  object ppGroupHeaderBand4: TppGroupHeaderBand
                    mmBottomOffset = 0
                    mmHeight = 0
                    mmPrintPosition = 0
                  end
                  object ppGroupFooterBand4: TppGroupFooterBand
                    mmBottomOffset = 0
                    mmHeight = 5027
                    mmPrintPosition = 0
                    object ppShape3: TppShape
                      UserName = 'Shape3'
                      Brush.Color = clSilver
                      mmHeight = 5027
                      mmLeft = 0
                      mmTop = 0
                      mmWidth = 87842
                      BandType = 5
                      GroupNo = 0
                    end
                    object ppLabel14: TppLabel
                      UserName = 'Label2'
                      Caption = 'Total'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 8
                      Font.Style = [fsBold]
                      TextAlignment = taRightJustified
                      Transparent = True
                      mmHeight = 3704
                      mmLeft = 4233
                      mmTop = 794
                      mmWidth = 7144
                      BandType = 5
                      GroupNo = 0
                    end
                    object ppLine77: TppLine
                      UserName = 'Line77'
                      Position = lpRight
                      Weight = 0.75
                      mmHeight = 4763
                      mmLeft = 53446
                      mmTop = 264
                      mmWidth = 794
                      BandType = 5
                      GroupNo = 0
                    end
                    object ppDBCalc2: TppDBCalc
                      UserName = 'DBCalc2'
                      DataField = 'VALORITEM'
                      DataPipeline = ppEnqSecao3
                      DisplayFormat = '#,0.00;-#,0.00'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 8
                      Font.Style = [fsBold]
                      ResetGroup = ppGroup4
                      TextAlignment = taRightJustified
                      Transparent = True
                      DataPipelineName = 'ppEnqSecao3'
                      mmHeight = 3175
                      mmLeft = 61648
                      mmTop = 794
                      mmWidth = 17198
                      BandType = 5
                      GroupNo = 0
                    end
                  end
                end
                object ppGroup6: TppGroup
                  BreakName = 'ORDEM'
                  DataPipeline = ppEnqSecao3
                  KeepTogether = True
                  OutlineSettings.CreateNode = True
                  UserName = 'Group6'
                  mmNewColumnThreshold = 0
                  mmNewPageThreshold = 0
                  DataPipelineName = 'ppEnqSecao3'
                  object ppGroupHeaderBand6: TppGroupHeaderBand
                    mmBottomOffset = 0
                    mmHeight = 0
                    mmPrintPosition = 0
                  end
                  object ppGroupFooterBand6: TppGroupFooterBand
                    mmBottomOffset = 0
                    mmHeight = 5027
                    mmPrintPosition = 0
                    object ppShape2: TppShape
                      UserName = 'Shape2'
                      Brush.Color = 14540253
                      mmHeight = 5027
                      mmLeft = 0
                      mmTop = 0
                      mmWidth = 88106
                      BandType = 5
                      GroupNo = 1
                    end
                    object ppLabel13: TppLabel
                      UserName = 'Label13'
                      Caption = 'Sub-Total'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 8
                      Font.Style = [fsBold]
                      TextAlignment = taRightJustified
                      Transparent = True
                      mmHeight = 3175
                      mmLeft = 4498
                      mmTop = 1323
                      mmWidth = 12965
                      BandType = 5
                      GroupNo = 1
                    end
                    object ppDBCalc1: TppDBCalc
                      UserName = 'DBCalc1'
                      DataField = 'VALORITEM'
                      DataPipeline = ppEnqSecao3
                      DisplayFormat = '#,0.00;-#,0.00'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 8
                      Font.Style = [fsBold]
                      ResetGroup = ppGroup6
                      TextAlignment = taRightJustified
                      Transparent = True
                      DataPipelineName = 'ppEnqSecao3'
                      mmHeight = 3175
                      mmLeft = 61913
                      mmTop = 1058
                      mmWidth = 17198
                      BandType = 5
                      GroupNo = 1
                    end
                    object ppLine40: TppLine
                      UserName = 'Line40'
                      Position = lpRight
                      Weight = 0.75
                      mmHeight = 4763
                      mmLeft = 51065
                      mmTop = 0
                      mmWidth = 1323
                      BandType = 5
                      GroupNo = 1
                    end
                  end
                end
              end
            end
            object ppLabel16: TppLabel
              UserName = 'Label16'
              Caption = 'Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 5821
              mmTop = 529
              mmWidth = 6615
              BandType = 7
            end
            object ppLine52: TppLine
              UserName = 'Line52'
              Position = lpRight
              Weight = 0.75
              mmHeight = 4763
              mmLeft = 51594
              mmTop = 0
              mmWidth = 794
              BandType = 7
            end
            object ppDBCalc4: TppDBCalc
              UserName = 'DBCalc4'
              DataField = 'VALORITEM'
              DataPipeline = ppEnqSecao2
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppEnqSecao2'
              mmHeight = 3175
              mmLeft = 62177
              mmTop = 529
              mmWidth = 17198
              BandType = 7
            end
            object ppShape11: TppShape
              UserName = 'Shape11'
              Brush.Color = clWindow
              mmHeight = 5027
              mmLeft = 109538
              mmTop = 0
              mmWidth = 87842
              BandType = 7
            end
            object ppLine68: TppLine
              UserName = 'Line68'
              Position = lpRight
              Weight = 0.75
              mmHeight = 4763
              mmLeft = 169863
              mmTop = 0
              mmWidth = 794
              BandType = 7
            end
          end
          object ppGroup3: TppGroup
            BreakName = 'ORDEM'
            DataPipeline = ppEnqSecao2
            OutlineSettings.CreateNode = True
            ReprintOnSubsequentPage = False
            UserName = 'Group3'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppEnqSecao2'
            object ppGroupHeaderBand3: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroupFooterBand3: TppGroupFooterBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 5292
              mmPrintPosition = 0
              object ppShape6: TppShape
                UserName = 'Shape6'
                Brush.Color = 14540253
                mmHeight = 5292
                mmLeft = 0
                mmTop = 0
                mmWidth = 87842
                BandType = 5
                GroupNo = 0
              end
              object ppLabel15: TppLabel
                UserName = 'Label15'
                Caption = 'Sub-Total'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 6615
                mmTop = 1058
                mmWidth = 12965
                BandType = 5
                GroupNo = 0
              end
              object ppLine47: TppLine
                UserName = 'Line401'
                ParentHeight = True
                Position = lpRight
                Weight = 0.75
                mmHeight = 5292
                mmLeft = 51329
                mmTop = 0
                mmWidth = 1058
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc3: TppDBCalc
                UserName = 'DBCalc3'
                DataField = 'VALORITEM'
                DataPipeline = ppEnqSecao2
                DisplayFormat = '#,0.00;-#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                ResetGroup = ppGroup3
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppEnqSecao2'
                mmHeight = 3175
                mmLeft = 62177
                mmTop = 1058
                mmWidth = 17198
                BandType = 5
                GroupNo = 0
              end
              object ppLine64: TppLine
                UserName = 'Line64'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.75
                mmHeight = 5292
                mmLeft = 109538
                mmTop = 0
                mmWidth = 1588
                BandType = 5
                GroupNo = 0
              end
              object ppLine65: TppLine
                UserName = 'Line65'
                Weight = 0.75
                mmHeight = 265
                mmLeft = 109802
                mmTop = 5027
                mmWidth = 87577
                BandType = 5
                GroupNo = 0
              end
              object ppLine66: TppLine
                UserName = 'Line66'
                ParentHeight = True
                Position = lpRight
                Weight = 0.75
                mmHeight = 5292
                mmLeft = 195792
                mmTop = 0
                mmWidth = 1588
                BandType = 5
                GroupNo = 0
              end
              object ppLine67: TppLine
                UserName = 'Line67'
                ParentHeight = True
                Position = lpRight
                Weight = 0.75
                mmHeight = 5292
                mmLeft = 169863
                mmTop = 0
                mmWidth = 794
                BandType = 5
                GroupNo = 0
              end
            end
          end
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'GRUPORELATORIO'
      DataPipeline = ppEnquadramento
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppEnquadramento'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 20108
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Position = lpBottom
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 15081
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label4'
          Caption = '1 - SITUAÇÃO FUNCIONAL NO PBC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 4498
          mmTop = 10583
          mmWidth = 46567
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label1'
          Caption = 'Início'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 33073
          mmTop = 16140
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label2'
          Caption = 'Término'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 56886
          mmTop = 16140
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label3'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 78317
          mmTop = 16140
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppLine55: TppLine
          UserName = 'Line11'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4763
          mmLeft = 0
          mmTop = 15081
          mmWidth = 2117
          BandType = 3
          GroupNo = 0
        end
        object ppLine56: TppLine
          UserName = 'Line12'
          ParentWidth = True
          Position = lpBottom
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 19843
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLine57: TppLine
          UserName = 'Line57'
          Position = lpRight
          Weight = 0.75
          mmHeight = 5027
          mmLeft = 197300
          mmTop = 15081
          mmWidth = 265
          BandType = 3
          GroupNo = 0
        end
        object ppLine58: TppLine
          UserName = 'Line58'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 30956
          mmTop = 15346
          mmWidth = 265
          BandType = 3
          GroupNo = 0
        end
        object ppLine59: TppLine
          UserName = 'Line59'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4763
          mmLeft = 54769
          mmTop = 15081
          mmWidth = 265
          BandType = 3
          GroupNo = 0
        end
        object ppLine60: TppLine
          UserName = 'Line60'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 76729
          mmTop = 15346
          mmWidth = 265
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label5'
          Caption = 'Nome :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 4763
          mmTop = 529
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppDBText17: TppDBText
          UserName = 'DBText17'
          AutoSize = True
          DataField = 'NOMEPESSOA'
          DataPipeline = ppEnquadramento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEnquadramento'
          mmHeight = 3704
          mmLeft = 24871
          mmTop = 529
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label6'
          Caption = 'Matrícula :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 4763
          mmTop = 5027
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object ppDBText20: TppDBText
          UserName = 'DBText20'
          AutoSize = True
          DataField = 'MATRICULA'
          DataPipeline = ppEnquadramento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEnquadramento'
          mmHeight = 3704
          mmLeft = 24871
          mmTop = 5027
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          Caption = 'CPF : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 153459
          mmTop = 529
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object ppDBText21: TppDBText
          UserName = 'DBText21'
          AutoSize = True
          DataField = 'CPF'
          DataPipeline = ppEnquadramento
          DisplayFormat = '000.000.000-00;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEnquadramento'
          mmHeight = 3704
          mmLeft = 163513
          mmTop = 529
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label22'
          Caption = 'Patrocinadora :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 87313
          mmTop = 529
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
        end
        object ppDBText22: TppDBText
          UserName = 'DBText22'
          AutoSize = True
          DataField = 'PATROCINADORA'
          DataPipeline = ppEnquadramento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEnquadramento'
          mmHeight = 3704
          mmLeft = 115359
          mmTop = 529
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = 'Plano :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 87313
          mmTop = 5027
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppDBText23: TppDBText
          UserName = 'DBText23'
          AutoSize = True
          DataField = 'PLANO'
          DataPipeline = ppEnquadramento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEnquadramento'
          mmHeight = 3704
          mmLeft = 115359
          mmTop = 5027
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppLine42: TppLine
          UserName = 'Line42'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 9260
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppSubEnqSecao1: TppSubReport
          UserName = 'SubEnqSecao1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppEnqSecao1'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 1058
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport4: TppChildReport
            AutoStop = False
            DataPipeline = ppEnqSecao1
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4 210 x 297 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Left = 237
            Top = 147
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppEnqSecao1'
            object ppTitleBand4: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 5027
              mmPrintPosition = 0
              object ppShape29: TppShape
                UserName = 'Shape29'
                ParentWidth = True
                mmHeight = 5027
                mmLeft = 0
                mmTop = 0
                mmWidth = 197300
                BandType = 1
              end
              object ppLabel54: TppLabel
                UserName = 'Label54'
                Caption = 'Função'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 4763
                mmTop = 1058
                mmWidth = 9790
                BandType = 1
              end
              object ppLabel55: TppLabel
                UserName = 'Label55'
                Caption = '% PBC'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 79375
                mmTop = 1058
                mmWidth = 8731
                BandType = 1
              end
              object ppLabel56: TppLabel
                UserName = 'Label56'
                Caption = 'Modo Função'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 92075
                mmTop = 1058
                mmWidth = 17992
                BandType = 1
              end
              object ppLabel57: TppLabel
                UserName = 'Label57'
                Caption = 'Nome'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 116681
                mmTop = 1058
                mmWidth = 7673
                BandType = 1
              end
              object ppLabel58: TppLabel
                UserName = 'Label58'
                Caption = 'Início'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 33073
                mmTop = 1058
                mmWidth = 7144
                BandType = 1
              end
              object ppLabel59: TppLabel
                UserName = 'Label59'
                Caption = 'Término'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 56886
                mmTop = 1058
                mmWidth = 11113
                BandType = 1
              end
              object ppLine115: TppLine
                UserName = 'Line115'
                ParentHeight = True
                Position = lpRight
                Weight = 0.75
                mmHeight = 5027
                mmLeft = 30955
                mmTop = 0
                mmWidth = 265
                BandType = 1
              end
              object ppLine116: TppLine
                UserName = 'Line116'
                ParentHeight = True
                Position = lpRight
                Weight = 0.75
                mmHeight = 5027
                mmLeft = 54770
                mmTop = 0
                mmWidth = 265
                BandType = 1
              end
              object ppLine117: TppLine
                UserName = 'Line117'
                ParentHeight = True
                Position = lpRight
                Weight = 0.75
                mmHeight = 5027
                mmLeft = 76728
                mmTop = 0
                mmWidth = 265
                BandType = 1
              end
              object ppLine118: TppLine
                UserName = 'Line118'
                ParentHeight = True
                Position = lpRight
                Weight = 0.75
                mmHeight = 5027
                mmLeft = 90752
                mmTop = 0
                mmWidth = 265
                BandType = 1
              end
              object ppLine119: TppLine
                UserName = 'Line119'
                ParentHeight = True
                Position = lpRight
                Weight = 0.75
                mmHeight = 5027
                mmLeft = 114300
                mmTop = 0
                mmWidth = 265
                BandType = 1
              end
            end
            object ppDetailBand5: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object ppShape30: TppShape
                UserName = 'Shape30'
                ParentHeight = True
                ParentWidth = True
                mmHeight = 4498
                mmLeft = 0
                mmTop = 0
                mmWidth = 197300
                BandType = 4
              end
              object ppDBText47: TppDBText
                UserName = 'DBText47'
                DataField = 'CODIGO'
                DataPipeline = ppEnqSecao1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppEnqSecao1'
                mmHeight = 3175
                mmLeft = 4763
                mmTop = 265
                mmWidth = 17198
                BandType = 4
              end
              object ppDBText48: TppDBText
                UserName = 'DBText48'
                DataField = 'PERCPBC'
                DataPipeline = ppEnqSecao1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppEnqSecao1'
                mmHeight = 3175
                mmLeft = 77788
                mmTop = 265
                mmWidth = 11906
                BandType = 4
              end
              object ppDBText49: TppDBText
                UserName = 'DBText49'
                DataField = 'MODO'
                DataPipeline = ppEnqSecao1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppEnqSecao1'
                mmHeight = 3175
                mmLeft = 92075
                mmTop = 265
                mmWidth = 17198
                BandType = 4
              end
              object ppDBText50: TppDBText
                UserName = 'DBText50'
                AutoSize = True
                DataField = 'NOME'
                DataPipeline = ppEnqSecao1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppEnqSecao1'
                mmHeight = 3175
                mmLeft = 116681
                mmTop = 265
                mmWidth = 8467
                BandType = 4
              end
              object ppDBText51: TppDBText
                UserName = 'DBText51'
                DataField = 'DATAINICIO'
                DataPipeline = ppEnqSecao1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppEnqSecao1'
                mmHeight = 3175
                mmLeft = 33073
                mmTop = 265
                mmWidth = 17198
                BandType = 4
              end
              object ppDBText52: TppDBText
                UserName = 'DBText52'
                DataField = 'DATAFINAL'
                DataPipeline = ppEnqSecao1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppEnqSecao1'
                mmHeight = 3175
                mmLeft = 56886
                mmTop = 265
                mmWidth = 17198
                BandType = 4
              end
              object ppLine120: TppLine
                UserName = 'Line120'
                ParentHeight = True
                Position = lpRight
                Weight = 0.75
                mmHeight = 4498
                mmLeft = 30427
                mmTop = 0
                mmWidth = 794
                BandType = 4
              end
              object ppLine121: TppLine
                UserName = 'Line1201'
                ParentHeight = True
                Position = lpRight
                Weight = 0.75
                mmHeight = 4498
                mmLeft = 54240
                mmTop = 0
                mmWidth = 794
                BandType = 4
              end
              object ppLine122: TppLine
                UserName = 'Line1202'
                ParentHeight = True
                Position = lpRight
                Weight = 0.75
                mmHeight = 4498
                mmLeft = 76200
                mmTop = 0
                mmWidth = 794
                BandType = 4
              end
              object ppLine123: TppLine
                UserName = 'Line123'
                ParentHeight = True
                Position = lpRight
                Weight = 0.75
                mmHeight = 4498
                mmLeft = 90223
                mmTop = 0
                mmWidth = 794
                BandType = 4
              end
              object ppLine124: TppLine
                UserName = 'Line1203'
                ParentHeight = True
                Position = lpRight
                Weight = 0.75
                mmHeight = 4498
                mmLeft = 113771
                mmTop = 0
                mmWidth = 794
                BandType = 4
              end
            end
            object ppSummaryBand4: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 529
              mmPrintPosition = 0
            end
          end
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'SECAORELATORIO'
      DataPipeline = ppEnquadramento
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppEnquadramento'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'NOMEITEM'
          DataPipeline = ppEnquadramento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppEnquadramento'
          mmHeight = 3175
          mmLeft = 4763
          mmTop = 265
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 265
          BandType = 3
          GroupNo = 1
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          ParentHeight = True
          Position = lpRight
          Weight = 0.75
          mmHeight = 4233
          mmLeft = 197300
          mmTop = 0
          mmWidth = 265
          BandType = 3
          GroupNo = 1
        end
        object ppLine8: TppLine
          UserName = 'Line8'
          ParentWidth = True
          Position = lpBottom
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 3967
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppEnqSecao2: TppBDEPipeline
    DataSource = dsEnqSecao2
    SkipWhenNoRecords = False
    UserName = 'Enquadramento1'
    Left = 150
    Top = 123
    object ppEnqSecao2ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORDEM'
      FieldName = 'ORDEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppEnqSecao2ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppEnqSecao2ppField3: TppField
      FieldAlias = 'NOMEITEM'
      FieldName = 'NOMEITEM'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppEnqSecao2ppField4: TppField
      FieldAlias = 'DESCITEM'
      FieldName = 'DESCITEM'
      FieldLength = 40
      DisplayWidth = 40
      Position = 3
    end
    object ppEnqSecao2ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORITEM'
      FieldName = 'VALORITEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppEnqSecao2ppField6: TppField
      FieldAlias = 'DESCITEMPERC'
      FieldName = 'DESCITEMPERC'
      FieldLength = 40
      DisplayWidth = 40
      Position = 5
    end
    object ppEnqSecao2ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCITEM'
      FieldName = 'PERCITEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object dsEnqSecao2: TwwDataSource
    DataSet = qryEnqSecao2
    Left = 92
    Top = 123
  end
  object qryEnqSecao2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  0   AS ORDEM,'
      '        0   AS IDPESSOA,'
      '        '#39'                                        '#39' AS NOMEITEM,'
      '        '#39'                                        '#39' AS DESCITEM,'
      '        0   AS VALORITEM,'
      
        '        '#39'                                        '#39' AS DESCITEMPE' +
        'RC,'
      '        0   AS PERCITEM'
      'FROM    DUAL'
      ' '
      ' '
      ' ')
    UpdateObject = updSecao2
    ValidateWithMask = True
    Left = 37
    Top = 123
  end
  object ppEnqSecao3: TppBDEPipeline
    DataSource = dsEnqSecao3
    UserName = 'EnqSecao3'
    Left = 150
    Top = 174
    object ppEnqSecao3ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORDEM'
      FieldName = 'ORDEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppEnqSecao3ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppEnqSecao3ppField3: TppField
      FieldAlias = 'NOMEITEM'
      FieldName = 'NOMEITEM'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppEnqSecao3ppField4: TppField
      FieldAlias = 'DESCITEM'
      FieldName = 'DESCITEM'
      FieldLength = 40
      DisplayWidth = 40
      Position = 3
    end
    object ppEnqSecao3ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORITEM'
      FieldName = 'VALORITEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppEnqSecao3ppField6: TppField
      FieldAlias = 'DESCITEMPERC'
      FieldName = 'DESCITEMPERC'
      FieldLength = 40
      DisplayWidth = 40
      Position = 5
    end
    object ppEnqSecao3ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCITEM'
      FieldName = 'PERCITEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object dsEnqSecao3: TwwDataSource
    DataSet = qryEnqSecao3
    Left = 92
    Top = 174
  end
  object qryEnqSecao3: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  0   AS ORDEM,'
      '        0   AS IDPESSOA,'
      '        '#39'                                        '#39' AS NOMEITEM,'
      '        '#39'                                        '#39' AS DESCITEM,'
      '        0   AS VALORITEM,'
      
        '        '#39'                                        '#39' AS DESCITEMPE' +
        'RC,'
      '        0   AS PERCITEM'
      'FROM    DUAL'
      ' '
      ' ')
    UpdateObject = updSecao3
    ValidateWithMask = True
    Left = 37
    Top = 174
  end
  object updSecao4: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE PESSOA SET NOME = :NOME WHERE IDPESSOA = :IDPESSOA')
    InsertSQL.Strings = (
      'INSERT INTO PESSOA (IDPESSOA) VALUES (:IDPESSOA)')
    Left = 216
    Top = 224
  end
  object ppEnqSecao4: TppBDEPipeline
    DataSource = dsEnqSecao4
    UserName = 'EnqSecao4'
    Left = 150
    Top = 224
    object ppEnqSecao4ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'GRUPO'
      FieldName = 'GRUPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppEnqSecao4ppField2: TppField
      FieldAlias = 'DESCGRUPO'
      FieldName = 'DESCGRUPO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 1
    end
    object ppEnqSecao4ppField3: TppField
      FieldAlias = 'MESANO'
      FieldName = 'MESANO'
      FieldLength = 7
      DisplayWidth = 7
      Position = 2
    end
    object ppEnqSecao4ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'COLUNA1'
      FieldName = 'COLUNA1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppEnqSecao4ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'COLUNA2'
      FieldName = 'COLUNA2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppEnqSecao4ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'COLUNA3'
      FieldName = 'COLUNA3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppEnqSecao4ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'COLUNA4'
      FieldName = 'COLUNA4'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppEnqSecao4ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'COLUNA5'
      FieldName = 'COLUNA5'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
  end
  object dsEnqSecao4: TwwDataSource
    DataSet = qryEnqSecao4
    Left = 92
    Top = 224
  end
  object qryEnqSecao4: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT 1 AS GRUPO, '#39' '#39' AS DESCGRUPO, '#39'11/2001'#39' AS MESANO, 100 AS' +
        ' COLUNA1,'
      
        '       200 AS COLUNA2, 300 AS COLUNA3, 400 AS COLUNA4, 0 AS COLU' +
        'NA5'
      'FROM DUAL'
      '')
    UpdateObject = updSecao4
    ValidateWithMask = True
    Left = 37
    Top = 224
  end
  object updEnqSecao1: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE PESSOA SET NOME = :NOME WHERE IDPESSOA = :IDPESSOA')
    InsertSQL.Strings = (
      'INSERT INTO PESSOA (IDPESSOA) VALUES (:IDPESSOA)')
    Left = 213
    Top = 273
  end
  object ppEnqSecao1: TppBDEPipeline
    DataSource = dsEnqSecao1
    UserName = 'EnqSecao1'
    Left = 147
    Top = 273
    object ppEnqSecao1ppField1: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppEnqSecao1ppField2: TppField
      FieldAlias = 'DATAINICIO'
      FieldName = 'DATAINICIO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object ppEnqSecao1ppField3: TppField
      FieldAlias = 'DATAFINAL'
      FieldName = 'DATAFINAL'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object ppEnqSecao1ppField4: TppField
      FieldAlias = 'PERCPBC'
      FieldName = 'PERCPBC'
      FieldLength = 7
      DisplayWidth = 7
      Position = 3
    end
    object ppEnqSecao1ppField5: TppField
      FieldAlias = 'MODO'
      FieldName = 'MODO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 4
    end
    object ppEnqSecao1ppField6: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppEnqSecao1ppField7: TppField
      FieldAlias = 'DESCCONTROLE'
      FieldName = 'DESCCONTROLE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 6
    end
    object ppEnqSecao1ppField8: TppField
      FieldAlias = 'DATACONTROLE'
      FieldName = 'DATACONTROLE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
  end
  object dsEnqSecao1: TwwDataSource
    DataSet = qryEnqSecao1
    Left = 89
    Top = 273
  end
  object qryEnqSecao1: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'000'#39' AS CODIGO, SYSDATE AS DATAINICIO, SYSDATE AS DATAFI' +
        'NAL,'
      '       '#39'0000000'#39' AS PERCPBC, '#39'XX'#39' AS MODO,'
      
        '       '#39'                                                  '#39' AS N' +
        'OME,'
      '       '#39'                              '#39' AS DESCCONTROLE,'
      '       '#39'01/01/0001'#39' AS DATACONTROLE '
      'FROM DUAL'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updEnqSecao1
    ValidateWithMask = True
    Left = 37
    Top = 273
  end
  object ppExtReserva: TppBDEPipeline
    DataSource = dsExtReserva
    UserName = 'ExtReserva'
    Left = 156
    Top = 340
  end
  object dsExtReserva: TwwDataSource
    DataSet = qryExtReserva
    Left = 83
    Top = 343
  end
  object qryExtReserva: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT :DATASOLICITACAO AS DATASOLICITACAO,'
      '       P.NOME AS NOME_ASSOCIADO,'
      '       PAT.NOME AS PATROCINADORA,'
      '       PL.NOME AS PLANO,'
      '       EL.MATRICULA,'
      '       PP.INSCRICAONUMERO AS MATRICULA_CBS,'
      '       EL.DATAADMISSAO,'
      '       EL.DATADEMISSAO,'
      '       PF.DATANASC,'
      
        '       DECODE(HST.IDCONTRIBUICAO, 36, 0, 37, 0, 38, 0, 1)  AS OR' +
        'DEM ,'
      
        '       SUBSTR(HST.MESCOBRANCA,6,2)||'#39'/'#39'||SUBSTR(HST.MESCOBRANCA,' +
        '1,4) AS MESCOBRANCA,'
      '       HST.MESREFERENCIA  AS ANOMESREFERENCIA,'
      '       HST.MESCOBRANCA    AS ANOMESCOBRANCA,'
      
        '       SUBSTR(HST.MESREFERENCIA,6,2)||'#39'/'#39'||SUBSTR(HST.MESREFEREN' +
        'CIA,1,4) AS MESREFERENCIA,'
      '       HST.DATARECEBIMENTO,'
      '       HST.FLGDEVOLUCAO,'
      
        '       DECODE(HST.FLGDEVOLUCAO, 1, -HST.VALORRECEBIDO, HST.VALOR' +
        'RECEBIDO) AS VALOR_CONTRIBUICAO,'
      '       DECODE(HST.IDCONTRIBUICAO, 37, 0,'
      
        '                                  DECODE(HST.IDCONTRIBUICAO, 36,' +
        ' 0,'
      
        '                                  DECODE(HST.IDCONTRIBUICAO, 38,' +
        ' 0,'
      
        '                                  DECODE(HST.FLGDEVOLUCAO, 1, -H' +
        'ST.VALORRECEBIDO, HST.VALORRECEBIDO) ) ) ) * 0.04 AS TAXA_ADMINI' +
        'STRATIVA,'
      '       ( HST.VALORRECEBIDO -'
      
        '         ( DECODE(HST.IDCONTRIBUICAO, 37, 0, DECODE (HST.IDCONTR' +
        'IBUICAO,36,0, DECODE(HST.IDCONTRIBUICAO, 38, 0, HST.VALORRECEBID' +
        'O) )) * 0.04 )) AS VALOR_LIQUIDO,'
      '       DECODE(CP.FLGPAGADOR, '#39'C'#39', CT.COTVALOR,0)  AS VALOR_COTA,'
      '       DECODE(CP.FLGPAGADOR, '#39'C'#39','
      
        '                             ( DECODE(HST.FLGDEVOLUCAO, 1, -HST.' +
        'VALORRECEBIDO, HST.VALORRECEBIDO) -'
      
        '                             ( DECODE(HST.IDCONTRIBUICAO, 37, 0,' +
        ' DECODE (HST.IDCONTRIBUICAO,36,0, DECODE(HST.IDCONTRIBUICAO, 38,' +
        ' 0, DECODE(HST.FLGDEVOLUCAO, 1, -HST.VALORRECEBIDO, HST.VALORREC' +
        'EBIDO) ) ) ) * 0.04 ) ) / CT.COTVALOR) AS QUANTIDADE_COTAS,'
      '       DECODE(CP.FLGPAGADOR, '#39'C'#39','
      
        '                             ( DECODE(HST.FLGDEVOLUCAO, 1, -HST.' +
        'VALORRECEBIDO, HST.VALORRECEBIDO)  -'
      
        '                             ( DECODE(HST.IDCONTRIBUICAO, 37, 0,' +
        ' DECODE (HST.IDCONTRIBUICAO,36, 0, DECODE(HST.IDCONTRIBUICAO, 38' +
        ',0, DECODE(HST.FLGDEVOLUCAO, 1, -HST.VALORRECEBIDO, HST.VALORREC' +
        'EBIDO) ) ) * 0.04 ) ) )/ CT.COTVALOR * :COTA_HOJE ) AS VALOR_HOJ' +
        'E,'
      ''
      '       CT2.COTVALOR       AS VALOR_COTA2,'
      
        '       ( DECODE(HST.FLGDEVOLUCAO, 1, -HST.VALORRECEBIDO, HST.VAL' +
        'ORRECEBIDO) -'
      
        '         ( DECODE(HST.IDCONTRIBUICAO, 37, 0, DECODE (HST.IDCONTR' +
        'IBUICAO,36,0, DECODE(HST.IDCONTRIBUICAO, 38, 0, DECODE(HST.FLGDE' +
        'VOLUCAO, 1, -HST.VALORRECEBIDO, HST.VALORRECEBIDO) ) ) ) * 0.04 ' +
        ') ) / CT2.COTVALOR AS QUANTIDADE_COTAS2,'
      
        '       ( DECODE(HST.FLGDEVOLUCAO, 1, -HST.VALORRECEBIDO, HST.VAL' +
        'ORRECEBIDO)  -'
      
        '         ( DECODE(HST.IDCONTRIBUICAO, 37, 0, DECODE (HST.IDCONTR' +
        'IBUICAO,36,0, DECODE(HST.IDCONTRIBUICAO, 38, 0, DECODE(HST.FLGDE' +
        'VOLUCAO, 1, -HST.VALORRECEBIDO, HST.VALORRECEBIDO) ) ) * 0.04 ) ' +
        ') ) / CT2.COTVALOR * :COTA_HOJE2 AS VALOR_HOJE2,'
      '       DECODE(CP.FLGPAGADOR, '#39'C'#39', :COTA_HOJE, 0) AS COTA_HOJE,'
      '       :COTA_HOJE2 AS COTA_HOJE2,'
      
        '       DECODE(CP.FLGPAGADOR, '#39'C'#39', '#39'PARTICIPANTE'#39', '#39'PATROCINADORA' +
        #39') AS PAGADOR,'
      '       :MESANOCOTA1 AS MESANOCOTA1,'
      '       :MESANOCOTA2 AS MESANOCOTA2'
      
        'FROM   PESSOA P, PESSOA PAT, PESSOAFISICA PF, ELEGPATRO EL, PART' +
        'PREVPLAN PP, HSTCONTRIBPREV HST,'
      
        '       CONTPREV CP, COTACAOMOEDA CT, COTACAOMOEDA CT2, PLANPREV ' +
        'PL'
      'WHERE P.IDPESSOA = :IDPESSOA'
      'AND   HST.IDPESSOA  = :IDPESSOA'
      'AND  PF.IDPESSOA       = P.IDPESSOA'
      'AND    PP.IDPESSOA       = P.IDPESSOA'
      'AND    EL.IDPESSJUR      = PP.IDPESSJUR'
      'AND    EL.IDPESSOA       = PP.IDPESSOA'
      'AND    PAT.IDPESSOA      = EL.IDPESSJUR'
      'AND    PL.IDPLANOPREV    = PP.IDPLANOPREV'
      'AND    HST.MESREFERENCIA <= '#39'1999/01'#39
      'AND    HST.IDPESSJUR     = PP.IDPESSJUR'
      'AND    HST.IDPESSOA      = PP.IDPESSOA'
      'AND    HST.SEQPROPOSTA   = PP.SEQPROPOSTA'
      'AND    ('
      
        '        ( (HST.IDPLANOPREV = PP.IDPLANOPREV) AND (HST.IDCONTRIBU' +
        'ICAO IN  (9,10,19,31,33,50,51,54,55) ) )'
      '        OR'
      '        ( HST.IDCONTRIBUICAO IN  (36,37,38) )'
      '       )'
      'AND    CP.IDPLANOPREV    = PP.IDPLANOPREV'
      'AND    CP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO'
      'AND    CT.MOECODIGO      = :MOEDAPLANO'
      'AND    CT.COTMESREF      = TO_CHAR(HST.DATARECEBIMENTO,'#39'MMYYYY'#39')'
      'AND    CT2.MOECODIGO(+)  = :MOEDAPLANO2'
      'AND    CT2.COTMESREF(+)  = TO_CHAR(HST.DATARECEBIMENTO,'#39'MMYYYY'#39')'
      'UNION'
      'SELECT :DATASOLICITACAO AS DATASOLICITACAO,'
      '       P.NOME AS NOME_ASSOCIADO,'
      '       PAT.NOME AS PATROCINADORA,'
      '       PL.NOME AS PLANO,'
      '       EL.MATRICULA,'
      '       PP.INSCRICAONUMERO AS MATRICULA_CBS,'
      '       EL.DATAADMISSAO,'
      '       EL.DATADEMISSAO,'
      '       PF.DATANASC,'
      
        '       DECODE(HST.IDCONTRIBUICAO, 36, 2, 37, 2, 38, 3, 4)  AS OR' +
        'DEM,'
      
        '       SUBSTR(HST.MESCOBRANCA,6,2)||'#39'/'#39'||SUBSTR(HST.MESCOBRANCA,' +
        '1,4) AS MESCOBRANCA,'
      '       HST.MESREFERENCIA  AS ANOMESREFERENCIA,'
      '       HST.MESCOBRANCA    AS ANOMESCOBRANCA,'
      
        '       SUBSTR(HST.MESREFERENCIA,6,2)||'#39'/'#39'||SUBSTR(HST.MESREFEREN' +
        'CIA,1,4) AS MESREFERENCIA,'
      '       HST.DATARECEBIMENTO,'
      '       HST.FLGDEVOLUCAO,'
      
        '       DECODE(HST.FLGDEVOLUCAO, 1, -HST.VALORRECEBIDO, HST.VALOR' +
        'RECEBIDO) AS VALOR_CONTRIBUICAO,'
      
        '       DECODE(CP.FLGPAGADOR, '#39'C'#39', 0, DECODE(HST.FLGDEVOLUCAO, 1,' +
        ' -HST.VALORRECEBIDO, HST.VALORRECEBIDO) * 0.08 ) AS TAXA_ADMINIS' +
        'TRATIVA,'
      
        '       ( DECODE(HST.FLGDEVOLUCAO, 1, -HST.VALORRECEBIDO, HST.VAL' +
        'ORRECEBIDO) - (DECODE(CP.FLGPAGADOR, '#39'C'#39', 0, DECODE(HST.FLGDEVOL' +
        'UCAO, 1, -HST.VALORRECEBIDO, HST.VALORRECEBIDO) * 0.08 ) ) ) AS ' +
        'VALOR_LIQUIDO,'
      ''
      '       DECODE(CP.FLGPAGADOR, '#39'C'#39', CT.COTVALOR,0)  AS VALOR_COTA,'
      '       DECODE(CP.FLGPAGADOR, '#39'C'#39','
      
        '                             ( DECODE(HST.FLGDEVOLUCAO, 1, -HST.' +
        'VALORRECEBIDO, HST.VALORRECEBIDO) - (DECODE(CP.FLGPAGADOR, '#39'C'#39', ' +
        '0, DECODE(HST.FLGDEVOLUCAO, 1, -HST.VALORRECEBIDO, HST.VALORRECE' +
        'BIDO) * 0.08 ) ) ) / CT.COTVALOR,'
      '                             0)  AS QUANTIDADE_COTAS,'
      '       DECODE(CP.FLGPAGADOR, '#39'C'#39','
      
        '                             ( DECODE(HST.FLGDEVOLUCAO, 1, -HST.' +
        'VALORRECEBIDO, HST.VALORRECEBIDO) - ( DECODE(CP.FLGPAGADOR, '#39'C'#39',' +
        ' 0, DECODE(HST.FLGDEVOLUCAO, 1, -HST.VALORRECEBIDO, HST.VALORREC' +
        'EBIDO) * 0.08 ) ) ) / CT.COTVALOR * :COTA_HOJE,'
      '                             0)  AS VALOR_HOJE,'
      ''
      '       CT2.COTVALOR       AS VALOR_COTA2,'
      
        '       ( DECODE(HST.FLGDEVOLUCAO, 1, -HST.VALORRECEBIDO, HST.VAL' +
        'ORRECEBIDO) - (DECODE(CP.FLGPAGADOR, '#39'C'#39', 0, DECODE(HST.FLGDEVOL' +
        'UCAO, 1, -HST.VALORRECEBIDO, HST.VALORRECEBIDO) * 0.08 ) ) ) / C' +
        'T2.COTVALOR AS QUANTIDADE_COTAS2,'
      
        '       ( DECODE(HST.FLGDEVOLUCAO, 1, -HST.VALORRECEBIDO, HST.VAL' +
        'ORRECEBIDO) - ( DECODE(CP.FLGPAGADOR, '#39'C'#39', 0, DECODE(HST.FLGDEVO' +
        'LUCAO, 1, -HST.VALORRECEBIDO, HST.VALORRECEBIDO) * 0.08 ) ) ) / ' +
        'CT2.COTVALOR * :COTA_HOJE AS VALOR_HOJE2,'
      '       DECODE(CP.FLGPAGADOR, '#39'C'#39', :COTA_HOJE, 0) AS COTA_HOJE,'
      '       :COTA_HOJE2 AS COTA_HOJE2,'
      
        '       DECODE(CP.FLGPAGADOR, '#39'C'#39', '#39'PARTICIPANTE'#39', '#39'PATROCINADORA' +
        #39') AS PAGADOR,'
      '       :MESANOCOTA1 AS MESANOCOTA1,'
      '       :MESANOCOTA2 AS MESANOCOTA2'
      
        'FROM   PESSOA P, PESSOA PAT, PESSOAFISICA PF, ELEGPATRO EL, PART' +
        'PREVPLAN PP, HSTCONTRIBPREV HST,'
      
        '       CONTPREV CP, COTACAOMOEDA CT, COTACAOMOEDA CT2, PLANPREV ' +
        'PL'
      'WHERE  P.IDPESSOA        = :IDPESSOA'
      'AND    HST.IDPESSOA      = :IDPESSOA'
      'AND    PF.IDPESSOA       = P.IDPESSOA'
      'AND    PP.IDPESSOA       = P.IDPESSOA'
      'AND    EL.IDPESSJUR      = PP.IDPESSJUR'
      'AND    EL.IDPESSOA       = PP.IDPESSOA'
      'AND    PAT.IDPESSOA      = EL.IDPESSJUR'
      'AND    PL.IDPLANOPREV    = PP.IDPLANOPREV'
      'AND    HST.MESREFERENCIA >= '#39'1999/02'#39
      'AND    HST.IDPESSJUR     = PP.IDPESSJUR'
      'AND    HST.IDPESSOA      = PP.IDPESSOA'
      'AND    HST.SEQPROPOSTA   = PP.SEQPROPOSTA'
      'AND    ('
      
        '        ( (HST.IDPLANOPREV = PP.IDPLANOPREV) AND (HST.IDCONTRIBU' +
        'ICAO IN  (9,10,19,31,33,50,51,54,55) ) )'
      '        OR'
      '        ( HST.IDCONTRIBUICAO IN  (36,37,38) )'
      '       )'
      'AND    CP.IDPLANOPREV    = PP.IDPLANOPREV'
      'AND    CP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO'
      'AND    CT.MOECODIGO      = :MOEDAPLANO'
      'AND    CT.COTMESREF      = TO_CHAR(HST.DATARECEBIMENTO,'#39'MMYYYY'#39')'
      'AND    CT2.MOECODIGO(+)  = :MOEDAPLANO2'
      'AND    CT2.COTMESREF(+)  = TO_CHAR(HST.DATARECEBIMENTO,'#39'MMYYYY'#39')'
      'ORDER BY PAGADOR, ORDEM,  ANOMESCOBRANCA'
      ' ')
    ValidateWithMask = True
    Left = 25
    Top = 343
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATASOLICITACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'COTA_HOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'COTA_HOJE2'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'COTA_HOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'COTA_HOJE2'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESANOCOTA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESANOCOTA2'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MOEDAPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MOEDAPLANO2'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATASOLICITACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'COTA_HOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'COTA_HOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'COTA_HOJE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'COTA_HOJE2'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESANOCOTA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESANOCOTA2'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MOEDAPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MOEDAPLANO2'
        ParamType = ptUnknown
      end>
  end
  object rpExtReserva: TppReport
    AutoStop = False
    DataPipeline = ppExtReserva
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\ProjetosCM5\Bin\DemonsDevolCBS.rtm'
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 233
    Top = 340
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppExtReserva'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 41540
      mmPrintPosition = 0
      object ppLabel24: TppLabel
        UserName = 'Label11'
        Caption = 'Demonstrativo de Contribuições'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 71173
        mmTop = 21696
        mmWidth = 65617
        BandType = 0
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        AutoSize = True
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
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 14817
        BandType = 0
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
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
        mmLeft = 41540
        mmTop = 7938
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText45: TppDBText
        UserName = 'DBText45'
        AutoSize = True
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
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 13229
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'Label63'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText54: TppDBText
        UserName = 'DBText54'
        AutoSize = True
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
        mmHeight = 3175
        mmLeft = 48683
        mmTop = 17463
        mmWidth = 5821
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
        DataPipelineName = 'ppFundacao'
        mmHeight = 15346
        mmLeft = 0
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label1'
        Caption = 'Participante :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 28575
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText32: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'NOME_ASSOCIADO'
        DataPipeline = ppExtReserva
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtReserva'
        mmHeight = 3175
        mmLeft = 28575
        mmTop = 28575
        mmWidth = 26458
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label2'
        Caption = 'No. de Inscrição :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 32544
        mmWidth = 21167
        BandType = 0
      end
      object ppDBText33: TppDBText
        UserName = 'DBText2'
        DataField = 'MATRICULA_CBS'
        DataPipeline = ppExtReserva
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtReserva'
        mmHeight = 3175
        mmLeft = 28575
        mmTop = 32544
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label3'
        Caption = 'Matrícula :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 83608
        mmTop = 32544
        mmWidth = 12700
        BandType = 0
      end
      object ppDBText35: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'MATRICULA'
        DataPipeline = ppExtReserva
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtReserva'
        mmHeight = 3175
        mmLeft = 109009
        mmTop = 32544
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label4'
        Caption = 'Patrocinadora :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 83608
        mmTop = 28575
        mmWidth = 18256
        BandType = 0
      end
      object ppDBText36: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'PATROCINADORA'
        DataPipeline = ppExtReserva
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtReserva'
        mmHeight = 3175
        mmLeft = 109009
        mmTop = 28575
        mmWidth = 24606
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label5'
        Caption = 'Plano Previdenciário :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 36513
        mmWidth = 26194
        BandType = 0
      end
      object ppDBText37: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'PLANO'
        DataPipeline = ppExtReserva
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtReserva'
        mmHeight = 3175
        mmLeft = 28575
        mmTop = 36513
        mmWidth = 9525
        BandType = 0
      end
      object ppLine24: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 27517
        mmWidth = 197300
        BandType = 0
      end
      object ppLine28: TppLine
        UserName = 'Line5'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 40746
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label6'
        Caption = 'Data da Solicitação :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 83608
        mmTop = 36513
        mmWidth = 24606
        BandType = 0
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        AutoSize = True
        DataField = 'DATASOLICITACAO'
        DataPipeline = ppExtReserva
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'ppExtReserva'
        mmHeight = 3175
        mmLeft = 165629
        mmTop = 36513
        mmWidth = 26458
        BandType = 0
      end
      object rptExtReserva_lblDataSolicitacao: TppLabel
        UserName = 'Label41'
        Caption = 'rptExtReserva_lblDataSolicitacao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 109009
        mmTop = 36513
        mmWidth = 39952
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText8: TppDBText
        UserName = 'DBText7'
        DataField = 'MESCOBRANCA'
        DataPipeline = ppExtReserva
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppExtReserva'
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 794
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText8'
        DataField = 'VALOR_CONTRIBUICAO'
        DataPipeline = ppExtReserva
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtReserva'
        mmHeight = 3175
        mmLeft = 20638
        mmTop = 794
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText9'
        DataField = 'TAXA_ADMINISTRATIVA'
        DataPipeline = ppExtReserva
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtReserva'
        mmHeight = 3175
        mmLeft = 42598
        mmTop = 794
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText10'
        DataField = 'VALOR_LIQUIDO'
        DataPipeline = ppExtReserva
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtReserva'
        mmHeight = 3175
        mmLeft = 61648
        mmTop = 794
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText11'
        DataField = 'VALOR_COTA'
        DataPipeline = ppExtReserva
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtReserva'
        mmHeight = 3175
        mmLeft = 79904
        mmTop = 1058
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText12'
        DataField = 'QUANTIDADE_COTAS'
        DataPipeline = ppExtReserva
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtReserva'
        mmHeight = 3175
        mmLeft = 101336
        mmTop = 794
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText13'
        DataField = 'VALOR_HOJE'
        DataPipeline = ppExtReserva
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtReserva'
        mmHeight = 3175
        mmLeft = 120121
        mmTop = 794
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText56: TppDBText
        UserName = 'DBText56'
        DataField = 'VALOR_COTA2'
        DataPipeline = ppExtReserva
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtReserva'
        mmHeight = 3175
        mmLeft = 138642
        mmTop = 794
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText57: TppDBText
        UserName = 'DBText57'
        DataField = 'QUANTIDADE_COTAS2'
        DataPipeline = ppExtReserva
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtReserva'
        mmHeight = 3175
        mmLeft = 159015
        mmTop = 794
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText58: TppDBText
        UserName = 'DBText58'
        DataField = 'VALOR_HOJE2'
        DataPipeline = ppExtReserva
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtReserva'
        mmHeight = 3175
        mmLeft = 178859
        mmTop = 794
        mmWidth = 15346
        BandType = 4
      end
      object ppLine51: TppLine
        UserName = 'Line51'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 79375
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine53: TppLine
        UserName = 'Line53'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 137584
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppSystemVariable3: TppSystemVariable
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
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel26: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'AdmPrev'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
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
        mmLeft = 170657
        mmTop = 0
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppExtReservaSumario: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object ppLabel30: TppLabel
        UserName = 'Label28'
        Caption = 'TOTAL GERAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 87048
        mmTop = 1588
        mmWidth = 23283
        BandType = 7
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'Total de ICBS no Plano...............'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 7938
        mmWidth = 43921
        BandType = 7
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'Valor do ICBS...............................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 12965
        mmWidth = 47096
        BandType = 7
      end
      object ppLine21: TppLine
        UserName = 'Line10'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 23019
        mmWidth = 197300
        BandType = 7
      end
      object ppLabel64: TppLabel
        UserName = 'Label64'
        Caption = 'Total Atualizado pelo ICBS ..........'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 17727
        mmWidth = 44979
        BandType = 7
      end
      object ppLabel67: TppLabel
        UserName = 'Label33'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 46831
        mmTop = 17727
        mmWidth = 794
        BandType = 7
      end
      object ppLabel69: TppLabel
        UserName = 'Label29'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 46831
        mmTop = 7938
        mmWidth = 1058
        BandType = 7
      end
      object ppLabel70: TppLabel
        UserName = 'Label34'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 46831
        mmTop = 12965
        mmWidth = 794
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'QUANTIDADE_COTAS'
        DataPipeline = ppExtReserva
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtReserva'
        mmHeight = 3175
        mmLeft = 55298
        mmTop = 7938
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'VALOR_HOJE'
        DataPipeline = ppExtReserva
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtReserva'
        mmHeight = 3175
        mmLeft = 55298
        mmTop = 17727
        mmWidth = 17198
        BandType = 7
      end
      object ppExtReservaCotaGeral: TppLabel
        UserName = 'Label38'
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 70908
        mmTop = 12965
        mmWidth = 1588
        BandType = 7
      end
      object ppLabel76: TppLabel
        UserName = 'Label76'
        Caption = '(R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 48683
        mmTop = 17727
        mmWidth = 5292
        BandType = 7
      end
      object ppLabel84: TppLabel
        UserName = 'Label84'
        Caption = 'Total de Cotas no Plano..............'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 104775
        mmTop = 7938
        mmWidth = 44186
        BandType = 7
      end
      object ppLabel87: TppLabel
        UserName = 'Label87'
        Caption = 'Valor da Cota  .............................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 104775
        mmTop = 12965
        mmWidth = 46831
        BandType = 7
      end
      object ppLabel88: TppLabel
        UserName = 'Label88'
        Caption = 'Total Atualizado pela Cota ..........'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 104775
        mmTop = 17727
        mmWidth = 44715
        BandType = 7
      end
      object ppLabel89: TppLabel
        UserName = 'Label89'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 150019
        mmTop = 17727
        mmWidth = 794
        BandType = 7
      end
      object ppLabel90: TppLabel
        UserName = 'Label90'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 150019
        mmTop = 7938
        mmWidth = 794
        BandType = 7
      end
      object ppLabel91: TppLabel
        UserName = 'Label91'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 150019
        mmTop = 12965
        mmWidth = 794
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc11'
        DataField = 'QUANTIDADE_COTAS2'
        DataPipeline = ppExtReserva
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtReserva'
        mmHeight = 3175
        mmLeft = 158750
        mmTop = 7938
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc12'
        DataField = 'VALOR_HOJE2'
        DataPipeline = ppExtReserva
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtReserva'
        mmHeight = 3175
        mmLeft = 158750
        mmTop = 17727
        mmWidth = 17198
        BandType = 7
      end
      object ppExtReservaCotaGeralCOTACBS: TppLabel
        UserName = 'ExtReservaCotaGeralCOTACBS'
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 174361
        mmTop = 12965
        mmWidth = 1588
        BandType = 7
      end
      object ppLabel93: TppLabel
        UserName = 'Label93'
        Caption = '(R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 151871
        mmTop = 17727
        mmWidth = 5556
        BandType = 7
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'PAGADOR'
      DataPipeline = ppExtReserva
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppExtReserva'
      object ppGroupHeaderBand8: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 25665
        mmPrintPosition = 0
        object ppLabel49: TppLabel
          UserName = 'Label20'
          Caption = 'CONTRIBUIÇÕES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 66675
          mmTop = 794
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object ppDBText39: TppDBText
          UserName = 'DBText14'
          AutoSize = True
          DataField = 'PAGADOR'
          DataPipeline = ppExtReserva
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppExtReserva'
          mmHeight = 3175
          mmLeft = 91546
          mmTop = 794
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLine37: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 19315
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel37: TppLabel
          UserName = 'Label8'
          Caption = 'Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 3175
          mmTop = 11906
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel38: TppLabel
          UserName = 'Label9'
          Caption = 'Contribuição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 21167
          mmTop = 8202
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppLabel39: TppLabel
          UserName = 'Label10'
          Caption = '(-) Taxa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 45508
          mmTop = 8202
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLabel41: TppLabel
          UserName = 'Label12'
          Caption = 'Administração'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 41275
          mmTop = 11906
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppLabel42: TppLabel
          UserName = 'Label13'
          Caption = 'Valor '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 65617
          mmTop = 8202
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
        end
        object ppLabel43: TppLabel
          UserName = 'Label14'
          Caption = 'Líquido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 64823
          mmTop = 11906
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object ppLabel44: TppLabel
          UserName = 'Label15'
          Caption = 'Valor do'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 84667
          mmTop = 8202
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppLabel45: TppLabel
          UserName = 'Label16'
          Caption = 'ICBS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 86784
          mmTop = 11906
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
        object ppLabel46: TppLabel
          UserName = 'Label17'
          Caption = 'Quantidade de'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 99748
          mmTop = 8202
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object ppLabel47: TppLabel
          UserName = 'Label18'
          Caption = 'ICBS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 105834
          mmTop = 11906
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
        object ppLabel48: TppLabel
          UserName = 'Label19'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 124619
          mmTop = 8202
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object ppLine36: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 5556
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel68: TppLabel
          UserName = 'Label37'
          Caption = 'Atualizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 121179
          mmTop = 11906
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object ppLabel71: TppLabel
          UserName = 'Label40'
          Caption = '(R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 26458
          mmTop = 15610
          mmWidth = 5556
          BandType = 3
          GroupNo = 0
        end
        object ppLabel72: TppLabel
          UserName = 'Label401'
          Caption = '(R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 47625
          mmTop = 15610
          mmWidth = 5556
          BandType = 3
          GroupNo = 0
        end
        object ppLabel73: TppLabel
          UserName = 'Label402'
          Caption = '(R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 66675
          mmTop = 15610
          mmWidth = 5556
          BandType = 3
          GroupNo = 0
        end
        object ppLabel74: TppLabel
          UserName = 'Label403'
          Caption = 'em ICBS (R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 119063
          mmTop = 15610
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppLabel96: TppLabel
          UserName = 'Label96'
          Caption = 'Valor da'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 143404
          mmTop = 8202
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppLabel97: TppLabel
          UserName = 'Label97'
          Caption = 'Cota'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 145786
          mmTop = 11906
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object ppLabel98: TppLabel
          UserName = 'Label98'
          Caption = 'Quantidade de'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 157427
          mmTop = 8202
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object ppLabel99: TppLabel
          UserName = 'Label99'
          Caption = 'Cotas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 162984
          mmTop = 11906
          mmWidth = 7144
          BandType = 3
          GroupNo = 0
        end
        object ppLabel100: TppLabel
          UserName = 'Label100'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 183357
          mmTop = 8202
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object ppLabel101: TppLabel
          UserName = 'Label101'
          Caption = 'Atualizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 179917
          mmTop = 11906
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object ppLabel102: TppLabel
          UserName = 'Label102'
          Caption = 'em Cotas (R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 177271
          mmTop = 15610
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object ppLabel92: TppLabel
          UserName = 'Label42'
          Caption = 'Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 2910
          mmTop = 15610
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object ppLabel103: TppLabel
          UserName = 'Label43'
          Caption = 'ICBS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 105834
          mmTop = 20638
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppLabel104: TppLabel
          UserName = 'Label44'
          Caption = 'COTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 162719
          mmTop = 20638
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object ppLine48: TppLine
          UserName = 'Line48'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 24871
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLine49: TppLine
          UserName = 'Line49'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 19315
          mmLeft = 79375
          mmTop = 5556
          mmWidth = 265
          BandType = 3
          GroupNo = 0
        end
        object ppLine50: TppLine
          UserName = 'Line50'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 19315
          mmLeft = 137584
          mmTop = 5821
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLabel36: TppLabel
          UserName = 'Label7'
          Caption = 'Mês de'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 5556
          mmTop = 8202
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 53975
        mmPrintPosition = 0
        object ppLine20: TppLine
          UserName = 'Line2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 53181
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppShape9: TppShape
          UserName = 'Shape1'
          mmHeight = 29104
          mmLeft = 50271
          mmTop = 23283
          mmWidth = 97102
          BandType = 5
          GroupNo = 0
        end
        object ppLine38: TppLine
          UserName = 'Line6'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel50: TppLabel
          UserName = 'Label21'
          Caption = 'Total de ICBS no Plano...............'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 1852
          mmTop = 7673
          mmWidth = 43921
          BandType = 5
          GroupNo = 0
        end
        object ppLabel51: TppLabel
          UserName = 'Label24'
          Caption = 'Valor do ICBS...............................'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 1852
          mmTop = 12700
          mmWidth = 47096
          BandType = 5
          GroupNo = 0
        end
        object ppLabel52: TppLabel
          UserName = 'Label22'
          AutoSize = False
          Caption = 'Total Atualizado pelo ICBS ..........'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 1852
          mmTop = 17463
          mmWidth = 43921
          BandType = 5
          GroupNo = 0
        end
        object ppLabel53: TppLabel
          UserName = 'Label23'
          AutoSize = False
          Caption = 'A T E N Ç Ã O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 87577
          mmTop = 29369
          mmWidth = 22490
          BandType = 5
          GroupNo = 0
        end
        object ppLabel60: TppLabel
          UserName = 'Label25'
          AutoSize = False
          Caption = 'Valores Sujeitos a Verificação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 75671
          mmTop = 37571
          mmWidth = 46302
          BandType = 5
          GroupNo = 0
        end
        object ppLine44: TppLine
          UserName = 'Line8'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 65088
          mmTop = 48683
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object ppLabel61: TppLabel
          UserName = 'Label26'
          Caption = 'Data : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 55827
          mmTop = 46302
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object ppLabel62: TppLabel
          UserName = 'Label27'
          Caption = 'Conferido por :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 91546
          mmTop = 46302
          mmWidth = 18785
          BandType = 5
          GroupNo = 0
        end
        object ppLine45: TppLine
          UserName = 'Line9'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 111654
          mmTop = 49213
          mmWidth = 32544
          BandType = 5
          GroupNo = 0
        end
        object ppLabel66: TppLabel
          UserName = 'Label30'
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 46831
          mmTop = 17463
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object ppLabel25: TppLabel
          UserName = 'Label35'
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 46831
          mmTop = 7673
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object ppLabel65: TppLabel
          UserName = 'Label36'
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 46831
          mmTop = 12700
          mmWidth = 794
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'QUANTIDADE_COTAS'
          DataPipeline = ppExtReserva
          DisplayFormat = '#,0.0000;-#,0.0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppExtReserva'
          mmHeight = 3175
          mmLeft = 55298
          mmTop = 7673
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'VALOR_HOJE'
          DataPipeline = ppExtReserva
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppExtReserva'
          mmHeight = 3175
          mmLeft = 55298
          mmTop = 17463
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppExtReservaCotaGrupoICBS: TppLabel
          UserName = 'Label39'
          AutoSize = False
          Caption = 'ppExtReservaCotaGrupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 54240
          mmTop = 12700
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppLabel75: TppLabel
          UserName = 'Label404'
          Caption = '(R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 48683
          mmTop = 17463
          mmWidth = 5556
          BandType = 5
          GroupNo = 0
        end
        object ppLabel78: TppLabel
          UserName = 'Label78'
          Caption = 'Total de Cotas no Plano..............'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 105040
          mmTop = 7673
          mmWidth = 44186
          BandType = 5
          GroupNo = 0
        end
        object ppLabel79: TppLabel
          UserName = 'Label79'
          Caption = 'Valor da Cota  .............................'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 105040
          mmTop = 12700
          mmWidth = 46831
          BandType = 5
          GroupNo = 0
        end
        object ppLabel80: TppLabel
          UserName = 'Label80'
          AutoSize = False
          Caption = 'Total Atualizado pela Cota ..........'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 105040
          mmTop = 17463
          mmWidth = 44186
          BandType = 5
          GroupNo = 0
        end
        object ppLabel81: TppLabel
          UserName = 'Label301'
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 150284
          mmTop = 17463
          mmWidth = 794
          BandType = 5
          GroupNo = 0
        end
        object ppLabel82: TppLabel
          UserName = 'Label82'
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 150284
          mmTop = 7673
          mmWidth = 794
          BandType = 5
          GroupNo = 0
        end
        object ppLabel83: TppLabel
          UserName = 'Label83'
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'MS Sans Serif'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 150284
          mmTop = 12700
          mmWidth = 794
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'QUANTIDADE_COTAS2'
          DataPipeline = ppExtReserva
          DisplayFormat = '#,0.0000;-#,0.0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppExtReserva'
          mmHeight = 3175
          mmLeft = 158750
          mmTop = 7673
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'VALOR_HOJE2'
          DataPipeline = ppExtReserva
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppExtReserva'
          mmHeight = 3175
          mmLeft = 158750
          mmTop = 17463
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppExtReservaCotaGrupoCotaCBS: TppLabel
          UserName = 'ExtReservaCotaGrupoCotaCBS'
          AutoSize = False
          Caption = 'ppExtReservaCotaGrupoCotaCBS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 158486
          mmTop = 12700
          mmWidth = 17463
          BandType = 5
          GroupNo = 0
        end
        object ppLabel85: TppLabel
          UserName = 'Label85'
          Caption = '(R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 152136
          mmTop = 17463
          mmWidth = 5556
          BandType = 5
          GroupNo = 0
        end
        object ppLabel105: TppLabel
          UserName = 'Label45'
          Caption = 'TOTAL DA CONTA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 66675
          mmTop = 2117
          mmWidth = 24606
          BandType = 5
          GroupNo = 0
        end
        object ppDBText46: TppDBText
          UserName = 'DBText46'
          AutoSize = True
          DataField = 'PAGADOR'
          DataPipeline = ppExtReserva
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppExtReserva'
          mmHeight = 3175
          mmLeft = 92604
          mmTop = 2117
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object updSecao2: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE PESSOA SET NOME = :NOME WHERE IDPESSOA = :IDPESSOA')
    InsertSQL.Strings = (
      'INSERT INTO PESSOA (IDPESSOA) VALUES (:IDPESSOA)')
    Left = 216
    Top = 123
  end
  object updSecao3: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE PESSOA SET NOME = :NOME WHERE IDPESSOA = :IDPESSOA')
    InsertSQL.Strings = (
      'INSERT INTO PESSOA (IDPESSOA) VALUES (:IDPESSOA)')
    Left = 213
    Top = 174
  end
  object updProvApos: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  NOME = :NOME,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  NOMEPATRO = :NOMEPATRO,'
      '  INSCRICAODATA = :INSCRICAODATA,'
      '  DATAREF = :DATAREF,'
      '  INSCRICAONUMERO = :INSCRICAONUMERO,'
      '  MATRICULA = :MATRICULA,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  NOMEPLANO = :NOMEPLANO,'
      '  NOMEBENEFICIO = :NOMEBENEFICIO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  NOME = :OLD_NOME and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  NOMEPATRO = :OLD_NOMEPATRO and'
      '  INSCRICAODATA = :OLD_INSCRICAODATA and'
      '  DATAREF = :OLD_DATAREF and'
      '  INSCRICAONUMERO = :OLD_INSCRICAONUMERO and'
      '  MATRICULA = :OLD_MATRICULA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  NOMEPLANO = :OLD_NOMEPLANO and'
      '  NOMEBENEFICIO = :OLD_NOMEBENEFICIO')
    InsertSQL.Strings = (
      'insert into DUAL'
      
        '  (IDPESSOA, NOME, IDPESSJUR, NOMEPATRO, INSCRICAODATA, DATAREF,' +
        ' INSCRICAONUMERO, '
      
        '   MATRICULA, SEQPROPOSTA, IDPLANOPREV, NOMEPLANO, NOMEBENEFICIO' +
        ')'
      'values'
      
        '  (:IDPESSOA, :NOME, :IDPESSJUR, :NOMEPATRO, :INSCRICAODATA, :DA' +
        'TAREF, '
      
        '   :INSCRICAONUMERO, :MATRICULA, :SEQPROPOSTA, :IDPLANOPREV, :NO' +
        'MEPLANO, '
      '   :NOMEBENEFICIO)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  NOME = :OLD_NOME and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  NOMEPATRO = :OLD_NOMEPATRO and'
      '  INSCRICAODATA = :OLD_INSCRICAODATA and'
      '  DATAREF = :OLD_DATAREF and'
      '  INSCRICAONUMERO = :OLD_INSCRICAONUMERO and'
      '  MATRICULA = :OLD_MATRICULA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  NOMEPLANO = :OLD_NOMEPLANO and'
      '  NOMEBENEFICIO = :OLD_NOMEBENEFICIO')
    Left = 221
    Top = 401
  end
  object ppProvApos: TppBDEPipeline
    DataSource = dsProvApos
    UserName = 'ProvApos'
    Left = 155
    Top = 401
    object ppProvAposppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppProvAposppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppProvAposppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppProvAposppField4: TppField
      FieldAlias = 'NOMEPATRO'
      FieldName = 'NOMEPATRO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppProvAposppField5: TppField
      FieldAlias = 'INSCRICAODATA'
      FieldName = 'INSCRICAODATA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object ppProvAposppField6: TppField
      FieldAlias = 'DATAREF'
      FieldName = 'DATAREF'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object ppProvAposppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSCRICAONUMERO'
      FieldName = 'INSCRICAONUMERO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppProvAposppField8: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 25
      DisplayWidth = 25
      Position = 7
    end
    object ppProvAposppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'SEQPROPOSTA'
      FieldName = 'SEQPROPOSTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppProvAposppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppProvAposppField11: TppField
      FieldAlias = 'NOMEPLANO'
      FieldName = 'NOMEPLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 10
    end
    object ppProvAposppField12: TppField
      FieldAlias = 'NOMEBENEFICIO'
      FieldName = 'NOMEBENEFICIO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 11
    end
  end
  object dsProvApos: TwwDataSource
    DataSet = qryProvApos
    Left = 97
    Top = 401
  end
  object qryProvApos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0 AS IDPESSOA,'
      
        '       '#39'                                                  '#39' AS N' +
        'OME,'
      '       0 AS IDPESSJUR,'
      
        '       '#39'                                                  '#39' AS N' +
        'OMEPATRO,'
      '       SYSDATE AS INSCRICAODATA,'
      '       SYSDATE AS DATAREF,'
      '       0 AS INSCRICAONUMERO,'
      '       '#39'                         '#39' AS MATRICULA,'
      '       0 AS SEQPROPOSTA,'
      '       0 AS IDPLANOPREV,'
      
        '       '#39'                                                  '#39' AS N' +
        'OMEPLANO,'
      
        '       '#39'                                                  '#39' AS N' +
        'OMEBENEFICIO'
      'FROM DUAL'
      'ORDER BY NOME'
      ''
      ' '
      ' ')
    UpdateObject = updProvApos
    ValidateWithMask = True
    Left = 37
    Top = 401
  end
  object rpProvApos: TppReport
    AutoStop = False
    DataPipeline = ppProvApos
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    DeviceType = 'Screen'
    OnPreviewFormClose = rpEnquadramentoPreviewFormClose
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 292
    Top = 401
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppProvApos'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel95: TppLabel
        UserName = 'Label11'
        Caption = 'Relação de Prováveis elegíveis a Benefício em '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 54240
        mmTop = 18521
        mmWidth = 94986
        BandType = 0
      end
      object ppLine70: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24077
        mmWidth = 197300
        BandType = 0
      end
      object ppDBImage3: TppDBImage
        UserName = 'rpBoletasDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 19844
        mmLeft = 265
        mmTop = 1588
        mmWidth = 31485
        BandType = 0
      end
      object ppDBText38: TppDBText
        UserName = 'rpBoletasDBText1'
        AutoSize = True
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
        mmHeight = 5821
        mmLeft = 32808
        mmTop = 1323
        mmWidth = 14817
        BandType = 0
      end
      object ppDBText40: TppDBText
        UserName = 'rpBoletasDBText2'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4763
        mmLeft = 32808
        mmTop = 7673
        mmWidth = 30163
        BandType = 0
      end
      object ppDBText41: TppDBText
        UserName = 'rpBoletasDBText31'
        AutoSize = True
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
        mmHeight = 3175
        mmLeft = 32808
        mmTop = 13229
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel108: TppLabel
        UserName = 'rpBoletasLabel24'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 165629
        mmTop = 13229
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText53: TppDBText
        UserName = 'rpBoletasDBText36'
        AutoSize = True
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
        mmHeight = 3175
        mmLeft = 172773
        mmTop = 13229
        mmWidth = 5821
        BandType = 0
      end
    end
    object ppDetailBand8: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText55: TppDBText
        UserName = 'DBText55'
        DataField = 'MATRICULA'
        DataPipeline = ppProvApos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppProvApos'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 794
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText60: TppDBText
        UserName = 'DBText60'
        DataField = 'NOME'
        DataPipeline = ppProvApos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppProvApos'
        mmHeight = 3704
        mmLeft = 19844
        mmTop = 794
        mmWidth = 111919
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'DBText62'
        DataField = 'NOMEPLANO'
        DataPipeline = ppProvApos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppProvApos'
        mmHeight = 3704
        mmLeft = 134144
        mmTop = 529
        mmWidth = 61119
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppSystemVariable7: TppSystemVariable
        UserName = 'Calc2'
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
      object ppLabel109: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
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
      object ppLine78: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppSystemVariable8: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand5: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup7: TppGroup
      BreakName = 'NOMEBENEFICIO'
      DataPipeline = ppProvApos
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppProvApos'
      object ppGroupHeaderBand7: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppLabel77: TppLabel
          UserName = 'Label77'
          Caption = 'Benefício: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4763
          mmLeft = 1058
          mmTop = 794
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppDBText59: TppDBText
          UserName = 'DBText59'
          AutoSize = True
          DataField = 'NOMEBENEFICIO'
          DataPipeline = ppProvApos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppProvApos'
          mmHeight = 4763
          mmLeft = 22754
          mmTop = 794
          mmWidth = 32808
          BandType = 3
          GroupNo = 0
        end
        object ppLabel86: TppLabel
          UserName = 'Label86'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 7408
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppLabel94: TppLabel
          UserName = 'Label94'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 19315
          mmTop = 7408
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLabel110: TppLabel
          UserName = 'Label110'
          Caption = 'Plano Previdenciário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 133086
          mmTop = 7408
          mmWidth = 35190
          BandType = 3
          GroupNo = 0
        end
        object ppLine46: TppLine
          UserName = 'Line46'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 12435
          mmWidth = 197644
          BandType = 3
          GroupNo = 0
        end
        object ppLabel111: TppLabel
          UserName = 'Label111'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4763
          mmLeft = 120386
          mmTop = 794
          mmWidth = 26194
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryModCarta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PE.NOME, PE.NUMDOCUMENTO AS CPF, EL.MATRICULA, PT.NOME AS' +
        ' PATRO,'
      '       PV.NOME AS PLANO,'
      '       EP.LOGRADOURO AS ENDERECO, EP.NUMERO, EP.COMPLEMENTO,'
      '       EP.BAIRRO, CD.NOME AS CIDADE, CD.UF,'
      '       PF.DATANASC, EG.NOME AS DESCRICAOEVENTO,'
      '       EV.DATAEVENTO AS DATAEVENTO,'
      '       SFA.DESCRICAO AS SITUACAOANTPATRO,'
      '       SLA.DESCRICAO AS SITUACAOANTPLANO,'
      '       SPA.DESCRICAO AS SITUACAOANTFUNDACAO,'
      '       SFN.DESCRICAO AS SITUACAONOVAPATRO,'
      '       SLN.DESCRICAO AS SITUACAONOVAPLANO,'
      '       SPN.DESCRICAO AS SITUACAONOVAFUNDACAO,'
      '       EG.TEMPLATE'
      'FROM PESSOA PE, PESSOA PT, PESSOAFISICA PF, ELEGPATRO EL,'
      '     PARTPREVPLAN PP, PLANPREV PV, ENDPESS EP, CIDADES CD,'
      '     EVENTOSPREV EV, EVENTOGERADOR EG,'
      '     SITFUNC SFA, SITPLANOPREV SLA, SITPART SPA,'
      '     SITFUNC SFN, SITPLANOPREV SLN, SITPART SPN'
      'WHERE (EV.IDPESSOA        = -1)'
      '  AND (EV.IDPESSJUR       = -1)'
      '  AND (EV.IDPLANOPREV     = -1)'
      '  AND (EV.IDEVENTOGERADOR = -1)'
      '  AND (EV.IDEVENTOSPREV = (SELECT MAX(EV1.IDEVENTOSPREV)'
      '                           FROM EVENTOSPREV EV1'
      
        '                           WHERE EV1.IDPESSOA        = EV.IDPESS' +
        'OA'
      
        '                            AND  EV1.IDPESSJUR       = EV.IDPESS' +
        'JUR'
      
        '                            AND  EV1.IDEVENTOGERADOR = EV.IDEVEN' +
        'TOGERADOR'
      
        '                            AND  EV1.IDPLANOPREV     = EV.IDPLAN' +
        'OPREV))'
      '  AND (EV.IDEVENTOGERADOR = EG.IDEVENTOGERADOR)'
      '  AND (EL.IDPESSOA        = EV.IDPESSOA)'
      '  AND (EL.IDPESSJUR       = EV.IDPESSJUR)'
      '  AND (PE.IDPESSOA        = EL.IDPESSOA)'
      '  AND (PT.IDPESSOA        = EL.IDPESSJUR)'
      '  AND (PE.IDPESSOA        = PF.IDPESSOA)'
      '  AND (PP.IDPESSOA        = EL.IDPESSOA)'
      '  AND (PP.IDPESSJUR       = EL.IDPESSJUR)'
      '  AND (PP.IDPLANOPREV     = EV.IDPLANOPREV)'
      '  AND (PP.SEQPROPOSTA     = -1)'
      '  AND (PP.IDPLANOPREV     = PV.IDPLANOPREV)'
      '  AND (PE.IDENDCORRESP    = EP.IDENDERECO)'
      '  AND (PE.IDPESSOA        = EP.IDPESSOA)'
      '  AND (EP.IDCIDADES       = CD.IDCIDADES)'
      '  AND (EV.IDSITFUNCATUAL  = SFA.IDSITFUNC)'
      '  AND (EV.IDSITPLANOATUAL = SLA.IDSITPLANOPREV)'
      '  AND (EV.IDSITPARTATUAL  = SPA.IDSITPART)'
      '  AND (EV.IDSITFUNCNOVO   = SFN.IDSITFUNC)'
      '  AND (EV.IDSITPLANONOVO  = SLN.IDSITPLANOPREV)'
      '  AND (EV.IDSITPARTNOVO   = SPN.IDSITPART)'
      '')
    ValidateWithMask = True
    Left = 311
    Top = 75
  end
  object dsModCarta: TwwDataSource
    DataSet = qryModCarta
    Left = 312
    Top = 120
  end
  object ppbModCarta: TppBDEPipeline
    DataSource = dsModCarta
    CloseDataSource = True
    UserName = 'bModCarta'
    Left = 312
    Top = 168
  end
  object pprModCarta: TppReport
    AutoStop = False
    DataPipeline = ppbModCarta
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rptDvr'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.DatabaseSettings.Name = 'Carta do Evento'
    Template.Format = ftASCII
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 384
    Top = 168
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppbModCarta'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand7: TppDetailBand
      Save = True
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 229394
      mmPrintPosition = 0
      object ppLabel112: TppLabel
        UserName = 'rpCartaInadimplLabel2'
        Caption = 
          'Texto a Ser Alterado Texto a Ser Alterado Texto a Ser Alterado T' +
          'exto a Ser Alterado Texto a Ser Alterado Texto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 12435
        mmTop = 74083
        mmWidth = 177536
        BandType = 4
      end
      object ppLabel113: TppLabel
        UserName = 'rpCartaInadimplLabel4'
        Caption = 
          'Texto a Ser Alterado Texto a Ser Alterado Texto a Ser Alterado T' +
          'exto a Ser Alterado Texto a Ser Alterado Texto a Ser Alterado '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1852
        mmTop = 84667
        mmWidth = 202142
        BandType = 4
      end
      object ppLabel114: TppLabel
        UserName = 'rpCartaInadimplLabel7'
        Caption = 
          'Texto a Ser Alterado Texto a Ser Alterado Texto a Ser Alterado T' +
          'exto a Ser Alterado Texto a Ser Alterado Texto a Ser Alterado '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 95250
        mmWidth = 202142
        BandType = 4
      end
      object ppLabel115: TppLabel
        UserName = 'rpCartaInadimplLabel9'
        Caption = 
          'Texto a Ser Alterado Texto a Ser Alterado Texto a Ser Alterado T' +
          'exto a Ser Alterado Texto a Ser Alterado '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 12171
        mmTop = 119327
        mmWidth = 168540
        BandType = 4
      end
      object ppLabel116: TppLabel
        UserName = 'rpCartaInadimplLblData'
        Caption = 'Rio de Janeiro, 10 de Outubro de 2003'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 4763
        mmWidth = 61119
        BandType = 4
      end
      object ppLabel117: TppLabel
        UserName = 'rpCartaInadimplLabel11'
        Caption = 'Prezado Senhor(a):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 25135
        mmWidth = 30692
        BandType = 4
      end
      object ppLine69: TppLine
        UserName = 'rpCartaInadimplLine1'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 105569
        mmTop = 171450
        mmWidth = 90488
        BandType = 4
      end
      object ppLabel118: TppLabel
        UserName = 'rpCartaInadimplLabel12'
        Caption = 'Responsável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 140229
        mmTop = 172773
        mmWidth = 19315
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 12171
      mmPrintPosition = 0
      object ppLine71: TppLine
        UserName = 'ppLine54'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 7144
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel119: TppLabel
        UserName = 'ppLabel129'
        AutoSize = False
        Caption = 'AdmPREV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 8467
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'Calc46'
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
        mmTop = 8467
        mmWidth = 197380
        BandType = 8
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'Calc47'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 8467
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup9: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppbModCarta
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'rptDvrGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppbModCarta'
      object ppGroupHeaderBand9: TppGroupHeaderBand
        Save = True
        mmBottomOffset = 0
        mmHeight = 30163
        mmPrintPosition = 0
        object ppLabel120: TppLabel
          UserName = 'ppLabel93'
          Caption = 'Aviso ao Participante - MODELO A SER ALTERADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5292
          mmLeft = 60590
          mmTop = 3175
          mmWidth = 103981
          BandType = 3
          GroupNo = 0
        end
        object ppLine72: TppLine
          UserName = 'ppLine53'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 28046
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppDBImage4: TppDBImage
          UserName = 'rpCartaInadimplDBImage1'
          MaintainAspectRatio = True
          Stretch = True
          DataField = 'IMAGEM'
          GraphicType = 'Bitmap'
          ParentDataPipeline = False
          mmHeight = 25135
          mmLeft = 1058
          mmTop = 2381
          mmWidth = 39688
          BandType = 3
          GroupNo = 0
        end
        object ppLabel121: TppLabel
          UserName = 'rpCartaInadimplLabel1'
          Caption = 'CEP'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 134673
          mmTop = 21167
          mmWidth = 5821
          BandType = 3
          GroupNo = 0
        end
        object ppDBText61: TppDBText
          UserName = 'rpCartaInadimplDBText1'
          DataField = 'CEP'
          DataPipeline = ppbModCarta
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppbModCarta'
          mmHeight = 3704
          mmLeft = 146315
          mmTop = 21166
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText63: TppDBText
          UserName = 'rpCartaInadimplDBText2'
          DataField = 'BAIRRO'
          DataPipeline = ppbModCarta
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppbModCarta'
          mmHeight = 3704
          mmLeft = 140494
          mmTop = 15611
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppDBText64: TppDBText
          UserName = 'rpCartaInadimplDBText3'
          DataField = 'CIDADE'
          DataPipeline = ppbModCarta
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppbModCarta'
          mmHeight = 3704
          mmLeft = 42333
          mmTop = 21166
          mmWidth = 48419
          BandType = 3
          GroupNo = 0
        end
        object ppDBText65: TppDBText
          UserName = 'rpCartaInadimplDBText4'
          DataField = 'CODESTADO'
          DataPipeline = ppbModCarta
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppbModCarta'
          mmHeight = 3704
          mmLeft = 112977
          mmTop = 21166
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText66: TppDBText
          UserName = 'rpCartaInadimplDBText5'
          DataField = 'NUMERO'
          DataPipeline = ppbModCarta
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppbModCarta'
          mmHeight = 3704
          mmLeft = 116946
          mmTop = 15610
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText67: TppDBText
          UserName = 'rpCartaInadimplDBText6'
          DataField = 'ENDERECO'
          DataPipeline = ppbModCarta
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppbModCarta'
          mmHeight = 3704
          mmLeft = 42333
          mmTop = 15611
          mmWidth = 69586
          BandType = 3
          GroupNo = 0
        end
        object ppDBText68: TppDBText
          UserName = 'rpCartaInadimplDBText8'
          DataField = 'NOME'
          DataPipeline = ppbModCarta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 14
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppbModCarta'
          mmHeight = 5821
          mmLeft = 42598
          mmTop = 8996
          mmWidth = 133615
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object DsgnCM: TppDesigner
    Caption = 'Gerador de Carta do Evento'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000033333300003333330000000000000003BBBBBB3003BBBBBB30000
      00000000003BBBBBB3003BBBBBB30000000000000003BBBB3003BBBBBB300000
      000000000003BBBB3003BBBBB3000000000000000003BBBB3003BBBB30000000
      000000000003BBBBB33BBBBB30000000000000000003BBBBBBBBBBB300000000
      000000000003BBBBBBBBBBB300000000000000700003BBBB333BBBBB30000000
      000000800003BBBB3003BBBBB30000000000F8F00003BBBB3003BBBBB3000000
      008F8F800003BBBB3003BBBBB3000070F8F877F80003BBBB333BBBBBB300007F
      8F00F08F003BBBBBBBBBBBBB3000007800FFF048003BBBBBBBBBBBB300000000
      FFFFF08F8003333333333330000070FFFFCCF804F07000000000000000007FFF
      CCFFFF0F8F0000000000000000007FCCFFFCCF074807000000000000000078FF
      FCCFFFF08F80700000000000000007FCCFFFCCF044F8070000000000000007FF
      FFCCFFFF0F8F8000000000000000078FCCFFFCCF07F77000000000000000007F
      FFFCCFFFF07000000000000000000078FCCFFFCCFF0700000000000000000007
      FFFFCCFFFF80000000000000000000078FCCFFFF877000000000000000000000
      7FFFFF8770000000000000000000000007FF8770000000000000000000000000
      007770000000000000000000000000000000000000000000000000000000FFFE
      0781FFFC0300FFFC0300FFFE0601FFFE0603FFFE0607FFFE0007FFFE000FFFFE
      000FFFDE0007FF0E0603FC0E0603F00E0603C0060003C0040007C004000FC002
      001F0001FFFF0001FFFF0000FFFF00007FFF80003FFF80003FFF80007FFFC001
      FFFFC000FFFFE000FFFFE001FFFFF007FFFFF81FFFFFFC7FFFFFFFFFFFFF}
    Position = poScreenCenter
    ShowComponents = [scLabel, scMemo, scRichText, scCalc, scImage, scShape, scLine, scBarCode, scTeeChart, scDBText, scDBMemo, scDBRichText, scDBCalc, scDBImage, scDBBarCode, scDBTeeChart, scRegion]
    Report = pprModCarta
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 384
    Top = 120
  end
end
