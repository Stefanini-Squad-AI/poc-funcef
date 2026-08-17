inherited DMRelSldCartGerenc: TDMRelSldCartGerenc
  Left = 341
  Top = 178
  Height = 241
  Caption = 'Caixa de Carteiras Gerenciais'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 218
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
    Left = 218
  end
  inherited qryExemplo: TwwQuery
    Left = 218
  end
  inherited rpExemplo: TppReport
    DataPipelineName = 'pplExemplo'
    inherited HeaderBand1: TppHeaderBand
      mmHeight = 23813
      inherited Label11: TppLabel
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taLeftJustified
        mmHeight = 4233
        mmLeft = 25400
        mmWidth = 31750
      end
      inherited LblEmpresa: TppLabel [1]
        Font.Size = 12
        TextAlignment = taLeftJustified
        mmHeight = 5292
        mmLeft = 25400
        mmWidth = 24342
      end
      object ppLCarteira: TppLabel [2]
        UserName = 'LCarteira'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182827
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppLPeriodo: TppLabel [3]
        UserName = 'LPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDbLogo: TppDBImage [4]
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
      inherited Line1: TppLine [5]
        mmHeight = 2910
        mmTop = 22754
      end
    end
  end
  object rptSldCartGerenc: TppReport
    AutoStop = False
    DataPipeline = pplSaldo
    OnStartPage = rptSldCartGerencStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Caixa de Carteiras Gerenciais'
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
    Left = 74
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplSaldo'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24606
      mmPrintPosition = 0
      object shpCabecalho: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        mmHeight = 5027
        mmLeft = 0
        mmTop = 19579
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label7'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 188384
        mmTop = 20108
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label8'
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 39159
        mmTop = 20108
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Data do Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 6879
        mmTop = 20108
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Saldos de Caixa de Carteiras Gerenciais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8202
        mmWidth = 67469
        BandType = 0
      end
      object ppLabel5: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa1'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'LCarteira1'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 184150
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'LPeriodo1'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo1'
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
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
      object shpSldCartGerencSaldo: TppShape
        OnPrint = shpSldCartGerencSaldoPrint
        UserName = 'shpSldCartGerencSaldo'
        Pen.Style = psClear
        mmHeight = 3440
        mmLeft = 5821
        mmTop = 0
        mmWidth = 191559
        BandType = 4
      end
      object dbValorOperacao: TppDBText
        UserName = 'dbValorOperacao'
        DataField = 'SALDOCAIXA'
        DataPipeline = pplSaldo
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3175
        mmLeft = 159544
        mmTop = 0
        mmWidth = 36777
        BandType = 4
      end
      object srptSldCaixaGerenc: TppSubReport
        OnPrint = srptSldCaixaGerencPrint
        UserName = 'srptSldCaixaGerenc'
        DrillDownComponent = ppdbCarteira
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplMovimento'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 3969
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplMovimento
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Caixa de Carteiras Gerenciais'
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
          Left = 456
          Top = 296
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplMovimento'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppShape1: TppShape
              UserName = 'Shape1'
              Brush.Color = clSilver
              mmHeight = 4233
              mmLeft = 38365
              mmTop = 0
              mmWidth = 158750
              BandType = 1
            end
            object ppLabel13: TppLabel
              UserName = 'Label13'
              Caption = 'Data de Movimentação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 123296
              mmTop = 529
              mmWidth = 30163
              BandType = 1
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Caption = 'Valor do Movimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 169334
              mmTop = 529
              mmWidth = 26723
              BandType = 1
            end
            object ppLabel9: TppLabel
              UserName = 'Label9'
              Caption = 'Evento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 39688
              mmTop = 529
              mmWidth = 9260
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object shpSldCartGerencMovimento: TppShape
              OnPrint = shpSldCartGerencMovimentoPrint
              UserName = 'shpSldCartGerencMovimento'
              Pen.Style = psClear
              mmHeight = 3704
              mmLeft = 38365
              mmTop = 0
              mmWidth = 159015
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              DataField = 'DATAHISTCAIXA'
              DataPipeline = pplMovimento
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'pplMovimento'
              mmHeight = 3175
              mmLeft = 130175
              mmTop = 529
              mmWidth = 16140
              BandType = 4
            end
            object dbtValorItem: TppDBText
              UserName = 'dbtValorItem'
              DataField = 'VLRHISTCAIXA'
              DataPipeline = pplMovimento
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplMovimento'
              mmHeight = 3175
              mmLeft = 159279
              mmTop = 265
              mmWidth = 37306
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'DESCCAIXACOTA'
              DataPipeline = pplMovimento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplMovimento'
              mmHeight = 3175
              mmLeft = 39158
              mmTop = 265
              mmWidth = 85990
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 2910
            mmPrintPosition = 0
            object ppLine1: TppLine
              UserName = 'Line1'
              Weight = 0.75
              mmHeight = 1852
              mmLeft = 38365
              mmTop = 0
              mmWidth = 159015
              BandType = 7
            end
          end
        end
      end
      object ppdbCarteira: TppDBText
        UserName = 'dbCarteira'
        DataField = 'CARTEIRA'
        DataPipeline = pplSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3175
        mmLeft = 39159
        mmTop = 0
        mmWidth = 116152
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DATAHISTCAIXA'
        DataPipeline = pplSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3175
        mmLeft = 6879
        mmTop = 265
        mmWidth = 17198
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
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel3: TppLabel
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
        mmWidth = 197909
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
        mmWidth = 197380
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
        mmWidth = 25400
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape4'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 197644
        BandType = 7
      end
      object ppLabel7: TppLabel
        UserName = 'Label3'
        Caption = 'Caixa Total: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 39159
        mmTop = 0
        mmWidth = 19315
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'SALDOCAIXA'
        DataPipeline = pplSaldo
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        LookAhead = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3175
        mmLeft = 153459
        mmTop = 265
        mmWidth = 42863
        BandType = 7
      end
    end
  end
  object pplSaldo: TppBDEPipeline
    DataSource = frmCadOpeVirtual.dsSaldoCaixas
    UserName = 'pplSaldo'
    Left = 40
    Top = 56
    object pplSaldoppField1: TppField
      FieldAlias = 'DATAHISTCAIXA'
      FieldName = 'DATAHISTCAIXA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 0
      Position = 0
    end
    object pplSaldoppField2: TppField
      FieldAlias = 'CARTEIRA'
      FieldName = 'CARTEIRA'
      FieldLength = 60
      DisplayWidth = 65
      Position = 1
    end
    object pplSaldoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOCAIXA'
      FieldName = 'SALDOCAIXA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 17
      Position = 2
    end
    object pplSaldoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAXEVENTO'
      FieldName = 'IDCARTEIRAXEVENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplSaldoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplSaldoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAGERENC'
      FieldName = 'IDCARTEIRAGERENC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
  end
  object pplMovimento: TppBDEPipeline
    DataSource = frmCadOpeVirtual.dsSaldoCaixaDet
    UserName = 'pplMovimento'
    Left = 117
    Top = 56
  end
end
