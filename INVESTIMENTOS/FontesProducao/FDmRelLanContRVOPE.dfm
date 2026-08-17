inherited DmRelLanContRVOPE: TDmRelLanContRVOPE
  Left = 590
  Top = 202
  Width = 267
  Height = 325
  Caption = 'DmRelLanContRVOPE'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 37
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
    Left = 37
  end
  inherited qryExemplo: TwwQuery
    Left = 37
  end
  inherited rpExemplo: TppReport
    Left = 45
    DataPipelineName = 'pplExemplo'
  end
  object qryBoletas: TwwQuery
    CachedUpdates = True
    AfterOpen = qryBoletasAfterOpen
    AfterScroll = qryBoletasAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT TO_CHAR(B.DATABOLETA,'#39'DD/MM/YYYY'#39') AS DATABOLETA, B.IDBOL' +
        'ETA, B.CODDOCUMENTO, B.PLNCODIGO, B.PLANO, B.TIPMOVBOLETA,'
      
        '       DECODE(STATUS,'#39'F'#39','#39'Fechada'#39','#39'Aberta'#39') AS STATUS, P.NOME A' +
        'S FORCLI, B.OBSERVACAO,'
      '       0 AS COR,'
      '       VW.PLANPRVCONTABPATRO'
      'FROM BOLETA B, PESSOA P, VWPLANPREVCTBPATR VW,'
      '     (SELECT DISTINCT NUMDOCUMENTO, IDPLANPREVCTBPATR'
      '      FROM  OPERACAOINVEST'
      
        '      WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (IDPLANPREVCTBPATR ' +
        '= :IDPLANPREVCTBPATR)) AND'
      '            DATAOPERACAO      = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')) O'
      'WHERE B.DATABOLETA   = TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')'
      '  AND B.IDFORCLI     = P.IDPESSOA'
      '  AND O.NUMDOCUMENTO = B.IDBOLETA'
      '  AND O.IDPLANPREVCTBPATR = VW.IDPLANPREVCTBPATR   '
      'ORDER BY SEQBOLETA'
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updBoletas
    ValidateWithMask = True
    Left = 38
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end>
    object qryBoletasIDBOLETA: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 11
      FieldName = 'IDBOLETA'
      Size = 30
    end
    object qryBoletasPLANO: TFloatField
      DisplayLabel = 'Plano'
      DisplayWidth = 5
      FieldName = 'PLANO'
    end
    object qryBoletasPLNCODIGO: TFloatField
      DisplayLabel = 'Planilha'
      DisplayWidth = 10
      FieldName = 'PLNCODIGO'
    end
    object qryBoletasCODDOCUMENTO: TFloatField
      DisplayLabel = 'Documento'
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
    end
    object qryBoletasSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 9
      FieldName = 'STATUS'
      Size = 7
    end
    object qryBoletasPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 50
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryBoletasFORCLI: TStringField
      DisplayLabel = 'Fornecedor / Cliente'
      DisplayWidth = 50
      FieldName = 'FORCLI'
      Size = 60
    end
    object qryBoletasOBSERVACAO: TMemoField
      DisplayLabel = 'Obs'
      DisplayWidth = 10
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 300
    end
    object qryBoletasTIPMOVBOLETA: TStringField
      DisplayWidth = 11
      FieldName = 'TIPMOVBOLETA'
      Visible = False
      Size = 3
    end
    object qryBoletasDATABOLETA: TStringField
      DisplayLabel = 'Data da Boleta'
      FieldName = 'DATABOLETA'
      Visible = False
      Size = 10
    end
    object qryBoletasCOR: TFloatField
      FieldName = 'COR'
      Visible = False
    end
  end
  object dsBoletas: TwwDataSource
    AutoEdit = False
    DataSet = qryBoletas
    Left = 38
    Top = 113
  end
  object pplBoletas: TppBDEPipeline
    DataSource = dsBoletas
    UserName = 'lBoletas'
    Left = 30
    Top = 64
    object pplBoletasppField1: TppField
      FieldAlias = 'IDBOLETA'
      FieldName = 'IDBOLETA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplBoletasppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 5
      Position = 1
    end
    object pplBoletasppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplBoletasppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplBoletasppField5: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 7
      DisplayWidth = 9
      Position = 4
    end
    object pplBoletasppField6: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 113
      DisplayWidth = 50
      Position = 5
    end
    object pplBoletasppField7: TppField
      FieldAlias = 'FORCLI'
      FieldName = 'FORCLI'
      FieldLength = 60
      DisplayWidth = 50
      Position = 6
    end
    object pplBoletasppField8: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 300
      DataType = dtMemo
      DisplayWidth = 10
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplBoletasppField9: TppField
      FieldAlias = 'TIPMOVBOLETA'
      FieldName = 'TIPMOVBOLETA'
      FieldLength = 3
      DisplayWidth = 11
      Position = 8
    end
    object pplBoletasppField10: TppField
      FieldAlias = 'DATABOLETA'
      FieldName = 'DATABOLETA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 9
    end
    object pplBoletasppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'COR'
      FieldName = 'COR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
  end
  object pprLanContRVOPE: TppReport
    AutoStop = False
    DataPipeline = pplBoletas
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Lançamentos Contábeis de Operações de Renda Variável'
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 139
    Top = 9
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplBoletas'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 18785
      mmPrintPosition = 0
      object ppLabel12: TppLabel
        UserName = 'Label11'
        Caption = 'Lançamentos Contábeis de Operações de Renda Variável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 25400
        mmTop = 8997
        mmWidth = 96097
        BandType = 0
      end
      object ppLabel16: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4995
        mmLeft = 25400
        mmTop = 1059
        mmWidth = 24299
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Data dos Lançamentos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3641
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 36248
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText9'
        DataField = 'DATABOLETA'
        DataPipeline = pplBoletas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        DataPipelineName = 'pplBoletas'
        mmHeight = 3704
        mmLeft = 62177
        mmTop = 14023
        mmWidth = 21696
        BandType = 0
      end
      object ppDBImage3: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmOperComum.pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object ppdbPlanoPatro: TppDBText
        UserName = 'dbPlanoPatro'
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = pplHistoricos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplHistoricos'
        mmHeight = 4191
        mmLeft = 116417
        mmTop = 14023
        mmWidth = 80169
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 15081
      mmPrintPosition = 0
      object ppShape3: TppShape
        UserName = 'shpDet'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppRegion2: TppRegion
        UserName = 'Region2'
        Caption = 'Region2'
        Pen.Style = psClear
        Stretch = True
        mmHeight = 9790
        mmLeft = 94721
        mmTop = 4233
        mmWidth = 97631
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object srptLancamentos: TppSubReport
          UserName = 'srptLancamentos'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'pplLancamento'
          mmHeight = 5027
          mmLeft = 94721
          mmTop = 5027
          mmWidth = 97631
          BandType = 4
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object srptLancamento: TppChildReport
            AutoStop = False
            DataPipeline = pplLancamento
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Lançamentos Contábeis de Operações de Renda Variável'
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
            Left = 120
            Top = 120
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplLancamento'
            object ppTitleBand3: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 3969
              mmPrintPosition = 0
              object ppShape7: TppShape
                UserName = 'Shape7'
                Brush.Color = clSilver
                mmHeight = 3969
                mmLeft = 265
                mmTop = 0
                mmWidth = 102394
                BandType = 1
              end
              object ppLabel5: TppLabel
                UserName = 'Label1'
                Caption = 'Histórico dos Valores Lançados'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 1058
                mmTop = 265
                mmWidth = 43127
                BandType = 1
              end
              object ppLabel6: TppLabel
                UserName = 'Label2'
                Caption = 'Valor Lançado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 82286
                mmTop = 265
                mmWidth = 19579
                BandType = 1
              end
            end
            object ppDetailBand4: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 3704
              mmPrintPosition = 0
              object ppShape8: TppShape
                UserName = 'Shape8'
                Pen.Style = psClear
                mmHeight = 3704
                mmLeft = 265
                mmTop = 0
                mmWidth = 102659
                BandType = 4
              end
              object ppDBText9: TppDBText
                UserName = 'DBText1'
                DataField = 'HISTORICO'
                DataPipeline = pplLancamento
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplLancamento'
                mmHeight = 3175
                mmLeft = 1058
                mmTop = 265
                mmWidth = 80169
                BandType = 4
              end
              object ppDBText10: TppDBText
                UserName = 'DBText10'
                DataField = 'LANCAMENTO'
                DataPipeline = pplLancamento
                DisplayFormat = '###,###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplLancamento'
                mmHeight = 3175
                mmLeft = 82286
                mmTop = 265
                mmWidth = 19579
                BandType = 4
              end
            end
            object ppSummaryBand3: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object ppShape1: TppShape
                UserName = 'Shape1'
                mmHeight = 3440
                mmLeft = 265
                mmTop = 265
                mmWidth = 102129
                BandType = 7
              end
              object ppDBCalc3: TppDBCalc
                UserName = 'DBCalc3'
                DataField = 'LANCAMENTO'
                DataPipeline = pplLancamento
                DisplayFormat = '###,###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplLancamento'
                mmHeight = 3440
                mmLeft = 71967
                mmTop = 265
                mmWidth = 29633
                BandType = 7
              end
              object ppLabel4: TppLabel
                UserName = 'Label4'
                Caption = 'Total'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 1323
                mmTop = 265
                mmWidth = 6615
                BandType = 7
              end
            end
          end
        end
      end
      object ppDBText13: TppDBText
        UserName = 'DBText1'
        DataField = 'IDBOLETA'
        DataPipeline = pplBoletas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplBoletas'
        mmHeight = 3440
        mmLeft = 11906
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText5'
        DataField = 'PLANO'
        DataPipeline = pplBoletas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplBoletas'
        mmHeight = 3440
        mmLeft = 43392
        mmTop = 265
        mmWidth = 5292
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText2'
        DataField = 'PLNCODIGO'
        DataPipeline = pplBoletas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplBoletas'
        mmHeight = 3440
        mmLeft = 65088
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText3'
        DataField = 'CODDOCUMENTO'
        DataPipeline = pplBoletas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplBoletas'
        mmHeight = 3440
        mmLeft = 98954
        mmTop = 265
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText4'
        DataField = 'STATUS'
        DataPipeline = pplBoletas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplBoletas'
        mmHeight = 3440
        mmLeft = 125677
        mmTop = 265
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText6'
        DataField = 'FORCLI'
        DataPipeline = pplBoletas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBoletas'
        mmHeight = 3440
        mmLeft = 162719
        mmTop = 265
        mmWidth = 33867
        BandType = 4
      end
      object ppRegion1: TppRegion
        UserName = 'Region1'
        Caption = 'Region1'
        Pen.Style = psClear
        Stretch = True
        mmHeight = 9790
        mmLeft = 0
        mmTop = 4233
        mmWidth = 94456
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object srptHistorico: TppSubReport
          UserName = 'srptHistorico'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'pplHistoricos'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 5027
          mmWidth = 94456
          BandType = 4
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object srptHistoricos: TppChildReport
            AutoStop = False
            DataPipeline = pplHistoricos
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Lançamentos Contábeis de Operações de Renda Variável'
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
            Left = 120
            Top = 104
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplHistoricos'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 3969
              mmPrintPosition = 0
              object ppShape4: TppShape
                UserName = 'shpCabecalho1'
                Brush.Color = clSilver
                mmHeight = 3969
                mmLeft = 265
                mmTop = 0
                mmWidth = 93398
                BandType = 1
              end
              object ppLabel2: TppLabel
                UserName = 'Label2'
                Caption = 'Histórico dos Valores Calculados'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 529
                mmTop = 265
                mmWidth = 44979
                BandType = 1
              end
              object ppLabel1: TppLabel
                UserName = 'Label1'
                Caption = 'Valor Calculado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 71438
                mmTop = 265
                mmWidth = 21431
                BandType = 1
              end
            end
            object ppDetailBand1: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 3704
              mmPrintPosition = 0
              object shpDetHistoricos: TppShape
                UserName = 'shpDetHistoricos'
                Pen.Style = psClear
                mmHeight = 3704
                mmLeft = 265
                mmTop = 0
                mmWidth = 93398
                BandType = 4
              end
              object ppDBText5: TppDBText
                UserName = 'DBText1'
                DataField = 'HISTMOVCARTINV'
                DataPipeline = pplHistoricos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplHistoricos'
                mmHeight = 3175
                mmLeft = 529
                mmTop = 265
                mmWidth = 64558
                BandType = 4
              end
              object ppDBText6: TppDBText
                UserName = 'DBText2'
                DataField = 'VALOR'
                DataPipeline = pplHistoricos
                DisplayFormat = '###,###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplHistoricos'
                mmHeight = 3175
                mmLeft = 66146
                mmTop = 265
                mmWidth = 26458
                BandType = 4
              end
            end
            object ppSummaryBand1: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 5027
              mmPrintPosition = 0
              object ppShape2: TppShape
                UserName = 'Shape2'
                mmHeight = 3440
                mmLeft = 265
                mmTop = 265
                mmWidth = 93134
                BandType = 7
              end
              object ppDBCalc2: TppDBCalc
                UserName = 'DBCalc2'
                DataField = 'VALOR'
                DataPipeline = pplHistoricos
                DisplayFormat = '###,###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplHistoricos'
                mmHeight = 3440
                mmLeft = 59002
                mmTop = 265
                mmWidth = 33602
                BandType = 7
              end
              object ppLabel7: TppLabel
                UserName = 'Label3'
                Caption = 'Total'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 794
                mmTop = 265
                mmWidth = 6615
                BandType = 7
              end
            end
          end
        end
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Forn./Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 140759
        mmTop = 265
        mmWidth = 20638
        BandType = 4
      end
      object ppLabel18: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Status:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 113242
        mmTop = 265
        mmWidth = 11377
        BandType = 4
      end
      object ppLabel26: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Documento: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 79375
        mmTop = 265
        mmWidth = 18785
        BandType = 4
      end
      object ppLabel23: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Planilha: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 51858
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppLabel21: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Plano: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 32544
        mmTop = 265
        mmWidth = 10319
        BandType = 4
      end
      object ppLabel17: TppLabel
        UserName = 'Label1'
        Caption = 'Boleta: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 529
        mmTop = 265
        mmWidth = 10319
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel28: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
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
        mmWidth = 196850
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
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
        mmWidth = 196850
        BandType = 8
      end
      object ppLine1: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
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
        mmLeft = 170921
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = pplBoletas
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplBoletas'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppLine2: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 0
          mmTop = 529
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDBOLETA'
      DataPipeline = pplBoletas
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplBoletas'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryHistoricos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT H1.PLNCODIGO, H1.DATAMOVCARTINV, PP.PLANPRVCONTABPATRO,'
      
        '       ABS(H1.VLRMOVCARTINV) AS VALOR, H1.HISTMOVCARTINV, H1.TIP' +
        'MOVCARTINV,'
      
        '       H1.IDINVESTIMENTO, H1.IDCARTEIRAINVEST, OI.IDOPERACAOINVE' +
        'ST, OC.IDOPERCUSTODIA,'
      
        '       DECODE(NVL(OI.IDOPERACAOINVEST,0), 0, OC.IDBOLETA, OI.NUM' +
        'DOCUMENTO) AS IDBOLETA,'
      '       0 AS COR'
      'FROM HISTCARTINV H1, OPERACAOINVEST OI,'
      
        '     (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO, ' +
        'PA.IDPLANPREVCTBPATR, PA.IDPLANOPREV, PA.IDPATRO'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      '     (SELECT H2.IDHISTCARTINV, OC1.*'
      '      FROM OPERCUSTODIA OC1, HISTCARTINV H2'
      '      WHERE'
      
        '            ((:IDPLANPREVCTBPATR IS NULL) OR (OC1.IDPLANPREVCTBP' +
        'ATR = :IDPLANPREVCTBPATR))'
      
        '        AND (OC1.DATAMOVCUSTOD = TO_DATE(:DATABOLETA,'#39'DD/MM/YYYY' +
        #39'))'
      '        AND (H2.IDHISTCARTINV = OC1.IDHISTCARTINVORIG)'
      '      UNION'
      '      SELECT H2.IDHISTCARTINV, OC1.*'
      '      FROM OPERCUSTODIA OC1, HISTCARTINV H2'
      '      WHERE'
      
        '            ((:IDPLANPREVCTBPATR IS NULL) OR (OC1.IDPLANPREVCTBP' +
        'ATR = :IDPLANPREVCTBPATR))'
      
        '        AND (OC1.DATAMOVCUSTOD = TO_DATE(:DATABOLETA,'#39'DD/MM/YYYY' +
        #39'))'
      '        AND (H2.IDHISTCARTINV = OC1.IDHISTCARTINVDEST) ) OC'
      'WHERE (H1.IDTIPOINVEST = 2)'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (H1.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      '  AND (H1.DATAMOVCARTINV    = TO_DATE(:DATABOLETA,'#39'DD/MM/YYYY'#39'))'
      '  AND (H1.TIPMOVCARTINV    <> '#39'ATU'#39')'
      '  AND (H1.IDOPERACAOINVEST  = OI.IDOPERACAOINVEST(+))'
      '  AND (H1.IDHISTCARTINV     = OC.IDHISTCARTINV(+))'
      '  AND (H1.IDPLANPREVCTBPATR  = PP.IDPLANPREVCTBPATR(+))  '
      '  AND (H1.IDCARTEIRAGERENC IS NULL)'
      'ORDER BY H1.IDOPERACAOINVEST, H1.IDHISTCARTINV'
      ' '
      ' '
      ' ')
    UpdateObject = updHistoricos
    ValidateWithMask = True
    Left = 106
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATABOLETA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATABOLETA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATABOLETA'
        ParamType = ptInput
      end>
    object qryHistoricosHISTMOVCARTINV: TStringField
      DisplayLabel = 'Histórico da Movimentação'
      DisplayWidth = 51
      FieldName = 'HISTMOVCARTINV'
      Size = 60
    end
    object qryHistoricosVALOR: TFloatField
      DisplayLabel = 'Valor Calculado'
      DisplayWidth = 12
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryHistoricosDATAMOVCARTINV: TDateTimeField
      DisplayLabel = 'Data da Movimentação'
      FieldName = 'DATAMOVCARTINV'
      Visible = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryHistoricosPLNCODIGO: TFloatField
      DisplayLabel = 'Planilha'
      DisplayWidth = 7
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryHistoricosTIPMOVCARTINV: TStringField
      DisplayLabel = 'Tipo de Movimentação'
      FieldName = 'TIPMOVCARTINV'
      Visible = False
      Size = 3
    end
    object qryHistoricosIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryHistoricosIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryHistoricosIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
    object qryHistoricosIDOPERCUSTODIA: TFloatField
      FieldName = 'IDOPERCUSTODIA'
      Visible = False
    end
    object qryHistoricosIDBOLETA: TStringField
      DisplayLabel = 'Boleta'
      FieldName = 'IDBOLETA'
      Visible = False
      Size = 30
    end
    object qryHistoricosCOR: TFloatField
      FieldName = 'COR'
      Visible = False
    end
    object qryHistoricosPLANPRVCONTABPATRO: TStringField
      DisplayWidth = 113
      FieldName = 'PLANPRVCONTABPATRO'
      Visible = False
      Size = 113
    end
  end
  object dsHistoricos: TwwDataSource
    AutoEdit = False
    DataSet = qryHistoricos
    Left = 107
    Top = 112
  end
  object pplHistoricos: TppBDEPipeline
    DataSource = dsHistoricos
    UserName = 'pplHistoricos'
    Left = 107
    Top = 64
    MasterDataPipelineName = 'pplBoletas'
    object pplHistoricosppField1: TppField
      FieldAlias = 'HISTMOVCARTINV'
      FieldName = 'HISTMOVCARTINV'
      FieldLength = 60
      DisplayWidth = 51
      Position = 0
    end
    object pplHistoricosppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 12
      Position = 1
    end
    object pplHistoricosppField3: TppField
      FieldAlias = 'DATAMOVCARTINV'
      FieldName = 'DATAMOVCARTINV'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object pplHistoricosppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 7
      Position = 3
    end
    object pplHistoricosppField5: TppField
      FieldAlias = 'TIPMOVCARTINV'
      FieldName = 'TIPMOVCARTINV'
      FieldLength = 3
      DisplayWidth = 3
      Position = 4
    end
    object pplHistoricosppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINVESTIMENTO'
      FieldName = 'IDINVESTIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplHistoricosppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplHistoricosppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDOPERACAOINVEST'
      FieldName = 'IDOPERACAOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplHistoricosppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDOPERCUSTODIA'
      FieldName = 'IDOPERCUSTODIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplHistoricosppField10: TppField
      FieldAlias = 'IDBOLETA'
      FieldName = 'IDBOLETA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 9
    end
    object pplHistoricosppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'COR'
      FieldName = 'COR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplHistoricosppField12: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 113
      DisplayWidth = 113
      Position = 11
    end
  end
  object qryLancamento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      
        'SELECT (L.LACHIST1 || L.LACHIST2) AS HISTORICO, L.LACVALOR AS LA' +
        'NCAMENTO, 0 AS COR'
      'FROM LANCAMENTO L'
      'WHERE L.IDMODULO = 79'
      '  AND L.LACDEBCRE = '#39'D'#39
      '  AND L.PLNCODIGO = :PLNCODIGO'
      'ORDER BY L.LACNUMLAN'
      '  '
      '')
    ValidateWithMask = True
    Left = 180
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptResult
      end>
    object qryLancamentoHISTORICO: TStringField
      DisplayLabel = 'Histórico do Lançamento'
      DisplayWidth = 51
      FieldName = 'HISTORICO'
      Origin = 'BASEDADOS.LANCAMENTO.LACHIST1'
      Size = 80
    end
    object qryLancamentoLANCAMENTO: TFloatField
      DisplayLabel = 'Valor Lançado'
      DisplayWidth = 13
      FieldName = 'LANCAMENTO'
      Origin = 'BASEDADOS.LANCAMENTO.LACVALOR'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryLancamentoCOR: TFloatField
      FieldName = 'COR'
      Visible = False
    end
  end
  object dsLancamento: TwwDataSource
    AutoEdit = False
    DataSet = qryLancamento
    Left = 180
    Top = 112
  end
  object pplLancamento: TppBDEPipeline
    DataSource = dsLancamento
    UserName = 'pplLancamento'
    Left = 180
    Top = 64
    MasterDataPipelineName = 'pplBoletas'
    object pplLancamentoppField1: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplLancamentoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'LANCAMENTO'
      FieldName = 'LANCAMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 13
      Position = 1
    end
    object pplLancamentoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'COR'
      FieldName = 'COR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
  end
  object updHistoricos: TUpdateSQL
    Left = 107
    Top = 208
  end
  object updBoletas: TUpdateSQL
    Left = 39
    Top = 208
  end
  object QryPlanoPatro: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO,'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE'
      '   (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)')
    ValidateWithMask = True
    Left = 182
    Top = 208
    object QryPlanoPatroPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QryPlanoPatroIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object QryPlanoPatroIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object QryPlanoPatroIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Visible = False
    end
  end
end
