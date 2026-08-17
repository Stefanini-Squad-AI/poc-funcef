inherited DmRelSaldosCustodia: TDmRelSaldosCustodia
  Left = 402
  Top = 203
  Width = 242
  Height = 251
  Caption = 'DmRelSaldosCustodia'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 21
    Top = 8
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
    Left = 19
    Top = 8
  end
  inherited qryExemplo: TwwQuery
    Left = 18
    Top = 8
  end
  inherited rpExemplo: TppReport
    Left = 18
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object pplSaldosCustodia: TppBDEPipeline
    DataSource = dsSaldosCustodia
    UserName = 'lExemplo1'
    Left = 117
    Top = 54
    object pplSaldosCustodiappField1: TppField
      FieldAlias = 'CUSTODIANTE'
      FieldName = 'CUSTODIANTE'
      FieldLength = 73
      DisplayWidth = 45
      Position = 0
    end
    object pplSaldosCustodiappField2: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 60
      DisplayWidth = 39
      Position = 1
    end
    object pplSaldosCustodiappField3: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 60
      DisplayWidth = 42
      Position = 2
    end
    object pplSaldosCustodiappField4: TppField
      FieldAlias = 'DESCMOTBLOQ'
      FieldName = 'DESCMOTBLOQ'
      FieldLength = 30
      DisplayWidth = 32
      Position = 3
    end
    object pplSaldosCustodiappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 14
      Position = 4
    end
    object pplSaldosCustodiappField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplSaldosCustodiappField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCUSTODIANTE'
      FieldName = 'IDCUSTODIANTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplSaldosCustodiappField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINVESTIMENTO'
      FieldName = 'IDINVESTIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplSaldosCustodiappField9: TppField
      FieldAlias = 'IDLOTE'
      FieldName = 'IDLOTE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object pplSaldosCustodiappField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCUSTODIA'
      FieldName = 'IDCUSTODIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
  end
  object dsSaldosCustodia: TwwDataSource
    AutoEdit = False
    DataSet = qrySaldosCustodia
    Left = 117
    Top = 102
  end
  object qrySaldosCustodia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   (CT.SGLCUSTODIANTE || '#39' - '#39' || PE.NOME) AS CUSTODIANTE, IV.DE' +
        'SCINVESTIMENTO, '
      '   CA.DESCCARTINVEST, MB.DESCMOTBLOQ, '
      
        '   DECODE(HC.IDMOTIVOBLOQUEIO, -1, HC.SALDOLIBERADO, HC.SALDOBLO' +
        'QUEADO) AS SALDO,'
      
        '   HC.IDCARTEIRAINVEST, HC.IDCUSTODIANTE, HC.IDINVESTIMENTO, HC.' +
        'IDLOTE, HC.IDCUSTODIA'
      ''
      
        'FROM HISTCUSTODIA HC, INVESTIMENTO IV, CARTEIRAINVEST CA, CUSTOD' +
        'IANTE CT, MOTIVOBLOQUEIO MB,'
      '     PESSOA PE'
      ''
      'WHERE HC.IDCUSTODIA IN'
      '         (SELECT MAX(H2.IDCUSTODIA)'
      '          FROM HISTCUSTODIA H2'
      
        '          WHERE ((:IDCARTEIRAINVEST IS NULL) OR (H2.IDCARTEIRAIN' +
        'VEST  = :IDCARTEIRAINVEST))'
      
        '            AND ((:IDINVESTIMENTO IS NULL) OR (H2.IDINVESTIMENTO' +
        ' = :IDINVESTIMENTO))'
      
        '            AND ((:IDCUSTODIANTE IS NULL) OR (H2.IDCUSTODIANTE  ' +
        '= :IDCUSTODIANTE))'
      
        '            AND (((:IDLOTE IS NOT NULL) AND (H2.IDLOTE = :IDLOTE' +
        ')) OR'
      
        '                 ((:IDLOTE IS NULL)     AND (H2.IDLOTE IS NULL))' +
        ')'
      
        '            AND (H2.DATAMOVCUSTOD || H2.IDCARTEIRAINVEST || H2.I' +
        'DINVESTIMENTO || H2.IDCUSTODIANTE || H2.IDMOTIVOBLOQUEIO) IN'
      
        '                     (SELECT MAX(H3.DATAMOVCUSTOD) || H3.IDCARTE' +
        'IRAINVEST || H3.IDINVESTIMENTO || H3.IDCUSTODIANTE || H3.IDMOTIV' +
        'OBLOQUEIO'
      '                      FROM HISTCUSTODIA H3'
      
        '                      WHERE ((:IDCARTEIRAINVEST IS NULL) OR (H3.' +
        'IDCARTEIRAINVEST  = :IDCARTEIRAINVEST))'
      
        '                        AND ((:IDINVESTIMENTO IS NULL) OR (H3.ID' +
        'INVESTIMENTO = :IDINVESTIMENTO))'
      
        '                        AND ((:IDCUSTODIANTE IS NULL) OR (H3.IDC' +
        'USTODIANTE  = :IDCUSTODIANTE))'
      
        '                        AND (((:IDLOTE IS NOT NULL) AND (H3.IDLO' +
        'TE = :IDLOTE)) OR'
      
        '                             ((:IDLOTE IS NULL)     AND (H3.IDLO' +
        'TE IS NULL)))'
      
        '                        AND H3.DATAMOVCUSTOD <= TO_DATE(:DATAMOV' +
        ', '#39'DD/MM/YYYY'#39')'
      
        '                      GROUP BY H3.IDCARTEIRAINVEST, H3.IDINVESTI' +
        'MENTO, H3.IDCUSTODIANTE, H3.IDMOTIVOBLOQUEIO)'
      
        '          GROUP BY H2.IDCARTEIRAINVEST || H2.IDINVESTIMENTO || H' +
        '2.IDCUSTODIANTE || H2.IDMOTIVOBLOQUEIO )'
      '  AND (HC.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (HC.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST)'
      '  AND (HC.IDCUSTODIANTE = CT.IDCUSTODIANTE)'
      '  AND (HC.IDMOTIVOBLOQUEIO = MB.IDMOTIVOBLOQUEIO)'
      '  AND (HC.IDCUSTODIANTE = PE.IDPESSOA)'
      '  AND ((HC.SALDOLIBERADO + HC.SALDOBLOQUEADO) <> 0)'
      ''
      
        'ORDER BY CT.SGLCUSTODIANTE, IV.DESCINVESTIMENTO, CA.DESCCARTINVE' +
        'ST, MB.DESCMOTBLOQ')
    ValidateWithMask = True
    Left = 117
    Top = 158
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
        Value = '28/09/2004'
      end>
    object qrySaldosCustodiaCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 45
      FieldName = 'CUSTODIANTE'
      Size = 73
    end
    object qrySaldosCustodiaDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 39
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qrySaldosCustodiaDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 42
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qrySaldosCustodiaDESCMOTBLOQ: TStringField
      DisplayLabel = 'Tipo de Saldo'
      DisplayWidth = 32
      FieldName = 'DESCMOTBLOQ'
      Size = 30
    end
    object qrySaldosCustodiaSALDO: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 14
      FieldName = 'SALDO'
      DisplayFormat = '###,###,###,##0'
    end
    object qrySaldosCustodiaIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qrySaldosCustodiaIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object qrySaldosCustodiaIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qrySaldosCustodiaIDLOTE: TStringField
      DisplayWidth = 10
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object qrySaldosCustodiaIDCUSTODIA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIA'
      Visible = False
    end
  end
  object rptSaldosCustodia: TppReport
    AutoStop = False
    DataPipeline = pplSaldosCustodia
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Saldos de Custodia'
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 117
    Top = 6
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplSaldosCustodia'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Saldos de Custódia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 32808
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
      object ppLabel3: TppLabel
        UserName = 'LCarteira'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 182827
        mmTop = 12171
        mmWidth = 12171
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
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object lblPeriodo: TppLabel
        UserName = 'lblPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object shpCabecalho: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        mmHeight = 3969
        mmLeft = 0
        mmTop = 18521
        mmWidth = 197115
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label2'
        Caption = 'Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 18521
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label3'
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 59531
        mmTop = 18521
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label4'
        Caption = 'Tipo de Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 121973
        mmTop = 18521
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label5'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 187855
        mmTop = 18521
        mmWidth = 8731
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 197379
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = pplSaldosCustodia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSaldosCustodia'
        mmHeight = 3175
        mmLeft = 3175
        mmTop = 0
        mmWidth = 55298
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DESCCARTINVEST'
        DataPipeline = pplSaldosCustodia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSaldosCustodia'
        mmHeight = 3175
        mmLeft = 59531
        mmTop = 0
        mmWidth = 61383
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DESCMOTBLOQ'
        DataPipeline = pplSaldosCustodia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSaldosCustodia'
        mmHeight = 3175
        mmLeft = 121709
        mmTop = 0
        mmWidth = 48154
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'SALDO'
        DataPipeline = pplSaldosCustodia
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldosCustodia'
        mmHeight = 3175
        mmLeft = 171186
        mmTop = 0
        mmWidth = 25400
        BandType = 4
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
        mmWidth = 197379
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
    object ppGroup1: TppGroup
      BreakName = 'CUSTODIANTE'
      DataPipeline = pplSaldosCustodia
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplSaldosCustodia'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object shpCustodiante: TppShape
          UserName = 'shpCustodiante'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 197379
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'CUSTODIANTE'
          DataPipeline = pplSaldosCustodia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplSaldosCustodia'
          mmHeight = 3969
          mmLeft = 24871
          mmTop = 0
          mmWidth = 145257
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label1'
          Caption = 'Custodiante:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 3175
          mmTop = 0
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 794
        mmPrintPosition = 0
      end
    end
  end
end
