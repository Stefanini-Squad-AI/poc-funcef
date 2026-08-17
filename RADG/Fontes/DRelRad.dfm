inherited DtmRelRAD: TDtmRelRAD
  Left = 147
  Top = 169
  Width = 493
  Height = 314
  Color = clWhite
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 37
    Top = 52
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
    Left = 37
    Top = 37
  end
  inherited qryExemplo: TwwQuery
    Top = 24
  end
  inherited rpExemplo: TppReport
    Left = 37
    Top = 10
  end
  object bdeAcompProc: TppBDEPipeline
    DataSource = dsAcompProc
    UserName = 'bdeAcompProc'
    Left = 117
    Top = 52
  end
  object dsAcompProc: TwwDataSource
    DataSet = qryAcompProc
    Left = 117
    Top = 37
  end
  object qryAcompProc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IP.IDPROCESSO,'
      '     TP.NOME AS NOMEPROC,'
      '     IP.DATAINIPROCESSO,'
      '     IP.DATAFIMPREV,'
      '     IP.DATAFIMPROCESSO,'
      '  IP.OBS AS OBSPROC, '
      '     IE.IDETAPA, '
      '     IE.DATAFIMETAPA,'
      '     IE.DATAINIETAPA,'
      '     IE.DATAFIMPREV,'
      '     TE.NOME AS NOMETAPA,'
      '     AUT.DATAAUTORIZACAO,'
      '     AUT.OBSAUTORIZA,'
      '     USU.NOMEUSUARIO,'
      
        '     DECODE(AUT.FLGSTATUS,'#39'R'#39','#39'RECUSADO'#39', DECODE(AUT.FLGSTATUS,'#39 +
        'S'#39','#39'AUTORIZADO'#39','#39'EXECUTADO'#39')) AS STATUS,'
      '    P.RAZAOSOCIAL'
      'FROM'
      '      PESSOA P,'
      '      RADINSTETAPA IE,'
      '      RADINSTPROCESSO IP,'
      '      RADAUTORIZACAO AUT,'
      '      RADTIPOETAPA TE,'
      '      RADTIPOPROCESSO TP,'
      '      USUARIOSISTEMA USU      '
      'WHERE'
      '            (IE.IDPROCESSO     = IP.IDPROCESSO)'
      '   AND (IE.IDTIPOETAPA    = TE.IDTIPOETAPA) '
      '   AND (IP.IDPESSRESP     = P.IDPESSOA(+))'
      '   AND (TP.IDTIPOPROCESSO = IP.IDTIPOPROCESSO) '
      '   AND (AUT.IDPROCESSO    = IP.IDPROCESSO)'
      '   AND (AUT.IDUSUARIO     = USU.IDUSUARIO)'
      '   AND (AUT.IDETAPA       = IE.IDETAPA)'
      'ORDER BY  TP.NOME,IE.DATAFIMETAPA, IE.DATAFIMPREV')
    ValidateWithMask = True
    Left = 117
    Top = 24
  end
  object RptAcompProc: TppReport
    AutoStop = False
    DataPipeline = bdeAcompProc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 117
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26458
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Acompanhamento dos Processos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 107950
        mmTop = 8731
        mmWidth = 68263
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'ppLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 18521
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel2'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127265
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object RptAcompProcLine1: TppLine
        UserName = 'RptAcompProcLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26194
        mmWidth = 284300
        BandType = 0
      end
      object RptAcompProcLabel1: TppLabel
        UserName = 'RptAcompProcLabel1'
        Caption = 'Processo :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 14023
        mmWidth = 15610
        BandType = 0
      end
      object LbProc: TppLabel
        UserName = 'LbProc'
        Caption = 'TODOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 16669
        mmTop = 14023
        mmWidth = 10054
        BandType = 0
      end
      object RptAcompProcLabel2: TppLabel
        UserName = 'RptAcompProcLabel2'
        Caption = 'Tipo Etapa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 20373
        mmWidth = 14817
        BandType = 0
      end
      object RptAcompProcLine2: TppLine
        UserName = 'RptAcompProcLine2'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 219340
        mmTop = 18521
        mmWidth = 2646
        BandType = 0
      end
      object RptAcompProcLabel5: TppLabel
        UserName = 'RptAcompProcLabel5'
        Caption = '  Data  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        mmHeight = 3969
        mmLeft = 241830
        mmTop = 15610
        mmWidth = 10054
        BandType = 0
      end
      object RptAcompProcLabel6: TppLabel
        UserName = 'RptAcompProcLabel6'
        Caption = 'Início'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 225955
        mmTop = 20373
        mmWidth = 8467
        BandType = 0
      end
      object RptAcompProcLabel7: TppLabel
        UserName = 'RptAcompProcLabel7'
        Caption = 'Fim Previsto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 238919
        mmTop = 20373
        mmWidth = 18256
        BandType = 0
      end
      object RptAcompProcLabel8: TppLabel
        UserName = 'RptAcompProcLabel8'
        Caption = 'Fim Efetivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 260086
        mmTop = 20373
        mmWidth = 15875
        BandType = 0
      end
      object RptAcompProcLabel11: TppLabel
        UserName = 'RptAcompProcLabel11'
        Caption = 'Usuário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 96044
        mmTop = 20373
        mmWidth = 11113
        BandType = 0
      end
      object RptAcompProcLabel13: TppLabel
        UserName = 'RptAcompProcLabel13'
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 128323
        mmTop = 20373
        mmWidth = 9260
        BandType = 0
      end
      object RptAcompProcLabel14: TppLabel
        UserName = 'RptAcompProcLabel14'
        Caption = 'Observação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 150019
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 23283
      mmPrintPosition = 0
      object RptAcompProcDBText3: TppDBText
        UserName = 'RptAcompProcDBText3'
        DataField = 'NOMETAPA'
        DataPipeline = bdeAcompProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 265
        mmWidth = 95250
        BandType = 4
      end
      object RptAcompProcDBText4: TppDBText
        UserName = 'RptAcompProcDBText4'
        DataField = 'DATAINIETAPA'
        DataPipeline = bdeAcompProc
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 222515
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object RptAcompProcDBText5: TppDBText
        UserName = 'RptAcompProcDBText5'
        DataField = 'DATAFIMPREV_1'
        DataPipeline = bdeAcompProc
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 241300
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object RptAcompProcDBText6: TppDBText
        UserName = 'RptAcompProcDBText6'
        DataField = 'DATAFIMETAPA'
        DataPipeline = bdeAcompProc
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 260086
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object RptAcompProcDBText10: TppDBText
        UserName = 'RptAcompProcDBText10'
        DataField = 'NOMEUSUARIO'
        DataPipeline = bdeAcompProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 96044
        mmTop = 265
        mmWidth = 31750
        BandType = 4
      end
      object RptAcompProcDBText11: TppDBText
        UserName = 'RptAcompProcDBText11'
        AutoSize = True
        DataField = 'STATUS'
        DataPipeline = bdeAcompProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 128323
        mmTop = 265
        mmWidth = 11113
        BandType = 4
      end
      object RptAcompProcDBMemo2: TppDBMemo
        UserName = 'RptAcompProcDBMemo2'
        CharWrap = True
        DataField = 'OBSAUTORIZA'
        DataPipeline = bdeAcompProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 22754
        mmLeft = 145786
        mmTop = 265
        mmWidth = 74877
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel3'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 529
        mmWidth = 38629
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 115623
        mmTop = 529
        mmWidth = 53181
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 249238
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptAcompProcGroup1: TppGroup
      BreakName = 'IDPROCESSO'
      DataPipeline = bdeAcompProc
      NewPage = True
      UserName = 'RptAcompProcGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptAcompProcGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 34131
        mmPrintPosition = 0
        object RptAcompProcLabel3: TppLabel
          UserName = 'RptAcompProcLabel3'
          Caption = 'Processo Nº :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 529
          mmTop = 265
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcLabel4: TppLabel
          UserName = 'RptAcompProcLabel4'
          Caption = 'Processo :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 37042
          mmTop = 265
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcDBText1: TppDBText
          UserName = 'RptAcompProcDBText1'
          DataField = 'IDPROCESSO'
          DataPipeline = bdeAcompProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 20373
          mmTop = 265
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcDBText2: TppDBText
          UserName = 'RptAcompProcDBText2'
          DataField = 'NOMEPROC'
          DataPipeline = bdeAcompProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 53446
          mmTop = 265
          mmWidth = 93398
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcDBMemo1: TppDBMemo
          UserName = 'RptAcompProcDBMemo1'
          CharWrap = True
          DataField = 'OBSPROC'
          DataPipeline = bdeAcompProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Stretch = True
          Transparent = True
          mmHeight = 27252
          mmLeft = 150284
          mmTop = 1058
          mmWidth = 126207
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object RptAcompProcLabel9: TppLabel
          UserName = 'RptAcompProcLabel9'
          Caption = 'Data Início :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 529
          mmTop = 7144
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcLabel10: TppLabel
          UserName = 'RptAcompProcLabel10'
          Caption = 'Data Fim Previsto :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 39158
          mmTop = 7144
          mmWidth = 26723
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcLabel12: TppLabel
          UserName = 'RptAcompProcLabel12'
          Caption = 'Data Fim Efetivo :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 89959
          mmTop = 7144
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcDBText7: TppDBText
          UserName = 'RptAcompProcDBText7'
          DataField = 'DATAINIPROCESSO'
          DataPipeline = bdeAcompProc
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 17463
          mmTop = 7144
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcDBText8: TppDBText
          UserName = 'RptAcompProcDBText8'
          DataField = 'DATAFIMPREV'
          DataPipeline = bdeAcompProc
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 66940
          mmTop = 7144
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcDBText9: TppDBText
          UserName = 'RptAcompProcDBText9'
          DataField = 'DATAFIMPROCESSO'
          DataPipeline = bdeAcompProc
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 115359
          mmTop = 7144
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcLabel16: TppLabel
          UserName = 'RptAcompProcLabel16'
          Caption = 'Pessoa:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 5027
          mmTop = 12171
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcDBText12: TppDBText
          UserName = 'RptAcompProcDBText12'
          DataField = 'RAZAOSOCIAL'
          DataPipeline = bdeAcompProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 17463
          mmTop = 12171
          mmWidth = 113771
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcLabel15: TppLabel
          UserName = 'RptAcompProcLabel15'
          Caption = 'Andamentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3969
          mmLeft = 265
          mmTop = 29633
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object RptAcompProcLine3: TppLine
          UserName = 'RptAcompProcLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 33867
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object RptAcompProcGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2910
        mmPrintPosition = 0
      end
    end
    object RptAcompProcGroup2: TppGroup
      BreakName = 'IDETAPA'
      DataPipeline = bdeAcompProc
      UserName = 'RptAcompProcGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptAcompProcGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object RptAcompProcGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object bdeFluxoProc: TppBDEPipeline
    DataSource = dsFluxoProc
    UserName = 'bdeFluxoProc'
    Left = 213
    Top = 52
  end
  object dsFluxoProc: TwwDataSource
    DataSet = qryFluxoProc
    Left = 213
    Top = 37
  end
  object qryFluxoProc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '      TP.IDTIPOPROCESSO,'
      '      TP.NOME AS NOMEPROC,'
      '      GG.NOME AS GRPGESTOR,'
      '      GC.NOME AS GRPCON,'
      '      TP.DESCRICAO,'
      '      TP.NUMDIASPREVISTO,'
      '      TE.NOME AS NOMEETAPA,'
      '      EF.IDTIPOETAPA,'
      '      TE.NOME AS ETAPAPRED,'
      '      AN.NOME AS ANDAMENTO'
      'FROM'
      '      RADTIPOPROCESSO TP,'
      '      RADFLUXO FL,'
      '      RADTIPOETAPAXPROC EXP, '
      '      RADGRPRESPON GG,'
      '      RADGRPRESPON GC,'
      '      RADTIPOETAPA EF,'
      '      RADTIPOETAPA TE,'
      '      RADTIPOETAPA EA,'
      '      RADANDAMENTO AN'
      'WHERE'
      '      (TP.IDGRPGESTOR  = GG.IDGRPRESPON(+))'
      '  AND (TP.IDGRPCONSULTA = GC.IDGRPRESPON(+))'
      '  AND (TP.IDTIPOPROCESSO = FL.IDTIPOPROCESSO)'
      '  AND (EXP.IDTIPOPROCESSO = TP.IDTIPOPROCESSO )'
      '  AND (EXP.IDTIPOETAPA = TE.IDTIPOETAPA)'
      '  AND (EXP.IDTIPOETAPA = EF.IDTIPOETAPA)'
      '  AND (FL.IDTIPOETAPA = EF.IDTIPOETAPA)'
      '  AND (FL.IDTIPOETAPA = EA.IDTIPOETAPA)'
      '  AND (FL.IDANDAMENTO = AN.IDANDAMENTO) '
      'ORDER BY TP.NOME, EXP.FLGINICIAL DESC'
      ' '
      '')
    ValidateWithMask = True
    Left = 213
    Top = 24
  end
  object RptFluxoProc: TppReport
    AutoStop = False
    DataPipeline = bdeFluxoProc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 213
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 20638
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        Caption = 'Fluxo dos Processos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 120650
        mmTop = 8731
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel5: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel5'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127265
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'ppLabel6'
        Caption = 'Tipo Processo :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 15081
        mmWidth = 22754
        BandType = 0
      end
      object LbProc2: TppLabel
        UserName = 'LbProc2'
        Caption = 'TODOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 23283
        mmTop = 15081
        mmWidth = 9525
        BandType = 0
      end
      object RptFluxoProcLine1: TppLine
        UserName = 'RptFluxoProcLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 20108
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'ppDBText1'
        DataField = 'NOMEETAPA'
        DataPipeline = bdeFluxoProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 265
        mmWidth = 95250
        BandType = 4
      end
      object RptFluxoProcDBText4: TppDBText
        UserName = 'RptFluxoProcDBText4'
        DataField = 'ANDAMENTO'
        DataPipeline = bdeFluxoProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 97367
        mmTop = 265
        mmWidth = 47625
        BandType = 4
      end
      object RptFluxoProcDBText5: TppDBText
        UserName = 'RptFluxoProcDBText5'
        DataField = 'ETAPAPRED'
        DataPipeline = bdeFluxoProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 146579
        mmTop = 265
        mmWidth = 95250
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'ppLine6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel16: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel16'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 529
        mmWidth = 38629
        BandType = 8
      end
      object ppCalc3: TppSystemVariable
        UserName = 'Calc3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 115623
        mmTop = 529
        mmWidth = 53181
        BandType = 8
      end
      object ppCalc4: TppSystemVariable
        UserName = 'Calc4'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 242359
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDTIPOPROCESSO'
      DataPipeline = bdeFluxoProc
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 33073
        mmPrintPosition = 0
        object ppLabel18: TppLabel
          UserName = 'ppLabel18'
          Caption = 'Processo :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 265
          mmTop = 265
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'ppDBText8'
          DataField = 'NOMEPROC'
          DataPipeline = bdeFluxoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 16669
          mmTop = 265
          mmWidth = 93398
          BandType = 3
          GroupNo = 0
        end
        object ppDBMemo2: TppDBMemo
          UserName = 'ppDBMemo2'
          CharWrap = True
          DataField = 'DESCRICAO'
          DataPipeline = bdeFluxoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Stretch = True
          Transparent = True
          mmHeight = 17727
          mmLeft = 265
          mmTop = 4498
          mmWidth = 126207
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object RptFluxoProcLabel1: TppLabel
          UserName = 'RptFluxoProcLabel1'
          Caption = 'Nº de Dias :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 110861
          mmTop = 265
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object RptFluxoProcDBText1: TppDBText
          UserName = 'RptFluxoProcDBText1'
          DataField = 'NUMDIASPREVISTO'
          DataPipeline = bdeFluxoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 127265
          mmTop = 265
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object RptFluxoProcDBText2: TppDBText
          UserName = 'RptFluxoProcDBText2'
          DataField = 'GRPCON'
          DataPipeline = bdeFluxoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 168275
          mmTop = 529
          mmWidth = 47625
          BandType = 3
          GroupNo = 0
        end
        object RptFluxoProcDBText3: TppDBText
          UserName = 'RptFluxoProcDBText3'
          DataField = 'GRPCON'
          DataPipeline = bdeFluxoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 168275
          mmTop = 6879
          mmWidth = 47625
          BandType = 3
          GroupNo = 0
        end
        object RptFluxoProcLabel2: TppLabel
          UserName = 'RptFluxoProcLabel2'
          Caption = 'Grupo de Gestores :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 137319
          mmTop = 529
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
        object RptFluxoProcLabel3: TppLabel
          UserName = 'RptFluxoProcLabel3'
          Caption = 'Grupo para Consulta :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 135467
          mmTop = 6879
          mmWidth = 31485
          BandType = 3
          GroupNo = 0
        end
        object RptFluxoProcLabel4: TppLabel
          UserName = 'RptFluxoProcLabel4'
          Caption = 'Fluxo do Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3969
          mmLeft = 265
          mmTop = 22754
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object RptFluxoProcLabel5: TppLabel
          UserName = 'RptFluxoProcLabel5'
          Caption = 'Etapa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 794
          mmTop = 28046
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object RptFluxoProcLine2: TppLine
          UserName = 'RptFluxoProcLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 26988
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object RptFluxoProcLine3: TppLine
          UserName = 'RptFluxoProcLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 32808
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object RptFluxoProcLabel6: TppLabel
          UserName = 'RptFluxoProcLabel6'
          Caption = 'Andamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 97631
          mmTop = 28575
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object RptFluxoProcLabel7: TppLabel
          UserName = 'RptFluxoProcLabel7'
          Caption = 'Predecessora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 146579
          mmTop = 28575
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object RptFluxoProcGroup1: TppGroup
      BreakName = 'IDTIPOETAPA'
      DataPipeline = bdeFluxoProc
      UserName = 'RptFluxoProcGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptFluxoProcGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object RptFluxoProcGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object bdeInfoProc: TppBDEPipeline
    DataSource = dsInfoProc
    UserName = 'bdeInfoProc'
    Left = 301
    Top = 52
  end
  object dsInfoProc: TwwDataSource
    DataSet = qryInfoProc
    Left = 301
    Top = 37
  end
  object qryInfoProc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT                                         '
      '       TP.IDTIPOPROCESSO,                       '
      '       TP.NOME AS NOMEPROC,                     '
      '       GG.NOME AS GRPGESTOR,                    '
      '       GC.NOME AS GRPCON,                       '
      '       TP.DESCRICAO,                            '
      '       TP.NUMDIASPREVISTO,                      '
      '       TE.NOME AS NOMEETAPA,'
      '       EXP.IDTIPOETAPA,'
      '       EXP.NUMDIASPREVISTO AS NUMDIAPREVETAPA,'
      '       DECODE(EXP.FLGINICIAL,'#39'S'#39','#39' X '#39','#39#39') AS INICIAL,'
      '       DECODE(EXP.FLGFINAL,'#39'S'#39','#39' X '#39','#39#39') AS FINAL,'
      '       M.NOMEMODULO,'
      '       A.NOMEGRUPOAUT  '
      ' FROM                                           '
      '       RADTIPOPROCESSO TP,                      '
      '       RADTIPOETAPAXPROC EXP,                   '
      '       RADETAPAXGRPRESP EXA,'
      '       RADGRUPOAUTORIZA A,'
      '       RADGRPRESPON GG,                         '
      '       RADGRPRESPON GC,                         '
      '       RADTIPOETAPA TE,'
      '       MODULO M'
      ' WHERE                                          '
      '       (TP.IDGRPGESTOR      = GG.IDGRPRESPON(+))'
      '   AND (TP.IDGRPCONSULTA    = GC.IDGRPRESPON(+))'
      '   AND (EXP.IDTIPOPROCESSO  = TP.IDTIPOPROCESSO)'
      '   AND (EXP.IDTIPOETAPA     = TE.IDTIPOETAPA)   '
      '   AND (EXP.IDMODULO        = M.IDMODULO)'
      '   AND (EXA.IDTIPOPROCESSO  = TP.IDTIPOPROCESSO)  '
      '   AND (EXA.IDTIPOETAPA     = TE.IDTIPOETAPA)          '
      '   AND (EXA.IDGRUPOAUTORIZA = A.IDGRUPOAUTORIZA)'
      ' ORDER BY TP.NOME, EXP.FLGINICIAL DESC         ')
    ValidateWithMask = True
    Left = 301
    Top = 24
  end
  object RptInfoProc: TppReport
    AutoStop = False
    DataPipeline = bdeInfoProc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 301
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 20638
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        UserName = 'ppLabel7'
        Caption = 'Informação dos Processos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 115359
        mmTop = 8731
        mmWidth = 54240
        BandType = 0
      end
      object ppLabel8: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel8'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127265
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'ppLabel9'
        Caption = 'Tipo Processo :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 15081
        mmWidth = 22754
        BandType = 0
      end
      object LbProc3: TppLabel
        UserName = 'LbProc3'
        Caption = 'TODOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 23283
        mmTop = 15081
        mmWidth = 9525
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'ppLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 20108
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object RptInfoProcDBText5: TppDBText
        UserName = 'RptInfoProcDBText5'
        DataField = 'NOMEGRUPOAUT'
        DataPipeline = bdeInfoProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 19315
        mmTop = 0
        mmWidth = 47625
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'ppLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel11: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel11'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 529
        mmWidth = 38629
        BandType = 8
      end
      object ppCalc5: TppSystemVariable
        UserName = 'Calc5'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 115623
        mmTop = 529
        mmWidth = 53181
        BandType = 8
      end
      object ppCalc6: TppSystemVariable
        UserName = 'Calc6'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 242359
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDTIPOPROCESSO'
      DataPipeline = bdeInfoProc
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 33073
        mmPrintPosition = 0
        object ppLabel12: TppLabel
          UserName = 'ppLabel12'
          Caption = 'Processo :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 265
          mmTop = 265
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'ppDBText5'
          DataField = 'NOMEPROC'
          DataPipeline = bdeInfoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 16669
          mmTop = 265
          mmWidth = 93398
          BandType = 3
          GroupNo = 0
        end
        object ppDBMemo1: TppDBMemo
          UserName = 'ppDBMemo1'
          CharWrap = True
          DataField = 'DESCRICAO'
          DataPipeline = bdeInfoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Stretch = True
          Transparent = True
          mmHeight = 17727
          mmLeft = 265
          mmTop = 4498
          mmWidth = 126207
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppLabel13: TppLabel
          UserName = 'ppLabel13'
          Caption = 'Nº de Dias :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 110861
          mmTop = 265
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'ppDBText6'
          DataField = 'NUMDIASPREVISTO'
          DataPipeline = bdeInfoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 127265
          mmTop = 265
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object ppDBText7: TppDBText
          UserName = 'ppDBText7'
          DataField = 'GRPCON'
          DataPipeline = bdeInfoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 168275
          mmTop = 529
          mmWidth = 47625
          BandType = 3
          GroupNo = 0
        end
        object ppDBText9: TppDBText
          UserName = 'ppDBText9'
          DataField = 'GRPCON'
          DataPipeline = bdeInfoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 168275
          mmTop = 6879
          mmWidth = 47625
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'ppLabel14'
          Caption = 'Grupo de Gestores :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 137319
          mmTop = 529
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'ppLabel15'
          Caption = 'Grupo para Consulta :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 135467
          mmTop = 6879
          mmWidth = 31485
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'ppLabel17'
          Caption = 'Etapas do Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3969
          mmLeft = 265
          mmTop = 22754
          mmWidth = 30427
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'ppLabel19'
          Caption = 'Etapa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 794
          mmTop = 28310
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'ppLine5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 26988
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'ppLine7'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 32808
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object RptInfoProcLabel1: TppLabel
          UserName = 'RptInfoProcLabel1'
          Caption = 'Sistema de Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 97367
          mmTop = 28310
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
        end
        object RptInfoProcLabel2: TppLabel
          UserName = 'RptInfoProcLabel2'
          Caption = 'Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 178594
          mmTop = 28310
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object RptInfoProcLabel3: TppLabel
          UserName = 'RptInfoProcLabel3'
          Caption = 'Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 190765
          mmTop = 28310
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object RptInfoProcLabel4: TppLabel
          UserName = 'RptInfoProcLabel4'
          Caption = 'Nº de Dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 201348
          mmTop = 28310
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object RptInfoProcLabel5: TppLabel
          UserName = 'RptInfoProcLabel5'
          Caption = 'Grupo de Autorização'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 19315
          mmTop = 28310
          mmWidth = 31485
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'IDTIPOETAPA'
      DataPipeline = bdeInfoProc
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppDBText2: TppDBText
          UserName = 'ppDBText2'
          DataField = 'NOMEETAPA'
          DataPipeline = bdeInfoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 265
          mmTop = 0
          mmWidth = 95250
          BandType = 3
          GroupNo = 1
        end
        object RptInfoProcDBText1: TppDBText
          UserName = 'RptInfoProcDBText1'
          DataField = 'NOMEMODULO'
          DataPipeline = bdeInfoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 97367
          mmTop = 0
          mmWidth = 79375
          BandType = 3
          GroupNo = 1
        end
        object RptInfoProcDBText2: TppDBText
          UserName = 'RptInfoProcDBText2'
          DataField = 'INICIAL'
          DataPipeline = bdeInfoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 178594
          mmTop = 0
          mmWidth = 8202
          BandType = 3
          GroupNo = 1
        end
        object RptInfoProcDBText3: TppDBText
          UserName = 'RptInfoProcDBText3'
          DataField = 'FINAL'
          DataPipeline = bdeInfoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 190765
          mmTop = 0
          mmWidth = 6879
          BandType = 3
          GroupNo = 1
        end
        object RptInfoProcDBText4: TppDBText
          UserName = 'RptInfoProcDBText4'
          DataField = 'NUMDIAPREVETAPA'
          DataPipeline = bdeInfoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 200819
          mmTop = 0
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object bdeGrpRespon: TppBDEPipeline
    DataSource = dsGrpRespon
    UserName = 'bdeGrpRespon'
    Left = 381
    Top = 52
  end
  object dsGrpRespon: TwwDataSource
    DataSet = qryGrpRespon
    Left = 381
    Top = 37
  end
  object qryGrpRespon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     GRP.IDGRPRESPON,   '
      '     GRP.NOME,'
      '     USU.NOMEUSUARIO   '
      'FROM'
      '     RADRESPONXGRP GXU,'
      '     RADGRPRESPON GRP,'
      '     USUARIOSISTEMA USU'
      'WHERE'
      '       (GXU.IDGRPRESPON = GRP.IDGRPRESPON)'
      '   AND (GXU.IDUSUARIO   = USU.IDUSUARIO)'
      'ORDER BY GRP.NOME, USU.NOMEUSUARIO'
      '')
    ValidateWithMask = True
    Left = 381
    Top = 24
  end
  object RptGrpRespon: TppReport
    AutoStop = False
    DataPipeline = bdeGrpRespon
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    Left = 381
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24871
      mmPrintPosition = 0
      object ppLabel10: TppLabel
        UserName = 'ppLabel10'
        Caption = 'Grupo de Responsabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 71438
        mmTop = 8731
        mmWidth = 56356
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'ppLine8'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24606
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel20: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel20'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84138
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object RptGrpResponLabel1: TppLabel
        UserName = 'RptGrpResponLabel1'
        Caption = 'Grupo de Responsabilidade :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 15346
        mmWidth = 41804
        BandType = 0
      end
      object LbGrpRespon: TppLabel
        UserName = 'LbGrpRespon'
        Caption = ' TODOS '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 15346
        mmWidth = 11113
        BandType = 0
      end
      object RptGrpResponLabel2: TppLabel
        UserName = 'RptGrpResponLabel2'
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 20373
        mmWidth = 8996
        BandType = 0
      end
      object RptGrpResponLabel3: TppLabel
        UserName = 'RptGrpResponLabel3'
        Caption = 'Usuários'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 66411
        mmTop = 20373
        mmWidth = 12965
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object RptGrpResponDBText2: TppDBText
        UserName = 'RptGrpResponDBText2'
        DataField = 'NOMEUSUARIO'
        DataPipeline = bdeGrpRespon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 66411
        mmTop = 0
        mmWidth = 31750
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine9: TppLine
        UserName = 'ppLine9'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel21: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel21'
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
        mmWidth = 55298
        BandType = 8
      end
      object ppCalc7: TppSystemVariable
        UserName = 'Calc7'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 68263
        mmTop = 529
        mmWidth = 61119
        BandType = 8
      end
      object ppCalc8: TppSystemVariable
        UserName = 'Calc8'
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
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptGrpResponGroup1: TppGroup
      BreakName = 'IDGRPRESPON'
      DataPipeline = bdeGrpRespon
      UserName = 'RptGrpResponGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptGrpResponGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object RptGrpResponDBText1: TppDBText
          UserName = 'RptGrpResponDBText1'
          DataField = 'NOME'
          DataPipeline = bdeGrpRespon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 794
          mmTop = 529
          mmWidth = 47625
          BandType = 3
          GroupNo = 0
        end
        object RptGrpResponLine1: TppLine
          UserName = 'RptGrpResponLine1'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 5027
          mmWidth = 112713
          BandType = 3
          GroupNo = 0
        end
      end
      object RptGrpResponGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object bdeGrpAut: TppBDEPipeline
    DataSource = dsGrpAut
    UserName = 'bdeGrpAut'
    Left = 37
    Top = 146
  end
  object dsGrpAut: TwwDataSource
    DataSet = qryGrpAut
    Left = 37
    Top = 133
  end
  object qryGrpAut: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      AUT.IDGRUPOAUTORIZA,'
      '      AUT.NUMAUTORIZACAO,'
      '      GA.NOMEGRUPOAUT,    '
      '      AUT.VALORAUTORIZA,'
      '      CC.NOME,'
      '      GP.DESCGRUPOPROD,'
      '      CR.NOME AS DESCCENTRESP,'
      '      UN.NOME AS DESCUNIDNEG,'
      '      GRP.NOME AS DESCGRPRESPON'
      'FROM'
      '    RADGRAUTXGRRESPON AUT,'
      '    RADGRUPOAUTORIZA GA,'
      '    CENTCUST CC,'
      '    GRUPPROD GP,'
      '    CENTRESPON CR,'
      '    UNIDNEGOCIO UN,'
      '    RADGRPRESPON GRP'
      'WHERE'
      '        ( AUT.IDGRUPOAUTORIZA = GA.IDGRUPOAUTORIZA)'
      '    AND ( AUT.IDEMPRESA = CC.IDEMPRESA(+))'
      '    AND ( AUT.IDPESSOA = CR.IDPESSOA(+))'
      '    AND ( AUT.IDPESSOA = UN.IDPESSOA(+))'
      '    AND ( AUT.IDGRPRESPON = GRP.IDGRPRESPON)'
      '    AND ( AUT.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '    AND ( AUT.CODGRUPOPROD = GP.CODGRUPOPROD(+))'
      '    AND ( AUT.CODCENTRORESPON = CR.CODCENTRORESPON(+))'
      '    AND ( AUT.UNIDNEGOC = UN.UNIDNEGOC(+))')
    ValidateWithMask = True
    Left = 37
    Top = 120
  end
  object RptGrpAut: TppReport
    AutoStop = False
    DataPipeline = bdeGrpAut
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 37
    Top = 106
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26723
      mmPrintPosition = 0
      object ppLabel22: TppLabel
        UserName = 'ppLabel22'
        Caption = 'Grupo de Autorização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 120121
        mmTop = 8731
        mmWidth = 44186
        BandType = 0
      end
      object ppLabel23: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel23'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127265
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'ppLabel24'
        Caption = 'Grupo de Autorização:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 15346
        mmWidth = 32279
        BandType = 0
      end
      object LbGrpAut: TppLabel
        UserName = 'LbGrpAut'
        Caption = ' TODOS '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 33602
        mmTop = 15346
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'ppLabel27'
        Caption = 'Grupo de Responsabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 21960
        mmWidth = 40217
        BandType = 0
      end
      object RptGrpAutLine1: TppLine
        UserName = 'RptGrpAutLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 20373
        mmWidth = 284300
        BandType = 0
      end
      object RptGrpAutLabel1: TppLabel
        UserName = 'RptGrpAutLabel1'
        Caption = 'Centro de Responsabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 48419
        mmTop = 21960
        mmWidth = 41275
        BandType = 0
      end
      object RptGrpAutLabel2: TppLabel
        UserName = 'RptGrpAutLabel2'
        Caption = 'Centro de  Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 97631
        mmTop = 21960
        mmWidth = 24871
        BandType = 0
      end
      object RptGrpAutLabel3: TppLabel
        UserName = 'RptGrpAutLabel3'
        Caption = 'Atividade / Projeto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 146579
        mmTop = 21960
        mmWidth = 26458
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'ppLine10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26458
        mmWidth = 284300
        BandType = 0
      end
      object RptGrpAutLabel4: TppLabel
        UserName = 'RptGrpAutLabel4'
        Caption = 'Grupo de Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 187590
        mmTop = 21960
        mmWidth = 25929
        BandType = 0
      end
      object RptGrpAutLabel5: TppLabel
        UserName = 'RptGrpAutLabel5'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 244475
        mmTop = 21960
        mmWidth = 7673
        BandType = 0
      end
      object RptGrpAutLabel6: TppLabel
        UserName = 'RptGrpAutLabel6'
        Caption = 'Nº Aut.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 260086
        mmTop = 21960
        mmWidth = 9525
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object RptGrpAutDBText2: TppDBText
        UserName = 'RptGrpAutDBText2'
        DataField = 'DESCGRPRESPON'
        DataPipeline = bdeGrpAut
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 0
        mmWidth = 47625
        BandType = 4
      end
      object RptGrpAutDBText3: TppDBText
        UserName = 'RptGrpAutDBText3'
        DataField = 'DESCCENTRESP'
        DataPipeline = bdeGrpAut
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 48419
        mmTop = 0
        mmWidth = 47625
        BandType = 4
      end
      object RptGrpAutDBText4: TppDBText
        UserName = 'RptGrpAutDBText4'
        DataField = 'NOME'
        DataPipeline = bdeGrpAut
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 97631
        mmTop = 0
        mmWidth = 47625
        BandType = 4
      end
      object RptGrpAutDBText5: TppDBText
        UserName = 'RptGrpAutDBText5'
        DataField = 'DESCUNIDNEG'
        DataPipeline = bdeGrpAut
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 146579
        mmTop = 0
        mmWidth = 39688
        BandType = 4
      end
      object RptGrpAutDBText6: TppDBText
        UserName = 'RptGrpAutDBText6'
        DataField = 'DESCGRUPOPROD'
        DataPipeline = bdeGrpAut
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 187061
        mmTop = 0
        mmWidth = 47625
        BandType = 4
      end
      object RptGrpAutDBText7: TppDBText
        UserName = 'RptGrpAutDBText7'
        DataField = 'VALORAUTORIZA'
        DataPipeline = bdeGrpAut
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 236273
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object RptGrpAutDBText8: TppDBText
        UserName = 'RptGrpAutDBText8'
        DataField = 'NUMAUTORIZACAO'
        DataPipeline = bdeGrpAut
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 253736
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine11: TppLine
        UserName = 'ppLine11'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel28: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel28'
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
        mmWidth = 55298
        BandType = 8
      end
      object ppCalc9: TppSystemVariable
        UserName = 'Calc9'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 111654
        mmTop = 529
        mmWidth = 61119
        BandType = 8
      end
      object ppCalc10: TppSystemVariable
        UserName = 'ppCalc101'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 243946
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptGrpAutGroup1: TppGroup
      BreakName = 'IDGRUPOAUTORIZA'
      DataPipeline = bdeGrpAut
      UserName = 'RptGrpAutGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptGrpAutGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object RptGrpAutDBText1: TppDBText
          UserName = 'RptGrpAutDBText1'
          AutoSize = True
          DataField = 'NOMEGRUPOAUT'
          DataPipeline = bdeGrpAut
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 11113
          mmTop = 1588
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object RptGrpAutLine2: TppLine
          UserName = 'RptGrpAutLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 5821
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel26: TppLabel
          UserName = 'ppLabel26'
          Caption = 'Grupo :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 1588
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
      end
      object RptGrpAutGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object bdeTipoEtapa: TppBDEPipeline
    DataSource = dsTipoEtapa
    UserName = 'bdeTipoEtapa'
    Left = 117
    Top = 148
  end
  object dsTipoEtapa: TwwDataSource
    DataSet = qryTipoEtapa
    Left = 117
    Top = 133
  end
  object qryTipoEtapa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDTIPOETAPA,'
      '     NOME,'
      '     DECODE(FLGAUTOMATICA,'#39'S'#39','#39' X '#39','#39#39') AS AUTOMATICO,'
      '     DECODE(FLGAUTORIZACAO,'#39'S'#39','#39' X '#39','#39#39') AS AUTORIZA,'
      '     DESCRICAO'
      'FROM'
      '     RADTIPOETAPA'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 117
    Top = 120
  end
  object RptTipoEtapa: TppReport
    AutoStop = False
    DataPipeline = bdeTipoEtapa
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    Left = 117
    Top = 106
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 22490
      mmPrintPosition = 0
      object ppLabel25: TppLabel
        UserName = 'ppLabel25'
        Caption = 'Tipo de Etapa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 84667
        mmTop = 8731
        mmWidth = 27781
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'ppLine12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 22225
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel29: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel29'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84138
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'ppLabel32'
        Caption = 'Tipo de Etapa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 17992
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'ppLabel33'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 97631
        mmTop = 17992
        mmWidth = 14288
        BandType = 0
      end
      object RptTipoEtapaLabel1: TppLabel
        UserName = 'RptTipoEtapaLabel1'
        Caption = 'Autom.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 168275
        mmTop = 17992
        mmWidth = 11377
        BandType = 0
      end
      object RptTipoEtapaLabel2: TppLabel
        UserName = 'RptTipoEtapaLabel2'
        Caption = 'Autorz..'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 181505
        mmTop = 17992
        mmWidth = 11377
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object RptTipoEtapaDBText1: TppDBText
        UserName = 'RptTipoEtapaDBText1'
        DataField = 'NOME'
        DataPipeline = bdeTipoEtapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 265
        mmWidth = 95250
        BandType = 4
      end
      object RptTipoEtapaDBMemo1: TppDBMemo
        UserName = 'RptTipoEtapaDBMemo1'
        CharWrap = True
        DataField = 'DESCRICAO'
        DataPipeline = bdeTipoEtapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 17727
        mmLeft = 97102
        mmTop = 0
        mmWidth = 70379
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object RptTipoEtapaDBText2: TppDBText
        UserName = 'RptTipoEtapaDBText2'
        DataField = 'AUTOMATICO'
        DataPipeline = bdeTipoEtapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 168275
        mmTop = 0
        mmWidth = 11377
        BandType = 4
      end
      object RptTipoEtapaDBText3: TppDBText
        UserName = 'RptTipoEtapaDBText3'
        DataField = 'AUTORIZA'
        DataPipeline = bdeTipoEtapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 180975
        mmTop = 0
        mmWidth = 11377
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine13: TppLine
        UserName = 'ppLine13'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel34: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel34'
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
        mmWidth = 55298
        BandType = 8
      end
      object ppCalc11: TppSystemVariable
        UserName = 'Calc11'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 68263
        mmTop = 529
        mmWidth = 61119
        BandType = 8
      end
      object ppCalc12: TppSystemVariable
        UserName = 'Calc12'
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
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object qryProc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       IDTIPOPROCESSO,'
      '       NOME'
      'FROM'
      '      RADTIPOPROCESSO'
      'WHERE'
      '     ( IDGRPGESTOR  IN ( SELECT IDGRPRESPON'
      '                          FROM RADRESPONXGRP'
      '                          WHERE (IDUSUARIO = :IDUSUARIO) ) )'
      'UNION'
      'SELECT'
      '       IDTIPOPROCESSO,'
      '       NOME'
      'FROM'
      '      RADTIPOPROCESSO'
      'WHERE'
      '     ( IDGRPCONSULTA  IN ( SELECT'
      '                                AXP.IDGRUPOAUTORIZA'
      '                           FROM'
      '                                RADRESPONXGRP GR,'
      '                                RADGRAUTXGRRESPON  AXP'
      '                           WHERE'
      '                                (GR.IDUSUARIO = :IDUSUARIO)'
      
        '                            AND (GR.IDGRPRESPON = AXP.IDGRPRESPO' +
        'N)'
      '                           GROUP BY AXP.IDGRUPOAUTORIZA) )'
      'ORDER BY NOME'
      '')
    ValidateWithMask = True
    Left = 424
    Top = 228
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end>
    object qryProcIDTIPOPROCESSO: TFloatField
      FieldName = 'IDTIPOPROCESSO'
    end
    object qryProcNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
end
