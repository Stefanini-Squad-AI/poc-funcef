inherited dtmRelatoriosContrato: TdtmRelatoriosContrato
  Left = 135
  Top = 172
  Width = 589
  Height = 350
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
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
  object pplAditamentos: TppBDEPipeline
    DataSource = dsAditamentos
    UserName = 'lAditamentos'
    Left = 141
    Top = 192
  end
  object dsAditamentos: TwwDataSource
    DataSet = qryAditamentos
    Left = 85
    Top = 176
  end
  object qryAditamentos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.NOMECONTRATO,'
      '   A.DATAASSADITAMENTO,'
      '   A.CODADITAMENTO,'
      '   A.DESCADITAMENTO'
      'FROM'
      '   CONTRATOCONTR C,ADITAMENTO A'
      'WHERE'
      '   (C.IDCONTRATO = :IDCONTRATO) AND'
      '   (A.DATAASSADITAMENTO BETWEEN :DTINICIO AND :DTFIM) AND'
      '   (A.IDCONTRATO = C.IDCONTRATO)'
      'ORDER BY '
      '   C.NOMECONTRATO,'
      '   A.DATAASSADITAMENTO,'
      '   A.CODADITAMENTO'
      '')
    ValidateWithMask = True
    Left = 29
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
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
      end>
  end
  object rpAditamentos: TppReport
    AutoStop = False
    DataPipeline = pplAditamentos
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
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
    Left = 205
    Top = 208
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26458
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Aditamentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 85990
        mmTop = 8731
        mmWidth = 25400
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'ppLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21431
        mmWidth = 197300
        BandType = 0
      end
      object rpNomeEmpresaAdit: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'rpNomeEmpresaAdit'
        Caption = 'Nome Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 81227
        mmTop = 1588
        mmWidth = 37306
        BandType = 0
      end
      object rpAditamentosLabel1: TppLabel
        UserName = 'rpAditamentosLabel1'
        Caption = 'Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 4498
        mmTop = 16669
        mmWidth = 12965
        BandType = 0
      end
      object rpAditamentosDBText1: TppDBText
        UserName = 'rpAditamentosDBText1'
        AutoSize = True
        DataField = 'NOMECONTRATO'
        DataPipeline = pplAditamentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 19844
        mmTop = 16669
        mmWidth = 27781
        BandType = 0
      end
      object rpAditamentosLabel2: TppLabel
        UserName = 'rpAditamentosLabel2'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 5027
        mmTop = 21960
        mmWidth = 6879
        BandType = 0
      end
      object rpAditamentosLabel3: TppLabel
        UserName = 'rpAditamentosLabel3'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 42333
        mmTop = 21960
        mmWidth = 15346
        BandType = 0
      end
      object rpAditamentosLine1: TppLine
        UserName = 'rpAditamentosLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26194
        mmWidth = 197300
        BandType = 0
      end
      object rpAditamentosLabel4: TppLabel
        UserName = 'rpAditamentosLabel4'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 25135
        mmTop = 21960
        mmWidth = 10319
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 12171
      mmPrintPosition = 0
      object rpAditamentosDBText2: TppDBText
        UserName = 'rpAditamentosDBText2'
        DataField = 'DATAASSADITAMENTO'
        DataPipeline = pplAditamentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 529
        mmWidth = 18521
        BandType = 4
      end
      object rpAditamentosDBMemo1: TppDBMemo
        UserName = 'rpAditamentosDBMemo1'
        CharWrap = True
        DataField = 'DESCADITAMENTO'
        DataPipeline = pplAditamentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 11113
        mmLeft = 41540
        mmTop = 529
        mmWidth = 153459
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpAditamentosLine2: TppLine
        UserName = 'rpAditamentosLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object rpAditamentosDBText3: TppDBText
        UserName = 'rpAditamentosDBText3'
        DataField = 'CODADITAMENTO'
        DataPipeline = pplAditamentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 21431
        mmTop = 529
        mmWidth = 18521
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
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
        UserName = 'ppLabel3'
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
        mmTop = 3175
        mmWidth = 197909
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object pplContratoXCentroCusto: TppBDEPipeline
    DataSource = dsContratoXCentroCusto
    UserName = 'lContratoXCentroCusto'
    Left = 309
    Top = 144
  end
  object dsContratoXCentroCusto: TwwDataSource
    DataSet = qryContratoXCentroCusto
    Left = 221
    Top = 128
  end
  object qryContratoXCentroCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.NOMECONTRATO,C.VALORBASECONTRATO,CE.NOME'
      'FROM'
      'RATEIOCENTROCUSTO R,'
      'CONTRATOCONTR C,'
      'CENTCUST CE'
      'WHERE'
      '(R.IDCONTRATO = C.IDCONTRATO)'
      'AND (CE.CODCENTROCUSTO = R.CODCENTROCUSTO)')
    ValidateWithMask = True
    Left = 397
    Top = 128
  end
  object rpContratoXCentroCusto: TppReport
    AutoStop = False
    DataPipeline = pplContratoXCentroCusto
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
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
    Left = 493
    Top = 144
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        Caption = 'Título do Relatório'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8731
        mmWidth = 197380
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'ppLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel5: TppLabel
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
        mmLeft = 84138
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'ppLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel6: TppLabel
        UserName = 'ppLabel6'
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object qryContratos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
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
      
        'FROM CONTRATOCONTR C, OBJETOSXITEMCONTR OI, OBJETOCONTRATUAL O, ' +
        'ITEMCONTRATUAL I,'
      
        '     RATEIOCENTROCUSTO R, CENTCUST CC, PESSOA P, PESSOA RS, MOED' +
        'A M,'
      ''
      '     (SELECT AD1.DATAASSADITAMENTO,'
      '             AD1.IDCONTRATO'
      '      FROM ADITAMENTO AD1'
      '      WHERE (AD1.IDADITAMENTO=(SELECT MAX(AD2.IDADITAMENTO)'
      '                               FROM ADITAMENTO AD2'
      
        '                               WHERE (AD2.IDCONTRATO= AD1.IDCONT' +
        'RATO)))) ADT'
      ''
      'WHERE'
      '     (C.IDFORCLI=P.IDPESSOA(+))'
      '     AND (C.IDRESPONSAVEL=RS.IDPESSOA(+))'
      '     AND (C.IDCONTRATO IN'
      '              (SELECT IDCONTRATO FROM CONTRATOUSUARIO '
      '               WHERE IDUSUARIO = :IDUSUARIO))'
      '     AND (C.IDCONTRATO=OI.IDCONTRATO)'
      '     AND (OI.IDITEM=I.IDITEM)'
      '     AND (OI.IDOBJETO=O.IDOBJETO)'
      '     AND (OI.MOECODIGO=M.MOECODIGO(+))'
      '     AND (OI.IDCONTRATO=R.IDCONTRATO)'
      '     AND (OI.IDOBJETO=R.IDOBJETO)'
      '     AND (OI.IDITEM=R.IDITEM)'
      '     AND (R.IDEMPRESA=CC.IDEMPRESA)'
      '     AND (R.CODCENTROCUSTO=CC.CODCENTROCUSTO)'
      '     AND (C.IDCONTRATO = ADT.IDCONTRATO(+))'
      '     AND (C.IDPESSOA = :IDPESSOA)'
      
        '     AND ((RTRIM(C.FLGFIMCONTRATO) = :TIPOCONTRATO) OR ('#39'TODOS'#39' ' +
        '= :FLGCONTRATO))'
      
        '     AND ((C.DATAASSINATURA  BETWEEN :DTINICIO AND :DTFIM) OR ('#39 +
        'DTASS'#39' <> :TIPODATA))'
      
        '     AND ((C.DATAPREVENCERRA BETWEEN :DTINICIO AND :DTFIM) OR ('#39 +
        'DTVNC'#39' <> :TIPODATA))'
      'ORDER BY C.NOMECONTRATO, O.NOMEOBJETO, I.NOME_ITEM,CC.NOME'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 306
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPOCONTRATO'
        ParamType = ptInput
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
      end>
    object qryContratosNOMECONTRATO: TStringField
      FieldName = 'NOMECONTRATO'
      Size = 60
    end
    object qryContratosIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryContratosNOMEFORCLI: TStringField
      FieldName = 'NOMEFORCLI'
      Size = 60
    end
    object qryContratosIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qryContratosNOMERESP: TStringField
      FieldName = 'NOMERESP'
      Size = 60
    end
    object qryContratosDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object qryContratosDATABASECONTRATO: TDateTimeField
      FieldName = 'DATABASECONTRATO'
    end
    object qryContratosDATAPREVENCERRA: TDateTimeField
      FieldName = 'DATAPREVENCERRA'
    end
    object qryContratosDATAEFETENCERRA: TDateTimeField
      FieldName = 'DATAEFETENCERRA'
    end
    object qryContratosIDITEM: TFloatField
      FieldName = 'IDITEM'
    end
    object qryContratosNOME_ITEM: TStringField
      FieldName = 'NOME_ITEM'
      Size = 200
    end
    object qryContratosIDOBJETO: TFloatField
      FieldName = 'IDOBJETO'
    end
    object qryContratosNOMEOBJETO: TStringField
      FieldName = 'NOMEOBJETO'
      Size = 200
    end
    object qryContratosDATABASEITEM: TDateTimeField
      FieldName = 'DATABASEITEM'
    end
    object qryContratosMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryContratosMOEDESC: TStringField
      FieldName = 'MOEDESC'
    end
    object qryContratosQTDEITEM: TFloatField
      FieldName = 'QTDEITEM'
    end
    object qryContratosVALORUNITARIOOBJETO: TFloatField
      FieldName = 'VALORUNITARIOOBJETO'
    end
    object qryContratosVALORTOTALOBJETO: TFloatField
      FieldName = 'VALORTOTALOBJETO'
    end
    object qryContratosDATAINICIOCOBR: TDateTimeField
      FieldName = 'DATAINICIOCOBR'
    end
    object qryContratosOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 250
    end
    object qryContratosVALORBASECONTRATO: TFloatField
      FieldName = 'VALORBASECONTRATO'
    end
    object qryContratosTIPOC: TStringField
      FieldName = 'TIPOC'
      Size = 9
    end
    object qryContratosFREQ: TStringField
      FieldName = 'FREQ'
      Size = 6
    end
    object qryContratosTPCOB: TStringField
      FieldName = 'TPCOB'
      Size = 3
    end
    object qryContratosPERCRATEIOCONTR: TFloatField
      FieldName = 'PERCRATEIOCONTR'
    end
    object qryContratosNOMECC: TStringField
      FieldName = 'NOMECC'
      Size = 30
    end
    object qryContratosDATAADITAMENTO: TDateTimeField
      FieldName = 'DATAADITAMENTO'
    end
  end
  object dsContratos: TwwDataSource
    DataSet = qryContratos
    Left = 367
    Top = 16
  end
  object pplContratos: TppBDEPipeline
    DataSource = dsContratos
    UserName = 'lContratos'
    Left = 429
    Top = 16
  end
  object rpContratos: TppReport
    AutoStop = False
    DataPipeline = pplContratos
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
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
    Left = 490
    Top = 16
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        UserName = 'ppLabel7'
        Caption = 'Relatório de Controle de Contratos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 106892
        mmTop = 8731
        mmWidth = 70115
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'ppLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 284300
        BandType = 0
      end
      object rpNomeEmpresa: TppLabel
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
        mmWidth = 37306
        BandType = 0
      end
      object rpContratosLine1: TppLine
        UserName = 'rpContratosLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 284300
        BandType = 0
      end
      object rpContratosLine4: TppLine
        UserName = 'rpContratosLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 17198
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object rpContratosDBText17: TppDBText
        UserName = 'rpContratosDBText17'
        DataField = 'NOMECC'
        DataPipeline = pplContratos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 18521
        mmTop = 794
        mmWidth = 106627
        BandType = 4
      end
      object rpContratosDBText18: TppDBText
        UserName = 'rpContratosDBText18'
        DataField = 'PERCRATEIOCONTR'
        DataPipeline = pplContratos
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 128059
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppLabel9: TppLabel
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
      object rpContratosLine3: TppLine
        UserName = 'rpContratosLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
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
        mmLeft = 265
        mmTop = 794
        mmWidth = 281782
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
        mmLeft = 248180
        mmTop = 794
        mmWidth = 33867
        BandType = 8
      end
    end
    object rpContratosGroup1: TppGroup
      BreakName = 'NOMECONTRATO'
      DataPipeline = pplContratos
      ReprintOnSubsequentPage = False
      UserName = 'rpContratosGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpContratosGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 15875
        mmPrintPosition = 0
        object rpContratosShape1: TppShape
          UserName = 'rpContratosShape1'
          mmHeight = 6350
          mmLeft = 0
          mmTop = 0
          mmWidth = 284163
          BandType = 3
          GroupNo = 0
        end
        object rpContratosDBText1: TppDBText
          UserName = 'rpContratosDBText1'
          DataField = 'NOMECONTRATO'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 1058
          mmWidth = 279401
          BandType = 3
          GroupNo = 0
        end
        object rpContratosLabel1: TppLabel
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
          mmTop = 7144
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object rpContratosLabel2: TppLabel
          UserName = 'rpContratosLabel2'
          Caption = 'Assinatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 11377
          mmTop = 7144
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object rpContratosDBText2: TppDBText
          UserName = 'rpContratosDBText2'
          DataField = 'DATAASSINATURA'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 10319
          mmTop = 12171
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpContratosLabel3: TppLabel
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
          mmTop = 7144
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object rpContratosDBText3: TppDBText
          UserName = 'rpContratosDBText3'
          DataField = 'DATABASECONTRATO'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 29104
          mmTop = 12171
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpContratosLabel4: TppLabel
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
          mmTop = 7144
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object rpContratosDBText4: TppDBText
          UserName = 'rpContratosDBText4'
          DataField = 'DATAPREVENCERRA'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 47625
          mmTop = 12171
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpContratosLabel5: TppLabel
          UserName = 'rpContratosLabel5'
          Caption = 'Encerramento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 70115
          mmTop = 7144
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object rpContratosDBText5: TppDBText
          UserName = 'rpContratosDBText5'
          DataField = 'DATAEFETENCERRA'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 70379
          mmTop = 12171
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpContratosLabel6: TppLabel
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
          mmTop = 7144
          mmWidth = 30163
          BandType = 3
          GroupNo = 0
        end
        object rpContratosDBText6: TppDBText
          UserName = 'rpContratosDBText6'
          DataField = 'NOMERESP'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 92075
          mmTop = 12171
          mmWidth = 76994
          BandType = 3
          GroupNo = 0
        end
        object rpContratosLabel7: TppLabel
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
          mmTop = 7144
          mmWidth = 48419
          BandType = 3
          GroupNo = 0
        end
        object rpContratosDBText7: TppDBText
          UserName = 'rpContratosDBText7'
          DataField = 'NOMEFORCLI'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 170127
          mmTop = 12171
          mmWidth = 66675
          BandType = 3
          GroupNo = 0
        end
        object rpContratosLabel8: TppLabel
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
          mmTop = 7144
          mmWidth = 29104
          BandType = 3
          GroupNo = 0
        end
        object rpContratosDBText8: TppDBText
          UserName = 'rpContratosDBText8'
          DataField = 'VALORBASECONTRATO'
          DataPipeline = pplContratos
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 237861
          mmTop = 12171
          mmWidth = 26194
          BandType = 3
          GroupNo = 0
        end
        object rpContratosDBText9: TppDBText
          UserName = 'rpContratosDBText9'
          DataField = 'TIPOC'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 264848
          mmTop = 12171
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
      end
      object rpContratosGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 1852
        mmPrintPosition = 0
        object rpContratosLine2: TppLine
          UserName = 'rpContratosLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 529
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'ppLine6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 1058
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpContratosGroup2: TppGroup
      BreakName = 'NOMEOBJETO'
      DataPipeline = pplContratos
      UserName = 'rpContratosGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpContratosGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14023
        mmPrintPosition = 0
        object rpContratosLabel9: TppLabel
          UserName = 'rpContratosLabel9'
          Caption = 'Serviços/Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2381
          mmTop = 529
          mmWidth = 26988
          BandType = 3
          GroupNo = 1
        end
        object rpContratosDBText10: TppDBText
          UserName = 'rpContratosDBText10'
          DataField = 'NOMEOBJETO'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 2381
          mmTop = 5027
          mmWidth = 186267
          BandType = 3
          GroupNo = 1
        end
        object rpContratosLabel10: TppLabel
          UserName = 'rpContratosLabel10'
          Caption = ' Itens Contratuais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 7144
          mmTop = 9790
          mmWidth = 25929
          BandType = 3
          GroupNo = 1
        end
        object rpContratosLabel11: TppLabel
          UserName = 'rpContratosLabel11'
          Caption = ' Início Cobrança'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 134938
          mmTop = 9790
          mmWidth = 23019
          BandType = 3
          GroupNo = 1
        end
        object rpContratosLabel12: TppLabel
          UserName = 'rpContratosLabel12'
          Caption = 'Valor Item/Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 159279
          mmTop = 9790
          mmWidth = 26458
          BandType = 3
          GroupNo = 1
        end
        object rpContratosLabel13: TppLabel
          UserName = 'rpContratosLabel13'
          Caption = 'Medição ?'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 187590
          mmTop = 9790
          mmWidth = 14817
          BandType = 3
          GroupNo = 1
        end
        object rpContratosLabel14: TppLabel
          UserName = 'rpContratosLabel14'
          Caption = 'Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 203994
          mmTop = 9790
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
      end
      object rpContratosGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpContratosGroup3: TppGroup
      BreakName = 'NOME_ITEM'
      DataPipeline = pplContratos
      UserName = 'rpContratosGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpContratosGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9525
        mmPrintPosition = 0
        object rpContratosDBText11: TppDBText
          UserName = 'rpContratosDBText11'
          DataField = 'NOME_ITEM'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 9260
          mmTop = 1058
          mmWidth = 125942
          BandType = 3
          GroupNo = 2
        end
        object rpContratosDBText12: TppDBText
          UserName = 'rpContratosDBText12'
          DataField = 'DATAINICIOCOBR'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 137054
          mmTop = 1058
          mmWidth = 20902
          BandType = 3
          GroupNo = 2
        end
        object rpContratosDBText13: TppDBText
          UserName = 'rpContratosDBText13'
          DataField = 'VALORUNITARIOOBJETO'
          DataPipeline = pplContratos
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 162984
          mmTop = 1058
          mmWidth = 14817
          BandType = 3
          GroupNo = 2
        end
        object rpContratosDBText14: TppDBText
          UserName = 'rpContratosDBText14'
          DataField = 'TIPOC'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 187855
          mmTop = 1058
          mmWidth = 12965
          BandType = 3
          GroupNo = 2
        end
        object rpContratosDBText15: TppDBText
          UserName = 'rpContratosDBText15'
          DataField = 'QTDEITEM'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 204259
          mmTop = 1058
          mmWidth = 7938
          BandType = 3
          GroupNo = 2
        end
        object rpContratosLabel15: TppLabel
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
          mmLeft = 214048
          mmTop = 1058
          mmWidth = 50536
          BandType = 3
          GroupNo = 2
        end
        object rpContratosDBText16: TppDBText
          UserName = 'rpContratosDBText16'
          DataField = 'TPCOB'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 264848
          mmTop = 1058
          mmWidth = 17198
          BandType = 3
          GroupNo = 2
        end
        object rpContratosLabel16: TppLabel
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
          mmLeft = 16669
          mmTop = 5292
          mmWidth = 39688
          BandType = 3
          GroupNo = 2
        end
        object rpContratosLabel17: TppLabel
          UserName = 'rpContratosLabel17'
          Caption = 'Percentual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 128323
          mmTop = 5556
          mmWidth = 15610
          BandType = 3
          GroupNo = 2
        end
      end
      object rpContratosGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryEmpresa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.RAZAOSOCIAL,P.IDPESSOA,P.NUMDOCUMENTO, '
      
        '              L.IDINSCEST,D.NUMDOCUMENTO AS INSCEST,L.NUMLIVROEN' +
        'TRADA  '
      'FROM    PESSOA P,DOCPESSOA D,PARAMLIVRO L '
      'WHERE (P.IDPESSOA = :IdEmpresa) AND'
      '               (D.IDPESSOA = P.IDPESSOA) AND'
      '               (P.IDPESSOA = L.IDPESSOA) AND '
      '               (L.IDINSCEST = D.IDDOCUMENTO)')
    ValidateWithMask = True
    Left = 32
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdEmpresa'
        ParamType = ptUnknown
      end>
    object qryEmpresaRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = '"CM.PESSOA".RAZAOSOCIAL'
      Size = 60
    end
    object qryEmpresaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.PESSOA".IDPESSOA'
    end
    object qryEmpresaNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = '"CM.PESSOA".NUMDOCUMENTO'
      Size = 18
    end
    object qryEmpresaIDINSCEST: TFloatField
      FieldName = 'IDINSCEST'
      Origin = '"CM.PARAMLIVRO".IDINSCEST'
    end
    object qryEmpresaINSCEST: TStringField
      FieldName = 'INSCEST'
      Origin = '"CM.DOCPESSOA".NUMDOCUMENTO'
      Size = 18
    end
    object qryEmpresaNUMLIVROENTRADA: TFloatField
      FieldName = 'NUMLIVROENTRADA'
      Origin = '"CM.PARAMLIVRO".NUMLIVROENTRADA'
    end
  end
  object dsEmpresa: TwwDataSource
    DataSet = qryEmpresa
    Left = 95
    Top = 72
  end
  object pplEmpresa: TppBDEPipeline
    DataSource = dsEmpresa
    UserName = 'lEmpresa'
    Left = 157
    Top = 72
  end
  object qryPgto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  /*+ FIRST_ROWS */ C.NOMECONTRATO,'
      '        P.RAZAOSOCIAL,'
      
        '        D.NODOCUMENTO||DECODE(D.COMPLDOCUMENTO,'#39#39','#39' '#39','#39'/'#39')||D.CO' +
        'MPLDOCUMENTO AS DOC,'
      '        D.DATAPROGRAMADA,L.DATALANCTO,R.NUMCHQBORDERO,D.OBS,'
      
        '        DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,(L.VALOR' +
        '*-1)),DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,(L.VALOR*-1))) VALOR'
      
        'FROM CONTRATOCONTR C,MEDICAO M,PARCELAMEDICAO PM,DOCUMENTO D,LAN' +
        'CTODOCUM L,PESSOA P,RECBTOPAGTO R'
      'WHERE (C.IDCONTRATO = M.IDCONTRATO)'
      '       AND (M.IDMEDICAO = PM.IDMEDICAO)'
      '       AND (PM.CODDOCUMENTO = D.CODDOCUMENTO)'
      '       AND (C.IDCONTRATO IN'
      '              (SELECT IDCONTRATO FROM CONTRATOUSUARIO'
      '               WHERE IDUSUARIO = :IDUSUARIO))'
      '       AND (L.OPERACAO = '#39'5 '#39')'
      '       AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '       AND (L.ESTORNO IS NULL)'
      '       AND (D.IDFORCLI = P.IDPESSOA)'
      '       AND (L.NUMLANCTO = R.NUMLANCTO)'
      '       AND (C.IDCONTRATO = :IDCONTRATO)'
      '       AND (C.CODCONTRATOEMPR = :CODCONTRATOEMPR)'
      '       AND (C.IDFORCLI = :IDFORCLI)'
      '       AND (D.DATAPROGRAMADA BETWEEN :DTINICIO AND :DTFIM)'
      '       AND (D.RECPAG = :RECPAG)'
      '       AND (D.IDPESSOA = :IDPESSOA)'
      'ORDER BY D.DATAPROGRAMADA, P.RAZAOSOCIAL ')
    ValidateWithMask = True
    Left = 306
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCONTRATOEMPR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DTINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryPgtoCODCONTRATOEMPR: TStringField
      FieldName = 'CODCONTRATOEMPR'
    end
    object qryPgtoNOMECONTRATO: TStringField
      FieldName = 'NOMECONTRATO'
      Size = 60
    end
    object qryPgtoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryPgtoDOC: TStringField
      FieldName = 'DOC'
      Size = 44
    end
    object qryPgtoDATAPROGRAMADA: TDateTimeField
      FieldName = 'DATAPROGRAMADA'
    end
    object qryPgtoDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
    end
    object qryPgtoNUMCHQBORDERO: TStringField
      FieldName = 'NUMCHQBORDERO'
      Size = 15
    end
    object qryPgtoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1000
    end
    object qryPgtoVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object dsPgto: TwwDataSource
    DataSet = qryPgto
    Left = 367
    Top = 80
  end
  object pplPgto: TppBDEPipeline
    DataSource = dsPgto
    UserName = 'lPgto'
    Left = 429
    Top = 80
  end
  object rpPgto: TppReport
    AutoStop = False
    DataPipeline = pplPgto
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
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
    Left = 490
    Top = 80
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderPgto: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28840
      mmPrintPosition = 0
      object ppTitPagtoRec: TppLabel
        UserName = 'ppTitPagtoRec'
        Caption = 'Relatório de Pagamentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 116417
        mmTop = 8731
        mmWidth = 50800
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'ppLine7'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16404
        mmWidth = 284300
        BandType = 0
      end
      object rpNomeEmpresaPgto: TppLabel
        UserName = 'rpNomeEmpresaPgto'
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
        mmWidth = 37306
        BandType = 0
      end
      object rpPgtoLb1: TppLabel
        UserName = 'rpPgtoLb1'
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3704
        mmTop = 18256
        mmWidth = 15081
        BandType = 0
      end
      object rpPgtoLb2: TppLabel
        UserName = 'rpPgtoLb2'
        Caption = 'Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 51329
        mmTop = 18256
        mmWidth = 14288
        BandType = 0
      end
      object rpPgtoLb3: TppLabel
        UserName = 'rpPgtoLb3'
        Caption = 'Favorecido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 150813
        mmTop = 18256
        mmWidth = 18785
        BandType = 0
      end
      object rpPgtoLb4: TppLabel
        UserName = 'rpPgtoLb4'
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 247121
        mmTop = 18256
        mmWidth = 19050
        BandType = 0
      end
      object rpPgtoLb5: TppLabel
        UserName = 'rpPgtoLb5'
        Caption = 'Data Programada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 9525
        mmTop = 23813
        mmWidth = 29633
        BandType = 0
      end
      object rpPgtoLb6: TppLabel
        UserName = 'rpPgtoLb6'
        Caption = 'Data Lançamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 41275
        mmTop = 23813
        mmWidth = 29633
        BandType = 0
      end
      object rpPgtoLb7: TppLabel
        UserName = 'rpPgtoLb7'
        Caption = 'Num.Chq.Borderô'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 72231
        mmTop = 23813
        mmWidth = 29898
        BandType = 0
      end
      object rpPgtoLb8: TppLabel
        UserName = 'rpPgtoLb8'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 120650
        mmTop = 23813
        mmWidth = 8996
        BandType = 0
      end
      object rpPgtoLb9: TppLabel
        UserName = 'rpPgtoLb9'
        Caption = 'Observação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 131763
        mmTop = 23813
        mmWidth = 19844
        BandType = 0
      end
      object rpPgtoLine1: TppLine
        UserName = 'rpPgtoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 28310
        mmWidth = 284300
        BandType = 0
      end
      object rpPgtoLine4: TppLine
        UserName = 'rpPgtoLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 15875
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailPgto: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object rpPgtoDBT1: TppDBText
        UserName = 'rpPgtoDBT1'
        DataField = 'CODCONTRATOEMPR'
        DataPipeline = pplPgto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 1323
        mmWidth = 46567
        BandType = 4
      end
      object rpPgtoDBT2: TppDBText
        UserName = 'rpPgtoDBT2'
        DataField = 'NOMECONTRATO'
        DataPipeline = pplPgto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 51329
        mmTop = 1323
        mmWidth = 96044
        BandType = 4
      end
      object rpPgtoDBT3: TppDBText
        UserName = 'rpPgtoDBT3'
        DataField = 'RAZAOSOCIAL'
        DataPipeline = pplPgto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 150813
        mmTop = 1323
        mmWidth = 92869
        BandType = 4
      end
      object rpPgtoDBT4: TppDBText
        UserName = 'rpPgtoDBT4'
        DataField = 'DOC'
        DataPipeline = pplPgto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 247121
        mmTop = 1323
        mmWidth = 33338
        BandType = 4
      end
      object rpPgtoDBT5: TppDBText
        UserName = 'rpPgtoDBT5'
        DataField = 'DATAPROGRAMADA'
        DataPipeline = pplPgto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 9525
        mmTop = 6350
        mmWidth = 26194
        BandType = 4
      end
      object rpPgtoDBT6: TppDBText
        UserName = 'rpPgtoDBT6'
        DataField = 'DATALANCTO'
        DataPipeline = pplPgto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 41275
        mmTop = 6350
        mmWidth = 25400
        BandType = 4
      end
      object rpPgtoDBT7: TppDBText
        UserName = 'rpPgtoDBT7'
        DataField = 'NUMCHQBORDERO'
        DataPipeline = pplPgto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 72231
        mmTop = 6350
        mmWidth = 27517
        BandType = 4
      end
      object rpPgtoDBT8: TppDBText
        UserName = 'rpPgtoDBT8'
        DataField = 'VALOR'
        DataPipeline = pplPgto
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 102659
        mmTop = 6350
        mmWidth = 26988
        BandType = 4
      end
      object rpPgtoLine2: TppLine
        UserName = 'rpPgtoLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object dbmObs: TppDBMemo
        UserName = 'dbmObs'
        CharWrap = True
        DataField = 'OBS'
        DataPipeline = pplPgto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 5821
        mmLeft = 131763
        mmTop = 6350
        mmWidth = 148696
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppLabel10: TppLabel
        UserName = 'ppLabel10'
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
      object ppLine9: TppLine
        UserName = 'ppLine9'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
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
        mmLeft = 265
        mmTop = 794
        mmWidth = 281782
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
        mmLeft = 248180
        mmTop = 794
        mmWidth = 33867
        BandType = 8
      end
    end
    object rpPgtoSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object rpPgtoDBCalc1: TppDBCalc
        UserName = 'rpPgtoDBCalc1'
        DataField = 'VALOR'
        DataPipeline = pplPgto
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 102394
        mmTop = 794
        mmWidth = 27252
        BandType = 7
      end
      object rpPgtoLabel1: TppLabel
        UserName = 'rpPgtoLabel1'
        Caption = 'Total -->'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 86254
        mmTop = 794
        mmWidth = 12700
        BandType = 7
      end
      object rpPgtoLine3: TppLine
        UserName = 'rpPgtoLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
      end
    end
  end
end
