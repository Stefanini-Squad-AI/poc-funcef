inherited DmRelConsBoletaOpcInd: TDmRelConsBoletaOpcInd
  Left = 460
  Top = 181
  Width = 240
  Height = 231
  Caption = 'DmRelConsBoletaOpcInd'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 167
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
    Left = 167
  end
  inherited qryExemplo: TwwQuery
    Left = 167
  end
  inherited rpExemplo: TppReport
    Left = 167
    Top = 13
  end
  object rpConsBoletaOpcInd: TppReport
    AutoStop = False
    DataPipeline = pplConsBoletaOperOpcInd
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Fechamento de Boleta - Opções de Índice'
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 47
    Top = 13
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34660
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Fechamento de Boleta - Opções de Índice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 70644
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
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DATAORDEM'
        DataPipeline = pplConsBoletaOperOpcInd
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 14023
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'IDBOLETA'
        DataPipeline = pplConsBoletaOperOpcInd
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 39158
        mmTop = 19579
        mmWidth = 44979
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'SGLCORRETVALORES'
        DataPipeline = pplConsBoletaOperOpcInd
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 205052
        mmTop = 19579
        mmWidth = 74348
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DESCCARTINVEST'
        DataPipeline = pplConsBoletaOperOpcInd
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 205582
        mmTop = 12171
        mmWidth = 73819
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 28840
        mmWidth = 284300
        BandType = 0
      end
      object ppShape34: TppShape
        UserName = 'Shape34'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 5556
        mmLeft = 0
        mmTop = 29104
        mmWidth = 284692
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label1'
        Caption = 'Operação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 29898
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label2'
        Caption = 'Opção'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 82815
        mmTop = 29898
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label3'
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 142082
        mmTop = 29898
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label4'
        Caption = 'Prêmio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 178330
        mmTop = 29898
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label5'
        Caption = 'Valor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 218282
        mmTop = 29898
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label6'
        Caption = 'Preço do Exercício'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 229659
        mmTop = 29898
        mmWidth = 28840
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label7'
        Caption = 'Vencimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 261144
        mmTop = 29898
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label8'
        Caption = 'Boleta :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 24871
        mmTop = 19579
        mmWidth = 11906
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5556
        mmLeft = 0
        mmTop = 29104
        mmWidth = 2646
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpRight
        Weight = 0.75
        mmHeight = 5821
        mmLeft = 281253
        mmTop = 28839
        mmWidth = 3175
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 34396
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 11113
      mmPrintPosition = 0
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DESCTIPOOPERACAO'
        DataPipeline = pplConsBoletaOperOpcInd
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 1323
        mmWidth = 77523
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = pplConsBoletaOperOpcInd
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 82815
        mmTop = 1323
        mmWidth = 44186
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'QUANTIDADE'
        DataPipeline = pplConsBoletaOperOpcInd
        DisplayFormat = '###,###,###,###'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 142611
        mmTop = 1323
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'PREMIO'
        DataPipeline = pplConsBoletaOperOpcInd
        DisplayFormat = '###,###,###0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 160338
        mmTop = 1323
        mmWidth = 29104
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VALOR'
        DataPipeline = pplConsBoletaOperOpcInd
        DisplayFormat = '###,###,###0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 190236
        mmTop = 1323
        mmWidth = 35983
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'VLRPRECOEX'
        DataPipeline = pplConsBoletaOperOpcInd
        DisplayFormat = '###,###,###0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 229659
        mmTop = 1323
        mmWidth = 28840
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'DTAVENCTO'
        DataPipeline = pplConsBoletaOperOpcInd
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 262203
        mmTop = 1323
        mmWidth = 17198
        BandType = 4
      end
      object ppDespOperacao: TppSubReport
        OnPrint = ppDespOperacaoPrint
        UserName = 'DespOperacao'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 6085
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplConsBoletaDespOpcInd
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Fechamento de Boleta - Opções de Índice'
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
          Left = 424
          Top = 288
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 12171
            mmPrintPosition = 0
            object ppLine4: TppLine
              UserName = 'Line4'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 180446
              mmTop = 11642
              mmWidth = 103981
              BandType = 1
            end
            object ppLine5: TppLine
              UserName = 'Line5'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 180446
              mmTop = 5821
              mmWidth = 103981
              BandType = 1
            end
            object ppShape1: TppShape
              UserName = 'Shape1'
              Brush.Color = clSilver
              Pen.Style = psClear
              ReprintOnOverFlow = True
              mmHeight = 5556
              mmLeft = 0
              mmTop = 265
              mmWidth = 284428
              BandType = 1
            end
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Caption = 'Despesas da Operação'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 122767
              mmTop = 794
              mmWidth = 38894
              BandType = 1
            end
            object ppLabel13: TppLabel
              UserName = 'Label13'
              Caption = 'Tipo de Despesa'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 180711
              mmTop = 6879
              mmWidth = 25400
              BandType = 1
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Caption = 'Valor'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 271463
              mmTop = 6879
              mmWidth = 7938
              BandType = 1
            end
            object ppLine11: TppLine
              UserName = 'Line11'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 6085
              mmLeft = 180182
              mmTop = 5821
              mmWidth = 5292
              BandType = 1
            end
            object ppLine12: TppLine
              UserName = 'Line12'
              Position = lpRight
              Weight = 0.75
              mmHeight = 5556
              mmLeft = 281517
              mmTop = 6085
              mmWidth = 2910
              BandType = 1
            end
          end
          object pplDespOperacao: TppDetailBand
            BeforeGenerate = pplDespOperacaoBeforeGenerate
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              DataField = 'DESCTIPODESPINV'
              DataPipeline = pplConsBoletaDespOpcInd
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 180711
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'DBText13'
              DataField = 'VLRDESPESA'
              DataPipeline = pplConsBoletaDespOpcInd
              DisplayFormat = '###,###,###0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 262203
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            AfterPrint = ppSummaryBand1AfterPrint
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppLine6: TppLine
              UserName = 'Line6'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 180446
              mmTop = 0
              mmWidth = 103981
              BandType = 7
            end
            object ppDBCalc1: TppDBCalc
              UserName = 'DBCalc1'
              DataField = 'VLRDESPESA'
              DataPipeline = pplConsBoletaDespOpcInd
              DisplayFormat = '###,###,###0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 262203
              mmTop = 794
              mmWidth = 17198
              BandType = 7
            end
          end
        end
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
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 23548
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 13758
        mmLeft = 0
        mmTop = 8996
        mmWidth = 140229
        BandType = 7
      end
      object pplVlrDesp: TppLabel
        UserName = 'Label9'
        Caption = '0,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 52123
        mmTop = 17992
        mmWidth = 6350
        BandType = 7
      end
      object pplVlrTotal: TppLabel
        UserName = 'Label10'
        Caption = '0,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 127265
        mmTop = 17992
        mmWidth = 6350
        BandType = 7
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Brush.Color = clSilver
        Pen.Style = psClear
        ReprintOnOverFlow = True
        mmHeight = 5556
        mmLeft = 265
        mmTop = 9525
        mmWidth = 139700
        BandType = 7
      end
      object pplLabelDesp: TppLabel
        UserName = 'lLabelDesp'
        Caption = 'Despesas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 43656
        mmTop = 10054
        mmWidth = 14817
        BandType = 7
      end
      object pplLabTotal: TppLabel
        UserName = 'lLabTotal'
        Caption = 'Total Líquido à Receber'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 97102
        mmTop = 10054
        mmWidth = 36513
        BandType = 7
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 14552
        mmWidth = 139965
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCTIPOOPERACAO'
      DataPipeline = pplConsBoletaOperOpcInd
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 2117
          mmLeft = 0
          mmTop = 4498
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object pplConsBoletaOperOpcInd: TppBDEPipeline
    DataSource = DMOpcoesIndice.dsBuscaOperacoes
    UserName = 'ConsBoletaOperOpcoes'
    Left = 55
    Top = 72
    object pplConsBoletaOperOpcoesppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDORDEMOPCIND'
      FieldName = 'IDORDEMOPCIND'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplConsBoletaOperOpcoesppField2: TppField
      FieldAlias = 'DATAORDEM'
      FieldName = 'DATAORDEM'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object pplConsBoletaOperOpcoesppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCORRETVALORES'
      FieldName = 'IDCORRETVALORES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplConsBoletaOperOpcoesppField4: TppField
      FieldAlias = 'IDBOLETA'
      FieldName = 'IDBOLETA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object pplConsBoletaOperOpcoesppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINVESTIMENTO'
      FieldName = 'IDINVESTIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplConsBoletaOperOpcoesppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOOPERACAO'
      FieldName = 'IDTIPOOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplConsBoletaOperOpcoesppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOINVEST'
      FieldName = 'IDTIPOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplConsBoletaOperOpcoesppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTIDADE'
      FieldName = 'QUANTIDADE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplConsBoletaOperOpcoesppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'PREMIO'
      FieldName = 'PREMIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplConsBoletaOperOpcoesppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplConsBoletaOperOpcoesppField11: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 500
      DataType = dtMemo
      DisplayWidth = 10
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplConsBoletaOperOpcoesppField12: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 11
    end
    object pplConsBoletaOperOpcoesppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDUSUARIO'
      FieldName = 'IDUSUARIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplConsBoletaOperOpcoesppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANPREVCTBPATR'
      FieldName = 'IDPLANPREVCTBPATR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplConsBoletaOperOpcoesppField15: TppField
      FieldAlias = 'STACONFIRMA'
      FieldName = 'STACONFIRMA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 14
    end
    object pplConsBoletaOperOpcoesppField16: TppField
      FieldAlias = 'STAAUTORIZA'
      FieldName = 'STAAUTORIZA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
    end
    object pplConsBoletaOperOpcoesppField17: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 16
    end
    object pplConsBoletaOperOpcoesppField18: TppField
      FieldAlias = 'DESCTIPOOPERACAO'
      FieldName = 'DESCTIPOOPERACAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 17
    end
    object pplConsBoletaOperOpcoesppField19: TppField
      FieldAlias = 'DTAVENCTO'
      FieldName = 'DTAVENCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 18
    end
    object pplConsBoletaOperOpcoesppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPRECOEX'
      FieldName = 'VLRPRECOEX'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplConsBoletaOperOpcoesppField21: TppField
      FieldAlias = 'STATPAMERICANA'
      FieldName = 'STATPAMERICANA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 20
    end
    object pplConsBoletaOperOpcoesppField22: TppField
      FieldAlias = 'STAOPCCOMPRA'
      FieldName = 'STAOPCCOMPRA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 21
    end
    object pplConsBoletaOperOpcoesppField23: TppField
      FieldAlias = 'TIPCOTVENC'
      FieldName = 'TIPCOTVENC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 22
    end
    object pplConsBoletaOperOpcoesppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRSTRIKEPUT'
      FieldName = 'VLRSTRIKEPUT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplConsBoletaOperOpcoesppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPONTO'
      FieldName = 'VLRPONTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplConsBoletaOperOpcoesppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'VENCIMENTO'
      FieldName = 'VENCIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplConsBoletaOperOpcoesppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALORDEM'
      FieldName = 'TOTALORDEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplConsBoletaOperOpcoesppField28: TppField
      FieldAlias = 'NATUREZAOPERACAO'
      FieldName = 'NATUREZAOPERACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 27
    end
    object pplConsBoletaOperOpcoesppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object pplConsBoletaOperOpcoesppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAGERENC'
      FieldName = 'IDCARTEIRAGERENC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object pplConsBoletaOperOpcoesppField31: TppField
      FieldAlias = 'IDLOTE'
      FieldName = 'IDLOTE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 30
    end
    object pplConsBoletaOperOpcoesppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCESTAOPCIND'
      FieldName = 'IDCESTAOPCIND'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object pplConsBoletaOperOpcoesppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODTIPDOC'
      FieldName = 'CODTIPDOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object pplConsBoletaOperOpcoesppField34: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 60
      DisplayWidth = 60
      Position = 33
    end
    object pplConsBoletaOperOpcoesppField35: TppField
      FieldAlias = 'SGLCORRETVALORES'
      FieldName = 'SGLCORRETVALORES'
      FieldLength = 10
      DisplayWidth = 10
      Position = 34
    end
  end
  object pplConsBoletaDespOpcInd: TppBDEPipeline
    DataSource = DMOpcoesIndice.dsBuscaBoletaOper
    UserName = 'ConsBoletaDespOpcoes'
    Left = 55
    Top = 120
    object pplConsBoletaDespOpcoesppField1: TppField
      FieldAlias = 'IDBOLETA'
      FieldName = 'IDBOLETA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 0
    end
    object pplConsBoletaDespOpcoesppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDDESPOPEROPCIND'
      FieldName = 'IDDESPOPEROPCIND'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplConsBoletaDespOpcoesppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOOPERACAO'
      FieldName = 'IDTIPOOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplConsBoletaDespOpcoesppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPODESPINVEST'
      FieldName = 'IDTIPODESPINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplConsBoletaDespOpcoesppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDOPEROPCIND'
      FieldName = 'IDOPEROPCIND'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplConsBoletaDespOpcoesppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRDESPESA'
      FieldName = 'VLRDESPESA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplConsBoletaDespOpcoesppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDREGRA'
      FieldName = 'IDREGRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplConsBoletaDespOpcoesppField8: TppField
      FieldAlias = 'DESCTIPODESPINV'
      FieldName = 'DESCTIPODESPINV'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
  end
end
