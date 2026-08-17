inherited DmRelConsAmortFdo: TDmRelConsAmortFdo
  Left = 348
  Top = 183
  Width = 321
  Height = 261
  Caption = 'DmRelConsAmortFdo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
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
  inherited rpExemplo: TppReport
    DataPipelineName = 'pplExemplo'
  end
  object rptConsAmortFdo: TppReport
    AutoStop = False
    DataPipeline = ppBDEPConsAmortizacaoCotas
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
    Left = 188
    Top = 80
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = clSilver
        mmHeight = 5556
        mmLeft = 265
        mmTop = 19315
        mmWidth = 283634
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label11'
        Caption = 'Amortização de Cotas de Fundos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8202
        mmWidth = 55827
        BandType = 0
      end
      object ppLabel12: TppLabel
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
        mmLeft = 25400
        mmTop = 265
        mmWidth = 24342
        BandType = 0
      end
      object ppDBImage6: TppDBImage
        UserName = 'DBImage6'
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
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Data de Aplicação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 30163
        mmTop = 20638
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Valor da Amortização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 110596
        mmTop = 20638
        mmWidth = 28840
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Valor do Custo Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 65617
        mmTop = 20638
        mmWidth = 31750
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Quantidade de Cotas Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 185473
        mmTop = 20638
        mmWidth = 35983
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 245269
        mmTop = 20638
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'lblDtOper'
        Caption = 'Data de Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 3175
        mmTop = 20638
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Valor do Custo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 151871
        mmTop = 20638
        mmWidth = 28046
        BandType = 0
      end
      object lblDtIni: TppLabel
        UserName = 'lblDtIni'
        Caption = 'DD/MM/YYYY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 30427
        mmTop = 14288
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'lblDtOper2'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 52388
        mmTop = 14288
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'De'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 25135
        mmTop = 14288
        mmWidth = 3969
        BandType = 0
      end
      object lblDtFim: TppLabel
        UserName = 'lblDtFim'
        Caption = 'DD/MM/YYYY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 56092
        mmTop = 14288
        mmWidth = 20108
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object shpAmortCotasFnd: TppShape
        OnPrint = shpAmortCotasFndPrint
        UserName = 'RpConsCartRendVarShape2'
        Brush.Color = 14935011
        Pen.Style = psClear
        ReprintOnOverFlow = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 265
        mmWidth = 284163
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DATAMOVFUNDO'
        DataPipeline = ppBDEPConsAmortizacaoCotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
        mmHeight = 3175
        mmLeft = 3175
        mmTop = 529
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLRCUSTOATUAL'
        DataPipeline = ppBDEPConsAmortizacaoCotas
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
        mmHeight = 3175
        mmLeft = 57415
        mmTop = 529
        mmWidth = 39952
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VLRAPLICADO'
        DataPipeline = ppBDEPConsAmortizacaoCotas
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
        mmHeight = 3175
        mmLeft = 141552
        mmTop = 529
        mmWidth = 38365
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'SALDOQTDCOTAS'
        DataPipeline = ppBDEPConsAmortizacaoCotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
        mmHeight = 3175
        mmLeft = 182034
        mmTop = 529
        mmWidth = 39423
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'SALDOVLRFUNDO'
        DataPipeline = ppBDEPConsAmortizacaoCotas
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
        mmHeight = 3175
        mmLeft = 223573
        mmTop = 529
        mmWidth = 37571
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'DATAAPLICACAO'
        DataPipeline = ppBDEPConsAmortizacaoCotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
        mmHeight = 3175
        mmLeft = 30163
        mmTop = 529
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VLROPERACAO'
        DataPipeline = ppBDEPConsAmortizacaoCotas
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
        mmHeight = 3175
        mmLeft = 99484
        mmTop = 529
        mmWidth = 39952
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppSystemVariable14: TppSystemVariable
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
        mmLeft = 256382
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
      object ppLabel14: TppLabel
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
        mmTop = 529
        mmWidth = 256382
        BandType = 8
      end
      object ppSystemVariable13: TppSystemVariable
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
        mmLeft = 529
        mmTop = 265
        mmWidth = 283634
        BandType = 8
      end
      object ppLine10: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
    end
    object ppSummaryBand6: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup8: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = ppBDEPConsAmortizacaoCotas
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
      object ppGroupHeaderBand7: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLine50: TppLine
          UserName = 'ppLine42'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 4233
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'PLANPRVCONTABPATRO'
          DataPipeline = ppBDEPConsAmortizacaoCotas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
          mmHeight = 4233
          mmLeft = 1852
          mmTop = 529
          mmWidth = 137848
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
    object ppGroup1: TppGroup
      BreakName = 'DESCFUNDOINVEST'
      DataPipeline = ppBDEPConsAmortizacaoCotas
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 4498
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          DataField = 'DESCFUNDOINVEST'
          DataPipeline = ppBDEPConsAmortizacaoCotas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
          mmHeight = 3440
          mmLeft = 3175
          mmTop = 794
          mmWidth = 136261
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppBDEPConsAmortizacaoCotas: TppBDEPipeline
    DataSource = dsConsAmortFdo
    UserName = 'BDEPConsAmortizacaoCotas'
    Left = 189
    Top = 144
    object ppBDEPConsAmortizacaoCotasppField1: TppField
      FieldAlias = 'DATAAPLICACAO'
      FieldName = 'DATAAPLICACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 0
      Position = 0
    end
    object ppBDEPConsAmortizacaoCotasppField2: TppField
      FieldAlias = 'DATAMOVFUNDO'
      FieldName = 'DATAMOVFUNDO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object ppBDEPConsAmortizacaoCotasppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRAPLICADO'
      FieldName = 'VLRAPLICADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppBDEPConsAmortizacaoCotasppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCUSTOATUAL'
      FieldName = 'VLRCUSTOATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppBDEPConsAmortizacaoCotasppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRENDIMENTO'
      FieldName = 'VLRRENDIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppBDEPConsAmortizacaoCotasppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOVLRFUNDO'
      FieldName = 'SALDOVLRFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppBDEPConsAmortizacaoCotasppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFUNDOINVEST'
      FieldName = 'IDFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppBDEPConsAmortizacaoCotasppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDHISTFUNDO'
      FieldName = 'IDHISTFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppBDEPConsAmortizacaoCotasppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOOPERACAO'
      FieldName = 'IDTIPOOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppBDEPConsAmortizacaoCotasppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppBDEPConsAmortizacaoCotasppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDOPERACAOFUNDO'
      FieldName = 'IDOPERACAOFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppBDEPConsAmortizacaoCotasppField12: TppField
      FieldAlias = 'DATAULTPGTOIR'
      FieldName = 'DATAULTPGTOIR'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
    object ppBDEPConsAmortizacaoCotasppField13: TppField
      FieldAlias = 'DESCFUNDOINVEST'
      FieldName = 'DESCFUNDOINVEST'
      FieldLength = 60
      DisplayWidth = 60
      Position = 12
    end
    object ppBDEPConsAmortizacaoCotasppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMOVFUNDO'
      FieldName = 'VLRMOVFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppBDEPConsAmortizacaoCotasppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIRPROV'
      FieldName = 'VLRIRPROV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppBDEPConsAmortizacaoCotasppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIOFPROV'
      FieldName = 'VLRIOFPROV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppBDEPConsAmortizacaoCotasppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'COTASMOVFUNDO'
      FieldName = 'COTASMOVFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppBDEPConsAmortizacaoCotasppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOQTDCOTAS'
      FieldName = 'SALDOQTDCOTAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppBDEPConsAmortizacaoCotasppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'COTAAPLICACAO'
      FieldName = 'COTAAPLICACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppBDEPConsAmortizacaoCotasppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppBDEPConsAmortizacaoCotasppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppBDEPConsAmortizacaoCotasppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppBDEPConsAmortizacaoCotasppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOINVEST'
      FieldName = 'IDTIPOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppBDEPConsAmortizacaoCotasppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppBDEPConsAmortizacaoCotasppField25: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 113
      DisplayWidth = 113
      Position = 24
    end
  end
  object qryConsAmortFdo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   HISTFUNDO.DATAAPLICACAO, HISTFUNDO.DATAMOVFUNDO, HISTFUNDO.VL' +
        'RAPLICADO,'
      
        '   (HISTFUNDO.VLRAPLICADO + OPERACAOFUNDO.VLROPERACAO) AS VLRCUS' +
        'TOATUAL,'
      '   DECODE(HISTFUNDO.SALDOVLRFUNDO-HISTFUNDO.VLRAPLICADO,'
      
        '         (ABS(HISTFUNDO.SALDOVLRFUNDO-HISTFUNDO.VLRAPLICADO)*-1)' +
        ',0,'
      
        '                  HISTFUNDO.SALDOVLRFUNDO-HISTFUNDO.VLRAPLICADO)' +
        ' AS VLRRENDIMENTO,'
      
        '   (HISTFUNDO.VLRAPLICADO+(HISTFUNDO.SALDOVLRFUNDO-HISTFUNDO.VLR' +
        'APLICADO)) AS SALDOVLRFUNDO,'
      
        '   HISTFUNDO.IDFUNDOINVEST, HISTFUNDO.IDHISTFUNDO, HISTFUNDO.IDT' +
        'IPOOPERACAO,'
      '   HISTFUNDO.IDCARTEIRAINVEST, HISTFUNDO.IDOPERACAOFUNDO, '
      
        '   HISTFUNDO.DATAULTPGTOIR, FUNDOINVEST.DESCFUNDOINVEST, HISTFUN' +
        'DO.VLRMOVFUNDO,'
      
        '   HISTFUNDO.VLRIRPROV, HISTFUNDO.VLRIOFPROV, HISTFUNDO.COTASMOV' +
        'FUNDO,'
      
        '   HISTFUNDO.SALDOQTDCOTAS, HISTFUNDO.COTAAPLICACAO, HISTFUNDO.C' +
        'ODDOCUMENTO,'
      '   HISTFUNDO.PLNCODIGO, HISTFUNDO.PLANO, HISTFUNDO.IDTIPOINVEST,'
      '   OPERACAOFUNDO.VLROPERACAO,'
      '   PLANPREV.PLANPRVCONTABPATRO'
      'FROM'
      '   HISTFUNDO, FUNDOINVEST, OPERACAOFUNDO, TIPOFUNDOINVEST,'
      '   (SELECT PA.IDPLANPREVCTBPATR,'
      '           (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      '    FROM'
      '       PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      '    WHERE'
      '       (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '       (PA.IDPLANOPREV = PL.IDPLANOPREV)) PLANPREV'
      'WHERE'
      '   (HISTFUNDO.IDTIPOOPERACAO = -43)'
      
        '   AND ((:IDPLANPREVCTBPATR IS NULL) OR (HISTFUNDO.IDPLANPREVCTB' +
        'PATR = :IDPLANPREVCTBPATR))'
      
        '   AND ((:IDFUNDOINVEST IS NULL) OR (HISTFUNDO.IDFUNDOINVEST = :' +
        'IDFUNDOINVEST))'
      
        '   AND ((:IDTIPOINVEST IS NULL) OR (TIPOFUNDOINVEST.IDTIPOINVEST' +
        ' = :IDTIPOINVEST))'
      '   AND (HISTFUNDO.DATAMOVFUNDO >= :DATAINI)'
      '   AND (HISTFUNDO.DATAMOVFUNDO <= :DATAFIM)'
      
        '   AND (HISTFUNDO.IDOPERACAOFUNDO = OPERACAOFUNDO.IDOPERACAOFUND' +
        'O)'
      '   AND (HISTFUNDO.IDFUNDOINVEST = FUNDOINVEST.IDFUNDOINVEST)'
      '   AND (HISTFUNDO.IDTIPOINVEST = TIPOFUNDOINVEST.IDTIPOINVEST)'
      
        '   AND (HISTFUNDO.IDPLANPREVCTBPATR= PLANPREV.IDPLANPREVCTBPATR)' +
        '      '
      
        'ORDER BY PLANPREV.IDPLANPREVCTBPATR, FUNDOINVEST.DESCFUNDOINVEST' +
        ','
      '         HISTFUNDO.DATAMOVFUNDO DESC, HISTFUNDO.DATAAPLICACAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 34
    Top = 77
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end>
    object qryConsAmortFdoDATAAPLICACAO: TDateTimeField
      FieldName = 'DATAAPLICACAO'
    end
    object qryConsAmortFdoDATAMOVFUNDO: TDateTimeField
      FieldName = 'DATAMOVFUNDO'
    end
    object qryConsAmortFdoVLRAPLICADO: TFloatField
      FieldName = 'VLRAPLICADO'
    end
    object qryConsAmortFdoVLRCUSTOATUAL: TFloatField
      FieldName = 'VLRCUSTOATUAL'
    end
    object qryConsAmortFdoVLRRENDIMENTO: TFloatField
      FieldName = 'VLRRENDIMENTO'
    end
    object qryConsAmortFdoSALDOVLRFUNDO: TFloatField
      FieldName = 'SALDOVLRFUNDO'
    end
    object qryConsAmortFdoIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
    end
    object qryConsAmortFdoIDHISTFUNDO: TFloatField
      FieldName = 'IDHISTFUNDO'
    end
    object qryConsAmortFdoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryConsAmortFdoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryConsAmortFdoIDOPERACAOFUNDO: TFloatField
      FieldName = 'IDOPERACAOFUNDO'
    end
    object qryConsAmortFdoDATAULTPGTOIR: TDateTimeField
      FieldName = 'DATAULTPGTOIR'
    end
    object qryConsAmortFdoDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object qryConsAmortFdoVLRMOVFUNDO: TFloatField
      FieldName = 'VLRMOVFUNDO'
    end
    object qryConsAmortFdoVLRIRPROV: TFloatField
      FieldName = 'VLRIRPROV'
    end
    object qryConsAmortFdoVLRIOFPROV: TFloatField
      FieldName = 'VLRIOFPROV'
    end
    object qryConsAmortFdoCOTASMOVFUNDO: TFloatField
      FieldName = 'COTASMOVFUNDO'
    end
    object qryConsAmortFdoSALDOQTDCOTAS: TFloatField
      FieldName = 'SALDOQTDCOTAS'
    end
    object qryConsAmortFdoCOTAAPLICACAO: TFloatField
      FieldName = 'COTAAPLICACAO'
    end
    object qryConsAmortFdoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryConsAmortFdoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryConsAmortFdoPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryConsAmortFdoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryConsAmortFdoVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryConsAmortFdoPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
  end
  object dsConsAmortFdo: TwwDataSource
    DataSet = qryConsAmortFdo
    Left = 39
    Top = 133
  end
end
