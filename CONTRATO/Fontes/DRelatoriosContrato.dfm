inherited dtmRelatoriosContrato: TdtmRelatoriosContrato
  Left = 266
  Top = 201
  Width = 528
  Height = 146
  Caption = 'dtmRelatoriosContrato'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 24
    Top = 48
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
    Top = 32
  end
  inherited qryExemplo: TwwQuery
    Left = 24
  end
  inherited rpExemplo: TppReport
    Left = 24
    Top = 0
    DataPipelineName = 'pplExemplo'
  end
  object qryAlteraContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATO,'
      '   C.NOMECONTRATO,'
      '   C.IDFORCLI,'
      '   P.NOME NOMEFORCLI,'
      '   C.IDRESPONSAVEL,'
      '   RS.NOME NOMERESP,'
      '   C.DATAASSINATURA,'
      '   C.DATABASECONTRATO,'
      '   C.DATAPREVENCERRA,'
      '   C.DATAEFETENCERRA,'
      '   OI.IDITEM,'
      '   I.NOME_ITEM,'
      '   OI.IDOBJETO,'
      '   O.NOMEOBJETO,'
      '   OI.DATABASEITEM,'
      '   OI.MOECODIGO,'
      '   M.MOEDESC,'
      '   OI.QTDEITEM,'
      '   OI.VALORUNITARIOOBJETO,'
      '   OI.VALORTOTALOBJETO,'
      '   OI.DATAINICIOCOBR,'
      '   OI.OBSERVACAO,'
      '   C.VALORBASECONTRATO,'
      '   DECODE (C.TIPOCONTRATO,'#39'P'#39','#39'A Pagar'#39','#39'R'#39','#39'A Receber'#39') TIPOC,'
      
        '   DECODE (OI.FREQUENCIA,'#39'M'#39','#39'mensal'#39','#39'U'#39','#39'unica'#39','#39'D'#39','#39'diaria'#39','#39 +
        'A'#39','#39'anual'#39') FREQ,'
      
        '   DECODE (i.tipocobranca, '#39'PQ'#39','#39'Sim'#39','#39'PV'#39','#39'Sim'#39','#39'EQ'#39','#39'Sim'#39','#39'EV'#39 +
        ','#39'Sim'#39','#39'AQ'#39','#39'Sim'#39','#39'AV'#39','#39'Sim'#39','#39'Nao'#39') TPCOB,'
      '   R.PERCRATEIOCONTR,'
      '   CC.NOME NOMECC,'
      '   ADT.DATAASSADITAMENTO AS DATAADITAMENTO'
      ''
      'FROM'
      '   CONTRATOORIG C,'
      '   OBJXITORIG OI,'
      '   OBJETOCONTRATUAL O,'
      '   ITEMCONTRATUAL I,'
      '   RATEIOCENTROCUSTO R,'
      '   CENTCUST CC,'
      '   PESSOA P,'
      '   PESSOA RS,'
      '   MOEDA M,'
      '   CONTRATOUSUARIO CXU,'
      ''
      '   (SELECT AD1.DATAASSADITAMENTO,'
      '           AD1.IDCONTRATO'
      '    FROM ADITAMENTO AD1'
      '    WHERE (AD1.IDADITAMENTO=(SELECT MAX(AD2.IDADITAMENTO)'
      '                             FROM ADITAMENTO AD2'
      
        '                             WHERE (AD2.IDCONTRATO= AD1.IDCONTRA' +
        'TO)))) ADT'
      'WHERE'
      '      (C.IDFORCLI = P.IDPESSOA(+))'
      '  AND (C.IDRESPONSAVEL = RS.IDPESSOA(+))'
      '  AND (C.IDCONTRATO = OI.IDCONTRATO(+))'
      '  AND (C.IDCONTRATO = ADT.IDCONTRATO(+))'
      '  AND (OI.IDITEM = I.IDITEM(+))'
      '  AND (OI.IDOBJETO = O.IDOBJETO(+))'
      '  AND (OI.MOECODIGO = M.MOECODIGO(+))'
      '  AND (OI.IDCONTRATO = R.IDCONTRATO(+))'
      '  AND (OI.IDOBJETO = R.IDOBJETO(+))'
      '  AND (OI.IDITEM = R.IDITEM(+))'
      '  AND (R.IDEMPRESA = CC.IDEMPRESA(+))'
      '  AND (R.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '  AND (CXU.IDCONTRATO = C.IDCONTRATO)'
      '  AND (CXU.IDUSUARIO = :IDUSUARIO)'
      '  AND (C.IDPESSOA = :IDPESSOA)'
      '  AND ((:IDCONTRATO IS NULL) OR (C.IDCONTRATO = :IDCONTRATO))'
      
        '  AND ((:FLGCONTRATO IS NULL) OR ((RTRIM(C.FLGFIMCONTRATO) = :TI' +
        'POCONTRATO) OR ('#39'TODOS'#39' = :FLGCONTRATO)))'
      
        '  AND ((:DTINICIO IS NULL) OR ((C.DATAASSINATURA  BETWEEN :DTINI' +
        'CIO AND :DTFIM) OR ('#39'DTASS'#39' <> :TIPODATA)))'
      
        '  AND ((:TIPODATA IS NULL) OR ((C.DATAPREVENCERRA BETWEEN :DTINI' +
        'CIO AND :DTFIM) OR ('#39'DTVNC'#39' <> :TIPODATA))) '
      
        '  AND ((:FLGDATAENC IS NULL) OR ((C.DATAPREVENCERRA IS NOT NULL)' +
        ' OR ('#39'DTVENCD'#39' <> :FLGDATAENC)))'
      
        '  AND ((:FLGDATAENC IS NULL) OR ((C.DATAPREVENCERRA IS NULL) OR ' +
        '('#39'DTVENCI'#39' <> :FLGDATAENC)))'
      
        'ORDER BY C.NOMECONTRATO, C.IDCONTRATO, O.NOMEOBJETO, I.NOME_ITEM' +
        ', CC.NOME'
      ''
      ' ')
    ValidateWithMask = True
    Left = 103
    Top = 53
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDUSUARIO'
        ParamType = ptInput
        Value = '54790'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FLGCONTRATO'
        ParamType = ptInput
        Value = 'TODOS'
      end
      item
        DataType = ftString
        Name = 'TIPOCONTRATO'
        ParamType = ptInput
        Value = '_'
      end
      item
        DataType = ftString
        Name = 'FLGCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DTINICIO'
        ParamType = ptUnknown
        Value = '30/12/1899'
      end
      item
        DataType = ftDate
        Name = 'DTINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DTFIM'
        ParamType = ptUnknown
        Value = '30/12/1899'
      end
      item
        DataType = ftString
        Name = 'TIPODATA'
        ParamType = ptInput
        Value = '_'
      end
      item
        DataType = ftString
        Name = 'TIPODATA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DTINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPODATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGDATAENC'
        ParamType = ptInput
        Value = 'TODAS'
      end
      item
        DataType = ftString
        Name = 'FLGDATAENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGDATAENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGDATAENC'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      FieldName = 'NOMECONTRATO'
      Size = 60
    end
    object FloatField1: TFloatField
      FieldName = 'IDFORCLI'
    end
    object StringField2: TStringField
      FieldName = 'NOMEFORCLI'
      Size = 60
    end
    object FloatField2: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object StringField3: TStringField
      FieldName = 'NOMERESP'
      Size = 60
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DATABASECONTRATO'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DATAPREVENCERRA'
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'DATAEFETENCERRA'
    end
    object FloatField3: TFloatField
      FieldName = 'IDITEM'
    end
    object StringField4: TStringField
      FieldName = 'NOME_ITEM'
      Size = 200
    end
    object FloatField4: TFloatField
      FieldName = 'IDOBJETO'
    end
    object StringField5: TStringField
      FieldName = 'NOMEOBJETO'
      Size = 200
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'DATABASEITEM'
    end
    object FloatField5: TFloatField
      FieldName = 'MOECODIGO'
    end
    object StringField6: TStringField
      FieldName = 'MOEDESC'
    end
    object FloatField6: TFloatField
      FieldName = 'QTDEITEM'
    end
    object FloatField7: TFloatField
      FieldName = 'VALORUNITARIOOBJETO'
    end
    object FloatField8: TFloatField
      FieldName = 'VALORTOTALOBJETO'
    end
    object DateTimeField6: TDateTimeField
      FieldName = 'DATAINICIOCOBR'
    end
    object StringField7: TStringField
      FieldName = 'OBSERVACAO'
      Size = 250
    end
    object FloatField9: TFloatField
      FieldName = 'VALORBASECONTRATO'
    end
    object StringField8: TStringField
      FieldName = 'TIPOC'
      Size = 9
    end
    object StringField9: TStringField
      FieldName = 'FREQ'
      Size = 6
    end
    object StringField10: TStringField
      FieldName = 'TPCOB'
      Size = 3
    end
    object FloatField10: TFloatField
      FieldName = 'PERCRATEIOCONTR'
    end
    object StringField11: TStringField
      FieldName = 'NOMECC'
      Size = 30
    end
    object DateTimeField7: TDateTimeField
      FieldName = 'DATAADITAMENTO'
    end
    object qryAlteraContratoIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
    end
  end
  object dsAlteraContrato: TwwDataSource
    DataSet = qryAlteraContrato
    Left = 103
    Top = 37
  end
  object pplAlteraContrato: TppBDEPipeline
    DataSource = dsAlteraContrato
    SkipWhenNoRecords = False
    UserName = 'lContratos1'
    Left = 103
    Top = 21
  end
  object rpAlteraContrato: TppReport
    AutoStop = False
    DataPipeline = pplAlteraContrato
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
    Left = 103
    Top = 5
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplAlteraContrato'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'ppLabel7'
        Caption = 'Relatório de Alterações Contratuais'
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
        mmWidth = 72231
        BandType = 0
      end
      object pplNomeEmpresa: TppLabel
        UserName = 'rpNomeEmpresa'
        Caption = 'Nome Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 123561
        mmTop = 1852
        mmWidth = 35719
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'rpContratosLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16670
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'rpContratosDBText17'
        DataField = 'NOMECC'
        DataPipeline = pplAlteraContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAlteraContrato'
        mmHeight = 3704
        mmLeft = 18521
        mmTop = 794
        mmWidth = 106627
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'rpContratosDBText18'
        DataField = 'PERCRATEIOCONTR'
        DataPipeline = pplAlteraContrato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAlteraContrato'
        mmHeight = 3704
        mmLeft = 128059
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
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
        mmLeft = 265
        mmTop = 794
        mmWidth = 281782
        BandType = 8
      end
      object ppLabel11: TppLabel
        UserName = 'ppLabel9'
        AutoSize = False
        Caption = 'Contratos e Projetos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 794
        mmWidth = 249238
        BandType = 8
      end
      object ppLine12: TppLine
        UserName = 'rpContratosLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
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
        mmLeft = 248180
        mmTop = 794
        mmWidth = 33867
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppLabel12: TppLabel
        UserName = 'Label1'
        Caption = 'Total de Contratos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 265
        mmWidth = 32808
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'IDCONTRATO'
        DataPipeline = pplAlteraContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pplAlteraContrato'
        mmHeight = 4233
        mmLeft = 35454
        mmTop = 265
        mmWidth = 17198
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'NOMECONTRATO'
      DataPipeline = pplAlteraContrato
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'rpContratosGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAlteraContrato'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 4763
          mmLeft = 0
          mmTop = 1588
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'NOMECONTRATO'
      DataPipeline = pplAlteraContrato
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'rpContratosGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAlteraContrato'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 20373
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'rpContratosShape1'
          mmHeight = 6350
          mmLeft = 0
          mmTop = 265
          mmWidth = 284163
          BandType = 3
          GroupNo = 1
        end
        object ppDBText3: TppDBText
          UserName = 'rpContratosDBText1'
          DataField = 'NOMECONTRATO'
          DataPipeline = pplAlteraContrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplAlteraContrato'
          mmHeight = 4233
          mmLeft = 529
          mmTop = 1323
          mmWidth = 279401
          BandType = 3
          GroupNo = 1
        end
        object ppLabel13: TppLabel
          UserName = 'rpContratosLabel1'
          Caption = 'Datas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 11642
          mmWidth = 8731
          BandType = 3
          GroupNo = 1
        end
        object ppLabel14: TppLabel
          UserName = 'rpContratosLabel2'
          Caption = 'Assinatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 11377
          mmTop = 11642
          mmWidth = 14288
          BandType = 3
          GroupNo = 1
        end
        object ppDBText4: TppDBText
          UserName = 'rpContratosDBText2'
          DataField = 'DATAASSINATURA'
          DataPipeline = pplAlteraContrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAlteraContrato'
          mmHeight = 3704
          mmLeft = 10319
          mmTop = 16669
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object ppLabel15: TppLabel
          UserName = 'rpContratosLabel3'
          Caption = 'Base'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 28840
          mmTop = 11642
          mmWidth = 7673
          BandType = 3
          GroupNo = 1
        end
        object ppDBText5: TppDBText
          UserName = 'rpContratosDBText3'
          DataField = 'DATABASECONTRATO'
          DataPipeline = pplAlteraContrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAlteraContrato'
          mmHeight = 3704
          mmLeft = 29104
          mmTop = 16669
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object ppLabel16: TppLabel
          UserName = 'rpContratosLabel4'
          Caption = 'Prev.Encerram.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 47625
          mmTop = 11642
          mmWidth = 22225
          BandType = 3
          GroupNo = 1
        end
        object ppDBText6: TppDBText
          UserName = 'rpContratosDBText4'
          DataField = 'DATAPREVENCERRA'
          DataPipeline = pplAlteraContrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAlteraContrato'
          mmHeight = 3704
          mmLeft = 47625
          mmTop = 16669
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object ppLabel17: TppLabel
          UserName = 'rpContratosLabel5'
          Caption = 'Encerramento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 70115
          mmTop = 11642
          mmWidth = 18521
          BandType = 3
          GroupNo = 1
        end
        object ppDBText7: TppDBText
          UserName = 'rpContratosDBText5'
          DataField = 'DATAEFETENCERRA'
          DataPipeline = pplAlteraContrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAlteraContrato'
          mmHeight = 3704
          mmLeft = 70379
          mmTop = 16669
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object ppLabel18: TppLabel
          UserName = 'rpContratosLabel6'
          Caption = 'Gestor Responsável'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 92075
          mmTop = 11642
          mmWidth = 30163
          BandType = 3
          GroupNo = 1
        end
        object ppDBText8: TppDBText
          UserName = 'rpContratosDBText6'
          DataField = 'NOMERESP'
          DataPipeline = pplAlteraContrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAlteraContrato'
          mmHeight = 3704
          mmLeft = 92075
          mmTop = 16669
          mmWidth = 76994
          BandType = 3
          GroupNo = 1
        end
        object ppLabel19: TppLabel
          UserName = 'rpContratosLabel7'
          Caption = 'Contraparte (Fornecedor/Cliente)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 170127
          mmTop = 11642
          mmWidth = 48419
          BandType = 3
          GroupNo = 1
        end
        object ppDBText9: TppDBText
          UserName = 'rpContratosDBText7'
          DataField = 'NOMEFORCLI'
          DataPipeline = pplAlteraContrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAlteraContrato'
          mmHeight = 3704
          mmLeft = 170127
          mmTop = 16669
          mmWidth = 66675
          BandType = 3
          GroupNo = 1
        end
        object ppLabel37: TppLabel
          UserName = 'Label2'
          Caption = 'Informações Originais:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 6879
          mmWidth = 38629
          BandType = 3
          GroupNo = 1
        end
        object ppLabel20: TppLabel
          UserName = 'rpContratosLabel8'
          Caption = 'Valor Base Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 237861
          mmTop = 11642
          mmWidth = 29104
          BandType = 3
          GroupNo = 1
        end
        object ppDBText10: TppDBText
          UserName = 'rpContratosDBText8'
          DataField = 'VALORBASECONTRATO'
          DataPipeline = pplAlteraContrato
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAlteraContrato'
          mmHeight = 3704
          mmLeft = 237861
          mmTop = 16669
          mmWidth = 26194
          BandType = 3
          GroupNo = 1
        end
        object ppDBText11: TppDBText
          UserName = 'rpContratosDBText9'
          DataField = 'TIPOC'
          DataPipeline = pplAlteraContrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAlteraContrato'
          mmHeight = 3704
          mmLeft = 264848
          mmTop = 16669
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand3BeforePrint
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppSubReport1: TppSubReport
          UserName = 'SubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'pplAlteraAditamento'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = pplAlteraAditamento
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
            Left = 256
            Top = 104
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplAlteraAditamento'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 5556
              mmPrintPosition = 0
              object ppLabel30: TppLabel
                UserName = 'Label30'
                Caption = 'Aditamentos'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold, fsItalic]
                Transparent = True
                mmHeight = 4233
                mmLeft = 0
                mmTop = 1323
                mmWidth = 21431
                BandType = 1
              end
              object ppLine13: TppLine
                UserName = 'Line13'
                ParentWidth = True
                Weight = 0.75
                mmHeight = 1058
                mmLeft = 0
                mmTop = 529
                mmWidth = 284300
                BandType = 1
              end
            end
            object ppDetailBand5: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 7408
              mmPrintPosition = 0
              object ppDBText19: TppDBText
                UserName = 'DBText1'
                DataField = 'DATAASSADITAMENTO'
                DataPipeline = pplAlteraAditamento
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplAlteraAditamento'
                mmHeight = 3175
                mmLeft = 15610
                mmTop = 794
                mmWidth = 15875
                BandType = 4
              end
              object ppDBText20: TppDBText
                UserName = 'DBText2'
                DataField = 'CODADITAMENTO'
                DataPipeline = pplAlteraAditamento
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplAlteraAditamento'
                mmHeight = 3175
                mmLeft = 52388
                mmTop = 794
                mmWidth = 19050
                BandType = 4
              end
              object ppLabel35: TppLabel
                UserName = 'Label35'
                Caption = 'Data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 7408
                mmTop = 794
                mmWidth = 5821
                BandType = 4
              end
              object ppLabel36: TppLabel
                UserName = 'Label36'
                Caption = 'Processo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 35190
                mmTop = 794
                mmWidth = 12435
                BandType = 4
              end
              object ppDBMemo1: TppDBMemo
                UserName = 'DBMemo1'
                CharWrap = True
                DataField = 'DESCADITAMENTO'
                DataPipeline = pplAlteraAditamento
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Stretch = True
                Transparent = True
                DataPipelineName = 'pplAlteraAditamento'
                mmHeight = 6615
                mmLeft = 73290
                mmTop = 792
                mmWidth = 210609
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmLeading = 0
              end
            end
            object ppSummaryBand3: TppSummaryBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroup6: TppGroup
              BreakName = 'IDADITAMENTO'
              DataPipeline = pplAlteraAditamento
              KeepTogether = True
              OutlineSettings.CreateNode = True
              UserName = 'Group6'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'pplAlteraAditamento'
              object ppGroupHeaderBand6: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppGroupFooterBand6: TppGroupFooterBand
                PrintHeight = phDynamic
                mmBottomOffset = 0
                mmHeight = 1852
                mmPrintPosition = 0
                object ppLine2: TppLine
                  UserName = 'Line1'
                  ParentWidth = True
                  Weight = 0.75
                  mmHeight = 1058
                  mmLeft = 0
                  mmTop = 794
                  mmWidth = 284300
                  BandType = 5
                  GroupNo = 0
                end
              end
            end
            object ppGroup7: TppGroup
              BreakName = 'IDADITAMENTO'
              DataPipeline = pplAlteraAditamento
              KeepTogether = True
              OutlineSettings.CreateNode = True
              UserName = 'Group7'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'pplAlteraAditamento'
              object ppGroupHeaderBand7: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppGroupFooterBand7: TppGroupFooterBand
                BeforePrint = ppGroupFooterBand7BeforePrint
                PrintHeight = phDynamic
                mmBottomOffset = 0
                mmHeight = 5027
                mmPrintPosition = 0
                object ppSubReport2: TppSubReport
                  UserName = 'SubReport2'
                  ExpandAll = False
                  NewPrintJob = False
                  OutlineSettings.CreateNode = True
                  TraverseAllData = False
                  DataPipelineName = 'pplLogAditamento'
                  mmHeight = 5027
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 284300
                  BandType = 5
                  GroupNo = 1
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  object ppChildReport2: TppChildReport
                    AutoStop = False
                    DataPipeline = pplLogAditamento
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
                    Left = 328
                    Top = 176
                    Version = '7.04'
                    mmColumnWidth = 0
                    DataPipelineName = 'pplLogAditamento'
                    object ppTitleBand2: TppTitleBand
                      mmBottomOffset = 0
                      mmHeight = 529
                      mmPrintPosition = 0
                    end
                    object ppDetailBand6: TppDetailBand
                      mmBottomOffset = 0
                      mmHeight = 4233
                      mmPrintPosition = 0
                      object ppDBText23: TppDBText
                        UserName = 'DBText23'
                        DataField = 'DESCRICAO'
                        DataPipeline = pplLogAditamento
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = []
                        Transparent = True
                        DataPipelineName = 'pplLogAditamento'
                        mmHeight = 3175
                        mmLeft = 19315
                        mmTop = 529
                        mmWidth = 62971
                        BandType = 4
                      end
                      object ppDBText24: TppDBText
                        UserName = 'DBText24'
                        DataField = 'VLRANTERIOR'
                        DataPipeline = pplLogAditamento
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = []
                        Transparent = True
                        DataPipelineName = 'pplLogAditamento'
                        mmHeight = 3175
                        mmLeft = 88106
                        mmTop = 529
                        mmWidth = 70908
                        BandType = 4
                      end
                      object ppDBText25: TppDBText
                        UserName = 'DBText25'
                        DataField = 'VLRATUAL'
                        DataPipeline = pplLogAditamento
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = []
                        Transparent = True
                        DataPipelineName = 'pplLogAditamento'
                        mmHeight = 3175
                        mmLeft = 162984
                        mmTop = 529
                        mmWidth = 77523
                        BandType = 4
                      end
                    end
                    object ppSummaryBand4: TppSummaryBand
                      mmBottomOffset = 0
                      mmHeight = 0
                      mmPrintPosition = 0
                    end
                    object ppGroup5: TppGroup
                      BreakName = 'DSC_ITEM'
                      DataPipeline = pplLogAditamento
                      KeepTogether = True
                      OutlineSettings.CreateNode = True
                      UserName = 'Group5'
                      mmNewColumnThreshold = 0
                      mmNewPageThreshold = 0
                      DataPipelineName = 'pplLogAditamento'
                      object ppGroupHeaderBand5: TppGroupHeaderBand
                        mmBottomOffset = 0
                        mmHeight = 7408
                        mmPrintPosition = 0
                        object ppLabel31: TppLabel
                          UserName = 'Label31'
                          Caption = 'Item'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 8
                          Font.Style = [fsBold]
                          Transparent = True
                          mmHeight = 3175
                          mmLeft = 7673
                          mmTop = 0
                          mmWidth = 5556
                          BandType = 3
                          GroupNo = 0
                        end
                        object ppLabel32: TppLabel
                          UserName = 'Label32'
                          Caption = 'Informação Alterada'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 8
                          Font.Style = [fsBold]
                          Transparent = True
                          mmHeight = 3175
                          mmLeft = 19315
                          mmTop = 4233
                          mmWidth = 26723
                          BandType = 3
                          GroupNo = 0
                        end
                        object ppLabel33: TppLabel
                          UserName = 'Label33'
                          Caption = 'Valor Anterior'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 8
                          Font.Style = [fsBold]
                          Transparent = True
                          mmHeight = 3175
                          mmLeft = 88106
                          mmTop = 4233
                          mmWidth = 18521
                          BandType = 3
                          GroupNo = 0
                        end
                        object ppLabel34: TppLabel
                          UserName = 'Label34'
                          Caption = 'Valor Atual'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 8
                          Font.Style = [fsBold]
                          Transparent = True
                          mmHeight = 3175
                          mmLeft = 162984
                          mmTop = 4233
                          mmWidth = 14552
                          BandType = 3
                          GroupNo = 0
                        end
                        object ppDBText22: TppDBText
                          UserName = 'DBText22'
                          DataField = 'DSC_ITEM'
                          DataPipeline = pplLogAditamento
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 8
                          Font.Style = []
                          Transparent = True
                          DataPipelineName = 'pplLogAditamento'
                          mmHeight = 3175
                          mmLeft = 19315
                          mmTop = 529
                          mmWidth = 170392
                          BandType = 3
                          GroupNo = 0
                        end
                      end
                      object ppGroupFooterBand5: TppGroupFooterBand
                        mmBottomOffset = 0
                        mmHeight = 0
                        mmPrintPosition = 0
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'NOMEOBJETO'
      DataPipeline = pplAlteraContrato
      OutlineSettings.CreateNode = True
      UserName = 'rpContratosGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAlteraContrato'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 13758
        mmPrintPosition = 0
        object ppLabel21: TppLabel
          UserName = 'rpContratosLabel9'
          Caption = 'Serviços/Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2646
          mmTop = 794
          mmWidth = 24342
          BandType = 3
          GroupNo = 2
        end
        object ppDBText12: TppDBText
          UserName = 'rpContratosDBText10'
          DataField = 'NOMEOBJETO'
          DataPipeline = pplAlteraContrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAlteraContrato'
          mmHeight = 3704
          mmLeft = 2646
          mmTop = 5292
          mmWidth = 186267
          BandType = 3
          GroupNo = 2
        end
        object ppLabel22: TppLabel
          UserName = 'rpContratosLabel10'
          Caption = ' Itens Contratuais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 8731
          mmTop = 10054
          mmWidth = 23283
          BandType = 3
          GroupNo = 2
        end
        object ppLabel23: TppLabel
          UserName = 'rpContratosLabel11'
          Caption = ' Início Cobrança'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 135202
          mmTop = 10054
          mmWidth = 23019
          BandType = 3
          GroupNo = 2
        end
        object ppLabel24: TppLabel
          UserName = 'rpContratosLabel12'
          Caption = 'Valor Item/Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 159544
          mmTop = 10054
          mmWidth = 26458
          BandType = 3
          GroupNo = 2
        end
        object ppLabel25: TppLabel
          UserName = 'rpContratosLabel13'
          Caption = 'Medição ?'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 187855
          mmTop = 10054
          mmWidth = 14817
          BandType = 3
          GroupNo = 2
        end
        object ppLabel26: TppLabel
          UserName = 'rpContratosLabel14'
          Caption = 'Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 204259
          mmTop = 10054
          mmWidth = 16404
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NOME_ITEM'
      DataPipeline = pplAlteraContrato
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAlteraContrato'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8996
        mmPrintPosition = 0
        object ppDBText13: TppDBText
          UserName = 'rpContratosDBText11'
          DataField = 'NOME_ITEM'
          DataPipeline = pplAlteraContrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAlteraContrato'
          mmHeight = 3704
          mmLeft = 8731
          mmTop = 794
          mmWidth = 125942
          BandType = 3
          GroupNo = 3
        end
        object ppDBText14: TppDBText
          UserName = 'rpContratosDBText12'
          DataField = 'DATAINICIOCOBR'
          DataPipeline = pplAlteraContrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAlteraContrato'
          mmHeight = 3704
          mmLeft = 136790
          mmTop = 794
          mmWidth = 20902
          BandType = 3
          GroupNo = 3
        end
        object ppDBText15: TppDBText
          UserName = 'rpContratosDBText13'
          DataField = 'VALORUNITARIOOBJETO'
          DataPipeline = pplAlteraContrato
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAlteraContrato'
          mmHeight = 3704
          mmLeft = 162719
          mmTop = 794
          mmWidth = 14817
          BandType = 3
          GroupNo = 3
        end
        object ppDBText16: TppDBText
          UserName = 'rpContratosDBText14'
          DataField = 'TIPOC'
          DataPipeline = pplAlteraContrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplAlteraContrato'
          mmHeight = 3704
          mmLeft = 187590
          mmTop = 794
          mmWidth = 12965
          BandType = 3
          GroupNo = 3
        end
        object ppLabel28: TppLabel
          UserName = 'rpContratosLabel16'
          Caption = 'Rateio por Centro de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 16404
          mmTop = 5027
          mmWidth = 39688
          BandType = 3
          GroupNo = 3
        end
        object ppLabel29: TppLabel
          UserName = 'rpContratosLabel17'
          Caption = 'Percentual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 128059
          mmTop = 5292
          mmWidth = 15610
          BandType = 3
          GroupNo = 3
        end
        object ppDBText17: TppDBText
          UserName = 'rpContratosDBText15'
          DataField = 'QTDEITEM'
          DataPipeline = pplAlteraContrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAlteraContrato'
          mmHeight = 3704
          mmLeft = 203994
          mmTop = 794
          mmWidth = 7938
          BandType = 3
          GroupNo = 3
        end
        object ppLabel27: TppLabel
          UserName = 'rpContratosLabel15'
          Caption = 'parcela(s) a ser(em) paga(s) de forma'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 213784
          mmTop = 794
          mmWidth = 50536
          BandType = 3
          GroupNo = 3
        end
        object ppDBText18: TppDBText
          UserName = 'rpContratosDBText16'
          DataField = 'TPCOB'
          DataPipeline = pplAlteraContrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAlteraContrato'
          mmHeight = 3704
          mmLeft = 264584
          mmTop = 794
          mmWidth = 17198
          BandType = 3
          GroupNo = 3
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object pplAlteraAditamento: TppBDEPipeline
    DataSource = dsAlteraAditamento
    SkipWhenNoRecords = False
    UserName = 'lAditamentos1'
    Left = 198
    Top = 52
    MasterDataPipelineName = 'pplAlteraContrato'
    object TppMasterFieldLink
      MasterFieldName = 'IDCONTRATO'
      DetailFieldName = 'IDCONTRATO'
      DetailSortOrder = soAscending
    end
  end
  object dsAlteraAditamento: TwwDataSource
    DataSet = qryAlteraAditamento
    Left = 198
    Top = 36
  end
  object qryAlteraAditamento: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsAlteraContrato
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATO,'
      '   A.IDADITAMENTO,'
      '   C.NOMECONTRATO,'
      '   A.DATAASSADITAMENTO,'
      '   A.CODADITAMENTO,'
      '   A.DESCADITAMENTO'
      'FROM'
      '   CONTRATOORIG C,ADITAMENTO A'
      'WHERE'
      '   (C.IDCONTRATO = :IDCONTRATO) AND'
      '   (A.IDCONTRATO = C.IDCONTRATO) AND'
      '   (A.FLGTIPO IS NULL OR A.FLGTIPO = '#39'A'#39')'
      ''
      'ORDER BY'
      '   C.NOMECONTRATO,'
      '   C.IDCONTRATO,'
      '   A.DATAASSADITAMENTO,'
      '   A.CODADITAMENTO'
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 198
    Top = 20
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end>
    object qryAlteraAditamentoIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
      Origin = 'BASEDADOS.CONTRATOORIG.IDCONTRATO'
    end
    object qryAlteraAditamentoIDADITAMENTO: TFloatField
      FieldName = 'IDADITAMENTO'
      Origin = 'BASEDADOS.ADITAMENTO.IDADITAMENTO'
    end
    object qryAlteraAditamentoNOMECONTRATO: TStringField
      FieldName = 'NOMECONTRATO'
      Origin = 'BASEDADOS.CONTRATOORIG.NOMECONTRATO'
      Size = 60
    end
    object qryAlteraAditamentoDATAASSADITAMENTO: TDateTimeField
      FieldName = 'DATAASSADITAMENTO'
      Origin = 'BASEDADOS.ADITAMENTO.DATAASSADITAMENTO'
    end
    object qryAlteraAditamentoCODADITAMENTO: TStringField
      FieldName = 'CODADITAMENTO'
      Origin = 'BASEDADOS.ADITAMENTO.CODADITAMENTO'
      Size = 15
    end
    object qryAlteraAditamentoDESCADITAMENTO: TMemoField
      FieldName = 'DESCADITAMENTO'
      Origin = 'BASEDADOS.ADITAMENTO.DESCADITAMENTO'
      BlobType = ftMemo
      Size = 1000
    end
  end
  object pplLogAditamento: TppBDEPipeline
    DataSource = dsLogAditamento
    SkipWhenNoRecords = False
    UserName = 'lLogAditamento'
    Left = 294
    Top = 52
    MasterDataPipelineName = 'pplAlteraAditamento'
    object pplLogAditamentoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDADITAMENTO'
      FieldName = 'IDADITAMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplLogAditamentoppField2: TppField
      FieldAlias = 'DSC_ITEM'
      FieldName = 'DSC_ITEM'
      FieldLength = 200
      DisplayWidth = 200
      Position = 1
    end
    object pplLogAditamentoppField3: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 2
    end
    object pplLogAditamentoppField4: TppField
      FieldAlias = 'VLRANTERIOR'
      FieldName = 'VLRANTERIOR'
      FieldLength = 500
      DataType = dtMemo
      DisplayWidth = 10
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplLogAditamentoppField5: TppField
      FieldAlias = 'VLRATUAL'
      FieldName = 'VLRATUAL'
      FieldLength = 500
      DataType = dtMemo
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object TppMasterFieldLink
      MasterFieldName = 'IDADITAMENTO'
      DetailFieldName = 'IDADITAMENTO'
      DetailSortOrder = soAscending
    end
  end
  object dsLogAditamento: TwwDataSource
    DataSet = qryLogAditamento
    Left = 294
    Top = 36
  end
  object qryLogAditamento: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsAlteraAditamento
    SQL.Strings = (
      'SELECT L.IDADITAMENTO,'
      
        '       DECODE(L.IDITEM, NULL, '#39'Contrato'#39', I.NOME_ITEM) AS DSC_IT' +
        'EM,'
      
        '       DECODE(F.DESCRICAO, NULL, F.FIELDNAME, SUBSTR(F.DESCRICAO' +
        ',1,40) ) AS DESCRICAO,'
      '       L.VLRANTERIOR,'
      '       L.VLRATUAL'
      '  FROM LOGADITAMENTO L, ITEMCONTRATUAL I,'
      '       DDFIELD F'
      ' WHERE L.IDDDFIELD = F.IDDDFIELD'
      '   AND L.IDITEM = I.IDITEM(+)'
      '   AND L.IDADITAMENTO = :IDADITAMENTO'
      ' ORDER BY DSC_ITEM, DESCRICAO'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 294
    Top = 20
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDADITAMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryANS: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsAlteraContrato
    SQL.Strings = (
      
        'Select  c1.vlrmensal, c1.vlrans, c1.numci, c1.referencia, c1.obs' +
        ', c.nomecontrato, c.idcontrato '
      'from contratoans c1, contratocontr c '
      'where 1 = 2')
    ValidateWithMask = True
    Left = 454
    Top = 44
    object qryANSVLRMENSAL: TFloatField
      FieldName = 'VLRMENSAL'
      Origin = 'BASEDADOS.CONTRATOANS.VLRMENSAL'
    end
    object qryANSVLRANS: TFloatField
      FieldName = 'VLRANS'
      Origin = 'BASEDADOS.CONTRATOANS.VLRANS'
    end
    object qryANSNUMCI: TStringField
      FieldName = 'NUMCI'
      Origin = 'BASEDADOS.CONTRATOANS.NUMCI'
      Size = 30
    end
    object qryANSREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'BASEDADOS.CONTRATOANS.REFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryANSNOMECONTRATO: TStringField
      FieldName = 'NOMECONTRATO'
      Origin = 'BASEDADOS.CONTRATOCONTR.NOMECONTRATO'
      Size = 60
    end
    object mfldANSOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 500
    end
    object qryANSIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
      Origin = 'BASEDADOS.CONTRATOCONTR.IDCONTRATO'
    end
    object qryANSTOTPAGO: TFloatField
      FieldName = 'TOTPAGO'
    end
  end
  object dsANS: TwwDataSource
    DataSet = qryANS
    Left = 414
    Top = 44
  end
  object pplANS: TppBDEPipeline
    DataSource = dsANS
    SkipWhenNoRecords = False
    UserName = 'lANS'
    Left = 374
    Top = 44
    MasterDataPipelineName = 'pplAlteraContrato'
    object pplANSppField1: TppField
      FieldAlias = 'VLRMENSAL'
      FieldName = 'VLRMENSAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplANSppField2: TppField
      FieldAlias = 'VLRANS'
      FieldName = 'VLRANS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplANSppField3: TppField
      FieldAlias = 'NUMCI'
      FieldName = 'NUMCI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplANSppField4: TppField
      FieldAlias = 'REFERENCIA'
      FieldName = 'REFERENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplANSppField5: TppField
      FieldAlias = 'OBS'
      FieldName = 'OBS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplANSppField6: TppField
      FieldAlias = 'NOMECONTRATO'
      FieldName = 'NOMECONTRATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object TppMasterFieldLink
      MasterFieldName = 'IDCONTRATO'
      DetailFieldName = 'IDCONTRATO'
      DetailSortOrder = soAscending
    end
  end
  object rpANS: TppReport
    AutoStop = False
    DataPipeline = pplANS
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 376
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pplANS'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33867
      mmPrintPosition = 0
      object pplblTitulo: TppLabel
        UserName = 'lblTitulo'
        Caption = 'Detalhamento Aplicação de Penalidade (ANS)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 49213
        mmTop = 18785
        mmWidth = 91546
        BandType = 0
      end
      object pplblNomeEmpresa: TppLabel
        UserName = 'lblNomeEmpresa'
        Caption = 'FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 39158
        mmTop = 1588
        mmWidth = 108479
        BandType = 0
      end
      object pplblLocal01: TppLabel
        UserName = 'lblLocal01'
        Caption = 
          'SNC, Quadra 2, Bloco A Edifício Corporate Financial Center 11, 1' +
          '2 e 13 Andares'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 42598
        mmTop = 7938
        mmWidth = 101336
        BandType = 0
      end
      object pplblLocal02: TppLabel
        UserName = 'lblLocal02'
        Caption = 
          'Brasília - DF CEP 70.712-900 - (061) 3329 -1700 - www.funcef.com' +
          '.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 47361
        mmTop = 11642
        mmWidth = 91811
        BandType = 0
      end
      object ppimgLogo: TppImage
        UserName = 'imgLogo'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          0A544A504547496D616765DC680000FFD8FFE000104A46494600010101006000
          600000FFE1005C4578696600004D4D002A000000080004030200020000001600
          00003E511000010000000101000000511100040000000100002E235112000400
          00000100002E230000000050686F746F73686F70204943432070726F66696C65
          00FFE20C584943435F50524F46494C4500010100000C484C696E6F021000006D
          6E74725247422058595A2007CE00020009000600310000616373704D53465400
          00000049454320735247420000000000000000000000010000F6D60001000000
          00D32D4850202000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000011637072740000015000
          00003364657363000001840000006C77747074000001F000000014626B707400
          000204000000147258595A00000218000000146758595A0000022C0000001462
          58595A0000024000000014646D6E640000025400000070646D6464000002C400
          000088767565640000034C0000008676696577000003D4000000246C756D6900
          0003F8000000146D6561730000040C0000002474656368000004300000000C72
          5452430000043C0000080C675452430000043C0000080C625452430000043C00
          00080C7465787400000000436F70797269676874202863292031393938204865
          776C6574742D5061636B61726420436F6D70616E790000646573630000000000
          000012735247422049454336313936362D322E31000000000000000000000012
          735247422049454336313936362D322E31000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000058595A20000000000000F35100010000000116CC58595A200000000000
          000000000000000000000058595A200000000000006FA2000038F50000039058
          595A2000000000000062990000B785000018DA58595A2000000000000024A000
          000F840000B6CF64657363000000000000001649454320687474703A2F2F7777
          772E6965632E636800000000000000000000001649454320687474703A2F2F77
          77772E6965632E63680000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000646573630000000000
          00002E4945432036313936362D322E312044656661756C742052474220636F6C
          6F7572207370616365202D207352474200000000000000000000002E49454320
          36313936362D322E312044656661756C742052474220636F6C6F757220737061
          6365202D20735247420000000000000000000000000000000000000000000064
          657363000000000000002C5265666572656E63652056696577696E6720436F6E
          646974696F6E20696E2049454336313936362D322E3100000000000000000000
          002C5265666572656E63652056696577696E6720436F6E646974696F6E20696E
          2049454336313936362D322E3100000000000000000000000000000000000000
          0000000000000076696577000000000013A4FE00145F2E0010CF140003EDCC00
          04130B00035C9E0000000158595A2000000000004C09560050000000571FE76D
          6561730000000000000001000000000000000000000000000000000000028F00
          0000027369672000000000435254206375727600000000000004000000000500
          0A000F00140019001E00230028002D00320037003B00400045004A004F005400
          59005E00630068006D00720077007C00810086008B00900095009A009F00A400
          A900AE00B200B700BC00C100C600CB00D000D500DB00E000E500EB00F000F600
          FB01010107010D01130119011F0125012B01320138013E0145014C0152015901
          600167016E0175017C0183018B0192019A01A101A901B101B901C101C901D101
          D901E101E901F201FA0203020C0214021D0226022F02380241024B0254025D02
          670271027A0284028E029802A202AC02B602C102CB02D502E002EB02F5030003
          0B03160321032D03380343034F035A03660372037E038A039603A203AE03BA03
          C703D303E003EC03F9040604130420042D043B0448045504630471047E048C04
          9A04A804B604C404D304E104F004FE050D051C052B053A054905580567057705
          86059605A605B505C505D505E505F6060606160627063706480659066A067B06
          8C069D06AF06C006D106E306F507070719072B073D074F076107740786079907
          AC07BF07D207E507F8080B081F08320846085A086E0882089608AA08BE08D208
          E708FB09100925093A094F09640979098F09A409BA09CF09E509FB0A110A270A
          3D0A540A6A0A810A980AAE0AC50ADC0AF30B0B0B220B390B510B690B800B980B
          B00BC80BE10BF90C120C2A0C430C5C0C750C8E0CA70CC00CD90CF30D0D0D260D
          400D5A0D740D8E0DA90DC30DDE0DF80E130E2E0E490E640E7F0E9B0EB60ED20E
          EE0F090F250F410F5E0F7A0F960FB30FCF0FEC1009102610431061107E109B10
          B910D710F511131131114F116D118C11AA11C911E81207122612451264128412
          A312C312E31303132313431363138313A413C513E5140614271449146A148B14
          AD14CE14F01512153415561578159B15BD15E0160316261649166C168F16B216
          D616FA171D17411765178917AE17D217F7181B18401865188A18AF18D518FA19
          201945196B199119B719DD1A041A2A1A511A771A9E1AC51AEC1B141B3B1B631B
          8A1BB21BDA1C021C2A1C521C7B1CA31CCC1CF51D1E1D471D701D991DC31DEC1E
          161E401E6A1E941EBE1EE91F131F3E1F691F941FBF1FEA20152041206C209820
          C420F0211C2148217521A121CE21FB22272255228222AF22DD230A2338236623
          9423C223F0241F244D247C24AB24DA250925382568259725C725F72627265726
          8726B726E827182749277A27AB27DC280D283F287128A228D429062938296B29
          9D29D02A022A352A682A9B2ACF2B022B362B692B9D2BD12C052C392C6E2CA22C
          D72D0C2D412D762DAB2DE12E162E4C2E822EB72EEE2F242F5A2F912FC72FFE30
          35306C30A430DB3112314A318231BA31F2322A3263329B32D4330D3346337F33
          B833F1342B3465349E34D83513354D358735C235FD3637367236AE36E9372437
          60379C37D738143850388C38C839053942397F39BC39F93A363A743AB23AEF3B
          2D3B6B3BAA3BE83C273C653CA43CE33D223D613DA13DE03E203E603EA03EE03F
          213F613FA23FE24023406440A640E74129416A41AC41EE4230427242B542F743
          3A437D43C044034447448A44CE45124555459A45DE4622466746AB46F0473547
          7B47C04805484B489148D7491D496349A949F04A374A7D4AC44B0C4B534B9A4B
          E24C2A4C724CBA4D024D4A4D934DDC4E254E6E4EB74F004F494F934FDD502750
          7150BB51065150519B51E65231527C52C75313535F53AA53F65442548F54DB55
          28557555C2560F565C56A956F75744579257E0582F587D58CB591A596959B85A
          075A565AA65AF55B455B955BE55C355C865CD65D275D785DC95E1A5E6C5EBD5F
          0F5F615FB36005605760AA60FC614F61A261F56249629C62F06343639763EB64
          40649464E9653D659265E7663D669266E8673D679367E9683F689668EC694369
          9A69F16A486A9F6AF76B4F6BA76BFF6C576CAF6D086D606DB96E126E6B6EC46F
          1E6F786FD1702B708670E0713A719571F0724B72A67301735D73B87414747074
          CC7528758575E1763E769B76F8775677B37811786E78CC792A798979E77A467A
          A57B047B637BC27C217C817CE17D417DA17E017E627EC27F237F847FE5804780
          A8810A816B81CD8230829282F4835783BA841D848084E3854785AB860E867286
          D7873B879F8804886988CE8933899989FE8A648ACA8B308B968BFC8C638CCA8D
          318D988DFF8E668ECE8F368F9E9006906E90D6913F91A89211927A92E3934D93
          B69420948A94F4955F95C99634969F970A977597E0984C98B89924999099FC9A
          689AD59B429BAF9C1C9C899CF79D649DD29E409EAE9F1D9F8B9FFAA069A0D8A1
          47A1B6A226A296A306A376A3E6A456A4C7A538A5A9A61AA68BA6FDA76EA7E0A8
          52A8C4A937A9A9AA1CAA8FAB02AB75ABE9AC5CACD0AD44ADB8AE2DAEA1AF16AF
          8BB000B075B0EAB160B1D6B24BB2C2B338B3AEB425B49CB513B58AB601B679B6
          F0B768B7E0B859B8D1B94AB9C2BA3BBAB5BB2EBBA7BC21BC9BBD15BD8FBE0ABE
          84BEFFBF7ABFF5C070C0ECC167C1E3C25FC2DBC358C3D4C451C4CEC54BC5C8C6
          46C6C3C741C7BFC83DC8BCC93AC9B9CA38CAB7CB36CBB6CC35CCB5CD35CDB5CE
          36CEB6CF37CFB8D039D0BAD13CD1BED23FD2C1D344D3C6D449D4CBD54ED5D1D6
          55D6D8D75CD7E0D864D8E8D96CD9F1DA76DAFBDB80DC05DC8ADD10DD96DE1CDE
          A2DF29DFAFE036E0BDE144E1CCE253E2DBE363E3EBE473E4FCE584E60DE696E7
          1FE7A9E832E8BCE946E9D0EA5BEAE5EB70EBFBEC86ED11ED9CEE28EEB4EF40EF
          CCF058F0E5F172F1FFF28CF319F3A7F434F4C2F550F5DEF66DF6FBF78AF819F8
          A8F938F9C7FA57FAE7FB77FC07FC98FD29FDBAFE4BFEDCFF6DFFFFFFDB004300
          0201010201010202020202020202030503030303030604040305070607070706
          070708090B0908080A0807070A0D0A0A0B0C0C0C0C07090E0F0D0C0E0B0C0C0C
          FFDB004301020202030303060303060C0807080C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0CFFC0001108014D012803012200021101031101FFC4001F00000105
          01010101010100000000000000000102030405060708090A0BFFC400B5100002
          010303020403050504040000017D010203000411051221314106135161072271
          14328191A1082342B1C11552D1F02433627282090A161718191A25262728292A
          3435363738393A434445464748494A535455565758595A636465666768696A73
          7475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9
          AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4
          E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F010003010101010101010101
          0000000000000102030405060708090A0BFFC400B51100020102040403040705
          040400010277000102031104052131061241510761711322328108144291A1B1
          C109233352F0156272D10A162434E125F11718191A262728292A35363738393A
          434445464748494A535455565758595A636465666768696A737475767778797A
          82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6
          B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2
          F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FDFCA28A2800A28A2800
          A28A2800A28A2800A28A2800A28A2800A28A2800A28AF823FE0B95FF00051EBC
          FD933E1759F80BC1B7E6D3C79E35819E5BB89B12E8FA7E4A34AA7AACB2306446
          FE10B230C30535E9E4F9557CCB170C1E1D7BD2FB92EADF9247999C66D432DC1C
          F19897EEC7EF6FA25E6D92FF00C146BFE0B8FE13FD91F5ABDF07781ACED3C71E
          3BB5DD1DDB34C4699A3C838D92B2FCD2C83BC68463A33A91B6BF2A7E3A7FC152
          7E3CFED09A8CD2EB7F123C4363692B122C346B83A65A20C636EC876EE1FEF963
          EF5E032CAD3CACEECCEEE4B3331C9627A9269B5FD2F90F0565996534A34D4E7D
          6525777F2BECBC97CDB3F9933EE36CD334A8DCAA3843A462ECADE76DDF9BF924
          6DC5F133C4906A22ED3C41ADA5D86DE275BE94499F5DDBB39AF75F801FF0569F
          8F9FB3BEA50C9A6FC40D5F5CB08DB2FA7788256D4EDA51FDDFDE92E83FEB9BA9
          F7AF9BE8AFA1C565B84C4C3D9E229464BB3499F3D85CCB17869FB4C3D5945F74
          DA3F7DBFE09C7FF059DF05FEDB9796FE16D7ADA1F057C4375C476124FBECF562
          0726DA4383BFA9F29BE6C742F8247DA55FC9EE9BA95C68DA8DBDE59DC4D6B776
          922CD04F0B949217520ABAB0E430201047208AFDF9FF0082337FC14365FDB77E
          01CDA5F896E925F883E0911DB6A8E70ADA9C0C0886F303F89B6957C701D73C07
          02BF09E3DE04865D0FED0C07F0AFEF477E5BECD3ECF6D754FD74FDE78078F279
          94FF00B3F30FE2DBDD96DCD6DD35FCDD74D1AED6D7EC9A28A2BF2A3F560A28A2
          800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
          800A28A2800A28A2800A28A2800A28A2800A28A2800AFE6AFF00E0A59F1DEE7F
          68CFDB8BE22F88E595E4B54D5A5D36C158F11DADB1F22200741954DC71DDC9EF
          5FD28DC6F303F97F7F69DBF5C715FCA4F8A5674F136A22EB77DA85D4A26DDD77
          EF3BB3F8E6BF62F0830D0962313887F145452F4936DFFE928FC6FC61C4CE387C
          361D7C32726FD62925FF00A5328514515FBB1F8385145140057D53FF000460F8
          EF73F02BFE0A15E062B33A69FE2D9CF86EFE3078952E7E58B3FEECE216FF0080
          9AF95ABD07F64A5B97FDAA7E198B2DDF6B3E2BD2FC9DBD77FDAE2C7EB5E6E718
          68623015A854DA5192FC19E964D899E1F1F46BD3DE328BFC51FD43D14515FC72
          7F65051451400514514005145140051451400514514005145140051451400514
          5140051451400514514005145140051451400514514005145140057F363FF053
          9F80773FB387EDCFF113C3F2C32456771AAC9AB69CCC3892D6E899E3C1EE1779
          43EE8C3B57F49D5F0AFF00C16E7FE09BD77FB627C28B4F19783AC96E7E20782A
          170B6C83F79ACD8F2EF6EBEB22365E31DF73A8E5857DF78759FD3CB733E4AEED
          4EAAE56FA27D1BF2E9E57B9F9FF88DC3F5333CB39F0EAF5293E64BAB5F692F3E
          BE76B1F843453EE6DA4B2B99219A378A6898A3A3A9564607041079041ED4CAFE
          9A3F98C28A28A002BEAFFF00822B7C03B9F8EDFF000508F053AC2EFA6F83A56F
          125FC801C44B6F830E4FBDC34231E84FA57CB5A268979E25D66D34ED3AD2E2FA
          FEFE64B7B6B6B78CC92CF2310AA88A3966248000E4935FD00FFC11DFFE09E4FF
          00B0BFC0096EBC430443E2078C8C777AC6087FECF8D41F26CC30E0ECDCCCE470
          5DC8C90AA6BE278F33FA796E57385FF795138C575D746FE4BF1B23EDF80B87EA
          6659A4276FDDD36A527D34D52F56FF000BB3EBDA28A2BF974FEA50A28A2800A2
          8A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A2
          8A2800A28A2800A28A2800A28A2800A28A2800A28A2803E1FF00F828B7FC112B
          C17FB65EAD79E2DF0B5DC3E07F1FDC8DF7170906ED3F577FEF5C46B82B21EF2A
          727AB2B9AFCAAF8EDFF048DFDA03E005F5C2EA1F0F757D76C60E46A1E1F43A9D
          BC8B9C6EC440C8A3FDF453ED5FD1AD15F7990F8879A65B4D506D5482D94B74BB
          26B5FBEE9743E0B3EF0EB2BCCAA3AE93A751EEE3B37DDA7A7DD6BF53F96C4FD9
          B3E22C977F675F00F8D5A7FF009E6343BA2FF96CCD7B77ECFF00FF00046EFDA0
          7F681BFB7F27C0D7BE15D326C33EA1E23CE9D146A7BF96C3CE6FF80C66BFA25A
          2BE8315E2EE3670E5A142317DDB72FC343E7F0BE10E0613E6AF5E525D9251FC7
          53E3EFF8275FFC11DBC09FB0B4D1788AF671E32F88263DBFDAD73004834EC8C3
          2DAC449D84F20C8C4B9190368254FD834515F9966399E2B1F5DE271737293EAF
          F24B64BC91FA765B96617014161B0705082E8BF36F76FCD8514515C077851451
          400514514005145140051451400514514005145140051451400515FCFA789FFE
          0B63FB4CE9DE25D46DE1F892E9141752C68BFD8BA79DAA1C803FD47A551FF87D
          EFED3BFF00452DFF00F049A77FF18AFD423E1366CD5FDA53FBE5FF00C89F96BF
          16F284ECE9D4FBA3FF00C99FD0CD15FCF37FC3EF7F69DFFA296FFF00824D3BFF
          008C51FF000FBDFDA77FE8A5BFFE0934EFFE314FFE212E6FFF003F29FDF2FF00
          E405FF00117328FF009F753EE8FF00F267F433457F3CDFF0FBDFDA77FE8A5BFF
          00E0934EFF00E3147FC3EF7F69DFFA296FFF00824D3BFF008C51FF00109737FF
          009F94FEF97FF201FF00117328FF009F753EE8FF00F267F433457F3CDFF0FBDF
          DA77FE8A5BFF00E0934EFF00E3147FC3EF7F69DFFA296FFF00824D3BFF008C51
          FF00109737FF009F94FEF97FF201FF00117328FF009F753EE8FF00F267F43345
          7F3CDFF0FBDFDA77FE8A5BFF00E0934EFF00E3147FC3EF7F69DFFA296FFF0082
          4D3BFF008C51FF00109737FF009F94FEF97FF201FF00117328FF009F753EE8FF
          00F267F433457F3CDFF0FBDFDA77FE8A5BFF00E0934EFF00E3147FC3EF7F69DF
          FA296FFF00824D3BFF008C51FF00109737FF009F94FEF97FF201FF00117328FF
          009F753EE8FF00F267F433457F3CDFF0FBDFDA77FE8A5BFF00E0934EFF00E314
          ABFF0005BEFDA75581FF008594C71D8E89A77FF18A3FE212E6FF00F3F29FDF2F
          FE403FE22E651FF3EEA7DD1FFE4CFE8628AFC1FF00867FF070B7ED05E0BD4E39
          35AB9F0B78BED0603C37DA4A5B311DF6BDB98F07DC823DABEF6FD8CFFE0BD9F0
          ABF690D42D343F17C4FF000D3C4B7244718D42E04BA65CB9E004B9C28424F695
          50760C4D7899AF87D9CE020EACA9A9C56EE0EF6F9593FC0F7329F10B25C7CD52
          8D47093D94D5AFF3BB5F89F75514D8A559E257465747019594E4303D0834EAF8
          93EDC28A28A0028A8AFEFE0D2AC66BABA9A2B6B6B68DA596595C22448A32CCCC
          7800004927A57C01FB60FF00C1C1FF000CFE07EA173A2FC3DB097E256B76E4A3
          DDC33FD9B488587A4D82D3639FF56BB4F67AF532AC971B9955F6582A6E6FAF65
          EADE8BE6CF2B35CEF0396D2F6B8DA8A0BA777E896AFE48FD04A2BF05BE21FF00
          C1C17FB44F8C752925D2F53F0C7852DDB85834ED1A29820FF7AE3CD627F11F4A
          E3CFFC16F7F69D27FE4A5BFF00E0934EFF00E315F754FC27CE251BCA74D79394
          BF48B47C2D4F167268CAD18547E6A31FD6499FD0CD15FCF37FC3EF7F69DFFA29
          6FFF00824D3BFF008C51FF000FBDFDA77FE8A5BFFE0934EFFE3157FF00109737
          FF009F94FEF97FF2067FF117328FF9F753EE8FFF00267F433457F3CDFF000FBD
          FDA77FE8A5BFFE0934EFFE3147FC3EF7F69DFF00A296FF00F824D3BFF8C51FF1
          09737FF9F94FEF97FF00201FF117328FF9F753EE8FFF00267F433457F3CDFF00
          0FBDFDA77FE8A5BFFE0934EFFE3147FC3EF7F69DFF00A296FF00F824D3BFF8C5
          1FF109737FF9F94FEF97FF00201FF117328FF9F753EE8FFF00267F433457F3CD
          FF000FBDFDA77FE8A5BFFE0934EFFE3147FC3EF7F69DFF00A296FF00F824D3BF
          F8C51FF109737FF9F94FEF97FF00201FF117328FF9F753EE8FFF00267F433457
          F3CDFF000FBDFDA77FE8A5BFFE0934EFFE3147FC3EF7F69DFF00A296FF00F824
          D3BFF8C51FF109737FF9F94FEF97FF00201FF117328FF9F753EE8FFF00267F43
          3457F3CDFF000FBDFDA77FE8A5BFFE0934EFFE3147FC3EF7F69DFF00A296FF00
          F824D3BFF8C51FF109737FF9F94FEF97FF00201FF117328FF9F753EE8FFF0026
          7F433457E177EC75FF000581FDA23E297ED6BF0C7C35AEFC417BED17C41E2AD3
          74EBFB7FEC8B18FCF825BA8E391372C21865588C8208CF068AF91E23E18C564B
          5614B1528B72575CADBF2EA91F5FC37C5185CEE94EAE16324A2ECF9925D2FD1B
          3E1BF1AFFC8E5AB7FD7ECDFF00A1B56657EA5EB9FF0006CEF8B757D6AF2EC7C5
          4F0EA0BA9DE5DBFD9137CBB989C7FACF7AADFF0010C6F8B7FE8AB7873FF05137
          FF001CAFE82871F640A293C4AFBA5FFC89FCF73E00E20726D619FF00E051FF00
          E48FCBDA2BF50BFE218DF16FFD156F0E7FE0A26FFE3947FC431BE2DFFA2ADE1C
          FF00C144DFFC72ABFD7FC83FE8257DD2FF00E449FF00887FC41FF40CFF00F028
          FF00F247E5ED15FA85FF0010C6F8B7FE8AB7873FF05137FF001CA3FE218DF16F
          FD156F0E7FE0A26FFE3947FAFF00907FD04AFBA5FF00C887FC43FE20FF00A067
          FF008147FF00923F2F68AFD42FF88637C5BFF455BC39FF008289BFF8E51FF10C
          6F8B7FE8AB7873FF0005137FF1CA3FD7FC83FE8257DD2FFE443FE21FF107FD03
          3FFC0A3FFC91F97B457EA17FC431BE2DFF00A2ADE1CFFC144DFF00C728FF0088
          637C5BFF00455BC39FF8289BFF008E51FEBFE41FF412BEE97FF221FF0010FF00
          883FE819FF00E051FF00E48FCBDA2BF50BFE218DF16FFD156F0E7FE0A26FFE39
          47FC431BE2DFFA2ADE1CFF00C144DFFC728FF5FF0020FF00A095F74BFF00910F
          F887FC41FF0040CFFF00028FFF00247E5ED15F76FED17FF06FA7C6BF82FE1FB8
          D5BC3B3687F10ECAD54BC96FA4B3C5A8051D48824003FF00BA8ECC7B29AF85EF
          AC67D2EF66B6B9865B7B9B7768A58A5428F13A9C32B29E41041041E95EFE599C
          60B3083A982AAA696F6DD7AADD7CCF0333C9B1B97CD53C6D2706F6BECFD1ECFE
          445451457A47987E82FF00C1263FE0B2DABFECCBACE9BF0FBE255FDCEAFF000E
          2E645B7B4BF9D8C971E1A24E0104E4BDB0EE9D50729C02ADFB7BA7EA16FAB584
          1776B3C3736B751ACB0CD13878E5461956561C10410411C106BF93DAFD8EFF00
          83793F6F19FE20F836FBE0A789AF5A6D4BC336E6FBC372CAD9696C41025B6C9E
          A62665651CFC8E4702315F8BF891C1D4952966F828D9AF8D2D9AFE65E7DFBEFD
          1DFF0069F0D78CAAFB58E518D95D3F81BDD3FE5F4EDDB6EAADFA7559FE2BF156
          9BE06F0CEA1ACEB17D6DA6E95A55BBDD5E5DDC3848ADE2452CCECC7A000135A1
          5F925FF07127EDE17126AF67F02FC377CD1DB42916A3E2A785F06576C3DBDA36
          3B05DB330EE5A2F422BF2CE1CC8EAE6D8F860E9E89EB27DA2B77FA2F368FD5B8
          933DA59460278CA9AB5A457793D97EAFC933E7DFF82A67FC15F7C45FB69F88EF
          7C2BE11B9BDD03E16DA48638EDD498AE35EDA7FD75CE39087AAC3D0705B2D8DB
          F1351457F55E579561B2EC3C70B848F2C57DEDF76FAB7DCFE51CD335C5663889
          62B172E693FB97925D12EC1451573C3FE1EBFF00166B969A66976577A96A37F2
          AC16D6B6B134D35C48C70A888A096627A00335DEDA4AECF3D26DD914E8AFBFBE
          047FC1BB1F19BE27E8106A5E27D53C37E028AE503AD9DE3BDDDF2023237C710D
          8BF4326E1DC0AF44FF0088637C5BFF00455BC39FF8289BFF008E57CA56E39C8A
          94DD39E26375DAED7DE9347D5D0E05CFAAC154861A567DEC9FDCDA67E5ED15FA
          85FF0010C6F8B7FE8AB7873FF05137FF001CA3FE218DF16FFD156F0E7FE0A26F
          FE39597FAFF907FD04AFBA5FFC89B7FC43FE20FF00A067FF008147FF00923F2F
          68AFD42FF88637C5BFF455BC39FF008289BFF8E51FF10C6F8B7FE8AB7873FF00
          05137FF1CA3FD7FC83FE8257DD2FFE443FE21FF107FD033FFC0A3FFC91F97B45
          7EA17FC431BE2DFF00A2ADE1CFFC144DFF00C728FF0088637C5BFF00455BC39F
          F8289BFF008E51FEBFE41FF412BEE97FF221FF0010FF00883FE819FF00E051FF
          00E48FCBDA2BF50BFE218DF16FFD156F0E7FE0A26FFE3947FC431BE2DFFA2ADE
          1CFF00C144DFFC728FF5FF0020FF00A095F74BFF00910FF887FC41FF0040CFFF
          00028FFF00247E5ED15FA85FF10C6F8B7FE8AB7873FF0005137FF1CA3FE218DF
          16FF00D156F0E7FE0A26FF00E3947FAFF907FD04AFBA5FFC887FC43FE20FFA06
          7FF8147FF923E1CFF827CFFC9F87C18FFB1DF47FFD2D868AFD16FD9C7FE0DE0F
          147C0CFDA0FC0DE359FE25E817F0784B5FB1D625B58F4A991EE16DEE12531862
          F805829009E99A2BF20F1273BC0E658AA35303539D462D3D1AD6FE691FB0786B
          91E3B2CC2D6A78EA7C8E524D6A9E96F26CFD53A28A2BF373F4A0A28A2800A28A
          2800A28A2800A28A2800A28A2800AFCB8FF83837FE09F3A5EA5E023F1CBC2DA7
          C567AC6973476FE288E08F6ADFC12308E3BA603FE5A2395463FC4AE093F273FA
          8F5E1DFF000530B18750FF00827E7C628E78D6445F0A5FCA01E819216753F832
          83F857D0F0AE675B039AD1AD45DAF249AEE9BB34FF00ADECCF9DE2BCB28E3B2A
          AD46B2BDA2DA7D9A574D7F5B5D1FCD4514515FD6E7F22857ADFEC1FF001BE7FD
          9D3F6C3F877E2F8666821D375A812F0827E6B595BC9B8538EB989DFF001C5792
          558D25CC5AA5B329C32CAA41F4E45618AA10AF46746A6D24D3F46AC74613113A
          15E15E9BB38B4D7AA773FAB8D5F558342D26EAFAE5FCBB6B385E795BAED4552C
          4FE40D7F2DDFB407C5BBDF8F3F1C3C5BE33D41DDEEFC4FAADC6A2DBBF8049216
          541E8154AA81D82815FD31FC779993F671F19C818871E1BBD6047507ECAFCD7F
          2DB5F8DF8418787FB5567F17BABE5AB7F7E9F71FB2F8C3889FFB2D15F0FBCFE7
          EEA5F76BF78514515FB59F89057EDAFF00C1043FE09F7A5FC23F81F65F17FC43
          A7C173E31F1A4265D25E68C33693A71C8431E7A3CC32E5873E5B228C6581FC4A
          AFEA43F663D3E0D27F66DF87D6B6D1AC36F6FE1AD3A38D1460228B58C003F0AF
          CB3C56CCEB61F2FA786A4ECAAB7CDE896DF36D5FD2C7EA9E1465747119854C4D
          5577492E5F56F7F924EDEB73B8A28A2BF9E8FE880A28A2800A28A2800A28A280
          0A28A2800A28A2800A28A2800A28A2800A28A2800A28AF94FF006D6FDB72F3C0
          BADCFE10F07CEB0EA36FF2EA3A88018DBB11FEAA3CF1B803F3376E839C91F2FC
          5FC5F9770DE5F2CC73295A29D925ACA527B462BBF5E892D5B3DAC8320C5E718B
          584C1AD776DEC97767D584E28AFC91D63C63ABF886FDEEAFF54D46F6E6439696
          7B9791C9FA939AF45F811FB61F8BFE09EB300FED0BAD63440C04FA75DCC5D0AF
          7F2D8E4C6DE98E3D41AFC332CFA4CE595B16A9637072A549BB73A929B5E6E3CA
          B4EF66DF64CFD331BE0D6329D07530F888CE6BECB8F2DFC93BBF95D25E87E94D
          158DF0F3C7BA6FC4FF0005E9DAF693379D61A944258C9E197B32B0ECCA41047A
          835B35FD2B87C452AF4A35E8C94A1249A6B54D3574D79347E3B5694E94DD2A8A
          D28BB34F74D6E828A28AD8CC2BC4FF00E0A49FF2605F18FF00EC50D47FF49DEB
          DB2BC4FF00E0A49FF2605F18FF00EC50D47FF49DEBD1CA3FDFA8FF008E3F9A3C
          ECDFFDC6B7F825F933F9A3A28A2BFB1CFE340A9B4DFF00908DBFFD745FE62A1A
          9B4DFF00908DBFFD745FE6293D86B73FA8AF8F3FF26D7E33FF00B166FBFF0049
          5EBF96FAFEA43E3CFF00C9B5F8CFFEC59BEFFD257AFE5BEBF1DF087F838AF58F
          E523F64F183F8D85F497E710A28A2BF633F1A0AFEA5BF674FF00937CF027FD8B
          DA7FFE93475FCB4D7F52DFB3A7FC9BE7813FEC5ED3FF00F49A3AFC6FC60FE061
          7D65F944FD9BC1DFE3E2BD23F9B3B2A28A2BF0B3F760A28A2800A2B99F8C1F15
          B4CF82BF0FEFFC43AAB31B7B3501224C6FB890F091AFB93F90C9E82BF3BBE33F
          ED59E31F8D7ABCD25EEA97363A6B31F274EB495A38225CF00818DE7FDA6CFB63
          A57E5BE2278AF95F09A8D1AD1756BCD5D422D2D3BC9BBF2A7AA5A36EDB5B53ED
          B84B81B1B9EF354A6D42945D9C9EBAF64BABEFAA5E67E9B839A2BF257C3DE3CD
          6FC25A8A5E697ABEA5A7DD4672B2DBDCBC6C3F235F6B7EC4FF00B67CFF00176E
          57C2BE2878FF00E12048CBDA5E05083505519656038120193C70C01E011CFCCF
          02F8F595E7F8E8E5B89A2F0F526ED0BC94A327FCBCD68DA4FA26ACF6BDEC9FB3
          C4DE17E372BC33C651A8AAC23ACACB95A5DED7774BAEBA6F6B5CFA528A28AFDE
          0FCC028A28A0028A28A0028A28A0028A28A008AF6E0DA59CB2852C6242FB477C
          0CE2BF243C41AD4FE23D7AF750BA667B9BE9DEE2566392CEEC589FCCD7EBA75A
          FCCAFDAB7E07DE7C0EF8B9A8D9BC2E34ABF95EEB4D9F1F2490B1CEDCFF007933
          B48F607A115FCBDF49BCB717570182C6D24DD2A729A9793928F2B7FF0080B57E
          ED2EA7ED5E0CE328431588C34DDA735171F351BDD2FBD3FF00863CD28A29D0C2
          F7132471A34924842AAA8C9627A003B9AFE384AFA23FA08FB8BFE0977E20B8BF
          F84FAF69D2B16834FD483C39FE1F32305947B6573F5635F4E57927EC57F056E3
          E09FC11B5B5D42230EAFAACA750BC8C8F9A166002C67DD515723B316AF5BAFF4
          BBC33CBB1780E16C0E171A9AA9182BA7BABB6D27E6934ADD2C7F1CF1962E862B
          3BC4D7C36B072D1AD9DB46FE6D361451457DD1F3215E27FF000524FF009302F8
          C7FF006286A3FF00A4EF5ED95E27FF000524FF009302F8C7FF006286A3FF00A4
          EF5E8E51FEFD47FC71FCD1E766FF00EE35BFC12FC99FCD1D14515FD8E7F1A054
          DA6FFC846DFF00EBA2FF003150D4DA6FFC846DFF00EBA2FF003149EC35B9FD45
          7C79FF00936BF19FFD8B37DFFA4AF5FCB7D7F521F1E7FE4DAFC67FF62CDF7FE9
          2BD7F2DF5F8EF843FC1C57AC7F291FB278C1FC6C2FA4BF388514515FB19F8D05
          7F52DFB3A7FC9BE7813FEC5ED3FF00F49A3AFE5A6BFA96FD9D3FE4DF3C09FF00
          62F69FFF00A4D1D7E37E307F030BEB2FCA27ECDE0EFF001F15E91FCD9D951451
          5F859FBB051451401F23FF00C154FC41710E97E0FD2D4916B712DCDD483FBCE8
          2355FC83B7E75F1BD7E857EDFBF042EFE2E7C228EF74B81EE756F0DCAD751C28
          BB9E7858625451DCE02B63BECC7522BF3D48C1C1E08AFE04FA4065B8BC3F1755
          C4D74F92AC60E0FA594545A5E924EEBCD3EA7F5278578CA15721851A4FDE8392
          92EB76DB4FE69AFBBC82BA4F839AFDC785FE2CF86B50B56659ED753B775DA796
          1E6282BF42323F1AE6EBD9BF61EF81D79F16BE33E9F7CD048345F0ECE97D7739
          1F21743BA3881EECCC01C7F74357E67C2796E2F1F9CE1B0B814DD494E36B74B3
          4F9BC9452BB7D123ECF3CC650C2E5F5ABE25FB8A2EF7EBA5ADF3D91FA3545145
          7FA8E7F1405145140051451400515F375DFF00C14EBC1567772C2DA2F89CB44E
          50911418241C7FCF4A8FFE1E87E09FFA0278A3FEFD41FF00C76BF3A7E2DF07A7
          678F87E3FE47D6AE03CFDABAC2CBF0FF0033E95A2BE6AFF87A1F827FE809E28F
          FBF507FF001DA3FE1E87E09FFA0278A3FEFD41FF00C7697FC45CE0FF00FA0F87
          E3FE43FF0050F883FE8165F87F99F4AD607C48F85FA0FC5BF0DC9A578834E835
          1B373B943E43C4DFDE461CAB7B835E21A67FC14E7C057B7891CFA77892CE3638
          32BDBC4EA9EE42C84FE40D7B6FC39F8ABE1EF8B5A27F68787755B5D4ED8603F9
          6D87849ECE870CA7D8815EB65BC59C37C4319E0B0B88A75EE9DE174EEBAFBB2D
          5AEFA3470E3322CE32971C4D7A53A567A4B5567FE25B3F99F3FEB3FF0004B6F0
          CDD6A0D258F8935AB3B763911491473151E81BE5FD457A1FC10FD8A3C17F0475
          18B51B782E357D621E63BCBF21CC07D634002A9F7C13EF5EBD4D965582367765
          444059998E0281D4935C796F863C2B97E2963B0B82846A2774F5767DD2936935
          D1A4ADD0DF19C679DE2E83C357C4C9C5E8D68AFE4DA49BF9BD47515E27F11BF6
          FF00F877F0FF005092D23BDBBD76E626DAE34C884B1A9FFAE8CCAA7FE024D72D
          FF000F43F04FFD013C51FF007EA0FF00E3B4633C50E14C2D5742B63E9F32DECE
          FF008ABA1E1F82B3DAD4D54A7859D9F756FCECCFA568AF9ABFE1E87E09FF00A0
          278A3FEFD41FFC768FF87A1F827FE809E28FFBF507FF001DAE5FF88B9C1FFF00
          41F0FC7FC8DBFD43E20FFA0597E1FE67D2B5E27FF0524FF9302F8C7FF6286A3F
          FA4EF5CB7FC3D0FC13FF00404F147FDFA83FF8ED667ED47FB41E93FB45FF00C1
          377E386A9A45A6A167058F86B52B575BB545666FB296C8DACC318615F4BC1FE2
          0F0EE6D9C61F059762E352A3926A2AF7B269BE8783C4FC299B6072AAF88C5D09
          420A32D5DBAA76EA7F3BF451457F7C9FC2615369BFF211B7FF00AE8BFCC54353
          69BFF211B7FF00AE8BFCC527B0D6E7F515F1E7FE4DAFC67FF62CDF7FE92BD7F2
          DF5FD487C79FF936BF19FF00D8B37DFF00A4AF5FCB7D7E3BE10FF0715EB1FCA4
          7EC9E307F1B0BE92FCE21451457EC67E3415FD4B7ECE9FF26F9E04FF00B17B4F
          FF00D268EBF969AFE93E1FDA6745FD9BFF00672F86136B165A9DE2EADA05A244
          2CD118A14B5849DDB997FBC3A57E15E3AE6D84CB32EA18EC7D454E941CAF27B2
          BF2A5F8B48FDC7C0FC0E23198EC461B0B1729C946C975B733FC91EF3457CD5FF
          000F43F04FFD013C51FF007EA0FF00E3B47FC3D0FC13FF00404F147FDFA83FF8
          ED7F2B7FC45CE0FF00FA0F87E3FE47F4CFFA87C41FF40B2FC3FCCFA568AF9ABF
          E1E87E09FF00A0278A3FEFD41FFC768FF87A1F827FE809E28FFBF507FF001DA3
          FE22E707FF00D07C3F1FF20FF50F883FE8165F87F99F4AD78AFC66FD83FC13F1
          7B55975258EE741D52E1B7CD3581511CEDDD9A320AE4FAAE09EF9A9FE187EDD9
          F0F7E275FC766BA8CFA2DECC76C716A7188439F40E094CFB1604D7B1839191C8
          35EB4E3C37C5F81E57ECF15493EEA5CAFE5AC5FDCEC70C5E71906279973D09FC
          D5D7E525F7A3E62F0E7FC12EFC2BA7EA292EA5AFEB5A8C0872618D1200FEC5BE
          638FA62BE86F03F80F47F86DE1C8349D0F4FB7D374FB7FBB144B8049EAC4F566
          3DC9249AD7AE5BE287C69F0C7C1AD296EFC47ABDB69EB203E5444979A7C7F723
          5CB37D40C0EE6B3CAB85386785E9CF1784A34F0F1B7BD36F65D9CE4DB4BCAF62
          B1D9E6739D4E342BD49557D22975FF000C56FE763A9A2BE6FBEFF829EF812DEE
          5D21D2FC4D711A9C090410A86F700C99FCEA2FF87A1F827FE809E28FFBF507FF
          001DAF3A5E2D707A7678FA7F8FF91D6B8133F6AFF5597E1FE67D2B457CD5FF00
          0F43F04FFD013C51FF007EA0FF00E3B47FC3D0FC13FF00404F147FDFA83FF8ED
          2FF88B9C1FFF0041F0FC7FC87FEA1F107FD02CBF0FF33E95A2BE7DF047FC1463
          C21E3BF19693A25AE91E228AE757BC8ACA2796284223C8E1016C484E3279C0A2
          BEA321E28CAB3BA72AB955755631766D5F47BDB548F1734C971D96CE34F1D4DC
          1C95D5FAA3E61D5BF621F8A573AADCC89E139D92495D94FDAEDF9049FF00A695
          07FC30DFC54FFA14AE3FF032DBFF008E57E93D15F8A4FE8D3C3929393C457D7F
          BD4FFF00959FA347C62CDD2B7B2A7F74BFF933F363FE186FE2A7FD0A571FF819
          6DFF00C72A9EBBFB1BFC4DF0DE9735EDD784AFFC88177398648A7703B9DA8CCC
          7F015FA67456753E8CFC3AE2D4313593E97706BEEE457FBD170F193364D7351A
          6D7A4BFF009267E4032956208208E083DABA3F853F15F5BF835E30B7D6B43BB6
          B7B984E2442498AE533CC6EBFC4A7F4EA304035EB5FF000519F87DA7F823E3C4
          573A74296CBAED82DF5C46830BE7798E8CC076DDB413EE49EF5E035FC959E659
          8CE1ACF2AE0E152D570F3D271D1E9AA92EAAEACFCB63F76CB7194338CB618894
          2F0AB1D62F5DF74FB9FAAFF05FE2BD87C6BF86FA6F88B4F0523BD4C4B09396B7
          957878CFD0E79EE307BD7C8FFB7CFED5B79E28F13DEF82342BA78346D39CC3A9
          4B1360DF4C3EF4648FF96687823BB039E00AE93FE09B1E30B9D3BE1678FE004B
          45A514BE8549E03B4526EFFD14B5F205DDD4B7F752CF33B4B34CE5E476396762
          72493EA4D7EFDE2578A18FC670665B1A4F9278C8CBDAB5A5D537C924BB29CAED
          A5D172ECD9F967077056170FC438C735CD1C3B8F227ADB9D7327EB15A2F3D774
          475D47C37F82FE29F8BB712C7E1CD12F754F23FD6BC602C519F42EC4283ED9CD
          72F5FAB5F06FC05A77C34F865A368FA5C090DB5B5AA1240C195CA82F237AB31C
          926BF35F093C358717636B431355D3A545272E5B73372BD92BDD2D9B6DA7B5AD
          ADD7D8F1DF18CB21C35395182954A8DA57D95AD76EDABDD5969EBA1F9FDFF0C3
          7F153FE852B8FF00C0CB6FFE3947FC30DFC54FFA14AE3FF032DBFF008E57E93D
          15FD07FF0012CFC37FF4115FFF0002A7FF00CACFCA7FE231E71FF3EA9FDD2FFE
          4CFCD8FF00861BF8A9FF004295C7FE065B7FF1CAF43F137C23F117C1DFF825D7
          C7DB1F1269AFA65D5D687A94F146D2A49BD3EC417394623A83F957DC95E27FF0
          524FF9302F8C7FF6286A3FFA4EF5F75E1BF8299370DF10E1B35C156AB29C6495
          A4E0D7BCD27B413FC4F94E37F11B31CE324C4607114E0A2E2DDE2A57D137D64D
          7E07F347451457FA527F9E615369BFF211B7FF00AE8BFCC5435369BFF211B7FF
          00AE8BFCC527B0D6E7F515F1E7FE4DAFC67FF62CDF7FE92BD7F2DF5FD487C79F
          F936BF19FF00D8B37DFF00A4AF5FCB7D7E3BE10FF0715EB1FCA47EC9E307F1B0
          BE92FCE21451457EC67E3415FD057C7DF827E28F8CDFB347C1B8FC35A549AA3E
          9FA1C0D701668E3F2C35ADBEDFBEC339DA7A7A57F3EB5FD4B7ECE9FF0026F9E0
          4FFB17B4FF00FD268EBF9EBE915C3786CFF24A79462E528C2A37771B2968E125
          6BA6B75DB63F7CF00B38AD95E6B5B1F4127282564EF6D7996B669F5EE7C15FF0
          C37F153FE852B8FF00C0CB6FFE3947FC30DFC54FFA14AE3FF032DBFF008E57E9
          3D15FC43FF0012CFC37FF4115FFF0002A7FF00CACFEBBFF88C79C7FCFAA7F74B
          FF00933F363FE186FE2A7FD0A571FF008196DFFC72B87F889F0A3C47F09F534B
          3F1168F79A54F28DD1F9CB949477DAE32AD8EF82715FABF5E7BFB53FC3DD3BE2
          37C08F125B6A10A39B2B19AFADA4C7CD04D1233AB29EDD307D4123BD787C49F4
          6ECAE865B5B1195E26A7B5845C929B8B8BB2BDB48C5ABF477D3B1E9E4FE2FE36
          AE329D2C6D187249A4F9799357D2FAC9A76EDF89F9835F5DFF00C13EFF006ACB
          C9F5883C07E21BA7B88A652348B995B2F1B28CFD9C93D548076FA11B7B803E44
          AD3F05EB33F877C61A56A16CED1DC595E453C6CA705595C107F315FCDDC0BC5B
          8BE1DCE296618593B5D29C7A4A0DEB17F2DBB3B33F5EE26C86866D97D4C2D65A
          D9B8BEB19746BF5EEB43F4CFF68AF8DD67F007E185E6BD70893DCE441636C4E3
          ED33B03B54FB000B1F653DF15F9A5E3FF881ABFC4FF15DD6B5ADDE4B7DA85DB6
          5DDCF083B228E8AA3A003815F4DFFC15435F9E4D7BC23A60622D92DE7BADB9FB
          CECCAB93F40BFA9AF92EBF4DFA40F1762F1DC413C9D49AA187E5B47A3938A939
          3EED5F957649DB767C6F85790D0C36551CC2D7A956FAF68A6D24BEEBBEFF0024
          3E081EEA748A2479249182A228CB313C0007735E9DA67EC59F14357B18AE61F0
          8DF2C73286512CD0C2F83EAAEE187D0815E91FF04C8F87DA7F89BE26EB5ACDEC
          31DC4FA05B466D038C88E495987983FDA01081E9BABEE7AF53C2CF03F07C4594
          2CE333AF38C66DA8461CA9DA2DC5B939296ED34925D2F7D6CB8B8DBC4AC46538
          F780C1528C9C527272BF5574924D746B5BFC8FCD8FF861BF8A9FF4295C7FE065
          B7FF001CA3FE186FE2A7FD0A571FF8196DFF00C72BF49E8AFD33FE259F86FF00
          E822BFFE054FFF00959F1BFF00118F38FF009F54FEE97FF267E7FF00C12FD8EB
          E24F857E32785353BFF0C4F6F63A7EAF6B737129BA818471A4AACCD80E49C004
          F028AFD00A2BF4FE03F0F72FE13C3D5C365F52735524A4F9DC5BBA56D396313E
          2F89F8AF159ED5856C5463170565CA9F7BF56C28A28AFBC3E6028A28A00F86BF
          E0A8FF00F258BC3FFF006061FF00A3E5AF992BE9BFF82A3FFC962F0FFF00D818
          7FE8F96BE64AFF0037FC5FFF0092C71FFE3FFDB627F5EF00FF00C93F85FF000F
          EACFAB3FE09D5FF24DBE29FF00D7945FFA2AE6BE53AFAB3FE09D5FF24DBE29FF
          00D7945FFA2AE6BE53AE8E2FFF00924B22FF000E23FF004F19641FF23DCCFD69
          7FE9B0AFD74F0E7FC8BD61FF005EF1FF00E822BF22EBF5D3C39FF22F587FD7BC
          7FFA08AFD7BE8BBFC5CCBD297E750F81F1ABF8784F59FF00ED85CA28A2BFAE8F
          C142BC4FFE0A49FF002605F18FFEC50D47FF0049DEBDB2BC4FFE0A49FF002605
          F18FFEC50D47FF0049DEBD1CA3FDFA8FF8E3F9A3CECDFF00DC6B7F825F933F9A
          3A28A2BFB1CFE340A9B4DFF908DBFF00D745FE62A1A9B4DFF908DBFF00D745FE
          6293D86B73FA8AF8F3FF0026D7E33FFB166FBFF495EBF96FAFEA43E3CFFC9B5F
          8CFF00EC59BEFF00D257AFE5BEBF1DF087F838AF58FE523F64F183F8D85F497E
          710A28A2BF633F1A0AFEA5BF674FF937CF027FD8BDA7FF00E93475FCB4D7F52D
          FB3A7FC9BE7813FEC5ED3FFF0049A3AFC6FC60FE0617D65F944FD9BC1DFE3E2B
          D23F9B3B2A28A2BF0B3F760AE6BE347FC91DF167FD81AF3FF443D74B5CD7C68F
          F923BE2CFF00B035E7FE887AF3738FF70AFF00E097FE92CECCBBFDEA97F8A3F9
          A3F292AC693FF215B6FF00AEA9FCC557AB1A4FFC856DBFEBAA7F315FE56D1FE2
          47D51FDBD53E167D3DFF00054BFF009281E15FFB06C9FF00A32BE59AFA9BFE0A
          97FF002503C2BFF60D93FF004657CB35FA578CBFF259E3BFC51FFD2227C7787B
          FF0024F617D1FF00E94CFADBFE0953FF0021CF1AFF00D70B4FFD0A6AFB2ABE35
          FF008254FF00C873C6BFF5C2D3FF00429ABECAAFEBBF023FE489C27AD4FF00D3
          B33F04F13BFE4A3AFE90FF00D2221451457EBE7C085145140051451400514514
          01F0D7FC151FFE4B1787FF00EC0C3FF47CB5F3257D37FF000547FF0092C5E1FF
          00FB030FFD1F2D7CC95FE6FF008BFF00F258E3FF00C7FF00B6C4FEBDE01FF927
          F0BFE1FD59F567FC13ABFE49B7C53FFAF28BFF00455CD7CA75F567FC13ABFE49
          B7C53FFAF28BFF00455CD7CA75D1C5FF00F249645FE1C47FE9E32C83FE47B99F
          AD2FFD3615FAE9E1CFF917AC3FEBDE3FFD0457E45D7EBA7873FE45EB0FFAF78F
          FF004115FAF7D177F8B997A52FCEA1F03E357F0F09EB3FFDB0B9451457F5D1F8
          285789FF00C1493FE4C0BE31FF00D8A1A8FF00E93BD7B65789FF00C1493FE4C0
          BE31FF00D8A1A8FF00E93BD7A3947FBF51FF001C7F3479D9BFFB8D6FF04BF267
          F347451457F639FC6815369BFF00211B7FFAE8BFCC5435369BFF00211B7FFAE8
          BFCC527B0D6E7F515F1E7FE4DAFC67FF0062CDF7FE92BD7F2DF5FD487C79FF00
          936BF19FFD8B37DFFA4AF5FCB7D7E3BE10FF000715EB1FCA47EC9E307F1B0BE9
          2FCE21451457EC67E3415FD4B7ECE9FF0026F9E04FFB17B4FF00FD268EBF969A
          FEA5BF674FF937CF027FD8BDA7FF00E93475F8DF8C1FC0C2FACBF289FB3783BF
          C7C57A47F36765451457E167EEC15CD7C68FF923BE2CFF00B035E7FE887AE96B
          9AF8D1FF002477C59FF606BCFF00D10F5E6E71FEE15FFC12FF00D259D9977FBD
          52FF00147F347E52558D27FE42B6DFF5D53F98AAF56349FF0090ADB7FD754FE6
          2BFCADA3FC48FAA3FB7AA7C2CFA7BFE0A97FF2503C2BFF0060D93FF4657CB35F
          537FC152FF00E4A07857FEC1B27FE8CAF966BF4AF197FE4B3C77F8A3FF00A444
          F8EF0F7FE49EC2FA3FFD299F5B7FC12A7FE439E35FFAE169FF00A14D5F6557C6
          BFF04A9FF90E78D7FEB85A7FE85357D955FD77E047FC91384F5A9FFA7667E09E
          277FC9475FD21FFA44428A28AFD7CF810A28A2800A28A2800A28A2803E1AFF00
          82A3FF00C962F0FF00FD8187FE8F96BE64AFA6FF00E0A8FF00F258BC3FFF0060
          61FF00A3E5AF992BFCDFF17FFE4B1C7FF8FF00F6D89FD7BC03FF0024FE17FC3F
          AB3EACFF0082757FC936F8A7FF005E517FE8AB9AF94EBEACFF0082757FC936F8
          A7FF005E517FE8AB9AF94EBA38BFFE492C8BFC388FFD3C65907FC8F733F5A5FF
          00A6C2BF5D3C39FF0022F587FD7BC7FF00A08AFC8BAFD74F0E7FC8BD61FF005E
          F1FF00E822BF5EFA2EFF001732F4A5F9D43E07C6AFE1E13D67FF00B61728A28A
          FEBA3F050AF13FF82927FC9817C63FFB14351FFD277AF6CAF13FF82927FC9817
          C63FFB14351FFD277AF4728FF7EA3FE38FE68F3B37FF0071ADFE097E4CFE68E8
          A28AFEC73F8D02A6D37FE4236FFF005D17F98A86A6D37FE4236FFF005D17F98A
          4F61ADCFEA2BE3CFFC9B5F8CFF00EC59BEFF00D257AFE5BEBFA90F8F3FF26D7E
          33FF00B166FBFF00495EBF96FAFC77C21FE0E2BD63F948FD93C60FE3617D25F9
          C428A28AFD8CFC682BFA96FD9D3FE4DF3C09FF0062F69FFF00A4D1D7F2D35FD4
          B7ECE9FF0026F9E04FFB17B4FF00FD268EBF1BF183F8185F597E513F66F077F8
          F8AF48FE6CECA8A28AFC2CFDD82B9AF8D1FF002477C59FF606BCFF00D10F5D2D
          735F1A3FE48EF8B3FEC0D79FFA21EBCDCE3FDC2BFF00825FFA4B3B32EFF7AA5F
          E28FE68FCA4AB1A4FF00C856DBFEBAA7F3155EAC693FF215B6FF00AEA9FCC57F
          95B47F891F547F6F54F859F4F7FC152FFE4A07857FEC1B27FE8CAF966BEA6FF8
          2A5FFC940F0AFF00D8364FFD195F2CD7E95E32FF00C9678EFF00147FF4889F1D
          E1EFFC93D85F47FF00A533EB6FF8254FFC873C6BFF005C2D3FF429ABECAAF8D7
          FE0953FF0021CF1AFF00D70B4FFD0A6AFB2ABFAEFC08FF00922709EB53FF004E
          CCFC13C4EFF928EBFA43FF004888514515FAF9F0214514500145145001451450
          07C35FF0547FF92C5E1FFF00B030FF00D1F2D7CC95F4DFFC151FFE4B1787FF00
          EC0C3FF47CB5F3257F9BFE2FFF00C9638FFF001FFEDB13FAF7807FE49FC2FF00
          87F567D59FF04EAFF926DF14FF00EBCA2FFD15735F29D7D59FF04EAFF926DF14
          FF00EBCA2FFD15735F29D74717FF00C925917F8711FF00A78CB20FF91EE67EB4
          BFF4D857EBA7873FE45EB0FF00AF78FF00F4115F9175FAE9E1CFF917AC3FEBDE
          3FFD0457EBDF45DFE2E65E94BF3A87C0F8D5FC3C27ACFF00F6C2E514515FD747
          E0A15E27FF000524FF009302F8C7FF006286A3FF00A4EF5ED95E27FF000524FF
          009302F8C7FF006286A3FF00A4EF5E8E51FEFD47FC71FCD1E766FF00EE35BFC1
          2FC99FCD1D14515FD8E7F1A054DA6FFC846DFF00EBA2FF003150D4DA6FFC846D
          FF00EBA2FF003149EC35B9FD457C79FF00936BF19FFD8B37DFFA4AF5FCB7D7F5
          21F1E7FE4DAFC67FF62CDF7FE92BD7F2DF5F8EF843FC1C57AC7F291FB278C1FC
          6C2FA4BF388514515FB19F8D057F52DFB3A7FC9BE7813FEC5ED3FF00F49A3AFE
          5A6BFA96FD9D3FE4DF3C09FF0062F69FFF00A4D1D7E37E307F030BEB2FCA27EC
          DE0EFF001F15E91FCD9D9514515F859FBB05735F1A3FE48EF8B3FEC0D79FFA21
          EBA5AE6BE347FC91DF167FD81AF3FF00443D79B9C7FB857FF04BFF004967665D
          FEF54BFC51FCD1F94956349FF90ADB7FD754FE62ABD58D27FE42B6DFF5D53F98
          AFF2B68FF123EA8FEDEA9F0B3E9EFF0082A5FF00C940F0AFFD8364FF00D195F2
          CD7D4DFF00054BFF009281E15FFB06C9FF00A32BE59AFD2BC65FF92CF1DFE28F
          FE9113E3BC3DFF00927B0BE8FF00F4A67D6DFF0004A9FF0090E78D7FEB85A7FE
          85357D955F1AFF00C12A7FE439E35FFAE169FF00A14D5F6557F5DF811FF244E1
          3D6A7FE9D99F82789DFF00251D7F487FE9110A28A2BF5F3E0428A28A0028A28A
          0028A28A00F86BFE0A8FFF00258BC3FF00F6061FFA3E5AF992BE9BFF0082A3FF
          00C962F0FF00FD8187FE8F96BE64AFF37FC5FF00F92C71FF00E3FF00DB627F5E
          F00FFC93F85FF0FEACFAB3FE09D5FF0024DBE29FFD7945FF00A2AE6BE53AFAB3
          FE09D5FF0024DBE29FFD7945FF00A2AE6BE53AE8E2FF00F924B22FF0E23FF4F1
          9641FF0023DCCFD697FE9B0AFD74F0E7FC8BD61FF5EF1FFE822BF22EBF5D3C39
          FF0022F587FD7BC7FF00A08AFD7BE8BBFC5CCBD297E750F81F1ABF8784F59FFE
          D85CA28A2BFAE8FC142BC4FF00E0A49FF2605F18FF00EC50D47FF49DEBDB2BC4
          FF00E0A49FF2605F18FF00EC50D47FF49DEBD1CA3FDFA8FF008E3F9A3CECDFFD
          C6B7F825F933F9A3A28A2BFB1CFE340A9B4DFF00908DBFFD745FE62A1A9B4DFF
          00908DBFFD745FE6293D86B73FA8AF8F3FF26D7E33FF00B166FBFF00495EBF96
          FAFEA43E3CFF00C9B5F8CFFEC59BEFFD257AFE5BEBF1DF087F838AF58FE523F6
          4F183F8D85F497E710A28A2BF633F1A0AFEA5BF674FF00937CF027FD8BDA7FFE
          93475FCB4D7F52DFB3A7FC9BE7813FEC5ED3FF00F49A3AFC6FC60FE0617D65F9
          44FD9BC1DFE3E2BD23F9B3B2A28A2BF0B3F760AE6BE347FC91DF167FD81AF3FF
          00443D74B5CD7C68FF00923BE2CFFB035E7FE887AF3738FF0070AFFE097FE92C
          ECCBBFDEA97F8A3F9A3F292AC693FF00215B6FFAEA9FCC557AB1A4FF00C856DB
          FEBAA7F315FE56D1FE247D51FDBD53E167D3DFF054BFF9281E15FF00B06C9FFA
          32BE59AFA9BFE0A97FF2503C2BFF0060D93FF4657CB35FA578CBFF00259E3BFC
          51FF00D2227C7787BFF24F617D1FFE94CFADBFE0953FF21CF1AFFD70B4FF00D0
          A6AFB2ABE35FF8254FFC873C6BFF005C2D3FF429ABECAAFEBBF023FE489C27AD
          4FFD3B33F04F13BFE4A3AFE90FFD2221451457EBE7C085145140051451400514
          51401E79F17BF65DF07FC73D76DB52F11595CDD5DDA402DA368EEA48804DCCD8
          C2903AB1E6B93FF8778FC2EFFA04DFFF00E0C26FFE2ABDBE8AF95C770370F632
          BCB158BC0D29D496AE52845B6FCDB5767B786E25CDB0F4951A1899C62B64A4D2
          5E8AE703F0BFF669F097C1ED2F58B3D0ACEE6DEDF5E8D62BC592E5E42EA03818
          2C78E1DBA7AD71DFF0EF1F85DFF409BFFF00C184DFFC557B7D14EBF0470F56A3
          4F0D57054A50A77E48B845A8F33BBE556D2EF576DD852E24CD69D49D6A7899A9
          4EDCCD49DDD9595DDF5B2D11E21FF0EF1F85DFF409BFFF00C184DFFC557B5DAD
          B259DAC70C6088E2508A09CE0018152515DD9470D6539539BCB30D0A3CF6E6E4
          8A8DED7B5EC95ED776F539B1F9C63B1CA2B195A553976E66DDAFBDAFE8145145
          7B679A1581F157E19E91F19FE1AEBBE12D7E192E344F11D8CBA7DF451CAD13C9
          0C8A55C065E54904F22B7E8AA84E50929C1D9AD5326708CE2E13574F468F8C7F
          E1C15FB357FD0ADAEFFE0FAEBFF8BA3FE1C15FB357FD0ADAEFFE0FAEBFF8BAFB
          3A8AF77FD6ACE7FE82AA7FE072FF0033C1FF0055325FFA05A7FF008047FC8F8C
          7FE1C15FB357FD0ADAEFFE0FAEBFF8BA58FF00E081DFB35C522B0F0BEBB95391
          FF0013EBAFFE2EBECDA28FF5AB39FF00A0AA9FF81CBFCC3FD54C9BFE8169FF00
          E011FF00233BC49E17B3F15F852FF45BD477D3F52B492CA74572ACD148851802
          3907693C8AF90BFE1C15FB357FD0ADAEFF00E0FAEBFF008BAFB3A8AE1C0E6F8E
          C1A6B095A50BEFCADABFAD8EFC765181C6B4F174633B6DCC93B7A5CF8C7FE1C1
          5FB357FD0ADAEFFE0FAEBFF8BA3FE1C15FB357FD0ADAEFFE0FAEBFF8BAFB3A8A
          EEFF005AB39FFA0AA9FF0081CBFCCE0FF55325FF00A05A7FF8047FC8F8C7FE1C
          15FB357FD0ADAEFF00E0FAEBFF008BAFAFFC2DE1BB4F06F8634ED22C11A3B1D2
          AD62B3B75662C5638D022824F24E00E4D5FA2B871D9BE371A92C5D594EDB7336
          EDF79DF81CA303826DE128C60DEFCA92BFAD828A28AF38F442AA6BFA25BF89B4
          2BDD36ED59ED350824B699558A964752AC011C8E09E6ADD151529C671709ABA7
          A35DD151938C94A2ECD1E21FF0EF1F85DFF409BFFF00C184DFFC553A1FF827B7
          C30825575D26FC3210C3FE2613751FF02AF6DA2BE397873C2CB559751FFC171F
          F23E83FD6ECEFF00E82EA7FE072FF3380F8C1FB32F847E3A6A76779E23B2B9BA
          9EC2230C263BA7882A939230A4679AE3FF00E1DE3F0BBFE8137FFF008309BFF8
          AAF6FA2BAF1FC0FC3D8DAF2C5633054AA5496F29422DBE9AB6AEF430C2F12E6D
          86A4A861F1338C56C949A4BD15CE17E0E7ECE3E14F80F717F2F86ECEE2D5F535
          459CC972F36E0858AE37138FBC6BBAA28AF6F2ECB30997E1E384C0D38D3A71BD
          A314925777764B4D5BBFA9E6E2F195F1555D7C4CDCE6F76DDDBB68B57E414514
          5771CC145145001457E53FC76FF838BBC4BF07FE3778C3C250FC30D0EF62F0C6
          B779A4A5C3EB12A34EB04EF1072A23E090B9C76CD729FF00113A78A7FE893681
          FF0083A9BFF8D57DBD2F0EB3EA9055214559ABAF7A3D7E67C354F11B21A7374E
          559DD3B3F765D3E47EC1D15F8F9FF113A78A7FE893681FF83A9BFF008D51FF00
          113A78A7FE893681FF0083A9BFF8D569FF0010DB883FE7CAFF00C0A3FE647FC4
          4AE1FF00F9FCFF00F0097F91FB07457E767FC13BFF00E0B7DAEFEDBBFB51E91F
          0F6FBC01A46816DA95ADD5C35EC1A9C93BC7E4C2D20014A0072571D7BD7D4DFF
          00050CFDAC6F3F626FD96B5AF88763A35B6BF73A55C5AC0B653DC3409209A748
          892C01231BB3D3B57838CE1BCC30B8E865D5E16AB3B595D3F89D96A9DB73DEC1
          712E5F8BC0D4CC684EF4A17BBB356B2BBD1ABECCF6DA2BF1F3FE2274F14FFD12
          6D03FF0007537FF1AAFA9BFE095FFF000566D63FE0A21F123C51A16A3E0CD37C
          311F87B4D8EFD26B6BF7B8698B4A13690C8B81CE735E8E61C0D9CE070F2C5626
          92508EEF9A2FCB64EE79D9771D64D8EC4470B86AADCE5B2E592F3DDAB1F6ED14
          57CD1FF0546FDBD350FF00827BFC11D13C5BA77872CBC4D2EADADA692D6F7376
          D6EB1AB4134BBC32AB64E62031EF5F3980C0D6C6622185C3ABCE4EC96DF8B3E8
          F1F8FA382C3CF1588768455DBB5FF05A9F4BD15F8F9FF113A78A7FE893681FF8
          3A9BFF008D57D95FF04A5FF82966A9FF000518D27C6F73A97852C3C2FF00F089
          CD671462DAF5EE7ED3E7ACC493B95718F2874CE771F4AFA0CCF82737CBF0D2C5
          E2A9A508DAEF9A2F7692D13BEECF9FCAF8DF27CC3131C2612A394E57B2E592D9
          5DEAD5B647D73457897FC1433F6B1BCFD89BF65AD6BE21D8E8D6DAFDCE95716B
          02D94F70D0248269D2224B0048C6ECF4ED5F9D3FF113A78A7FE893681FF83A9B
          FF008D56593F086699A50788C153528A76BF3456AACFAB5DCDB38E30CAB2BAEB
          0D8DA8E326AF6E593D1DD744FB33F60E8AF827FE09ABFF0005B7B0FDB77E32DC
          F817C4FE1CB0F066B5776FE7E8861BE6B88F52740C6584EE55DB2041BD473B82
          BF42067EF6AF3336C9F1796D7FAB6321CB2B27D1E8FAA6B467A794E7184CCF0F
          F59C14F9A376BAAD57469EABFC828AF13FF82857ED6179FB13FECB3AE7C44B1D
          1ADB5FB9D26E2D615B29E768124134E911258024603E7A76AFCE8FF889D3C53F
          F449B40FFC1D4DFF00C6ABD3C9F84334CD283C460A9A9453B5F9A2B5567D5AEE
          8F3338E30CAB2BAEB0D8DA8E326AF6E593D1DD744FB33F60E8AF91FF00E094DF
          F052AD53FE0A31A2F8DAEF52F0AD8785CF84E7B38635B6BD7B9FB479EB3124EE
          55C63CA1D339DC7D2BEB8AF1F32CBABE03132C26295A71B5D5D3DD27BAD3667B
          196E6587C7E1A38BC2BBC257B3B35B36B67AEE828AF33FDA83F6BEF87DFB1D78
          146BFE3FF105B68F6D2929696C0196F2FDC0C948615F99CF4C9C6D5C8DC40AFC
          E3F8CFFF0007354CBA9CB07C3DF86909B44244779E21BD3BE4F42608785FA79A
          6BD3C9F85734CCD73E0E9371FE6764BEF76BFCAE7979C715E5795BE4C6554A5F
          CAAEDFDCAF6F9D8FD68A2BF0E1FF00E0E41F8F0D7C641A1FC36587767CAFECBB
          A231E99FB4E6BD5FE0E7FC1CD5A826A70C3F103E19D94B66D812DD787EF9A392
          3E792219B706E3B798BF5AF76BF8699ED38732A6A5E4A4AFF8D8F070FE26E435
          27CAEA38F9B8BB7E173F5C28AF33FD96FF006BDF007ED93F0F8788FC03AEC3AA
          DA44C23BBB671E55DE9F2119F2E688FCC87AE0F2AD825491CD7A657C3E230F56
          854746B45C64B74D59AF91F7587C452AF4D56A32528BD534EE98515F9A5FB6FF
          00FC17A3C41FB257ED51E2EF87767F0EB47D6ADBC333C30A5ECDAA490BCE1EDE
          2972544640C1931D7B5794FF00C44E9E29FF00A24DA07FE0EA6FFE355F5D86F0
          FB3CC451857A54938C926BDE8ECD5D753E4313E2164587AD3A156AB528B69FBB
          2DD3B3E87EC1D15F8F9FF113A78A7FE893681FF83A9BFF008D51FF00113A78A7
          FE893681FF0083A9BFF8D56FFF0010DB883FE7CAFF00C0A3FE661FF112B87FFE
          7F3FFC025FE47EC1D15F8F9FF113A78A7FE893681FF83A9BFF008D57E9A7EC63
          F1FEE7F6A6FD983C1DF102EF4D8347B9F13D9B5D3D9C331992022474C062013C
          2E7A77AF1F39E13CCF2AA51AD8DA7CB16ECBDE4F5B5FA37D8F6326E2DCB335AB
          2A181A9CD24AEFDD6B4BA5D52EE7A7D15F9D9FF0510FF82DF6BBFB117ED47ABF
          C3DB1F00691AFDB69B6B6B70B7B3EA7240F279D0AC84150840C16C75ED5E1FFF
          00113A78A7FE893681FF0083A9BFF8D577E0F8073BC55086228D24E3349A7CD1
          D9EABA9C18CF10323C2D79E1AB556A506D35CB2DD68FA1FB07457E3E7FC44E9E
          29FF00A24DA07FE0EA6FFE3547FC44E9E29FFA24DA07FE0EA6FF00E355D3FF00
          10DB883FE7CAFF00C0A3FE6737FC44AE1FFF009FCFFF000097F91FB07457E57F
          ECE5FF0007107893E39FED05E07F054FF0CB44D3E1F16EBD63A3C9749ABCAED6
          CB713A44640A6300950D900919C515F3B9D70FE3B2A9C69E3A1CAE4AEB54F4F9
          367D164BC4181CDA9CAA6067CCA2ECF46B5F9A47E6B7EDB7FF002797F167FEC7
          1D5BFF004B65AF34B5B67BDB98E18977492B04419C6493802BD2FF006DBFF93C
          BF8B3FF638EADFFA5B2D79E787AE12D35FB19646091C5711BB31FE1018126BFA
          C72F76C1D36BF957E48FE4AC7ABE32A27FCCFF0033E9E1FF00044CFDA748FF00
          926371FF00839D3FFF008FD1FF000E4BFDA77FE898DC7FE0E74FFF00E3F5FB1A
          BFF0579FD9B428FF008BB3E1DFFBF571FF00C6E97FE1EF3FB36FFD159F0EFF00
          DFAB8FFE375F8EFF00AF9C53FF00405FF94EA7F99FB2FF00A85C2BFF0041AFFF
          000653FF00E44F83BFE0905FF04CAF8DFF00B32FEDC7A078B7C6FE079B44F0F5
          9D8DF4335DB6A567384692DDD106D8E56639620702BEB8FF0082F67FCA33FC61
          FF005FFA67FE96C55F4DFC14F8EFE11FDA33C0C9E25F04EB969E21D0A499EDD6
          F2DC30432210197E600E46476AF993FE0BD9FF0028CFF187FD7FE99FFA5B157C
          B53CEF179A712E16BE360A138CE11B24D5AD2BEA9B6EFA9F555323C2657C338A
          A1829B9C2509CAEDA77BC6DA3492B687E0057E997FC1B2BFF2707F12BFEC5E83
          FF004A56BF336BF4CBFE0D95FF009383F895FF0062F41FFA52B5FB5F1E7FC883
          13E8BFF4A47E25C05FF23FC37ABFFD259FB2D5F9D7FF00072B7FC99A783BFEC7
          187FF48AEEBF452BF3AFFE0E56FF009334F077FD8E30FF00E915DD7F3FF047FC
          8F70DFE2FD19FD05C71FF221C4FF0087F547E25D7EBAFF00C1B07FF22A7C64FF
          00AFBD27FF0040BBAFC8AAFD75FF008360FF00E454F8C9FF005F7A4FFE81775F
          BB788FFF0024FD7FFB73FF004B89F83F86DFF250D0FF00B7FF00F4891F457FC1
          7B3FE519FE30FF00AFFD33FF004B62AFC00AFDFF00FF0082F67FCA33FC61FF00
          5FFA67FE96C55F8015E5784FFF002269FF00D7C97FE9313D6F167FE4730FFAF7
          1FFD2A468F847C5BA9F807C55A76B9A35EDC69BABE91731DE59DDC0DB65B7991
          8323A9EC4100D7F467FF0004D2FDB9F4EFDBCFF66CB0F120305BF8A34ADB61E2
          2B14E3ECD7617FD62AF5114A3E75F4CB2E49435FCDDD7D05FF0004D8FDBA354F
          D82FF68FB1F12C5E75D786753DB61E22D3D0FF00C7D5A16FBEA3A79B11F9D0FB
          32E40735EB71D70BACDF037A4BF7D4F58F9F78FCFA79DBCCF238138A5E4F8EB5
          57FB9A9A4BCBB4BE5D7CAFE47EBFFF00C17A7FE519BE33FF00AFED33FF004BA1
          AFE7FABF7BFF00E0B73E2FD33C7FFF0004A2F10EB9A2DEDBEA5A46AF2E917967
          75036E8EE2192F2064753E84106BF042BC9F0A62E394548C959AA92FFD2627AD
          E2C494B3884A2EE9D38FFE9523F5DFFE0D84FF009137E317FD7EE95FFA05DD7E
          8CFED25F1EF45FD983E06789BC7BE206234BF0D5935CBC6AC15EE5F21638549F
          E29246441EEC2BF39BFE0D84FF009137E317FD7EE95FFA05DD759FF072BFC59B
          9F0CFECD7E07F085BCBE5C7E2AD724BBBA01B0658AD2218423BAF993A37D516B
          E073FCAD663C672C1CB694A37F4508B7F8267DFF000FE68F2EE0B8E363BC232B
          7AB9C92FC5A3F28BF6A9FDA97C5BFB617C66D53C6BE30BE7B9BEBE72B6F6EAC7
          ECFA74009D96F0AFF0A28FC49CB1CB124F01A569575AEEA76F65656D71797977
          22C30410466496676385555192CC490001C9A82BF55FFE0DB5FD95346F11CDE2
          FF008B9AB59C17BA868D76BA16886550C2CE431092E2650470E52489030E4032
          0EF5FB5E7599E1F23CB25888C3DD824A315A7925E4BBF91F89649966233CCCE3
          8794FDE9B6E527AF9B7E6FB799F1F69BFF00047AFDA5355F0E2EA917C28D716D
          9D048239AE6D61B8C633CC2F28901FF64AE7DABE7AF17783F56F00789AF745D7
          34DBED1F57D36530DD595E40D04F6EE3AABA30054FD457F56F5F17FF00C153BF
          E092569FF0504D6BC31AEE87AA695E13F14694CD6BA8EA33DAB4A6FECC8CA2B0
          520B3C6E3E5C91C3B0CF02BF36C8BC56955C57B2CCE118537F6A37D3D55DDEFB
          687E979F78511A385F6B95CE53A8ADEECADAFA3B2B5B7D4FC60FD8ABF6BEF12F
          EC4DF1F348F1AF876691A3B79043AA69FBCAC5AAD9923CC81C74E472ADFC2C15
          BB57F4A7F0CBE23693F17BE1DE87E29D0AE45DE8DE21B18750B297A178A540EB
          91D8E0E08EC4115F9F9F09BFE0DACF85DE1A68A5F17F8CFC5DE2999082D15A2C
          5A65B3FA82312498FA3835F797C0AF81FE1DFD9C3E15691E0BF09DADC59787F4
          3478ECE09AEA4B978C33B48C37C8CCC46E6638CE0670300015F35E2167B93E69
          3A7570377523A37CB64E3F3D6E9EDA6CDF91F4BE1E6439CE550A9471F654E5AA
          5CD76A5F2BAB35BEBBA5E67E01FF00C1673FE5269F157FEBF6D3FF00486DABE6
          0AFA7FFE0B39FF002934F8ABFF005FB69FFA436D5F3057EEDC3BFF0022AC2FFD
          7B87FE928FC1F88BFE46B8AFFAF93FFD299F507843FE08D3FB4778EFC27A5EB9
          A57C3D375A66B36915F59CDFDB1609E6C32A0746C34C08CAB03820119AD1FF00
          871FFED39FF44D8FFE0EF4FF00FE3F5FA1FF00B3E7FC174FF67DF875F013C11E
          1FD4F58F11A6A5A168161A7DDAA68B2BAACB0DB471B8047046E53CF7AEC3FE22
          05FD9BFF00E837E27FFC114D5F9B57E2BE2E8D49461814D26EDEE4F6FF00C08F
          D2E8709F084A9C653C734DA57F7E1BFF00E027E607FC38FF00F69CFF00A26C7F
          F077A7FF00F1FAFDABFF0082727C24F107C09FD88FE1E7847C5561FD97E20D0F
          4E682F6D7CE497C973348D8DC84A9E181E09EB5E2F69FF0005FBFD9CAF6EE286
          3D6BC4C6499C228FEC29B924E057DA80E457C4F18F106758CA14F0F9AD05495F
          997BB28B6D2B3DDBEE7DBF06F0F64983AF531194E21D576E57EF464926EEB64B
          B1F80DFF0005F5FF00949578A7FEC19A6FFE92A57C615F67FF00C17D7FE5255E
          29FF00B0669BFF00A4A95F1857EF1C29FF00226C2FFD7B87E48FC178AFFE4758
          AFFAF93FFD299F47FC34FF0082497ED07F17FC01A478A3C3BF0F67D4742D7AD5
          2F6C6E86AB63189E271956DAF306191D8806B6FF00E1C97FB4EFFD131B8FFC1C
          E9FF00FC7EBF4C3F606FF829D7C05F857FB16FC32F0E7883E25E87A66B7A2F87
          ED6D6F6D258E72F6F2AA00C871191907D0D7AF7FC3DE7F66DFFA2B3E1DFF00BF
          571FFC6EBF37C6F1BF1352C454A74B0778A9349FB3A9AA4F47B9FA4E0B81F862
          AE1E9D4AB8CB49C536BDA53D1B4AEB63F2EBF638FF0082437ED11F0BBF6B6F86
          3E25D77E1DCD63A2E81E2AD3351BFB93AB58B8B7822BA8DE47DAB31638552700
          1271C0A2BF63BF67DFDAEFE1B7ED52BAA9F87BE2DD3BC50343310BEFB2AC8BF6
          6F377F97BB7AAFDEF2DF18FEE9A2BF37E2BE20C7669888BCC29AA7382B5926B7
          D75526D9FA4F0A70FE032BC3C965F51D484DDEEDA7B69A38A48FE737F6DBFF00
          93CBF8B3FF00638EADFF00A5B2D79857A7FEDB7FF2797F167FEC71D5BFF4B65A
          F3FF000B007C4DA7020106EA2FFD0C57F5165EED83A4FF00BB1FC91FCB58F57C
          6545FDE7F99428AFEAD57C1BA4151FF12AD37A7FCFAA7F852FFC21BA3FFD02B4
          DFFC064FF0AFC8FF00E230C7FE813FF27FFED0FD7BFE20E4BFE82FFF0024FF00
          EDCF8CBFE0DF1FF947369BFF0061ED47FF00435AD6FF0082F67FCA33FC61FF00
          5FFA67FE96C55F61D969F069907956D0436F1039D91A045CFD057CB7FF0005AD
          F01DCFC40FF826AFC4786D06E9B4C86D75423D63B7BA8A493F28D5CFE15F9F60
          3328E2F896963A4B954EB4656BDED792EBA1FA1E61964B09C3557029F3385194
          6F6B5ED17D353F9E1AFD32FF0083657FE4E0FE257FD8BD07FE94AD7E66D7DE1F
          F06F9FED15A0FC12FDB2350D1BC4379069D078EF493A5D95CCF2048C5DACA924
          71B13C0DE03A8C9E58A8EAD5FD01C6D4675723C4C29ABBE5BFDCD37F823F9EF8
          22BD3A59EE1A751D9735BEF4D2FC59FBB15F9D7FF072B7FC99A783BFEC7187FF
          0048AEEBF452BF2AFF00E0E58FDA1B42B9F06781FE185A5E4175E208B523AFEA
          10C6E19AC22585E2884807432195D80EB88F38C3027F00E03A33A99EE1F915EC
          EEFC924F53FA0B8F6B429E4388E776BA4979B6D687E45D7EBAFF00C1B07FF22A
          7C64FF00AFBD27FF0040BBAFC8AAFD94FF0083663E1FDDE93F01FE24F89A552B
          69ADEB76D61067F88DB40CEE7E9FE92A3F035FB7789338C720AC9BDDC52FFC09
          3FC91F87F86B094B8828B4B6536FFF00016BF367B5FF00C17B3FE519FE30FF00
          AFFD33FF004B62AFC00AFDFF00FF0082F67FCA33FC61FF005FFA67FE96C55F80
          15E6F84FFF002269FF00D7C97FE9313D3F167FE4730FFAF71FFD2A47D3DFB237
          EC0B77FB60FEC83F167C49E1AB79EE7C6DF0F2F2C6EECED63258EA568F15C1B8
          8157BC988D5D31C92857F8863E61208383C115FAF3FF0006C2FF00C891F187FE
          BFB4BFFD17755E11FF0005DBFF0082769FD9C3E2F9F89DE15B1F2FC11E38BA63
          7B1431E23D23526CB3A607DD8E6C33AF60C245E00507D1C0F14A8F10E2326C4B
          D1B4E0FF00EDC8B71F9EEBE6BB1E6E3F855CB87B0F9CE196B66AA2FF00B7E494
          BE5B3F93EE78BF823F6F7B99BFE09B9E3AF80FE249AE6E626BAB2D47C2B3105C
          5BEDBD8E4B8B563D908DD2A7607CC1FC4A07CCB4515F6184C0D1C33A8E8AB73C
          9C9FAB4937F3B5DF9DD9F1D8BC756C4AA6AB3BF245457A26DA5F2BD979591FAE
          FF00F06C27FC89BF18BFEBF74AFF00D02EEB9FFF00839F219BFE123F837210DF
          6736DAB283FC3BF759E7F1C62BA0FF0083613FE44DF8C5FF005FBA57FE81775D
          EFFC1C8BF066EBC6BFB26F863C61691B4A3C15ADECBBC2E7CBB7BB4119727B01
          2A40BFF0315F8BCF111A3C7FCD3D9B4BE72A492FC5A3F6A861E55BC3FE586E93
          7F28D56DFE08FC4BAFDCCFF83712481FF609D5962DBE6A78BEF44D8EB9FB35A6
          33F862BF0CEBF557FE0DB6FDAAB45F0CDCF8C7E136B17D6F637FADDDA6B7A1AC
          AE105EC823115C42A49E5F6A44C14724090F6AFB7F1270952BE4753D9ABF2B8C
          9FA27AFDD7B9F0FE1AE2E9D0CF69FB476E6528AF56B4FBED63F5CE8A2BF2B3FE
          0E1DFDB9E2D0E0F0C7C27F086BB716FAFD8DF2EBBADCFA75D3472D86C465B680
          BA1C8725DA42B90542467F8857F3F70FE495B36C6C305474BEEED7492DDBFEB7
          3FA138833BA394E0678DADADB657B36DF45FD6C7EA9D15FCF6FC01FF0082DBFE
          D09F01DA181FC5ABE33D322DA3EC7E2587EDA4807FE7B82B3E71C73211EDC57E
          D67EC03FB4AEB9FB5E7ECAFE1CF883AFF876DFC3179AF999A3B38276951E2495
          A35941650407D8481CF041C9CD7ADC49C158FC9A0AB621C6506EC9A7D757B3B3
          E9E7EA791C35C6D80CEA6E8E1D4A334AED35D345BABAEBE4FC8FC3CFF82CE7FC
          A4D3E2AFFD7EDA7FE90DB57CC15F4FFF00C1673FE5269F157FEBF6D3FF00486D
          ABE60AFE90E1DFF915617FEBDC3FF4947F367117FC8D715FF5F27FFA533ABB2F
          80DE39D4ACE2B8B7F0678AE7B79D04914B1E9170E9229190CA4260820E41152F
          FC33D78FFF00E847F187FE09AE7FF88AFE953F643E7F64EF85F9FF00A14B4AFF
          00D238ABD12BF29AFE2DD6A75654FEACB46D7C4FA7FDBA7EB187F08A8D4A51A9
          F597AA4FE15D57F88FE5D3C35FB3F78F61F11E9EEDE08F18055B98C93FD8D73C
          0DC3FD8AFEA293EE8FA52D15F0DC5BC5F3CF5D273A4A1ECF9B677BF35BC9763E
          EB84783E1912AAA155CFDA72EEAD6B5FCDF73F01BFE0BEBFF292AF14FF00D833
          4DFF00D254AF8C2BECFF00F82FAFFCA4ABC53FF60CD37FF4952BE30AFE88E14F
          F913617FEBDC3F247F3AF15FFC8EB15FF5F27FFA530A2BFA44FF008267785B4C
          BCFF00827F7C20966D36C2591FC2F6659DADD0B31F2C724E39AF72FF00843747
          FF00A0569BFF0080C9FE15F9EE33C598D0AF3A1F55BF2B6AFCFBD9DBF94FD0B0
          7E124B1187857FAD5B99276E4DAEAFFCC7E59FFC1B05FF0020EF8CDFF5D347FE
          57B457EAAE9FA359E921FEC96B6D6BE663779512A6EC74CE073457E47C479C2C
          D331A98F50E4E7B697BDAD14B7B2EDD8FD7B8732779565D4F00E7CFC97D6D6BD
          E4DED77DFB9FCC7FEDB7FF002797F167FEC71D5BFF004B65AF3FF0AFFC8CFA6F
          FD7D45FF00A18AFD8FF8CDFF0006E668DF187E2FF8ABC5B2FC56D4EC64F146AF
          77AB35B2E831C82DCCF33CA50379E3705DD8CE0671D2B074DFF8364B44D3751B
          7B81F17F5563048B201FF08F4633820FFCF7F6AFDE709E21E430C3429CAB6AA2
          97C33DEDFE13F04C578779FCF133A91A2ACE4DFC50DAFF00E23F51D3EE0FA52D
          006001E9457F359FD2E82B2FC6FE0DD3FE22783357F0FEAD00BAD2B5CB39AC2F
          2127025865428EBF8AB115A9455464E2D4A2ECD1328A927192BA67F33FFB77FE
          C55E25FD85BE3D6A3E11D761966D36466B8D1354D8443AADA16F96453D378E15
          D7F85B3D41527C5C1C1AFEA2FF0068AFD98FC0DFB577C3F97C33E3DF0FD9EBFA
          5B12F1799949AD24C63CC865521E37F75233D0E4715F9B7FB4BFFC1B9BE12F07
          68F7DADF853E246BDA6D944DB92CB52D322BF651CF1E6A490FEABF9D7F40F0E7
          89D82AF4634732BC2AED7B371979E9769BEAAD6F33F9EF893C30C6D0AD2AD96D
          A74B7B5D2947CB5B2697477BF747E7EF87FF00E0A1FF001D3C2BE164D174FF00
          8B5E3DB6D3638C451C4BAC4C4C480602A316DCA00E8148C5792EBBAF5F78A358
          B9D4753BDBBD4750BD90CB717375334D34EE792CEEC49627D49CD7D27E23FF00
          82707FC23FA9B5B7FC265E760E377F64EDFD3CE35EF7FB207FC108B4DFDA1A69
          AE755F8957D67656A15A482D344512C809E4091A660BC77D86BEAEAE7F926029
          CB137514F76A0EEFEE89F274F20CEF1F52386B3935B273565F7C8F83BE0C7C1A
          F127ED03F13748F08784B4C9F56D7B5B9C416D0463819EAEE7A2A28CB331E140
          24F4AFE92FF628FD97B4FF00D8DFF666F0B7C3EB0952E9F46B62D7B76AA40BDB
          B918C93CBCF382EC7683D1428ED591FB1CFF00C13E7E18FEC35A04D6DE07D10A
          EA57A812F759BE7171A8DE01CED693002A679D881572338CF35ED95F89F1C71A
          FF006CCA387C3271A3177D7793DAEFB25D179DDF65FB7F03704FF62C6588C4B5
          2AD256D368ADECBBB7D5F959777F1B7FC17B3FE519FE30FF00AFFD33FF004B62
          AFC00AFE9A7F6E8FD932DFF6DBFD9C357F87775ADCDE1D87559EDA737D15A8B9
          68FC99965036165073B71D78CD7C21FF0010C3687FF458356FFC2763FF00E48A
          FA4F0FF8BB2ACB32D961F1B53964E6DDB964F46A2BA27D99F35E2170866B9A66
          71C460A9F345412BF3456A9C9F56BBA13FE0D85FF9123E30FF00D7F697FF00A2
          EEABF487E3C7C10F0F7ED21F08B5EF04F8AACD6FB43F105AB5B4E9C6F8CF5495
          0FF0C88C15D5BB32835E1FFF0004D5FF00826A597FC139746F1759D9F8BAEBC5
          63C5735ACCCD369EB69F66F2165181891F76EF37DB1B6BE9EAF82E2BCDA962B3
          BAB8FC0CDF2B71717AA77518ABEB66ACD1F7DC2794D5C2E494B018E82E64A4A4
          B46ACE5276D2E9DD33F985FDB0BF659D7FF635FDA075EF0178854BCFA5CBBED2
          ED54AC7A8DABE4C3709ECCBD473B58329E54D798D7F45FFF00051CFF00826378
          57FE0A25E1ED09752D4E7F0C7887C3D2B7D9758B6B55B891ADDC7CF6EE859772
          16DAC3E6CA9071F7981F92BFE2186D0FFE8B06ADFF0084EC7FFC915FB164DE26
          E57530707984F92ADAD25CB26AEBAAB26B5DEDD363F1BCE7C31CD29E326B2F87
          3D2BDE2F9A29D9F47769E9B5FAEE33FE0D84FF009137E317FD7EE95FFA05DD7E
          96FC60F851A2FC74F85DAF783FC476DF6CD13C4765258DDC40E1B638C6E53D99
          4E194F6201ED5E09FF0004D4FF008269D97FC139349F17DA59F8BAEBC563C593
          5ACACD369EB69F66F2165000C48FBB779BED8DBEF5F4FD7E39C599AD2C5E7557
          1D8295E2DC5C5EA9E918AEB66ACD1FB2F08E555B099252C0E36169252525A35A
          CA4FA5D3BA67F339FB737EC4FE2BFD857E385F784FC45049358C8CD3E8DAAAC6
          441AB5AE7E5914F40E380E99CAB7A82AC7C7ECAF66D36F22B8B7965B7B881C49
          14B1B1478D81C865239041E4115FD467C7FF00D9C3C13FB5178027F0C78EFC3D
          63E21D2263B95275224B77C6049148A43C6E3FBCA41EDD38AFCDAFDAABFE0DD7
          F06783F41D43C43E0FF883AFE9167010C34FD46C23D436E4FDD5915E238F4C86
          3EA4D7EB7C39E26E0F114A34332BC2A6D749B8CBCF4BB4DF556B799F91F11F86
          18DC3D5957CB2D3A7BD9B4A51F2D6C9A5D1DEFE47C069FF052DF8FF1F86068E3
          E2F78F05905D83FE26B279DB7A63CECF99FF008F578AEA3A8DC6B1A84F77773C
          D757573234B34D339792576392CCC79249E493D6BE94D47FE09CFF0060D59AD7
          FE131DF86DBBBFB271FA79D5F57FEC75FF0006FC7863E2F69316BDE2AF889AD5
          CE9A93057B0D374C8ECE4906338F39E4971F8257D3D7E21C8F2CA4EBAB453FE5
          834DFDCBF33E5A870EE7B99D5541A736BF9A69A5F7BFC8F86BF618FD8BFC4DFB
          72FC79D37C21A041345621D67D6753D998749B407E7958F4DC46422FF13103A6
          48FE92BE1CF8034AF853E00D17C31A1DB2D9E8DE1FB2874FB2817FE59C312045
          1EE70064F73935CE7ECEDFB31F81BF651F87F17867C05E1EB3D034B521E5F2B2
          F35DC98C79934AC4BC8FEEC4E3A0C0E2BBDAFC2B8D38BE79DD78A82E5A50F853
          DDDF76FCFCBA7DE7EF1C15C1F0C8F0F2736A5567F135B24B64BCBCFAFC91FCEB
          7FC1673FE5269F157FEBF6D3FF00486DABE60AFDC4FDB07FE0827A4FED6FFB48
          F8A3E22DC7C4BD47439BC4D3453358C7A2A4EB6FB208E2C0733296CF979E83AD
          79AFFC430DA1FF00D160D5BFF09D8FFF00922BF58C9BC40C8F0F97D0A156B5A5
          18453F765BA8A4FA1F92E73E1F67B88CC2BD7A546F194E4D3E68ECE4DAFB47E6
          7695FB64FC5DD0B4BB6B1B1F8A3F10ECECACA2582DE087C45771C5046A02AA2A
          8930AA000001C002A7FF0086DEF8CFFF00456BE257FE14B79FFC72BF4ABFE218
          6D0FFE8B06ADFF0084EC7FFC9147FC430DA1FF00D160D5BFF09D8FFF00922B67
          C71C2ADDDC97FE0B97FF002262B81B8AD2B28BFF00C191FF00E48FCD5FF86DEF
          8CFF00F456BE257FE14B79FF00C72BF6F3FE0877F10B5FF89FFF0004FCD0B57F
          12EB7AB7883559754D411EF352BB92EAE1D5672141772588038033C57CDBFF00
          10C3687FF458356FFC2763FF00E48AFBABF60FFD90ADFF0061CFD9DAC3E1F5AE
          BB3788E1B0BBB8BA17B2DA8B667F3A42FB760660319C673CD7C5F1DF126478FC
          B951CB9A73E64F4838E9677D5A5E47DAF01F0DE7980CC9D7CC9350E46B59A96B
          756D137D99F8D5FF0005F5FF00949578A7FEC19A6FFE92A57C615FBB5FB75FFC
          10F74BFDB7BF68DD53E215D7C45BFF000ECDA95B5B5B9B18B474B958C4312C79
          DE655273B73D38CD78FF00FC430DA1FF00D160D5BFF09D8FFF00922BEA720E3D
          C930D96D0C3D6AD6942114D72C9EA92BEC8F96E20E01CF31599E2313468DE339
          C9A7CD15A37A6ECFB67FE098BFF28F7F83DFF62BD9FF00E8B15EEB5C47ECD7F0
          5A2FD9CFE01F847C090EA126AD178534C874D4BC78442D72235C6F2809DB9F4C
          9AEDEBF04CCAB42AE2EAD5A6EEA52935E8DB68FDF72DA33A383A54AA2B4A318A
          7EA924C28A28AE23B4FFD9}
        mmHeight = 19050
        mmLeft = 3440
        mmTop = 3175
        mmWidth = 19050
        BandType = 0
      end
      object pplblPeriodo: TppLabel
        UserName = 'lblContrato1'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 29633
        mmWidth = 13758
        BandType = 0
      end
      object pplblVlrPeriodo: TppLabel
        UserName = 'lblVlrPeriodo'
        Caption = 'lblVlrPeriodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 15875
        mmTop = 29633
        mmWidth = 17738
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 11377
      mmPrintPosition = 0
      object ppdbtxtVlrMensal: TppDBText
        UserName = 'dbtxtVlrMensal'
        DataField = 'VLRMENSAL'
        DataPipeline = pplANS
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplANS'
        mmHeight = 3440
        mmLeft = 9790
        mmTop = 794
        mmWidth = 19579
        BandType = 4
      end
      object ppdbtxtVlrANS: TppDBText
        UserName = 'dbtxtVlrANS'
        DataField = 'VLRANS'
        DataPipeline = pplANS
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplANS'
        mmHeight = 3440
        mmLeft = 38629
        mmTop = 794
        mmWidth = 18521
        BandType = 4
      end
      object ppdbtxtNumCI: TppDBText
        UserName = 'dbtxtNumCI'
        DataField = 'NUMCI'
        DataPipeline = pplANS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplANS'
        mmHeight = 3440
        mmLeft = 73289
        mmTop = 794
        mmWidth = 19579
        BandType = 4
      end
      object ppdbtxtRef: TppDBText
        UserName = 'dbtxtRef'
        DataField = 'REFERENCIA'
        DataPipeline = pplANS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplANS'
        mmHeight = 3440
        mmLeft = 105834
        mmTop = 1058
        mmWidth = 19579
        BandType = 4
      end
      object ppdbmmoObs: TppDBMemo
        UserName = 'dbmmoObs'
        CharWrap = False
        DataField = 'OBS'
        DataPipeline = pplANS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplANS'
        mmHeight = 8467
        mmLeft = 137584
        mmTop = 1323
        mmWidth = 57150
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 9790
      mmPrintPosition = 0
      object pplblModulo: TppLabel
        UserName = 'lblModulo'
        Caption = 'Contratos e Projetos \ Relatório ANS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 2117
        mmTop = 2646
        mmWidth = 46059
        BandType = 8
      end
      object pplblAreaUsu: TppLabel
        UserName = 'lblAreaUsu'
        Caption = 'FUNCEF / DIATI / GEAPE/ COPAD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 73554
        mmTop = 2381
        mmWidth = 44662
        BandType = 8
      end
      object ppsvarEmissao: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 169069
        mmTop = 2380
        mmWidth = 26194
        BandType = 8
      end
      object pplblEmissao: TppLabel
        UserName = 'lblEmissao'
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 156104
        mmTop = 2380
        mmWidth = 11769
        BandType = 8
      end
      object ppsvPag: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 177800
        mmTop = 6530
        mmWidth = 17484
        BandType = 8
      end
      object pplineRodape: TppLine
        UserName = 'lineRodape'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 265
        mmWidth = 197380
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 34925
      mmPrintPosition = 0
      object ppShapeTotGeral: TppShape
        UserName = 'ShapeTotGeral'
        mmHeight = 27252
        mmLeft = 2117
        mmTop = 3440
        mmWidth = 192882
        BandType = 7
      end
      object pplblTotalGeral: TppLabel
        UserName = 'lblTotContrato1'
        Caption = 'Resumo do Período'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 5027
        mmTop = 5292
        mmWidth = 29898
        BandType = 7
      end
      object ppLineTotGeral: TppLine
        UserName = 'LineTotGeral'
        Weight = 0.75
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 10054
        mmWidth = 189177
        BandType = 7
      end
      object pplblTotVlrMensallbl: TppLabel
        UserName = 'lblTotVlrMensallbl'
        Caption = 'Parcela Mensal:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 4763
        mmTop = 16404
        mmWidth = 23283
        BandType = 7
      end
      object ppDbTotVlrMensal: TppDBCalc
        UserName = 'DbTotVlrMensal'
        DataField = 'VLRMENSAL'
        DataPipeline = pplANS
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplANS'
        mmHeight = 3440
        mmLeft = 29104
        mmTop = 16404
        mmWidth = 29633
        BandType = 7
      end
      object pplblVlrANSlbl: TppLabel
        UserName = 'lblVlrANSlbl'
        Caption = 'Penalidade (ANS):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 4498
        mmTop = 21167
        mmWidth = 25929
        BandType = 7
      end
      object ppDbTotVlrANS: TppDBCalc
        UserName = 'DbTotVlrANS'
        DataField = 'VLRANS'
        DataPipeline = pplANS
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplANS'
        mmHeight = 3440
        mmLeft = 31485
        mmTop = 21167
        mmWidth = 29633
        BandType = 7
      end
      object pplblQtdContratoslbl: TppLabel
        UserName = 'lblQtdContratoslbl'
        Caption = 'Total de Contratos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 4763
        mmTop = 11642
        mmWidth = 28046
        BandType = 7
      end
      object pplblQtdContratos: TppLabel
        UserName = 'lblQtdContratos'
        Caption = 'lblQtdContratos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 33867
        mmTop = 11642
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Total Pago:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 4498
        mmTop = 25929
        mmWidth = 16140
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'TOTPAGO'
        DataPipeline = pplANS
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplANS'
        mmHeight = 3440
        mmLeft = 22225
        mmTop = 25929
        mmWidth = 29633
        BandType = 7
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'NOMECONTRATO'
      DataPipeline = pplANS
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplANS'
      object ppGroupHeaderBand8: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 15610
        mmPrintPosition = 0
        object pplblContrato: TppLabel
          UserName = 'lblContrato'
          Caption = 'Contrato:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 1058
          mmTop = 1058
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLine02: TppLine
          UserName = 'Line02'
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 794
          mmTop = 11641
          mmWidth = 196586
          BandType = 3
          GroupNo = 0
        end
        object ppLine01: TppLine
          UserName = 'Line01'
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 529
          mmTop = 6085
          mmWidth = 196850
          BandType = 3
          GroupNo = 0
        end
        object pplblVlrMensal: TppLabel
          UserName = 'lblVlrMensal'
          Caption = 'Parcela Mensal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 10583
          mmTop = 7144
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object pplblVlrANS: TppLabel
          UserName = 'lblVlrANS'
          Caption = 'Penalidade (ANS)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 38894
          mmTop = 7144
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object pplblNumCI: TppLabel
          UserName = 'lblNumCI'
          Caption = 'Solicitação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 73290
          mmTop = 7144
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object pplbl: TppLabel
          UserName = 'pplblRef'
          Caption = 'Mês/Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 105834
          mmTop = 7144
          mmWidth = 23019
          BandType = 3
          GroupNo = 0
        end
        object pplblObs: TppLabel
          UserName = 'lblObs'
          Caption = 'Observações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 137584
          mmTop = 7144
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object ppDbTxtContrato: TppDBText
          UserName = 'DbTxtContrato'
          DataField = 'NOMECONTRATO'
          DataPipeline = pplANS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplANS'
          mmHeight = 3440
          mmLeft = 15875
          mmTop = 1058
          mmWidth = 86784
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 33338
        mmPrintPosition = 0
        object ppShapeTotContrato: TppShape
          UserName = 'Shape1'
          mmHeight = 23813
          mmLeft = 1852
          mmTop = 3440
          mmWidth = 192882
          BandType = 5
          GroupNo = 0
        end
        object pplblTotContrato: TppLabel
          UserName = 'lblTotContrato'
          Caption = 'Somatório do Período do Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 5027
          mmTop = 5027
          mmWidth = 51065
          BandType = 5
          GroupNo = 0
        end
        object ppLineTotContrato: TppLine
          UserName = 'LineTotContrato'
          Weight = 0.75
          mmHeight = 4233
          mmLeft = 3440
          mmTop = 9790
          mmWidth = 189177
          BandType = 5
          GroupNo = 0
        end
        object pplblTotVlrMensalContr: TppLabel
          UserName = 'lblVlrMensal1'
          Caption = 'Parcela Mensal:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 4763
          mmTop = 11906
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object pplblTotVlrAnsContr: TppLabel
          UserName = 'lblVlrANS1'
          Caption = 'Penalidade (ANS):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 4498
          mmTop = 16933
          mmWidth = 25929
          BandType = 5
          GroupNo = 0
        end
        object ppdbCalcVlrMensal: TppDBCalc
          UserName = 'dbCalcVlrMensal'
          DataField = 'VLRMENSAL'
          DataPipeline = pplANS
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup8
          Transparent = True
          DataPipelineName = 'pplANS'
          mmHeight = 3440
          mmLeft = 30427
          mmTop = 11906
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Pen.Width = 3
          Weight = 2.25
          mmHeight = 3969
          mmLeft = 0
          mmTop = 29104
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
        object ppDbCalcVlrANS: TppDBCalc
          UserName = 'DbCalcVlrANS'
          DataField = 'VLRANS'
          DataPipeline = pplANS
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup8
          Transparent = True
          DataPipelineName = 'pplANS'
          mmHeight = 3440
          mmLeft = 31750
          mmTop = 16933
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Total Pago:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 4498
          mmTop = 21960
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DbCalcVlrANS1'
          DataField = 'TOTPAGO'
          DataPipeline = pplANS
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup8
          Transparent = True
          DataPipelineName = 'pplANS'
          mmHeight = 3440
          mmLeft = 21960
          mmTop = 22225
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
