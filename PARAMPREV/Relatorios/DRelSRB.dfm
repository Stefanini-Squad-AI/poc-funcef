inherited dtmRelSRB: TdtmRelSRB
  Left = 136
  Top = 76
  Width = 523
  Height = 451
  Caption = 'dtmRelSRB'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 192
    Top = 10
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
    Left = 107
    Top = 31
  end
  inherited qryExemplo: TwwQuery
    Left = 23
    Top = 10
  end
  inherited rpExemplo: TppReport
    Left = 260
    Top = 4
  end
  object ppBdeSRB: TppBDEPipeline
    DataSource = dsSRB
    UserName = 'lExemplo1'
    Left = 191
    Top = 67
    object ppBdeSRBppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppBdeSRBppField2: TppField
      FieldAlias = 'DATAADMISSAO'
      FieldName = 'DATAADMISSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object ppBdeSRBppField3: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 2
    end
    object ppBdeSRBppField4: TppField
      FieldAlias = 'INSCRICAODATA'
      FieldName = 'INSCRICAODATA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object ppBdeSRBppField5: TppField
      FieldAlias = 'PARTICIPANTE'
      FieldName = 'PARTICIPANTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object ppBdeSRBppField6: TppField
      FieldAlias = 'DATANASC'
      FieldName = 'DATANASC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object ppBdeSRBppField7: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppBdeSRBppField8: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object ppBdeSRBppField9: TppField
      FieldAlias = 'NOMEBENEFICIO'
      FieldName = 'NOMEBENEFICIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object ppBdeSRBppField10: TppField
      FieldAlias = 'DATAREF'
      FieldName = 'DATAREF'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 9
    end
  end
  object dsSRB: TwwDataSource
    DataSet = QrySRB
    Left = 118
    Top = 83
  end
  object QrySRB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ELG.IDPESSJUR, ELG.DATAADMISSAO, ELG.MATRICULA,'
      '  PTP.INSCRICAODATA,'
      '  PES.NOME AS PARTICIPANTE,'
      '  PSF.DATANASC,'
      '  PPV.NOME AS PLANO,'
      '  PAT.NOME AS PATROCINADORA,'
      '  BNF.NOME AS NOMEBENEFICIO,'
      '  CALC.DATAREF '
      'FROM'
      '  PESSOA PES, PESSOAFISICA PSF, ELEGPATRO ELG, PARTPREVPLAN PTP,'
      
        '  PLANPREVPATRO PPP, PLANPREV PPV, PESSOA PAT, BENEFPLANPREV BPP' +
        ','
      '  BENEFICIO BNF, CALCULO CALC'
      'WHERE PES.IDPESSOA       = :IDPESSOA'
      'AND   BPP.IDBENEFICIO(+) = :IDBENEFICIO'
      'AND   BPP.IDPLANOPREV(+) = PPV.IDPLANOPREV'
      'AND   BNF.IDBENEFICIO(+) = BPP.IDBENEFICIO'
      'AND   PES.IDPESSOA       = PSF.IDPESSOA'
      'AND   ELG.IDPESSJUR      = ELG.IDPESSJUR'
      'AND   PES.IDPESSOA       = ELG.IDPESSOA'
      'AND   ELG.IDPESSJUR      = PTP.IDPESSJUR'
      'AND   ELG.IDPESSOA       = PTP.IDPESSOA'
      'AND   PTP.IDPESSJUR      = PPP.IDPESSJUR'
      'AND   PTP.IDPLANOPREV    = PPP.IDPLANOPREV'
      'AND   PPP.IDPLANOPREV    = PPV.IDPLANOPREV'
      'AND   PTP.IDPESSJUR      = PAT.IDPESSOA'
      'AND   CALC.IDPESSOA      = :IDPESSOA'
      'AND   CALC.IDCALCULO     = :IDCALCULO'
      'AND   PTP.IDPLANOPREV    = CALC.IDPLANOPREV '
      'AND   PTP.IDPESSOA       = CALC.IDPESSOA '
      'ORDER BY  PPV.IDPLANOPREV'
      ' '
      ''
      ' ')
    ValidateWithMask = True
    Left = 23
    Top = 67
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '3911'
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
        Value = '-1'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCALCULO'
        ParamType = ptUnknown
      end>
  end
  object ppSRB: TppReport
    AutoStop = False
    DataPipeline = ppBdeSRB
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 (210 x 297 mm) '
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 7620
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 254
    Top = 70
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 70115
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        Shape = stRoundRect
        mmHeight = 8467
        mmLeft = 0
        mmTop = 29633
        mmWidth = 268816
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label11'
        Caption = 'Calculo do SRB - Parcela "A"'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 116417
        mmTop = 31221
        mmWidth = 59002
        BandType = 0
      end
      object rpResumoCobrDBImage1: TppDBImage
        UserName = 'rpResumoCobrDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object rpResumoCobrDBText1: TppDBText
        UserName = 'rpResumoCobrDBText1'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1323
        mmWidth = 133615
        BandType = 0
      end
      object rpResumoCobrDBText2: TppDBText
        UserName = 'rpResumoCobrDBText2'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object rpResumoCobrDBText3: TppDBText
        UserName = 'rpResumoCobrDBText3'
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 12965
        mmWidth = 69586
        BandType = 0
      end
      object rpResumoCobrDBText10: TppDBText
        UserName = 'rpResumoCobrDBText10'
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 113242
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
      end
      object rpResumoCobrDBText11: TppDBText
        UserName = 'rpResumoCobrDBText11'
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 17463
        mmWidth = 20108
        BandType = 0
      end
      object rpResumoCobrDBText12: TppDBText
        UserName = 'rpResumoCobrDBText12'
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 64029
        mmTop = 17463
        mmWidth = 48419
        BandType = 0
      end
      object rpResumoCobrDBText13: TppDBText
        UserName = 'rpResumoCobrDBText13'
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 112977
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object rpResumoCobrDBText14: TppDBText
        UserName = 'rpResumoCobrDBText14'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 50800
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
      object rpResumoCobrLabel10: TppLabel
        UserName = 'rpResumoCobrLabel10'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 21960
        mmWidth = 5027
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Shape = stRoundRect
        mmHeight = 28310
        mmLeft = 0
        mmTop = 39423
        mmWidth = 268817
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText1'
        DataField = 'NOMEBENEFICIO'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 9525
        mmLeft = 187061
        mmTop = 53975
        mmWidth = 63236
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label1'
        Caption = 'Empresa '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2910
        mmTop = 49742
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText2'
        DataField = 'PATROCINADORA'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 54240
        mmWidth = 91547
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label2'
        Caption = 'Plano '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2910
        mmTop = 58738
        mmWidth = 10848
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText3'
        DataField = 'PLANO'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 63236
        mmWidth = 91547
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2910
        mmTop = 40746
        mmWidth = 9790
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'PARTICIPANTE'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 45244
        mmWidth = 91547
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Matricula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 187061
        mmTop = 40481
        mmWidth = 15610
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'MATRICULA'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 187061
        mmTop = 44979
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Espécie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 187061
        mmTop = 49477
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Nascimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 99748
        mmTop = 40746
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'DATANASC'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 99748
        mmTop = 45244
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Admissão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 99748
        mmTop = 49742
        mmWidth = 16933
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'DATAADMISSAO'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 99748
        mmTop = 54240
        mmWidth = 28310
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 99748
        mmTop = 58738
        mmWidth = 15610
        BandType = 0
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        AutoSize = True
        DataField = 'INSCRICAODATA'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 99748
        mmTop = 63236
        mmWidth = 29104
        BandType = 0
      end
      object ppLabel96: TppLabel
        UserName = 'Label96'
        Caption = 'Data Ref.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 214048
        mmTop = 40481
        mmWidth = 16404
        BandType = 0
      end
      object ppDBText73: TppDBText
        UserName = 'DBText702'
        AutoSize = True
        DataField = 'DATAREF'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 214048
        mmTop = 44979
        mmWidth = 16669
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 265
        mmWidth = 283030
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppBdeSRBAux
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4 (210 x 297 mm) '
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 7620
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 136
          Top = 200
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 9525
            mmPrintPosition = 0
            object ppShape4: TppShape
              UserName = 'Shape4'
              ParentHeight = True
              Shape = stRoundRect
              mmHeight = 9525
              mmLeft = 0
              mmTop = 0
              mmWidth = 268817
              BandType = 1
            end
            object ppLabel29: TppLabel
              UserName = 'Label29'
              Caption = 'DATA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 1058
              mmTop = 529
              mmWidth = 6879
              BandType = 1
            end
            object ppLabel30: TppLabel
              UserName = 'Label30'
              AutoSize = False
              Caption = 'SALÁRIO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 16140
              mmTop = 529
              mmWidth = 13229
              BandType = 1
            end
            object ppLabel31: TppLabel
              UserName = 'Label301'
              AutoSize = False
              Caption = 'ANUÊNIO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 31221
              mmTop = 529
              mmWidth = 12965
              BandType = 1
            end
            object ppLabel32: TppLabel
              UserName = 'Label302'
              AutoSize = False
              Caption = 'GRAT.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 60854
              mmTop = 529
              mmWidth = 9525
              BandType = 1
            end
            object ppLabel33: TppLabel
              UserName = 'Label303'
              AutoSize = False
              Caption = 'HORA EXTRA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 71438
              mmTop = 529
              mmWidth = 18521
              BandType = 1
            end
            object ppLabel34: TppLabel
              UserName = 'Label304'
              AutoSize = False
              Caption = 'GDV /'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 147638
              mmTop = 529
              mmWidth = 10054
              BandType = 1
            end
            object ppLabel35: TppLabel
              UserName = 'Label35'
              AutoSize = False
              Caption = 'VALOR'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 174625
              mmTop = 529
              mmWidth = 10848
              BandType = 1
            end
            object ppLabel36: TppLabel
              UserName = 'Label36'
              AutoSize = False
              Caption = 'VALOR'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 187855
              mmTop = 529
              mmWidth = 10848
              BandType = 1
            end
            object ppLabel38: TppLabel
              UserName = 'Label38'
              AutoSize = False
              Caption = 'DIFERENÇAS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 126471
              mmTop = 529
              mmWidth = 18785
              BandType = 1
            end
            object ppLabel1: TppLabel
              UserName = 'Label1'
              AutoSize = False
              Caption = 'FÉRIAS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 45773
              mmTop = 529
              mmWidth = 11113
              BandType = 1
            end
            object ppLabel2: TppLabel
              UserName = 'Label2'
              AutoSize = False
              Caption = 'PERICULOS.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 91281
              mmTop = 529
              mmWidth = 19050
              BandType = 1
            end
            object ppLabel3: TppLabel
              UserName = 'Label3'
              Caption = 'PROMOÇÃO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 111919
              mmTop = 529
              mmWidth = 13494
              BandType = 1
            end
            object ppLabel4: TppLabel
              UserName = 'Label4'
              AutoSize = False
              Caption = 'FUNÇÃO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 158750
              mmTop = 529
              mmWidth = 13494
              BandType = 1
            end
            object ppLabel7: TppLabel
              UserName = 'Label7'
              AutoSize = False
              Caption = 'FÉRIAS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 59002
              mmTop = 4233
              mmWidth = 11377
              BandType = 1
            end
            object ppLabel8: TppLabel
              UserName = 'Label8'
              Caption = 'COMPL.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 135202
              mmTop = 4233
              mmWidth = 10054
              BandType = 1
            end
            object ppLabel9: TppLabel
              UserName = 'Label5'
              AutoSize = False
              Caption = 'GOG'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 145786
              mmTop = 4233
              mmWidth = 11906
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label9'
              Caption = 'COMPAR.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 186532
              mmTop = 4233
              mmWidth = 12171
              BandType = 1
            end
            object ppLabel11: TppLabel
              UserName = 'Label10'
              AutoSize = False
              Caption = 'SUBTOTAL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 200819
              mmTop = 529
              mmWidth = 15081
              BandType = 1
            end
            object ppLabel13: TppLabel
              UserName = 'Label101'
              AutoSize = False
              Caption = 'ÍNDICE'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 217488
              mmTop = 529
              mmWidth = 15346
              BandType = 1
            end
            object ppLabel15: TppLabel
              UserName = 'Label102'
              AutoSize = False
              Caption = 'TOTAL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 253471
              mmTop = 529
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel20: TppLabel
              UserName = 'Label20'
              Caption = 'GERAL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 255588
              mmTop = 4498
              mmWidth = 8467
              BandType = 1
            end
            object ppLabel5: TppLabel
              UserName = 'Label6'
              Caption = 'INCORP.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 78052
              mmTop = 4233
              mmWidth = 11906
              BandType = 1
            end
            object ppLabel6: TppLabel
              UserName = 'Label11'
              Caption = 'JUDICIAL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 95515
              mmTop = 4233
              mmWidth = 14817
              BandType = 1
            end
            object ppLabel28: TppLabel
              UserName = 'Label13'
              Caption = 'RETROAT.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 111919
              mmTop = 4233
              mmWidth = 13494
              BandType = 1
            end
            object ppLabel61: TppLabel
              UserName = 'Label15'
              Caption = 'GRATIF.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 160338
              mmTop = 4233
              mmWidth = 11906
              BandType = 1
            end
            object ppLabel63: TppLabel
              UserName = 'Label16'
              AutoSize = False
              Caption = 'LIMITE'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 173567
              mmTop = 4233
              mmWidth = 11906
              BandType = 1
            end
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Caption = 'SUBTOTAL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 236273
              mmTop = 529
              mmWidth = 13494
              BandType = 1
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Caption = 'CORRIGIDO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 234421
              mmTop = 4498
              mmWidth = 15346
              BandType = 1
            end
            object ppLine4: TppLine
              UserName = 'Line4'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.75
              mmHeight = 9525
              mmLeft = 200025
              mmTop = 0
              mmWidth = 794
              BandType = 1
            end
          end
          object ppDetailBand6: TppDetailBand
            BeforePrint = ppDetailBand6BeforePrint
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppLinhaParcA: TppShape
              UserName = 'LinhaParcA'
              Brush.Color = clWindow
              ParentHeight = True
              Pen.Style = psClear
              mmHeight = 4498
              mmLeft = 0
              mmTop = 0
              mmWidth = 268553
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              AutoSize = True
              DataField = 'DATA'
              DataPipeline = ppBdeSRBAux
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 2646
              mmLeft = 1058
              mmTop = 529
              mmWidth = 5821
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'DBText13'
              AutoSize = True
              DataField = 'SALARIO'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2646
              mmLeft = 19315
              mmTop = 529
              mmWidth = 10054
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              AutoSize = True
              DataField = 'ANUENIO'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2646
              mmLeft = 34131
              mmTop = 529
              mmWidth = 10054
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              AutoSize = True
              DataField = 'GRATFERIAS'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2646
              mmLeft = 56092
              mmTop = 529
              mmWidth = 14288
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText16'
              AutoSize = True
              DataField = 'HORAEXTRAINCORP'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2646
              mmLeft = 68263
              mmTop = 529
              mmWidth = 21696
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              AutoSize = True
              DataField = 'GDVGOG'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2646
              mmLeft = 148961
              mmTop = 529
              mmWidth = 8731
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              AutoSize = True
              DataField = 'LIMITANTE'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2646
              mmLeft = 172509
              mmTop = 529
              mmWidth = 12965
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DBText19'
              AutoSize = True
              DataField = 'VALORCOMPAR'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2646
              mmLeft = 182827
              mmTop = 529
              mmWidth = 15875
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              AutoSize = True
              DataField = 'DIFERENCASCOMPL'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2646
              mmLeft = 123561
              mmTop = 529
              mmWidth = 21696
              BandType = 4
            end
            object ppDBText1: TppDBText
              UserName = 'DBText1'
              AutoSize = True
              DataField = 'FERIAS'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2646
              mmLeft = 48154
              mmTop = 529
              mmWidth = 8731
              BandType = 4
            end
            object ppDBText2: TppDBText
              UserName = 'DBText2'
              AutoSize = True
              DataField = 'PERICJUDICIAL'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2646
              mmLeft = 91546
              mmTop = 529
              mmWidth = 18785
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              AutoSize = True
              DataField = 'PROMOCAORETRO'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2646
              mmLeft = 106627
              mmTop = 529
              mmWidth = 18785
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              AutoSize = True
              DataField = 'FUNCAOGRATIF'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2646
              mmLeft = 155046
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText38: TppDBText
              UserName = 'DBText38'
              AutoSize = True
              DataField = 'SUBTOTAL'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2646
              mmLeft = 204259
              mmTop = 529
              mmWidth = 11642
              BandType = 4
            end
            object ppDBText39: TppDBText
              UserName = 'DBText39'
              AutoSize = True
              DataField = 'INDICE'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.0000000;-#,0.0000000'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2646
              mmLeft = 224103
              mmTop = 529
              mmWidth = 8731
              BandType = 4
            end
            object ppDBText40: TppDBText
              UserName = 'DBText40'
              AutoSize = True
              DataField = 'TOTALGERAL'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2646
              mmLeft = 249767
              mmTop = 529
              mmWidth = 14288
              BandType = 4
            end
            object ppDBText41: TppDBText
              UserName = 'DBText41'
              AutoSize = True
              DataField = 'SUBCORRIGIDO'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2646
              mmLeft = 232569
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
            object ppLine3: TppLine
              UserName = 'Line3'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 0
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine5: TppLine
              UserName = 'Line5'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 200025
              mmTop = 0
              mmWidth = 1323
              BandType = 4
            end
            object ppLine6: TppLine
              UserName = 'Line6'
              ParentHeight = True
              Position = lpRight
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 267230
              mmTop = 0
              mmWidth = 1588
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            BeforePrint = ppSummaryBand1BeforePrint
            mmBottomOffset = 0
            mmHeight = 39688
            mmPrintPosition = 0
            object ppShape5: TppShape
              UserName = 'Shape5'
              Shape = stRoundRect
              mmHeight = 13229
              mmLeft = 0
              mmTop = 25665
              mmWidth = 93134
              BandType = 7
            end
            object ppShape3: TppShape
              UserName = 'Shape3'
              mmHeight = 22490
              mmLeft = 200025
              mmTop = 794
              mmWidth = 68792
              BandType = 7
            end
            object ppLabel37: TppLabel
              UserName = 'Label37'
              AutoSize = False
              Caption = 'Salário Real de Benef.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 200819
              mmTop = 1852
              mmWidth = 40217
              BandType = 7
            end
            object ppLabel39: TppLabel
              UserName = 'Label17'
              AutoSize = False
              Caption = 'Adicional Parcela "B"'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 200819
              mmTop = 8467
              mmWidth = 39158
              BandType = 7
            end
            object ppDBParcelaB: TppDBText
              UserName = 'DBText5'
              DataField = 'PARCELAB'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 248444
              mmTop = 8467
              mmWidth = 15610
              BandType = 7
            end
            object ppLabel64: TppLabel
              UserName = 'Label18'
              AutoSize = False
              Caption = 'S.R.B + '
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 200819
              mmTop = 15346
              mmWidth = 17198
              BandType = 7
            end
            object ppLabel65: TppLabel
              UserName = 'Label19'
              Caption = 'Adicional Parcela "B"'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 200819
              mmTop = 18785
              mmWidth = 35454
              BandType = 7
            end
            object ppDBResultado: TppLabel
              UserName = 'Label21'
              AutoSize = False
              Caption = '0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 248444
              mmTop = 15346
              mmWidth = 15610
              BandType = 7
            end
            object ppLine1: TppLine
              UserName = 'Line1'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 0
              mmTop = 0
              mmWidth = 268817
              BandType = 7
            end
            object ppLine2: TppLine
              UserName = 'Line2'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 0
              mmTop = 24342
              mmWidth = 268816
              BandType = 7
            end
            object ppLabel17: TppLabel
              UserName = 'Label305'
              AutoSize = False
              Caption = 'ELABORADO POR :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 2117
              mmTop = 27252
              mmWidth = 34131
              BandType = 7
            end
            object ppShape6: TppShape
              UserName = 'Shape6'
              Shape = stRoundRect
              mmHeight = 13229
              mmLeft = 100542
              mmTop = 25665
              mmWidth = 93134
              BandType = 7
            end
            object ppLabel66: TppLabel
              UserName = 'Label66'
              AutoSize = False
              Caption = 'CONFERIDO POR :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 103188
              mmTop = 27252
              mmWidth = 34131
              BandType = 7
            end
            object ppSubTotalSRB: TppLabel
              UserName = 'SubTotalSRB'
              Caption = 'SubTotalSRB'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 245534
              mmTop = 1852
              mmWidth = 18521
              BandType = 7
            end
          end
        end
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLabel18: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'AdmPREV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 1058
        mmWidth = 197909
        BandType = 8
      end
      object ppLine10: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 268816
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
        mmLeft = 242623
        mmTop = 1058
        mmWidth = 26194
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
        mmTop = 1058
        mmWidth = 268553
        BandType = 8
      end
    end
  end
  object QryRubricasA: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  TO_CHAR(TO_DATE(MES,'#39'YYYY/MM'#39'),'#39'MON/YYYY'#39') AS MESANO,'
      
        '  P.IDGRUPORUBRICA, H.IDPATRO AS IDPESSJUR, H.IDRUBRICA, H.CODPR' +
        'OVDESC,   H.VALORPROVENTO,  H.MES'
      'FROM'
      '  HISTRUBSAL H, PROVDESC P'
      'WHERE'
      '  H.IDPESSOA  = :IDPESSOA  AND'
      '  H.IDPATRO   = :IDPESSJUR   AND'
      '  H.MES < :ANOMES   AND'
      
        '  H.MES >= TO_CHAR(ADD_MONTHS(TO_DATE(:ANOMES, '#39'YYYY/MM'#39'),-12), ' +
        #39'YYYY/MM'#39')    AND'
      '  P.IDGRUPORUBRICA IN ('#39'A'#39','#39'E'#39')   AND'
      '  H.IDRUBRICA = P.IDPROVENTO'
      'ORDER BY  H.MES'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 455
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '2312'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '50031'
      end
      item
        DataType = ftString
        Name = 'ANOMES'
        ParamType = ptUnknown
        Value = '2001/11'
      end
      item
        DataType = ftString
        Name = 'ANOMES'
        ParamType = ptUnknown
      end>
  end
  object dsSRBAux: TDataSource
    DataSet = QrySRBAux
    Left = 102
    Top = 127
  end
  object ppBdeSRBAux: TppBDEPipeline
    DataSource = dsSRBAux
    UserName = 'ppBdeSRBAux'
    Left = 191
    Top = 127
    object ppBdeSRBAuxppField1: TppField
      FieldAlias = 'ANOMES'
      FieldName = 'ANOMES'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBdeSRBAuxppField2: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 8
      DisplayWidth = 8
      Position = 1
    end
    object ppBdeSRBAuxppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALARIO'
      FieldName = 'SALARIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppBdeSRBAuxppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANUENIO'
      FieldName = 'ANUENIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppBdeSRBAuxppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'FERIAS'
      FieldName = 'FERIAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppBdeSRBAuxppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'GRATFERIAS'
      FieldName = 'GRATFERIAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppBdeSRBAuxppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'HORAEXTRAINCORP'
      FieldName = 'HORAEXTRAINCORP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppBdeSRBAuxppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERICJUDICIAL'
      FieldName = 'PERICJUDICIAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppBdeSRBAuxppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROMOCAORETRO'
      FieldName = 'PROMOCAORETRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppBdeSRBAuxppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFERENCASCOMPL'
      FieldName = 'DIFERENCASCOMPL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppBdeSRBAuxppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'GDVGOG'
      FieldName = 'GDVGOG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppBdeSRBAuxppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'FUNCAOGRATIF'
      FieldName = 'FUNCAOGRATIF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppBdeSRBAuxppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'LIMITANTE'
      FieldName = 'LIMITANTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppBdeSRBAuxppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORCOMPAR'
      FieldName = 'VALORCOMPAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppBdeSRBAuxppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUBTOTAL'
      FieldName = 'SUBTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppBdeSRBAuxppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'INDICE'
      FieldName = 'INDICE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppBdeSRBAuxppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUBCORRIGIDO'
      FieldName = 'SUBCORRIGIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppBdeSRBAuxppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSALUBRIDADE'
      FieldName = 'INSALUBRIDADE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppBdeSRBAuxppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'FATOR'
      FieldName = 'FATOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppBdeSRBAuxppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALGERAL'
      FieldName = 'TOTALGERAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppBdeSRBAuxppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARCELAB'
      FieldName = 'PARCELAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
  end
  object QrySRBAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'YYYY/MM'#39'     AS ANOMES,'
      '  '#39'MMM/YYYY'#39'    AS DATA,'
      '  NVL(000.00,0) AS SALARIO,'
      '  NVL(000.00,0) AS ANUENIO,'
      '  NVL(000.00,0) AS FERIAS,'
      '  NVL(000.00,0) AS GRATFERIAS,'
      '  NVL(000.00,0) AS HORAEXTRAINCORP,'
      '  NVL(000.00,0) AS PERICJUDICIAL,'
      '  NVL(000.00,0) AS PROMOCAORETRO,'
      '  NVL(000.00,0) AS DIFERENCASCOMPL,'
      '  NVL(000.00,0) AS GDVGOG,'
      '  NVL(000.00,0) AS FUNCAOGRATIF,'
      '  NVL(000.00,0) AS LIMITANTE,'
      '  NVL(000.00,0) AS VALORCOMPAR,'
      '  NVL(000.00,0) AS SUBTOTAL,'
      '  NVL(000.00,0) AS INDICE,'
      '  NVL(000.00,0) AS SUBCORRIGIDO,'
      '  NVL(000.00,0) AS INSALUBRIDADE,'
      '  NVL(000.00,0) AS FATOR,'
      '  NVL(000.00,0) AS TOTALGERAL,'
      '  NVL(000.00,0) AS PARCELAB'
      'FROM'
      '  DUAL'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpdSRBAux
    ValidateWithMask = True
    Left = 23
    Top = 127
  end
  object dsSRBParcelaB: TDataSource
    DataSet = QrySRBAuxB
    Left = 107
    Top = 207
  end
  object ppBdeSRBAuxB: TppBDEPipeline
    DataSource = dsSRBParcelaB
    UserName = 'ppBdeSRBAuxB'
    Left = 186
    Top = 183
    object ppBdeSRBAuxBppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRUBRICA'
      FieldName = 'IDRUBRICA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppBdeSRBAuxBppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 48
      DisplayWidth = 48
      Position = 1
    end
    object ppBdeSRBAuxBppField3: TppField
      FieldAlias = 'ANOMESREF'
      FieldName = 'ANOMESREF'
      FieldLength = 7
      DisplayWidth = 7
      Position = 2
    end
    object ppBdeSRBAuxBppField4: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppBdeSRBAuxBppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORDEM'
      FieldName = 'ORDEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppBdeSRBAuxBppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppBdeSRBAuxBppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'INDICE'
      FieldName = 'INDICE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppBdeSRBAuxBppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROPORCAO'
      FieldName = 'PROPORCAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppBdeSRBAuxBppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'FORALIMITE'
      FieldName = 'FORALIMITE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
  end
  object QrySRBAuxB: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  0 AS IDRUBRICA,'
      '  '#39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS NOME,'
      '  '#39'0000/00'#39' AS ANOMESREF,'
      '  '#39'MMM/YYYY'#39' AS DATA,'
      '  NVL(000.00,0) AS ORDEM,'
      '  NVL(000.00,0) AS VALOR,'
      '  NVL(000.00,0) AS INDICE,'
      '  NVL(000.00,0) AS PROPORCAO,'
      '  NVL(000.00,0) AS FORALIMITE   '
      'FROM'
      '  DUAL'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updSRBParcelaB
    ValidateWithMask = True
    Left = 25
    Top = 207
  end
  object QryRubricasB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  TO_CHAR(TO_DATE(MES,'#39'YYYY/MM'#39'),'#39'MON/YYYY'#39') AS MESANO,'
      
        '  H.IDRUBRICA, H.MES, H.VALORPROVENTO, TO_DATE(H.MES,'#39'YYYY/MM'#39') ' +
        'AS DATARUBRICA,'
      
        '  D.TIPOCALCULO, D.IDRUBRICA, D.ANOMESREF, D.VLRCORRIGIDO, D.VLR' +
        'CALCULO,'
      '  D.VLRINDICE, D.FATOR,'
      '  C.IDBENEFICIO,'
      '  P.DESCRICAO'
      'FROM'
      '  HISTRUBSAL H,  DETCALCULO D, CALCULO C, PROVDESC P'
      'WHERE'
      '  H.IDPESSOA       = :IDPESSOA  AND'
      
        '  ( (C.IDBENEFICIO = :IDBENEFICIO) OR (C.IDBENEFICIO IS NULL) ) ' +
        ' AND'
      ''
      '  D.IDCALCULO = C.IDCALCULO(+)  AND'
      ''
      '  H.IDRUBRICA = D.IDRUBRICA(+)  AND'
      '  H.MES       = D.ANOMESREF(+)  AND'
      '  H.IDRUBRICA = P.IDPROVENTO    AND'
      '  P.IDGRUPORUBRICA IN (:IDGRUPORUBRICA)'
      ''
      ' '
      'ORDER BY'
      '  H.IDRUBRICA, H.MES, D.TIPOCALCULO'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 392
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDGRUPORUBRICA'
        ParamType = ptUnknown
      end>
  end
  object UpdSRBAux: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE DUAL SET DATA = :DATA WHERE DATA = :OLD_DATA')
    InsertSQL.Strings = (
      'INSERT INTO DUAL (DATA) VALUES (:DATA)')
    DeleteSQL.Strings = (
      'DELETE FROM DUAL WHERE DATA = :OLD_DATA')
    Left = 26
    Top = 145
  end
  object updSRBParcelaB: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE DUAL SET DATA = :DATA WHERE DATA = :OLD_DATA')
    InsertSQL.Strings = (
      'INSERT INTO DUAL (DATA) VALUES (:DATA)')
    DeleteSQL.Strings = (
      'DELETE FROM DUAL WHERE DATA = :OLD_DATA')
    Left = 27
    Top = 249
  end
  object ppSRBB: TppReport
    AutoStop = False
    DataPipeline = ppBdeSRB
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 (210 x 297 mm) '
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 7620
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 260
    Top = 204
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 47625
      mmPrintPosition = 0
      object ppShape8: TppShape
        UserName = 'Shape8'
        ParentWidth = True
        Shape = stRoundRect
        mmHeight = 6350
        mmLeft = 0
        mmTop = 21960
        mmWidth = 196030
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'Parcelas Adicionas a Serem Consideradas no Cálculo do SRB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 42333
        mmTop = 22754
        mmWidth = 114565
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 20373
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 38629
        BandType = 0
      end
      object ppDBText45: TppDBText
        UserName = 'DBText45'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5292
        mmLeft = 43392
        mmTop = 1323
        mmWidth = 133615
        BandType = 0
      end
      object ppDBText46: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 43392
        mmTop = 7144
        mmWidth = 23548
        BandType = 0
      end
      object ppDBText47: TppDBText
        UserName = 'DBText47'
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 2910
        mmLeft = 43392
        mmTop = 11642
        mmWidth = 69586
        BandType = 0
      end
      object ppDBText48: TppDBText
        UserName = 'rpResumoCobrDBText101'
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 2910
        mmLeft = 113242
        mmTop = 11642
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText49: TppDBText
        UserName = 'DBText49'
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 2910
        mmLeft = 43392
        mmTop = 15081
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText50: TppDBText
        UserName = 'DBText50'
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 2910
        mmLeft = 64029
        mmTop = 15081
        mmWidth = 48419
        BandType = 0
      end
      object ppDBText51: TppDBText
        UserName = 'DBText51'
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 2910
        mmLeft = 112977
        mmTop = 15081
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText52: TppDBText
        UserName = 'DBText52'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 2910
        mmLeft = 50800
        mmTop = 18521
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'rpResumoCobrLabel101'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 43392
        mmTop = 18521
        mmWidth = 5027
        BandType = 0
      end
      object ppShape7: TppShape
        UserName = 'Shape1'
        ParentWidth = True
        Shape = stRoundRect
        mmHeight = 18521
        mmLeft = 0
        mmTop = 28840
        mmWidth = 196030
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'DBText1'
        DataField = 'NOMEBENEFICIO'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 5027
        mmLeft = 132027
        mmTop = 41275
        mmWidth = 62177
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label1'
        Caption = 'Empresa '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 37306
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'DBText2'
        DataField = 'PATROCINADORA'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 41275
        mmWidth = 45244
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label2'
        Caption = 'Plano '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 49213
        mmTop = 37306
        mmWidth = 8202
        BandType = 0
      end
      object ppDBText23: TppDBText
        UserName = 'DBText3'
        DataField = 'PLANO'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 49213
        mmTop = 41275
        mmWidth = 77788
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label3'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 30163
        mmWidth = 7673
        BandType = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText4'
        DataField = 'PARTICIPANTE'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 33867
        mmWidth = 79640
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Matricula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 156898
        mmTop = 30163
        mmWidth = 15610
        BandType = 0
      end
      object ppDBText37: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'MATRICULA'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 156898
        mmTop = 33867
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label5'
        Caption = 'Espécie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 132027
        mmTop = 37571
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Nascimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 132027
        mmTop = 30163
        mmWidth = 17727
        BandType = 0
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'DATANASC'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 132027
        mmTop = 33867
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel67: TppLabel
        UserName = 'Label7'
        Caption = 'Admissão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 83079
        mmTop = 30163
        mmWidth = 13229
        BandType = 0
      end
      object ppDBText43: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'DATAADMISSAO'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 83079
        mmTop = 33867
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel68: TppLabel
        UserName = 'Label8'
        Caption = 'Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 106892
        mmTop = 30163
        mmWidth = 12171
        BandType = 0
      end
      object ppDBText44: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'INSCRICAODATA'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 106892
        mmTop = 33867
        mmWidth = 23019
        BandType = 0
      end
      object ppLabel95: TppLabel
        UserName = 'Label95'
        Caption = 'Data Ref.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 179123
        mmTop = 30163
        mmWidth = 12965
        BandType = 0
      end
      object ppDBText71: TppDBText
        UserName = 'DBText701'
        AutoSize = True
        DataField = 'DATAREF'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 179123
        mmTop = 33867
        mmWidth = 13229
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppSubReport2: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 196030
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppBdeSRBAuxB
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4 (210 x 297 mm) '
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 7620
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 136
          Top = 200
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand8: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
            object ppDBText28: TppDBText
              UserName = 'DBText28'
              DataField = 'ORDEM'
              DataPipeline = ppBdeSRBAuxB
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 1058
              mmTop = 265
              mmWidth = 10583
              BandType = 4
            end
            object ppDBText29: TppDBText
              UserName = 'DBText29'
              DataField = 'DATA'
              DataPipeline = ppBdeSRBAuxB
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 14288
              mmTop = 265
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText30: TppDBText
              UserName = 'DBText30'
              DataField = 'VALOR'
              DataPipeline = ppBdeSRBAuxB
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 62442
              mmTop = 265
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText31: TppDBText
              UserName = 'DBText31'
              DataField = 'INDICE'
              DataPipeline = ppBdeSRBAuxB
              DisplayFormat = '#,0.0000000;-#,0.0000000'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 109273
              mmTop = 265
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText32: TppDBText
              UserName = 'DBText32'
              DataField = 'PROPORCAO'
              DataPipeline = ppBdeSRBAuxB
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 162454
              mmTop = 265
              mmWidth = 17198
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppGroup2: TppGroup
            BreakName = 'IDRUBRICA'
            DataPipeline = ppBdeSRBAuxB
            NewPage = True
            UserName = 'Group2'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            object ppGroupHeaderBand2: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 5292
              mmPrintPosition = 0
              object ppShape9: TppShape
                UserName = 'Shape9'
                ParentHeight = True
                ParentWidth = True
                Shape = stRoundRect
                mmHeight = 5292
                mmLeft = 0
                mmTop = 0
                mmWidth = 196030
                BandType = 3
                GroupNo = 0
              end
              object ppLabel51: TppLabel
                UserName = 'Label29'
                Caption = 'ORDEM'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 1323
                mmWidth = 8467
                BandType = 3
                GroupNo = 0
              end
              object ppLabel52: TppLabel
                UserName = 'Label30'
                AutoSize = False
                Caption = 'MÊS'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 25665
                mmTop = 1323
                mmWidth = 5821
                BandType = 3
                GroupNo = 0
              end
              object ppLabel53: TppLabel
                UserName = 'Label301'
                AutoSize = False
                Caption = 'VALOR DA RUBRICA'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 48419
                mmTop = 1323
                mmWidth = 31221
                BandType = 3
                GroupNo = 0
              end
              object ppLabel55: TppLabel
                UserName = 'Label303'
                AutoSize = False
                Caption = 'ÍNDICE DE CORREÇÃO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 92075
                mmTop = 1323
                mmWidth = 34396
                BandType = 3
                GroupNo = 0
              end
              object ppLabel58: TppLabel
                UserName = 'Label36'
                AutoSize = False
                Caption = 'PROPORÇÃO (R$)'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 153723
                mmTop = 1323
                mmWidth = 25929
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand2: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 15081
              mmPrintPosition = 0
              object ppShape12: TppShape
                UserName = 'Shape12'
                Shape = stRoundRect
                mmHeight = 8467
                mmLeft = 0
                mmTop = 6614
                mmWidth = 93134
                BandType = 5
                GroupNo = 0
              end
              object ppShape10: TppShape
                UserName = 'Shape10'
                mmHeight = 5292
                mmLeft = 127529
                mmTop = 0
                mmWidth = 68792
                BandType = 5
                GroupNo = 0
              end
              object ppLabel49: TppLabel
                UserName = 'Label49'
                AutoSize = False
                Caption = 'TOTAL'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 130440
                mmTop = 1058
                mmWidth = 22225
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc1: TppDBCalc
                UserName = 'DBSRB1'
                DataField = 'PROPORCAO'
                DataPipeline = ppBdeSRBAuxB
                DisplayFormat = '#,0.00;-#,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 8
                Font.Style = [fsBold]
                ResetGroup = ppGroup2
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 164042
                mmTop = 1058
                mmWidth = 15610
                BandType = 5
                GroupNo = 0
              end
              object ppShape11: TppShape
                UserName = 'Shape11'
                Shape = stRoundRect
                mmHeight = 8467
                mmLeft = 102923
                mmTop = 6614
                mmWidth = 93134
                BandType = 5
                GroupNo = 0
              end
              object ppLabel54: TppLabel
                UserName = 'Label54'
                AutoSize = False
                Caption = 'CONFERIDO POR :'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 106363
                mmTop = 7938
                mmWidth = 34131
                BandType = 5
                GroupNo = 0
              end
              object ppLabel56: TppLabel
                UserName = 'Label56'
                AutoSize = False
                Caption = 'ELABORADO POR :'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 1588
                mmTop = 7938
                mmWidth = 34131
                BandType = 5
                GroupNo = 0
              end
              object ppLine7: TppLine
                UserName = 'Line7'
                ParentWidth = True
                Weight = 0.75
                mmHeight = 1058
                mmLeft = 0
                mmTop = 5821
                mmWidth = 196030
                BandType = 5
                GroupNo = 0
              end
            end
          end
        end
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLine26: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 196030
        BandType = 8
      end
      object ppLabel62: TppLabel
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
        mmTop = 1323
        mmWidth = 197380
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
        mmTop = 1323
        mmWidth = 163513
        BandType = 8
      end
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P.RAZAOSOCIAL FROM'
      'PESSOA P, '
      'EMPRESAPROP E '
      'WHERE  P.IDPESSOA = E.IDPESSOA'
      'AND P.IDPESSOA = :PIDPESSOA')
    ValidateWithMask = True
    Left = 391
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      ( P.IDPESSOA =  E.IDPESSOA(+)) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      ( P.IDIMAGEM = I.IDIMAGEM(+))'
      ' ')
    ValidateWithMask = True
    Left = 391
    Top = 35
    ParamData = <
      item
        DataType = ftString
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = '1'
      end>
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 391
    Top = 24
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 391
    Top = 11
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object DsgnCM: TppDesigner
    Caption = 'Gerador de Relatórios e Gráficos'
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000033333300003333330000000000000003BBBBBB3003BBBBBB30000
      00000000003BBBBBB3003BBBBBB30000000000000003BBBB3003BBBBBB300000
      000000000003BBBB3003BBBBB3000000000000000003BBBB3003BBBB30000000
      000000000003BBBBB33BBBBB30000000000000000003BBBBBBBBBBB300000000
      000000000003BBBBBBBBBBB300000000000000700003BBBB333BBBBB30000000
      000000800003BBBB3003BBBBB30000000000F8F00003BBBB3003BBBBB3000000
      008F8F800003BBBB3003BBBBB3000070F8F877F80003BBBB333BBBBBB300007F
      8F00F08F003BBBBBBBBBBBBB3000007800FFF048003BBBBBBBBBBBB300000000
      FFFFF08F8003333333333330000070FFFFCCF804F07000000000000000007FFF
      CCFFFF0F8F0000000000000000007FCCFFFCCF074807000000000000000078FF
      FCCFFFF08F80700000000000000007FCCFFFCCF044F8070000000000000007FF
      FFCCFFFF0F8F8000000000000000078FCCFFFCCF07F77000000000000000007F
      FFFCCFFFF07000000000000000000078FCCFFFCCFF0700000000000000000007
      FFFFCCFFFF80000000000000000000078FCCFFFF877000000000000000000000
      7FFFFF8770000000000000000000000007FF8770000000000000000000000000
      007770000000000000000000000000000000000000000000000000000000FFFE
      0781FFFC0300FFFC0300FFFE0601FFFE0603FFFE0607FFFE0007FFFE000FFFFE
      000FFFDE0007FF0E0603FC0E0603F00E0603C0060003C0040007C004000FC002
      001F0001FFFF0001FFFF0000FFFF00007FFF80003FFF80003FFF80007FFFC001
      FFFFC000FFFFE000FFFFE001FFFFF007FFFFF81FFFFFFC7FFFFFFFFFFFFF}
    Position = poScreenCenter
    ShowComponents = [scLabel, scMemo, scRichText, scCalc, scImage, scShape, scLine, scBarCode, scTeeChart, scDBText, scDBMemo, scDBRichText, scDBCalc, scDBImage, scDBBarCode, scDBTeeChart, scRegion]
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.SQLType = sqBDELocal
    Report = ppSRB
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 313
    Top = 70
  end
  object DsgnCMB: TppDesigner
    Caption = 'Gerador de Relatórios e Gráficos'
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000033333300003333330000000000000003BBBBBB3003BBBBBB30000
      00000000003BBBBBB3003BBBBBB30000000000000003BBBB3003BBBBBB300000
      000000000003BBBB3003BBBBB3000000000000000003BBBB3003BBBB30000000
      000000000003BBBBB33BBBBB30000000000000000003BBBBBBBBBBB300000000
      000000000003BBBBBBBBBBB300000000000000700003BBBB333BBBBB30000000
      000000800003BBBB3003BBBBB30000000000F8F00003BBBB3003BBBBB3000000
      008F8F800003BBBB3003BBBBB3000070F8F877F80003BBBB333BBBBBB300007F
      8F00F08F003BBBBBBBBBBBBB3000007800FFF048003BBBBBBBBBBBB300000000
      FFFFF08F8003333333333330000070FFFFCCF804F07000000000000000007FFF
      CCFFFF0F8F0000000000000000007FCCFFFCCF074807000000000000000078FF
      FCCFFFF08F80700000000000000007FCCFFFCCF044F8070000000000000007FF
      FFCCFFFF0F8F8000000000000000078FCCFFFCCF07F77000000000000000007F
      FFFCCFFFF07000000000000000000078FCCFFFCCFF0700000000000000000007
      FFFFCCFFFF80000000000000000000078FCCFFFF877000000000000000000000
      7FFFFF8770000000000000000000000007FF8770000000000000000000000000
      007770000000000000000000000000000000000000000000000000000000FFFE
      0781FFFC0300FFFC0300FFFE0601FFFE0603FFFE0607FFFE0007FFFE000FFFFE
      000FFFDE0007FF0E0603FC0E0603F00E0603C0060003C0040007C004000FC002
      001F0001FFFF0001FFFF0000FFFF00007FFF80003FFF80003FFF80007FFFC001
      FFFFC000FFFFE000FFFFE001FFFFF007FFFFF81FFFFFFC7FFFFFFFFFFFFF}
    Position = poScreenCenter
    ShowComponents = [scLabel, scMemo, scRichText, scCalc, scImage, scShape, scLine, scBarCode, scTeeChart, scDBText, scDBMemo, scDBRichText, scDBCalc, scDBImage, scDBBarCode, scDBTeeChart, scRegion]
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.SQLType = sqBDELocal
    Report = ppSRBB
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 319
    Top = 202
  end
  object qryRelINSS: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS NOME,'
      '  0                   AS IDRUBRICA,'
      '  '#39'0000/00'#39'           AS ANOMESREF,'
      '  '#39'MMM/YYYY'#39'          AS DATA,'
      '  NVL(000.00,0)       AS SALARIO,'
      '  NVL(000.00,0)       AS TETO,'
      '  NVL(000.00,0)       AS SALARIOLIMITADO,'
      '  NVL(000.00000000,0) AS INDICE,'
      '  NVL(000.00000000,0) AS FATORPREVIDENCIARIO,  '
      '  NVL(000.00,0)       AS SALARIOCORRIGIDO'
      'FROM'
      '  DUAL'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updRelINSS
    ValidateWithMask = True
    Left = 22
    Top = 312
  end
  object updRelINSS: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE DUAL'
      'SET'
      '  DATA = :DATA,'
      'WHERE'
      '  DATA = :OLD_DATA'
      '')
    InsertSQL.Strings = (
      'insert into DUAL'
      '  (DATA)'
      'values'
      '  (:DATA)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  DATA = :OLD_DATA')
    Left = 24
    Top = 354
  end
  object dsRelINSS: TDataSource
    DataSet = qryRelINSS
    Left = 104
    Top = 312
  end
  object ppBDERelINSS: TppBDEPipeline
    DataSource = dsRelINSS
    UserName = 'ppBdeSRBAuxB1'
    Left = 183
    Top = 264
    object ppBDERelINSSppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBDERelINSSppField2: TppField
      FieldAlias = 'IDRUBRICA'
      FieldName = 'IDRUBRICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDERelINSSppField3: TppField
      FieldAlias = 'ANOMESREF'
      FieldName = 'ANOMESREF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBDERelINSSppField4: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBDERelINSSppField5: TppField
      FieldAlias = 'SALARIO'
      FieldName = 'SALARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBDERelINSSppField6: TppField
      FieldAlias = 'TETO'
      FieldName = 'TETO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBDERelINSSppField7: TppField
      FieldAlias = 'SALARIOLIMITADO'
      FieldName = 'SALARIOLIMITADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBDERelINSSppField8: TppField
      FieldAlias = 'INDICE'
      FieldName = 'INDICE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBDERelINSSppField9: TppField
      FieldAlias = 'FATORPREVIDENCIARIO'
      FieldName = 'FATORPREVIDENCIARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppBDERelINSSppField10: TppField
      FieldAlias = 'SALARIOCORRIGIDO'
      FieldName = 'SALARIOCORRIGIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object ppRelINSS: TppReport
    AutoStop = False
    DataPipeline = ppBdeSRB
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 (210 x 297 mm) '
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 7620
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 257
    Top = 309
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 57944
      mmPrintPosition = 0
      object ppShape13: TppShape
        UserName = 'Shape7'
        ParentWidth = True
        Shape = stRoundRect
        mmHeight = 23813
        mmLeft = 0
        mmTop = 34131
        mmWidth = 196030
        BandType = 0
      end
      object ppDBText33: TppDBText
        UserName = 'DBText44'
        DataField = 'NOMEBENEFICIO'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 9525
        mmLeft = 132027
        mmTop = 45508
        mmWidth = 63236
        BandType = 0
      end
      object ppShape14: TppShape
        UserName = 'Shape8'
        ParentWidth = True
        Shape = stRoundRect
        mmHeight = 6879
        mmLeft = 0
        mmTop = 26723
        mmWidth = 196030
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'Label40'
        Caption = 'Demonstrativo de Cálculo do Valor do INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 57415
        mmTop = 27517
        mmWidth = 87842
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label41'
        Caption = 'Empresa '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 42598
        mmWidth = 14023
        BandType = 0
      end
      object ppDBText34: TppDBText
        UserName = 'DBText21'
        DataField = 'PATROCINADORA'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 46038
        mmWidth = 91546
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'Label42'
        Caption = 'Plano '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 49742
        mmWidth = 8202
        BandType = 0
      end
      object ppDBText35: TppDBText
        UserName = 'DBText22'
        DataField = 'PLANO'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 53446
        mmWidth = 91546
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'Label43'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 35190
        mmWidth = 9525
        BandType = 0
      end
      object ppDBText36: TppDBText
        UserName = 'DBText23'
        DataField = 'PARTICIPANTE'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 38629
        mmWidth = 91546
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'Label44'
        Caption = 'Matricula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 132027
        mmTop = 35190
        mmWidth = 14552
        BandType = 0
      end
      object ppDBText53: TppDBText
        UserName = 'DBText24'
        AutoSize = True
        DataField = 'MATRICULA'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 132027
        mmTop = 38629
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'Label45'
        Caption = 'Espécie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 132027
        mmTop = 42069
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'Label46'
        Caption = 'Nascimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 99748
        mmTop = 35190
        mmWidth = 18256
        BandType = 0
      end
      object ppDBText54: TppDBText
        UserName = 'DBText37'
        AutoSize = True
        DataField = 'DATANASC'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 99748
        mmTop = 38629
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'Label67'
        Caption = 'Admissão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 99748
        mmTop = 42598
        mmWidth = 16669
        BandType = 0
      end
      object ppDBText55: TppDBText
        UserName = 'DBText101'
        AutoSize = True
        DataField = 'DATAADMISSAO'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 99748
        mmTop = 46038
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'Label68'
        Caption = 'Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 99748
        mmTop = 49742
        mmWidth = 12171
        BandType = 0
      end
      object ppDBText56: TppDBText
        UserName = 'DBText43'
        AutoSize = True
        DataField = 'INSCRICAODATA'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 99748
        mmTop = 53446
        mmWidth = 23019
        BandType = 0
      end
      object ppDBImage2: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText57: TppDBText
        UserName = 'DBText45'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1323
        mmWidth = 133615
        BandType = 0
      end
      object ppDBText58: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText59: TppDBText
        UserName = 'DBText47'
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 12965
        mmWidth = 69586
        BandType = 0
      end
      object ppDBText60: TppDBText
        UserName = 'rpResumoCobrDBText101'
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 113242
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText61: TppDBText
        UserName = 'DBText49'
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 17463
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText62: TppDBText
        UserName = 'DBText50'
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 64029
        mmTop = 17463
        mmWidth = 48419
        BandType = 0
      end
      object ppDBText63: TppDBText
        UserName = 'DBText51'
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 112977
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText64: TppDBText
        UserName = 'DBText52'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 50800
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'rpResumoCobrLabel101'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 21960
        mmWidth = 5027
        BandType = 0
      end
      object ppLabel84: TppLabel
        UserName = 'Label84'
        Caption = 'Data Ref.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 159015
        mmTop = 35190
        mmWidth = 12965
        BandType = 0
      end
      object ppDBText70: TppDBText
        UserName = 'DBText70'
        AutoSize = True
        DataField = 'DATAREF'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 159015
        mmTop = 38629
        mmWidth = 13229
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppSubReport3: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 529
        mmWidth = 196030
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = ppBDERelINSS
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4 (210 x 297 mm) '
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 7620
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 136
          Top = 200
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand3: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3175
            mmPrintPosition = 0
            object ppDBText66: TppDBText
              UserName = 'DBText29'
              DataField = 'DATA'
              DataPipeline = ppBDERelINSS
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 529
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText67: TppDBText
              UserName = 'DBText30'
              DataField = 'SALARIOLIMITADO'
              DataPipeline = ppBDERelINSS
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 93398
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText68: TppDBText
              UserName = 'DBText31'
              DataField = 'INDICE'
              DataPipeline = ppBDERelINSS
              DisplayFormat = '#,0.0000000;-#,0.0000000'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 119327
              mmTop = 0
              mmWidth = 22225
              BandType = 4
            end
            object ppDBText69: TppDBText
              UserName = 'DBText32'
              DataField = 'SALARIOCORRIGIDO'
              DataPipeline = ppBDERelINSS
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 168011
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText65: TppDBText
              UserName = 'DBText301'
              DataField = 'SALARIO'
              DataPipeline = ppBDERelINSS
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 31485
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText72: TppDBText
              UserName = 'DBText72'
              DataField = 'TETO'
              DataPipeline = ppBDERelINSS
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 62442
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppGroup1: TppGroup
            BreakName = 'IDRUBRICA'
            DataPipeline = ppBDERelINSS
            NewPage = True
            UserName = 'Group2'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            object ppGroupHeaderBand1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 9790
              mmPrintPosition = 0
              object ppShape15: TppShape
                UserName = 'Shape9'
                ParentHeight = True
                ParentWidth = True
                Shape = stRoundRect
                mmHeight = 9790
                mmLeft = 0
                mmTop = 0
                mmWidth = 196030
                BandType = 3
                GroupNo = 0
              end
              object ppLabel79: TppLabel
                UserName = 'Label30'
                Caption = 'MÊS/ANO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 2910
                mmTop = 794
                mmWidth = 14817
                BandType = 3
                GroupNo = 0
              end
              object ppLabel80: TppLabel
                UserName = 'Label301'
                Caption = 'SALÁRIO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 95779
                mmTop = 794
                mmWidth = 14817
                BandType = 3
                GroupNo = 0
              end
              object ppLabel81: TppLabel
                UserName = 'Label303'
                Caption = 'ÍNDICE'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 128852
                mmTop = 794
                mmWidth = 12700
                BandType = 3
                GroupNo = 0
              end
              object ppLabel82: TppLabel
                UserName = 'Label35'
                Caption = 'CORRIGIDO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 166159
                mmTop = 5292
                mmWidth = 19050
                BandType = 3
                GroupNo = 0
              end
              object ppLabel83: TppLabel
                UserName = 'Label36'
                Caption = 'SALÁRIO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 170392
                mmTop = 794
                mmWidth = 14817
                BandType = 3
                GroupNo = 0
              end
              object ppLabel85: TppLabel
                UserName = 'Label48'
                Caption = 'CORREÇÃO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 124619
                mmTop = 5292
                mmWidth = 16933
                BandType = 3
                GroupNo = 0
              end
              object ppLabel86: TppLabel
                UserName = 'Label50'
                Caption = 'LIMITADO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 93663
                mmTop = 5292
                mmWidth = 16933
                BandType = 3
                GroupNo = 0
              end
              object ppLabel78: TppLabel
                UserName = 'Label306'
                Caption = 'SALÁRIO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 31750
                mmTop = 794
                mmWidth = 14817
                BandType = 3
                GroupNo = 0
              end
              object ppLabel91: TppLabel
                UserName = 'Label91'
                Caption = 'TETO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 71173
                mmTop = 794
                mmWidth = 8467
                BandType = 3
                GroupNo = 0
              end
              object ppLabel97: TppLabel
                UserName = 'Label97'
                Caption = 'PARTICIP.'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 29633
                mmTop = 5292
                mmWidth = 19050
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand1: TppGroupFooterBand
              BeforePrint = ppGroupFooterBand1BeforePrint
              mmBottomOffset = 0
              mmHeight = 31485
              mmPrintPosition = 0
              object ppShape16: TppShape
                UserName = 'Shape12'
                Shape = stRoundRect
                mmHeight = 9790
                mmLeft = 0
                mmTop = 20902
                mmWidth = 93134
                BandType = 5
                GroupNo = 0
              end
              object ppShape17: TppShape
                UserName = 'Shape10'
                mmHeight = 17463
                mmLeft = 102129
                mmTop = 1588
                mmWidth = 93927
                BandType = 5
                GroupNo = 0
              end
              object ppLabel87: TppLabel
                UserName = 'Label49'
                AutoSize = False
                Caption = 'SOMA'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 106098
                mmTop = 2910
                mmWidth = 22225
                BandType = 5
                GroupNo = 0
              end
              object ppShape18: TppShape
                UserName = 'Shape11'
                Shape = stRoundRect
                mmHeight = 9790
                mmLeft = 102923
                mmTop = 20902
                mmWidth = 93134
                BandType = 5
                GroupNo = 0
              end
              object ppLabel88: TppLabel
                UserName = 'Label54'
                AutoSize = False
                Caption = 'CONFERIDO POR :'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 106363
                mmTop = 21960
                mmWidth = 34131
                BandType = 5
                GroupNo = 0
              end
              object ppLabel89: TppLabel
                UserName = 'Label56'
                AutoSize = False
                Caption = 'ELABORADO POR :'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 2117
                mmTop = 21960
                mmWidth = 34131
                BandType = 5
                GroupNo = 0
              end
              object ppLine8: TppLine
                UserName = 'Line7'
                ParentWidth = True
                Weight = 0.75
                mmHeight = 1058
                mmLeft = 0
                mmTop = 19579
                mmWidth = 196030
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc2: TppDBCalc
                UserName = 'DBCalc1'
                AutoSize = True
                DataField = 'SALARIOCORRIGIDO'
                DataPipeline = ppBDERelINSS
                DisplayFormat = '#,0.00;-#,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 8
                Font.Style = [fsBold]
                ResetGroup = ppGroup1
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 146315
                mmTop = 2910
                mmWidth = 38894
                BandType = 5
                GroupNo = 0
              end
              object ppLabel92: TppLabel
                UserName = 'Label92'
                AutoSize = False
                Caption = 'MÉDIA'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 106098
                mmTop = 6879
                mmWidth = 22225
                BandType = 5
                GroupNo = 0
              end
              object ppLabel93: TppLabel
                UserName = 'Label93'
                AutoSize = False
                Caption = 'FATOR PREVIDENCIÁRIO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 106098
                mmTop = 10848
                mmWidth = 36777
                BandType = 5
                GroupNo = 0
              end
              object ppLabel94: TppLabel
                UserName = 'Label94'
                AutoSize = False
                Caption = 'INSS'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 105834
                mmTop = 14817
                mmWidth = 22225
                BandType = 5
                GroupNo = 0
              end
              object ppINSSRESULT: TppLabel
                UserName = 'INSSRESULT'
                Caption = '0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 178065
                mmTop = 14817
                mmWidth = 6879
                BandType = 5
                GroupNo = 0
              end
              object ppINSSMEDIA: TppLabel
                UserName = 'INSSMEDIA'
                Caption = '0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 178330
                mmTop = 6879
                mmWidth = 6879
                BandType = 5
                GroupNo = 0
              end
              object ppINSSFATORPREV: TppLabel
                UserName = 'INSSMEDIA1'
                Caption = '0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 178330
                mmTop = 10848
                mmWidth = 6879
                BandType = 5
                GroupNo = 0
              end
            end
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLine9: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 196030
        BandType = 8
      end
      object ppLabel90: TppLabel
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
        mmTop = 1323
        mmWidth = 197380
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
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
        mmTop = 1323
        mmWidth = 163513
        BandType = 8
      end
    end
  end
  object DsgnRelINSS: TppDesigner
    Caption = 'Gerador de Relatórios e Gráficos'
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000033333300003333330000000000000003BBBBBB3003BBBBBB30000
      00000000003BBBBBB3003BBBBBB30000000000000003BBBB3003BBBBBB300000
      000000000003BBBB3003BBBBB3000000000000000003BBBB3003BBBB30000000
      000000000003BBBBB33BBBBB30000000000000000003BBBBBBBBBBB300000000
      000000000003BBBBBBBBBBB300000000000000700003BBBB333BBBBB30000000
      000000800003BBBB3003BBBBB30000000000F8F00003BBBB3003BBBBB3000000
      008F8F800003BBBB3003BBBBB3000070F8F877F80003BBBB333BBBBBB300007F
      8F00F08F003BBBBBBBBBBBBB3000007800FFF048003BBBBBBBBBBBB300000000
      FFFFF08F8003333333333330000070FFFFCCF804F07000000000000000007FFF
      CCFFFF0F8F0000000000000000007FCCFFFCCF074807000000000000000078FF
      FCCFFFF08F80700000000000000007FCCFFFCCF044F8070000000000000007FF
      FFCCFFFF0F8F8000000000000000078FCCFFFCCF07F77000000000000000007F
      FFFCCFFFF07000000000000000000078FCCFFFCCFF0700000000000000000007
      FFFFCCFFFF80000000000000000000078FCCFFFF877000000000000000000000
      7FFFFF8770000000000000000000000007FF8770000000000000000000000000
      007770000000000000000000000000000000000000000000000000000000FFFE
      0781FFFC0300FFFC0300FFFE0601FFFE0603FFFE0607FFFE0007FFFE000FFFFE
      000FFFDE0007FF0E0603FC0E0603F00E0603C0060003C0040007C004000FC002
      001F0001FFFF0001FFFF0000FFFF00007FFF80003FFF80003FFF80007FFFC001
      FFFFC000FFFFE000FFFFE001FFFFF007FFFFF81FFFFFFC7FFFFFFFFFFFFF}
    Position = poScreenCenter
    ShowComponents = [scLabel, scMemo, scRichText, scCalc, scImage, scShape, scLine, scBarCode, scTeeChart, scDBText, scDBMemo, scDBRichText, scDBCalc, scDBImage, scDBBarCode, scDBTeeChart, scRegion]
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.SQLType = sqBDELocal
    Report = ppRelINSS
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 316
    Top = 307
  end
  object qryRubricasINSS: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  TO_CHAR(TO_DATE(MES,'#39'YYYY/MM'#39'),'#39'MON/YYYY'#39') AS MESANO,'
      
        '  H.IDRUBRICA, H.MES, H.VALORPROVENTO, TO_DATE(H.MES,'#39'YYYY/MM'#39') ' +
        'AS DATARUBRICA,'
      
        '  D.TIPOCALCULO, D.IDRUBRICA, D.ANOMESREF, D.VLRCORRIGIDO, D.VLR' +
        'CALCULO,'
      '  D.VLRINDICE, D.FATOR,'
      '  C.IDBENEFICIO,'
      '  P.DESCRICAO'
      'FROM'
      '  HISTRUBSAL H,  DETCALCULO D, CALCULO C, PROVDESC P'
      'WHERE'
      '  H.IDPESSOA       = :IDPESSOA  AND'
      
        '  ( (C.IDBENEFICIO = :IDBENEFICIO) OR (C.IDBENEFICIO IS NULL) ) ' +
        ' AND'
      ''
      '  D.IDCALCULO = C.IDCALCULO(+)  AND'
      ''
      '  H.IDRUBRICA = D.IDRUBRICA(+)  AND'
      '  H.MES       = D.ANOMESREF(+)  AND'
      '  H.IDRUBRICA = P.IDPROVENTO    AND'
      '  P.IDGRUPORUBRICA IN (:IDGRUPORUBRICA)'
      ''
      ' '
      'ORDER BY'
      '  H.IDRUBRICA, H.MES, D.TIPOCALCULO'
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 398
    Top = 306
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDGRUPORUBRICA'
        ParamType = ptUnknown
      end>
  end
  object qryRubricasAAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  TO_CHAR(TO_DATE(MES,'#39'YYYY/MM'#39'),'#39'MON/YYYY'#39') AS MESANO,'
      
        '  P.IDGRUPORUBRICA, H.IDPATRO AS IDPESSJUR, H.IDRUBRICA, H.CODPR' +
        'OVDESC,   H.VALORPROVENTO,  H.MES'
      'FROM'
      '  HISTRUBSAL H, PROVDESC P'
      'WHERE'
      '  H.IDPESSOA  = :IDPESSOA  AND'
      '  H.IDPATRO = :IDPESSJUR   AND'
      '  H.IDRUBRICA IN (21140, 23318) AND'
      '  H.MES < :ANOMES   AND'
      
        '  H.MES >= TO_CHAR(ADD_MONTHS(TO_DATE(:ANOMES, '#39'YYYY/MM'#39'),-12), ' +
        #39'YYYY/MM'#39')    AND'
      '  H.IDRUBRICA = P.IDPROVENTO'
      'ORDER BY  H.MES'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 391
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '2312'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '50031'
      end
      item
        DataType = ftString
        Name = 'ANOMES'
        ParamType = ptUnknown
        Value = '2001/11'
      end
      item
        DataType = ftString
        Name = 'ANOMES'
        ParamType = ptUnknown
      end>
  end
end
