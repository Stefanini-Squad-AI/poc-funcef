inherited DmRelSldComposicaoFdoRF: TDmRelSldComposicaoFdoRF
  Left = 72
  Width = 323
  Height = 175
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 175
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
    Left = 113
  end
  inherited qryExemplo: TwwQuery
    Left = 52
  end
  inherited rpExemplo: TppReport
    Left = 236
    DataPipelineName = 'pplExemplo'
  end
  object pplSldComposicaoFdoRF: TppBDEPipeline
    DataSource = dsSldComposicaoFdoRF
    UserName = 'lSldComposicaoFdoRF'
    Left = 175
    Top = 75
    object pplSldComposicaoFdoRFppField1: TppField
      FieldAlias = 'DESCFUNDOINVEST'
      FieldName = 'DESCFUNDOINVEST'
      FieldLength = 60
      DisplayWidth = 28
      Position = 0
    end
    object pplSldComposicaoFdoRFppField2: TppField
      FieldAlias = 'DATAAPLICACAO'
      FieldName = 'DATAAPLICACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 10
      Position = 1
    end
    object pplSldComposicaoFdoRFppField3: TppField
      FieldAlias = 'DATAMOVFUNDO'
      FieldName = 'DATAMOVFUNDO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 12
      Position = 2
    end
    object pplSldComposicaoFdoRFppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOQTDCOTAS'
      FieldName = 'SALDOQTDCOTAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 20
      Position = 3
    end
    object pplSldComposicaoFdoRFppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCOTAATUAL'
      FieldName = 'VLRCOTAATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 4
    end
    object pplSldComposicaoFdoRFppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOVLRFUNDO'
      FieldName = 'SALDOVLRFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 19
      Position = 5
    end
    object pplSldComposicaoFdoRFppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIOFPROV'
      FieldName = 'VLRIOFPROV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 13
      Position = 6
    end
    object pplSldComposicaoFdoRFppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIRPROV'
      FieldName = 'VLRIRPROV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 14
      Position = 7
    end
    object pplSldComposicaoFdoRFppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOLIQUIDO'
      FieldName = 'SALDOLIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 20
      Position = 8
    end
    object pplSldComposicaoFdoRFppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDHISTFUNDO'
      FieldName = 'IDHISTFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplSldComposicaoFdoRFppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplSldComposicaoFdoRFppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplSldComposicaoFdoRFppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplSldComposicaoFdoRFppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOINVEST'
      FieldName = 'IDTIPOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplSldComposicaoFdoRFppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOOPERACAO'
      FieldName = 'IDTIPOOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplSldComposicaoFdoRFppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplSldComposicaoFdoRFppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFUNDOINVEST'
      FieldName = 'IDFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplSldComposicaoFdoRFppField18: TppField
      FieldAlias = 'HISTMOVFUNDO'
      FieldName = 'HISTMOVFUNDO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 17
    end
    object pplSldComposicaoFdoRFppField19: TppField
      FieldAlias = 'NATURMOVFUNDO'
      FieldName = 'NATURMOVFUNDO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 18
    end
    object pplSldComposicaoFdoRFppField20: TppField
      FieldAlias = 'TIPMOVFUNDO'
      FieldName = 'TIPMOVFUNDO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 19
    end
    object pplSldComposicaoFdoRFppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRAPLICADO'
      FieldName = 'VLRAPLICADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplSldComposicaoFdoRFppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRVARIACAO'
      FieldName = 'VLRVARIACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplSldComposicaoFdoRFppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'COTASMOVFUNDO'
      FieldName = 'COTASMOVFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplSldComposicaoFdoRFppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMOVFUNDO'
      FieldName = 'VLRMOVFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplSldComposicaoFdoRFppField25: TppField
      FieldAlias = 'FLGCALCSALDO'
      FieldName = 'FLGCALCSALDO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 24
    end
    object pplSldComposicaoFdoRFppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCOTAAPLICACAO'
      FieldName = 'VLRCOTAAPLICACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
  end
  object dsSldComposicaoFdoRF: TwwDataSource
    DataSet = qrySldComposicaoFdoRF
    Left = 113
    Top = 75
  end
  object qrySldComposicaoFdoRF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' FI.DESCFUNDOINVEST,'
      
        ' H1.IDHISTFUNDO       , H1.CODDOCUMENTO      , H1.PLNCODIGO     ' +
        '    , H1.PLANO             ,'
      
        ' H1.IDTIPOINVEST      , H1.IDTIPOOPERACAO    , H1.IDCARTEIRAINVE' +
        'ST  , H1.IDFUNDOINVEST     ,'
      
        ' H1.DATAAPLICACAO     , H1.DATAMOVFUNDO      , H1.HISTMOVFUNDO  ' +
        '    , H1.NATURMOVFUNDO     ,'
      
        ' H1.TIPMOVFUNDO       , H1.VLRAPLICADO       , NVL(H1.VLRIRPROV,' +
        '0) AS VLRIRPROV            ,'
      ' NVL(H1.VLRIOFPROV,0) AS VLRIOFPROV ,'
      
        ' H1.VLRVARIACAO       , H1.COTASMOVFUNDO     , H1.VLRMOVFUNDO   ' +
        '    , H1.FLGCALCSALDO      ,'
      
        ' H1.SALDOQTDCOTAS     , H1.SALDOVLRFUNDO     , H1.COTAAPLICACAO ' +
        '   AS VLRCOTAAPLICACAO     ,'
      ' CF.VLRCOTA AS VLRCOTAATUAL,'
      
        '(H1.SALDOVLRFUNDO-(NVL(H1.VLRIOFPROV,0)+NVL(H1.VLRIRPROV,0)))   ' +
        '   AS  SALDOLIQUIDO'
      ''
      'FROM HISTFUNDO H1, COTAFUNDO CF, FUNDOINVEST FI'
      ''
      'WHERE'
      ''
      '(H1.IDHISTFUNDO  IN ('
      ''
      '                SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      '                FROM'
      '                     HISTFUNDO HF, COMPOSICAOFUNDO CF'
      '                WHERE'
      
        '                         (HF.IDTIPOINVEST      = :IDTIPOINVEST) ' +
        '       AND'
      
        '                         (HF.IDPLANPREVCTBPATR = :IDPLANPREVCTBP' +
        'ATR)   AND'
      
        '                         (HF.DATAMOVFUNDO      = TO_DATE(:DATAMO' +
        'VFUNDO,'#39'DD/MM/YYYY'#39')) AND'
      
        '                        ((HF.DATAMOVFUNDO      < TO_DATE(:DATAMO' +
        'VFUNDO,'#39'DD/MM/YYYY'#39')) OR HF.IDHISTFUNDO < 999999999) AND'
      ''
      
        '                       (((:IDFUNDOINVEST IS NOT NULL) AND (CF.ID' +
        'FUNDOINVEST = :IDFUNDOINVEST)) OR'
      
        '                        ((:IDFUNDOINVEST IS NULL)     AND (CF.ID' +
        'FUNDOINVEST IS NOT NULL))) AND'
      ''
      
        '                       (((:IDFUNDOINVESTCOMP IS NOT NULL) AND (C' +
        'F.IDFUNDOINVESTCOMP= :IDFUNDOINVESTCOMP)) OR'
      
        '                        ((:IDFUNDOINVESTCOMP IS NULL)     AND (C' +
        'F.IDFUNDOINVESTCOMP IS NOT NULL))) AND'
      ''
      
        '                         (HF.IDFUNDOINVEST     = CF.IDFUNDOINVES' +
        'TCOMP)     AND'
      ''
      
        '                         (HF.IDCOMPOSICAOFUNDO = CF.IDCOMPOSICAO' +
        'FUNDO)'
      ''
      
        '                GROUP BY HF.IDTIPOINVEST, HF.IDPLANPREVCTBPATR, ' +
        'HF.IDFUNDOINVEST, HF.DATAAPLICACAO, HF.DATAMOVFUNDO'
      '                )) AND'
      ''
      '(H1.SALDOQTDCOTAS > 0)                                     AND'
      ''
      '(FI.IDFUNDOINVEST    = H1.IDFUNDOINVEST)                   AND'
      ''
      '(CF.IDFUNDOINVEST    = H1.IDFUNDOINVEST)                   AND'
      ''
      '(CF.DATACOTA         = H1.DATAMOVFUNDO)'
      ''
      'ORDER BY DESCFUNDOINVEST, DATAAPLICACAO')
    ValidateWithMask = True
    Left = 52
    Top = 75
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVESTCOMP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVESTCOMP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVESTCOMP'
        ParamType = ptInput
      end>
    object qrySldComposicaoFdoRFDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 28
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object qrySldComposicaoFdoRFDATAAPLICACAO: TDateTimeField
      DisplayLabel = 'Aplicação'
      DisplayWidth = 10
      FieldName = 'DATAAPLICACAO'
    end
    object qrySldComposicaoFdoRFDATAMOVFUNDO: TDateTimeField
      DisplayLabel = 'Data da Cota'
      DisplayWidth = 12
      FieldName = 'DATAMOVFUNDO'
    end
    object qrySldComposicaoFdoRFSALDOQTDCOTAS: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 20
      FieldName = 'SALDOQTDCOTAS'
      DisplayFormat = '###,#0.000000000'
    end
    object qrySldComposicaoFdoRFVLRCOTAATUAL: TFloatField
      DisplayLabel = 'Valor da Cota'
      DisplayWidth = 15
      FieldName = 'VLRCOTAATUAL'
      DisplayFormat = '###,#0.000000000'
    end
    object qrySldComposicaoFdoRFSALDOVLRFUNDO: TFloatField
      DisplayLabel = 'Valor Bruto'
      DisplayWidth = 19
      FieldName = 'SALDOVLRFUNDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qrySldComposicaoFdoRFVLRIOFPROV: TFloatField
      DisplayLabel = 'IOF'
      DisplayWidth = 13
      FieldName = 'VLRIOFPROV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qrySldComposicaoFdoRFVLRIRPROV: TFloatField
      DisplayLabel = 'IR'
      DisplayWidth = 14
      FieldName = 'VLRIRPROV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qrySldComposicaoFdoRFSALDOLIQUIDO: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 20
      FieldName = 'SALDOLIQUIDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qrySldComposicaoFdoRFIDHISTFUNDO: TFloatField
      FieldName = 'IDHISTFUNDO'
      Visible = False
    end
    object qrySldComposicaoFdoRFCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object qrySldComposicaoFdoRFPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qrySldComposicaoFdoRFPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object qrySldComposicaoFdoRFIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qrySldComposicaoFdoRFIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qrySldComposicaoFdoRFIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qrySldComposicaoFdoRFIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object qrySldComposicaoFdoRFHISTMOVFUNDO: TStringField
      FieldName = 'HISTMOVFUNDO'
      Visible = False
      Size = 60
    end
    object qrySldComposicaoFdoRFNATURMOVFUNDO: TStringField
      FieldName = 'NATURMOVFUNDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qrySldComposicaoFdoRFTIPMOVFUNDO: TStringField
      FieldName = 'TIPMOVFUNDO'
      Visible = False
      Size = 3
    end
    object qrySldComposicaoFdoRFVLRAPLICADO: TFloatField
      FieldName = 'VLRAPLICADO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object qrySldComposicaoFdoRFVLRVARIACAO: TFloatField
      FieldName = 'VLRVARIACAO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object qrySldComposicaoFdoRFCOTASMOVFUNDO: TFloatField
      FieldName = 'COTASMOVFUNDO'
      Visible = False
    end
    object qrySldComposicaoFdoRFVLRMOVFUNDO: TFloatField
      FieldName = 'VLRMOVFUNDO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object qrySldComposicaoFdoRFFLGCALCSALDO: TStringField
      FieldName = 'FLGCALCSALDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qrySldComposicaoFdoRFVLRCOTAAPLICACAO: TFloatField
      FieldName = 'VLRCOTAAPLICACAO'
      Visible = False
      DisplayFormat = '###,#0.000000000'
    end
  end
  object rpSldComposicaoFdoRF: TppReport
    AutoStop = False
    DataPipeline = pplSldComposicaoFdoRF
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
    BeforePrint = rpSldComposicaoFdoRFBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 236
    Top = 75
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplSldComposicaoFdoRF'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30427
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'RpConsCartRendVarShape1'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 5556
        mmLeft = 0
        mmTop = 24871
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Saldo da Composicão de Fundo de Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 81492
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
        mmHeight = 5027
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
        mmLeft = 272257
        mmTop = 12171
        mmWidth = 11906
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
      object lblPeriodoRef: TppLabel
        UserName = 'LPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
        Caption = 'Fundo de Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2910
        mmTop = 26194
        mmWidth = 30956
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label2'
        Caption = 'Aplicação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 91017
        mmTop = 26194
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label3'
        Caption = 'Data da Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 107421
        mmTop = 26194
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label4'
        Caption = 'Quantidade de Cotas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 130440
        mmTop = 26194
        mmWidth = 28310
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label5'
        Caption = 'Valor da Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 170657
        mmTop = 26194
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label6'
        Caption = 'Valor Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 201613
        mmTop = 26194
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label7'
        Caption = 'IOF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 230982
        mmTop = 26194
        mmWidth = 4763
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label8'
        Caption = 'IR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 252148
        mmTop = 26194
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label9'
        Caption = 'Valor Líquido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 264848
        mmTop = 26194
        mmWidth = 18256
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        Brush.Color = 14935011
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 5292
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DESCFUNDOINVEST'
        DataPipeline = pplSldComposicaoFdoRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'pplSldComposicaoFdoRF'
        mmHeight = 3440
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 86254
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DATAAPLICACAO'
        DataPipeline = pplSldComposicaoFdoRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSldComposicaoFdoRF'
        mmHeight = 3440
        mmLeft = 91017
        mmTop = 1058
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DATAMOVFUNDO'
        DataPipeline = pplSldComposicaoFdoRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSldComposicaoFdoRF'
        mmHeight = 3175
        mmLeft = 107421
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'SALDOQTDCOTAS'
        DataPipeline = pplSldComposicaoFdoRF
        DisplayFormat = '###,#0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldComposicaoFdoRF'
        mmHeight = 3175
        mmLeft = 125413
        mmTop = 1058
        mmWidth = 33338
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VLRCOTAATUAL'
        DataPipeline = pplSldComposicaoFdoRF
        DisplayFormat = '###,#0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldComposicaoFdoRF'
        mmHeight = 3175
        mmLeft = 159809
        mmTop = 1058
        mmWidth = 29104
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'VLRMOVFUNDO'
        DataPipeline = pplSldComposicaoFdoRF
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldComposicaoFdoRF'
        mmHeight = 3175
        mmLeft = 190765
        mmTop = 1058
        mmWidth = 26194
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VLRIOFPROV'
        DataPipeline = pplSldComposicaoFdoRF
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldComposicaoFdoRF'
        mmHeight = 3175
        mmLeft = 217753
        mmTop = 1058
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VLRIRPROV'
        DataPipeline = pplSldComposicaoFdoRF
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldComposicaoFdoRF'
        mmHeight = 3175
        mmLeft = 236538
        mmTop = 1058
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'SALDOLIQUIDO'
        DataPipeline = pplSldComposicaoFdoRF
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldComposicaoFdoRF'
        mmHeight = 3175
        mmLeft = 256117
        mmTop = 1058
        mmWidth = 26988
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
        mmWidth = 284300
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
        mmWidth = 284163
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
        mmLeft = 257969
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 4763
        mmWidth = 284300
        BandType = 7
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 5556
        mmWidth = 284300
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'VLRMOVFUNDO'
        DataPipeline = pplSldComposicaoFdoRF
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldComposicaoFdoRF'
        mmHeight = 3440
        mmLeft = 181769
        mmTop = 6615
        mmWidth = 35190
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'VLRIOFPROV'
        DataPipeline = pplSldComposicaoFdoRF
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldComposicaoFdoRF'
        mmHeight = 3440
        mmLeft = 217753
        mmTop = 6615
        mmWidth = 17992
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'VLRIRPROV'
        DataPipeline = pplSldComposicaoFdoRF
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldComposicaoFdoRF'
        mmHeight = 3440
        mmLeft = 236538
        mmTop = 6615
        mmWidth = 18521
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc9'
        DataField = 'SALDOLIQUIDO'
        DataPipeline = pplSldComposicaoFdoRF
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldComposicaoFdoRF'
        mmHeight = 3440
        mmLeft = 255588
        mmTop = 6615
        mmWidth = 27517
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCFUNDOINVEST'
      DataPipeline = pplSldComposicaoFdoRF
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplSldComposicaoFdoRF'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 794
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        AfterPrint = ppGroupFooterBand1AfterPrint
        BeforePrint = ppGroupFooterBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 120121
          mmTop = 0
          mmWidth = 164307
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'SALDOQTDCOTAS'
          DataPipeline = pplSldComposicaoFdoRF
          DisplayFormat = '###,#0.000000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          DataPipelineName = 'pplSldComposicaoFdoRF'
          mmHeight = 3440
          mmLeft = 125677
          mmTop = 1323
          mmWidth = 33073
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VLRMOVFUNDO'
          DataPipeline = pplSldComposicaoFdoRF
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          DataPipelineName = 'pplSldComposicaoFdoRF'
          mmHeight = 3440
          mmLeft = 189971
          mmTop = 1323
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'VLRIOFPROV'
          DataPipeline = pplSldComposicaoFdoRF
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          DataPipelineName = 'pplSldComposicaoFdoRF'
          mmHeight = 3440
          mmLeft = 217488
          mmTop = 1323
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'VLRIRPROV'
          DataPipeline = pplSldComposicaoFdoRF
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          DataPipelineName = 'pplSldComposicaoFdoRF'
          mmHeight = 3440
          mmLeft = 236538
          mmTop = 1323
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'SALDOLIQUIDO'
          DataPipeline = pplSldComposicaoFdoRF
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          DataPipelineName = 'pplSldComposicaoFdoRF'
          mmHeight = 3440
          mmLeft = 255853
          mmTop = 1323
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 120121
          mmTop = 794
          mmWidth = 164307
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
