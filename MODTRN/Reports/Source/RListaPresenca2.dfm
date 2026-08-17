inherited RptListaPresenca2: TRptListaPresenca2
  Left = 245
  Top = 228
  Width = 288
  Height = 276
  Caption = 'RptListaPresenca2'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpListaPresenca
  end
  object rpListaPresenca: TppReport
    AutoStop = False
    DataPipeline = ppListaPresenca
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Lista de Presença'
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
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Left = 216
    Top = 8
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 38629
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 129911
        mmTop = 1588
        mmWidth = 24606
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 129382
        mmTop = 13758
        mmWidth = 25135
        BandType = 0
      end
      object rpTabCursosLbl1: TppLabel
        UserName = 'rpBenefPorPessoaLbl1'
        AutoSize = False
        Caption = 'Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 243417
        mmTop = 10319
        mmWidth = 9790
        BandType = 0
      end
      object rpTabCursosLbl2: TppLabel
        UserName = 'rpBenefPorPessoaLbl2'
        AutoSize = False
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 238390
        mmTop = 14552
        mmWidth = 14817
        BandType = 0
      end
      object rpTabCursosCalc1: TppSystemVariable
        UserName = 'rpBenefPorPessoaCalc1'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 254001
        mmTop = 10319
        mmWidth = 7938
        BandType = 0
      end
      object rpTabCursosCalc2: TppSystemVariable
        UserName = 'rpBenefPorPessoaCalc2'
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 254001
        mmTop = 14552
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Entidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 21696
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText20'
        DataField = 'ENTIDADE'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 20902
        mmTop = 21696
        mmWidth = 137319
        BandType = 0
      end
      object ppDBText25: TppDBText
        UserName = 'DBText201'
        DataField = 'INSTRUTOR'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 180446
        mmTop = 27252
        mmWidth = 97102
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Instrutores:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 160867
        mmTop = 27252
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Local:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 27252
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText36: TppDBText
        UserName = 'DBText202'
        DataField = 'LOCAL'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 20902
        mmTop = 27252
        mmWidth = 137319
        BandType = 0
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        AutoSize = True
        DataField = 'CARGAHORARIA'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 180446
        mmTop = 21696
        mmWidth = 29104
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Carga Hor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 160867
        mmTop = 21696
        mmWidth = 18256
        BandType = 0
      end
      object ppDBText38: TppDBText
        UserName = 'DBText24'
        AutoSize = True
        DataField = 'DATAINI'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 156898
        mmTop = 7938
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Lista de Presença em '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 112448
        mmTop = 7938
        mmWidth = 44450
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Horário:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 33073
        mmWidth = 13758
        BandType = 0
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'DATAHORA'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Stretch = True
        Transparent = True
        mmHeight = 4233
        mmLeft = 20902
        mmTop = 33073
        mmWidth = 137319
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'INSTRUTORES'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Stretch = True
        Transparent = True
        mmHeight = 4233
        mmLeft = 180446
        mmTop = 33073
        mmWidth = 97102
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'EMPREGADO'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 20902
        mmTop = 1588
        mmWidth = 77258
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'MATRICULA'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 1588
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'CENTROCUSTO'
        DataPipeline = ppListaPresenca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 103452
        mmTop = 1588
        mmWidth = 73025
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 180446
        mmTop = 6879
        mmWidth = 95250
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'DATAINI'
      DataPipeline = ppListaPresenca
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppLine2: TppLine
          UserName = 'Line2'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 2381
          mmTop = 6350
          mmWidth = 274373
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Nome do Aluno'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 20902
          mmTop = 1852
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Matícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2646
          mmTop = 1852
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Centro de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 103452
          mmTop = 1852
          mmWidth = 27517
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Assinatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 217753
          mmTop = 1852
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 2381
          mmTop = 265
          mmWidth = 274373
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppListaPresenca: TppBDEPipeline
    DataSource = dsListaPresenca
    SkipWhenNoRecords = False
    UserName = 'ppListaPresenca'
    Left = 215
    Top = 57
    object ppListaPresencappField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 70
      DisplayWidth = 70
      Position = 0
    end
    object ppListaPresencappField2: TppField
      FieldAlias = 'ENTIDADE'
      FieldName = 'ENTIDADE'
      FieldLength = 70
      DisplayWidth = 70
      Position = 1
    end
    object ppListaPresencappField3: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 2
    end
    object ppListaPresencappField4: TppField
      FieldAlias = 'INSTRUTOR'
      FieldName = 'INSTRUTOR'
      FieldLength = 70
      DisplayWidth = 70
      Position = 3
    end
    object ppListaPresencappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSTRUTORES'
      FieldName = 'INSTRUTORES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppListaPresencappField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'DATAHORA'
      FieldName = 'DATAHORA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppListaPresencappField7: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 6
    end
    object ppListaPresencappField8: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 7
    end
    object ppListaPresencappField9: TppField
      FieldAlias = 'CENTROCUSTO'
      FieldName = 'CENTROCUSTO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 8
    end
    object ppListaPresencappField10: TppField
      FieldAlias = 'LOCAL'
      FieldName = 'LOCAL'
      FieldLength = 70
      DisplayWidth = 70
      Position = 9
    end
    object ppListaPresencappField11: TppField
      FieldAlias = 'CARGAHORARIA'
      FieldName = 'CARGAHORARIA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object ppListaPresencappField12: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 11
    end
    object ppListaPresencappField13: TppField
      FieldAlias = 'DATAINI'
      FieldName = 'DATAINI'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object ppListaPresencappField14: TppField
      FieldAlias = 'DATAFIM'
      FieldName = 'DATAFIM'
      FieldLength = 10
      DisplayWidth = 10
      Position = 13
    end
    object ppListaPresencappField15: TppField
      FieldAlias = 'DIA1'
      FieldName = 'DIA1'
      FieldLength = 10
      DisplayWidth = 10
      Position = 14
    end
    object ppListaPresencappField16: TppField
      FieldAlias = 'DIA2'
      FieldName = 'DIA2'
      FieldLength = 10
      DisplayWidth = 10
      Position = 15
    end
    object ppListaPresencappField17: TppField
      FieldAlias = 'DIA3'
      FieldName = 'DIA3'
      FieldLength = 10
      DisplayWidth = 10
      Position = 16
    end
    object ppListaPresencappField18: TppField
      FieldAlias = 'DIA4'
      FieldName = 'DIA4'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object ppListaPresencappField19: TppField
      FieldAlias = 'DIA5'
      FieldName = 'DIA5'
      FieldLength = 10
      DisplayWidth = 10
      Position = 18
    end
    object ppListaPresencappField20: TppField
      FieldAlias = 'DIA6'
      FieldName = 'DIA6'
      FieldLength = 10
      DisplayWidth = 10
      Position = 19
    end
    object ppListaPresencappField21: TppField
      FieldAlias = 'DIA7'
      FieldName = 'DIA7'
      FieldLength = 10
      DisplayWidth = 10
      Position = 20
    end
    object ppListaPresencappField22: TppField
      FieldAlias = 'DIA8'
      FieldName = 'DIA8'
      FieldLength = 10
      DisplayWidth = 10
      Position = 21
    end
    object ppListaPresencappField23: TppField
      FieldAlias = 'DIA9'
      FieldName = 'DIA9'
      FieldLength = 10
      DisplayWidth = 10
      Position = 22
    end
    object ppListaPresencappField24: TppField
      FieldAlias = 'DIA10'
      FieldName = 'DIA10'
      FieldLength = 10
      DisplayWidth = 10
      Position = 23
    end
    object ppListaPresencappField25: TppField
      FieldAlias = 'SEM1'
      FieldName = 'SEM1'
      FieldLength = 10
      DisplayWidth = 10
      Position = 24
    end
    object ppListaPresencappField26: TppField
      FieldAlias = 'SEM2'
      FieldName = 'SEM2'
      FieldLength = 10
      DisplayWidth = 10
      Position = 25
    end
    object ppListaPresencappField27: TppField
      FieldAlias = 'SEM3'
      FieldName = 'SEM3'
      FieldLength = 10
      DisplayWidth = 10
      Position = 26
    end
    object ppListaPresencappField28: TppField
      FieldAlias = 'SEM4'
      FieldName = 'SEM4'
      FieldLength = 10
      DisplayWidth = 10
      Position = 27
    end
    object ppListaPresencappField29: TppField
      FieldAlias = 'SEM5'
      FieldName = 'SEM5'
      FieldLength = 10
      DisplayWidth = 10
      Position = 28
    end
    object ppListaPresencappField30: TppField
      FieldAlias = 'SEM6'
      FieldName = 'SEM6'
      FieldLength = 10
      DisplayWidth = 10
      Position = 29
    end
    object ppListaPresencappField31: TppField
      FieldAlias = 'SEM7'
      FieldName = 'SEM7'
      FieldLength = 10
      DisplayWidth = 10
      Position = 30
    end
    object ppListaPresencappField32: TppField
      FieldAlias = 'SEM8'
      FieldName = 'SEM8'
      FieldLength = 10
      DisplayWidth = 10
      Position = 31
    end
    object ppListaPresencappField33: TppField
      FieldAlias = 'SEM9'
      FieldName = 'SEM9'
      FieldLength = 10
      DisplayWidth = 10
      Position = 32
    end
    object ppListaPresencappField34: TppField
      FieldAlias = 'SEM10'
      FieldName = 'SEM10'
      FieldLength = 10
      DisplayWidth = 10
      Position = 33
    end
    object ppListaPresencappField35: TppField
      FieldAlias = 'DATA1'
      FieldName = 'DATA1'
      FieldLength = 10
      DisplayWidth = 10
      Position = 34
    end
    object ppListaPresencappField36: TppField
      FieldAlias = 'DATA2'
      FieldName = 'DATA2'
      FieldLength = 10
      DisplayWidth = 10
      Position = 35
    end
    object ppListaPresencappField37: TppField
      FieldAlias = 'DATA3'
      FieldName = 'DATA3'
      FieldLength = 10
      DisplayWidth = 10
      Position = 36
    end
    object ppListaPresencappField38: TppField
      FieldAlias = 'DATA4'
      FieldName = 'DATA4'
      FieldLength = 10
      DisplayWidth = 10
      Position = 37
    end
    object ppListaPresencappField39: TppField
      FieldAlias = 'DATA5'
      FieldName = 'DATA5'
      FieldLength = 10
      DisplayWidth = 10
      Position = 38
    end
    object ppListaPresencappField40: TppField
      FieldAlias = 'DATA6'
      FieldName = 'DATA6'
      FieldLength = 10
      DisplayWidth = 10
      Position = 39
    end
    object ppListaPresencappField41: TppField
      FieldAlias = 'DATA7'
      FieldName = 'DATA7'
      FieldLength = 10
      DisplayWidth = 10
      Position = 40
    end
    object ppListaPresencappField42: TppField
      FieldAlias = 'DATA8'
      FieldName = 'DATA8'
      FieldLength = 10
      DisplayWidth = 10
      Position = 41
    end
    object ppListaPresencappField43: TppField
      FieldAlias = 'DATA9'
      FieldName = 'DATA9'
      FieldLength = 10
      DisplayWidth = 10
      Position = 42
    end
    object ppListaPresencappField44: TppField
      FieldAlias = 'DATA10'
      FieldName = 'DATA10'
      FieldLength = 10
      DisplayWidth = 10
      Position = 43
    end
  end
  object dsListaPresenca: TwwDataSource
    AutoEdit = False
    DataSet = CdsListaPresenca
    Left = 215
    Top = 103
  end
  object CdsListaPresenca: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 215
    Top = 148
    Data = {
      950800009619E0BD01000000180000002C000000000003000000950807454D50
      5245534101004900000002000753554254595045020049000A00466978656443
      6861720005574944544802000200460008454E54494441444501004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      000200460009454D5052454741444F0100490000000200075355425459504502
      0049000A004669786564436861720005574944544802000200460009494E5354
      5255544F5201004900000002000753554254595045020049000A004669786564
      43686172000557494454480200020046000B494E53545255544F524553080004
      00000000000844415441484F524108000400000000000944455343524943414F
      01004900000002000753554254595045020049000A0046697865644368617200
      05574944544802000200460005434152474F0100490000000200075355425459
      5045020049000A00466978656443686172000557494454480200020046000B43
      454E54524F435553544F01004900000002000753554254595045020049000A00
      46697865644368617200055749445448020002004600054C4F43414C01004900
      000002000753554254595045020049000A004669786564436861720005574944
      54480200020046000C4341524741484F52415249410100490000000200075355
      4254595045020049000A0046697865644368617200055749445448020002000A
      00094D4154524943554C4101004900000002000753554254595045020049000A
      0046697865644368617200055749445448020002000A000744415441494E4901
      004900000002000753554254595045020049000A004669786564436861720005
      5749445448020002000A00074441544146494D01004900000002000753554254
      595045020049000A0046697865644368617200055749445448020002000A0004
      4449413101004900000002000753554254595045020049000A00466978656443
      68617200055749445448020002000A0004444941320100490000000200075355
      4254595045020049000A0046697865644368617200055749445448020002000A
      00044449413301004900000002000753554254595045020049000A0046697865
      644368617200055749445448020002000A000444494134010049000000020007
      53554254595045020049000A0046697865644368617200055749445448020002
      000A00044449413501004900000002000753554254595045020049000A004669
      7865644368617200055749445448020002000A00044449413601004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      0002000A00044449413701004900000002000753554254595045020049000A00
      46697865644368617200055749445448020002000A0004444941380100490000
      0002000753554254595045020049000A00466978656443686172000557494454
      48020002000A0004444941390100490000000200075355425459504502004900
      0A0046697865644368617200055749445448020002000A000544494131300100
      4900000002000753554254595045020049000A00466978656443686172000557
      49445448020002000A000453454D310100490000000200075355425459504502
      0049000A0046697865644368617200055749445448020002000A000453454D32
      01004900000002000753554254595045020049000A0046697865644368617200
      055749445448020002000A000453454D33010049000000020007535542545950
      45020049000A0046697865644368617200055749445448020002000A00045345
      4D3401004900000002000753554254595045020049000A004669786564436861
      7200055749445448020002000A000453454D3501004900000002000753554254
      595045020049000A0046697865644368617200055749445448020002000A0004
      53454D3601004900000002000753554254595045020049000A00466978656443
      68617200055749445448020002000A000453454D370100490000000200075355
      4254595045020049000A0046697865644368617200055749445448020002000A
      000453454D3801004900000002000753554254595045020049000A0046697865
      644368617200055749445448020002000A000453454D39010049000000020007
      53554254595045020049000A0046697865644368617200055749445448020002
      000A000553454D313001004900000002000753554254595045020049000A0046
      697865644368617200055749445448020002000A000544415441310100490000
      0002000753554254595045020049000A00466978656443686172000557494454
      48020002000A0005444154413201004900000002000753554254595045020049
      000A0046697865644368617200055749445448020002000A0005444154413301
      004900000002000753554254595045020049000A004669786564436861720005
      5749445448020002000A00054441544134010049000000020007535542545950
      45020049000A0046697865644368617200055749445448020002000A00054441
      54413501004900000002000753554254595045020049000A0046697865644368
      617200055749445448020002000A000544415441360100490000000200075355
      4254595045020049000A0046697865644368617200055749445448020002000A
      0005444154413701004900000002000753554254595045020049000A00466978
      65644368617200055749445448020002000A0005444154413801004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      0002000A0005444154413901004900000002000753554254595045020049000A
      0046697865644368617200055749445448020002000A00064441544131300100
      4900000002000753554254595045020049000A00466978656443686172000557
      49445448020002000A000100044C4349440400010009080000}
  end
  object sqlListaPresenca: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPRESA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ENTIDADE,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPREGADO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS INSTRUTOR,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS INSTRUTORES,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39'+'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS DATAHORA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS DESCRICAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS CARGO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS CENTROCUSTO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS LOCAL,'
      '  '#39'1234567890'#39' AS CARGAHORARIA,'
      '  '#39'1234567890'#39' AS MATRICULA,'
      '  '#39'1234567890'#39' AS DATAINI,'
      '  '#39'1234567890'#39' AS DATAFIM,'
      '  '#39'1234567890'#39' AS DIA1,'
      '  '#39'1234567890'#39' AS DIA2,'
      '  '#39'1234567890'#39' AS DIA3,'
      '  '#39'1234567890'#39' AS DIA4,'
      '  '#39'1234567890'#39' AS DIA5,'
      '  '#39'1234567890'#39' AS DIA6,'
      '  '#39'1234567890'#39' AS DIA7,'
      '  '#39'1234567890'#39' AS DIA8,'
      '  '#39'1234567890'#39' AS DIA9,'
      '  '#39'1234567890'#39' AS DIA10,'
      '  '#39'1234567890'#39' AS SEM1,'
      '  '#39'1234567890'#39' AS SEM2,'
      '  '#39'1234567890'#39' AS SEM3,'
      '  '#39'1234567890'#39' AS SEM4,'
      '  '#39'1234567890'#39' AS SEM5,'
      '  '#39'1234567890'#39' AS SEM6,'
      '  '#39'1234567890'#39' AS SEM7,'
      '  '#39'1234567890'#39' AS SEM8,'
      '  '#39'1234567890'#39' AS SEM9,'
      '  '#39'1234567890'#39' AS SEM10,'
      '  '#39'1234567890'#39' AS DATA1,'
      '  '#39'1234567890'#39' AS DATA2,'
      '  '#39'1234567890'#39' AS DATA3,'
      '  '#39'1234567890'#39' AS DATA4,'
      '  '#39'1234567890'#39' AS DATA5,'
      '  '#39'1234567890'#39' AS DATA6,'
      '  '#39'1234567890'#39' AS DATA7,'
      '  '#39'1234567890'#39' AS DATA8,'
      '  '#39'1234567890'#39' AS DATA9,'
      '  '#39'1234567890'#39' AS DATA10'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)'
      ''
      ' '
      ' ')
    ClientDataSet = CdsListaPresenca
    Left = 215
    Top = 200
  end
end
