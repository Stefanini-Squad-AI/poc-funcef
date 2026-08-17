inherited DmTransfPlanoCotaIntegr: TDmTransfPlanoCotaIntegr
  Width = 320
  Height = 179
  Caption = 'DmTransfPlanoCotaIntegr'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 170
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplExemploppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
  inherited dsExemplo: TwwDataSource
    Left = 108
  end
  inherited qryExemplo: TwwQuery
    Left = 47
  end
  inherited rpExemplo: TppReport
    Left = 231
    DataPipelineName = 'pplExemplo'
  end
  object pplTransfPlanoCotaIntegr: TppBDEPipeline
    DataSource = DsTransfPlanoCotaIntegr
    UserName = 'lTransfPlanoCotaIntegr'
    Left = 165
    Top = 88
    object pplTransfPlanoCotaIntegrppField1: TppField
      FieldAlias = 'DATAOPERACAO'
      FieldName = 'DATAOPERACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 10
      Position = 0
    end
    object pplTransfPlanoCotaIntegrppField2: TppField
      FieldAlias = 'IDLOTE'
      FieldName = 'IDLOTE'
      FieldLength = 30
      DisplayWidth = 10
      Position = 1
    end
    object pplTransfPlanoCotaIntegrppField3: TppField
      FieldAlias = 'DESCFUNDOINVEST'
      FieldName = 'DESCFUNDOINVEST'
      FieldLength = 60
      DisplayWidth = 35
      Position = 2
    end
    object pplTransfPlanoCotaIntegrppField4: TppField
      FieldAlias = 'PLANOPATROORIG'
      FieldName = 'PLANOPATROORIG'
      FieldLength = 113
      DisplayWidth = 29
      Position = 3
    end
    object pplTransfPlanoCotaIntegrppField5: TppField
      FieldAlias = 'PLANOPATRODEST'
      FieldName = 'PLANOPATRODEST'
      FieldLength = 113
      DisplayWidth = 29
      Position = 4
    end
    object pplTransfPlanoCotaIntegrppField6: TppField
      FieldAlias = 'DATAAPLICACAO'
      FieldName = 'DATAAPLICACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 10
      Position = 5
    end
    object pplTransfPlanoCotaIntegrppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDOPERACAO'
      FieldName = 'QTDOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 22
      Position = 6
    end
    object pplTransfPlanoCotaIntegrppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 7
    end
    object pplTransfPlanoCotaIntegrppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTUAL'
      FieldName = 'PERCENTUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 12
      Position = 8
    end
    object pplTransfPlanoCotaIntegrppField10: TppField
      FieldAlias = 'DESCTIPOFUNDOINV'
      FieldName = 'DESCTIPOFUNDOINV'
      FieldLength = 80
      DisplayWidth = 40
      Position = 9
    end
    object pplTransfPlanoCotaIntegrppField11: TppField
      FieldAlias = 'DESCTIPOCOTA'
      FieldName = 'DESCTIPOCOTA'
      FieldLength = 40
      DisplayWidth = 30
      Position = 10
    end
    object pplTransfPlanoCotaIntegrppField12: TppField
      FieldAlias = 'DATALIQUIDACAO'
      FieldName = 'DATALIQUIDACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 10
      Position = 11
    end
    object pplTransfPlanoCotaIntegrppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIOF'
      FieldName = 'VLRIOF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 14
      Position = 12
    end
    object pplTransfPlanoCotaIntegrppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRENDIMENTO'
      FieldName = 'VLRRENDIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 17
      Position = 13
    end
    object pplTransfPlanoCotaIntegrppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANPREVCTBPATRO'
      FieldName = 'IDPLANPREVCTBPATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplTransfPlanoCotaIntegrppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANPREVCTBPATRD'
      FieldName = 'IDPLANPREVCTBPATRD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplTransfPlanoCotaIntegrppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOFUNDOINVEST'
      FieldName = 'IDTIPOFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplTransfPlanoCotaIntegrppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFUNDOINVEST'
      FieldName = 'IDFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplTransfPlanoCotaIntegrppField19: TppField
      FieldAlias = 'DTAINIPROC'
      FieldName = 'DTAINIPROC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 18
    end
  end
  object pprTransfPlanoCotaIntegr: TppReport
    AutoStop = False
    DataPipeline = pplTransfPlanoCotaIntegr
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 234
    Top = 88
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplTransfPlanoCotaIntegr'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34396
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Transferência entre Planos de Cotas a Integralizar   -'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4148
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 88392
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 24871
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo'
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
      object pplPeriodoFDO: TppLabel
        UserName = 'LPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'RpConsCartRendVarShape1'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 9525
        mmLeft = 0
        mmTop = 24871
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
        Caption = 'Fundo de Investimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 32544
        mmTop = 25400
        mmWidth = 51858
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label3'
        Caption = 'Data da Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 6879
        mmLeft = 1058
        mmTop = 25400
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label2'
        Caption = 'Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 16933
        mmTop = 25400
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label4'
        Caption = 'Plano Origem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 122238
        mmTop = 25400
        mmWidth = 22489
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label5'
        Caption = 'Plano Destino'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 122238
        mmTop = 30163
        mmWidth = 22489
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label6'
        Caption = 'Data de Aplicação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 6879
        mmLeft = 187325
        mmTop = 26723
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label7'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 228071
        mmTop = 30163
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label8'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3440
        mmLeft = 262732
        mmTop = 30163
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label9'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 277284
        mmTop = 30427
        mmWidth = 2646
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText1'
        DataField = 'DESCTIPOFUNDOINV'
        DataPipeline = pplTransfPlanoCotaIntegr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        DataPipelineName = 'pplTransfPlanoCotaIntegr'
        mmHeight = 4148
        mmLeft = 114036
        mmTop = 8202
        mmWidth = 97631
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label10'
        Caption = 'Transferência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 236803
        mmTop = 25400
        mmWidth = 21431
        BandType = 0
      end
      object ppTipoCota: TppLabel
        UserName = 'Label12'
        Caption = 'Tipo de Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 84138
        mmTop = 30163
        mmWidth = 23283
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        Brush.Color = 14935011
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppdbtQtde: TppDBText
        UserName = 'dbtQtde'
        DataField = 'QTDOPERACAO'
        DataPipeline = pplTransfPlanoCotaIntegr
        DisplayFormat = '###,#0.0000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplTransfPlanoCotaIntegr'
        mmHeight = 3175
        mmLeft = 203994
        mmTop = 529
        mmWidth = 39688
        BandType = 4
      end
      object ppdbtValor: TppDBText
        UserName = 'dbtValor'
        DataField = 'VLROPERACAO'
        DataPipeline = pplTransfPlanoCotaIntegr
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplTransfPlanoCotaIntegr'
        mmHeight = 3175
        mmLeft = 243946
        mmTop = 529
        mmWidth = 25929
        BandType = 4
      end
      object ppdbtPerc: TppDBText
        UserName = 'dbtPerc'
        DataField = 'PERCENTUAL'
        DataPipeline = pplTransfPlanoCotaIntegr
        DisplayFormat = '###,#0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplTransfPlanoCotaIntegr'
        mmHeight = 3175
        mmLeft = 270140
        mmTop = 529
        mmWidth = 13758
        BandType = 4
      end
      object ppdbtDataAplic: TppDBText
        UserName = 'dbtDataAplic'
        DataField = 'DATAAPLICACAO'
        DataPipeline = pplTransfPlanoCotaIntegr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplTransfPlanoCotaIntegr'
        mmHeight = 3175
        mmLeft = 187325
        mmTop = 529
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText2'
        DataField = 'DESCTIPOCOTA'
        DataPipeline = pplTransfPlanoCotaIntegr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplTransfPlanoCotaIntegr'
        mmHeight = 3175
        mmLeft = 84138
        mmTop = 529
        mmWidth = 37042
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel5: TppLabel
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
        mmWidth = 283369
        BandType = 8
      end
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
        mmWidth = 246857
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
        mmLeft = 247121
        mmTop = 3175
        mmWidth = 36248
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDLOTE'
      DataPipeline = pplTransfPlanoCotaIntegr
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplTransfPlanoCotaIntegr'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8996
        mmPrintPosition = 0
        object ppdbtDataOper: TppDBText
          UserName = 'dbtDataOper'
          DataField = 'DATAOPERACAO'
          DataPipeline = pplTransfPlanoCotaIntegr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplTransfPlanoCotaIntegr'
          mmHeight = 3440
          mmLeft = 1058
          mmTop = 265
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppdbtLote: TppDBText
          UserName = 'dbtLote'
          DataField = 'IDLOTE'
          DataPipeline = pplTransfPlanoCotaIntegr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplTransfPlanoCotaIntegr'
          mmHeight = 3440
          mmLeft = 16933
          mmTop = 265
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppdbtFundo: TppDBText
          UserName = 'dbtFundo'
          DataField = 'DESCFUNDOINVEST'
          DataPipeline = pplTransfPlanoCotaIntegr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplTransfPlanoCotaIntegr'
          mmHeight = 3175
          mmLeft = 32544
          mmTop = 265
          mmWidth = 88636
          BandType = 3
          GroupNo = 0
        end
        object ppdbtPlanoO: TppDBText
          UserName = 'dbtPlanoO'
          DataField = 'PLANOPATROORIG'
          DataPipeline = pplTransfPlanoCotaIntegr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplTransfPlanoCotaIntegr'
          mmHeight = 3175
          mmLeft = 122238
          mmTop = 265
          mmWidth = 81492
          BandType = 3
          GroupNo = 0
        end
        object ppdbtPlanoD: TppDBText
          UserName = 'dbtPlanoD'
          DataField = 'PLANOPATRODEST'
          DataPipeline = pplTransfPlanoCotaIntegr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplTransfPlanoCotaIntegr'
          mmHeight = 3175
          mmLeft = 122238
          mmTop = 4498
          mmWidth = 81492
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 8467
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        AfterGenerate = ppGroupFooterBand2AfterGenerate
        BeforePrint = ppGroupFooterBand2BeforePrint
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppLine4: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppdbcQtde: TppDBCalc
          UserName = 'dbcQtde'
          DataField = 'QTDOPERACAO'
          DataPipeline = pplTransfPlanoCotaIntegr
          DisplayFormat = '###,#0.0000000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplTransfPlanoCotaIntegr'
          mmHeight = 3439
          mmLeft = 203994
          mmTop = 1323
          mmWidth = 39688
          BandType = 5
          GroupNo = 0
        end
        object ppdbcValor: TppDBCalc
          UserName = 'dbcValor'
          DataField = 'VLROPERACAO'
          DataPipeline = pplTransfPlanoCotaIntegr
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplTransfPlanoCotaIntegr'
          mmHeight = 3439
          mmLeft = 243946
          mmTop = 1323
          mmWidth = 25929
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object DsTransfPlanoCotaIntegr: TwwDataSource
    DataSet = QryTransfPlanoCotaIntegr
    Left = 107
    Top = 88
  end
  object QryTransfPlanoCotaIntegr: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OP.IDLOTE, OP.DATAOPERACAO, OP.DATALIQUIDACAO, OP.PERCENT' +
        'UAL, OP.IDFUNDOINVEST,'
      
        '       OD.QTDOPERACAO, OD.VLROPERACAO, OD.VLRIOF, OD.VLRRENDIMEN' +
        'TO,'
      
        '      PPO.PLANOPATROORIG, PPO.IDPLANPREVCTBPATRO, PPD.PLANOPATRO' +
        'DEST, PPD.IDPLANPREVCTBPATRD,'
      
        '       FI.DESCFUNDOINVEST, FI.DTAINIPROC, TF.IDTIPOFUNDOINVEST,T' +
        'F.DESCTIPOFUNDOINV,'
      '       HF.DATAAPLICACAO, TC.DESCTIPOCOTA'
      ''
      
        'FROM OPERACAOFUNDO OP, OPERACAOFUNDO OD, TIPOFUNDOINVEST TF, TIP' +
        'OCOTA TC,'
      ''
      
        '    (SELECT IDFUNDOINVEST, DESCFUNDOINVEST, IDTIPOFUNDOINVEST, D' +
        'TAINIPROC'
      '     FROM HISTFUNDOINVEST'
      
        '     WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH' +
        '24:MI:SS'#39') IN'
      
        '           (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),'#39'DD' +
        '/MM/YYYY, HH24:MI:SS'#39')'
      '            FROM HISTFUNDOINVEST H, TIPOFUNDOINVEST T'
      '            WHERE'
      
        '                   ((:IDFUNDOINVEST IS NULL)     OR (H.IDFUNDOIN' +
        'VEST =:IDFUNDOINVEST))'
      
        '              AND  (H.DTAVIGENCIA   < TO_DATE(:DATAFIM,'#39'DD/MM/YY' +
        'YY'#39')+1)'
      '              AND  (T.IDTIPOINVEST      =:IDTIPOINVEST)'
      
        '              AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (T.IDTIPOFUN' +
        'DOINVEST =:IDTIPOFUNDOINVEST))'
      '              AND  (H.IDTIPOFUNDOINVEST = T.IDTIPOFUNDOINVEST)'
      '            GROUP BY IDFUNDOINVEST))) FI,'
      ''
      
        '    (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANOPATROORIG, PA.ID' +
        'PLANPREVCTBPATR AS IDPLANPREVCTBPATRO'
      '     FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      '     WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '       AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PPO,'
      ''
      
        '    (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANOPATRODEST, PA.ID' +
        'PLANPREVCTBPATR AS IDPLANPREVCTBPATRD'
      '     FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      '     WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '       AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PPD,'
      ''
      '    (SELECT DISTINCT DATAAPLICACAO, IDOPERACAOFUNDO'
      '     FROM HISTCOTAINTEGRALIZA'
      '     WHERE   (IDTIPOINVEST      = :IDTIPOINVEST)'
      
        '       AND ((:IDPLANPREVCTBPATR IS NULL) OR (IDPLANPREVCTBPATR =' +
        ':IDPLANPREVCTBPATR))'
      
        '       AND ((:IDFUNDOINVEST     IS NULL) OR (IDFUNDOINVEST =:IDF' +
        'UNDOINVEST))'
      
        '       AND   (DATAAPLICACAO    <=  TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39 +
        '))'
      
        '       AND   (DATAHISTCOTAINTEG  BETWEEN TO_DATE(:DATAINI,'#39'DD/MM' +
        '/YYYY'#39') AND TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      
        '       AND ((:IDTIPOCOTA        IS NULL) OR (IDTIPOCOTA =:IDTIPO' +
        'COTA))'
      '       AND   (TIPMOVCOTAINTEGR  = '#39'TRP'#39') ) HF'
      'WHERE'
      '      (OP.IDTIPOINVEST      = :IDTIPOINVEST)'
      
        ' AND   ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR =:' +
        'IDPLANPREVCTBPATR))'
      
        ' AND  ((:IDFUNDOINVEST     IS NULL) OR (OP.IDFUNDOINVEST =:IDFUN' +
        'DOINVEST))'
      
        ' AND  (OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AN' +
        'D TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      ' AND  (OP.IDTIPOOPERACAO    = -165)'
      
        ' AND   ((:IDTIPOCOTA        IS NULL) OR (OP.IDTIPOCOTA =:IDTIPOC' +
        'OTA))'
      ' AND  (OP.IDLOTE        IS NOT NULL)'
      ' AND  (OD.IDTIPOOPERACAO    = -173)'
      ' AND  (OD.IDOPERACAOORIGEM  = OP.IDOPERACAOORIGEM)'
      ' AND  (OP.IDLOTE            = OD.IDLOTE)'
      ' AND  (OP.IDPLANPREVCTBPATR = PPO.IDPLANPREVCTBPATRO)'
      ' AND  (OD.IDPLANPREVCTBPATR = PPD.IDPLANPREVCTBPATRD)'
      ' AND  (OP.IDFUNDOINVEST     = FI.IDFUNDOINVEST)'
      ' AND  (TF.IDTIPOFUNDOINVEST = FI.IDTIPOFUNDOINVEST)'
      ' AND  (TC.IDTIPOCOTA(+)      = NVL(OP.IDTIPOCOTA,0))'
      
        ' AND ((HF.IDOPERACAOFUNDO   = OD.IDOPERACAOORIGEM) OR (HF.IDOPER' +
        'ACAOFUNDO = OP.IDOPERACAOFUNDO))'
      ''
      
        'ORDER BY OP.DATAOPERACAO, OP.IDLOTE, TF.DESCTIPOFUNDOINV, FI.DES' +
        'CFUNDOINVEST'
      ''
      ' ')
    ValidateWithMask = True
    Left = 51
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end>
    object QryTransfPlanoCotaIntegrDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data da Operação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
    end
    object QryTransfPlanoCotaIntegrIDLOTE: TStringField
      DisplayLabel = 'Lote'
      DisplayWidth = 10
      FieldName = 'IDLOTE'
      Size = 30
    end
    object QryTransfPlanoCotaIntegrDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimentos'
      DisplayWidth = 35
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryTransfPlanoCotaIntegrPLANOPATROORIG: TStringField
      DisplayLabel = 'Plano Origem'
      DisplayWidth = 29
      FieldName = 'PLANOPATROORIG'
      Size = 113
    end
    object QryTransfPlanoCotaIntegrPLANOPATRODEST: TStringField
      DisplayLabel = 'Plano Destino'
      DisplayWidth = 29
      FieldName = 'PLANOPATRODEST'
      Size = 113
    end
    object QryTransfPlanoCotaIntegrDATAAPLICACAO: TDateTimeField
      DisplayLabel = 'Data de Aplicação'
      DisplayWidth = 10
      FieldName = 'DATAAPLICACAO'
    end
    object QryTransfPlanoCotaIntegrQTDOPERACAO: TFloatField
      DisplayLabel = 'Quantidade Transf.'
      DisplayWidth = 22
      FieldName = 'QTDOPERACAO'
      DisplayFormat = '###,#0.000000000'
    end
    object QryTransfPlanoCotaIntegrVLROPERACAO: TFloatField
      DisplayLabel = 'Valor Transf.'
      DisplayWidth = 18
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryTransfPlanoCotaIntegrPERCENTUAL: TFloatField
      DisplayLabel = '%'
      DisplayWidth = 12
      FieldName = 'PERCENTUAL'
      DisplayFormat = '###,###,####0.0000'
    end
    object QryTransfPlanoCotaIntegrDESCTIPOFUNDOINV: TStringField
      DisplayLabel = 'Tipo de Fundo'
      DisplayWidth = 40
      FieldName = 'DESCTIPOFUNDOINV'
      Size = 80
    end
    object QryTransfPlanoCotaIntegrDESCTIPOCOTA: TStringField
      DisplayLabel = 'Tipo de Cota'
      DisplayWidth = 30
      FieldName = 'DESCTIPOCOTA'
      Size = 40
    end
    object QryTransfPlanoCotaIntegrDATALIQUIDACAO: TDateTimeField
      DisplayLabel = 'Liquidação'
      DisplayWidth = 10
      FieldName = 'DATALIQUIDACAO'
      Visible = False
    end
    object QryTransfPlanoCotaIntegrVLRIOF: TFloatField
      DisplayLabel = 'IOF Transf.'
      DisplayWidth = 14
      FieldName = 'VLRIOF'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryTransfPlanoCotaIntegrVLRRENDIMENTO: TFloatField
      DisplayLabel = 'Variação Transf.'
      DisplayWidth = 17
      FieldName = 'VLRRENDIMENTO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryTransfPlanoCotaIntegrIDPLANPREVCTBPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATRO'
      Visible = False
    end
    object QryTransfPlanoCotaIntegrIDPLANPREVCTBPATRD: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATRD'
      Visible = False
    end
    object QryTransfPlanoCotaIntegrIDTIPOFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryTransfPlanoCotaIntegrIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object QryTransfPlanoCotaIntegrDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
      Visible = False
    end
  end
end
