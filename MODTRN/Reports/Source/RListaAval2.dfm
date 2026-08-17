inherited RptListaAval2: TRptListaAval2
  Left = 245
  Top = 228
  Width = 288
  Height = 276
  Caption = 'RptListaAval2'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpListaAval
  end
  object rpListaAval: TppReport
    AutoStop = False
    DataPipeline = ppListaAval
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
      mmBottomOffset = 0
      mmHeight = 47096
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppListaAval
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
        DataPipeline = ppListaAval
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
        mmLeft = 2646
        mmTop = 21696
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText20'
        DataField = 'ENTIDADE'
        DataPipeline = ppListaAval
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
        DataPipeline = ppListaAval
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 180446
        mmTop = 21696
        mmWidth = 97102
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Instrutor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 160867
        mmTop = 21696
        mmWidth = 15610
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 2381
        mmTop = 46567
        mmWidth = 274373
        BandType = 0
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
        mmTop = 41804
        mmWidth = 25929
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
        mmLeft = 2646
        mmTop = 27252
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText36: TppDBText
        UserName = 'DBText202'
        DataField = 'LOCAL'
        DataPipeline = ppListaAval
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
        DataPipeline = ppListaAval
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 180446
        mmTop = 27252
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
        mmTop = 27252
        mmWidth = 18256
        BandType = 0
      end
      object ppDBText38: TppDBText
        UserName = 'DBText24'
        AutoSize = True
        DataField = 'DATAINI'
        DataPipeline = ppListaAval
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 20902
        mmTop = 32544
        mmWidth = 14023
        BandType = 0
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
        mmTop = 41804
        mmWidth = 14023
        BandType = 0
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
        mmLeft = 98954
        mmTop = 41804
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Fator'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 135996
        mmTop = 41804
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Planilha para Avaliações dos Alunos '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 105569
        mmTop = 7938
        mmWidth = 74877
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DATAFIM'
        DataPipeline = ppListaAval
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 46302
        mmTop = 32544
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2646
        mmTop = 32544
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 42863
        mmTop = 32544
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Nota ou Conceito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 219340
        mmTop = 41804
        mmWidth = 29369
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'FATOR'
        DataPipeline = ppListaAval
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 135996
        mmTop = 529
        mmWidth = 55298
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'OBSERVACAO'
        DataPipeline = ppListaAval
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 194205
        mmTop = 529
        mmWidth = 82815
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 135996
        mmTop = 0
        mmWidth = 140759
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'MATRICULA'
      DataPipeline = ppListaAval
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'MATRICULA'
          DataPipeline = ppListaAval
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 2646
          mmTop = 794
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'EMPREGADO'
          DataPipeline = ppListaAval
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 20638
          mmTop = 794
          mmWidth = 77258
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'CENTROCUSTO'
          DataPipeline = ppListaAval
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 98690
          mmTop = 794
          mmWidth = 100013
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 1588
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 2646
          mmTop = 265
          mmWidth = 274373
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppListaAval: TppBDEPipeline
    DataSource = dsListaAval
    SkipWhenNoRecords = False
    UserName = 'ListaAval'
    Left = 215
    Top = 57
    object ppListaAvalppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 70
      DisplayWidth = 70
      Position = 0
    end
    object ppListaAvalppField2: TppField
      FieldAlias = 'ENTIDADE'
      FieldName = 'ENTIDADE'
      FieldLength = 70
      DisplayWidth = 70
      Position = 1
    end
    object ppListaAvalppField3: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 2
    end
    object ppListaAvalppField4: TppField
      FieldAlias = 'INSTRUTOR'
      FieldName = 'INSTRUTOR'
      FieldLength = 70
      DisplayWidth = 70
      Position = 3
    end
    object ppListaAvalppField5: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 4
    end
    object ppListaAvalppField6: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 5
    end
    object ppListaAvalppField7: TppField
      FieldAlias = 'CENTROCUSTO'
      FieldName = 'CENTROCUSTO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 6
    end
    object ppListaAvalppField8: TppField
      FieldAlias = 'LOCAL'
      FieldName = 'LOCAL'
      FieldLength = 70
      DisplayWidth = 70
      Position = 7
    end
    object ppListaAvalppField9: TppField
      FieldAlias = 'FATOR'
      FieldName = 'FATOR'
      FieldLength = 70
      DisplayWidth = 70
      Position = 8
    end
    object ppListaAvalppField10: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 9
    end
    object ppListaAvalppField11: TppField
      FieldAlias = 'CARGAHORARIA'
      FieldName = 'CARGAHORARIA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object ppListaAvalppField12: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 11
    end
    object ppListaAvalppField13: TppField
      FieldAlias = 'DATAINI'
      FieldName = 'DATAINI'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object ppListaAvalppField14: TppField
      FieldAlias = 'DATAFIM'
      FieldName = 'DATAFIM'
      FieldLength = 10
      DisplayWidth = 10
      Position = 13
    end
    object ppListaAvalppField15: TppField
      FieldAlias = 'AVALTEOR'
      FieldName = 'AVALTEOR'
      FieldLength = 10
      DisplayWidth = 10
      Position = 14
    end
    object ppListaAvalppField16: TppField
      FieldAlias = 'AVALPRAT'
      FieldName = 'AVALPRAT'
      FieldLength = 10
      DisplayWidth = 10
      Position = 15
    end
  end
  object dsListaAval: TwwDataSource
    AutoEdit = False
    DataSet = CdsListaAval
    Left = 215
    Top = 103
  end
  object CdsListaAval: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 215
    Top = 148
    Data = {
      780300009619E0BD010000001800000010000000000003000000780307454D50
      5245534101004900000002000753554254595045020049000A00466978656443
      6861720005574944544802000200460008454E54494441444501004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      000200460009454D5052454741444F0100490000000200075355425459504502
      0049000A004669786564436861720005574944544802000200460009494E5354
      5255544F5201004900000002000753554254595045020049000A004669786564
      43686172000557494454480200020046000944455343524943414F0100490000
      0002000753554254595045020049000A00466978656443686172000557494454
      4802000200460005434152474F01004900000002000753554254595045020049
      000A00466978656443686172000557494454480200020046000B43454E54524F
      435553544F01004900000002000753554254595045020049000A004669786564
      4368617200055749445448020002004600054C4F43414C010049000000020007
      53554254595045020049000A0046697865644368617200055749445448020002
      004600054641544F5201004900000002000753554254595045020049000A0046
      6978656443686172000557494454480200020046000A4F42534552564143414F
      01004900000002000753554254595045020049000A0046697865644368617200
      0557494454480200020046000C4341524741484F524152494101004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      0002000A00094D4154524943554C410100490000000200075355425459504502
      0049000A0046697865644368617200055749445448020002000A000744415441
      494E4901004900000002000753554254595045020049000A0046697865644368
      617200055749445448020002000A00074441544146494D010049000000020007
      53554254595045020049000A0046697865644368617200055749445448020002
      000A00084156414C54454F520100490000000200075355425459504502004900
      0A0046697865644368617200055749445448020002000A00084156414C505241
      5401004900000002000753554254595045020049000A00466978656443686172
      00055749445448020002000A000100044C4349440400010009080000}
  end
  object sqlListaAval: TCMSqlParams
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
        '234567890'#39' AS DESCRICAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS CARGO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS CENTROCUSTO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS LOCAL,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS FATOR,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS OBSERVACAO,'
      '  '#39'1234567890'#39' AS CARGAHORARIA,'
      '  '#39'1234567890'#39' AS MATRICULA,'
      '  '#39'1234567890'#39' AS DATAINI,'
      '  '#39'1234567890'#39' AS DATAFIM,'
      '  '#39'1234567890'#39' AS AVALTEOR,'
      '  '#39'1234567890'#39' AS AVALPRAT'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)'
      ''
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsListaAval
    Left = 215
    Top = 200
  end
end
