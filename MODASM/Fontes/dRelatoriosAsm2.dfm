inherited dtmRelatoriosAsm2: TdtmRelatoriosAsm2
  Left = 217
  Top = 226
  Width = 237
  Height = 124
  Caption = 'dtmRelatoriosAsm2'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 18
    Top = 39
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
    Left = 18
    Top = 29
  end
  inherited qryExemplo: TwwQuery
    Left = 18
  end
  inherited rpExemplo: TppReport
    Left = 18
    Top = 4
  end
  object rpOcorrPess: TppReport
    AutoStop = False
    DataPipeline = ppOcorrPess
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 98
    Top = 43
    Version = '5.5'
    mmColumnWidth = 197300
    object rpOcorrPessHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23813
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'rpOcorrPessLbl1'
        Caption = 'Relatório de Ocorrências Médicas por Pessoa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 58208
        mmTop = 9790
        mmWidth = 77258
        BandType = 0
      end
      object rpOcorrPessLbl2: TppLabel
        UserName = 'rpOcorrPessLbl2'
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
        mmLeft = 151077
        mmTop = 6085
        mmWidth = 9790
        BandType = 0
      end
      object rpOcorrPessLbl3: TppLabel
        UserName = 'rpOcorrPessLbl3'
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
        mmLeft = 145521
        mmTop = 10319
        mmWidth = 15346
        BandType = 0
      end
      object rpOcorrPessDBTxt1: TppDBText
        UserName = 'rpTabCIDDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppOcorrPess
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 87577
        mmTop = 2381
        mmWidth = 17198
        BandType = 0
      end
      object rpOcorrPessSysVar1: TppSystemVariable
        UserName = 'rpTabCIDCalc1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 6085
        mmWidth = 23283
        BandType = 0
      end
      object rpOcorrPessSysVar2: TppSystemVariable
        UserName = 'rpTabCIDCalc2'
        AutoSize = False
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 10319
        mmWidth = 23283
        BandType = 0
      end
      object rpOcorrPessLbl4: TppLabel
        UserName = 'rpOcorrPessLbl4'
        AutoSize = False
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 69586
        mmTop = 18521
        mmWidth = 15346
        BandType = 0
      end
      object rpOcorrPessLblDATAINI: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 85725
        mmTop = 18521
        mmWidth = 15875
        BandType = 0
      end
      object rpOcorrPessLbl5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 103188
        mmTop = 18521
        mmWidth = 7938
        BandType = 0
      end
      object rpOcorrPessLblDATAFINAL: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 112713
        mmTop = 18521
        mmWidth = 15875
        BandType = 0
      end
    end
    object rpOcorrPessDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object rpOcorrPessDBTxt6: TppDBText
        UserName = 'rpTabCIDDBTxt2'
        DataField = 'DESCRTIPOOCMED'
        DataPipeline = ppOcorrPess
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 529
        mmWidth = 39000
        BandType = 4
      end
      object rpOcorrPessDBTxt9: TppDBText
        UserName = 'rpTabCIDDBTxt3'
        DataField = 'AVALIACAO'
        DataPipeline = ppOcorrPess
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 151342
        mmTop = 529
        mmWidth = 10054
        BandType = 4
      end
      object rpOcorrPessDBTxt8: TppDBText
        UserName = 'DBText4'
        DataField = 'EXAMINADOR'
        DataPipeline = ppOcorrPess
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 79375
        mmTop = 529
        mmWidth = 59002
        BandType = 4
      end
      object rpOcorrPessDBTxt10: TppDBText
        UserName = 'DBText3'
        DataField = 'RESULTADO'
        DataPipeline = ppOcorrPess
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 179123
        mmTop = 529
        mmWidth = 15500
        BandType = 4
      end
      object rpOcorrPessDBTxt7: TppDBText
        UserName = 'DBText7'
        DataField = 'DATAREAL'
        DataPipeline = ppOcorrPess
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 61648
        mmTop = 529
        mmWidth = 16000
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DATAPLAN'
        DataPipeline = ppOcorrPess
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 42598
        mmTop = 529
        mmWidth = 16000
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CODCID'
        DataPipeline = ppOcorrPess
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 139700
        mmTop = 529
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText5'
        DataField = 'LICENCA'
        DataPipeline = ppOcorrPess
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 166159
        mmTop = 529
        mmWidth = 11113
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        UserName = 'Label13'
        Caption = 
          'Obs.: Dependendo do Tipo de Ocorrência, a "Data Planej." pode si' +
          'gnificar a "Data Início" e a "Data Real", neste caso, refere-se ' +
          'à "Data Retorno".'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 2381
        mmWidth = 179388
        BandType = 8
      end
    end
    object rpOcorrPessSmryBnd: TppSummaryBand
      AfterPrint = rpOcorrPessSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 2381
      mmPrintPosition = 0
    end
    object rpOcorrPessGrp1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppOcorrPess
      UserName = 'rpOcorrPessGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpOcorrPessGrpHdrBnd1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpOcorrPessGrpFootBnd1: TppGroupFooterBand
        BeforePrint = rpOcorrPessGrpFootBnd1BeforePrint
        mmBottomOffset = 0
        mmHeight = 13494
        mmPrintPosition = 0
        object rpOcorrPessLbl14: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Total de Pessoas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 10054
          mmTop = 4763
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
        end
        object rpOcorrPessLbl15: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Total de Ocorrências:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 71438
          mmTop = 4763
          mmWidth = 35190
          BandType = 5
          GroupNo = 0
        end
        object rpOcorrPessLbl16: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Total de Dias de Licença:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 133086
          mmTop = 5027
          mmWidth = 38100
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'rpTabPerDBCalc1'
          DataField = 'IDPESSOA'
          DataPipeline = ppOcorrPess
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpOcorrPessGrp1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 108744
          mmTop = 4763
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpOcorrPessLblNumPessoas: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 39952
          mmTop = 4763
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object rpOcorrPessdbCalcLicenca: TppDBCalc
          UserName = 'rpOcorrPessdbCalcLicenca'
          DataField = 'LICENCA'
          DataPipeline = ppOcorrPess
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpOcorrPessGrp1
          Transparent = True
          mmHeight = 3704
          mmLeft = 173567
          mmTop = 5027
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpOcorrPessLblAbsenteismo: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 173567
          mmTop = 9260
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label11'
          AutoSize = False
          Caption = 'Absenteísmo (%):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 143140
          mmTop = 9260
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpOcorrPessGrp2: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppOcorrPess
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpOcorrPessGrpHdrBnd2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 18521
        mmPrintPosition = 0
        object rpOcorrPessLbl6: TppLabel
          UserName = 'rpTabCIDLbl4'
          AutoSize = False
          Caption = 'Id. Pessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 2117
          mmWidth = 22754
          BandType = 3
          GroupNo = 1
        end
        object rpOcorrPessLbl7: TppLabel
          UserName = 'rpTabCIDLbl5'
          AutoSize = False
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 27252
          mmTop = 2117
          mmWidth = 85461
          BandType = 3
          GroupNo = 1
        end
        object rpOcorrPessLbl8: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Cargo Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 115623
          mmTop = 2117
          mmWidth = 65088
          BandType = 3
          GroupNo = 1
        end
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          Pen.Color = clSilver
          mmHeight = 6879
          mmLeft = 794
          mmTop = 6615
          mmWidth = 194205
          BandType = 3
          GroupNo = 1
        end
        object rpOcorrPessDBTxt3: TppDBText
          UserName = 'rpOcorrPessDBTxt3'
          DataField = 'MATRICULA'
          DataPipeline = ppOcorrPess
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 8202
          mmWidth = 22754
          BandType = 3
          GroupNo = 1
        end
        object rpOcorrPessDBTxt4: TppDBText
          UserName = 'rpOcorrPessDBTxt4'
          DataField = 'NOME'
          DataPipeline = ppOcorrPess
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 27252
          mmTop = 8202
          mmWidth = 85461
          BandType = 3
          GroupNo = 1
        end
        object rpOcorrPessDBTxt5: TppDBText
          UserName = 'rpOcorrPessDBTxt5'
          DataField = 'CARGO'
          DataPipeline = ppOcorrPess
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 115623
          mmTop = 8202
          mmWidth = 78317
          BandType = 3
          GroupNo = 1
        end
        object rpOcorrPessLbl9: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Tipo de Ocorrência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 14552
          mmWidth = 38894
          BandType = 3
          GroupNo = 1
        end
        object rpOcorrPessLbl10: TppLabel
          UserName = 'rpOcorrPessLbl10'
          AutoSize = False
          Caption = 'Data Real'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 60854
          mmTop = 14552
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
        object rpOcorrPessLbl11: TppLabel
          UserName = 'rpOcorrPessLbl11'
          AutoSize = False
          Caption = 'Examinador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 79640
          mmTop = 14552
          mmWidth = 59002
          BandType = 3
          GroupNo = 1
        end
        object rpOcorrPessLbl12: TppLabel
          UserName = 'Label101'
          AutoSize = False
          Caption = 'Avaliação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 150813
          mmTop = 14552
          mmWidth = 14000
          BandType = 3
          GroupNo = 1
        end
        object rpOcorrPessLbl13: TppLabel
          UserName = 'rpOcorrPessLbl13'
          AutoSize = False
          Caption = 'Resultado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 179123
          mmTop = 14552
          mmWidth = 15500
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'rpOcorrPessLbl101'
          AutoSize = False
          Caption = 'Data Planej.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 42069
          mmTop = 14552
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'rpOcorrPessLbl102'
          AutoSize = False
          Caption = 'CID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 139700
          mmTop = 14552
          mmWidth = 10054
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'Licença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 165629
          mmTop = 14552
          mmWidth = 12500
          BandType = 3
          GroupNo = 1
        end
      end
      object rpOcorrPessGrpFootBnd2: TppGroupFooterBand
        AfterPrint = rpOcorrPessGrpFootBnd2AfterPrint
        mmBottomOffset = 0
        mmHeight = 2381
        mmPrintPosition = 0
      end
    end
  end
  object ppOcorrPess: TppBDEPipeline
    DataSource = dsOcorrPess
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'OcorrPess'
    Left = 98
    Top = 30
    object ppOcorrPessppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 2
      DisplayWidth = 2
      Position = 0
    end
    object ppOcorrPessppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppOcorrPessppField3: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 2
    end
    object ppOcorrPessppField4: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppOcorrPessppField5: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 4
    end
    object ppOcorrPessppField6: TppField
      FieldAlias = 'DESCRTIPOOCMED'
      FieldName = 'DESCRTIPOOCMED'
      FieldLength = 40
      DisplayWidth = 40
      Position = 5
    end
    object ppOcorrPessppField7: TppField
      FieldAlias = 'DATAREAL'
      FieldName = 'DATAREAL'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object ppOcorrPessppField8: TppField
      FieldAlias = 'EXAMINADOR'
      FieldName = 'EXAMINADOR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object ppOcorrPessppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'LICENCA'
      FieldName = 'LICENCA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppOcorrPessppField10: TppField
      FieldAlias = 'DATAPLAN'
      FieldName = 'DATAPLAN'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 9
    end
    object ppOcorrPessppField11: TppField
      FieldAlias = 'CODCID'
      FieldName = 'CODCID'
      FieldLength = 7
      DisplayWidth = 7
      Position = 10
    end
    object ppOcorrPessppField12: TppField
      FieldAlias = 'AVALIACAO'
      FieldName = 'AVALIACAO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 11
    end
    object ppOcorrPessppField13: TppField
      FieldAlias = 'RESULTADO'
      FieldName = 'RESULTADO'
      FieldLength = 6
      DisplayWidth = 6
      Position = 12
    end
  end
  object dsOcorrPess: TwwDataSource
    DataSet = qryOcorrPess
    Left = 98
    Top = 16
  end
  object qryOcorrPess: TwwQuery
    BeforeOpen = qryOcorrPessBeforeOpen
    AfterOpen = qryOcorrPessAfterOpen
    AfterScroll = qryOcorrPessAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ('#39'CM'#39') AS EMPRESA,'
      '  F.IDPESSOA, F.MATRICULA, RTRIM(PF.NOME) AS NOME,'
      '  C.TITULO AS CARGO, TM.DESCRTIPOOCMED, HM.DATAREAL, '
      '  HM.EXAMINADOR, HM.LICENCA, HM.DATAPLAN, HM.CODCID,'
      '  DECODE(HM.AVALIACAO,NULL,'#39'N/A'#39',HM.AVALIACAO) AS AVALIACAO,'
      '  DECODE(HM.AVALIACAO,NULL,'#39'N/A'#39',DECODE(HM.AVALIACAO,'
      '    GREATEST(TM.AVALMIN,HM.AVALIACAO),'#39'Apt'#39','#39'Inapt'#39') ||'
      '    DECODE(PEFIS.SEXO,'#39'M'#39','#39'o'#39','#39'F'#39','#39'a'#39')) AS RESULTADO'
      'FROM'
      
        '  PESSOA PF, PESSOAFISICA PEFIS, FUNCIONARIO F, HSTASMED HM, TIP' +
        'OCMED TM, CARGO C'
      'WHERE'
      '  (PF.IDPESSOA     = -1) AND'
      
        '  (HM.DATAREAL BETWEEN TO_DATE('#39'22/05/2000'#39','#39'DD/MM/YYYY'#39') AND TO' +
        '_DATE('#39'22/05/2001'#39','#39'DD/MM/YYYY'#39')) AND'
      '  (PF.IDPESSOA     = F.IDPESSOA)      AND'
      '  (PF.IDPESSOA     = PEFIS.IDPESSOA)  AND'
      '  (PF.IDPESSOA     = HM.IDPESSOA)     AND'
      '  (HM.CODTIPOOCMED = TM.CODTIPOOCMED) AND'
      '  (F.IDCARGO       = C.IDCARGO(+))'
      'ORDER BY '
      '  NOME ')
    ValidateWithMask = True
    Left = 98
    Top = 3
  end
  object rpOcorrTipo: TppReport
    AutoStop = False
    DataPipeline = ppOcorrTipo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 172
    Top = 43
    Version = '5.5'
    mmColumnWidth = 197300
    object rpOcorrTipoHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23813
      mmPrintPosition = 0
      object rpOcorrTipoLbl1: TppLabel
        UserName = 'rpOcorrPessLbl1'
        Caption = 'Relatório de Ocorrências Médicas por Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 60590
        mmTop = 9790
        mmWidth = 72761
        BandType = 0
      end
      object rpOcorrTipoLbl2: TppLabel
        UserName = 'rpOcorrPessLbl2'
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
        mmLeft = 151077
        mmTop = 6085
        mmWidth = 9790
        BandType = 0
      end
      object rpOcorrTipoLbl3: TppLabel
        UserName = 'rpOcorrPessLbl3'
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
        mmLeft = 145521
        mmTop = 10319
        mmWidth = 15346
        BandType = 0
      end
      object rpOcorrTipoDBTxt1: TppDBText
        UserName = 'rpTabCIDDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppOcorrTipo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 87577
        mmTop = 2381
        mmWidth = 17198
        BandType = 0
      end
      object rpOcorrTipoSysVar1: TppSystemVariable
        UserName = 'rpTabCIDCalc1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 6085
        mmWidth = 23283
        BandType = 0
      end
      object rpOcorrTipoSysVar2: TppSystemVariable
        UserName = 'rpTabCIDCalc2'
        AutoSize = False
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 10319
        mmWidth = 23283
        BandType = 0
      end
      object rpOcorrTipoLbl4: TppLabel
        UserName = 'rpOcorrPessLbl4'
        AutoSize = False
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 69586
        mmTop = 18521
        mmWidth = 15346
        BandType = 0
      end
      object rpOcorrTipoLblDATAINI: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 85725
        mmTop = 18521
        mmWidth = 15875
        BandType = 0
      end
      object rpOcorrTipoLbl5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 103188
        mmTop = 18521
        mmWidth = 7938
        BandType = 0
      end
      object rpOcorrTipoLblDATAFINAL: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 112713
        mmTop = 18521
        mmWidth = 15875
        BandType = 0
      end
    end
    object rpOcorrTipoDtlBnd: TppDetailBand
      AfterPrint = rpOcorrTipoDtlBndAfterPrint
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object rpOcorrTipoDBTxt3: TppDBText
        UserName = 'rpOcorrPessDBTxt2'
        DataField = 'NOME'
        DataPipeline = ppOcorrTipo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1000
        mmTop = 794
        mmWidth = 60000
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText1'
        DataField = 'AVALIACAO'
        DataPipeline = ppOcorrTipo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 151342
        mmTop = 794
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText2'
        DataField = 'EXAMINADOR'
        DataPipeline = ppOcorrTipo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 99484
        mmTop = 794
        mmWidth = 38894
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'RESULTADO'
        DataPipeline = ppOcorrTipo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 179123
        mmTop = 794
        mmWidth = 15500
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText3'
        DataField = 'DATAREAL'
        DataPipeline = ppOcorrTipo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 81756
        mmTop = 794
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'DATAPLAN'
        DataPipeline = ppOcorrTipo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 62706
        mmTop = 794
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'CODCID'
        DataPipeline = ppOcorrTipo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 139700
        mmTop = 794
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'LICENCA'
        DataPipeline = ppOcorrTipo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 166159
        mmTop = 794
        mmWidth = 11113
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 
          'Obs.: Dependendo do Tipo de Ocorrência, a "Data Planej." pode si' +
          'gnificar a "Data Início" e a "Data Real", neste caso, refere-se ' +
          'à "Data Retorno".'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 2381
        mmWidth = 179388
        BandType = 8
      end
    end
    object rpOcorrTipoSmryBnd: TppSummaryBand
      AfterPrint = rpOcorrTipoSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
    end
    object rpOcorrTipoGrp1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppOcorrTipo
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpOcorrTipoGrpHdrBnd1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpOcorrTipoGrpFootBnd1: TppGroupFooterBand
        BeforePrint = rpOcorrTipoGrpFootBnd1BeforePrint
        mmBottomOffset = 0
        mmHeight = 14552
        mmPrintPosition = 0
        object rpOcorrTipoLbl13: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Total de Tipos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 10054
          mmTop = 5027
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
        end
        object rpOcorrTipoLbl14: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Total de Pessoas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 71438
          mmTop = 5027
          mmWidth = 35190
          BandType = 5
          GroupNo = 0
        end
        object rpOcorrTipoLbl15: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Total de Dias de Licença:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 133086
          mmTop = 5027
          mmWidth = 38100
          BandType = 5
          GroupNo = 0
        end
        object rpOcorrTipoLblNumTipos: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 39952
          mmTop = 5027
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object rpOcorrTipodbCalcLicenca: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'LICENCA'
          DataPipeline = ppOcorrTipo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpOcorrTipoGrp1
          Transparent = True
          mmHeight = 3704
          mmLeft = 173567
          mmTop = 5027
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpOcorrTipoLine2: TppLine
          UserName = 'rpOcorrTipoLine2'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 10054
          mmTop = 0
          mmWidth = 178594
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'NOME'
          DataPipeline = ppOcorrTipo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpOcorrTipoGrp1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3440
          mmLeft = 107686
          mmTop = 5027
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Absenteísmo (%):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 143140
          mmTop = 9790
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
        end
        object rpOcorrTipoLblAbsenteismo: TppLabel
          UserName = 'Label102'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 173567
          mmTop = 9790
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpOcorrTipoGrp2: TppGroup
      BreakName = 'DESCRTIPOOCMED'
      DataPipeline = ppOcorrTipo
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpOcorrTipoGrpHdrBnd2: TppGroupHeaderBand
        BeforePrint = rpOcorrTipoGrpHdrBnd2BeforePrint
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
        object rpOcorrTipoLbl6: TppLabel
          UserName = 'rpTabCIDLbl4'
          AutoSize = False
          Caption = 'Tipo / Pessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1000
          mmTop = 1852
          mmWidth = 22754
          BandType = 3
          GroupNo = 1
        end
        object rpOcorrTipoDBTxt2: TppDBText
          UserName = 'rpTabCIDDBTxt2'
          DataField = 'DESCRTIPOOCMED'
          DataPipeline = ppOcorrTipo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 1000
          mmTop = 6879
          mmWidth = 60000
          BandType = 3
          GroupNo = 1
        end
        object rpOcorrTipoLine1: TppLine
          UserName = 'Line1'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 10054
          mmTop = 0
          mmWidth = 178594
          BandType = 3
          GroupNo = 1
        end
        object ppLabel8: TppLabel
          UserName = 'rpOcorrPessLbl103'
          AutoSize = False
          Caption = 'Data Real'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 80963
          mmTop = 7144
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Examinador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 99748
          mmTop = 7144
          mmWidth = 38894
          BandType = 3
          GroupNo = 1
        end
        object ppLabel10: TppLabel
          UserName = 'Label103'
          AutoSize = False
          Caption = 'Avaliação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 150813
          mmTop = 7144
          mmWidth = 14000
          BandType = 3
          GroupNo = 1
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          AutoSize = False
          Caption = 'Resultado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 179123
          mmTop = 7144
          mmWidth = 15500
          BandType = 3
          GroupNo = 1
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'Data Planej.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 7144
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          AutoSize = False
          Caption = 'CID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 139700
          mmTop = 7144
          mmWidth = 10054
          BandType = 3
          GroupNo = 1
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          AutoSize = False
          Caption = 'Licença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 165629
          mmTop = 7144
          mmWidth = 12500
          BandType = 3
          GroupNo = 1
        end
      end
      object rpOcorrTipoGrpFootBnd2: TppGroupFooterBand
        AfterPrint = rpOcorrTipoGrpFootBnd2AfterPrint
        BeforePrint = rpOcorrTipoGrpFootBnd2BeforePrint
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object rpOcorrTipoLbl11: TppLabel
          UserName = 'rpTabCIDLbl5'
          AutoSize = False
          Caption = 'Total do Tipo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 44979
          mmTop = 2646
          mmWidth = 21696
          BandType = 5
          GroupNo = 1
        end
        object rpOcorrTipoLbl12: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Avaliação Média:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 100806
          mmTop = 2646
          mmWidth = 25929
          BandType = 5
          GroupNo = 1
        end
        object rpOcorrTipoDBCalc1: TppDBCalc
          UserName = 'rpOcorrTipoDBCalc1'
          DataField = 'DESCRTIPOOCMED'
          DataPipeline = ppOcorrTipo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpOcorrTipoGrp2
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 68527
          mmTop = 2646
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object rpOcorrTipoLblAvalMedia: TppLabel
          UserName = 'rpOcorrTipoLblAvalMedia'
          AutoSize = False
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 128588
          mmTop = 2646
          mmWidth = 19844
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object ppOcorrTipo: TppBDEPipeline
    DataSource = dsOcorrTipo
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'OcorrPess1'
    Left = 172
    Top = 30
    object ppOcorrTipoppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppOcorrTipoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppOcorrTipoppField3: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 2
    end
    object ppOcorrTipoppField4: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppOcorrTipoppField5: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 4
    end
    object ppOcorrTipoppField6: TppField
      FieldAlias = 'DESCRTIPOOCMED'
      FieldName = 'DESCRTIPOOCMED'
      FieldLength = 40
      DisplayWidth = 40
      Position = 5
    end
    object ppOcorrTipoppField7: TppField
      FieldAlias = 'DATAREAL'
      FieldName = 'DATAREAL'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object ppOcorrTipoppField8: TppField
      FieldAlias = 'EXAMINADOR'
      FieldName = 'EXAMINADOR'
      FieldLength = 40
      DisplayWidth = 40
      Position = 7
    end
    object ppOcorrTipoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'LICENCA'
      FieldName = 'LICENCA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppOcorrTipoppField10: TppField
      FieldAlias = 'AVALIACAO'
      FieldName = 'AVALIACAO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 9
    end
    object ppOcorrTipoppField11: TppField
      FieldAlias = 'RESULTADO'
      FieldName = 'RESULTADO'
      FieldLength = 6
      DisplayWidth = 6
      Position = 10
    end
  end
  object dsOcorrTipo: TwwDataSource
    DataSet = qryOcorrTipo
    Left = 172
    Top = 16
  end
  object qryOcorrTipo: TwwQuery
    BeforeOpen = qryOcorrTipoBeforeOpen
    AfterOpen = qryOcorrTipoAfterOpen
    AfterScroll = qryOcorrTipoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ('#39'CM'#39') AS EMPRESA,'
      '  F.IDPESSOA, F.MATRICULA, RTRIM(PF.NOME) AS NOME,'
      '  C.TITULO AS CARGO, TM.DESCRTIPOOCMED, HM.DATAREAL, '
      '  HM.EXAMINADOR, HM.LICENCA, HM.DATAPLAN, HM.CODCID,'
      '  DECODE(HM.AVALIACAO,NULL,'#39'N/A'#39',HM.AVALIACAO) AS AVALIACAO,'
      '  DECODE(HM.AVALIACAO,NULL,'#39'N/A'#39',DECODE(HM.AVALIACAO,'
      '    GREATEST(TM.AVALMIN,HM.AVALIACAO),'#39'Apt'#39','#39'Inapt'#39') ||'
      '    DECODE(PEFIS.SEXO,'#39'M'#39','#39'o'#39','#39'F'#39','#39'a'#39')) AS RESULTADO'
      'FROM'
      
        '  PESSOA PF, PESSOAFISICA PEFIS, FUNCIONARIO F, HSTASMED HM, TIP' +
        'OCMED TM, CARGO C'
      'WHERE'
      '  (PF.IDPESSOA     = -1) AND'
      
        '  (HM.DATAREAL BETWEEN TO_DATE('#39'22/05/2000'#39','#39'DD/MM/YYYY'#39') AND TO' +
        '_DATE('#39'22/05/2001'#39','#39'DD/MM/YYYY'#39')) AND'
      '  (PF.IDPESSOA     = F.IDPESSOA)      AND'
      '  (PF.IDPESSOA     = PEFIS.IDPESSOA)  AND'
      '  (PF.IDPESSOA     = HM.IDPESSOA)     AND'
      '  (HM.CODTIPOOCMED = TM.CODTIPOOCMED) AND'
      '  (F.IDCARGO       = C.IDCARGO(+))'
      'ORDER BY '
      '  NOME ')
    ValidateWithMask = True
    Left = 172
    Top = 3
  end
end
