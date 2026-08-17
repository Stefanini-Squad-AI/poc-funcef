inherited dtmRelProtocolo: TdtmRelProtocolo
  Left = 24
  Top = 318
  Width = 244
  Height = 167
  Caption = 'dtmRelProtocolo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 32
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
    Left = 32
    Top = 68
  end
  inherited qryExemplo: TwwQuery
    Left = 32
    Top = 80
  end
  inherited rpExemplo: TppReport
    Left = 32
    Top = 8
  end
  object pplProtocolo: TppBDEPipeline
    DataSource = dsProtocolo
    UserName = 'lExemplo1'
    Left = 136
    Top = 56
  end
  object dsProtocolo: TwwDataSource
    DataSet = qryProtocolo
    Left = 136
    Top = 68
  end
  object rptProtocolo: TppReport
    AutoStop = False
    DataPipeline = pplProtocolo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Protocolo de Solicitação de Empréstimo'
    PrinterSetup.PaperName = 'A4 (210 x 297 mm) '
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13229
    PrinterSetup.mmMarginLeft = 6615
    PrinterSetup.mmMarginRight = 6615
    PrinterSetup.mmMarginTop = 13229
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 136
    Top = 8
    Version = '5.5'
    mmColumnWidth = 183542
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25665
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Protocolo de Solicitação de Empréstimos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 7144
        mmTop = 7673
        mmWidth = 182563
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 7144
        mmTop = 794
        mmWidth = 182563
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 178330
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        ParentWidth = True
        Shape = stRoundRect
        mmHeight = 20108
        mmLeft = 0
        mmTop = 28575
        mmWidth = 196770
        BandType = 4
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentWidth = True
        Shape = stRoundRect
        mmHeight = 20108
        mmLeft = 0
        mmTop = 2646
        mmWidth = 196770
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NOME'
        DataPipeline = pplProtocolo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 6085
        mmWidth = 123561
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = '  Identificação do Participante   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 794
        mmWidth = 45773
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Matrícula:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 133350
        mmTop = 6085
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataPipeline = pplProtocolo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 151342
        mmTop = 6085
        mmWidth = 22490
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Classe:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 133350
        mmTop = 11377
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataPipeline = pplProtocolo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 151607
        mmTop = 11377
        mmWidth = 22490
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 
          'OBSERVAÇÕES: Para os devidos fins, declaro que tomei conheciment' +
          'o dos encargos e dos cálculos acima, que caracterizam'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        mmHeight = 4498
        mmLeft = 0
        mmTop = 103981
        mmWidth = 196850
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 
          'o empréstimo concedido, estando e acordo com os referidos valore' +
          's para os fins a que se dispõe o contrato.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 108215
        mmWidth = 196850
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Banco:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 17198
        mmWidth = 13758
        BandType = 4
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Agência:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 41275
        mmTop = 17198
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataPipeline = pplProtocolo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 19844
        mmTop = 17198
        mmWidth = 13229
        BandType = 4
      end
      object ppLabel13: TppLabel
        UserName = 'Label102'
        Caption = 'C/C:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 78846
        mmTop = 17198
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataPipeline = pplProtocolo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 57415
        mmTop = 17198
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataPipeline = pplProtocolo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 88106
        mmTop = 17198
        mmWidth = 13229
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = '  Identificação da Proposta   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 26723
        mmWidth = 41010
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Modalidade:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 32015
        mmWidth = 21696
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Data Assinatura:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 37306
        mmWidth = 28310
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Nº Contrato:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 42598
        mmWidth = 21696
        BandType = 4
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Nº Parcelas:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 78846
        mmTop = 32015
        mmWidth = 21431
        BandType = 4
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Data Crédito:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 78846
        mmTop = 37306
        mmWidth = 23019
        BandType = 4
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        ParentWidth = True
        Shape = stRoundRect
        mmHeight = 14817
        mmLeft = 0
        mmTop = 54504
        mmWidth = 196770
        BandType = 4
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = '  Encargos do Contrato Pós-Fixado   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 52652
        mmWidth = 52917
        BandType = 4
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Quota de Quitação p/ Morte:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 57944
        mmWidth = 46302
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Taxa de Administração:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 63236
        mmWidth = 39158
        BandType = 4
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Índice de Correção:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 102394
        mmTop = 57944
        mmWidth = 32808
        BandType = 4
      end
      object ppLabel24: TppLabel
        UserName = 'Label201'
        Caption = 'Taxa de Juros:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 102394
        mmTop = 63236
        mmWidth = 25400
        BandType = 4
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'CDI - Mês Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 134938
        mmTop = 57944
        mmWidth = 26723
        BandType = 4
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = '% a.m. na concessão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 143140
        mmTop = 63236
        mmWidth = 30956
        BandType = 4
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        ParentWidth = True
        Shape = stRoundRect
        mmHeight = 23813
        mmLeft = 0
        mmTop = 75142
        mmWidth = 196770
        BandType = 4
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = '  Valores do Empréstimo Concedido   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 73290
        mmWidth = 54769
        BandType = 4
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Valor Solicitado:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 78581
        mmWidth = 28310
        BandType = 4
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'R$ '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 52123
        mmTop = 78581
        mmWidth = 5027
        BandType = 4
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'R$ '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 52123
        mmTop = 83344
        mmWidth = 5027
        BandType = 4
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = '0,46% na concessão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 52388
        mmTop = 57944
        mmWidth = 29898
        BandType = 4
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = '2,50% na concessão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 52388
        mmTop = 63236
        mmWidth = 29898
        BandType = 4
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'Quota de Quitação p/ Morte:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 6085
        mmTop = 83344
        mmWidth = 46302
        BandType = 4
      end
      object ppLabel37: TppLabel
        UserName = 'Label203'
        Caption = 'Taxa de Administração:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 6085
        mmTop = 88106
        mmWidth = 39158
        BandType = 4
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'I.O.F.:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 6085
        mmTop = 92869
        mmWidth = 12171
        BandType = 4
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'Valor do Crédito:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 102394
        mmTop = 78581
        mmWidth = 28840
        BandType = 4
      end
      object ppLabel33: TppLabel
        UserName = 'Label301'
        Caption = 'R$ '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 130969
        mmTop = 78581
        mmWidth = 5027
        BandType = 4
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'R$ '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 130969
        mmTop = 83344
        mmWidth = 5027
        BandType = 4
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'Valor da Parcela:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 102129
        mmTop = 83344
        mmWidth = 28840
        BandType = 4
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = 'Data da 1ª Parcela:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 102129
        mmTop = 92869
        mmWidth = 31750
        BandType = 4
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Caption = 'R$ '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 52123
        mmTop = 92869
        mmWidth = 5027
        BandType = 4
      end
      object ppLabel40: TppLabel
        UserName = 'Label302'
        Caption = 'R$ '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 52123
        mmTop = 88106
        mmWidth = 5027
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 118534
        mmWidth = 196770
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 794
        mmLeft = 124619
        mmTop = 139171
        mmWidth = 63765
        BandType = 4
      end
      object ppLabel41: TppLabel
        UserName = 'Label5'
        Caption = 'Devedor / Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 138907
        mmTop = 140494
        mmWidth = 35190
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 794
        mmLeft = 124619
        mmTop = 158750
        mmWidth = 63765
        BandType = 4
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = 'Credora / FCRT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 143934
        mmTop = 160073
        mmWidth = 25135
        BandType = 4
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 108744
        mmTop = 160073
        mmWidth = 7408
        BandType = 4
      end
      object ppLabel45: TppLabel
        UserName = 'Label7'
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 103717
        mmTop = 155311
        mmWidth = 17727
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 794
        mmLeft = 24871
        mmTop = 158750
        mmWidth = 63765
        BandType = 4
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Caption = 'Setor Tesouraria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 43392
        mmTop = 160073
        mmWidth = 26458
        BandType = 4
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 8996
        mmTop = 160073
        mmWidth = 7408
        BandType = 4
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 4233
        mmTop = 155311
        mmWidth = 17727
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 9525
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 196770
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 3175
        mmWidth = 23019
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
        mmLeft = 50800
        mmTop = 3175
        mmWidth = 94986
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
        mmHeight = 3175
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 25400
        BandType = 8
      end
    end
  end
  object qryProtocolo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   VWCONTRATOEP CON'
      'WHERE'
      '       ( CON.IDCONTRATOEMPTMO = 50610 )')
    ValidateWithMask = True
    Left = 136
    Top = 80
    object qryProtocoloIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDCONTRATOEMPTMO'
    end
    object qryProtocoloIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDINSCRICAOEMPTMO'
    end
    object qryProtocoloIDCONTRQUITACAO: TFloatField
      FieldName = 'IDCONTRQUITACAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDCONTRQUITACAO'
    end
    object qryProtocoloIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDTIPOCONTREMPTMO'
    end
    object qryProtocoloIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDPATRO'
    end
    object qryProtocoloIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDPLANOPREV'
    end
    object qryProtocoloIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDPESSOA'
    end
    object qryProtocoloIDBENEF: TFloatField
      FieldName = 'IDBENEF'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDBENEF'
    end
    object qryProtocoloIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDCBANCARIA'
    end
    object qryProtocoloIDVERBA: TFloatField
      FieldName = 'IDVERBA'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDVERBA'
    end
    object qryProtocoloFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryProtocoloFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      Origin = 'BASEDADOS.VWCONTRATOEP.FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryProtocoloPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
      Origin = 'BASEDADOS.VWCONTRATOEP.PORTFORMAREC'
    end
    object qryProtocoloFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      Origin = 'BASEDADOS.VWCONTRATOEP.FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryProtocoloCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
      Origin = 'BASEDADOS.VWCONTRATOEP.CODFORMAPAG'
    end
    object qryProtocoloPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
      Origin = 'BASEDADOS.VWCONTRATOEP.PORTFORMAPAG'
    end
    object qryProtocoloDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
      Origin = 'BASEDADOS.VWCONTRATOEP.DATAASSINATURA'
    end
    object qryProtocoloDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
      Origin = 'BASEDADOS.VWCONTRATOEP.DATACREDITO'
    end
    object qryProtocoloDATAPRIMPARC: TDateTimeField
      FieldName = 'DATAPRIMPARC'
      Origin = 'BASEDADOS.VWCONTRATOEP.DATAPRIMPARC'
    end
    object qryProtocoloDATACANC: TDateTimeField
      FieldName = 'DATACANC'
      Origin = 'BASEDADOS.VWCONTRATOEP.DATACANC'
    end
    object qryProtocoloDATASITUACAO: TDateTimeField
      FieldName = 'DATASITUACAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.DATASITUACAO'
    end
    object qryProtocoloPRAZO: TFloatField
      FieldName = 'PRAZO'
      Origin = 'BASEDADOS.VWCONTRATOEP.PRAZO'
    end
    object qryProtocoloVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
      Origin = 'BASEDADOS.VWCONTRATOEP.VLRCONTRATO'
    end
    object qryProtocoloVLRPARCELA: TFloatField
      FieldName = 'VLRPARCELA'
      Origin = 'BASEDADOS.VWCONTRATOEP.VLRPARCELA'
    end
    object qryProtocoloTXJUROS: TFloatField
      FieldName = 'TXJUROS'
      Origin = 'BASEDADOS.VWCONTRATOEP.TXJUROS'
    end
    object qryProtocoloANOSUSPENSAO: TFloatField
      FieldName = 'ANOSUSPENSAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.ANOSUSPENSAO'
    end
    object qryProtocoloMESSUSPENSAO: TFloatField
      FieldName = 'MESSUSPENSAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.MESSUSPENSAO'
    end
    object qryProtocoloTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.TCEDESCRICAO'
      Size = 60
    end
    object qryProtocoloIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
      Origin = 'BASEDADOS.VWCONTRATOEP.DESCTIPOEMPTMO'
    end
    object qryProtocoloDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDEMPRESAPROP'
      Size = 60
    end
    object qryProtocoloIDEMPRESAPROP: TFloatField
      FieldName = 'IDEMPRESAPROP'
      Origin = 'BASEDADOS.VWCONTRATOEP.MATRICULA'
    end
    object qryProtocoloMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'BASEDADOS.VWCONTRATOEP.INSCRICAONUMERO'
      Size = 13
    end
    object qryProtocoloINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
      Origin = 'BASEDADOS.VWCONTRATOEP.SALPARTICIPACAO'
    end
    object qryProtocoloSALPARTICIPACAO: TFloatField
      FieldName = 'SALPARTICIPACAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.SALMANTIDO'
    end
    object qryProtocoloSALMANTIDO: TFloatField
      FieldName = 'SALMANTIDO'
      Origin = 'BASEDADOS.VWCONTRATOEP.SALAUXDOENCA'
    end
    object qryProtocoloSALAUXDOENCA: TFloatField
      FieldName = 'SALAUXDOENCA'
      Origin = 'BASEDADOS.VWCONTRATOEP.SITDESCRICAO'
    end
    object qryProtocoloSITDESCRICAO: TStringField
      FieldName = 'SITDESCRICAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.FLGINTERNO'
      Size = 50
    end
    object qryProtocoloFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      Origin = 'BASEDADOS.VWCONTRATOEP.NOME'
      FixedChar = True
      Size = 2
    end
    object qryProtocoloNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
      Size = 60
    end
    object qryProtocoloNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'BASEDADOS.VWCONTRATOEP.NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
  end
end
