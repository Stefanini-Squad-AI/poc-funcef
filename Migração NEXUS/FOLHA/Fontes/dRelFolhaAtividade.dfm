inherited dtmRelFolhaAtividade: TdtmRelFolhaAtividade
  Left = 227
  Top = 204
  Width = 366
  Height = 233
  Caption = 'dtmRelFolhaAtividade'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 23
    Top = 58
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
    Left = 23
    Top = 106
  end
  inherited qryExemplo: TwwQuery
    Left = 23
    Top = 154
  end
  inherited rpExemplo: TppReport
    Left = 23
    Top = 10
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      
        'SELECT P.NOME          , P.RAZAOSOCIAL, E.LOGRADOURO            ' +
        '   ,'
      
        '       E.NUMERO        , E.COMPLEMENTO, E.BAIRRO                ' +
        '   ,'
      
        '       C.NOME AS CIDADE, C.CODESTADO  , E.CEP                   ' +
        '   ,'
      
        '       I.IMAGEM        , (E.LOGRADOURO||'#39', '#39'||E.NUMERO) AS ENDER' +
        'ECO,'
      
        '       (E.BAIRRO||'#39' - '#39'||C.NOME||'#39' - '#39'||C.CODESTADO)    AS BARCI' +
        'DUF           '
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ValidateWithMask = True
    Left = 214
    Top = 154
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
      end>
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 214
    Top = 106
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 214
    Top = 58
  end
  object qryPreparo: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       PT.NOME        AS PATRO    ,'
      '       PT.IDPESSOA    AS IDPATRO  ,'
      '       PL.NOME        AS PLANO    ,'
      '       PL.IDPLANOPREV AS IDPLANO  ,'
      '       BE.NOME        AS BENEFICIO,'
      '       HB.IDTITULAR,'
      '       HB.NUMEROPROCESSO,'
      '       HB.MES,'
      '       HB.MESREFERENCIA,'
      '       HB.VALORPREV'
      'FROM HSTBENEFBFCIARIO HB, PLANPREV  PL,'
      '     PESSOA           PT, BENEFICIO BE'
      'WHERE (HB.IDPESSJUR   = PT.IDPESSOA)'
      'AND   (HB.IDPLANOPREV = PL.IDPLANOPREV)'
      'AND   (HB.IDBENEFICIO = BE.IDBENEFICIO)'
      'AND   (HB.SEQPROPOSTA = 1)'
      'AND   (PT.IDPESSOA    = 2)'
      'AND   (PL.IDPLANOPREV = 14)'
      'AND   (HB.MES         = '#39'2001/05'#39')'
      'ORDER BY PT.NOME, PL.NOME, HB.IDTITULAR')
    Left = 90
    Top = 154
  end
  object dsPreparo: TDataSource
    DataSet = qryPreparo
    Left = 90
    Top = 106
  end
  object plPreparo: TppBDEPipeline
    DataSource = dsPreparo
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plPreparo'
    Left = 90
    Top = 58
    object plPreparoppField1: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object plPreparoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object plPreparoppField3: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object plPreparoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANO'
      FieldName = 'IDPLANO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object plPreparoppField5: TppField
      FieldAlias = 'BENEFICIO'
      FieldName = 'BENEFICIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object plPreparoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTITULAR'
      FieldName = 'IDTITULAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object plPreparoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMEROPROCESSO'
      FieldName = 'NUMEROPROCESSO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object plPreparoppField8: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 7
      DisplayWidth = 7
      Position = 7
    end
    object plPreparoppField9: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 8
    end
    object plPreparoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPREV'
      FieldName = 'VALORPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
  end
  object rpPreparo: TppReport
    AutoStop = False
    DataPipeline = plPreparo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Benefícios Preparados'
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
    Left = 90
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 44715
      mmPrintPosition = 0
      object rpPreparoLabel1: TppLabel
        UserName = 'rpPreparoLabel1'
        Caption = 'Relatório de Benefícios Preparados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 64294
        mmTop = 27252
        mmWidth = 71438
        BandType = 0
      end
      object rpPreparoDBText1: TppDBText
        UserName = 'rpPreparoDBText1'
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
        mmLeft = 43656
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object rpPreparoDBText2: TppDBText
        UserName = 'rpPreparoDBText2'
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
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object rpPreparoDBText3: TppDBText
        UserName = 'rpPreparoDBText3'
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
        mmLeft = 43656
        mmTop = 7673
        mmWidth = 25400
        BandType = 0
      end
      object rpPreparoDBImage1: TppDBImage
        UserName = 'rpPreparoDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object rpPreparoDBText4: TppDBText
        UserName = 'rpPreparoDBText4'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 16140
        BandType = 0
      end
      object rpPreparoDBText5: TppDBText
        UserName = 'rpPreparoDBText5'
        AutoSize = True
        DataField = 'BARCIDUF'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14552
        BandType = 0
      end
      object rpPreparoLabel10: TppLabel
        UserName = 'rpPreparoLabel10'
        Caption = 'Mês Referência :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2646
        mmTop = 34660
        mmWidth = 28046
        BandType = 0
      end
      object rpPreparoDBText14: TppDBText
        UserName = 'rpPreparoDBText14'
        DataField = 'MESREFERENCIA'
        DataPipeline = plPreparo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 31750
        mmTop = 34660
        mmWidth = 15610
        BandType = 0
      end
      object rpPreparoLabel11: TppLabel
        UserName = 'rpPreparoLabel11'
        Caption = 'Mês Cobrança   :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2646
        mmTop = 39423
        mmWidth = 28310
        BandType = 0
      end
      object rpPreparoDBText15: TppDBText
        UserName = 'rpPreparoDBText15'
        DataField = 'MES'
        DataPipeline = plPreparo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 31750
        mmTop = 39423
        mmWidth = 15610
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8731
      mmPrintPosition = 0
      object rpPreparoDBText6: TppDBText
        UserName = 'rpPreparoDBText6'
        DataField = 'BENEFICIO'
        DataPipeline = plPreparo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 20902
        mmTop = 0
        mmWidth = 86254
        BandType = 4
      end
      object lblBenficio: TppDBText
        UserName = 'lblBenficio'
        DataField = 'VALORPREV'
        DataPipeline = plPreparo
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 131234
        mmTop = 0
        mmWidth = 20902
        BandType = 4
      end
      object lblContribuicao: TppDBText
        UserName = 'lblContribuicao'
        DataField = 'VALORPREV'
        DataPipeline = plPreparo
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 168011
        mmTop = 0
        mmWidth = 20902
        BandType = 4
      end
      object rpPreparoSubReport1: TppSubReport
        UserName = 'rpPreparoSubReport1'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 3704
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpPreparoChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = plContrib
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Relatório de Benefícios Preparados'
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
          Version = '5.5'
          mmColumnWidth = 0
          object rpPreparoChildReport1DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object rpPreparoChildReport1DBText1: TppDBText
              UserName = 'rpPreparoChildReport1DBText1'
              DataField = 'CONTRIBUICAO'
              DataPipeline = plContrib
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 20902
              mmTop = 0
              mmWidth = 86254
              BandType = 4
            end
            object rpPreparoChildReport1DBText2: TppDBText
              UserName = 'rpPreparoChildReport1DBText2'
              DataField = 'VALORESPERADO'
              DataPipeline = plContrib
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 168011
              mmTop = 0
              mmWidth = 20902
              BandType = 4
            end
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
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
    end
    object rpPreparoSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object rpPreparoLabel18: TppLabel
        UserName = 'rpPreparoLabel18'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 96838
        mmTop = 2381
        mmWidth = 18785
        BandType = 7
      end
      object rpPreparoDBCalc5: TppDBCalc
        UserName = 'rpPreparoDBCalc5'
        DataField = 'VALORPREV'
        DataPipeline = plPreparo
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 136790
        mmTop = 2381
        mmWidth = 17198
        BandType = 7
      end
      object rpPreparoDBCalc6: TppDBCalc
        UserName = 'rpPreparoDBCalc6'
        DataField = 'valoresperado'
        DataPipeline = plContrib
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 173832
        mmTop = 2381
        mmWidth = 17198
        BandType = 7
      end
    end
    object rpPreparoGroup1: TppGroup
      BreakName = 'PATRO'
      DataPipeline = plPreparo
      NewPage = True
      UserName = 'rpPreparoGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpPreparoGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object rpPreparoLabel8: TppLabel
          UserName = 'rpPreparoLabel8'
          Caption = 'Patrocinadora :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 11906
          mmTop = 0
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object rpPreparoDBText12: TppDBText
          UserName = 'rpPreparoDBText12'
          DataField = 'PATRO'
          DataPipeline = plPreparo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 38365
          mmTop = 0
          mmWidth = 95250
          BandType = 3
          GroupNo = 0
        end
      end
      object rpPreparoGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object rpPreparoDBCalc3: TppDBCalc
          UserName = 'rpPreparoDBCalc3'
          DataField = 'VALORPREV'
          DataPipeline = plPreparo
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpPreparoGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 136261
          mmTop = 1588
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpPreparoDBCalc4: TppDBCalc
          UserName = 'rpPreparoDBCalc4'
          DataField = 'valoresperado'
          DataPipeline = plContrib
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          ResetGroup = rpPreparoGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 173302
          mmTop = 1852
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpPreparoLabel16: TppLabel
          UserName = 'rpPreparoLabel16'
          Caption = 'Total por Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 75142
          mmTop = 1588
          mmWidth = 39952
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpPreparoGroup2: TppGroup
      BreakName = 'PLANO'
      DataPipeline = plPreparo
      UserName = 'rpPreparoGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpPreparoGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 18256
        mmPrintPosition = 0
        object rpPreparoLabel9: TppLabel
          UserName = 'rpPreparoLabel9'
          Caption = 'Plano :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 25929
          mmTop = 0
          mmWidth = 11906
          BandType = 3
          GroupNo = 1
        end
        object rpPreparoDBText13: TppDBText
          UserName = 'rpPreparoDBText13'
          DataField = 'PLANO'
          DataPipeline = plPreparo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 38365
          mmTop = 0
          mmWidth = 95250
          BandType = 3
          GroupNo = 1
        end
        object rpPreparoLabel3: TppLabel
          UserName = 'rpPreparoLabel3'
          Caption = 'Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 265
          mmTop = 8996
          mmWidth = 14023
          BandType = 3
          GroupNo = 1
        end
        object rpPreparoLabel4: TppLabel
          UserName = 'rpPreparoLabel4'
          Caption = 'Beneficiário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 98690
          mmTop = 8996
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object rpPreparoLine1: TppLine
          UserName = 'rpPreparoLine1'
          Weight = 1
          mmHeight = 1058
          mmLeft = 0
          mmTop = 17198
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object rpPreparoLabel6: TppLabel
          UserName = 'rpPreparoLabel6'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 17198
          mmTop = 8996
          mmWidth = 13229
          BandType = 3
          GroupNo = 1
        end
        object rpPreparoLabel7: TppLabel
          UserName = 'rpPreparoLabel7'
          Caption = 'Titular'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 34660
          mmTop = 8996
          mmWidth = 9260
          BandType = 3
          GroupNo = 1
        end
        object rpPreparoLabel14: TppLabel
          UserName = 'rpPreparoLabel14'
          Caption = 'Seqüencial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 9790
          mmTop = 13229
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object rpPreparoLabel15: TppLabel
          UserName = 'rpPreparoLabel15'
          Caption = 'Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 60590
          mmTop = 13229
          mmWidth = 13229
          BandType = 3
          GroupNo = 1
        end
      end
      object rpPreparoGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpPreparoGroup3: TppGroup
      BreakName = 'IDTITULAR'
      DataPipeline = plPreparo
      UserName = 'rpPreparoGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpPreparoGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 15610
        mmPrintPosition = 0
        object rpPreparoDBText10: TppDBText
          UserName = 'rpPreparoDBText10'
          DataField = 'OUTRO'
          DataPipeline = plCabecaBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 98954
          mmTop = 0
          mmWidth = 56886
          BandType = 3
          GroupNo = 2
        end
        object rpPreparoDBText9: TppDBText
          UserName = 'rpPreparoDBText9'
          DataField = 'TITULAR'
          DataPipeline = plCabecaBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 34925
          mmTop = 0
          mmWidth = 60061
          BandType = 3
          GroupNo = 2
        end
        object rpPreparoDBText8: TppDBText
          UserName = 'rpPreparoDBText8'
          DataField = 'MATRICULA'
          DataPipeline = plCabecaBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 15081
          mmTop = 0
          mmWidth = 17198
          BandType = 3
          GroupNo = 2
        end
        object rpPreparoDBText7: TppDBText
          UserName = 'rpPreparoDBText7'
          DataField = 'NUMEROPROCESSO'
          DataPipeline = plPreparo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 529
          mmTop = 0
          mmWidth = 13758
          BandType = 3
          GroupNo = 2
        end
        object rpPreparoDBText18: TppDBText
          UserName = 'rpPreparoDBText18'
          DataField = 'NUMSEQUENCIA'
          DataPipeline = plCabecaBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 9790
          mmTop = 4763
          mmWidth = 15081
          BandType = 3
          GroupNo = 2
        end
        object rpPreparoDBText20: TppDBText
          UserName = 'rpPreparoDBText20'
          DataField = 'INSCRICAONUMERO'
          DataPipeline = plCabecaBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 60590
          mmTop = 4763
          mmWidth = 15081
          BandType = 3
          GroupNo = 2
        end
        object rpPreparoLine3: TppLine
          UserName = 'rpPreparoLine3'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 14023
          mmWidth = 197380
          BandType = 3
          GroupNo = 2
        end
        object rpPreparoLabel17: TppLabel
          UserName = 'rpPreparoLabel17'
          Caption = 'Valor Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 130175
          mmTop = 10319
          mmWidth = 21960
          BandType = 3
          GroupNo = 2
        end
        object rpPreparoLabel5: TppLabel
          UserName = 'rpPreparoLabel5'
          Caption = 'Benefício / Contribuição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 20902
          mmTop = 10319
          mmWidth = 34396
          BandType = 3
          GroupNo = 2
        end
        object rpPreparoLabel12: TppLabel
          UserName = 'rpPreparoLabel12'
          Caption = 'Valor Contribuição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 161925
          mmTop = 10319
          mmWidth = 26988
          BandType = 3
          GroupNo = 2
        end
      end
      object rpPreparoGroupFooterBand3: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object rpPreparoLine2: TppLine
          UserName = 'rpPreparoLine2'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2.25
          mmHeight = 1058
          mmLeft = 0
          mmTop = 4763
          mmWidth = 197300
          BandType = 5
          GroupNo = 2
        end
        object rpPreparoDBCalc1: TppDBCalc
          UserName = 'rpPreparoDBCalc1'
          DataField = 'valoresperado'
          DataPipeline = plContrib
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          ResetGroup = rpPreparoGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 165100
          mmTop = 0
          mmWidth = 24871
          BandType = 5
          GroupNo = 2
        end
        object rpPreparoDBCalc2: TppDBCalc
          UserName = 'rpPreparoDBCalc2'
          DataField = 'VALORPREV'
          DataPipeline = plPreparo
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpPreparoGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 131234
          mmTop = 0
          mmWidth = 21696
          BandType = 5
          GroupNo = 2
        end
        object rpPreparoLabel13: TppLabel
          UserName = 'rpPreparoLabel13'
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 115623
          mmTop = 0
          mmWidth = 9525
          BandType = 5
          GroupNo = 2
        end
        object rpPreparoLabel2: TppLabel
          UserName = 'rpPreparoLabel2'
          Caption = 'rpPreparoLabel2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 1588
          mmTop = 1323
          mmWidth = 21960
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object qryContrib: TQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPreparo
    SQL.Strings = (
      'SELECT '
      '       CT.NOME AS CONTRIBUICAO,'
      '       HC.VALORESPERADO'
      'FROM HSTCONTRIBPREV HC, CONTRIBUICAO CT'
      'WHERE (HC.IDCONTRIBUICAO = CT.IDCONTRIBUICAO)'
      'AND   (HC.SEQPROPOSTA   = 1)'
      'AND   (HC.MESCOBRANCA   = :MES)'
      'AND   (HC.MESREFERENCIA = :MESREFERENCIA)'
      'AND   (HC.IDPESSJUR     = :IDPATRO)'
      'AND   (HC.IDPLANOPREV   = :IDPLANO)'
      'AND   (HC.IDPESSOA      = :IDTITULAR)'
      '')
    Left = 151
    Top = 154
    ParamData = <
      item
        DataType = ftString
        Name = 'MES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object dsContrib: TDataSource
    DataSet = qryContrib
    Left = 151
    Top = 106
  end
  object plContrib: TppBDEPipeline
    DataSource = dsContrib
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plContrib'
    Left = 151
    Top = 58
  end
  object qryCabecaBenef: TQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPreparo
    SQL.Strings = (
      'SELECT DISTINCT'
      '       EP.MATRICULA      ,'
      '       TI.NOME AS TITULAR,'
      '       OU.NOME AS OUTRO  ,'
      '       DT.NUMSEQUENCIA   ,'
      '       PP.INSCRICAONUMERO'
      'FROM PARTPREVPLAN PP, ELEGPATRO EP,'
      '     PESSOA       TI, PESSOA    OU,'
      '     DEPENTIT     DT'
      'WHERE (PP.FLGDESATIVADO = 0)'
      'AND   (PP.SEQPROPOSTA   = 1)'
      'AND   (PP.IDPESSJUR     = :IDPATRO)'
      'AND   (PP.IDPLANOPREV   = :IDPLANO)'
      'AND   (PP.IDPESSOA      = :IDTITULAR)'
      'AND   (EP.IDPESSJUR     = PP.IDPESSJUR)'
      'AND   (EP.IDPESSOA      = PP.IDPESSOA)'
      'AND   (DT.IDTITULAR     = PP.IDPESSOA)'
      'AND   (DT.IDTITULAR     = TI.IDPESSOA)'
      'AND   (DT.IDPESSOA      = OU.IDPESSOA)'
      'ORDER BY OU.NOME'
      '')
    Left = 289
    Top = 154
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object dsCabecaBenef: TDataSource
    DataSet = qryCabecaBenef
    Left = 289
    Top = 106
  end
  object plCabecaBenef: TppBDEPipeline
    DataSource = dsCabecaBenef
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plCabecaBenef'
    Left = 289
    Top = 58
    object plCabecaBenefppField1: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object plCabecaBenefppField2: TppField
      FieldAlias = 'TITULAR'
      FieldName = 'TITULAR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object plCabecaBenefppField3: TppField
      FieldAlias = 'OUTRO'
      FieldName = 'OUTRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object plCabecaBenefppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMSEQUENCIA'
      FieldName = 'NUMSEQUENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object plCabecaBenefppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSCRICAONUMERO'
      FieldName = 'INSCRICAONUMERO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
  end
end
