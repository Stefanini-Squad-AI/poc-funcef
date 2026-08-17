inherited DmRelAnuncPeriodo: TDmRelAnuncPeriodo
  Left = 691
  Top = 175
  Width = 280
  Height = 328
  Caption = 'DmRelAnuncPeriodo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 182
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
    Left = 183
    Top = 8
  end
  inherited qryExemplo: TwwQuery
    Left = 183
    Top = 8
  end
  inherited rpExemplo: TppReport
    Left = 208
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object qryTipoAnuncio: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOOPERACAO, DESCTIPOOPERACAO'
      'FROM TIPOOPERACAO'
      'WHERE IDTIPOOPERACAO IN (-70,-71,-10070,-10071)'
      'ORDER BY DESCTIPOOPERACAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 209
    Top = 104
    object qryTipoAnuncioDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoAnuncioIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
  end
  object qryInvestimento: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDINVESTIMENTO, DESCINVESTIMENTO'
      'FROM INVESTIMENTO'
      'WHERE IDTIPOINVEST = 2'
      'ORDER BY DESCINVESTIMENTO'
      ' ')
    ValidateWithMask = True
    Left = 207
    Top = 56
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
  end
  object qryAnuncPeriodo: TwwQuery
    DatabaseName = 'BaseDados'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT'
      '   PP.PLANPRVCONTABPATRO,'
      '   OI.IDOPERACAOINVEST, OD.IDOPERACAODIREITO,'
      '   OD.IDTIPOOPERACAO,'
      '   TP1.DESCTIPOOPERACAO,'
      '   (OI.IDTIPOOPERACAO) AS TIPOANUNCIO,'
      '   (TP.DESCTIPOOPERACAO) AS DESCANUNCIO,'
      '   OI.DATAOPERACAO, OI.NUMDOCUMENTO AS BOLETA,'
      '   OI.PRECOUNITOPERACAO,'
      '   OI.VLRREMUNERACAO,'
      '   OI.VLROPERACAO, '
      '   IV.DESCINVESTIMENTO,'
      '   NVL(OI.QTDEOPERACAO,0) AS QTDEOPERACAO,'
      '   OD.DATAAGE,'
      '   OD.DATAEX,'
      '   OD.DATACOM,'
      '   OD.DATAOPER,'
      '   CI.DESCCARTINVEST,'
      '   SM.DESCSEGMENTACAO,'
      '   SM.IDSEGMENTACAO,'
      '   OI.VLRREMUNERACAO+ OI.VLROPERACAO as VLRRCBER'
      'FROM'
      
        '   OPERACAOINVEST OI, PARAMINVEST PI, TIPOOPERACAO TP, TIPOOPERA' +
        'CAO TP1, INVESTIMENTO IV,'
      
        '   OPERACAODIREITO OD, CARTEIRAINVEST CI, VWPLANPREVCTBPATR PP, ' +
        'EMISSOR EM, SEGMENTACAOMERCADO SM'
      'WHERE (OI.IDCARTEIRAGERENC IS NULL)'
      
        '  AND (DECODE(:TIPODATA, 0, OD.DATAOPER, OD.DATAAGE) >= TO_DATE(' +
        ':DATAINI,'#39'DD/MM/YYYY'#39'))'
      
        '  AND (DECODE(:TIPODATA, 0, OD.DATAOPER, OD.DATAAGE) <= TO_DATE(' +
        ':DATAFIM,'#39'DD/MM/YYYY'#39'))'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OI.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      
        '  AND (((:IDTIPOANUNCIO IS NULL) OR (OI.IDTIPOOPERACAO = :IDTIPO' +
        'ANUNCIO)) AND (OI.IDTIPOOPERACAO IN (-70, -71,-10070,-10071)))'
      
        '  AND ((:IDINVESTIMENTO IS NULL) OR (OI.IDINVESTIMENTO = :IDINVE' +
        'STIMENTO))'
      
        '  AND ((:IDTIPOOPERACAO IS NULL) OR (OD.IDTIPOOPERACAO = :IDTIPO' +
        'OPERACAO))'
      
        '  AND ((:IDSEGMENTACAO IS NULL) OR (SM.IDSEGMENTACAO = :IDSEGMEN' +
        'TACAO)) '
      '  AND OI.IDTIPOOPERACAO = TP.IDTIPOOPERACAO'
      '  AND OD.IDTIPOOPERACAO = TP1.IDTIPOOPERACAO'
      '  AND OI.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND OI.IDOPERACAODIREITO = OD.IDOPERACAODIREITO'
      '  AND OI.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '  AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      '  AND IV.IDEMISSOR = EM.IDEMISSOR'
      '  AND EM.IDSEGMENTACAO = SM.IDSEGMENTACAO'
      
        'ORDER BY PP.PLANPRVCONTABPATRO, SM.IDSEGMENTACAO, OD.DATAOPER, O' +
        'I.NUMDOCUMENTO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 38
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TIPODATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPODATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOANUNCIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOANUNCIO'
        ParamType = ptUnknown
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
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDSEGMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDSEGMENTACAO'
        ParamType = ptUnknown
      end>
    object qryAnuncPeriodoPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 32
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryAnuncPeriodoDATAOPER: TDateTimeField
      DisplayLabel = 'Data EX'
      DisplayWidth = 11
      FieldName = 'DATAOPER'
    end
    object qryAnuncPeriodoDATACOM: TDateTimeField
      DisplayLabel = 'Data Prevista'
      DisplayWidth = 11
      FieldName = 'DATACOM'
    end
    object qryAnuncPeriodoDATAEX: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 11
      FieldName = 'DATAEX'
    end
    object qryAnuncPeriodoDATAAGE: TDateTimeField
      DisplayLabel = 'Data AGE'
      DisplayWidth = 11
      FieldName = 'DATAAGE'
    end
    object qryAnuncPeriodoDESCANUNCIO: TStringField
      DisplayLabel = 'Tipo de Anúncio'
      DisplayWidth = 37
      FieldName = 'DESCANUNCIO'
      Size = 60
    end
    object qryAnuncPeriodoBOLETA: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 14
      FieldName = 'BOLETA'
      Size = 30
    end
    object qryAnuncPeriodoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 29
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryAnuncPeriodoQTDEOPERACAO: TFloatField
      DisplayLabel = 'Qtd. Prevista'
      DisplayWidth = 14
      FieldName = 'QTDEOPERACAO'
      DisplayFormat = '###,###,###,###,###,##0'
    end
    object qryAnuncPeriodoPRECOUNITOPERACAO: TFloatField
      DisplayLabel = 'Preço Unitário'
      DisplayWidth = 14
      FieldName = 'PRECOUNITOPERACAO'
      DisplayFormat = '###,###,###,###,###,##0.00000000'
    end
    object qryAnuncPeriodoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 31
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryAnuncPeriodoVLRREMUNERACAO: TFloatField
      DisplayLabel = 'Remuneração'
      DisplayWidth = 16
      FieldName = 'VLRREMUNERACAO'
      DisplayFormat = '###,###,###,###,###,##0.00'
    end
    object qryAnuncPeriodoVLROPERACAO: TFloatField
      DisplayLabel = 'Valor do Anúncio'
      DisplayWidth = 14
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,###,###,##0.00'
    end
    object qryAnuncPeriodoVLRRCBER: TFloatField
      DisplayLabel = 'Valor a Receber'
      DisplayWidth = 14
      FieldName = 'VLRRCBER'
      DisplayFormat = '###,###,###,###,###,##0.00'
    end
    object qryAnuncPeriodoDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 37
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryAnuncPeriodoDESCSEGMENTACAO: TStringField
      DisplayWidth = 100
      FieldName = 'DESCSEGMENTACAO'
      Visible = False
      Size = 100
    end
    object qryAnuncPeriodoIDSEGMENTACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSEGMENTACAO'
      Visible = False
    end
    object qryAnuncPeriodoTIPOANUNCIO: TFloatField
      DisplayLabel = 'Tipo de Anúncio'
      DisplayWidth = 29
      FieldName = 'TIPOANUNCIO'
      Visible = False
    end
    object qryAnuncPeriodoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
    object qryAnuncPeriodoIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object qryAnuncPeriodoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryAnuncPeriodoDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Visible = False
    end
  end
  object dsAnuncPeriodo: TwwDataSource
    AutoEdit = False
    DataSet = qryAnuncPeriodo
    Left = 39
    Top = 112
  end
  object pplAnuncPeriodo: TppBDEPipeline
    DataSource = dsAnuncPeriodo
    UserName = 'lAnuncPeriodo'
    Left = 37
    Top = 64
  end
  object rptAnuncPeriodo: TppReport
    AutoStop = False
    DataPipeline = pplAnuncPeriodo
    OnStartPage = rptAnuncPeriodoStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Anúncios de Proventos no Período'
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
    Left = 34
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplAnuncPeriodo'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26988
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Anúncio de Proventos no Período'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 57679
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
      object shpCabecalho: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 7144
        mmLeft = 0
        mmTop = 19844
        mmWidth = 284300
        BandType = 0
      end
      object lblAnuncio: TppLabel
        UserName = 'Label1'
        Caption = 'Anúncio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 57679
        mmTop = 23548
        mmWidth = 9790
        BandType = 0
      end
      object lblBoleta: TppLabel
        UserName = 'Label2'
        Caption = 'Boleta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 171450
        mmTop = 23548
        mmWidth = 7408
        BandType = 0
      end
      object lblDataEx: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Data EX'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 2910
        mmTop = 20373
        mmWidth = 7938
        BandType = 0
      end
      object lblDataCom: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Data Prevista'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 6085
        mmLeft = 14552
        mmTop = 20373
        mmWidth = 12171
        BandType = 0
      end
      object lblDataBase: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Data Base'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 28575
        mmTop = 20638
        mmWidth = 8731
        BandType = 0
      end
      object lblDesInvestim: TppLabel
        UserName = 'Label6'
        Caption = 'Investimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 135202
        mmTop = 23548
        mmWidth = 15081
        BandType = 0
      end
      object lblQuantidade: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 187061
        mmTop = 23548
        mmWidth = 15610
        BandType = 0
      end
      object lblPU: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Preço Unitário'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 207698
        mmTop = 20638
        mmWidth = 12965
        BandType = 0
      end
      object lblVlr: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Valor do Anúncio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 249767
        mmTop = 20638
        mmWidth = 12700
        BandType = 0
      end
      object lblTipoOper: TppLabel
        UserName = 'Label8'
        Caption = 'Tipo de Operação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 99748
        mmTop = 23548
        mmWidth = 21167
        BandType = 0
      end
      object lblDataAge: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Data AGE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 42598
        mmTop = 20638
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label14'
        Caption = 'Remuneração'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 227542
        mmTop = 23548
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Valor a Receber'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 270669
        mmTop = 20638
        mmWidth = 12700
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 7144
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppdbTipoAnuncio: TppDBText
        UserName = 'dbTipoAnuncio'
        DataField = 'DESCANUNCIO'
        DataPipeline = pplAnuncPeriodo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodo'
        mmHeight = 2910
        mmLeft = 57679
        mmTop = 794
        mmWidth = 41275
        BandType = 4
      end
      object ppdbBoleta: TppDBText
        UserName = 'dbBoleta'
        DataField = 'BOLETA'
        DataPipeline = pplAnuncPeriodo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodo'
        mmHeight = 2910
        mmLeft = 171450
        mmTop = 794
        mmWidth = 13758
        BandType = 4
      end
      object ppdbDataEx: TppDBText
        UserName = 'dbDataEx'
        DataField = 'DATAOPER'
        DataPipeline = pplAnuncPeriodo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodo'
        mmHeight = 2910
        mmLeft = 794
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object ppdbDataCom: TppDBText
        UserName = 'dbDataCom'
        DataField = 'DATACOM'
        DataPipeline = pplAnuncPeriodo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodo'
        mmHeight = 2910
        mmLeft = 14552
        mmTop = 794
        mmWidth = 13229
        BandType = 4
      end
      object ppdbDataBase: TppDBText
        UserName = 'dbDataBase'
        DataField = 'DATAEX'
        DataPipeline = pplAnuncPeriodo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodo'
        mmHeight = 2910
        mmLeft = 28575
        mmTop = 794
        mmWidth = 13229
        BandType = 4
      end
      object ppdbDescInvestim: TppDBText
        UserName = 'dbDescInvestim'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = pplAnuncPeriodo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodo'
        mmHeight = 2910
        mmLeft = 135202
        mmTop = 794
        mmWidth = 35454
        BandType = 4
      end
      object ppdbQtd: TppDBText
        UserName = 'dbQtd'
        DataField = 'QTDEOPERACAO'
        DataPipeline = pplAnuncPeriodo
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodo'
        mmHeight = 2910
        mmLeft = 186002
        mmTop = 794
        mmWidth = 16404
        BandType = 4
      end
      object ppdbVlrARec: TppDBText
        UserName = 'dbVlrARec'
        DataField = 'VLROPERACAO'
        DataPipeline = pplAnuncPeriodo
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodo'
        mmHeight = 2910
        mmLeft = 244211
        mmTop = 794
        mmWidth = 18256
        BandType = 4
      end
      object ppdbPU: TppDBText
        UserName = 'DBText101'
        DataField = 'PRECOUNITOPERACAO'
        DataPipeline = pplAnuncPeriodo
        DisplayFormat = '###,###,##0.000000000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodo'
        mmHeight = 2910
        mmLeft = 204788
        mmTop = 794
        mmWidth = 15610
        BandType = 4
      end
      object dddbTipoOper: TppDBText
        UserName = 'dddbTipoOper'
        DataField = 'DESCTIPOOPERACAO'
        DataPipeline = pplAnuncPeriodo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodo'
        mmHeight = 2910
        mmLeft = 99748
        mmTop = 794
        mmWidth = 33867
        BandType = 4
      end
      object ppdbDataAGE: TppDBText
        UserName = 'dbDataEx1'
        DataField = 'DATAAGE'
        DataPipeline = pplAnuncPeriodo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodo'
        mmHeight = 2910
        mmLeft = 42598
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText1'
        DataField = 'VLRREMUNERACAO'
        DataPipeline = pplAnuncPeriodo
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodo'
        mmHeight = 2910
        mmLeft = 221192
        mmTop = 794
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText2'
        DataField = 'VLRRCBER'
        DataPipeline = pplAnuncPeriodo
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodo'
        mmHeight = 2910
        mmLeft = 264319
        mmTop = 794
        mmWidth = 19315
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
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
        mmWidth = 282576
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
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
        mmLeft = 254001
        mmTop = 1323
        mmWidth = 28840
        BandType = 8
      end
      object ppLabel5: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema1'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 1058
        mmWidth = 86784
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 9261
      mmPrintPosition = 0
      object ppShape8: TppShape
        UserName = 'Shape8'
        Brush.Color = clSilver
        mmHeight = 5291
        mmLeft = 0
        mmTop = 1588
        mmWidth = 284428
        BandType = 7
      end
      object lblTotais: TppLabel
        UserName = 'Label12'
        Caption = 'Total Geral:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 175948
        mmTop = 2646
        mmWidth = 15875
        BandType = 7
      end
      object dbtTovVlrOper: TppDBCalc
        UserName = 'dbtTovVlrOper'
        DataField = 'VLROPERACAO'
        DataPipeline = pplAnuncPeriodo
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodo'
        mmHeight = 2910
        mmLeft = 244740
        mmTop = 2117
        mmWidth = 18521
        BandType = 7
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'VLRREMUNERACAO'
        DataPipeline = pplAnuncPeriodo
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodo'
        mmHeight = 2910
        mmLeft = 220134
        mmTop = 2117
        mmWidth = 23813
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        DataField = 'VLRRCBER'
        DataPipeline = pplAnuncPeriodo
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodo'
        mmHeight = 2910
        mmLeft = 265907
        mmTop = 1852
        mmWidth = 17198
        BandType = 7
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = pplAnuncPeriodo
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAnuncPeriodo'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'shpCabecalho1'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'dbTipoAnuncio1'
          DataField = 'PLANPRVCONTABPATRO'
          DataPipeline = pplAnuncPeriodo
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplAnuncPeriodo'
          mmHeight = 2910
          mmLeft = 14552
          mmTop = 794
          mmWidth = 76994
          BandType = 3
          GroupNo = 0
        end
        object ppLabel25: TppLabel
          UserName = 'Label25'
          Caption = 'Plano :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 2910
          mmTop = 794
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCSEGMENTACAO'
      DataPipeline = pplAnuncPeriodo
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAnuncPeriodo'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppShape11: TppShape
          UserName = 'Shape11'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppDBText20: TppDBText
          UserName = 'DBText20'
          DataField = 'DESCSEGMENTACAO'
          DataPipeline = pplAnuncPeriodo
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplAnuncPeriodo'
          mmHeight = 2910
          mmLeft = 21696
          mmTop = 529
          mmWidth = 76994
          BandType = 3
          GroupNo = 1
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = 'Segmentação :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2921
          mmLeft = 2910
          mmTop = 529
          mmWidth = 17399
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = pplAnuncPeriodo
      KeepTogether = True
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAnuncPeriodo'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppDBText17: TppDBText
          UserName = 'dddbDescCateira1'
          DataField = 'DESCCARTINVEST'
          DataPipeline = pplAnuncPeriodo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplAnuncPeriodo'
          mmHeight = 2921
          mmLeft = 14552
          mmTop = 1323
          mmWidth = 76994
          BandType = 3
          GroupNo = 1
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 4234
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = 'Carteira :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2921
          mmLeft = 2910
          mmTop = 1323
          mmWidth = 10795
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryTipoOperacao: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOOPERACAO, DESCTIPOOPERACAO'
      'FROM TIPOOPERACAO'
      'WHERE IDTIPOINVEST = 2'
      'AND IDTIPOOPERACAO NOT IN (-70,-71,-10070,-10071)'
      'AND NATUREZAOPERACAO='#39'R'#39
      ' '
      ' ')
    ValidateWithMask = True
    Left = 209
    Top = 152
    object qryTipoOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryTipoOperacaoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
  end
  object qryPlanoPrev: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM VWPLANPREVCTBPATR ')
    ValidateWithMask = True
    Left = 211
    Top = 198
    object qryPlanoPrevPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'PLANPRVCONTABPATRO'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".IDPLANPREVCTBPATR'
      Size = 113
    end
    object qryPlanoPrevPLANOCONTABIL: TStringField
      DisplayWidth = 50
      FieldName = 'PLANOCONTABIL'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".IDPLANOPREV'
      Visible = False
      Size = 50
    end
    object qryPlanoPrevPATROCINADORA: TStringField
      DisplayWidth = 60
      FieldName = 'PATROCINADORA'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".IDPATRO'
      Visible = False
      Size = 60
    end
    object qryPlanoPrevIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".PLANPRVCONTABPATRO'
      Visible = False
    end
    object qryPlanoPrevIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".PLANPRVCONTABPATRO'
      Visible = False
    end
    object qryPlanoPrevIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".PLANPRVCONTABPATRO'
      Visible = False
    end
  end
  object rptAnuncPeriodoCon: TppReport
    AutoStop = False
    DataPipeline = pplAnuncPeriodoCon
    OnStartPage = rptAnuncPeriodoStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Anúncios de Proventos no Período - Consolidado por Investimento'
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
    Left = 130
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplAnuncPeriodoCon'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27252
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        UserName = 'Label11'
        Caption = 'Anúncio de Proventos no Período - Consolidado por Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 110490
        BandType = 0
      end
      object ppLabel4: TppLabel
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
      object ppDBImage2: TppDBImage
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
      object lblPeriodoCon: TppLabel
        UserName = 'LblPeriodoCon'
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
      object ppShape2: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 7144
        mmLeft = 0
        mmTop = 20108
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label2'
        Caption = 'Boleta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 167217
        mmTop = 23813
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Data EX'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 10583
        mmTop = 20902
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Data Prevista'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 6085
        mmLeft = 24342
        mmTop = 20638
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Data Base'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 38365
        mmTop = 20902
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 184415
        mmTop = 23813
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Preço Unitário'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 204788
        mmTop = 20902
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Valor do Anúncio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 250296
        mmTop = 20902
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label8'
        Caption = 'Plano/Patrocinadora'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 66675
        mmTop = 23813
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Data AGE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 52388
        mmTop = 20902
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'lblDesCarteira'
        Caption = 'Carteira de Investimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 119856
        mmTop = 23813
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label102'
        AutoSize = False
        Caption = 'Valor a Receber'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 270405
        mmTop = 20902
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Caption = 'Remuneração'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 225161
        mmTop = 23813
        mmWidth = 16933
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'dbBoleta'
        DataField = 'BOLETA'
        DataPipeline = pplAnuncPeriodoCon
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodoCon'
        mmHeight = 2910
        mmLeft = 167217
        mmTop = 794
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'dbDataEx'
        DataField = 'DATAOPER'
        DataPipeline = pplAnuncPeriodoCon
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodoCon'
        mmHeight = 2910
        mmLeft = 10583
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'dbDataCom'
        DataField = 'DATACOM'
        DataPipeline = pplAnuncPeriodoCon
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodoCon'
        mmHeight = 2910
        mmLeft = 24342
        mmTop = 794
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'dbDataBase'
        DataField = 'DATAEX'
        DataPipeline = pplAnuncPeriodoCon
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodoCon'
        mmHeight = 2910
        mmLeft = 38365
        mmTop = 794
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'dbQtd'
        DataField = 'QTDEOPERACAO'
        DataPipeline = pplAnuncPeriodoCon
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodoCon'
        mmHeight = 2910
        mmLeft = 181240
        mmTop = 794
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'dbVlrARec'
        DataField = 'VLROPERACAO'
        DataPipeline = pplAnuncPeriodoCon
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodoCon'
        mmHeight = 2910
        mmLeft = 241300
        mmTop = 794
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText101'
        DataField = 'PRECOUNITOPERACAO'
        DataPipeline = pplAnuncPeriodoCon
        DisplayFormat = '###,###,##0.000000000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodoCon'
        mmHeight = 2910
        mmLeft = 199761
        mmTop = 794
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'dbDataEx1'
        DataField = 'DATAAGE'
        DataPipeline = pplAnuncPeriodoCon
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodoCon'
        mmHeight = 2910
        mmLeft = 52388
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'dbTipoAnuncio1'
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = pplAnuncPeriodoCon
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodoCon'
        mmHeight = 2910
        mmLeft = 66675
        mmTop = 794
        mmWidth = 52652
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'dddbDescCateira'
        DataField = 'DESCCARTINVEST'
        DataPipeline = pplAnuncPeriodoCon
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodoCon'
        mmHeight = 2910
        mmLeft = 119856
        mmTop = 794
        mmWidth = 46038
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'VLRRCBER'
        DataPipeline = pplAnuncPeriodoCon
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodoCon'
        mmHeight = 2910
        mmLeft = 263526
        mmTop = 794
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'VLRREMUNERACAO'
        DataPipeline = pplAnuncPeriodoCon
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodoCon'
        mmHeight = 2910
        mmLeft = 218282
        mmTop = 794
        mmWidth = 22490
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLabel19: TppLabel
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
        mmLeft = 1323
        mmTop = 1852
        mmWidth = 86784
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
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
        mmLeft = 253207
        mmTop = 2117
        mmWidth = 28840
        BandType = 8
      end
      object ppLine1: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
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
        mmTop = 2117
        mmWidth = 282576
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8731
      mmPrintPosition = 0
      object ppShape7: TppShape
        UserName = 'Shape7'
        Brush.Color = clSilver
        mmHeight = 5291
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284692
        BandType = 7
      end
      object ppLabel20: TppLabel
        UserName = 'Label12'
        Caption = 'Total Geral:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 196321
        mmTop = 2910
        mmWidth = 16933
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'dbtTovVlrOper'
        DataField = 'VLROPERACAO'
        DataPipeline = pplAnuncPeriodoCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodoCon'
        mmHeight = 3440
        mmLeft = 241565
        mmTop = 2910
        mmWidth = 21960
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc9'
        DataField = 'VLRREMUNERACAO'
        DataPipeline = pplAnuncPeriodoCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodoCon'
        mmHeight = 3440
        mmLeft = 216165
        mmTop = 2910
        mmWidth = 25135
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc14'
        DataField = 'VLRRCBER'
        DataPipeline = pplAnuncPeriodoCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnuncPeriodoCon'
        mmHeight = 3440
        mmLeft = 264848
        mmTop = 2910
        mmWidth = 19315
        BandType = 7
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'DESCSEGMENTACAO'
      DataPipeline = pplAnuncPeriodoCon
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAnuncPeriodoCon'
      object ppGroupHeaderBand7: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppShape12: TppShape
          UserName = 'Shape12'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 4498
          mmLeft = 0
          mmTop = 265
          mmWidth = 284692
          BandType = 3
          GroupNo = 0
        end
        object ppLabel29: TppLabel
          UserName = 'Label29'
          Caption = 'Segmentação :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2921
          mmLeft = 1323
          mmTop = 1058
          mmWidth = 17399
          BandType = 3
          GroupNo = 0
        end
        object ppDBText21: TppDBText
          UserName = 'dddbTipoOper1'
          DataField = 'DESCSEGMENTACAO'
          DataPipeline = pplAnuncPeriodoCon
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplAnuncPeriodoCon'
          mmHeight = 2910
          mmLeft = 19579
          mmTop = 1058
          mmWidth = 102129
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppShape13: TppShape
          UserName = 'Shape13'
          Brush.Color = clSilver
          mmHeight = 4498
          mmLeft = 0
          mmTop = 265
          mmWidth = 284428
          BandType = 5
          GroupNo = 0
        end
        object ppLabel30: TppLabel
          UserName = 'Label30'
          Caption = 'Total da Segmentação de Mercado:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 172244
          mmTop = 1058
          mmWidth = 41010
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'DBCalc16'
          DataField = 'VLRREMUNERACAO'
          DataPipeline = pplAnuncPeriodoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnuncPeriodoCon'
          mmHeight = 2910
          mmLeft = 220398
          mmTop = 1058
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'VLROPERACAO'
          DataPipeline = pplAnuncPeriodoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnuncPeriodoCon'
          mmHeight = 2910
          mmLeft = 241830
          mmTop = 1058
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'DBCalc17'
          DataField = 'VLRRCBER'
          DataPipeline = pplAnuncPeriodoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnuncPeriodoCon'
          mmHeight = 2910
          mmLeft = 264055
          mmTop = 1058
          mmWidth = 19844
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'DESCINVESTIMENTO'
      DataPipeline = pplAnuncPeriodoCon
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAnuncPeriodoCon'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppShape4: TppShape
          UserName = 'Shape1'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 284428
          BandType = 3
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'dbDescInvestim'
          DataField = 'DESCINVESTIMENTO'
          DataPipeline = pplAnuncPeriodoCon
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplAnuncPeriodoCon'
          mmHeight = 2910
          mmLeft = 1323
          mmTop = 1058
          mmWidth = 97631
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppShape9: TppShape
          UserName = 'Shape9'
          Brush.Color = clSilver
          mmHeight = 4498
          mmLeft = 0
          mmTop = 0
          mmWidth = 284428
          BandType = 5
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label6'
          Caption = 'Total do Investimento:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 186267
          mmTop = 1058
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VLROPERACAO'
          DataPipeline = pplAnuncPeriodoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnuncPeriodoCon'
          mmHeight = 2910
          mmLeft = 241830
          mmTop = 794
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'VLRREMUNERACAO'
          DataPipeline = pplAnuncPeriodoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnuncPeriodoCon'
          mmHeight = 2910
          mmLeft = 220398
          mmTop = 794
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc13'
          DataField = 'VLRRCBER'
          DataPipeline = pplAnuncPeriodoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnuncPeriodoCon'
          mmHeight = 2910
          mmLeft = 264055
          mmTop = 794
          mmWidth = 19844
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DESCTIPOOPERACAO'
      DataPipeline = pplAnuncPeriodoCon
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAnuncPeriodoCon'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppShape5: TppShape
          UserName = 'Shape5'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 4498
          mmLeft = 0
          mmTop = 0
          mmWidth = 284692
          BandType = 3
          GroupNo = 1
        end
        object ppLabel21: TppLabel
          UserName = 'Label14'
          Caption = 'Operação:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 3969
          mmTop = 794
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object ppDBText12: TppDBText
          UserName = 'dddbTipoOper'
          DataField = 'DESCTIPOOPERACAO'
          DataPipeline = pplAnuncPeriodoCon
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplAnuncPeriodoCon'
          mmHeight = 2910
          mmLeft = 16933
          mmTop = 794
          mmWidth = 102129
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLabel22: TppLabel
          UserName = 'Label22'
          Caption = 'Total da Operação:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 189971
          mmTop = 1323
          mmWidth = 20902
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VLROPERACAO'
          DataPipeline = pplAnuncPeriodoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnuncPeriodoCon'
          mmHeight = 2910
          mmLeft = 242094
          mmTop = 1588
          mmWidth = 20902
          BandType = 5
          GroupNo = 1
        end
        object ppShape10: TppShape
          UserName = 'Shape2'
          mmHeight = 794
          mmLeft = 192088
          mmTop = 265
          mmWidth = 91811
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'VLRREMUNERACAO'
          DataPipeline = pplAnuncPeriodoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnuncPeriodoCon'
          mmHeight = 2910
          mmLeft = 220398
          mmTop = 1588
          mmWidth = 20638
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'VLRRCBER'
          DataPipeline = pplAnuncPeriodoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnuncPeriodoCon'
          mmHeight = 2910
          mmLeft = 264055
          mmTop = 1588
          mmWidth = 20108
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'DESCANUNCIO'
      DataPipeline = pplAnuncPeriodoCon
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAnuncPeriodoCon'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppShape6: TppShape
          UserName = 'Shape6'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 3969
          mmLeft = 0
          mmTop = 0
          mmWidth = 284692
          BandType = 3
          GroupNo = 2
        end
        object ppDBText2: TppDBText
          UserName = 'dbTipoAnuncio'
          DataField = 'DESCANUNCIO'
          DataPipeline = pplAnuncPeriodoCon
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplAnuncPeriodoCon'
          mmHeight = 2910
          mmLeft = 10583
          mmTop = 529
          mmWidth = 55033
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLine4: TppLine
          UserName = 'Line4'
          Weight = 0.75
          mmHeight = 3704
          mmLeft = 192088
          mmTop = 794
          mmWidth = 92340
          BandType = 5
          GroupNo = 2
        end
        object ppLabel6: TppLabel
          UserName = 'Label15'
          Caption = 'Total do Anúncio:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 191823
          mmTop = 1323
          mmWidth = 19050
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLROPERACAO'
          DataPipeline = pplAnuncPeriodoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnuncPeriodoCon'
          mmHeight = 2910
          mmLeft = 241830
          mmTop = 1588
          mmWidth = 20902
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'VLRREMUNERACAO'
          DataPipeline = pplAnuncPeriodoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnuncPeriodoCon'
          mmHeight = 2910
          mmLeft = 219869
          mmTop = 1588
          mmWidth = 21167
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'VLRRCBER'
          DataPipeline = pplAnuncPeriodoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnuncPeriodoCon'
          mmHeight = 2910
          mmLeft = 264055
          mmTop = 1588
          mmWidth = 20373
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object pplAnuncPeriodoCon: TppBDEPipeline
    DataSource = DsAnuncPeriodoCon
    UserName = 'IAnuncPeriodoCon'
    Left = 125
    Top = 64
  end
  object DsAnuncPeriodoCon: TwwDataSource
    AutoEdit = False
    DataSet = QryAnuncPeriodoCon
    Left = 127
    Top = 112
  end
  object QryAnuncPeriodoCon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '-- Query criada em tempo de execucao a partir da QryAnuncPeriodo'
      'SELECT'
      '   PP.PLANPRVCONTABPATRO,'
      '   OI.IDOPERACAOINVEST, OD.IDOPERACAODIREITO,'
      '   OD.IDTIPOOPERACAO,'
      '   TP1.DESCTIPOOPERACAO,'
      '   (OI.IDTIPOOPERACAO) AS TIPOANUNCIO,'
      '   (TP.DESCTIPOOPERACAO) AS DESCANUNCIO,'
      '   OI.DATAOPERACAO, OI.NUMDOCUMENTO AS BOLETA,'
      '   OI.PRECOUNITOPERACAO,'
      '   OI.VLRREMUNERACAO,'
      '   OI.VLROPERACAO,'
      '   IV.DESCINVESTIMENTO,'
      '   NVL(OI.QTDEOPERACAO,0) AS QTDEOPERACAO,'
      '   OD.DATAAGE,'
      '   OD.DATAEX,'
      '   OD.DATACOM,'
      '   OD.DATAOPER,'
      '   CI.DESCCARTINVEST,'
      '   SM.DESCSEGMENTACAO,'
      '   SM.IDSEGMENTACAO,'
      '   OI.VLRREMUNERACAO+ OI.VLROPERACAO as VLRRCBER'
      'FROM'
      
        '   OPERACAOINVEST OI, PARAMINVEST PI, TIPOOPERACAO TP, TIPOOPERA' +
        'CAO TP1, INVESTIMENTO IV,'
      
        '   OPERACAODIREITO OD, CARTEIRAINVEST CI, VWPLANPREVCTBPATR PP, ' +
        'EMISSOR EM, SEGMENTACAOMERCADO SM'
      'WHERE (OI.IDCARTEIRAGERENC IS NULL)'
      
        '  AND (DECODE(:TIPODATA, 0, OD.DATAOPER, OD.DATAAGE) >= TO_DATE(' +
        ':DATAINI,'#39'DD/MM/YYYY'#39'))'
      
        '  AND (DECODE(:TIPODATA, 0, OD.DATAOPER, OD.DATAAGE) <= TO_DATE(' +
        ':DATAFIM,'#39'DD/MM/YYYY'#39'))'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OI.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      
        '  AND (((:IDTIPOANUNCIO IS NULL) OR (OI.IDTIPOOPERACAO = :IDTIPO' +
        'ANUNCIO)) AND (OI.IDTIPOOPERACAO IN (-70, -71,-10070,-10071)))'
      
        '  AND ((:IDINVESTIMENTO IS NULL) OR (OI.IDINVESTIMENTO = :IDINVE' +
        'STIMENTO))'
      
        '  AND ((:IDTIPOOPERACAO IS NULL) OR (OD.IDTIPOOPERACAO = :IDTIPO' +
        'OPERACAO))'
      
        '  AND ((:IDSEGMENTACAO IS NULL) OR (SM.IDSEGMENTACAO = :IDSEGMEN' +
        'TACAO))'
      '  AND OI.IDTIPOOPERACAO = TP.IDTIPOOPERACAO'
      '  AND OD.IDTIPOOPERACAO = TP1.IDTIPOOPERACAO'
      '  AND OI.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND OI.IDOPERACAODIREITO = OD.IDOPERACAODIREITO'
      '  AND OI.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '  AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      '  AND IV.IDEMISSOR = EM.IDEMISSOR'
      '  AND EM.IDSEGMENTACAO = SM.IDSEGMENTACAO'
      
        'ORDER BY PP.PLANPRVCONTABPATRO, SM.IDSEGMENTACAO, OD.DATAOPER, O' +
        'I.NUMDOCUMENTO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TIPODATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPODATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOANUNCIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOANUNCIO'
        ParamType = ptUnknown
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
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDSEGMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDSEGMENTACAO'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 32
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data EX'
      DisplayWidth = 11
      FieldName = 'DATAOPER'
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Data Prevista'
      DisplayWidth = 11
      FieldName = 'DATACOM'
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 11
      FieldName = 'DATAEX'
    end
    object DateTimeField4: TDateTimeField
      DisplayLabel = 'Data AGE'
      DisplayWidth = 11
      FieldName = 'DATAAGE'
    end
    object StringField2: TStringField
      DisplayLabel = 'Tipo de Anúncio'
      DisplayWidth = 37
      FieldName = 'DESCANUNCIO'
      Size = 60
    end
    object StringField3: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 31
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object StringField4: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 14
      FieldName = 'BOLETA'
      Size = 30
    end
    object StringField5: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 29
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Qtd. Prevista'
      DisplayWidth = 14
      FieldName = 'QTDEOPERACAO'
      DisplayFormat = '###,###,###,###,###,##0'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Preço Unitário'
      DisplayWidth = 14
      FieldName = 'PRECOUNITOPERACAO'
      DisplayFormat = '###,###,###,###,###,##0.00000000'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Valor a Receber'
      DisplayWidth = 14
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,###,###,##0.00'
    end
    object StringField6: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 37
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Tipo de Anúncio'
      DisplayWidth = 29
      FieldName = 'TIPOANUNCIO'
      Visible = False
    end
    object FloatField5: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
    object FloatField6: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object FloatField7: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Visible = False
    end
    object QryAnuncPeriodoConVLRREMUNERACAO: TFloatField
      FieldName = 'VLRREMUNERACAO'
      DisplayFormat = '###,###,###,###,###,##0.00'
    end
    object QryAnuncPeriodoConVLRRCBER: TFloatField
      FieldName = 'VLRRCBER'
    end
    object QryAnuncPeriodoConDESCSEGMENTACAO: TStringField
      FieldName = 'DESCSEGMENTACAO'
      Size = 100
    end
    object QryAnuncPeriodoConIDSEGMENTACAO: TFloatField
      FieldName = 'IDSEGMENTACAO'
    end
  end
  object QrySegmentacao: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      ' IDSEGMENTACAO, DESCSEGMENTACAO, IDGRUPO '
      'FROM '
      '  SEGMENTACAOMERCADO'
      'WHERE '
      '  IDGRUPO =:GRUPO')
    ValidateWithMask = True
    Left = 41
    Top = 234
    ParamData = <
      item
        DataType = ftInteger
        Name = 'GRUPO'
        ParamType = ptUnknown
      end>
    object QrySegmentacaoIDSEGMENTACAO: TFloatField
      FieldName = 'IDSEGMENTACAO'
      Origin = 'BASEDADOS.SEGMENTACAOMERCADO.IDSEGMENTACAO'
    end
    object QrySegmentacaoDESCSEGMENTACAO: TStringField
      FieldName = 'DESCSEGMENTACAO'
      Origin = 'BASEDADOS.SEGMENTACAOMERCADO.DESCSEGMENTACAO'
      Size = 100
    end
    object QrySegmentacaoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.SEGMENTACAOMERCADO.IDGRUPO'
    end
  end
end
