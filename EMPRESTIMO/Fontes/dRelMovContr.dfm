inherited dtmRelMovContr: TdtmRelMovContr
  Left = 140
  Top = 224
  Width = 194
  Height = 156
  Caption = 'dRelMovContr'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 24
    Top = 56
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
    Left = 24
    Top = 68
  end
  inherited qryExemplo: TwwQuery
    Left = 24
    Top = 80
  end
  inherited rpExemplo: TppReport
    Left = 24
    Top = 8
  end
  object pplMovimentoContr: TppBDEPipeline
    DataSource = dtsMovimentoContr
    CloseDataSource = True
    UserName = 'lExemplo1'
    Left = 120
    Top = 56
    object pplMovimentoContrppField1: TppField
      FieldAlias = 'DATACREDITO'
      FieldName = 'DATACREDITO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 0
      Position = 0
    end
    object pplMovimentoContrppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOCONTREMPTMO'
      FieldName = 'IDTIPOCONTREMPTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplMovimentoContrppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOEMPTMO'
      FieldName = 'IDCONTRATOEMPTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplMovimentoContrppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDITEMEMPTMO'
      FieldName = 'IDITEMEMPTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplMovimentoContrppField5: TppField
      FieldAlias = 'ITEDESCRICAO'
      FieldName = 'ITEDESCRICAO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 4
    end
    object pplMovimentoContrppField6: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object pplMovimentoContrppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEVLRPREVISTO'
      FieldName = 'HMEVLRPREVISTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplMovimentoContrppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEVLREFETIVO'
      FieldName = 'HMEVLREFETIVO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplMovimentoContrppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMETXJUROS'
      FieldName = 'HMETXJUROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplMovimentoContrppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplMovimentoContrppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRUBRICA'
      FieldName = 'IDRUBRICA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplMovimentoContrppField12: TppField
      FieldAlias = 'HMEDATAPREVISTA'
      FieldName = 'HMEDATAPREVISTA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
    object pplMovimentoContrppField13: TppField
      FieldAlias = 'HMEDATAEFETIVA'
      FieldName = 'HMEDATAEFETIVA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 12
    end
    object pplMovimentoContrppField14: TppField
      FieldAlias = 'HMEDATAVENCTO'
      FieldName = 'HMEDATAVENCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 13
    end
    object pplMovimentoContrppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANOCOMP'
      FieldName = 'ANOCOMP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplMovimentoContrppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'MESCOMP'
      FieldName = 'MESCOMP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplMovimentoContrppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANOCOBR'
      FieldName = 'ANOCOBR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplMovimentoContrppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'MESCOBR'
      FieldName = 'MESCOBR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplMovimentoContrppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEPARCELA'
      FieldName = 'HMEPARCELA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplMovimentoContrppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMESEQCOBRANCA'
      FieldName = 'HMESEQCOBRANCA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplMovimentoContrppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMESALDODEV'
      FieldName = 'HMESALDODEV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplMovimentoContrppField22: TppField
      FieldAlias = 'PLNPLANIL'
      FieldName = 'PLNPLANIL'
      FieldLength = 81
      DisplayWidth = 81
      Position = 21
    end
    object pplMovimentoContrppField23: TppField
      FieldAlias = 'PLNDATDIA'
      FieldName = 'PLNDATDIA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 22
    end
    object pplMovimentoContrppField24: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 23
    end
    object pplMovimentoContrppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'TIPOMOV'
      FieldName = 'TIPOMOV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplMovimentoContrppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'ITCSEQCALCULO'
      FieldName = 'ITCSEQCALCULO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplMovimentoContrppField27: TppField
      FieldAlias = 'FLGFORMAPAG'
      FieldName = 'FLGFORMAPAG'
      FieldLength = 18
      DisplayWidth = 18
      Position = 26
    end
    object pplMovimentoContrppField28: TppField
      FieldAlias = 'EVENTO'
      FieldName = 'EVENTO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 27
    end
    object pplMovimentoContrppField29: TppField
      FieldAlias = 'ANOMESCOMP'
      FieldName = 'ANOMESCOMP'
      FieldLength = 5
      DisplayWidth = 5
      Position = 28
    end
    object pplMovimentoContrppField30: TppField
      FieldAlias = 'ANOMESCOBR'
      FieldName = 'ANOMESCOBR'
      FieldLength = 5
      DisplayWidth = 5
      Position = 29
    end
    object pplMovimentoContrppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_ABERTO'
      FieldName = 'VLR_ABERTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
  end
  object dtsMovimentoContr: TwwDataSource
    DataSet = qryMovimentoContr
    Left = 120
    Top = 68
  end
  object rpMovimentoContr: TppReport
    AutoStop = False
    DataPipeline = pplMovimentoContr
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Movimentação por Contrato'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Fabio\CM\Relatorios\mov.ep 1.rtm'
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 120
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 12700
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Movimentação de Empréstimo por Contrato'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 98161
        mmTop = 6085
        mmWidth = 88106
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'CBS Previdência'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 120121
        mmTop = 0
        mmWidth = 39158
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object rpMovimentoContrShapeDet: TppShape
        OnPrint = rpMovimentoContrShapeDetPrint
        UserName = 'rpMovimentoContrShapeDet'
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'IDITEMEMPTMO'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 28046
        mmTop = 794
        mmWidth = 5821
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'ITEDESCRICAO'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 34396
        mmTop = 794
        mmWidth = 37571
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplMovimentoContr
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 142875
        mmTop = 794
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'ANOMESCOMP'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 85990
        mmTop = 794
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'HMEDATAVENCTO'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 116946
        mmTop = 794
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'IDRUBRICA'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 220398
        mmTop = 794
        mmWidth = 9260
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'HMETXJUROS'
        DataPipeline = pplMovimentoContr
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 193675
        mmTop = 794
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'CODDOCUMENTO'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 204523
        mmTop = 794
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'HMEDATAPREVISTA'
        DataPipeline = pplMovimentoContr
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 95779
        mmTop = 794
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'HMEVLREFETIVO'
        DataPipeline = pplMovimentoContr
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 159809
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'ANOMESCOBR'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 107156
        mmTop = 794
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'HMEDATAEFETIVA'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 129117
        mmTop = 794
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'PLNPLANIL'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 230188
        mmTop = 794
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'HMEPARCELA'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 73025
        mmTop = 794
        mmWidth = 6085
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'HMESEQCOBRANCA'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 79640
        mmTop = 794
        mmWidth = 5821
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'HMESALDODEV'
        DataPipeline = pplMovimentoContr
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 177800
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'FLGFORMAPAG'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 252678
        mmTop = 794
        mmWidth = 30956
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'EVENTO'
        DataPipeline = pplMovimentoContr
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 265
        mmTop = 794
        mmWidth = 27252
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 2910
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 3175
        mmWidth = 41540
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
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
        mmLeft = 94986
        mmTop = 3175
        mmWidth = 94192
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
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
        mmLeft = 252942
        mmTop = 3175
        mmWidth = 28840
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDCONTRATOEMPTMO'
      DataPipeline = pplMovimentoContr
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14552
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 5821
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplMovimentoContr
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 17463
          mmTop = 794
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'NOME'
          DataPipeline = pplMovimentoContr
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 65352
          mmTop = 1058
          mmWidth = 116417
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'IDITEMEMPTMO'
          DataPipeline = pplMovimentoContr
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 215371
          mmTop = 1058
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'TCEDESCRICAO'
          DataPipeline = pplMovimentoContr
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 223573
          mmTop = 1058
          mmWidth = 61119
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label16'
          Caption = 'Contrato'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 1852
          mmTop = 794
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label17'
          Caption = 'Mutuário:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 46038
          mmTop = 794
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label18'
          Caption = 'Tipo de Contrato : '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 182563
          mmTop = 794
          mmWidth = 32015
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          Caption = 'Evento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 265
          mmTop = 10054
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label2'
          Caption = 'Item'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 27781
          mmTop = 10054
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label14'
          Caption = 'Parc./ Seq.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 73025
          mmTop = 10054
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label3'
          Caption = 'Vencto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 118534
          mmTop = 10054
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label15'
          Caption = 'Devedor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 183092
          mmTop = 10054
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label7'
          Caption = 'Cobr.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 107421
          mmTop = 10054
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Juros'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 193675
          mmTop = 10054
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label9'
          Caption = 'Documento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 204523
          mmTop = 10054
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label10'
          Caption = 'Rubrica'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 220398
          mmTop = 10054
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label12'
          Caption = 'Planilha'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 235215
          mmTop = 6615
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 12965
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = 'Código / Número'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 230188
          mmTop = 10054
          mmWidth = 19844
          BandType = 3
          GroupNo = 0
        end
        object ppLabel25: TppLabel
          UserName = 'Label21'
          Caption = 'Pagamento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 252678
          mmTop = 10054
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object ppLabel26: TppLabel
          UserName = 'Label22'
          Caption = 'Data'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 98425
          mmTop = 6615
          mmWidth = 5292
          BandType = 3
          GroupNo = 0
        end
        object ppLabel27: TppLabel
          UserName = 'Label23'
          Caption = 'Saldo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 184680
          mmTop = 6615
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object ppLabel28: TppLabel
          UserName = 'Label25'
          Caption = 'Tx.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 196850
          mmTop = 6615
          mmWidth = 3440
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label13'
          Caption = 'Forma de '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 253736
          mmTop = 6615
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label20'
          Caption = 'Compet.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 85990
          mmTop = 10054
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'Label26'
          Caption = 'Data'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 119856
          mmTop = 6615
          mmWidth = 5292
          BandType = 3
          GroupNo = 0
        end
        object ppLabel29: TppLabel
          UserName = 'Label29'
          Caption = 'Prevista'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 96309
          mmTop = 10054
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppLabel30: TppLabel
          UserName = 'Label30'
          Caption = 'Efetiva'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 131763
          mmTop = 10054
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppLabel31: TppLabel
          UserName = 'Label31'
          Caption = 'Data'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 133086
          mmTop = 6615
          mmWidth = 5292
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label301'
          Caption = 'Previsto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 149490
          mmTop = 10054
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label4'
          Caption = 'Valor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 151342
          mmTop = 6615
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label5'
          Caption = 'Valor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 169863
          mmTop = 6615
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object ppLabel32: TppLabel
          UserName = 'Label32'
          Caption = 'Efetivo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 168805
          mmTop = 10054
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          ParentWidth = True
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLR_ABERTO'
          DataPipeline = pplMovimentoContr
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 176477
          mmTop = 794
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label6'
          Caption = 'Valor em Aberto:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 155575
          mmTop = 794
          mmWidth = 19844
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryMovimentoContr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  DATACREDITO,'
      '  C.IDTIPOCONTREMPTMO,'
      '  C.IDCONTRATOEMPTMO,'
      '  I.IDITEMEMPTMO,'
      '  I.ITEDESCRICAO,'
      '  P.NOME,'
      '  H.HMEVLRPREVISTO,'
      '  H.HMEVLREFETIVO,'
      '  HMETXJUROS,'
      '  CODDOCUMENTO,'
      '  IDRUBRICA,'
      '  H.HMEDATAPREVISTA,'
      '  H.HMEDATAEFETIVA,'
      '  H.HMEDATAVENCTO,'
      '  H.HMEANOCOMPETENCIA AS ANOCOMP,'
      '  H.HMEMESCOMPETENCIA AS MESCOMP,'
      '  H.HMEANOCOBRANCA AS ANOCOBR,'
      '  H.HMEMESCOBRANCA AS MESCOBR,'
      '  H.HMEPARCELA,'
      '  H.HMESEQCOBRANCA,'
      '  H.HMESALDODEV,'
      '  (PL.PLNCODIGO||'#39'/'#39'||PL.PLNPLANIL) AS PLNPLANIL,'
      '  PL.PLNDATDIA,'
      '  TC.TCEDESCRICAO,'
      '  H.HMETIPOMOV AS TIPOMOV,'
      '  IC.ITCSEQCALCULO,'
      '  DECODE(C.FLGFORMAPAG,'
      '         '#39'F'#39', '#39'Folha de Pagamento'#39','
      '                '#39'Banco'#39') AS FLGFORMAPAG,'
      '  DECODE(H.HMETIPOMOV,'
      '         0, '#39'Concessão/Renovação'#39','
      '         1, '#39'Prestação '#39','
      '         2, '#39'Amortização/Refinanciamento'#39','
      '         3, '#39'Quitação'#39','
      '         4, '#39'Atualização de Débito'#39','
      '         5, '#39'Atualização de Saldo (Diária)'#39' ,'
      '         6, '#39'Importação/Migração'#39','
      '         7, '#39'Ajustes (Cobrança/Devolução)'#39','
      '         8, '#39'Ajustes (Saldo Devedor)'#39
      '        ) AS EVENTO,'
      
        '  TO_CHAR(H.HMEMESCOMPETENCIA, '#39'00'#39') || '#39'/'#39' || TO_CHAR(H.HMEANOC' +
        'OMPETENCIA,'#39'0000'#39') AS ANOMESCOMP,'
      
        '  TO_CHAR(H.HMEMESCOBRANCA, '#39'00'#39')    || '#39'/'#39' || TO_CHAR(H.HMEANOC' +
        'OBRANCA,'#39'0000'#39')    AS ANOMESCOBR,'
      
        '  DECODE(NVL(H.HMECENTRALIZA,0),0,0,H.HMEVLRPREVISTO-NVL(HMEVLRE' +
        'FETIVO,0)) +'
      
        '  DECODE(NVL(H.HMEDESTACADO,0),0,0,H.HMEVLRPREVISTO-NVL(HMEVLREF' +
        'ETIVO,0)) AS VLR_ABERTO'
      'FROM'
      '  PESSOA           P,'
      '  PLANILHA         PL,'
      '  HISTMOVEMPTMO    H,'
      '  CONTRATOEMPTMO   C,'
      '  ITEMXTIPOCONTR   IC,'
      '  TIPOCONTREMPTMO  TC,'
      '  ITEMEMPTMO       I'
      'WHERE'
      
        '      (LTRIM(RTRIM(TO_CHAR(H.HMEANOCOMPETENCIA, '#39'0000'#39')))) ||   ' +
        '    (LTRIM(RTRIM(TO_CHAR(H.HMEMESCOMPETENCIA, '#39'00'#39')))) >= '#39'19990' +
        '9'#39
      
        '  AND (LTRIM(RTRIM(TO_CHAR(H.HMEANOCOMPETENCIA, '#39'0000'#39')))) ||   ' +
        '    (LTRIM(RTRIM(TO_CHAR(H.HMEMESCOMPETENCIA, '#39'00'#39')))) <= '#39'20041' +
        '2'#39
      '  AND ((H.FLGESTORNADO IS NULL) OR (H.FLGESTORNADO = 0))'
      '  AND C.IDBENEF           = P.IDPESSOA'
      '  AND C.IDCONTRATOEMPTMO  = H.IDCONTRATOEMPTMO   '
      '  AND C.IDTIPOCONTREMPTMO = IC.IDTIPOCONTREMPTMO '
      '  AND I.IDITEMEMPTMO      = IC.IDITEMEMPTMO      '
      '  AND H.IDITEMEMPTMO      = IC.IDITEMEMPTMO      '
      '  AND H.PLNCODIGO         = PL.PLNCODIGO(+)      '
      
        '  AND C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO  AND (C.IDCONTR' +
        'ATOEMPTMO  = 375215 ) '
      
        ' AND (C.IDPATRO           IN (42904, 1, 42908, 2113, 127094, 200' +
        '2, 42906, 2003, 42902, 42905, 42907) ) '
      ' AND (C.IDPLANOPREV       IN (4, 6, 7) ) '
      
        'ORDER BY    C.IDCONTRATOEMPTMO , H.HMEANOCOMPETENCIA, H.HMEMESCO' +
        'MPETENCIA,                      '
      
        '  H.HMETIPOMOV, H.HMEPARCELA, H.HMESEQCOBRANCA, IC.ITCSEQCALCULO' +
        ' '
      ''
      ' ')
    ValidateWithMask = True
    Left = 120
    Top = 88
    object qryMovimentoContrDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryMovimentoContrIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryMovimentoContrIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryMovimentoContrIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryMovimentoContrITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryMovimentoContrNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryMovimentoContrHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryMovimentoContrHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryMovimentoContrHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qryMovimentoContrCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryMovimentoContrIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object qryMovimentoContrHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryMovimentoContrHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
    end
    object qryMovimentoContrHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryMovimentoContrANOCOMP: TFloatField
      FieldName = 'ANOCOMP'
    end
    object qryMovimentoContrMESCOMP: TFloatField
      FieldName = 'MESCOMP'
    end
    object qryMovimentoContrANOCOBR: TFloatField
      FieldName = 'ANOCOBR'
    end
    object qryMovimentoContrMESCOBR: TFloatField
      FieldName = 'MESCOBR'
    end
    object qryMovimentoContrHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryMovimentoContrHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryMovimentoContrHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryMovimentoContrPLNPLANIL: TStringField
      FieldName = 'PLNPLANIL'
      Size = 81
    end
    object qryMovimentoContrPLNDATDIA: TDateTimeField
      FieldName = 'PLNDATDIA'
    end
    object qryMovimentoContrTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryMovimentoContrTIPOMOV: TFloatField
      FieldName = 'TIPOMOV'
    end
    object qryMovimentoContrITCSEQCALCULO: TFloatField
      FieldName = 'ITCSEQCALCULO'
    end
    object qryMovimentoContrFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      Size = 18
    end
    object qryMovimentoContrEVENTO: TStringField
      FieldName = 'EVENTO'
      Size = 18
    end
    object qryMovimentoContrANOMESCOMP: TStringField
      FieldName = 'ANOMESCOMP'
      Size = 5
    end
    object qryMovimentoContrANOMESCOBR: TStringField
      FieldName = 'ANOMESCOBR'
      Size = 5
    end
    object qryMovimentoContrVLR_ABERTO: TFloatField
      FieldName = 'VLR_ABERTO'
    end
  end
end
