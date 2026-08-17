inherited dtmRelFinanc: TdtmRelFinanc
  Left = 310
  Top = 71
  Width = 383
  Height = 501
  Caption = 'dtmRelFinanc'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 25
    Top = 8
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
    Left = 25
    Top = 21
  end
  inherited qryExemplo: TwwQuery
    Left = 25
    Top = 34
  end
  inherited rpExemplo: TppReport
    Left = 26
    Top = 48
    DataPipelineName = 'pplExemplo'
  end
  object qryContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     PF.IDPARCFINANCIMOV,'
      '     PF.IDCONDPAGIMOVEL,'
      '     PF.IDCONTRATOIMOVEL,'
      '     PF.IDCONDINICIAL,'
      ''
      '     CI.CONNUMERO,'
      '     CI.CONNOME,'
      '     CI.VLRPROPOSTA,'
      '     CI.CONDATAASSINATURA,'
      ''
      '     P.RAZAOSOCIAL,'
      '     IM.NOMEMESTRE,'
      ''
      '     PF.CODDOCUMENTO,'
      '     PF.PLNCODIGO,'
      '     PF.NUMPARCELA,'
      '     PF.DATAVENCIMENTO,'
      '     PF.VLRPRESTACAO,'
      '     PF.VLRNOMINAL,'
      '     PF.VLRJUROS,'
      '     PF.VLRJUROSPARC,'
      '     PF.VLRAMORTIZACAO,'
      '     PF.VLRSALDODEVEDOR,'
      '     PF.VLRSALDOATUAL,'
      '     PF.VLRPRESTATUALIZADA,'
      
        '     NVL(PF.VLRRESIDUO,0) + NVL(PF.VLRCORRSALDO,0) AS VLRRESIDUO' +
        ','
      '     PF.VLRRESIDUOATUALI,'
      '     PF.VLRCORRIGIDOATRASO,'
      '     PF.VLRMULTAATRASO,'
      '     PF.VLRMORAATRASO,'
      '     PF.FLGTIPOLANC,'
      '     MPF.MOESIGLA  AS DSCINDPARC,'
      '     CM.COTVALOR,'
      '     PF.FATORCORRECAO'
      ''
      'FROM'
      '     ('
      
        '      SELECT CP.IDCONTRATOIMOVEL, CP.IDCONDPAGIMOVEL,  CP.TIPOCO' +
        'NDPAG,'
      
        '             CP.IDCONDINICIAL,    CP.MESREFREAJUSTE,   PF.IDINDC' +
        'ORRECAO,      PF.VLRCORRSALDO,'
      
        '             PF.IDPARCFINANCIMOV, PF.CODDOCUMENTO,     PF.PLNCOD' +
        'IGO,          PF.VLRJUROSPARC,'
      
        '             PF.NUMPARCELA,       PF.DATAVENCIMENTO,   PF.VLRPRE' +
        'STACAO,       PF.VLRJUROS,'
      
        '             PF.VLRAMORTIZACAO,   PF.VLRSALDODEVEDOR,  PF.VLRPRE' +
        'STATUALIZADA, PF.VLRSALDOATUAL,'
      
        '             PF.VLRRESIDUO,       PF.VLRRESIDUOATUALI, PF.VLRCOR' +
        'RIGIDOATRASO, PF.FATORCORRECAO,'
      
        '             PF.VLRMULTAATRASO,   PF.VLRMORAATRASO,    PF.FLGTIP' +
        'OLANC,        PF.VLRNOMINAL'
      '        FROM CONDPAGIMOVEL CP, PARCFINANCIMOV PF'
      '       WHERE'
      
        '         1=2 AND PF.DATAVENCIMENTO BETWEEN CP.DATAINI AND CP.DAT' +
        'AFIM'
      '         AND CP.IDCONDINICIAL = PF.IDCONDPAGIMOVEL'
      
        '         AND ( (:pIDCONTRATOIMOVEL IS NULL) OR (CP.IDCONTRATOIMO' +
        'VEL = :pIDCONTRATOIMOVEL) )'
      ''
      '      ) PF,'
      ''
      '     CONTRATOIMOVEL CI,'
      '     MOEDA MPF,'
      '     COTACAOMOEDA CM,'
      '     PESSOA P,'
      ''
      '     ( SELECT DISTINCT'
      '              CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL,'
      '              M.IMONOME  AS NOMEMESTRE,'
      '              M.IDIMOVEL AS IDIMOVEL'
      '       FROM'
      '              CONTRATOXIMOVEL CXI,'
      '              IMOVEL I,'
      '              IMOVEL M'
      '       WHERE'
      '              CXI.IDIMOVEL = I.IDIMOVEL AND'
      '              I.IDIMOVELMESTRE = M.IDIMOVEL ) IM'
      ''
      'WHERE'
      '     1=2 AND (PF.FLGTIPOLANC IN (1,2,3,4,7,8,9,10,11,12))'
      '     AND (PF.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      '     AND (MPF.MOECODIGO(+) = PF.IDINDCORRECAO)'
      '     AND (CM.MOECODIGO(+) = PF.IDINDCORRECAO)'
      
        '     AND (CM.COTMESREF(+) = TO_CHAR(ADD_MONTHS(PF.DATAVENCIMENTO' +
        ',PF.MESREFREAJUSTE*(-1)),'#39'MMYYYY'#39') )'
      '     AND (P.IDPESSOA(+) = CI.IDLOCATARIO)'
      '     AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL)'
      
        '     AND ( (:pIDCONTRATOIMOVEL IS NULL) OR (CI.IDCONTRATOIMOVEL ' +
        '= :pIDCONTRATOIMOVEL) )'
      
        '     AND ( (:pIDCOMPRADOR IS NULL) OR (CI.IDLOCATARIO = :pIDCOMP' +
        'RADOR) )'
      
        '     AND ( (:pIDRESPONSAVEL IS NULL) OR (CI.IDRESPONSAVEL = :pID' +
        'RESPONSAVEL) )'
      '     AND ( (:pIDIMOVEL IS NULL) OR (IM.IDIMOVEL = :pIDIMOVEL) )'
      ''
      'ORDER BY CONNUMERO, IDCONDPAGIMOVEL, DATAVENCIMENTO, FLGTIPOLANC'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 34
    Top = 100
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCOMPRADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCOMPRADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDIMOVEL'
        ParamType = ptUnknown
      end>
  end
  object dsContrato: TwwDataSource
    DataSet = qryContrato
    Left = 124
    Top = 99
  end
  object pplContato: TppBDEPipeline
    DataSource = dsContrato
    UserName = 'lContrato'
    Left = 218
    Top = 99
    object pplContatoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPARCFINANCIMOV'
      FieldName = 'IDPARCFINANCIMOV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplContatoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONDPAGIMOVEL'
      FieldName = 'IDCONDPAGIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplContatoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplContatoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONDINICIAL'
      FieldName = 'IDCONDINICIAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplContatoppField5: TppField
      FieldAlias = 'CONNUMERO'
      FieldName = 'CONNUMERO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object pplContatoppField6: TppField
      FieldAlias = 'CONNOME'
      FieldName = 'CONNOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object pplContatoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPROPOSTA'
      FieldName = 'VLRPROPOSTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplContatoppField8: TppField
      FieldAlias = 'CONDATAASSINATURA'
      FieldName = 'CONDATAASSINATURA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object pplContatoppField9: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object pplContatoppField10: TppField
      FieldAlias = 'NOMEMESTRE'
      FieldName = 'NOMEMESTRE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 9
    end
    object pplContatoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplContatoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplContatoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMPARCELA'
      FieldName = 'NUMPARCELA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplContatoppField14: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 13
    end
    object pplContatoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPRESTACAO'
      FieldName = 'VLRPRESTACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplContatoppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRNOMINAL'
      FieldName = 'VLRNOMINAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplContatoppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRJUROS'
      FieldName = 'VLRJUROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplContatoppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRJUROSPARC'
      FieldName = 'VLRJUROSPARC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplContatoppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRAMORTIZACAO'
      FieldName = 'VLRAMORTIZACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplContatoppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRSALDODEVEDOR'
      FieldName = 'VLRSALDODEVEDOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplContatoppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRSALDOATUAL'
      FieldName = 'VLRSALDOATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplContatoppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPRESTATUALIZADA'
      FieldName = 'VLRPRESTATUALIZADA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplContatoppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRESIDUO'
      FieldName = 'VLRRESIDUO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplContatoppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRESIDUOATUALI'
      FieldName = 'VLRRESIDUOATUALI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplContatoppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCORRIGIDOATRASO'
      FieldName = 'VLRCORRIGIDOATRASO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplContatoppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMULTAATRASO'
      FieldName = 'VLRMULTAATRASO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplContatoppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMORAATRASO'
      FieldName = 'VLRMORAATRASO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplContatoppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGTIPOLANC'
      FieldName = 'FLGTIPOLANC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object pplContatoppField29: TppField
      FieldAlias = 'DSCINDPARC'
      FieldName = 'DSCINDPARC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 28
    end
    object pplContatoppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'COTVALOR'
      FieldName = 'COTVALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object pplContatoppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'FATORCORRECAO'
      FieldName = 'FATORCORRECAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
  end
  object rpContrato: TppReport
    AutoStop = False
    DataPipeline = pplContato
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
    Left = 306
    Top = 104
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplContato'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17463
      mmPrintPosition = 0
      object ppLabel14: TppLabel
        UserName = 'Label11'
        Caption = 'Espelho de Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 114829
        mmTop = 8731
        mmWidth = 41540
        BandType = 0
      end
      object ppLabel16: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 121709
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        BlankWhenZero = True
        DataField = 'NUMPARCELA'
        DataPipeline = pplContato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 0
        mmWidth = 7144
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'DATAVENCIMENTO'
        DataPipeline = pplContato
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 13758
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        BlankWhenZero = True
        DataField = 'VLRPRESTACAO'
        DataPipeline = pplContato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 165100
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        BlankWhenZero = True
        DataField = 'VLRJUROS'
        DataPipeline = pplContato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 77258
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        BlankWhenZero = True
        DataField = 'VLRAMORTIZACAO'
        DataPipeline = pplContato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 121179
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        BlankWhenZero = True
        DataField = 'VLRSALDOATUAL'
        DataPipeline = pplContato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 33338
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        BlankWhenZero = True
        DataField = 'VLRPRESTATUALIZADA'
        DataPipeline = pplContato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 187061
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        BlankWhenZero = True
        DataField = 'VLRRESIDUO'
        DataPipeline = pplContato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 143140
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        BlankWhenZero = True
        DataField = 'VLRRESIDUOATUALI'
        DataPipeline = pplContato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 210080
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        DataField = 'DSCINDPARC'
        DataPipeline = pplContato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 233628
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'COTVALOR'
        DataPipeline = pplContato
        DisplayFormat = '##0.0000 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 246328
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText301'
        DataField = 'FATORCORRECAO'
        DataPipeline = pplContato
        DisplayFormat = '0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 264584
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        BlankWhenZero = True
        DataField = 'VLRNOMINAL'
        DataPipeline = pplContato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 55298
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        BlankWhenZero = True
        DataField = 'VLRJUROSPARC'
        DataPipeline = pplContato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContato'
        mmHeight = 3175
        mmLeft = 99219
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel17: TppLabel
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
        mmWidth = 282311
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
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
        mmWidth = 282311
        BandType = 8
      end
      object ppSystemVariable6: TppSystemVariable
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
        mmLeft = 256117
        mmTop = 3440
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = pplContato
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContato'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 21960
        mmPrintPosition = 0
        object ppRegion1: TppRegion
          UserName = 'Region1'
          Brush.Style = bsClear
          Transparent = True
          mmHeight = 20108
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel31: TppLabel
            UserName = 'Label31'
            Caption = 'Contrato:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 1588
            mmTop = 1323
            mmWidth = 15875
            BandType = 3
            GroupNo = 0
          end
          object ppDBText18: TppDBText
            UserName = 'DBText18'
            AutoSize = True
            DataField = 'CONNUMERO'
            DataPipeline = pplContato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplContato'
            mmHeight = 3969
            mmLeft = 29898
            mmTop = 1588
            mmWidth = 23548
            BandType = 3
            GroupNo = 0
          end
          object ppDBText19: TppDBText
            UserName = 'DBText19'
            DataField = 'CONNOME'
            DataPipeline = pplContato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplContato'
            mmHeight = 3969
            mmLeft = 54769
            mmTop = 1588
            mmWidth = 144198
            BandType = 3
            GroupNo = 0
          end
          object ppLabel32: TppLabel
            UserName = 'Label32'
            Caption = 'Valor da  Venda:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3175
            mmLeft = 54504
            mmTop = 7938
            mmWidth = 21696
            BandType = 3
            GroupNo = 0
          end
          object ppDBText20: TppDBText
            UserName = 'DBText20'
            DataField = 'VLRPROPOSTA'
            DataPipeline = pplContato
            DisplayFormat = '#,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplContato'
            mmHeight = 3175
            mmLeft = 82286
            mmTop = 7938
            mmWidth = 17198
            BandType = 3
            GroupNo = 0
          end
          object ppLabel37: TppLabel
            UserName = 'Label37'
            Caption = 'Data de Assinatura'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3175
            mmLeft = 1588
            mmTop = 7938
            mmWidth = 24871
            BandType = 3
            GroupNo = 0
          end
          object ppDBText25: TppDBText
            UserName = 'DBText25'
            DataField = 'CONDATAASSINATURA'
            DataPipeline = pplContato
            DisplayFormat = 'dd/mm/yyyy'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplContato'
            mmHeight = 3175
            mmLeft = 29898
            mmTop = 7938
            mmWidth = 15081
            BandType = 3
            GroupNo = 0
          end
          object ppLabel38: TppLabel
            UserName = 'Label38'
            Caption = 'Comprador:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3175
            mmLeft = 1588
            mmTop = 14552
            mmWidth = 15875
            BandType = 3
            GroupNo = 0
          end
          object ppDBText26: TppDBText
            UserName = 'DBText26'
            AutoSize = True
            DataField = 'RAZAOSOCIAL'
            DataPipeline = pplContato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplContato'
            mmHeight = 3175
            mmLeft = 30163
            mmTop = 14552
            mmWidth = 20108
            BandType = 3
            GroupNo = 0
          end
          object ppLabel39: TppLabel
            UserName = 'Label39'
            Caption = 'Imóvel Mestre:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3175
            mmLeft = 114300
            mmTop = 7938
            mmWidth = 19579
            BandType = 3
            GroupNo = 0
          end
          object ppDBText28: TppDBText
            UserName = 'DBText28'
            AutoSize = True
            DataField = 'NOMEMESTRE'
            DataPipeline = pplContato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplContato'
            mmHeight = 3175
            mmLeft = 138642
            mmTop = 7938
            mmWidth = 20373
            BandType = 3
            GroupNo = 0
          end
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDCONDINICIAL'
      DataPipeline = pplContato
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContato'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppSubReport1: TppSubReport
          UserName = 'SubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'pplCondPag'
          mmHeight = 5292
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = pplCondPag
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
            Left = 136
            Top = 192
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplCondPag'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object ppLabel86: TppLabel
                UserName = 'Label86'
                AutoSize = False
                Caption = 'Condição de Pagamento:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsItalic]
                Transparent = True
                mmHeight = 3704
                mmLeft = 0
                mmTop = 794
                mmWidth = 37835
                BandType = 1
              end
            end
            object ppDetailBand7: TppDetailBand
              BeforePrint = ppDetailBand7BeforePrint
              mmBottomOffset = 0
              mmHeight = 8467
              mmPrintPosition = 0
              object ppLabel97: TppLabel
                UserName = 'Label302'
                AutoSize = False
                Caption = 'Saldo Devedor:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 4233
                mmLeft = 29633
                mmTop = 0
                mmWidth = 20373
                BandType = 4
              end
              object ppDBText66: TppDBText
                UserName = 'DBText66'
                BlankWhenZero = True
                DataField = 'VLRFINANC'
                DataPipeline = pplCondPag
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplCondPag'
                mmHeight = 4233
                mmLeft = 51329
                mmTop = 0
                mmWidth = 21696
                BandType = 4
              end
              object ppLabel98: TppLabel
                UserName = 'Label98'
                AutoSize = False
                Caption = 'Nr. Parcelas:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 4233
                mmLeft = 76465
                mmTop = 0
                mmWidth = 17992
                BandType = 4
              end
              object ppDBText67: TppDBText
                UserName = 'DBText67'
                DataField = 'NUMPARCELAS'
                DataPipeline = pplCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplCondPag'
                mmHeight = 4233
                mmLeft = 94721
                mmTop = 0
                mmWidth = 9790
                BandType = 4
              end
              object ppLabel103: TppLabel
                UserName = 'Label103'
                AutoSize = False
                Caption = 'Juros:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 4233
                mmLeft = 140494
                mmTop = 0
                mmWidth = 8996
                BandType = 4
              end
              object ppLabel105: TppLabel
                UserName = 'Label105'
                AutoSize = False
                Caption = 'Correção:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 4233
                mmLeft = 218017
                mmTop = 0
                mmWidth = 13758
                BandType = 4
              end
              object ppDBText68: TppDBText
                UserName = 'DBText68'
                DataField = 'DSCINDCORR'
                DataPipeline = pplCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplCondPag'
                mmHeight = 4233
                mmLeft = 232040
                mmTop = 0
                mmWidth = 18785
                BandType = 4
              end
              object ppLabel106: TppLabel
                UserName = 'Label106'
                AutoSize = False
                Caption = 'Projeção:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 4233
                mmLeft = 251619
                mmTop = 0
                mmWidth = 13758
                BandType = 4
              end
              object ppDBText69: TppDBText
                UserName = 'DBText69'
                DataField = 'DSCINDPROJ'
                DataPipeline = pplCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplCondPag'
                mmHeight = 4233
                mmLeft = 265642
                mmTop = 0
                mmWidth = 18785
                BandType = 4
              end
              object ppDBText21: TppDBText
                UserName = 'DBText1'
                DataField = 'DSCTIPO'
                DataPipeline = pplCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplCondPag'
                mmHeight = 4233
                mmLeft = 2910
                mmTop = 0
                mmWidth = 25665
                BandType = 4
              end
              object ppLabel18: TppLabel
                UserName = 'Label1'
                AutoSize = False
                Caption = 'Data de Início:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 4233
                mmLeft = 175419
                mmTop = 4233
                mmWidth = 20638
                BandType = 4
              end
              object ppDBText22: TppDBText
                UserName = 'DBText2'
                DataField = 'DATAINI'
                DataPipeline = pplCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplCondPag'
                mmHeight = 4233
                mmLeft = 196321
                mmTop = 4233
                mmWidth = 21167
                BandType = 4
              end
              object ppLabel19: TppLabel
                UserName = 'Label2'
                AutoSize = False
                Caption = '1o.Vencto:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 4233
                mmLeft = 106098
                mmTop = 0
                mmWidth = 15081
                BandType = 4
              end
              object ppDBText23: TppDBText
                UserName = 'DBText3'
                DataField = 'DATAVENCIMENTO'
                DataPipeline = pplCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplCondPag'
                mmHeight = 4233
                mmLeft = 121444
                mmTop = 0
                mmWidth = 18256
                BandType = 4
              end
              object ppDBText24: TppDBText
                UserName = 'DBText24'
                DataField = 'DSCJUROS'
                DataPipeline = pplCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplCondPag'
                mmHeight = 4233
                mmLeft = 150019
                mmTop = 0
                mmWidth = 24606
                BandType = 4
              end
              object lblFormaCalculo: TppLabel
                UserName = 'lblFormaCalculo'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 4233
                mmLeft = 55827
                mmTop = 4233
                mmWidth = 118798
                BandType = 4
              end
              object ppLabel6: TppLabel
                UserName = 'Label3'
                AutoSize = False
                Caption = 'Forma de Calculo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 4233
                mmLeft = 29633
                mmTop = 4233
                mmWidth = 25400
                BandType = 4
              end
              object ppLabel11: TppLabel
                UserName = 'Label4'
                AutoSize = False
                Caption = 'Correção Proj.:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 4233
                mmLeft = 175419
                mmTop = 0
                mmWidth = 20373
                BandType = 4
              end
              object ppDBText5: TppDBText
                UserName = 'DBText302'
                DataField = 'PERINDPROJ'
                DataPipeline = pplCondPag
                DisplayFormat = '#0.000000 % am'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplCondPag'
                mmHeight = 4233
                mmLeft = 196321
                mmTop = 0
                mmWidth = 21167
                BandType = 4
              end
            end
            object ppSummaryBand3: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'IDCONDINICIAL'
      DataPipeline = pplContato
      OutlineSettings.CreateNode = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContato'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10848
        mmPrintPosition = 0
        object ppLine19: TppLine
          UserName = 'Line19'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 2
        end
        object ppLabel20: TppLabel
          UserName = 'Label203'
          AutoSize = False
          Caption = 'Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1058
          mmTop = 794
          mmWidth = 11113
          BandType = 3
          GroupNo = 2
        end
        object ppLabel21: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 13494
          mmTop = 794
          mmWidth = 17992
          BandType = 3
          GroupNo = 2
        end
        object ppLabel22: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Prestação Efetiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 169598
          mmTop = 794
          mmWidth = 16933
          BandType = 3
          GroupNo = 2
        end
        object ppLabel23: TppLabel
          UserName = 'Label1101'
          AutoSize = False
          Caption = 'Juros Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 88371
          mmTop = 794
          mmWidth = 10319
          BandType = 3
          GroupNo = 2
        end
        object ppLabel24: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Amortização'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 123296
          mmTop = 794
          mmWidth = 19315
          BandType = 3
          GroupNo = 2
        end
        object ppLabel25: TppLabel
          UserName = 'Label25'
          AutoSize = False
          Caption = 'Saldo Devedor Atualizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 32808
          mmTop = 794
          mmWidth = 21960
          BandType = 3
          GroupNo = 2
        end
        object ppLabel27: TppLabel
          UserName = 'Label27'
          AutoSize = False
          Caption = 'Prestação Atualizada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 190236
          mmTop = 794
          mmWidth = 18256
          BandType = 3
          GroupNo = 2
        end
        object ppLabel28: TppLabel
          UserName = 'Label28'
          AutoSize = False
          Caption = 'Correção / Resíduo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 148961
          mmTop = 794
          mmWidth = 15610
          BandType = 3
          GroupNo = 2
        end
        object ppLabel29: TppLabel
          UserName = 'Label29'
          AutoSize = False
          Caption = 'Resíduo Atualizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 213784
          mmTop = 794
          mmWidth = 17727
          BandType = 3
          GroupNo = 2
        end
        object ppLine20: TppLine
          UserName = 'Line20'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 8731
          mmWidth = 284300
          BandType = 3
          GroupNo = 2
        end
        object ppLabel30: TppLabel
          UserName = 'Label30'
          AutoSize = False
          Caption = 'Fator Corr.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 265378
          mmTop = 794
          mmWidth = 16404
          BandType = 3
          GroupNo = 2
        end
        object ppLabel33: TppLabel
          UserName = 'Label33'
          AutoSize = False
          Caption = 'Indice de Correção'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 232834
          mmTop = 794
          mmWidth = 28310
          BandType = 3
          GroupNo = 2
        end
        object ppLabel5: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Prestação Nominal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 61119
          mmTop = 794
          mmWidth = 15610
          BandType = 3
          GroupNo = 2
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Juros Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 108744
          mmTop = 794
          mmWidth = 11906
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryExtrato: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryExtratoCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PF.IDPARCFINANCIMOV,'
      '       PF.IDCONDPAGIMOVEL,  '
      '       CI.IDCONTRATOIMOVEL, '
      '       CI.CONNUMERO,        '
      '       CI.CONNOME,          '
      '       CI.VLRPROPOSTA,      '
      '       CI.CONDATAINICIO,    '
      '       CI.IDCIDADES,        '
      '       CI.IDPAIS,           '
      '       CI.CODESTADO,'
      '       P.RAZAOSOCIAL,       '
      '       IM.NOMEMESTRE,       '
      '       PF.CODDOCUMENTO,     '
      '       PF.PLNCODIGO,        '
      '       ALT.TOT_ALTERADOR,   '
      '       CPMF.TOT_CPMF,       '
      '       DECODE(NVL(PF.FLGTIPOLANC,1), 1, 0, '
      
        '          DECODE(PF.CODDOCUMENTO, NULL, PF.IDPARCFINANCIMOV, PF.' +
        'CODDOCUMENTO) ) AS NUMDOC, '
      '       PF.NUMPARCELA AS NUMPARC, '
      
        '       DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || '#39'/'#39 +
        ' || TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA, '
      
        '       DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENT' +
        'O) AS DATAVENCIMENTO, '
      
        '       TO_CHAR(PF.DATAVENCIMENTO,'#39'MMYYYY'#39') AS MESANO_VENCIMENTO,' +
        ' '
      #39'082006'#39' AS MESANO_CALCULO, '
      '       CPFINAL.INDCORRECAO    AS IDCORR_CONDPAG, '
      '       CPFINAL.MESREFREAJUSTE AS MESREF_CONDPAG, '
      '       CPFINAL.TIPOCONDPAG, '
      '       CPFINAL.NUMPARCELAS, '
      '       ROUND(PF.VLRPRESTACAO,2) AS VLRPRESTACAO, '
      '       PF.VLRNOMINAL,       '
      
        '       PF.VLRPRESTACAO + NVL(ALT.TOT_ALTERADOR,0) AS TOT_DEVIDO,' +
        ' '
      '       PF.VLRJUROS,         '
      '       ROUND(PF.VLRAMORTIZACAO,2) AS VLRAMORTIZACAO, '
      '       PF.VLRSALDODEVEDOR,    '
      '       PF.VLRSALDOATUAL,      '
      '       PF.VLRPRESTATUALIZADA, '
      '       PF.VLRRESIDUO,         '
      '       PF.VLRRESIDUOATUALI,   '
      
        '       (NVL(PF.VLRRESIDUO,0) + NVL(AR.VLRRESIDUOCORRIG,0)) as VL' +
        'RRESIDUOCORRIG,   '
      '       CR.DATACOBRES,         '
      '       PF.IDINDCORRECAO,      '
      '       PF.VLRCORRIGIDOATRASO, '
      '       PF.VLRMULTAATRASO,     '
      '       PF.VLRMORAATRASO,      '
      '       NVL(PF.FLGRESIDUOINCORP,'#39'N'#39') AS FLGRESIDUOINCORP,   '
      '       PF.FLGTIPOLANC,        '
      '       DECODE(PF.IDREPACTUA, NULL, PF.FLGLANCINTEGRA, '
      '              DECODE(CD2.FLGTIPO, NULL,               '
      '                     DECODE(PF.CODDOCUMENTO, NULL,    '
      
        '                            DECODE(NVL(PF.VLRPAGO,0), 0, 0, 3), ' +
        '2), 5) ) AS FLGLANCINTEGRA, '
      '       PF.DATALIMITE,         '
      '       PP.DATAPAGAMENTO,      '
      '       ROUND(NVL(PP.VLRPAGO,0),2) AS VLRPAGO, '
      '       NVL(CD2.CONCILIADOC, '#39'N'#39') AS FLGCONCILIADO, '
      '       PF.IDREPACTUA,         '
      '       CD.IDDOCDIVERGE,       '
      '       TO_DATE('#39'11/08/2006'#39','#39'DD/MM/YYYY'#39') AS DATA_BASE, '
      '       CO2.DTAPUR AS DATA_CORRECAO, '
      '       DECODE(NVL(CD2.CONCILIADOC, '#39'N'#39'), '#39'S'#39', 0, '#39'C'#39', 0,    '
      '          DECODE(NVL(PP.VLRPAGO,0), 0, 0,              '
      
        '                     NVL(PF.VLRPRESTACAO,0) + NVL(CO1.TOT_CORREC' +
        'AO,0) + NVL(ALT.TOT_ALTERADOR,0) - NVL(PP.VLRPAGO,0) )) AS VLRDI' +
        'F, '
      '       DECODE(CD.IDDOCDIVERGE, NULL,                   '
      '          DECODE(NVL(CD2.CONCILIADOC, '#39'N'#39'), '#39'S'#39', 0, '#39'C'#39', 0, '
      
        '                 NVL(PF.VLRPRESTACAO,0)  + NVL(CO2.TOT_CORRECAO,' +
        '0) + NVL(ALT.TOT_ALTERADOR,0) - NVL(PP.VLRPAGO,0) - NVL(ABONO.TO' +
        'T_ABONO,0) ), NULL) AS VLRCORRIG '
      '  FROM  '
      '       PARCFINANCIMOV PF, '
      '       CONDPAGIMOVEL  CP, '
      '       CONTRATOIMOVEL CI, '
      '       PESSOA P,          '
      '       ( '
      '         SELECT /*+ INDEX(LD) INDEX(RP)*/   '
      '                IDPARCFINANCIMOV, '
      
        '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.DATAPAGAMENTO' +
        '), MAX(RP.DATABAIXA) ) AS DATAPAGAMENTO, '
      
        '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.VLRPAGO), SUM' +
        '(LD.VALOR) ) AS VLRPAGO '
      
        '           FROM PARCFINANCIMOV P, LANCTODOCUM LD, RECBTOPAGTO RP' +
        ' '
      '          WHERE P.CODDOCUMENTO  = LD.CODDOCUMENTO(+) '
      '            AND LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) '
      '            AND LD.NUMLANCTO    = RP.NUMLANCTO(+)    '
      '            AND ( (P.CODDOCUMENTO IS NULL) OR        '
      
        '                  (P.CODDOCUMENTO IS NOT NULL AND (RP.DATABAIXA ' +
        'IS NOT NULL OR LD.CODALTERADOR = 215) ) )        '
      
        '            AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENTO <' +
        '=  TO_DATE('#39'11/08/2006'#39','#39'DD/MM/YYYY'#39')  ) OR '
      
        '                 (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPER' +
        'ACAO) = '#39'5'#39' OR LD.CODALTERADOR = 215 ) '
      
        '                                             AND LD.ESTORNO IS N' +
        'ULL                  '
      
        '                                             AND LD.DATALANCTO <' +
        '=  TO_DATE('#39'11/08/2006'#39','#39'DD/MM/YYYY'#39')  ) )  '
      
        '          GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO             ' +
        '                     '
      '       ) PP, '
      '       ( SELECT DISTINCT  '
      '                IDPARCFINANCIMOV, '
      
        '                DECODE(IDDOCDIVERGE, NULL, NULL, 1) AS IDDOCDIVE' +
        'RGE '
      '           FROM CONCILIADOC '
      '          WHERE IDPARCFINANCIMOV IS NOT NULL '
      '            AND DATA <=  TO_DATE('#39'11/08/2006'#39','#39'DD/MM/YYYY'#39') '
      '            AND (IDDOCDIVERGE IS NOT NULL OR '
      
        '                 IDPARCFINANCIMOV NOT IN ( SELECT DISTINCT IDPAR' +
        'CFINANCIMOV    '
      
        '                                             FROM CONCILIADOC   ' +
        '               '
      
        '                                            WHERE IDPARCFINANCIM' +
        'OV IS NOT NULL '
      
        '                                              AND DATA <=  TO_DA' +
        'TE('#39'11/08/2006'#39','#39'DD/MM/YYYY'#39') '
      
        '                                              AND IDDOCDIVERGE I' +
        'S NOT NULL ) ) '
      '       ) CD,  '
      
        '       (  SELECT IDPARCFINANCIMOV, DATA, FLGTIPO,               ' +
        '   '
      '                 DECODE(FLGTIPO,'#39'M'#39', DECODE(QTDE,3,'#39'S'#39','#39'P'#39'), '
      '                                '#39'J'#39', DECODE(QTDE,3,'#39'S'#39','#39'P'#39'), '
      '                                '#39'C'#39', DECODE(QTDE,3,'#39'S'#39','#39'P'#39'), '
      
        '                                CONCILIADOC ) AS CONCILIADOC    ' +
        '   '
      '            FROM '
      
        '                 ( SELECT C.IDPARCFINANCIMOV,                   ' +
        '                '
      
        '                          DECODE(C.FLGTIPO, NULL, NULL,         ' +
        '                '
      
        '                                 '#39'R'#39', '#39'S'#39', '#39'T'#39', '#39'S'#39', '#39'M'#39','#39'P'#39','#39'J'#39 +
        ','#39'P'#39','#39'C'#39','#39'P'#39', '
      
        '                                 '#39'A'#39', '#39'C'#39', P.FLGCONCILIADO ) AS ' +
        'CONCILIADOC,'
      
        '                          MAX(C.DATA) AS DATA, MAX(C.FLGTIPO) AS' +
        ' FLGTIPO, COUNT(*) AS QTDE '
      
        '                     FROM CONCILIADOC C, PARCFINANCIMOV P       ' +
        '                '
      
        '                    WHERE C.IDPARCFINANCIMOV = P.IDPARCFINANCIMO' +
        'V               '
      
        '                      AND C.FLGTIPO IN('#39'R'#39','#39'T'#39', '#39'A'#39','#39'M'#39','#39'J'#39','#39'C'#39')' +
        '    '
      
        '                      AND C.DATA <=  TO_DATE('#39'11/08/2006'#39','#39'DD/MM' +
        '/YYYY'#39') '
      
        '                      AND ( C.FLGTIPO = '#39'T'#39' OR                  ' +
        '              '
      
        '                            NOT EXISTS ( SELECT 1 FROM CONCILIAD' +
        'OC              '
      
        '                                          WHERE FLGTIPO = '#39'T'#39'   ' +
        '              '
      
        '                                            AND IDPARCFINANCIMOV' +
        ' = C.IDPARCFINANCIMOV ) ) '
      
        '                    GROUP BY C.IDPARCFINANCIMOV,                ' +
        '                '
      
        '                             DECODE(C.FLGTIPO, NULL, NULL,      ' +
        '                '
      
        '                                 '#39'R'#39', '#39'S'#39', '#39'T'#39', '#39'S'#39', '#39'M'#39','#39'P'#39','#39'J'#39 +
        ','#39'P'#39','#39'C'#39','#39'P'#39', '
      
        '                                 '#39'A'#39', '#39'C'#39', P.FLGCONCILIADO ) ) )' +
        ' CD2,       '
      '       ( SELECT A.IDCONDINICIAL  AS IDCONDINICIAL, '
      '                A.NUMPARCELAS    AS NUMPARCELAS,   '
      '                A.DATAINI,         '
      '                A.IDCONDPAGIMOVEL, '
      '                A.INDCORRECAO,     '
      '                A.MESREFREAJUSTE,  '
      '                DECODE(A.TIPOCONDPAG, '#39'V'#39', '#39'A Vista'#39', '
      '                                      '#39'S'#39', '#39'Sinal'#39',   '
      '                                      '#39'C'#39', '#39'Caução'#39',  '
      
        '                                      '#39'P'#39', '#39'Parcelamento'#39' ) AS T' +
        'IPOCONDPAG '
      '         FROM   CONDPAGIMOVEL A,                  '
      '                (SELECT   IDCONDINICIAL,          '
      '                          MAX(DATAINI) AS DATAINI '
      '                 FROM     CONDPAGIMOVEL           '
      '                 GROUP BY IDCONDINICIAL) B        '
      '         WHERE B.IDCONDINICIAL = A.IDCONDINICIAL  '
      '           AND B.DATAINI = A.DATAINI ) CPFINAL,   '
      '       ( SELECT DISTINCT                          '
      '                CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL, '
      '                M.IMONOME            AS NOMEMESTRE,       '
      '                M.IDIMOVEL           AS IDIMOVEL          '
      '           FROM CONTRATOXIMOVEL CXI, '
      '                IMOVEL I,            '
      '                IMOVEL M             '
      '          WHERE CXI.IDIMOVEL = I.IDIMOVEL           '
      '            AND I.IDIMOVELMESTRE = M.IDIMOVEL ) IM, '
      '       ( SELECT /*+ INDEX(D) INDEX(LD)*/            '
      '                LD.CODDOCUMENTO, T.CODTIPIMOVEL,    '
      
        '                SUM( DECODE(LD.DEBCRE,'#39'D'#39', LD.VALOR, (LD.VALOR *' +
        ' -1)) ) AS TOT_ALTERADOR '
      
        '           FROM LANCTODOCUM LD, DOCUMENTO D, PARAMALIENACAO PA, ' +
        '         '
      
        '                PARCFINANCIMOV P, CONDPAGIMOVEL C,  TIPOIMOVEL T' +
        ',        '
      
        '                ( SELECT DISTINCT C.IDCONTRATOIMOVEL, I.CODTIPIM' +
        'OVEL     '
      
        '                    FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI, ' +
        'IMOVEL I '
      
        '                   WHERE CXI.IDIMOVEL = I.IDIMOVEL              ' +
        '         '
      
        '                     AND CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOV' +
        'EL       '
      
        '                     AND C.FLGTIPOCONTRATO IN ('#39'C'#39','#39'A'#39') ) TC    ' +
        '              '
      '          WHERE RTRIM(LD.OPERACAO) = '#39'4'#39'                  '
      '            AND LD.CODALTERADOR <> 215                      '
      '         AND LD.CODALTERADOR <> 216                      '
      '            AND PA.IDPESSOA = 1'
      '            AND LD.CODDOCUMENTO = D.CODDOCUMENTO            '
      '            AND D.CODDOCUMENTO = P.CODDOCUMENTO             '
      '            AND P.IDCONDPAGIMOVEL = C.IDCONDPAGIMOVEL       '
      '            AND C.IDCONTRATOIMOVEL = TC.IDCONTRATOIMOVEL    '
      '            AND TC.CODTIPIMOVEL = T.CODTIPIMOVEL            '
      
        '            AND LD.DATALANCTO <=  TO_DATE('#39'11/08/2006'#39','#39'DD/MM/YY' +
        'YY'#39') '
      '            AND ( PA.IDOPERATUALCM IS NULL OR               '
      '                  ( LD.CODALTERADOR <> T.CODALTCMAL AND     '
      '                    LD.CODALTERADOR <> T.CODALTJRAL AND     '
      '                    LD.CODALTERADOR <> T.CODALTMTAL ) )     '
      '            AND D.IDMODULO = 135                            '
      '          GROUP BY LD.CODDOCUMENTO, T.CODTIPIMOVEL  )  ALT, '
      '       ( SELECT /*+ INDEX (D) INDEX(LD) */                  '
      '                LD.CODDOCUMENTO,                            '
      
        '                SUM( DECODE(LD.DEBCRE,'#39'D'#39', LD.VALOR, (LD.VALOR *' +
        ' -1)) ) AS TOT_CPMF '
      '           FROM LANCTODOCUM LD,                  '
      '                DOCUMENTO D                      '
      '          WHERE RTRIM(LD.OPERACAO) = '#39'4'#39'       '
      '            AND CODALTERADOR = 215               '
      '            AND LD.CODDOCUMENTO = D.CODDOCUMENTO '
      '            AND D.IDMODULO = 135                 '
      '          GROUP BY LD.CODDOCUMENTO  )  CPMF,     '
      
        '       ( SELECT D1.IDPARCFINANCIMOV, D1.DATAOPER, D1.VLRRESIDUOC' +
        'ORRIG                       '
      
        '           FROM ( SELECT /*+ INDEX (L) */                       ' +
        '                            '
      
        '                         L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.V' +
        'LRACUM) AS VLRRESIDUOCORRIG '
      
        '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P    ' +
        '                            '
      
        '                   WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39')    ' +
        '                                              '
      '                     AND P.IDPESSOA = 1'
      '                     AND L.IDMODULO = 135'
      '   AND L.IDCONTRATOIMOVEL = 1848'
      
        '                     AND ( L.IDOPERACAO = P.IDOPERATUALRES )    ' +
        '    '
      
        '                   GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,' +
        '    '
      
        '                ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV, ' +
        'MAX(L2.DATAOPER) AS DTAPUR '
      
        '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2  ' +
        '      '
      
        '                   WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39')    ' +
        '    '
      '                     AND P2.IDPESSOA = 1'
      '                     AND L2.IDMODULO = 135'
      '   AND L2.IDCONTRATOIMOVEL = 1848'
      
        '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALRES )  ' +
        '  '
      
        '                     AND ( DATAOPER <=  TO_DATE('#39'11/08/2006'#39','#39'DD' +
        '/MM/YYYY'#39') )             '
      
        '                   GROUP BY L2.IDPARCFINANCIMOV ) D2            ' +
        '  '
      
        '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV       ' +
        '  '
      
        '            AND D1.DATAOPER = D2.DTAPUR                         ' +
        '  '
      
        '        ) AR,                                                   ' +
        '  '
      '        ( SELECT IDPARCCOBRADA, DATACOBRANCA AS DATACOBRES '
      '            FROM PARCEXTRAIMOV                             '
      '           WHERE FLGTIPOCOBRANCA = '#39'R'#39'                   '
      '         ) CR,                                             '
      
        '       ( SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.TOT_CORRECAO ' +
        '            '
      
        '           FROM ( SELECT /*+ INDEX (L) */                       ' +
        '            '
      
        '                         L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.V' +
        'LRACUM) AS TOT_CORRECAO '
      
        '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P    ' +
        '            '
      
        '                   WHERE L.DATABAIXA IS NOT NULL                ' +
        '            '
      
        '                     AND (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39')    ' +
        '                              '
      '                     AND L.IDMODULO = 135'
      '                     AND P.IDPESSOA = 1'
      '   AND L.IDCONTRATOIMOVEL = 1848'
      
        '                     AND ( L.IDOPERACAO = P.IDOPERATUALMULTA OR ' +
        '            '
      
        '                           L.IDOPERACAO = P.IDOPERATUALJUROS OR ' +
        '            '
      
        '                           L.IDOPERACAO = P.IDOPERATUALCM )     ' +
        '            '
      
        '                   GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,' +
        '            '
      
        '                ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,M' +
        'AX(L2.DATAOPER) AS DTAPUR '
      
        '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2  ' +
        '      '
      
        '                   WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39')    ' +
        '                       '
      '                     AND P2.IDPESSOA = 1'
      '                     AND L2.IDMODULO = 135'
      '   AND L2.IDCONTRATOIMOVEL = 1848'
      
        '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA O' +
        'R    '
      
        '                           L2.IDOPERACAO = P2.IDOPERATUALJUROS O' +
        'R    '
      
        '                           L2.IDOPERACAO = P2.IDOPERATUALCM )   ' +
        '     '
      
        '                     AND ( DATAOPER <=  TO_DATE('#39'11/08/2006'#39','#39'DD' +
        '/MM/YYYY'#39') )                '
      '                   GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '            AND D1.DATAOPER = D2.DTAPUR                   '
      '       ) CO1,                                             '
      
        '       ( SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.TOT_CORRECAO ' +
        '            '
      
        '           FROM ( SELECT /*+ INDEX (L) */                       ' +
        '            '
      
        '                         L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.V' +
        'LRACUM) AS TOT_CORRECAO '
      
        '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P    ' +
        '            '
      
        '                   WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39')    ' +
        '                              '
      '                     AND L.IDMODULO = 135'
      '                     AND P.IDPESSOA = 1'
      '   AND L.IDCONTRATOIMOVEL = 1848'
      
        '                     AND ( L.IDOPERACAO = P.IDOPERATUALMULTA OR ' +
        '            '
      
        '                           L.IDOPERACAO = P.IDOPERATUALJUROS OR ' +
        '            '
      
        '                           L.IDOPERACAO = P.IDOPERATUALCM )     ' +
        '            '
      
        '                   GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,' +
        '            '
      
        '                ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,M' +
        'AX(L2.DATAOPER) AS DTAPUR '
      
        '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2  ' +
        '      '
      
        '                   WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39')    ' +
        '                       '
      '                     AND P2.IDPESSOA = 1'
      '                     AND L2.IDMODULO = 135'
      '   AND L2.IDCONTRATOIMOVEL = 1848'
      
        '                     AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA O' +
        'R    '
      
        '                           L2.IDOPERACAO = P2.IDOPERATUALJUROS O' +
        'R    '
      
        '                           L2.IDOPERACAO = P2.IDOPERATUALCM )   ' +
        '     '
      
        '                     AND ( DATAOPER <=  TO_DATE('#39'11/08/2006'#39','#39'DD' +
        '/MM/YYYY'#39') )                '
      '                   GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '            AND D1.DATAOPER = D2.DTAPUR                   '
      '        ) CO2,                                            '
      
        '       ( SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.TOT_ABONO    ' +
        '         '
      
        '           FROM ( SELECT /*+ INDEX (L) */                       ' +
        '            '
      
        '                         L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.V' +
        'LRACUM) AS TOT_ABONO '
      
        '                    FROM LANCOPERDIAIMOB L, PARAMALIENACAO P    ' +
        '            '
      
        '                   WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39')    ' +
        '                             '
      '                     AND L.IDMODULO = 135'
      '                     AND P.IDPESSOA = 1'
      '   AND L.IDCONTRATOIMOVEL = 1848'
      
        '                     AND ( L.IDOPERACAO = P.IDOPERABONOMULTA OR ' +
        '            '
      
        '                           L.IDOPERACAO = P.IDOPERABONOJUROS OR ' +
        '            '
      
        '                           L.IDOPERACAO = P.IDOPERABONOCM )     ' +
        '            '
      
        '                   GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1,' +
        '            '
      
        '                ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,M' +
        'AX(L2.DATAOPER) AS DTAPUR '
      
        '                    FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2  ' +
        '      '
      
        '                   WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39')    ' +
        '                       '
      '                     AND P2.IDPESSOA = 1'
      '                     AND L2.IDMODULO = 135'
      '   AND L2.IDCONTRATOIMOVEL = 1848'
      
        '                     AND ( L2.IDOPERACAO = P2.IDOPERABONOMULTA O' +
        'R    '
      
        '                           L2.IDOPERACAO = P2.IDOPERABONOJUROS O' +
        'R    '
      
        '                           L2.IDOPERACAO = P2.IDOPERABONOCM )   ' +
        '     '
      
        '                     AND ( DATAOPER <=  TO_DATE('#39'11/08/2006'#39','#39'DD' +
        '/MM/YYYY'#39') )                '
      '                   GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '          WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '            AND D1.DATAOPER = D2.DTAPUR                   '
      '        ) ABONO                                          '
      '  WHERE (PF.FLGTIPOLANC IN (1,2,3,4,5,6,7,8,9,10,12))  '
      '    AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)      '
      '    AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)    '
      '    AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL)  '
      '    AND (P.IDPESSOA(+) = CI.IDLOCATARIO)               '
      '    AND (PP.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '
      '    AND (CO1.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)'
      '    AND (CO2.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)'
      '    AND (ABONO.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)'
      '    AND (AR.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '
      '    AND (CR.IDPARCCOBRADA(+)    = PF.IDPARCFINANCIMOV) '
      '    AND (CD.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)  '
      '    AND (CD2.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV) '
      '    AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL)  '
      '    AND (ALT.CODDOCUMENTO(+) = PF.CODDOCUMENTO)         '
      '    AND (CPMF.CODDOCUMENTO(+) = PF.CODDOCUMENTO)        '
      '    AND CI.IDCONTRATOIMOVEL = 1848'
      
        '    AND ( (PF.DATAVENCIMENTO IS NULL) OR (PF.DATAVENCIMENTO <=  ' +
        'TO_DATE('#39'11/08/2006'#39','#39'DD/MM/YYYY'#39') ) OR '
      
        '          (PP.DATAPAGAMENTO <=  TO_DATE('#39'11/08/2006'#39','#39'DD/MM/YYYY' +
        #39') ) )'
      
        '  ORDER BY CI.CONNUMERO, PF.IDCONDPAGIMOVEL, DATAVENCIMENTO, PF.' +
        'FLGTIPOLANC, NUMPARCELA '
      ' ')
    UpdateObject = updExtrato
    ValidateWithMask = True
    Left = 34
    Top = 170
    object qryExtratoIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
    end
    object qryExtratoIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryExtratoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryExtratoCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryExtratoCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object qryExtratoCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
    end
    object qryExtratoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryExtratoNOMEMESTRE: TStringField
      FieldName = 'NOMEMESTRE'
      Size = 60
    end
    object qryExtratoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryExtratoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryExtratoNUMPARCELA: TStringField
      FieldName = 'NUMPARCELA'
      Size = 81
    end
    object qryExtratoDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryExtratoVLRJUROS: TFloatField
      FieldName = 'VLRJUROS'
    end
    object qryExtratoVLRAMORTIZACAO: TFloatField
      FieldName = 'VLRAMORTIZACAO'
    end
    object qryExtratoVLRSALDODEVEDOR: TFloatField
      FieldName = 'VLRSALDODEVEDOR'
    end
    object qryExtratoVLRPRESTATUALIZADA: TFloatField
      FieldName = 'VLRPRESTATUALIZADA'
    end
    object qryExtratoVLRRESIDUO: TFloatField
      FieldName = 'VLRRESIDUO'
    end
    object qryExtratoVLRRESIDUOATUALI: TFloatField
      FieldName = 'VLRRESIDUOATUALI'
    end
    object qryExtratoVLRCORRIGIDOATRASO: TFloatField
      FieldName = 'VLRCORRIGIDOATRASO'
    end
    object qryExtratoVLRMULTAATRASO: TFloatField
      FieldName = 'VLRMULTAATRASO'
    end
    object qryExtratoVLRMORAATRASO: TFloatField
      FieldName = 'VLRMORAATRASO'
    end
    object qryExtratoFLGTIPOLANC: TFloatField
      FieldName = 'FLGTIPOLANC'
    end
    object qryExtratoDATAPAGAMENTO: TDateTimeField
      FieldName = 'DATAPAGAMENTO'
    end
    object qryExtratoVLRPAGO: TFloatField
      FieldName = 'VLRPAGO'
    end
    object qryExtratoCAL_TIPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CAL_TIPO'
      Calculated = True
    end
    object qryExtratoVLRDIF: TFloatField
      FieldName = 'VLRDIF'
    end
    object qryExtratoVLRPROPOSTA: TFloatField
      FieldName = 'VLRPROPOSTA'
    end
    object qryExtratoIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
    end
    object qryExtratoIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object qryExtratoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryExtratoVLRPRESTACAO: TFloatField
      FieldName = 'VLRPRESTACAO'
    end
    object qryExtratoFLGRESIDUOINCORP: TStringField
      FieldName = 'FLGRESIDUOINCORP'
      FixedChar = True
      Size = 1
    end
    object qryExtratoVLRCORRIG: TFloatField
      FieldName = 'VLRCORRIG'
    end
    object qryExtratoFLGLANCINTEGRA: TFloatField
      FieldName = 'FLGLANCINTEGRA'
    end
    object qryExtratoCAL_ABONO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CAL_ABONO'
      Calculated = True
    end
    object qryExtratoFLGCONCILIADO: TStringField
      FieldName = 'FLGCONCILIADO'
      FixedChar = True
      Size = 1
    end
    object qryExtratoIDREPACTUA: TFloatField
      FieldName = 'IDREPACTUA'
    end
    object qryExtratoTOT_ALTERADOR: TFloatField
      FieldName = 'TOT_ALTERADOR'
    end
    object qryExtratoTOT_DEVIDO: TFloatField
      FieldName = 'TOT_DEVIDO'
    end
    object qryExtratoVLRNOMINAL: TFloatField
      FieldName = 'VLRNOMINAL'
    end
    object qryExtratoVLRSALDOATUAL: TFloatField
      FieldName = 'VLRSALDOATUAL'
    end
    object qryExtratoIDDOCDIVERGE: TStringField
      FieldName = 'IDDOCDIVERGE'
      Size = 1
    end
    object qryExtratoDATALIMITE: TDateTimeField
      FieldName = 'DATALIMITE'
    end
    object qryExtratoVLRRESIDUOCORRIG: TFloatField
      FieldName = 'VLRRESIDUOCORRIG'
    end
    object qryExtratoIDCORR_CONDPAG: TFloatField
      FieldName = 'IDCORR_CONDPAG'
    end
    object qryExtratoMESREF_CONDPAG: TFloatField
      FieldName = 'MESREF_CONDPAG'
    end
    object qryExtratoTOT_CPMF: TFloatField
      FieldName = 'TOT_CPMF'
    end
    object qryExtratoTIPOCONDPAG: TStringField
      FieldName = 'TIPOCONDPAG'
      Size = 12
    end
    object qryExtratoNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryExtratoDATA_CORRECAO: TDateTimeField
      FieldName = 'DATA_CORRECAO'
    end
    object qryExtratoMESANO_VENCIMENTO: TStringField
      FieldName = 'MESANO_VENCIMENTO'
      Size = 6
    end
    object qryExtratoMESANO_CALCULO: TStringField
      FieldName = 'MESANO_CALCULO'
      FixedChar = True
      Size = 6
    end
    object qryExtratoNUMPARC: TFloatField
      FieldName = 'NUMPARC'
    end
    object qryExtratoNUMDOC: TFloatField
      FieldName = 'NUMDOC'
    end
    object qryExtratoDATA_BASE: TDateTimeField
      FieldName = 'DATA_BASE'
    end
    object qryExtratoDATACOBRES: TDateTimeField
      FieldName = 'DATACOBRES'
    end
  end
  object dsExtrato: TwwDataSource
    DataSet = qryExtrato
    Left = 124
    Top = 170
  end
  object pplExtrato: TppBDEPipeline
    DataSource = dsExtrato
    UserName = 'lExtrato'
    Left = 218
    Top = 170
  end
  object rpExtrato: TppReport
    AutoStop = False
    DataPipeline = pplExtrato
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
    BeforePrint = gfbExtratoAfterPrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 306
    Top = 170
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplExtrato'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17463
      mmPrintPosition = 0
      object ppTituloExtrato: TppLabel
        UserName = 'ppTituloExtrato'
        AutoSize = False
        Caption = 'Extrato de Alienação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8467
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel43: TppLabel
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
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284428
        BandType = 0
      end
    end
    object ppdbDetalhe: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object pplSeparador3: TppLine
        OnPrint = pplnSeparadorPrint
        UserName = 'lSeparador3'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppsCor3: TppShape
        OnPrint = ppsCorPrint
        UserName = 'sCor3'
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText9'
        BlankWhenZero = True
        DataField = 'NUMPARCELA'
        DataPipeline = pplExtrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 10848
        BandType = 4
      end
      object ppdbtVencto: TppDBText
        UserName = 'DBText10'
        DataField = 'DATAVENCIMENTO'
        DataPipeline = pplExtrato
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 11642
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText11'
        BlankWhenZero = True
        DataField = 'VLRPRESTACAO'
        DataPipeline = pplExtrato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 102129
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText13'
        BlankWhenZero = True
        DataField = 'VLRAMORTIZACAO'
        DataPipeline = pplExtrato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 84931
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppdbtSaldo: TppDBText
        UserName = 'DBText14'
        BlankWhenZero = True
        DataField = 'VLRSALDOATUAL'
        DataPipeline = pplExtrato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 64029
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'DBText27'
        DataField = 'DATAPAGAMENTO'
        DataPipeline = pplExtrato
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 184944
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText38'
        BlankWhenZero = True
        DataField = 'VLRPAGO'
        DataPipeline = pplExtrato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 201877
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppdbtTipo: TppDBText
        UserName = 'dbtTipo'
        DataField = 'CAL_TIPO'
        DataPipeline = pplExtrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 41010
        mmTop = 0
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        BlankWhenZero = True
        DataField = 'VLRDIF'
        DataPipeline = pplExtrato
        DisplayFormat = '#,##0.00;-#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 220928
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        BlankWhenZero = True
        DataField = 'VLRCORRIG'
        DataPipeline = pplExtrato
        DisplayFormat = '#,##0.00;-#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 242094
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'dbtTipo1'
        DataField = 'CAL_ABONO'
        DataPipeline = pplExtrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 261938
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText1'
        BlankWhenZero = True
        DataField = 'TOT_ALTERADOR'
        DataPipeline = pplExtrato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 120121
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText2'
        BlankWhenZero = True
        DataField = 'TOT_DEVIDO'
        DataPipeline = pplExtrato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 147638
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'DATALIMITE'
        DataPipeline = pplExtrato
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 167746
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText3'
        BlankWhenZero = True
        DataField = 'TOT_CPMF'
        DataPipeline = pplExtrato
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 135732
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText94: TppDBText
        UserName = 'DBText94'
        BlankWhenZero = True
        DataField = 'NUMDOC'
        DataPipeline = pplExtrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplExtrato'
        mmHeight = 3704
        mmLeft = 27517
        mmTop = 0
        mmWidth = 12435
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppSystemVariable7: TppSystemVariable
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
        mmWidth = 284163
        BandType = 8
      end
      object ppLine5: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel44: TppLabel
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
        mmWidth = 283898
        BandType = 8
      end
      object ppSystemVariable8: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 256382
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = pplExtrato
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplExtrato'
      object ghbExtrato: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 22490
        mmPrintPosition = 0
        object ppRegion3: TppRegion
          UserName = 'Region1'
          Brush.Style = bsClear
          Stretch = True
          Transparent = True
          mmHeight = 20108
          mmLeft = 0
          mmTop = 2381
          mmWidth = 284163
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel45: TppLabel
            UserName = 'Label31'
            Caption = 'Contrato:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 1588
            mmTop = 3704
            mmWidth = 15875
            BandType = 3
            GroupNo = 0
          end
          object ppDBText45: TppDBText
            UserName = 'DBText18'
            AutoSize = True
            DataField = 'CONNUMERO'
            DataPipeline = pplExtrato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 4022
            mmLeft = 29898
            mmTop = 3969
            mmWidth = 11684
            BandType = 3
            GroupNo = 0
          end
          object ppDBText46: TppDBText
            UserName = 'DBText19'
            DataField = 'CONNOME'
            DataPipeline = pplExtrato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3969
            mmLeft = 54240
            mmTop = 3969
            mmWidth = 141023
            BandType = 3
            GroupNo = 0
          end
          object ppLabel46: TppLabel
            UserName = 'Label32'
            Caption = 'Valor da  Venda:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3175
            mmLeft = 54504
            mmTop = 10319
            mmWidth = 22225
            BandType = 3
            GroupNo = 0
          end
          object ppDBText47: TppDBText
            UserName = 'DBText20'
            DataField = 'VLRPROPOSTA'
            DataPipeline = pplExtrato
            DisplayFormat = '#,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3175
            mmLeft = 82286
            mmTop = 10319
            mmWidth = 17198
            BandType = 3
            GroupNo = 0
          end
          object ppLabel47: TppLabel
            UserName = 'Label37'
            AutoSize = False
            Caption = 'Data da Proposta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3704
            mmLeft = 1588
            mmTop = 10319
            mmWidth = 25400
            BandType = 3
            GroupNo = 0
          end
          object ppDBText48: TppDBText
            UserName = 'DBText25'
            DataField = 'CONDATAINICIO'
            DataPipeline = pplExtrato
            DisplayFormat = 'dd/mm/yyyy'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3175
            mmLeft = 29898
            mmTop = 10319
            mmWidth = 15081
            BandType = 3
            GroupNo = 0
          end
          object ppLabel48: TppLabel
            UserName = 'Label38'
            Caption = 'Comprador:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 1588
            mmTop = 16669
            mmWidth = 16140
            BandType = 3
            GroupNo = 0
          end
          object ppDBText49: TppDBText
            UserName = 'DBText26'
            AutoSize = True
            DataField = 'RAZAOSOCIAL'
            DataPipeline = pplExtrato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3260
            mmLeft = 29898
            mmTop = 16669
            mmWidth = 38185
            BandType = 3
            GroupNo = 0
          end
          object ppLabel49: TppLabel
            UserName = 'Label49'
            Caption = 'Imóvel Mestre:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3175
            mmLeft = 104511
            mmTop = 10319
            mmWidth = 19579
            BandType = 3
            GroupNo = 0
          end
          object ppDBText37: TppDBText
            UserName = 'DBText37'
            AutoSize = True
            DataField = 'NOMEMESTRE'
            DataPipeline = pplExtrato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3260
            mmLeft = 128323
            mmTop = 10319
            mmWidth = 17272
            BandType = 3
            GroupNo = 0
          end
        end
      end
      object gfbExtrato: TppGroupFooterBand
        AfterPrint = gfbExtratoAfterPrint
        BeforePrint = gfbExtratoBeforePrint
        mmBottomOffset = 0
        mmHeight = 66940
        mmPrintPosition = 0
        object ppRegion2: TppRegion
          UserName = 'Region2'
          mmHeight = 50800
          mmLeft = 0
          mmTop = 8467
          mmWidth = 91017
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object pplSaldoDev: TppLabel
            UserName = 'lSaldoDev'
            AutoSize = False
            Caption = 'Saldo Devedor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 2910
            mmTop = 13758
            mmWidth = 57679
            BandType = 5
            GroupNo = 0
          end
          object ppLabel35: TppLabel
            UserName = 'Label35'
            Caption = 'Prestações em Atraso'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 2910
            mmTop = 24342
            mmWidth = 26723
            BandType = 5
            GroupNo = 0
          end
          object ppLabel36: TppLabel
            UserName = 'Label36'
            Caption = 'Divergências de Pagamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 2910
            mmTop = 29898
            mmWidth = 33867
            BandType = 5
            GroupNo = 0
          end
          object iAtraso: TppVariable
            UserName = 'iAtraso'
            AutoSize = False
            CalcOrder = 0
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetComponent = ghbExtrato
            ResetType = veGroupStart
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 61648
            mmTop = 24342
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object ppLabel104: TppLabel
            UserName = 'Label104'
            Caption = 'Saldo Devedor Total'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 2646
            mmTop = 51858
            mmWidth = 34131
            BandType = 5
            GroupNo = 0
          end
          object iSaldoTot: TppVariable
            UserName = 'iSaldoTot'
            AutoSize = False
            CalcOrder = 1
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            ResetComponent = ghbExtrato
            ResetType = veGroupStart
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 4233
            mmLeft = 61383
            mmTop = 51858
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object iDiverg: TppVariable
            UserName = 'iDiverg'
            AutoSize = False
            CalcOrder = 2
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetComponent = ghbExtrato
            ResetType = veGroupStart
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 61648
            mmTop = 29898
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object iResiduo: TppVariable
            UserName = 'iResiduo'
            AutoSize = False
            CalcOrder = 3
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetComponent = ghbExtrato
            ResetType = veGroupStart
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 37306
            mmTop = 40746
            mmWidth = 21960
            BandType = 5
            GroupNo = 0
          end
          object ppLabel107: TppLabel
            UserName = 'Label107'
            Caption = 'Resíduo Final de Parcelas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 2910
            mmTop = 40746
            mmWidth = 33338
            BandType = 5
            GroupNo = 0
          end
          object ppLabel34: TppLabel
            UserName = 'Label34'
            Caption = 'Acerto de Divergências'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 2910
            mmTop = 35190
            mmWidth = 28046
            BandType = 5
            GroupNo = 0
          end
          object iAcerto: TppVariable
            UserName = 'iAcerto'
            AutoSize = False
            CalcOrder = 4
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetComponent = ghbExtrato
            ResetType = veGroupStart
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 61648
            mmTop = 35190
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object iSD: TppVariable
            UserName = 'iSD'
            AutoSize = False
            CalcOrder = 5
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 61648
            mmTop = 13758
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object iResiduoAtual: TppVariable
            UserName = 'iResiduoAtual'
            AutoSize = False
            CalcOrder = 6
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetComponent = ghbExtrato
            ResetType = veGroupStart
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 61648
            mmTop = 40746
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object ppLabel42: TppLabel
            UserName = 'Label42'
            Caption = 'Prestação do Mês a vencer'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 2910
            mmTop = 19050
            mmWidth = 34396
            BandType = 5
            GroupNo = 0
          end
          object iPrestMes: TppVariable
            UserName = 'iPrestMes'
            AutoSize = False
            CalcOrder = 7
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 61648
            mmTop = 19050
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object ppLabelCorrecaoIncorp: TppLabel
            UserName = 'LabelCorrecaoIncorp'
            Caption = 'Correções Incorporadas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            Visible = False
            mmHeight = 3175
            mmLeft = 2910
            mmTop = 46038
            mmWidth = 30427
            BandType = 5
            GroupNo = 0
          end
          object CorrecaoIncorporada: TppVariable
            UserName = 'CorrecaoIncorporada'
            AutoSize = False
            CalcOrder = 8
            DataType = dtDouble
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            Visible = False
            mmHeight = 3175
            mmLeft = 61648
            mmTop = 46038
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
        end
        object lblDtLimite: TppLabel
          UserName = 'lblDtLimite'
          Caption = 'lblDtLimite'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          Visible = False
          mmHeight = 3175
          mmLeft = 105569
          mmTop = 8996
          mmWidth = 13229
          BandType = 5
          GroupNo = 0
        end
        object relExtratolblDataCorrecao: TppLabel
          UserName = 'relExtratolblDataCorrecao'
          AutoSize = False
          Caption = 'Valores Corrigidos até: 01/01/01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsItalic]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 2910
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = pplExtrato
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplExtrato'
      object ppghCab: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLine8: TppLine
          UserName = 'Line7'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 3969
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel57: TppLabel
          UserName = 'Label18'
          AutoSize = False
          Caption = 'Parc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 3969
          mmTop = 0
          mmWidth = 6879
          BandType = 3
          GroupNo = 1
        end
        object ppLabel58: TppLabel
          UserName = 'Label19'
          AutoSize = False
          Caption = 'Vencto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 11642
          mmTop = 0
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
        object ppLabel59: TppLabel
          UserName = 'Label20'
          AutoSize = False
          Caption = 'Prestação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 104246
          mmTop = 0
          mmWidth = 14817
          BandType = 3
          GroupNo = 1
        end
        object ppLabel61: TppLabel
          UserName = 'Label22'
          AutoSize = False
          Caption = 'Amortiz.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 87577
          mmTop = 0
          mmWidth = 13758
          BandType = 3
          GroupNo = 1
        end
        object ppLabel62: TppLabel
          UserName = 'Label23'
          AutoSize = False
          Caption = 'Saldo Devedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 62971
          mmTop = 0
          mmWidth = 21167
          BandType = 3
          GroupNo = 1
        end
        object ppLabel67: TppLabel
          UserName = 'Label24'
          AutoSize = False
          Caption = 'Data Pagto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 185209
          mmTop = 0
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
        object ppLabel63: TppLabel
          UserName = 'Label63'
          AutoSize = False
          Caption = 'Valor Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 203200
          mmTop = 0
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object ppLabel50: TppLabel
          UserName = 'Label50'
          AutoSize = False
          Caption = 'Lançamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 41010
          mmTop = 0
          mmWidth = 18521
          BandType = 3
          GroupNo = 1
        end
        object ppLabel51: TppLabel
          UserName = 'Label51'
          AutoSize = False
          Caption = 'Divergências'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 220398
          mmTop = 0
          mmWidth = 18785
          BandType = 3
          GroupNo = 1
        end
        object ppLabel41: TppLabel
          UserName = 'Label41'
          AutoSize = False
          Caption = 'Vlr Atualizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 240242
          mmTop = 0
          mmWidth = 20108
          BandType = 3
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label201'
          AutoSize = False
          Caption = 'Alterador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 120121
          mmTop = 0
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppLabel3: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Observações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 261938
          mmTop = 0
          mmWidth = 20108
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Vlr. Devido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 148167
          mmTop = 0
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'Data Limite'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 166688
          mmTop = 0
          mmWidth = 16669
          BandType = 3
          GroupNo = 1
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          AutoSize = False
          Caption = 'Cpmf'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 136790
          mmTop = 265
          mmWidth = 8996
          BandType = 3
          GroupNo = 1
        end
        object ppLabel124: TppLabel
          UserName = 'Label124'
          AutoSize = False
          Caption = 'Docum'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 27252
          mmTop = 0
          mmWidth = 12700
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'IDCONDPAGIMOVEL'
      DataPipeline = pplExtrato
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplExtrato'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object gfbCondPag: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 13229
        mmPrintPosition = 0
        object ppRegion4: TppRegion
          UserName = 'Region3'
          mmHeight = 10848
          mmLeft = 5292
          mmTop = 1058
          mmWidth = 272521
          BandType = 5
          GroupNo = 2
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel26: TppLabel
            UserName = 'Label26'
            Caption = 'Condição:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 7673
            mmTop = 2910
            mmWidth = 13758
            BandType = 5
            GroupNo = 2
          end
          object ppDBText79: TppDBText
            UserName = 'DBText79'
            AutoSize = True
            DataField = 'TIPOCONDPAG'
            DataPipeline = pplExtrato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3260
            mmLeft = 7408
            mmTop = 6879
            mmWidth = 6308
            BandType = 5
            GroupNo = 2
          end
          object ppLabel52: TppLabel
            UserName = 'Label52'
            Caption = 'Nr. Parcelas:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 35719
            mmTop = 2910
            mmWidth = 17463
            BandType = 5
            GroupNo = 2
          end
          object ppLabel110: TppLabel
            UserName = 'Label110'
            Caption = 'Nr. Parcelas Pagas:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3440
            mmLeft = 35454
            mmTop = 6879
            mmWidth = 26458
            BandType = 5
            GroupNo = 2
          end
          object ppDBCalc5: TppDBCalc
            UserName = 'DBCalc5'
            DataField = 'VLRAMORTIZACAO'
            DataPipeline = pplExtrato
            DisplayFormat = '#,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup8
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3175
            mmLeft = 79111
            mmTop = 3175
            mmWidth = 22225
            BandType = 5
            GroupNo = 2
          end
          object ppDBCalc6: TppDBCalc
            UserName = 'DBCalc6'
            DataField = 'VLRPRESTACAO'
            DataPipeline = pplExtrato
            DisplayFormat = '#,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup8
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3175
            mmLeft = 101865
            mmTop = 3175
            mmWidth = 17198
            BandType = 5
            GroupNo = 2
          end
          object ppDBCalc7: TppDBCalc
            UserName = 'DBCalc7'
            DataField = 'VLRDIF'
            DataPipeline = pplExtrato
            DisplayFormat = '#,##0.00;-#,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup8
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3175
            mmLeft = 219869
            mmTop = 3175
            mmWidth = 19315
            BandType = 5
            GroupNo = 2
          end
          object ppDBCalc8: TppDBCalc
            UserName = 'DBCalc8'
            DataField = 'VLRPAGO'
            DataPipeline = pplExtrato
            DisplayFormat = '#,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup8
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3175
            mmLeft = 194469
            mmTop = 3175
            mmWidth = 24606
            BandType = 5
            GroupNo = 2
          end
          object ppDBCalc9: TppDBCalc
            UserName = 'DBCalc9'
            DataField = 'VLRCORRIG'
            DataPipeline = pplExtrato
            DisplayFormat = '#,##0.00;-#,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup8
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3175
            mmLeft = 239978
            mmTop = 3175
            mmWidth = 20373
            BandType = 5
            GroupNo = 2
          end
          object ppDBText85: TppDBText
            UserName = 'DBText85'
            DataField = 'NUMPARCELAS'
            DataPipeline = pplExtrato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplExtrato'
            mmHeight = 3175
            mmLeft = 63765
            mmTop = 3175
            mmWidth = 11113
            BandType = 5
            GroupNo = 2
          end
          object vQtdeParcPaga: TppVariable
            UserName = 'vQtdeParcPaga'
            AutoSize = False
            CalcOrder = 0
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 63765
            mmTop = 7144
            mmWidth = 11113
            BandType = 5
            GroupNo = 2
          end
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060D
        6941747261736F4F6E43616C630B50726F6772616D54797065070B747450726F
        63656475726506536F757263650CBC01000070726F6365647572652069417472
        61736F4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A
        626567696E0D0A20696620286C4578747261746F5B27444154414C494D495445
        275D203C20537472546F44617465286C626C44744C696D6974652E4361707469
        6F6E29202920616E64200D0A20202020286C4578747261746F5B27564C525041
        474F275D203D20302920616E64200D0A20202020286C4578747261746F5B2746
        4C475449504F4C414E43275D203C3E203629207468656E20626567696E0D0A20
        2020206966206C4578747261746F5B274944434F4E5241544F494D4F56454C27
        5D203C3E2032383233207468656E0D0A20202020206941747261736F2E417344
        6F75626C6520203A3D206941747261736F2E4173446F75626C65202B206C4578
        747261746F5B27564C52434F52524947275D0D0A20202020656C73652020200D
        0A20202020206941747261736F2E4173446F75626C65203A3D20206941747261
        736F2E4173446F75626C65202B20286C4578747261746F5B27564C5250524553
        544143414F275D2D6C4578747261746F5B27564C525041474F275D293B0D0A20
        656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506076941
        747261736F094576656E744E616D6506064F6E43616C63074576656E74494402
        210001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
        060D694469766572674F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F757263650C1C01000070726F636564757265206944
        69766572674F6E43616C63287661722056616C75653A2056617269616E74293B
        0D0A626567696E0D0A20696620286C4578747261746F5B274441544156454E43
        494D454E544F275D203C20537472546F44617465286C626C44744C696D697465
        2E43617074696F6E29202920616E64200D0A20202020286C4578747261746F5B
        27564C525041474F275D203E20302920616E6420286C4578747261746F5B2746
        4C475449504F4C414E43275D203C3E203629207468656E20626567696E0D0A20
        202020694469766572672E4173446F75626C65203A3D20694469766572672E41
        73446F75626C65202B206C4578747261746F5B27564C52434F52524947275D3B
        0D0A20656E643B200D0A656E643B0D0A0D436F6D706F6E656E744E616D650607
        69446976657267094576656E744E616D6506064F6E43616C63074576656E7449
        4402210001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D65060E695265736964756F4F6E43616C630B50726F6772616D54797065070B
        747450726F63656475726506536F757263650C9E01000070726F636564757265
        20695265736964756F4F6E43616C63287661722056616C75653A205661726961
        6E74293B0D0A626567696E0D0A206966202820286C4578747261746F5B27464C
        475245534944554F494E434F5250275D203D20274E272920616E64200D0A2020
        20202020286C4578747261746F5B27464C474C414E43494E5445475241275D20
        3C3E20352020202920616E64200D0A202020202020286C4578747261746F5B27
        464C474C414E43494E5445475241275D203C3E2036202020292029206F720D0A
        202020202820286C4578747261746F5B27464C475245534944554F494E434F52
        50275D203D202743272920616E64200D0A202020202020286C4578747261746F
        5B2744415441434F42524553275D203E20537472546F44617465286C626C4474
        4C696D6974652E43617074696F6E29292029207468656E20626567696E0D0A20
        202020695265736964756F2E4173446F75626C65203A3D20695265736964756F
        2E4173446F75626C65202B206C4578747261746F5B27564C525245534944554F
        275D3B0D0A20656E643B200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E
        616D650608695265736964756F094576656E744E616D6506064F6E43616C6307
        4576656E74494402210001060F5472614576656E7448616E646C65720B50726F
        6772616D4E616D65060D6941636572746F4F6E43616C630B50726F6772616D54
        797065070B747450726F63656475726506536F757263650C7601000070726F63
        6564757265206941636572746F4F6E43616C63287661722056616C75653A2056
        617269616E74293B0D0A626567696E0D0A20696620286C4578747261746F5B27
        464C475449504F4C414E43275D203D2036207468656E20626567696E0D0A2020
        2020696620286C4578747261746F5B274441544156454E43494D454E544F275D
        203E3D20537472546F44617465286C626C44744C696D6974652E43617074696F
        6E292029207468656E20626567696E200D0A202020202020206941636572746F
        2E4173446F75626C65203A3D206941636572746F2E4173446F75626C65202B20
        6C4578747261746F5B27544F545F44455649444F275D3B0D0A20202020656E64
        20656C736520626567696E0D0A202020202020206941636572746F2E4173446F
        75626C65203A3D206941636572746F2E4173446F75626C65202B206C45787472
        61746F5B27564C52434F52524947275D3B0D0A20202020656E643B2020200D0A
        20656E643B0D0A200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65
        06076941636572746F094576656E744E616D6506064F6E43616C63074576656E
        74494402210001060F5472614576656E7448616E646C65720B50726F6772616D
        4E616D6506156768624578747261746F4265666F72655072696E740B50726F67
        72616D54797065070B747450726F63656475726506536F757263650C37010000
        70726F636564757265206768624578747261746F4265666F72655072696E743B
        0D0A626567696E0D0A2020206941747261736F2E4173446F75626C6520202020
        2020203A3D20303B0D0A202020694469766572672E4173446F75626C65202020
        202020203A3D20303B0D0A202020695265736964756F2E4173446F75626C6520
        20202020203A3D20303B0D0A202020695265736964756F417475616C2E417344
        6F75626C65203A3D20303B0D0A2020206941636572746F2E4173446F75626C65
        202020202020203A3D20303B0D0A2020206953616C646F546F742E4173446F75
        626C6520202020203A3D20303B0D0A2020206953442E4173446F75626C652020
        2020202020202020203A3D20303B0D0A2020206950726573744D65732E417344
        6F75626C6520202020203A3D20303B0D0A656E643B0D0A0D436F6D706F6E656E
        744E616D65060A6768624578747261746F094576656E744E616D65060B426566
        6F72655072696E74074576656E74494402180001060F5472614576656E744861
        6E646C65720B50726F6772616D4E616D6506156766624578747261746F426566
        6F72655072696E740B50726F6772616D54797065070B747450726F6365647572
        6506536F7572636506C170726F636564757265206766624578747261746F4265
        666F72655072696E743B0D0A626567696E0D0A2020206953616C646F546F742E
        56616C7565203A3D206953442E56616C7565202B206950726573744D65732E56
        616C7565202B206941747261736F2E56616C7565202B200D0A20202020202020
        202020202020202020202020202020694469766572672E56616C7565202B2069
        5265736964756F417475616C2E56616C7565202B206941636572746F2E56616C
        75653B0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060A6766624578
        747261746F094576656E744E616D65060B4265666F72655072696E7407457665
        6E74494402180001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D650613695265736964756F417475616C4F6E43616C630B50726F6772
        616D54797065070B747450726F63656475726506536F757263650CB201000070
        726F63656475726520695265736964756F417475616C4F6E43616C6328766172
        2056616C75653A2056617269616E74293B0D0A626567696E0D0A206966202820
        286C4578747261746F5B27464C475245534944554F494E434F5250275D203D20
        274E272920616E64200D0A202020202020286C4578747261746F5B27464C474C
        414E43494E5445475241275D203C3E20352020202920616E64200D0A20202020
        2020286C4578747261746F5B27464C474C414E43494E5445475241275D203C3E
        2036202020292029206F720D0A202020202820286C4578747261746F5B27464C
        475245534944554F494E434F5250275D203D202743272920616E64200D0A2020
        20202020286C4578747261746F5B2744415441434F42524553275D203E205374
        72546F44617465286C626C44744C696D6974652E43617074696F6E2929202920
        7468656E20626567696E0D0A20202020695265736964756F417475616C2E4173
        446F75626C65203A3D20695265736964756F417475616C2E4173446F75626C65
        202B206C4578747261746F5B27564C525245534944554F434F52524947275D3B
        0D0A20656E643B20200D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        0D695265736964756F417475616C094576656E744E616D6506064F6E43616C63
        074576656E74494402210001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D65061B47726F757048656164657242616E64364265666F72
        655072696E740B50726F6772616D54797065070B747450726F63656475726506
        536F75726365065770726F6365647572652047726F757048656164657242616E
        64364265666F72655072696E743B0D0A626567696E0D0A202020765174646550
        617263506167612E4173496E7465676572203A3D20303B0D0A656E643B0D0A0D
        436F6D706F6E656E744E616D65061047726F757048656164657242616E643609
        4576656E744E616D65060B4265666F72655072696E74074576656E7449440218
        0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
        1044657461696C41667465725072696E740B50726F6772616D54797065070B74
        7450726F63656475726506536F75726365069970726F63656475726520446574
        61696C41667465725072696E743B0D0A626567696E0D0A20206966206C457874
        7261746F5B27564C525041474F275D203E2030207468656E20626567696E0D0A
        2020202020765174646550617263506167612E4173496E7465676572203A3D20
        765174646550617263506167612E4173496E7465676572202B20313B0D0A2020
        656E643B0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060644657461
        696C094576656E744E616D65060A41667465725072696E74074576656E744944
        02170001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
        65060F6950726573744D65734F6E43616C630B50726F6772616D54797065070B
        747450726F63656475726506536F757263650C6701000070726F636564757265
        206950726573744D65734F6E43616C63287661722056616C75653A2056617269
        616E74293B0D0A626567696E0D0A2020696620286C4578747261746F5B274E55
        4D50415243275D203E20302920616E640D0A2020202020286C4578747261746F
        5B27444154414C494D495445275D203E3D206C4578747261746F5B2744415441
        5F42415345275D2920616E640D0A20202020202820286C4578747261746F5B27
        44415441504147414D454E544F275D203E206C4578747261746F5B2744415441
        4C494D495445275D29206F720D0A20202020202020286C4578747261746F5B27
        44415441504147414D454E544F275D203C3D2030292029207468656E20626567
        696E0D0A20202020206950726573744D65732E4173446F75626C65203A3D2069
        50726573744D65732E4173446F75626C65202B206C4578747261746F5B27564C
        5250524553544143414F275D3B0D0A2020656E643B200D0A656E643B0D0A0D43
        6F6D706F6E656E744E616D6506096950726573744D6573094576656E744E616D
        6506064F6E43616C63074576656E74494402210001060F5472614576656E7448
        616E646C65720B50726F6772616D4E616D65060F6953616C646F546F744F6E43
        616C630B50726F6772616D54797065070B747450726F63656475726506536F75
        7263650C3C01000070726F636564757265206953616C646F546F744F6E43616C
        63287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D
        0A202056616C7565203A3D206941747261736F2E56616C7565202B200D0A2020
        202020202020202020694469766572672E56616C7565202B200D0A2020202020
        202020202020695265736964756F2E56616C7565202B200D0A20202020202020
        202020206941636572746F2E56616C7565202B200D0A20202020202020202020
        206953442E56616C7565202B200D0A2020202020202020202020695265736964
        756F417475616C2E56616C7565202B200D0A2020202020202020202020695072
        6573744D65732E56616C7565202B200D0A2020202020202020202020436F7272
        6563616F496E636F72706F726164612E56616C75653B0D0A20200D0A0D0A656E
        643B0D0A0D436F6D706F6E656E744E616D6506096953616C646F546F74094576
        656E744E616D6506064F6E43616C63074576656E74494402210000}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object qryInadSin: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '     CI.IDCONTRATOIMOVEL,'
      '     CI.CONNUMERO,'
      '     CI.CONNOME,'
      '     (CI.CONNUMERO || '#39' - '#39' || CI.CONNOME) AS NOMECONTRATO,'
      '     P.RAZAOSOCIAL,'
      '     IM.NOMEMESTRE,'
      '     TD.TOTDEVIDO'
      ''
      'FROM'
      '     CONTRATOIMOVEL CI,'
      '     CONDPAGIMOVEL  CP,'
      '     PARCFINANCIMOV PF,'
      '     PESSOA P,'
      ''
      '     ( SELECT DISTINCT'
      '              CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL,'
      '              M.IMONOME            AS NOMEMESTRE,'
      '              M.IDIMOVEL           AS IDIMOVELMESTRE,'
      '              C.UF                 AS UF'
      '       FROM'
      '              CONTRATOXIMOVEL CXI,'
      '              IMOVEL I,'
      '              IMOVEL M,'
      '              CIDADES C'
      '       WHERE'
      '              CXI.IDIMOVEL = I.IDIMOVEL'
      '         AND  M.IDCIDADES = C.IDCIDADES(+)'
      '         AND  I.IDIMOVELMESTRE = M.IDIMOVEL ) IM,'
      ''
      '     ( SELECT'
      '              CI.IDCONTRATOIMOVEL,'
      '              MIN(CI.CONNUMERO)    AS CONNUMERO,'
      
        '              SUM(NVL(PF.VLRPRESTCORRIG,0) + NVL(PF.VLRMULTACORR' +
        'IG,0) + NVL(PF.VLRJUROSCORRIG,0)) AS TOTDEVIDO'
      '       FROM'
      '              CONTRATOIMOVEL CI,'
      '              CONDPAGIMOVEL  CP,'
      '              PARCFINANCIMOV PF'
      '       WHERE'
      '             (PF.FLGTIPOLANC IN (2,3,4,5,6,7,8,9))'
      
        '         AND (PF.FLGCONCILIADO IS NULL OR PF.FLGCONCILIADO = '#39'N'#39 +
        ')'
      '         AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)'
      '         AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      
        '         AND ( (:pDTFIM IS NULL) OR (PF.DATAVENCIMENTO < TO_DATE' +
        '(:pDTFIM,'#39'DD/MM/YYYY'#39')) )'
      
        '         AND ( (:pIDCONTRATOIMOVEL IS NULL) OR (CI.IDCONTRATOIMO' +
        'VEL = :pIDCONTRATOIMOVEL) )'
      
        '         AND ( (:pIDCOMPRADOR IS NULL) OR (CI.IDLOCATARIO = :pID' +
        'COMPRADOR) )'
      
        '         AND ( (:pIDRESPONSAVEL IS NULL) OR (CI.IDRESPONSAVEL = ' +
        ':pIDRESPONSAVEL) )'
      
        '         AND ( (:pIDADMINIMOVEL IS NULL) OR (CI.IDADMINIMOVEL = ' +
        ':pIDADMINIMOVEL) )'
      ''
      '       GROUP BY CI.IDCONTRATOIMOVEL ) TD'
      ''
      'WHERE'
      '  1=2 AND  (PF.FLGTIPOLANC IN (2,3,4,5,6,7,8,9))'
      '     AND (PF.FLGCONCILIADO IS NULL OR PF.FLGCONCILIADO = '#39'N'#39')'
      '     AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)'
      '     AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      '     AND (TD.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      '     AND (P.IDPESSOA(+) = CI.IDLOCATARIO)'
      '     AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL)'
      
        '     AND ( (:pDTFIM IS NULL) OR (PF.DATAVENCIMENTO < TO_DATE(:pD' +
        'TFIM,'#39'DD/MM/YYYY'#39')) )'
      
        '     AND ( (:pIDCONTRATOIMOVEL IS NULL) OR (CI.IDCONTRATOIMOVEL ' +
        '= :pIDCONTRATOIMOVEL) )'
      
        '     AND ( (:pIDCOMPRADOR IS NULL) OR (CI.IDLOCATARIO = :pIDCOMP' +
        'RADOR) )'
      
        '     AND ( (:pIDRESPONSAVEL IS NULL) OR (CI.IDRESPONSAVEL = :pID' +
        'RESPONSAVEL) )'
      
        '     AND ( (:pIDADMINIMOVEL IS NULL) OR (CI.IDADMINIMOVEL = :pID' +
        'ADMINIMOVEL) )'
      '     AND ( (:pUF IS NULL) OR (TRIM(IM.UF) = :pUF) )'
      '     AND ( CI.FLGTIPOCONTRATO = :PFLGTIPOCONTRATO )'
      ''
      'ORDER BY DECODE(:pORDEM, 0, RAZAOSOCIAL  || NOMECONTRATO,'
      '                         1, NOMECONTRATO || RAZAOSOCIAL)'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ''
      ' ')
    ValidateWithMask = True
    Left = 34
    Top = 226
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'pDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCOMPRADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCOMPRADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCOMPRADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCOMPRADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pUF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pUF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGTIPOCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pORDEM'
        ParamType = ptUnknown
      end>
  end
  object dsInadSin: TwwDataSource
    DataSet = qryInadSin
    Left = 124
    Top = 226
  end
  object pplInadSin: TppBDEPipeline
    DataSource = dsInadSin
    UserName = 'lInadSin'
    Left = 218
    Top = 226
  end
  object rpInadSin: TppReport
    AutoStop = False
    DataPipeline = pplInadSin
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 306
    Top = 226
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplInadSin'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 20373
      mmPrintPosition = 0
      object pplTitInadSin: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Inadimplências de Alienação - Sintético'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8467
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel68: TppLabel
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
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197380
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 15081
        mmWidth = 197300
        BandType = 0
      end
      object pplDet0: TppLabel
        UserName = 'Label23'
        Caption = 'Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 83079
        mmTop = 16140
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel88: TppLabel
        UserName = 'Label22'
        Caption = 'Valor Devido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 176213
        mmTop = 16140
        mmWidth = 17463
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 19844
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'Comprador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 16140
        mmWidth = 15346
        BandType = 0
      end
      object ppImgLogotipo: TppImage
        UserName = 'ImgLogotipo'
        MaintainAspectRatio = False
        mmHeight = 14817
        mmLeft = 529
        mmTop = 265
        mmWidth = 20638
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object pplnSeparador: TppLine
        OnPrint = pplnSeparadorPrint
        UserName = 'lnSeparador'
        ParentHeight = True
        ParentWidth = True
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppsCor: TppShape
        OnPrint = ppsCorPrint
        UserName = 'sCor'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        ShiftWithParent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'DBText101'
        DataField = 'RAZAOSOCIAL'
        DataPipeline = pplInadSin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplInadSin'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 80433
        BandType = 4
      end
      object ppdbDet0: TppDBText
        UserName = 'DBText10'
        DataField = 'NOMECONTRATO'
        DataPipeline = pplInadSin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplInadSin'
        mmHeight = 3704
        mmLeft = 83079
        mmTop = 0
        mmWidth = 80433
        BandType = 4
      end
      object ppDBText54: TppDBText
        UserName = 'DBText33'
        BlankWhenZero = True
        DataField = 'TOTDEVIDO'
        DataPipeline = pplInadSin
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadSin'
        mmHeight = 3704
        mmLeft = 171186
        mmTop = 0
        mmWidth = 21960
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine9: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel70: TppLabel
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
        mmWidth = 197115
        BandType = 8
      end
      object ppSystemVariable9: TppSystemVariable
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
        mmWidth = 196850
        BandType = 8
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLabel72: TppLabel
        UserName = 'Label72'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 151871
        mmTop = 1588
        mmWidth = 14552
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'TOTDEVIDO'
        DataPipeline = pplInadSin
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadSin'
        mmHeight = 3175
        mmLeft = 168540
        mmTop = 1588
        mmWidth = 24606
        BandType = 7
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'RAZAOSOCIAL'
      DataPipeline = pplInadSin
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplInadSin'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        AfterPrint = gfbExtratoAfterPrint
        BeforePrint = gfbExtratoBeforePrint
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'TOTDEVIDO'
          DataPipeline = pplInadSin
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadSin'
          mmHeight = 3175
          mmLeft = 171715
          mmTop = 0
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryInadAna: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryInadAnaCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PF.IDPARCFINANCIMOV,'
      '       PF.IDCONDPAGIMOVEL,  '
      '       CP.IDCONTRATOIMOVEL, '
      '       CI.CONNUMERO,        '
      '       CI.CONNOME,          '
      '       (CI.CONNUMERO || '#39' - '#39' || CI.CONNOME) AS NOMECONTRATO, '
      '       P.RAZAOSOCIAL,       '
      
        '       DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || '#39'/'#39 +
        ' || TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA, '
      
        '       DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENT' +
        'O) AS DATAVENCIMENTO,  '
      
        '       DECODE(PF.FLGTIPOLANC,9,PF.VLRAMORTIZACAO,PF.VLRPRESTACAO' +
        ')  AS VLRPRESTACAO,    '
      '       PF.FLGTIPOLANC,        '
      '       PF.FLGLANCINTEGRA,     '
      '       PP.DATAPAGAMENTO,      '
      '       ROUND(NVL(PP.VLRPAGO,0),2) AS VLRPAGO, '
      '       PF.DATAPAGAMENTO - PF.DATALIMITE AS DIASDIF, '
      
        '       ROUND( ( ( NVL(PF.VLRPRESTACAO,0) + NVL( CMA.VLRCORRIGIDO' +
        'ATRASO, 0 ) + NVL( MA.VLRMULTAATRASO, 0 ) + NVL( JA.VLRMORAATRAS' +
        'O, 0 ) ) - NVL( PP.VLRPAGO, 0 ) ), 2 )  AS VLRDIF, '
      '       CMA.VLRCORRIGIDOATRASO AS VLRCMATRASO,  '
      '       MA.VLRMULTAATRASO AS VLRMULTAATRASO,  '
      '       JA.VLRMORAATRASO AS VLRMORAATRASO,  '
      '       CMS.VLRCORRIGIDOSALDO AS VLRCMCORRIG,  '
      '       MS.VLRMULTASALDO   AS VLRMULTACORRIG,  '
      '       JS.VLRMORASALDO AS VLRJUROSCORRIG,  '
      
        '       ROUND(NVL(PF.VLRPRESTACAO,0) + NVL( CMA.VLRCORRIGIDOATRAS' +
        'O, 0 ) + NVL( MA.VLRMULTAATRASO, 0 ) + NVL( JA.VLRMORAATRASO, 0 ' +
        ')  - NVL( PP.VLRPAGO, 0 ) +  '
      
        '       NVL(CMS.VLRCORRIGIDOSALDO,0) + NVL(MS.VLRMULTASALDO,0) + ' +
        'NVL(JS.VLRMORASALDO,0) - NVL(ABONO.TOT_ABONO,0),2)  AS VLRDEVIDO' +
        '  '
      '  FROM PARCFINANCIMOV PF, '
      '       CONDPAGIMOVEL  CP, '
      '       CONTRATOIMOVEL CI, '
      '       PESSOA P,          '
      '       ( '
      '         SELECT /*+ INDEX(LD) INDEX(RP)*/   '
      '                IDPARCFINANCIMOV, '
      
        '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.DATAPAGAMENTO' +
        '), MAX(RP.DATABAIXA) ) AS DATAPAGAMENTO, '
      
        '                DECODE(P.CODDOCUMENTO, NULL, MAX(P.VLRPAGO), SUM' +
        '(LD.VALOR) ) AS VLRPAGO '
      
        '           FROM PARCFINANCIMOV P, LANCTODOCUM LD, RECBTOPAGTO RP' +
        ' '
      '          WHERE P.CODDOCUMENTO  = LD.CODDOCUMENTO(+) '
      '            AND LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) '
      '            AND LD.NUMLANCTO    = RP.NUMLANCTO(+)    '
      
        '            AND ((P.CODDOCUMENTO IS NULL     AND DATAPAGAMENTO <' +
        '= 11/08/2006 ) OR'
      
        '                 (P.CODDOCUMENTO IS NOT NULL AND ( RTRIM(LD.OPER' +
        'ACAO) = '#39'5'#39' OR LD.CODALTERADOR = 215 ) '
      
        '                                             AND LD.ESTORNO IS N' +
        'ULL            '
      
        '                                             AND LD.DATALANCTO <' +
        '= 11/08/2006 ) )  '
      
        '          GROUP BY IDPARCFINANCIMOV, P.CODDOCUMENTO             ' +
        '               '
      '       ) PP, '
      '       ( SELECT A.IDCONDINICIAL  AS IDCONDINICIAL, '
      '                A.NUMPARCELAS    AS NUMPARCELAS,   '
      '                A.DATAINI,                         '
      '                A.IDCONDPAGIMOVEL                  '
      '           FROM CONDPAGIMOVEL A,                   '
      '                (SELECT IDCONDINICIAL,             '
      '                        MAX(DATAINI) AS DATAINI    '
      '                   FROM CONDPAGIMOVEL              '
      '                  GROUP BY IDCONDINICIAL) B        '
      '          WHERE B.IDCONDINICIAL = A.IDCONDINICIAL  '
      '            AND B.DATAINI       = A.DATAINI ) CPFINAL,    '
      '       ( '
      
        '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRCORRIGIDOA' +
        'TRASO '
      '         FROM ( SELECT /*+ INDEX (L) */ '
      
        '                     L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRAC' +
        'UM) AS VLRCORRIGIDOATRASO '
      '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P.IDPESSOA = 1'
      '                AND L.IDCONTRATOIMOVEL = 1848'
      '                AND ( L.IDOPERACAO = P.IDOPERATUALCM ) '
      '                AND L.DATABAIXA IS NOT NULL '
      '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX' +
        '(L2.DATAOPER) AS DTAPUR '
      '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P2.IDPESSOA = 1'
      '                AND L2.IDCONTRATOIMOVEL = 1848'
      '                AND ( L2.IDOPERACAO = P2.IDOPERATUALCM ) '
      '                AND ( DATAOPER <= 11/08/2006) '
      '                AND L2.DATABAIXA IS NOT NULL '
      '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '                AND D1.DATAOPER = D2.DTAPUR '
      '       ) CMA, '
      '       ( '
      
        '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMULTAATRAS' +
        'O '
      '         FROM ( SELECT /*+ INDEX (L) */ '
      
        '                    L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACU' +
        'M) AS VLRMULTAATRASO '
      '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P.IDPESSOA =  1'
      '                AND L.IDCONTRATOIMOVEL = 1848'
      '                AND ( L.IDOPERACAO = P.IDOPERATUALMULTA ) '
      '                AND L.DATABAIXA IS NOT NULL '
      '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX' +
        '(L2.DATAOPER) AS DTAPUR '
      '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P2.IDPESSOA =  1'
      '                AND L2.IDCONTRATOIMOVEL = 1848'
      '                AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA ) '
      '                AND ( DATAOPER <= 11/08/2006) '
      '                AND L2.DATABAIXA IS NOT NULL '
      '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '         AND D1.DATAOPER = D2.DTAPUR '
      '       ) MA, '
      '       ( '
      '        SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMORAATRASO '
      '        FROM ( SELECT /*+ INDEX (L) */ '
      
        '                   L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM' +
        ') AS VLRMORAATRASO '
      '               FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '               AND P.IDPESSOA =  1'
      '                AND L.IDCONTRATOIMOVEL = 1848'
      '               AND ( L.IDOPERACAO = P.IDOPERATUALJUROS ) '
      '               AND L.DATABAIXA IS NOT NULL '
      '               GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '             ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(' +
        'L2.DATAOPER) AS DTAPUR '
      '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '               AND P2.IDPESSOA =  1'
      '                AND L2.IDCONTRATOIMOVEL = 1848'
      '               AND ( L2.IDOPERACAO = P2.IDOPERATUALJUROS ) '
      '               AND ( DATAOPER <= 11/08/2006) '
      '               AND L2.DATABAIXA IS NOT NULL '
      '               GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '        WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '        AND D1.DATAOPER = D2.DTAPUR '
      '       ) JA, '
      '       ( '
      
        '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRCORRIGIDOS' +
        'ALDO '
      '         FROM ( SELECT /*+ INDEX (L) */ '
      
        '                     L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRAC' +
        'UM) AS VLRCORRIGIDOSALDO '
      '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P.IDPESSOA = 1'
      '                AND L.IDCONTRATOIMOVEL = 1848'
      '                AND ( L.IDOPERACAO = P.IDOPERATUALCM ) '
      '                AND L.DATABAIXA IS NULL '
      '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX' +
        '(L2.DATAOPER) AS DTAPUR '
      '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P2.IDPESSOA = 1'
      '                AND L2.IDCONTRATOIMOVEL = 1848'
      '                AND ( L2.IDOPERACAO = P2.IDOPERATUALCM ) '
      '                AND ( DATAOPER <= 11/08/2006) '
      '                AND L2.DATABAIXA IS NULL '
      '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '                AND D1.DATAOPER = D2.DTAPUR '
      '       ) CMS, '
      '       ( '
      
        '         SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMULTASALDO' +
        ' '
      '         FROM ( SELECT /*+ INDEX (L) */ '
      
        '                    L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACU' +
        'M) AS VLRMULTASALDO '
      '                FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P.IDPESSOA =  1'
      '                AND L.IDCONTRATOIMOVEL = 1848'
      '                AND ( L.IDOPERACAO = P.IDOPERATUALMULTA ) '
      '                AND L.DATABAIXA IS NULL '
      '                GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '              ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX' +
        '(L2.DATAOPER) AS DTAPUR '
      '                FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '                WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND P2.IDPESSOA =  1'
      '                AND L2.IDCONTRATOIMOVEL = 1848'
      '                AND ( L2.IDOPERACAO = P2.IDOPERATUALMULTA ) '
      '                AND ( DATAOPER <= 11/08/2006) '
      '                AND L2.DATABAIXA IS NULL '
      '                GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '         WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '         AND D1.DATAOPER = D2.DTAPUR '
      '       ) MS, '
      '       ( '
      '        SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.VLRMORASALDO '
      '        FROM ( SELECT /*+ INDEX (L) */ '
      
        '                   L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM' +
        ') AS VLRMORASALDO '
      '               FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '               AND P.IDPESSOA =  1'
      '                AND L.IDCONTRATOIMOVEL = 1848'
      '               AND ( L.IDOPERACAO = P.IDOPERATUALJUROS ) '
      '               AND L.DATABAIXA IS NULL '
      '               GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '             ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(' +
        'L2.DATAOPER) AS DTAPUR '
      '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '               WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '               AND P2.IDPESSOA =  1'
      '                AND L2.IDCONTRATOIMOVEL = 1848'
      '               AND ( L2.IDOPERACAO = P2.IDOPERATUALJUROS ) '
      '               AND ( DATAOPER <= 11/08/2006) '
      '               AND L2.DATABAIXA IS NULL '
      '               GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      '        WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      '        AND D1.DATAOPER = D2.DTAPUR '
      '       ) JS, '
      '       ( SELECT D1.IDPARCFINANCIMOV, D2.DTAPUR, D1.TOT_ABONO '
      '       FROM ( SELECT /*+ INDEX (L) */ '
      
        '                  L.IDPARCFINANCIMOV, L.DATAOPER, SUM(L.VLRACUM)' +
        ' AS TOT_ABONO '
      '              FROM LANCOPERDIAIMOB L, PARAMALIENACAO P '
      '              WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND L.IDMODULO = 135 '
      '                AND P.IDPESSOA =  1'
      '                AND L.IDCONTRATOIMOVEL = 1848'
      '                AND ( L.IDOPERACAO = P.IDOPERABONOMULTA OR '
      '                      L.IDOPERACAO = P.IDOPERABONOJUROS OR '
      '                      L.IDOPERACAO = P.IDOPERABONOCM ) '
      '              GROUP BY L.IDPARCFINANCIMOV, L.DATAOPER ) D1, '
      
        '           ( SELECT /*+ INDEX (L2) */ L2.IDPARCFINANCIMOV,MAX(L2' +
        '.DATAOPER) AS DTAPUR '
      '               FROM LANCOPERDIAIMOB L2, PARAMALIENACAO P2 '
      '              WHERE (FLGTIPO IS NULL OR FLGTIPO <> '#39'S'#39') '
      '                AND L2.IDMODULO = 135 '
      '                AND P2.IDPESSOA = 1'
      '                AND L2.IDCONTRATOIMOVEL = 1848'
      '         AND ( L2.IDOPERACAO = P2.IDOPERABONOMULTA OR '
      '               L2.IDOPERACAO = P2.IDOPERABONOJUROS OR '
      '               L2.IDOPERACAO = P2.IDOPERABONOCM ) '
      '         AND ( DATAOPER <= 11/08/2006 ) '
      '       GROUP BY L2.IDPARCFINANCIMOV ) D2 '
      'WHERE D1.IDPARCFINANCIMOV = D2.IDPARCFINANCIMOV '
      'AND D1.DATAOPER = D2.DTAPUR '
      ') ABONO, '
      '       ( SELECT DISTINCT                                  '
      '                CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL, '
      '                M.IMONOME   AS NOMEMESTRE,                '
      '                M.IDIMOVEL  AS IDIMOVELMESTRE,            '
      '                C.UF        AS UF    '
      '           FROM CONTRATOXIMOVEL CXI, '
      '                IMOVEL I, '
      '                IMOVEL M, '
      '                CIDADES C '
      '          WHERE CXI.IDIMOVEL = I.IDIMOVEL'
      '           AND  M.IDCIDADES = C.IDCIDADES(+)'
      '           AND  I.IDIMOVELMESTRE = M.IDIMOVEL ) IM'
      '  WHERE (PF.FLGTIPOLANC IN (2,3,4,5,6,7,8,9))'
      '    AND (NVL(PF.FLGCONCILIADO,'#39'N'#39') IN ('#39'N'#39','#39'P'#39'))'
      '    AND (PF.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL)'
      '    AND (CP.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL)'
      '    AND (PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL)'
      '    AND (PP.IDPARCFINANCIMOV(+) = PF.IDPARCFINANCIMOV)'
      '    AND (PF.IDPARCFINANCIMOV = MA.IDPARCFINANCIMOV(+))'
      '    AND (PF.IDPARCFINANCIMOV = JA.IDPARCFINANCIMOV(+))'
      '    AND (PF.IDPARCFINANCIMOV = CMA.IDPARCFINANCIMOV(+))'
      '    AND (PF.IDPARCFINANCIMOV = MS.IDPARCFINANCIMOV(+))'
      '    AND (PF.IDPARCFINANCIMOV = JS.IDPARCFINANCIMOV(+))'
      '    AND (PF.IDPARCFINANCIMOV = CMS.IDPARCFINANCIMOV(+))'
      '    AND (PF.IDPARCFINANCIMOV = ABONO.IDPARCFINANCIMOV(+))'
      '    AND (P.IDPESSOA(+) = CI.IDLOCATARIO)'
      '    AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL)'
      
        '               AND ( (:pIDCONTRATOIMOVEL IS NULL) OR (CI.IDCONTR' +
        'ATOIMOVEL = :pIDCONTRATOIMOVEL) )'
      
        '               AND ( (:pIDCOMPRADOR IS NULL) OR (CI.IDLOCATARIO ' +
        '= :pIDCOMPRADOR) )'
      
        '               AND ( (:pIDRESPONSAVEL IS NULL) OR (CI.IDRESPONSA' +
        'VEL = :pIDRESPONSAVEL) )'
      
        '               AND ( (:pIDADMINIMOVEL IS NULL) OR (CI.IDADMINIMO' +
        'VEL = :pIDADMINIMOVEL) )'
      
        '               AND ( (:pDTFIM IS NULL) OR (PF.DATAVENCIMENTO < :' +
        'pDTFIM) )'
      '               AND ( (:pUF IS NULL) OR (TRIM(IM.UF) = :pUF) )'
      ''
      '    AND ( (:pDTFIM IS NULL) OR (PF.DATAVENCIMENTO < :pDTFIM) )'
      '    AND ( CI.FLGTIPOCONTRATO = :pFLGTIPOCONTRATO )'
      
        '  ORDER BY CONNUMERO, PF.IDCONDPAGIMOVEL, DATAVENCIMENTO, PF.FLG' +
        'TIPOLANC, NUMPARCELA'
      '')
    UpdateObject = updInadAna
    ValidateWithMask = True
    Left = 58
    Top = 293
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDCOMPRADOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDCOMPRADOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDRESPONSAVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDRESPONSAVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pUF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pUF'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pFLGTIPOCONTRATO'
        ParamType = ptInput
      end>
    object qryInadAnaIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
    end
    object qryInadAnaIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryInadAnaIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryInadAnaCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qryInadAnaCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object qryInadAnaNOMECONTRATO: TStringField
      FieldName = 'NOMECONTRATO'
      Size = 83
    end
    object qryInadAnaRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryInadAnaNUMPARCELA: TStringField
      FieldName = 'NUMPARCELA'
      Size = 81
    end
    object qryInadAnaDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryInadAnaVLRPRESTACAO: TFloatField
      FieldName = 'VLRPRESTACAO'
    end
    object qryInadAnaFLGTIPOLANC: TFloatField
      FieldName = 'FLGTIPOLANC'
    end
    object qryInadAnaFLGLANCINTEGRA: TFloatField
      FieldName = 'FLGLANCINTEGRA'
    end
    object qryInadAnaDATAPAGAMENTO: TDateTimeField
      FieldName = 'DATAPAGAMENTO'
    end
    object qryInadAnaVLRPAGO: TFloatField
      FieldName = 'VLRPAGO'
    end
    object qryInadAnaDIASDIF: TFloatField
      FieldName = 'DIASDIF'
    end
    object qryInadAnaVLRCMATRASO: TFloatField
      FieldName = 'VLRCMATRASO'
    end
    object qryInadAnaVLRMULTAATRASO: TFloatField
      FieldName = 'VLRMULTAATRASO'
    end
    object qryInadAnaVLRMORAATRASO: TFloatField
      FieldName = 'VLRMORAATRASO'
    end
    object qryInadAnaVLRDIF: TFloatField
      FieldName = 'VLRDIF'
    end
    object qryInadAnaVLRCMCORRIG: TFloatField
      FieldName = 'VLRCMCORRIG'
    end
    object qryInadAnaVLRMULTACORRIG: TFloatField
      FieldName = 'VLRMULTACORRIG'
    end
    object qryInadAnaVLRJUROSCORRIG: TFloatField
      FieldName = 'VLRJUROSCORRIG'
    end
    object qryInadAnaVLRDEVIDO: TFloatField
      FieldName = 'VLRDEVIDO'
    end
    object qryInadAnaCAL_TIPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CAL_TIPO'
      Calculated = True
    end
  end
  object dsInadAna: TwwDataSource
    DataSet = qryInadAna
    Left = 124
    Top = 282
  end
  object pplInadAna: TppBDEPipeline
    DataSource = dsInadAna
    UserName = 'lInadAna'
    Left = 218
    Top = 282
    object pplInadAnappField1: TppField
      FieldAlias = 'IDPARCFINANCIMOV'
      FieldName = 'IDPARCFINANCIMOV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField2: TppField
      FieldAlias = 'IDCONDPAGIMOVEL'
      FieldName = 'IDCONDPAGIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField3: TppField
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField4: TppField
      FieldAlias = 'CONNUMERO'
      FieldName = 'CONNUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField5: TppField
      FieldAlias = 'CONNOME'
      FieldName = 'CONNOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField6: TppField
      FieldAlias = 'NOMECONTRATO'
      FieldName = 'NOMECONTRATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField7: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField8: TppField
      FieldAlias = 'NUMPARCELA'
      FieldName = 'NUMPARCELA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField9: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField10: TppField
      FieldAlias = 'VLRPRESTACAO'
      FieldName = 'VLRPRESTACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField11: TppField
      FieldAlias = 'FLGTIPOLANC'
      FieldName = 'FLGTIPOLANC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField12: TppField
      FieldAlias = 'FLGLANCINTEGRA'
      FieldName = 'FLGLANCINTEGRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField13: TppField
      FieldAlias = 'DATAPAGAMENTO'
      FieldName = 'DATAPAGAMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField14: TppField
      FieldAlias = 'VLRPAGO'
      FieldName = 'VLRPAGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField15: TppField
      FieldAlias = 'DIASDIF'
      FieldName = 'DIASDIF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField16: TppField
      FieldAlias = 'VLRCMATRASO'
      FieldName = 'VLRCMATRASO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField17: TppField
      FieldAlias = 'VLRMULTAATRASO'
      FieldName = 'VLRMULTAATRASO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField18: TppField
      FieldAlias = 'VLRMORAATRASO'
      FieldName = 'VLRMORAATRASO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField19: TppField
      FieldAlias = 'VLRDIF'
      FieldName = 'VLRDIF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField20: TppField
      FieldAlias = 'VLRCMCORRIG'
      FieldName = 'VLRCMCORRIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField21: TppField
      FieldAlias = 'VLRMULTACORRIG'
      FieldName = 'VLRMULTACORRIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField22: TppField
      FieldAlias = 'VLRJUROSCORRIG'
      FieldName = 'VLRJUROSCORRIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField23: TppField
      FieldAlias = 'VLRDEVIDO'
      FieldName = 'VLRDEVIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object pplInadAnappField24: TppField
      FieldAlias = 'CAL_TIPO'
      FieldName = 'CAL_TIPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
  end
  object rpInadAna: TppReport
    AutoStop = False
    DataPipeline = pplInadAna
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
    Left = 306
    Top = 282
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplInadAna'
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 14817
      mmPrintPosition = 0
      object ppTituloInadAna: TppLabel
        UserName = 'TituloInadAna'
        AutoSize = False
        Caption = 'Inadimplência de Alienação - Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8467
        mmWidth = 283898
        BandType = 0
      end
      object ppLabel74: TppLabel
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
        mmLeft = 0
        mmTop = 1852
        mmWidth = 283898
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppsCor2: TppShape
        OnPrint = ppsCorPrint
        UserName = 'sCor2'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'DBText9'
        BlankWhenZero = True
        DataField = 'NUMPARCELA'
        DataPipeline = pplInadAna
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'DBText10'
        DataField = 'DATAVENCIMENTO'
        DataPipeline = pplInadAna
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 14288
        mmTop = 0
        mmWidth = 16002
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'DBText11'
        BlankWhenZero = True
        DataField = 'VLRPRESTACAO'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 52123
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText55: TppDBText
        UserName = 'DBText27'
        BlankWhenZero = True
        DataField = 'DATAPAGAMENTO'
        DataPipeline = pplInadAna
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 73025
        mmTop = 0
        mmWidth = 16002
        BandType = 4
      end
      object ppDBText56: TppDBText
        UserName = 'DBText38'
        BlankWhenZero = True
        DataField = 'VLRPAGO'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 89959
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText57: TppDBText
        UserName = 'dbtTipo'
        DataField = 'CAL_TIPO'
        DataPipeline = pplInadAna
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 31485
        mmTop = 0
        mmWidth = 19845
        BandType = 4
      end
      object ppDBText58: TppDBText
        UserName = 'DBText33'
        BlankWhenZero = True
        DataField = 'VLRDEVIDO'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00;-#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 264055
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText86: TppDBText
        UserName = 'DBText86'
        BlankWhenZero = True
        DataField = 'DIASDIF'
        DataPipeline = pplInadAna
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 110861
        mmTop = 0
        mmWidth = 6614
        BandType = 4
      end
      object ppDBText87: TppDBText
        UserName = 'DBText87'
        BlankWhenZero = True
        DataField = 'VLRCMATRASO'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 118269
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText88: TppDBText
        UserName = 'DBText88'
        BlankWhenZero = True
        DataField = 'VLRMULTAATRASO'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 139171
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText89: TppDBText
        UserName = 'DBText89'
        BlankWhenZero = True
        DataField = 'VLRMORAATRASO'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 159809
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText90: TppDBText
        UserName = 'DBText90'
        BlankWhenZero = True
        DataField = 'VLRCMCORRIG'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 201348
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText92: TppDBText
        UserName = 'DBText92'
        BlankWhenZero = True
        DataField = 'VLRJUROSCORRIG'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 243153
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText93: TppDBText
        UserName = 'DBText93'
        BlankWhenZero = True
        DataField = 'VLRDIF'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00;-#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 180446
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
      object ppDBText91: TppDBText
        UserName = 'DBText91'
        BlankWhenZero = True
        DataField = 'VLRMULTACORRIG'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3704
        mmLeft = 222250
        mmTop = 0
        mmWidth = 20066
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine12: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel75: TppLabel
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
        mmWidth = 283369
        BandType = 8
      end
      object ppSystemVariable11: TppSystemVariable
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
        mmWidth = 283105
        BandType = 8
      end
      object ppSystemVariable12: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257176
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel82: TppLabel
        UserName = 'Label82'
        AutoSize = False
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 153723
        mmTop = 2910
        mmWidth = 25135
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'VLRDEVIDO'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3175
        mmLeft = 245798
        mmTop = 2910
        mmWidth = 38365
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc101'
        DataField = 'VLRDIF'
        DataPipeline = pplInadAna
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplInadAna'
        mmHeight = 3175
        mmLeft = 180182
        mmTop = 2911
        mmWidth = 20320
        BandType = 7
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = pplInadAna
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplInadAna'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 30427
        mmPrintPosition = 0
        object ppLine14: TppLine
          UserName = 'Line14'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 12700
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel99: TppLabel
          UserName = 'Label24'
          AutoSize = False
          Caption = 'Data de Pagto.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7144
          mmLeft = 73025
          mmTop = 20902
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppLabel100: TppLabel
          UserName = 'Label63'
          AutoSize = False
          Caption = 'Valor Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 89959
          mmTop = 24606
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel102: TppLabel
          UserName = 'Label51'
          AutoSize = False
          Caption = '    Valor Devido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7144
          mmLeft = 264055
          mmTop = 20902
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLine13: TppLine
          UserName = 'Line7'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 28839
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppdbGrupo2: TppDBText
          UserName = 'DBText18'
          DataField = 'NOMECONTRATO'
          DataPipeline = pplInadAna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplInadAna'
          mmHeight = 3704
          mmLeft = 22754
          mmTop = 6879
          mmWidth = 71967
          BandType = 3
          GroupNo = 0
        end
        object ppLabel113: TppLabel
          UserName = 'Label113'
          AutoSize = False
          Caption = 'Dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 110861
          mmTop = 24606
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object ppLabel114: TppLabel
          UserName = 'Label114'
          AutoSize = False
          Caption = 'Correção Monetária'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7144
          mmLeft = 118269
          mmTop = 20902
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel115: TppLabel
          UserName = 'Label202'
          AutoSize = False
          Caption = 'Multa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 139171
          mmTop = 24606
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel116: TppLabel
          UserName = 'Label116'
          AutoSize = False
          Caption = 'Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 159809
          mmTop = 24606
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel120: TppLabel
          UserName = 'Label120'
          AutoSize = False
          Caption = 'Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 243153
          mmTop = 24606
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel117: TppLabel
          UserName = 'Label117'
          AutoSize = False
          Caption = 'Correção Monetária'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7144
          mmLeft = 201348
          mmTop = 20902
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel121: TppLabel
          UserName = 'Label121'
          AutoSize = False
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 180446
          mmTop = 24606
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppShape1: TppShape
          UserName = 'Shape1'
          mmHeight = 2117
          mmLeft = 118269
          mmTop = 18256
          mmWidth = 82286
          BandType = 3
          GroupNo = 0
        end
        object ppShape2: TppShape
          UserName = 'Shape2'
          Pen.Color = clWhite
          mmHeight = 794
          mmLeft = 118269
          mmTop = 19844
          mmWidth = 82286
          BandType = 3
          GroupNo = 0
        end
        object ppShape3: TppShape
          UserName = 'Shape3'
          mmHeight = 2117
          mmLeft = 201348
          mmTop = 18256
          mmWidth = 62177
          BandType = 3
          GroupNo = 0
        end
        object ppShape4: TppShape
          UserName = 'Shape4'
          Pen.Color = clWhite
          mmHeight = 794
          mmLeft = 201348
          mmTop = 19844
          mmWidth = 62177
          BandType = 3
          GroupNo = 0
        end
        object ppLabel119: TppLabel
          UserName = 'Label119'
          AutoSize = False
          Caption = 'Correção de Valores Pagos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 118269
          mmTop = 14817
          mmWidth = 82286
          BandType = 3
          GroupNo = 0
        end
        object ppLabel122: TppLabel
          UserName = 'Label122'
          AutoSize = False
          Caption = 'Correção de Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 201348
          mmTop = 14817
          mmWidth = 62177
          BandType = 3
          GroupNo = 0
        end
        object ppLabel123: TppLabel
          UserName = 'Label123'
          AutoSize = False
          Caption = 'Multa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 222250
          mmTop = 24606
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel93: TppLabel
          UserName = 'Label18'
          AutoSize = False
          Caption = 'Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 2117
          mmTop = 24606
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppLabel94: TppLabel
          UserName = 'Label19'
          AutoSize = False
          Caption = 'Data de Vencto.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7144
          mmLeft = 14288
          mmTop = 20902
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppLabel101: TppLabel
          UserName = 'Label50'
          AutoSize = False
          Caption = 'Lançamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 31485
          mmTop = 24606
          mmWidth = 19844
          BandType = 3
          GroupNo = 0
        end
        object ppLabel95: TppLabel
          UserName = 'Label20'
          AutoSize = False
          Caption = 'Prestação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 52123
          mmTop = 24606
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object pplGrupo2: TppLabel
          UserName = 'Label31'
          AutoSize = False
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 6879
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel112: TppLabel
          UserName = 'Label112'
          AutoSize = False
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 17463
          mmTop = 6879
          mmWidth = 2646
          BandType = 3
          GroupNo = 0
        end
        object pplComprador2: TppLabel
          UserName = 'Label38'
          AutoSize = False
          Caption = 'Comprador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 529
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel111: TppLabel
          UserName = 'Label111'
          AutoSize = False
          Caption = ':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 17463
          mmTop = 529
          mmWidth = 2646
          BandType = 3
          GroupNo = 0
        end
        object ppdbComprador2: TppDBText
          UserName = 'DBText26'
          DataField = 'RAZAOSOCIAL'
          DataPipeline = pplInadAna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplInadAna'
          mmHeight = 3704
          mmLeft = 23019
          mmTop = 529
          mmWidth = 69056
          BandType = 3
          GroupNo = 0
        end
        object ppDtInadAna: TppLabel
          UserName = 'DtInadAna'
          AutoSize = False
          Caption = 'Data Limite: 99/99/9999 '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 240771
          mmTop = 6879
          mmWidth = 43392
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        AfterPrint = gfbExtratoAfterPrint
        BeforePrint = gfbExtratoBeforePrint
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel77: TppLabel
          UserName = 'Label77'
          AutoSize = False
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 162984
          mmTop = 0
          mmWidth = 16002
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VLRDEVIDO'
          DataPipeline = pplInadAna
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadAna'
          mmHeight = 3175
          mmLeft = 241300
          mmTop = 0
          mmWidth = 43127
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'VLRDIF'
          DataPipeline = pplInadAna
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplInadAna'
          mmHeight = 3175
          mmLeft = 180182
          mmTop = 0
          mmWidth = 20320
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryImovAli: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '      CI.IDCONTRATOIMOVEL,'
      '      CI.CONNUMERO,'
      '      CI.CONNOME,'
      '     (CI.CONNUMERO || '#39' - '#39' || CI.CONNOME) AS NOMECONTRATO,'
      '      CI.CONDATAASSINATURA,'
      '      P.RAZAOSOCIAL,'
      '      IM.NOMEMESTRE,'
      '      IM.NOMEIMOVEL,'
      '      IM.VLRVENDA,'
      '      IM.VLRCONTABIL,'
      '     (IM.VLRVENDA - IM.VLRCONTABIL) AS VLRRESULTADO,'
      '      DECODE(NVL(IM.VLRCONTABIL,0), 0, 0,'
      
        '           ((IM.VLRVENDA - IM.VLRCONTABIL) * 100 / IM.VLRCONTABI' +
        'L) ) AS PERCLUCRO'
      ''
      'FROM'
      '     CONTRATOIMOVEL CI,'
      '     PESSOA P,'
      ''
      '     ( SELECT DISTINCT'
      '              CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL,'
      '              M.IMONOME            AS NOMEMESTRE,'
      '              I.IMONOME            AS NOMEIMOVEL,'
      '              M.IDIMOVEL           AS IDIMOVELMESTRE,'
      '              I.IDIMOVEL           AS IDIMOVEL,'
      '              CXI.VLRVENDA         AS VLRVENDA,'
      '              CXI.VLRCONTABIL      AS VLRCONTABIL,'
      '              C.UF                 AS UF'
      '       FROM'
      '              CONTRATOXIMOVEL CXI,'
      '              IMOVEL I,'
      '              IMOVEL M,'
      '              CIDADES C'
      '       WHERE'
      '              CXI.IDIMOVEL = I.IDIMOVEL'
      '          AND M.IDCIDADES = C.IDCIDADES(+)'
      '          AND I.IDIMOVELMESTRE = M.IDIMOVEL ) IM'
      ''
      'WHERE'
      '         (P.IDPESSOA(+) = CI.IDLOCATARIO)'
      '     AND (IM.IDCONTRATOIMOVEL(+) = CI.IDCONTRATOIMOVEL)'
      
        '     AND ( (:pDTINI IS NULL) OR (CI.CONDATAASSINATURA >= TO_DATE' +
        '(:pDTINI,'#39'DD/MM/YYYY'#39')) )'
      
        '     AND ( (:pDTFIM IS NULL) OR (CI.CONDATAASSINATURA <= TO_DATE' +
        '(:pDTFIM,'#39'DD/MM/YYYY'#39')) )'
      
        '     AND ( (:pIDCONTRATOIMOVEL IS NULL) OR (CI.IDCONTRATOIMOVEL ' +
        '= :pIDCONTRATOIMOVEL) )'
      
        '     AND ( (:pIDCOMPRADOR IS NULL) OR (CI.IDLOCATARIO = :pIDCOMP' +
        'RADOR) )'
      
        '     AND ( (:pIDRESPONSAVEL IS NULL) OR (CI.IDRESPONSAVEL = :pID' +
        'RESPONSAVEL) )'
      
        '     AND ( (:pIDIMOVELMESTRE IS NULL) OR (IM.IDIMOVELMESTRE = :p' +
        'IDIMOVELMESTRE) )'
      '     AND ( (:pIDIMOVEL IS NULL) OR (IM.IDIMOVEL = :pIDIMOVEL) )'
      '     AND ( (:pUF IS NULL) OR (TRIM(IM.UF) = :pUF) )'
      '     AND ( CI.FLGTIPOCONTRATO = :PFLGTIPOCONTRATO )'
      
        'ORDER BY DECODE(:pORDEM, 0, NOMEMESTRE || RAZAOSOCIAL || CONNUME' +
        'RO,'
      
        '                         1, RAZAOSOCIAL || NOMEMESTRE || CONNUME' +
        'RO,'
      '                         2, NOMECONTRATO || NOMEIMOVEL,'
      
        '                         3, TO_CHAR(CONDATAASSINATURA,'#39'YYYY/MM/D' +
        'D'#39') )'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 34
    Top = 338
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'pDTINI'
        ParamType = ptUnknown
        Value = '01/01/2001'
      end
      item
        DataType = ftDateTime
        Name = 'pDTINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDTFIM'
        ParamType = ptUnknown
        Value = '01/11/2001'
      end
      item
        DataType = ftDateTime
        Name = 'pDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCOMPRADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDCOMPRADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pUF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pUF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGTIPOCONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pORDEM'
        ParamType = ptUnknown
      end>
  end
  object dsImovAli: TwwDataSource
    DataSet = qryImovAli
    Left = 124
    Top = 338
  end
  object pplImovAli: TppBDEPipeline
    DataSource = dsImovAli
    UserName = 'lImovAli'
    Left = 218
    Top = 338
  end
  object rpImovAli: TppReport
    AutoStop = False
    DataPipeline = pplImovAli
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
    Left = 306
    Top = 338
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplImovAli'
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 20373
      mmPrintPosition = 0
      object ppLabel64: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Imóveis Alienados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8467
        mmWidth = 284163
        BandType = 0
      end
      object ppLabel73: TppLabel
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
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284428
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line11'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 15081
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'Label23'
        Caption = 'Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 61913
        mmTop = 15875
        mmWidth = 11642
        BandType = 0
      end
      object pplComprador3: TppLabel
        UserName = 'Label19'
        Caption = 'Comprador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 81492
        mmTop = 15875
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'Label50'
        Caption = 'Imóvel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 16140
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel84: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'Vlr Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 188384
        mmTop = 15875
        mmWidth = 15875
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 19844
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel90: TppLabel
        UserName = 'Label90'
        AutoSize = False
        Caption = 'Vlr Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 242888
        mmTop = 15875
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel91: TppLabel
        UserName = 'Label901'
        AutoSize = False
        Caption = 'Vlr Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 214578
        mmTop = 15875
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel96: TppLabel
        UserName = 'Label902'
        AutoSize = False
        Caption = 'Diferença'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 268288
        mmTop = 15875
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel79: TppLabel
        UserName = 'Label79'
        AutoSize = False
        Caption = 'Data Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 152136
        mmTop = 15875
        mmWidth = 21696
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object pplSeparador4: TppLine
        OnPrint = pplnSeparadorPrint
        UserName = 'lSeparador4'
        ParentHeight = True
        ParentWidth = True
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppsCor4: TppShape
        OnPrint = ppsCorPrint
        UserName = 'sCor4'
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppdbComprador3: TppDBText
        UserName = 'DBText10'
        DataField = 'RAZAOSOCIAL'
        DataPipeline = pplImovAli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplImovAli'
        mmHeight = 3704
        mmLeft = 81492
        mmTop = 0
        mmWidth = 71702
        BandType = 4
      end
      object ppDBText59: TppDBText
        UserName = 'DBText12'
        BlankWhenZero = True
        DataField = 'CONNUMERO'
        DataPipeline = pplImovAli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplImovAli'
        mmHeight = 3704
        mmLeft = 61913
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText60: TppDBText
        UserName = 'DBText13'
        BlankWhenZero = True
        DataField = 'NOMEIMOVEL'
        DataPipeline = pplImovAli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplImovAli'
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 0
        mmWidth = 56356
        BandType = 4
      end
      object ppDBText61: TppDBText
        UserName = 'DBText33'
        BlankWhenZero = True
        DataField = 'VLRVENDA'
        DataPipeline = pplImovAli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplImovAli'
        mmHeight = 3704
        mmLeft = 177007
        mmTop = 0
        mmWidth = 27252
        BandType = 4
      end
      object ppDBText63: TppDBText
        UserName = 'DBText63'
        BlankWhenZero = True
        DataField = 'VLRRESULTADO'
        DataPipeline = pplImovAli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplImovAli'
        mmHeight = 3704
        mmLeft = 235744
        mmTop = 0
        mmWidth = 27252
        BandType = 4
      end
      object ppDBText64: TppDBText
        UserName = 'DBText64'
        BlankWhenZero = True
        DataField = 'PERCLUCRO'
        DataPipeline = pplImovAli
        DisplayFormat = '##0.00%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplImovAli'
        mmHeight = 3704
        mmLeft = 266701
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText65: TppDBText
        UserName = 'DBText65'
        BlankWhenZero = True
        DataField = 'VLRCONTABIL'
        DataPipeline = pplImovAli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplImovAli'
        mmHeight = 3704
        mmLeft = 206375
        mmTop = 0
        mmWidth = 27252
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'DBText52'
        BlankWhenZero = True
        DataField = 'CONDATAASSINATURA'
        DataPipeline = pplImovAli
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplImovAli'
        mmHeight = 3704
        mmLeft = 156634
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppLine17: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel85: TppLabel
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
        mmWidth = 284163
        BandType = 8
      end
      object ppSystemVariable13: TppSystemVariable
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
        mmWidth = 284163
        BandType = 8
      end
      object ppSystemVariable14: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257969
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand5: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 37835
      mmPrintPosition = 0
      object ppRegion5: TppRegion
        UserName = 'Region5'
        mmHeight = 9260
        mmLeft = 139965
        mmTop = 6615
        mmWidth = 144727
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel125: TppLabel
          UserName = 'Label125'
          Caption = 'Total Geral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 142876
          mmTop = 9525
          mmWidth = 29633
          BandType = 7
        end
        object ppDBCalcVlrVenda: TppDBCalc
          UserName = 'DBCalcVlrVenda'
          DataField = 'VLRVENDA'
          DataPipeline = pplImovAli
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplImovAli'
          mmHeight = 3175
          mmLeft = 177007
          mmTop = 9790
          mmWidth = 27252
          BandType = 7
        end
        object ppDBCalcVlrContabil: TppDBCalc
          UserName = 'DBCalcVlrContabil'
          DataField = 'VLRCONTABIL'
          DataPipeline = pplImovAli
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplImovAli'
          mmHeight = 3175
          mmLeft = 206375
          mmTop = 9790
          mmWidth = 27252
          BandType = 7
        end
        object ppDBCalcVlrResult: TppDBCalc
          UserName = 'DBCalcVlrResult'
          DataField = 'VLRRESULTADO'
          DataPipeline = pplImovAli
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplImovAli'
          mmHeight = 3175
          mmLeft = 235744
          mmTop = 9790
          mmWidth = 27252
          BandType = 7
        end
        object ppvarDiferenca: TppVariable
          UserName = 'varDiferenca'
          AutoSize = False
          CalcOrder = 0
          DisplayFormat = '##0.00%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 264319
          mmTop = 9790
          mmWidth = 18785
          BandType = 7
        end
      end
      object ppRegion6: TppRegion
        UserName = 'Region6'
        mmHeight = 9260
        mmLeft = 2646
        mmTop = 6615
        mmWidth = 33073
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'IDCONTRATOIMOVEL'
          DataPipeline = pplImovAli
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplImovAli'
          mmHeight = 3440
          mmLeft = 5292
          mmTop = 9790
          mmWidth = 9790
          BandType = 7
        end
        object ppLabel126: TppLabel
          UserName = 'Label126'
          Caption = 'Contratos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3387
          mmLeft = 17198
          mmTop = 9790
          mmWidth = 13335
          BandType = 7
        end
      end
      object ppLine3: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 1323
        mmWidth = 284300
        BandType = 7
      end
    end
    object ppGroup12: TppGroup
      BreakName = 'NOMEMESTRE'
      DataPipeline = pplImovAli
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group12'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplImovAli'
      object ppGroupHeaderBand10: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8996
        mmPrintPosition = 0
        object ppLabel89: TppLabel
          UserName = 'Label18'
          AutoSize = False
          Caption = 'Imóvel Mestre:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 2381
          mmWidth = 30163
          BandType = 3
          GroupNo = 0
        end
        object ppDBText62: TppDBText
          UserName = 'dbGrupo'
          DataField = 'NOMEMESTRE'
          DataPipeline = pplImovAli
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplImovAli'
          mmHeight = 4233
          mmLeft = 31750
          mmTop = 2381
          mmWidth = 132821
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 7408
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 529
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand10: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650612
        53756D6D6172794265666F72655072696E740B50726F6772616D54797065070B
        747450726F63656475726506536F7572636506FA70726F636564757265205375
        6D6D6172794265666F72655072696E743B0D0A626567696E0D0A202020766172
        4469666572656E63612E4173457874656E646564203A3D20303B0D0A20202069
        6620444243616C63566C72436F6E746162696C2E56616C7565203E2030207468
        656E20626567696E0D0A2020202020207661724469666572656E63612E417345
        7874656E646564203A3D2028444243616C63566C7256656E64612E56616C7565
        202D20444243616C63566C72436F6E746162696C2E56616C756529202A203130
        30202F20444243616C63566C72436F6E746162696C2E56616C75653B200D0A20
        2020656E643B0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506075375
        6D6D617279094576656E744E616D65060B4265666F72655072696E7407457665
        6E74494402180000}
    end
    object ppParameterList2: TppParameterList
    end
  end
  object qryCondPag: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsContrato
    SQL.Strings = (
      'SELECT'
      '      CP.IDCONDINICIAL,'
      '      CP.VLRFINANC,'
      '      CP.TAXAJUROS,'
      '      CP.PERIODOTAXA,'
      '      CP.FORMACALCULO,'
      '      CP.NUMPARCELAS,'
      '      CP.DATAVENCIMENTO,'
      '      CP.DATAINI,'
      '      CP.PERINDPROJ,'
      '      MC.MOESIGLA   AS DSCINDCORR,'
      '      MP.MOESIGLA   AS DSCINDPROJ,'
      
        '      DECODE(CP.PERIODOTAXA,'#39'M'#39',TO_CHAR(CP.TAXAJUROS,'#39'999.9999'#39')' +
        ' || '#39'% ao Mês'#39','
      
        '                                TO_CHAR(CP.TAXAJUROS,'#39'999.9999'#39')' +
        ' || '#39'% ao Ano'#39') AS DSCJUROS,'
      '      DECODE(CP.TIPOCONDPAG,'#39'S'#39','#39'Sinal'#39','
      '                            '#39'P'#39','#39'Parcelamento'#39','
      '                            '#39'V'#39','#39'Venda a Vista'#39','
      '                            '#39'C'#39','#39'Caução'#39','
      
        '                            '#39'R'#39','#39'Repactuação'#39','#39'Cond.Inicial'#39') AS' +
        ' DSCTIPO'
      ''
      'FROM  CONDPAGIMOVEL CP,'
      '      MOEDA MC,'
      '      MOEDA MP'
      ''
      'WHERE'
      ' (MC.MOECODIGO(+) = CP.INDCORRECAO)'
      '  AND (MP.MOECODIGO(+) = CP.IDINDCORRPROJ)'
      '  AND (IDCONDINICIAL   = :IDCONDINICIAL)'
      ''
      ''
      'ORDER BY  CP.TIPOCONDPAG, CP.DATAINI'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 34
    Top = 112
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONDINICIAL'
        ParamType = ptUnknown
      end>
  end
  object dsCondPag: TwwDataSource
    DataSet = qryCondPag
    Left = 124
    Top = 112
  end
  object pplCondPag: TppBDEPipeline
    DataSource = dsCondPag
    SkipWhenNoRecords = False
    UserName = 'lCondPag'
    Left = 218
    Top = 112
    MasterDataPipelineName = 'pplContato'
    object TppMasterFieldLink
      MasterFieldName = 'IDCONDINICIAL'
      DetailFieldName = 'IDCONDINICIAL'
      DetailSortOrder = soAscending
    end
  end
  object qryListaContratos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CI.IDCONTRATOIMOVEL,'
      '     CI.CONNUMERO,'
      '     CI.CONNOME,'
      '     CI.VLRPROPOSTA,'
      '     CI.CONDATAINICIO,'
      '     P.RAZAOSOCIAL,'
      '     IM.IMONOME AS NOMEMESTRE,'
      '     (IM.IMONOME || '#39' - '#39' || I.IMONOME) AS NOMEIMOVEL,'
      '     CXI.VLRVENDA,'
      '     CXI.VLRCONTABIL,'
      '     DECODE(CI.FLGTIPOCONTRATO,'#39'P'#39','#39'Proposta'#39','
      '                               '#39'C'#39','#39'Contrato'#39','
      '                               '#39'A'#39','#39'Acordo'#39') AS DSCSITUACAO,'
      
        '     DECODE(CI.FLGSTATUS,'#39'V'#39','#39'Vigente'#39','#39'E'#39','#39'Encerrado'#39','#39'R'#39','#39'Resc' +
        'indido'#39','#39'S'#39','#39'Suspenso'#39') AS DSCSTATUS,'
      
        '     DECODE(CXI.FLGRATEIO, 1, CXI.CIMPERCENTRATEIO, 100)  AS PER' +
        'CENT_BAIXA'
      'FROM'
      '     CONTRATOIMOVEL CI,'
      '     CONTRATOXIMOVEL CXI,'
      '     PESSOA P,'
      '     IMOVEL I,'
      '     IMOVEL IM'
      'WHERE'
      '  1=2 AND   (CI.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL)'
      '     AND (CI.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL)'
      '     AND (CXI.IDIMOVEL = I.IDIMOVEL)'
      '     AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)'
      '     AND (CI.IDLOCATARIO = P.IDPESSOA(+))'
      
        '     AND ( (:pIDCONTRATOIMOVEL IS NULL) OR (CI.IDCONTRATOIMOVEL ' +
        '= :pIDCONTRATOIMOVEL) )'
      
        '     AND ( (:pIDCOMPRADOR IS NULL) OR (CI.IDLOCATARIO = :pIDCOMP' +
        'RADOR) )'
      
        '     AND ( (:pIDRESPONSAVEL IS NULL) OR (CI.IDRESPONSAVEL = :pID' +
        'RESPONSAVEL) )'
      '     AND ( (:pIDIMOVEL IS NULL) OR (I.IDIMOVEL = :pIDIMOVEL) )'
      
        '     AND ( (:pIDIMOVELMESTRE IS NULL) OR (I.IDIMOVELMESTRE = :pI' +
        'DIMOVELMESTRE) )'
      
        '     AND ( (:pIDADMINIMOVEL IS NULL) OR (CI.IDADMINIMOVEL = :pID' +
        'ADMINIMOVEL) )'
      
        '     AND ( (:pDTINI IS NULL) OR (CI.CONDATAINICIO >= TO_DATE(:pD' +
        'TINI,'#39'DD/MM/YYYY'#39')) )'
      
        '     AND ( (:pDTFIM IS NULL) OR (CI.CONDATAINICIO <= TO_DATE(:pD' +
        'TFIM,'#39'DD/MM/YYYY'#39')) )'
      
        '     AND ( (:pFLGSTATUS IS NULL) OR (CI.FLGSTATUS = :pFLGSTATUS)' +
        ' )'
      
        '     AND (   ((:pFLGPROPOSTA = '#39'S'#39') AND (CI.FLGTIPOCONTRATO = '#39'P' +
        #39'))'
      
        '          OR ((:pFLGCONTRATO = '#39'S'#39') AND (CI.FLGTIPOCONTRATO = '#39'C' +
        #39'))'
      
        '          OR ((:pFLGACORDO   = '#39'S'#39') AND (CI.FLGTIPOCONTRATO = '#39'A' +
        #39'))  )'
      ''
      'ORDER BY DECODE(:pORDEM, 0, CONNUMERO || NOMEIMOVEL,'
      '                         1, CONNOME || NOMEIMOVEL,'
      
        '                         2, NOMEMESTRE || CONNUMERO || NOMEIMOVE' +
        'L,'
      '                         3, NOMEMESTRE || CONNOME || NOMEIMOVEL,'
      
        '                         4, RAZAOSOCIAL || NOMEMESTRE || CONNUME' +
        'RO || NOMEIMOVEL)'
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 34
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDCOMPRADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDCOMPRADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDADMINIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDTINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDTINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFLGSTATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFLGSTATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFLGPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFLGCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pFLGACORDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pORDEM'
        ParamType = ptUnknown
      end>
  end
  object qryListaCondPag: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsListaContratos
    SQL.Strings = (
      'SELECT'
      '      CP.IDCONTRATOIMOVEL,'
      '      CP.VLRFINANC,'
      '      CP.TAXAJUROS,'
      '      CP.PERIODOTAXA,'
      '      CP.NUMPARCELAS,'
      '      CP.DATAVENCIMENTO,'
      '      CP.DATAINI,'
      '      CP.FLGREAJMENSAL,'
      '      CP.FLGCMMENSAL,'
      '      MC.MOESIGLA   AS DSCINDCORR,'
      '      MP.MOESIGLA   AS DSCINDPROJ,'
      
        '      DECODE(CP.PERIODOTAXA,'#39'M'#39',TO_CHAR(CP.TAXAJUROS,'#39'999.9999'#39')' +
        ' || '#39'% ao Mês'#39','
      
        '                                TO_CHAR(CP.TAXAJUROS,'#39'999.9999'#39')' +
        ' || '#39'% ao Ano'#39') AS DSCJUROS,'
      '      DECODE(CP.TIPOCONDPAG,'#39'S'#39','#39'Sinal'#39','
      '                            '#39'P'#39','#39'Parcelamento'#39','
      '                            '#39'V'#39','#39'Venda a Vista'#39','
      '                            '#39'C'#39','#39'Caução'#39','
      
        '                            '#39'R'#39','#39'Repactuação'#39','#39'Cond.Inicial'#39') AS' +
        ' DSCTIPO'
      ''
      'FROM  CONDPAGIMOVEL CP,'
      '      MOEDA MC,'
      '      MOEDA MP'
      ''
      'WHERE'
      '  1=2 AND (MC.MOECODIGO(+) = CP.INDCORRECAO)'
      '  AND (MP.MOECODIGO(+) = CP.IDINDCORRPROJ)'
      '  AND (IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      ''
      ''
      'ORDER BY  DATAINI'
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 34
    Top = 404
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
  end
  object dsListaContratos: TwwDataSource
    DataSet = qryListaContratos
    Left = 124
    Top = 391
  end
  object dsListaCondPag: TwwDataSource
    DataSet = qryListaCondPag
    Left = 124
    Top = 404
  end
  object pplListaContratos: TppBDEPipeline
    DataSource = dsListaContratos
    UserName = 'lListaContratos'
    Left = 218
    Top = 391
  end
  object pplListaCondPag: TppBDEPipeline
    DataSource = dsListaCondPag
    UserName = 'lListaCondPag'
    Left = 218
    Top = 404
    MasterDataPipelineName = 'pplListaContratos'
    object TppMasterFieldLink
      MasterFieldName = 'IDCONTRATOIMOVEL'
      DetailFieldName = 'IDCONTRATOIMOVEL'
      DetailSortOrder = soAscending
    end
  end
  object rpListaContratos: TppReport
    AutoStop = False
    DataPipeline = pplListaContratos
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
    BeforePrint = rpListaContratosBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 306
    Top = 396
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplListaContratos'
    object ppHeaderBand8: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17463
      mmPrintPosition = 0
      object pplTitulo: TppLabel
        UserName = 'Label11'
        Caption = 'Relação de Contratos e Propostas de Alienação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 91017
        mmTop = 8731
        mmWidth = 96573
        BandType = 0
      end
      object ppLabel53: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 121709
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 15610
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand8: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText75: TppDBText
        UserName = 'DBText17'
        BlankWhenZero = True
        DataField = 'VLRVENDA'
        DataPipeline = pplListaContratos
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListaContratos'
        mmHeight = 3175
        mmLeft = 132292
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        DataField = 'NOMEIMOVEL'
        DataPipeline = pplListaContratos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListaContratos'
        mmHeight = 3175
        mmLeft = 17727
        mmTop = 0
        mmWidth = 106892
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText3'
        BlankWhenZero = True
        DataField = 'VLRCONTABIL'
        DataPipeline = pplListaContratos
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListaContratos'
        mmHeight = 3175
        mmLeft = 171715
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        BlankWhenZero = True
        DataField = 'PERCENT_BAIXA'
        DataPipeline = pplListaContratos
        DisplayFormat = '##0.00%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListaContratos'
        mmHeight = 3175
        mmLeft = 207698
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
    end
    object ppFooterBand8: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel54: TppLabel
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
        mmWidth = 282311
        BandType = 8
      end
      object ppSystemVariable15: TppSystemVariable
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
        mmWidth = 282311
        BandType = 8
      end
      object ppSystemVariable16: TppSystemVariable
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
        mmLeft = 256117
        mmTop = 3440
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup9: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = pplListaContratos
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplListaContratos'
      object ppGroupHeaderBand7: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppLabel55: TppLabel
          UserName = 'Label31'
          Caption = 'Contrato:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppDBText80: TppDBText
          UserName = 'DBText18'
          AutoSize = True
          DataField = 'CONNUMERO'
          DataPipeline = pplListaContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplListaContratos'
          mmHeight = 3969
          mmLeft = 18256
          mmTop = 0
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
        end
        object ppDBText81: TppDBText
          UserName = 'DBText19'
          DataField = 'CONNOME'
          DataPipeline = pplListaContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplListaContratos'
          mmHeight = 3969
          mmLeft = 42863
          mmTop = 0
          mmWidth = 144198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel56: TppLabel
          UserName = 'Label4'
          Caption = 'Valor da  Venda:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 65088
          mmTop = 9260
          mmWidth = 21696
          BandType = 3
          GroupNo = 0
        end
        object ppDBText82: TppDBText
          UserName = 'DBText201'
          DataField = 'VLRPROPOSTA'
          DataPipeline = pplListaContratos
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplListaContratos'
          mmHeight = 3175
          mmLeft = 89165
          mmTop = 9260
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel60: TppLabel
          UserName = 'Label5'
          Caption = 'Data da Proposta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 17992
          mmTop = 8996
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object ppDBText83: TppDBText
          UserName = 'DBText1'
          DataField = 'CONDATAINICIO'
          DataPipeline = pplListaContratos
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplListaContratos'
          mmHeight = 3175
          mmLeft = 42863
          mmTop = 9260
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLabel65: TppLabel
          UserName = 'Label6'
          Caption = 'Comprador:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 17992
          mmTop = 4763
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppDBText84: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'RAZAOSOCIAL'
          DataPipeline = pplListaContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplListaContratos'
          mmHeight = 3175
          mmLeft = 42863
          mmTop = 4763
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLabel109: TppLabel
          UserName = 'Label109'
          Caption = 'Situação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 125413
          mmTop = 8996
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppDBText77: TppDBText
          UserName = 'DBText77'
          DataField = 'DSCSITUACAO'
          DataPipeline = pplListaContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplListaContratos'
          mmHeight = 3175
          mmLeft = 139700
          mmTop = 8996
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Status:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 171715
          mmTop = 8731
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppDBText78: TppDBText
          UserName = 'DBText78'
          DataField = 'DSCSTATUS'
          DataPipeline = pplListaContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplListaContratos'
          mmHeight = 3175
          mmLeft = 182298
          mmTop = 8996
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup10: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = pplListaContratos
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplListaContratos'
      object ppGroupHeaderBand8: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3175
        mmPrintPosition = 0
        object ppLine18: TppLine
          UserName = 'Line19'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 1323
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup11: TppGroup
      BreakName = 'IDCONTRATOIMOVEL'
      DataPipeline = pplListaContratos
      OutlineSettings.CreateNode = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplListaContratos'
      object ppGroupHeaderBand9: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppLabel118: TppLabel
          UserName = 'Label29'
          AutoSize = False
          Caption = 'Valor de Alienação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 125413
          mmTop = 794
          mmWidth = 28046
          BandType = 3
          GroupNo = 2
        end
        object ppLabel66: TppLabel
          UserName = 'Label66'
          Caption = 'Imóveis:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3175
          mmLeft = 17992
          mmTop = 794
          mmWidth = 11113
          BandType = 3
          GroupNo = 2
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Valor Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 163777
          mmTop = 794
          mmWidth = 28046
          BandType = 3
          GroupNo = 2
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Perc. de Baixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 199761
          mmTop = 794
          mmWidth = 28046
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppSubReport2: TppSubReport
          UserName = 'SubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'pplListaCondPag'
          mmHeight = 5292
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 2
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport2: TppChildReport
            AutoStop = False
            DataPipeline = pplListaCondPag
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
            Left = 136
            Top = 192
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplListaCondPag'
            object ppTitleBand2: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 5027
              mmPrintPosition = 0
              object ppLabel69: TppLabel
                UserName = 'Label86'
                Caption = 'Condição de Pagamento:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsItalic]
                Transparent = True
                mmHeight = 3175
                mmLeft = 10583
                mmTop = 794
                mmWidth = 34131
                BandType = 1
              end
            end
            object ppDetailBand9: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 3704
              mmPrintPosition = 0
              object ppDBText51: TppDBText
                UserName = 'DBText51'
                DataField = 'DSCTIPO'
                DataPipeline = pplListaCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplListaCondPag'
                mmHeight = 3175
                mmLeft = 10319
                mmTop = 0
                mmWidth = 23283
                BandType = 4
              end
              object ppLabel71: TppLabel
                UserName = 'Label71'
                AutoSize = False
                Caption = 'Valor:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 3175
                mmLeft = 35719
                mmTop = 0
                mmWidth = 8996
                BandType = 4
              end
              object ppDBText53: TppDBText
                UserName = 'DBText53'
                BlankWhenZero = True
                DataField = 'VLRFINANC'
                DataPipeline = pplListaCondPag
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplListaCondPag'
                mmHeight = 3175
                mmLeft = 44979
                mmTop = 0
                mmWidth = 17198
                BandType = 4
              end
              object ppLabel78: TppLabel
                UserName = 'Label78'
                AutoSize = False
                Caption = 'Nr. Parcelas:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 3175
                mmLeft = 64558
                mmTop = 0
                mmWidth = 17992
                BandType = 4
              end
              object ppDBText70: TppDBText
                UserName = 'DBText70'
                DataField = 'NUMPARCELAS'
                DataPipeline = pplListaCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplListaCondPag'
                mmHeight = 3175
                mmLeft = 82550
                mmTop = 0
                mmWidth = 6879
                BandType = 4
              end
              object ppLabel81: TppLabel
                UserName = 'Label81'
                AutoSize = False
                Caption = 'Vencto:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 3175
                mmLeft = 91281
                mmTop = 0
                mmWidth = 10319
                BandType = 4
              end
              object ppDBText71: TppDBText
                UserName = 'DBText71'
                DataField = 'DATAVENCIMENTO'
                DataPipeline = pplListaCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplListaCondPag'
                mmHeight = 3175
                mmLeft = 101865
                mmTop = 0
                mmWidth = 15610
                BandType = 4
              end
              object ppLabel83: TppLabel
                UserName = 'Label83'
                AutoSize = False
                Caption = 'Juros:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 3175
                mmLeft = 118534
                mmTop = 0
                mmWidth = 9260
                BandType = 4
              end
              object ppDBText72: TppDBText
                UserName = 'DBText72'
                DataField = 'DSCJUROS'
                DataPipeline = pplListaCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplListaCondPag'
                mmHeight = 3175
                mmLeft = 127794
                mmTop = 0
                mmWidth = 24606
                BandType = 4
              end
              object ppLabel87: TppLabel
                UserName = 'Label87'
                AutoSize = False
                Caption = 'Correção:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 3175
                mmLeft = 178859
                mmTop = 0
                mmWidth = 13494
                BandType = 4
              end
              object ppDBText73: TppDBText
                UserName = 'DBText73'
                DataField = 'DSCINDCORR'
                DataPipeline = pplListaCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplListaCondPag'
                mmHeight = 3175
                mmLeft = 192352
                mmTop = 0
                mmWidth = 16933
                BandType = 4
              end
              object ppLabel92: TppLabel
                UserName = 'Label92'
                AutoSize = False
                Caption = 'Projeção:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 3175
                mmLeft = 209286
                mmTop = 0
                mmWidth = 12965
                BandType = 4
              end
              object ppDBText74: TppDBText
                UserName = 'DBText74'
                DataField = 'DSCINDPROJ'
                DataPipeline = pplListaCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplListaCondPag'
                mmHeight = 3175
                mmLeft = 222250
                mmTop = 0
                mmWidth = 15081
                BandType = 4
              end
              object ppLabel108: TppLabel
                UserName = 'Label108'
                AutoSize = False
                Caption = 'Início:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsItalic]
                Transparent = True
                mmHeight = 3175
                mmLeft = 259821
                mmTop = 0
                mmWidth = 8467
                BandType = 4
              end
              object ppDBText76: TppDBText
                UserName = 'DBText76'
                DataField = 'DATAINI'
                DataPipeline = pplListaCondPag
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplListaCondPag'
                mmHeight = 3175
                mmLeft = 268553
                mmTop = 0
                mmWidth = 15875
                BandType = 4
              end
              object myDBCheckBox3: TmyDBCheckBox
                UserName = 'DBCheckBox3'
                BooleanFalse = 'N'
                BooleanTrue = 'S'
                DataPipeline = pplListaCondPag
                DataField = 'FLGREAJMENSAL'
                Transparent = True
                DataPipelineName = 'pplListaCondPag'
                mmHeight = 3704
                mmLeft = 153459
                mmTop = 0
                mmWidth = 3969
                BandType = 4
              end
              object ppLabel9: TppLabel
                UserName = 'Label9'
                Caption = 'Juros Mensal'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 156634
                mmTop = 0
                mmWidth = 16933
                BandType = 4
              end
              object myDBCheckBox4: TmyDBCheckBox
                UserName = 'DBCheckBox4'
                BooleanFalse = 'N'
                BooleanTrue = 'S'
                DataPipeline = pplListaCondPag
                DataField = 'FLGCMMENSAL'
                Transparent = True
                DataPipelineName = 'pplListaCondPag'
                mmHeight = 3704
                mmLeft = 238919
                mmTop = 0
                mmWidth = 3969
                BandType = 4
              end
              object ppLabel10: TppLabel
                UserName = 'Label10'
                Caption = 'CM Mensal'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 242094
                mmTop = 0
                mmWidth = 14288
                BandType = 4
              end
            end
            object ppSummaryBand4: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
    end
  end
  object updExtrato: TUpdateSQL
    Left = 35
    Top = 157
  end
  object updInadAna: TUpdateSQL
    Left = 35
    Top = 274
  end
  object qryResiduo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    P.IDCONDPAGIMOVEL,'
      '    P.FLGTIPOLANC,'
      '    NVL(P.VLRRESIDUO,0) AS VLRRESIDUO,'
      '    P.DATAVENCIMENTO,'
      '    P.PLNCODIGO'
      'FROM'
      '    PARCFINANCIMOV P,'
      '    CONDPAGIMOVEL C'
      'WHERE'
      '    C.IDCONDPAGIMOVEL  = P.IDCONDPAGIMOVEL'
      'AND C.FORMACALCULO     = 12'
      'AND C.IDCONTRATOIMOVEL = :PIDCONTRATO'
      'ORDER BY'
      '    P.IDCONDPAGIMOVEL,'
      '    P.DATAVENCIMENTO,'
      '    P.FLGTIPOLANC'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 242
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATO'
        ParamType = ptInput
      end>
    object qryResiduoIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object qryResiduoFLGTIPOLANC: TFloatField
      FieldName = 'FLGTIPOLANC'
    end
    object qryResiduoVLRRESIDUO: TFloatField
      FieldName = 'VLRRESIDUO'
    end
    object qryResiduoDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qryResiduoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
  end
end
