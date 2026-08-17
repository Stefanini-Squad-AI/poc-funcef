inherited dtmRelAdminImobContab: TdtmRelAdminImobContab
  Left = 164
  Top = 206
  Width = 545
  Height = 156
  Caption = 'Relatórios de Custo Contábil de Imóveis'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 32
    Top = 80
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
    Left = 32
    Top = 68
  end
  inherited qryExemplo: TwwQuery
    Left = 32
    Top = 56
  end
  inherited rpExemplo: TppReport
    Left = 32
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object qryCCImovelAnal: TwwQuery
    OnCalcFields = qryCCImovelAnalCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   VW.IDIMOVEL, VW.NOME_MESTRE, VW.NOME_IMOVEL, VW.IMOVEL_EXTENS' +
        'O,'
      '   VW.IDBEM, VW.PLACA, VW.DESBEM, VW.IXBGRUPO,'
      ''
      '   VW.IMOCODIGO, VW.IMOMATRICULA,'
      ''
      '   VW.CODTIPIMOVEL, VW.DESCTIPOIMOVEL,'
      '   VW.FLGATIVO, VW.STATUS_IMOVEL, VW.FLGSTATUSOCUPACAO,'
      ''
      
        '   VW.IMOAREA, VW.IMOAREAGERENCIAL, VW.IMOFRACAOIDEAL, VW.IMOPER' +
        'CENTRATEIO,'
      ''
      
        '   VW.IMOMOEDACOMPRA, VW.IMOVLRCOMPRA, VW.IMODATACOMPRA, VW.MOED' +
        'A_COMPRA,'
      
        '   VW.IMOMOEDAREAVAL, VW.IMOVLRREAVAL, VW.IMODATAREAVAL, VW.MOED' +
        'A_REAVAL,'
      
        '   VW.IMOMOEDAMERCADO, VW.IMOVLRMERCADO, VW.IMODATAMERCADO, VW.M' +
        'OEDA_MERCADO,'
      ''
      '   VW.CONTROLE, VW.BAIXATOTAL, VW.DTAINCLUSAO,'
      
        '   VW.FLGDEPREC, VW.DATAULTDEP, VW.DATAINICIODEP, VW.TAXADEP, VW' +
        '.IDGRUPO,'
      '   VW.IDCLASSEBEM, VW.VALHISTORICO, VW.NOMEFORN,'
      ''
      '   VW.CODGRUPO, VW.DESCGRUPO, VW.TIPOGRUPO,'
      '   VW.CODCENTROCUSTO, VW.DESCCCUSTO, VW.TIPOCCUSTO,'
      '   VW.CODCLASSEBEM, VW.DESCCLASSEBEM, VW.TIPOCLASSEBEM,'
      '   VW.DESCCONJUNTO, VW.DESCLOCAL, VW.NOMERESP,'
      ''
      '   VWT.CMBEM,'
      '   VWT.VALORG AS VALORG0,'
      '   VWT.DEPLANC,'
      '   VWT.CMDEP,'
      ''
      '   VWT.CMBEMACUM0,'
      '   VWT.DEPLANCACUM0,'
      '   VWT.CMDEPLANCACUM0,'
      '   VWT.VALCTB0,'
      ''
      '   (ATU.VALCMBEM + ATU.VALCMREAV)         AS CMBEMATU0,'
      '   (ATU.VALDEPBEM + ATU.VALDEPREAV)       AS DEPLANCATU0,'
      '   ATU.VALCMULTREAV AS VALULTCMREAVATU,'
      '   ATU.VALDEPULTREAV AS VALULTDEPREAVATU,'
      ''
      
        '   (ATU.VALCMBEM + ATU.VALCMREAV + ATU.VALCMULTREAV)      AS SUM' +
        'CMBEMATU,'
      
        '   (ATU.VALDEPBEM + ATU.VALDEPREAV + ATU.VALDEPULTREAV)   AS SUM' +
        'DEPATU,'
      ''
      '   VWT.VALORGREAV       AS VALREAVACUM0,'
      '   VWT.CMBEMREAV,'
      '   VWT.DEPLANCREAV,'
      '   VWT.CMDEPREAV,'
      '   VWT.VALORGULTREAV    AS VALULTREAVACUM1,'
      '   VWT.CMBEMULTREAV     AS VALULTCMREAVACUM1,'
      '   VWT.DEPLANCULTREAV   AS VALULTDEPREAVACUM1,'
      '   VWT.CMDEPULTREAV     AS VALULTCMDEPREAVACUM1,'
      ''
      '   VWT.CMBEMACUM0,'
      '   VWT.DEPLANCACUM0,'
      '   VWT.CMDEPLANCACUM0,'
      ''
      '   (VWT.VALORGREAV + VWT.VALORGULTREAV)      AS SUMPARCREAV,'
      '   (VWT.CMBEMACUM0 + VWT.CMBEMULTREAV)       AS SUMCMBEMACUM,'
      '   (VWT.DEPLANCACUM0 + VWT.DEPLANCULTREAV)   AS SUMDEPACUM,'
      '   (VWT.CMDEPACUM0 + VWT.CMDEPULTREAV)       AS SUMCMDEPACUM,'
      ''
      
        '   (VWT.VALORGULTREAV + VWT.CMBEMULTREAV - VWT.DEPLANCULTREAV - ' +
        'VWT.CMDEPULTREAV) AS VALCTB1,'
      ''
      '   VWT.SUMVALCTB,'
      '   VWT.SUMVALCTBIMOB'
      ''
      'FROM'
      '   VWBEMXIMOVEL VW,'
      ''
      '   ('
      '   SELECT'
      '      SCB.IDBEM, SCB.DATASLDBEM,'
      ''
      '      SCB.VALORG,'
      '      SCB.CMBEM,'
      '      SCB.DEPLANC,'
      '      SCB.CMDEP,'
      '      SCB.REAVVALORG       AS VALORGREAV,'
      '      SCB.REAVCMBEM        AS CMBEMREAV,'
      '      SCB.REAVDEPLANC      AS DEPLANCREAV,'
      '      SCB.REAVCMDEP        AS CMDEPREAV,'
      '      SCB.ULTREAVVALORG    AS VALORGULTREAV,'
      '      SCB.ULTREAVCMBEM     AS CMBEMULTREAV,'
      '      SCB.ULTREAVDEPLANC   AS DEPLANCULTREAV,'
      '      SCB.ULTREAVCMDEP     AS CMDEPULTREAV,'
      ''
      '      (SCB.CMBEM + SCB.REAVCMBEM)      AS CMBEMACUM0,'
      '      (SCB.DEPLANC + SCB.REAVDEPLANC ) AS DEPLANCACUM0,'
      '      (SCB.CMDEP + SCB.REAVCMDEP)      AS CMDEPLANCACUM0,'
      ''
      '      ('
      '      SCB.VALORG + SCB.CMBEM - SCB.DEPLANC - SCB.CMDEP +'
      '      SCB.REAVVALORG + SCB.REAVCMBEM - SCB.REAVDEPLANC -'
      '      SCB.REAVCMDEP'
      '      ) AS VALCTB0,'
      ''
      '      ('
      '      SCB.VALORG + SCB.CMBEM - SCB.DEPLANC - SCB.CMDEP +'
      '      SCB.REAVVALORG + SCB.REAVCMBEM - SCB.REAVDEPLANC -'
      '      SCB.REAVCMDEP + SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM -'
      '      SCB.ULTREAVDEPLANC - SCB.ULTREAVCMDEP'
      '      ) AS SUMVALCTB,'
      ''
      '      ('
      '      SCB.VALORG + SCB.CMBEM + SCB.REAVVALORG +'
      '      SCB.REAVCMBEM + SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM'
      '      ) AS SUMVALCTBIMOB'
      ''
      '   FROM'
      '      SALDOCONTABBEM SCB, IMOVELXBEM IXB,'
      '      ('
      '      SELECT'
      '         IDBEM, MAX(DATASLDBEM) AS DATA'
      '      FROM'
      '         SALDOCONTABBEM'
      '      WHERE'
      '         ( (:PDATAMOV IS NULL) OR (DATASLDBEM <=:PDATAMOV) )'
      '      GROUP BY'
      '         IDBEM'
      '      ) DTAMAX'
      ''
      '   WHERE'
      '      ( (:PIDIMOVEL IS NULL) OR (IXB.IDIMOVEL =:PIDIMOVEL) )'
      '      AND ( SCB.DATASLDBEM = DTAMAX.DATA )'
      '      AND ( SCB.IDBEM = DTAMAX.IDBEM )'
      '      AND ( SCB.IDBEM = IXB.IDBEM )'
      '   ) VWT,'
      ''
      '   ('
      '   SELECT'
      '      ATX.IDBEM, ATX.DATAMOVIMENTACAO,'
      '      SUM(ATX.VLCMBEM)        AS VALCMBEM,'
      '      SUM(ATX.VLCMREAV)       AS VALCMREAV,'
      '      SUM(ATX.VLDEPBEM)       AS VALDEPBEM,'
      '      SUM(ATX.VLDEPREAV)      AS VALDEPREAV,'
      '      SUM(ATX.VLCMULTREAV)    AS VALCMULTREAV,'
      '      SUM(ATX.VLDEPULTREAV)   AS VALDEPULTREAV'
      '   FROM'
      '      ('
      '         ('
      '         SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '            HM.IDBEM, HM.DATAMOVIMENTACAO,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO, 15, NVL(HM.VALOFI,' +
        ' 0), 42, NVL(HM.VALOFI, 0), 34, NVL(HM.VALOFI, 0), 50, NVL(HM.VA' +
        'LOFI, 0), 0)) AS VLCMBEM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO, 14, NVL(HM.VALOFI,' +
        ' 0), 17, NVL(HM.VALOFI, 0), 43, NVL(HM.VALOFI, 0), 35, NVL(HM.VA' +
        'LOFI, 0), 51, NVL(HM.VALOFI, 0), 0)) AS VLDEPBEM,'
      '            (0) AS VLCMREAV,'
      '            (0) AS VLDEPREAV,'
      '            (0) AS VLCMULTREAV,'
      '            (0) AS VLDEPULTREAV'
      '         FROM'
      '            HISTORICOMOVIMENTACAO HM, IMOVELXBEM IXB'
      '         WHERE'
      
        '            ( (:PIDIMOVEL IS NULL) OR (IXB.IDIMOVEL =:PIDIMOVEL)' +
        ' )'
      '            AND ( IXB.IDBEM = HM.IDBEM )'
      '            AND ( HM.IDPESSOA =:PIDPESSOA )'
      '            AND ( HM.DATAMOVIMENTACAO =:PDATAMOV )'
      '         GROUP BY'
      '            HM.IDBEM, HM.DATAMOVIMENTACAO'
      '         )'
      '         UNION'
      '         ('
      '            ('
      '            SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '               HM.IDBEM, HM.DATAMOVIMENTACAO,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO, 22, NVL(HM.VALO' +
        'FI, 0), 46, NVL(HM.VALOFI, 0),0)) AS  VALCMREAV,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO, 18, NVL(HM.VALO' +
        'FI, 0), 33, NVL(HM.VALOFI, 0), 47, NVL(HM.VALOFI, 0), 0)) AS  VA' +
        'LDEPREAV,'
      '               (0) AS VALCMBEM,'
      '               (0) AS VALDEPBEM,'
      '               (0) AS VALCMULTREAV,'
      '               (0) AS VALDEPULTREAV'
      '            FROM'
      
        '               HISTORICOMOVIMENTACAO HM, REAVALIACAO R, IMOVELXB' +
        'EM IXB'
      '            WHERE'
      
        '            ( (:PIDIMOVEL IS NULL) OR (IXB.IDIMOVEL =:PIDIMOVEL)' +
        ' )'
      '               AND ( IXB.IDBEM = HM.IDBEM )'
      '               AND ( HM.IDPESSOA =:PIDPESSOA )'
      '               AND ( HM.DATAMOVIMENTACAO =:PDATAMOV )'
      '               AND ( R.FLGULTREAVAL = 0)'
      '               AND ( HM.IDREAVALACRESC = R.IDREAVALIACAO(+) )'
      '            GROUP BY'
      '               HM.IDBEM, HM.DATAMOVIMENTACAO'
      '            )'
      '            UNION'
      '            ('
      '            SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '               HM.IDBEM, HM.DATAMOVIMENTACAO,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO, 22, NVL(HM.VALO' +
        'FI, 0), 46, NVL(HM.VALOFI, 0), 0)) AS VALCMULTREAV,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO, 18, NVL(HM.VALO' +
        'FI, 0), 33, NVL(HM.VALOFI, 0), 47, NVL(HM.VALOFI, 0), 0)) AS VAL' +
        'DEPULTREAV,'
      '               (0) AS VALCMBEM,'
      '               (0) AS VALCMREAV,'
      '               (0) AS VALDEPBEM,'
      '               (0) AS VALDEPREAV'
      '            FROM'
      
        '               HISTORICOMOVIMENTACAO HM, REAVALIACAO R, IMOVELXB' +
        'EM IXB'
      '            WHERE'
      
        '               ( (:PIDIMOVEL IS NULL) OR (IXB.IDIMOVEL =:PIDIMOV' +
        'EL) )'
      '               AND ( IXB.IDBEM = HM.IDBEM )'
      '               AND ( HM.IDPESSOA =:PIDPESSOA )'
      '               AND ( HM.DATAMOVIMENTACAO =:PDATAMOV )'
      '               AND ( R.FLGULTREAVAL = 1 )'
      '               AND ( HM.IDREAVALACRESC = R.IDREAVALIACAO(+) )'
      '            GROUP BY'
      '               HM.IDBEM, HM.DATAMOVIMENTACAO'
      '            )'
      '         )'
      '      ) ATX'
      ''
      '      GROUP BY'
      '         ATX.IDBEM, ATX.DATAMOVIMENTACAO'
      ''
      '   ) ATU'
      ''
      'WHERE'
      
        '   ( (:PIDIMOVELMESTRE IS NULL) OR (VW.IDIMOVELMESTRE =:PIDIMOVE' +
        'LMESTRE) )'
      '   AND ( (:PIDIMOVEL IS NULL) OR (VW.IDIMOVEL =:PIDIMOVEL) )'
      '   AND ( (:PIDPESSOA IS NULL) OR (VW.IDPESSOA =:PIDPESSOA) )'
      '   AND ( VW.IDBEM = VWT.IDBEM )'
      ''
      'ORDER BY'
      '   VW.NOME_MESTRE, VW.NOME_IMOVEL, VW.IXBGRUPO, VW.DESBEM'
      ' ')
    ValidateWithMask = True
    Left = 264
    Top = 56
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryCCImovelAnal_GRUPO: TStringField
      FieldKind = fkCalculated
      FieldName = '_GRUPO'
      Size = 25
      Calculated = True
    end
  end
  object dsCCImovelAnal: TwwDataSource
    DataSet = qryCCImovelAnal
    Left = 264
    Top = 68
  end
  object pplCCImovelAnal: TppBDEPipeline
    DataSource = dsCCImovelAnal
    UserName = 'lCCImovelAnal'
    Left = 264
    Top = 80
    object pplCCImovelAnalppField1: TppField
      FieldAlias = 'MesApuracao'
      FieldName = 'MesApuracao'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplCCImovelAnalppField2: TppField
      FieldAlias = 'NomeImovel'
      FieldName = 'NomeImovel'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplCCImovelAnalppField3: TppField
      FieldAlias = 'Grupo'
      FieldName = 'Grupo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplCCImovelAnalppField4: TppField
      FieldAlias = 'DataReferencia'
      FieldName = 'DataReferencia'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
  object rptCCImovelAnal: TppReport
    AutoStop = False
    DataPipeline = pplCCImovelAnal
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
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 264
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplCCImovelAnal'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 40
      mmHeight = 23548
      mmPrintPosition = 0
      object ppLabel18: TppLabel
        UserName = 'ppLabel18'
        AutoSize = False
        Caption = 'Custo Contábil por Imóvel (Analítico)'
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
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel20: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel20'
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
        mmTop = 1588
        mmWidth = 284428
        BandType = 0
      end
      object rptCustoContabilLabel2: TppLabel
        UserName = 'rptCustoContabilLabel2'
        Caption = 'Data de Referência:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 17198
        mmWidth = 29369
        BandType = 0
      end
      object rptCCImovelAnal_lblDataContabil: TppLabel
        UserName = 'rptCCImovelAnal_lblDataContabil'
        Caption = 'rptCCImovelAnal_lblDataContabil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 29633
        mmTop = 17198
        mmWidth = 40217
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 22225
      mmPrintPosition = 0
      object rptCustoContabilLabel34: TppLabel
        UserName = 'rptCustoContabilLabel34'
        Caption = 'Valor Contábil:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 53975
        mmTop = 794
        mmWidth = 21167
        BandType = 4
      end
      object rptCustoContabilDBText4: TppDBText
        UserName = 'rptCustoContabilDBText4'
        DataField = 'VALREAVACUM0'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 104511
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object rptCustoContabilDBText5: TppDBText
        UserName = 'rptCustoContabilDBText5'
        DataField = 'VALULTREAVACUM1'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 104511
        mmTop = 5821
        mmWidth = 23548
        BandType = 4
      end
      object rptCustoContabilDBText8: TppDBText
        UserName = 'rptCustoContabilDBText8'
        DataField = 'CMBEMATU0'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 128852
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object rptCustoContabilDBText10: TppDBText
        UserName = 'rptCustoContabilDBText10'
        DataField = 'CMBEMACUM0'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 153723
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object rptCustoContabilDBText12: TppDBText
        UserName = 'rptCustoContabilDBText12'
        DataField = 'DEPLANCATU0'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object rptCustoContabilDBText13: TppDBText
        UserName = 'rptCustoContabilDBText13'
        DataField = 'VALULTDEPREAVATU'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 5821
        mmWidth = 23548
        BandType = 4
      end
      object rptCustoContabilDBText14: TppDBText
        UserName = 'rptCustoContabilDBText14'
        DataField = 'CMDEPLANCACUM0'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 203465
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object rptCustoContabilDBText16: TppDBText
        UserName = 'rptCustoContabilDBText16'
        DataField = 'DEPLANCACUM0'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 228336
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object rptCustoContabilDBText17: TppDBText
        UserName = 'rptCustoContabilDBText17'
        DataField = 'VALULTDEPREAVACUM1'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 228336
        mmTop = 5821
        mmWidth = 23548
        BandType = 4
      end
      object rptCustoContabilDBText18: TppDBText
        UserName = 'rptCustoContabilDBText18'
        DataField = 'VALCTB0'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 253207
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object rptCustoContabilDBText19: TppDBText
        UserName = 'rptCustoContabilDBText19'
        DataField = 'VALCTB1'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 253207
        mmTop = 5821
        mmWidth = 23548
        BandType = 4
      end
      object rptCustoContabilLabel6: TppLabel
        UserName = 'rptCustoContabilLabel6'
        Caption = 'Reavaliação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 57679
        mmTop = 5821
        mmWidth = 17463
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'ppLine5'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 52917
        mmTop = 10319
        mmWidth = 231511
        BandType = 4
      end
      object rptCustoContabilDBMemo1: TppDBMemo
        UserName = 'rptCustoContabilDBMemo1'
        CharWrap = True
        DataField = 'DESBEM'
        DataPipeline = pplCCImovelAnal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 17463
        mmLeft = 4763
        mmTop = 4233
        mmWidth = 45244
        BandType = 4
        mmBottomOffset = 40
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptCustoContabilDBText7: TppDBText
        UserName = 'rptCustoContabilDBText7'
        DataField = 'VALULTCMDEPREAVACUM1'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 203465
        mmTop = 5821
        mmWidth = 23548
        BandType = 4
      end
      object rptCustoContabilDBText9: TppDBText
        UserName = 'rptCustoContabilDBText9'
        DataField = 'VALULTCMREAVACUM1'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 153723
        mmTop = 5821
        mmWidth = 23548
        BandType = 4
      end
      object rptCustoContabilDBText11: TppDBText
        UserName = 'rptCustoContabilDBText11'
        DataField = 'VALULTCMREAVATU'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 128852
        mmTop = 5821
        mmWidth = 23548
        BandType = 4
      end
      object rptCustoContabilDBText3: TppDBText
        UserName = 'rptCustoContabilDBText3'
        DataField = 'VALORG0'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 79111
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object rptCustoContabilDBText15: TppDBText
        UserName = 'rptCustoContabilDBText15'
        DataField = 'PLACA'
        DataPipeline = pplCCImovelAnal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 4763
        mmTop = 794
        mmWidth = 45244
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 40
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'ppLine7'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel25: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel25'
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
        mmTop = 3175
        mmWidth = 65617
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
        mmLeft = 120386
        mmTop = 3175
        mmWidth = 43392
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
        mmLeft = 241300
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
    object rptCustoContabilSummaryBand1: TppSummaryBand
      mmBottomOffset = 40
      mmHeight = 25929
      mmPrintPosition = 0
      object rptCustoContabilShape2: TppShape
        UserName = 'rptCustoContabilShape2'
        Pen.Width = 2
        mmHeight = 6085
        mmLeft = 50006
        mmTop = 10583
        mmWidth = 227807
        BandType = 7
      end
      object rptCustoContabilDBCalc17: TppDBCalc
        UserName = 'rptCustoContabilDBCalc17'
        DataField = 'VALORG0'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 79111
        mmTop = 11642
        mmWidth = 23548
        BandType = 7
      end
      object rptCustoContabilDBCalc18: TppDBCalc
        UserName = 'rptCustoContabilDBCalc18'
        DataField = 'SUMPARCREAV'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 104511
        mmTop = 11642
        mmWidth = 23548
        BandType = 7
      end
      object rptCustoContabilDBCalc19: TppDBCalc
        UserName = 'rptCustoContabilDBCalc19'
        DataField = 'SUMCMBEMATU'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 128852
        mmTop = 11642
        mmWidth = 23548
        BandType = 7
      end
      object rptCustoContabilDBCalc20: TppDBCalc
        UserName = 'rptCustoContabilDBCalc20'
        DataField = 'SUMCMBEMACUM'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 153723
        mmTop = 11642
        mmWidth = 23548
        BandType = 7
      end
      object rptCustoContabilDBCalc21: TppDBCalc
        UserName = 'rptCustoContabilDBCalc21'
        DataField = 'SUMDEPATU'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 11642
        mmWidth = 23548
        BandType = 7
      end
      object rptCustoContabilDBCalc22: TppDBCalc
        UserName = 'rptCustoContabilDBCalc22'
        DataField = 'SUMCMDEPACUM'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 203465
        mmTop = 11642
        mmWidth = 23548
        BandType = 7
      end
      object rptCustoContabilDBCalc23: TppDBCalc
        UserName = 'rptCustoContabilDBCalc23'
        DataField = 'SUMDEPACUM'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 228336
        mmTop = 11642
        mmWidth = 23548
        BandType = 7
      end
      object rptCustoContabilDBCalc24: TppDBCalc
        UserName = 'rptCustoContabilDBCalc24'
        DataField = 'SUMVALCTB'
        DataPipeline = pplCCImovelAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelAnal'
        mmHeight = 3704
        mmLeft = 253207
        mmTop = 11642
        mmWidth = 23548
        BandType = 7
      end
      object rptCustoContabilLabel16: TppLabel
        UserName = 'rptCustoContabilLabel16'
        Caption = 'TOTAL GERAL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 54240
        mmTop = 11642
        mmWidth = 20902
        BandType = 7
      end
      object rptCustoContabilLine4: TppLine
        UserName = 'rptCustoContabilLine4'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 5556
        mmWidth = 284300
        BandType = 7
      end
    end
    object rptCustoContabilGroup2: TppGroup
      BreakName = 'IDIMOVEL'
      DataPipeline = pplCCImovelAnal
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rptCustoContabilGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCCImovelAnal'
      object rptCustoContabilGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 40
        mmHeight = 9790
        mmPrintPosition = 0
        object rptCustoContabilLine2: TppLine
          UserName = 'rptCustoContabilLine2'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 8996
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel7: TppLabel
          UserName = 'rptCustoContabilLabel7'
          Caption = 'Imóvel:  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 529
          mmTop = 5292
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilDBText1: TppDBText
          UserName = 'rptCustoContabilDBText1'
          AutoSize = True
          DataField = 'NOMEIMOVEL'
          DataPipeline = pplCCImovelAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplCCImovelAnal'
          mmHeight = 3175
          mmLeft = 12435
          mmTop = 5292
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
      end
      object rptCustoContabilGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 40
        mmHeight = 14817
        mmPrintPosition = 0
        object rptCustoContabilShape1: TppShape
          UserName = 'rptCustoContabilShape1'
          Pen.Width = 2
          mmHeight = 6085
          mmLeft = 50006
          mmTop = 3969
          mmWidth = 227807
          BandType = 5
          GroupNo = 0
        end
        object rptCustoContabilDBCalc2: TppDBCalc
          UserName = 'rptCustoContabilDBCalc2'
          DataField = 'VALORG0'
          DataPipeline = pplCCImovelAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovelAnal'
          mmHeight = 3704
          mmLeft = 79111
          mmTop = 5027
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object rptCustoContabilDBCalc3: TppDBCalc
          UserName = 'rptCustoContabilDBCalc3'
          DataField = 'SUMPARCREAV'
          DataPipeline = pplCCImovelAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovelAnal'
          mmHeight = 3704
          mmLeft = 104511
          mmTop = 5027
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object rptCustoContabilDBCalc5: TppDBCalc
          UserName = 'rptCustoContabilDBCalc5'
          DataField = 'SUMCMBEMATU'
          DataPipeline = pplCCImovelAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovelAnal'
          mmHeight = 3704
          mmLeft = 128852
          mmTop = 5027
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object rptCustoContabilDBCalc6: TppDBCalc
          UserName = 'rptCustoContabilDBCalc6'
          DataField = 'SUMCMBEMACUM'
          DataPipeline = pplCCImovelAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovelAnal'
          mmHeight = 3704
          mmLeft = 153723
          mmTop = 5027
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object rptCustoContabilDBCalc12: TppDBCalc
          UserName = 'rptCustoContabilDBCalc12'
          DataField = 'SUMDEPATU'
          DataPipeline = pplCCImovelAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovelAnal'
          mmHeight = 3704
          mmLeft = 178594
          mmTop = 5027
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object rptCustoContabilDBCalc13: TppDBCalc
          UserName = 'rptCustoContabilDBCalc13'
          DataField = 'SUMCMDEPACUM'
          DataPipeline = pplCCImovelAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovelAnal'
          mmHeight = 3704
          mmLeft = 203465
          mmTop = 5027
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object rptCustoContabilDBCalc14: TppDBCalc
          UserName = 'rptCustoContabilDBCalc14'
          DataField = 'SUMDEPACUM'
          DataPipeline = pplCCImovelAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovelAnal'
          mmHeight = 3704
          mmLeft = 228336
          mmTop = 5027
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object rptCustoContabilDBCalc16: TppDBCalc
          UserName = 'rptCustoContabilDBCalc16'
          DataField = 'SUMVALCTB'
          DataPipeline = pplCCImovelAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovelAnal'
          mmHeight = 3704
          mmLeft = 253207
          mmTop = 5027
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object rptCustoContabilLabel8: TppLabel
          UserName = 'rptCustoContabilLabel8'
          Caption = 'Total do Imóvel:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 52123
          mmTop = 5027
          mmWidth = 23019
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rptCustoContabilGroup3: TppGroup
      BreakName = 'IXBGRUPO'
      DataPipeline = pplCCImovelAnal
      OutlineSettings.CreateNode = True
      UserName = 'rptCustoContabilGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCCImovelAnal'
      object rptCustoContabilGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 40
        mmHeight = 15875
        mmPrintPosition = 0
        object rptCustoContabilLine3: TppLine
          UserName = 'rptCustoContabilLine3'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 4233
          mmTop = 5556
          mmWidth = 280194
          BandType = 3
          GroupNo = 2
        end
        object rptCustoContabilDBText2: TppDBText
          UserName = 'rptCustoContabilDBText2'
          AutoSize = True
          DataField = 'Grupo'
          DataPipeline = pplCCImovelAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplCCImovelAnal'
          mmHeight = 3175
          mmLeft = 15875
          mmTop = 2117
          mmWidth = 7673
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel1: TppLabel
          UserName = 'rptCustoContabilLabel1'
          Caption = 'Custo Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 81227
          mmTop = 8202
          mmWidth = 21431
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel3: TppLabel
          UserName = 'rptCustoContabilLabel3'
          Caption = 'Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 116946
          mmTop = 8202
          mmWidth = 10583
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel4: TppLabel
          UserName = 'rptCustoContabilLabel4'
          Caption = 'Reavaliação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 110861
          mmTop = 11642
          mmWidth = 16669
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel5: TppLabel
          UserName = 'rptCustoContabilLabel5'
          Caption = 'Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 94456
          mmTop = 11642
          mmWidth = 8202
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel9: TppLabel
          UserName = 'rptCustoContabilLabel9'
          Caption = 'Corr. Mon.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 137054
          mmTop = 8202
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel10: TppLabel
          UserName = 'rptCustoContabilLabel10'
          Caption = 'no Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 141552
          mmTop = 11642
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel11: TppLabel
          UserName = 'rptCustoContabilLabel11'
          Caption = 'Corr. Mon.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 161925
          mmTop = 8202
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel12: TppLabel
          UserName = 'rptCustoContabilLabel12'
          Caption = 'Acumulada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 161132
          mmTop = 11642
          mmWidth = 16140
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel21: TppLabel
          UserName = 'rptCustoContabilLabel21'
          Caption = 'Custo Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 255323
          mmTop = 8202
          mmWidth = 21431
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel22: TppLabel
          UserName = 'rptCustoContabilLabel22'
          Caption = 'Depreciação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 234157
          mmTop = 8202
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel23: TppLabel
          UserName = 'rptCustoContabilLabel23'
          Caption = 'Acumulada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 235744
          mmTop = 11642
          mmWidth = 16140
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel24: TppLabel
          UserName = 'rptCustoContabilLabel24'
          Caption = 'Depreciação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 209286
          mmTop = 11642
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel25: TppLabel
          UserName = 'rptCustoContabilLabel25'
          Caption = 'Corr. Mon. da'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 207434
          mmTop = 8202
          mmWidth = 19579
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel26: TppLabel
          UserName = 'rptCustoContabilLabel26'
          Caption = 'No Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 191294
          mmTop = 11642
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel27: TppLabel
          UserName = 'rptCustoContabilLabel27'
          Caption = 'Depreciação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 184415
          mmTop = 8202
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLine1: TppLine
          UserName = 'rptCustoContabilLine1'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 4233
          mmTop = 15081
          mmWidth = 280194
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel14: TppLabel
          UserName = 'rptCustoContabilLabel14'
          Caption = 'Descrição do Bem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 4763
          mmTop = 11642
          mmWidth = 26194
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel15: TppLabel
          UserName = 'rptCustoContabilLabel15'
          Caption = 'Grupo:  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 4763
          mmTop = 2117
          mmWidth = 11377
          BandType = 3
          GroupNo = 1
        end
      end
      object rptCustoContabilGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 40
        mmHeight = 9260
        mmPrintPosition = 0
        object rptCustoContabilDBCalc1: TppDBCalc
          UserName = 'rptCustoContabilDBCalc1'
          DataField = 'VALORG0'
          DataPipeline = pplCCImovelAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovelAnal'
          mmHeight = 3704
          mmLeft = 79111
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 1
        end
        object rptCustoContabilDBCalc4: TppDBCalc
          UserName = 'rptCustoContabilDBCalc4'
          DataField = 'SUMPARCREAV'
          DataPipeline = pplCCImovelAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovelAnal'
          mmHeight = 3704
          mmLeft = 104511
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 1
        end
        object rptCustoContabilDBCalc7: TppDBCalc
          UserName = 'rptCustoContabilDBCalc7'
          DataField = 'SUMCMBEMATU'
          DataPipeline = pplCCImovelAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovelAnal'
          mmHeight = 3704
          mmLeft = 128852
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 1
        end
        object rptCustoContabilDBCalc8: TppDBCalc
          UserName = 'rptCustoContabilDBCalc8'
          DataField = 'SUMCMBEMACUM'
          DataPipeline = pplCCImovelAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovelAnal'
          mmHeight = 3704
          mmLeft = 153723
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 1
        end
        object rptCustoContabilDBCalc9: TppDBCalc
          UserName = 'rptCustoContabilDBCalc9'
          DataField = 'SUMDEPATU'
          DataPipeline = pplCCImovelAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovelAnal'
          mmHeight = 3704
          mmLeft = 178594
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 1
        end
        object rptCustoContabilDBCalc10: TppDBCalc
          UserName = 'rptCustoContabilDBCalc10'
          DataField = 'SUMCMDEPACUM'
          DataPipeline = pplCCImovelAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovelAnal'
          mmHeight = 3704
          mmLeft = 203465
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 1
        end
        object rptCustoContabilDBCalc11: TppDBCalc
          UserName = 'rptCustoContabilDBCalc11'
          DataField = 'SUMDEPACUM'
          DataPipeline = pplCCImovelAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovelAnal'
          mmHeight = 3704
          mmLeft = 228336
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 1
        end
        object rptCustoContabilDBCalc15: TppDBCalc
          UserName = 'rptCustoContabilDBCalc15'
          DataField = 'SUMVALCTB'
          DataPipeline = pplCCImovelAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovelAnal'
          mmHeight = 3704
          mmLeft = 253207
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 1
        end
        object rptCustoContabilLabel13: TppLabel
          UserName = 'rptCustoContabilLabel13'
          Caption = 'Total do Grupo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 52917
          mmTop = 1588
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object qryCCMestreAnal: TwwQuery
    OnCalcFields = qryCCMestreAnalCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   VW.IDIMOVEL, VW.NOME_MESTRE, VW.NOME_IMOVEL, VW.IMOVEL_EXTENS' +
        'O,'
      '   VW.IDBEM, VW.PLACA, VW.DESBEM, VW.IXBGRUPO,'
      ''
      '   VW.IMOCODIGO, VW.IMOMATRICULA,'
      ''
      '   VW.CODTIPIMOVEL, VW.DESCTIPOIMOVEL,'
      '   VW.FLGATIVO, VW.STATUS_IMOVEL, VW.FLGSTATUSOCUPACAO,'
      ''
      
        '   VW.IMOAREA, VW.IMOAREAGERENCIAL, VW.IMOFRACAOIDEAL, VW.IMOPER' +
        'CENTRATEIO,'
      ''
      
        '   VW.IMOMOEDACOMPRA, VW.IMOVLRCOMPRA, VW.IMODATACOMPRA, VW.MOED' +
        'A_COMPRA,'
      
        '   VW.IMOMOEDAREAVAL, VW.IMOVLRREAVAL, VW.IMODATAREAVAL, VW.MOED' +
        'A_REAVAL,'
      
        '   VW.IMOMOEDAMERCADO, VW.IMOVLRMERCADO, VW.IMODATAMERCADO, VW.M' +
        'OEDA_MERCADO,'
      ''
      '   VW.CONTROLE, VW.BAIXATOTAL, VW.DTAINCLUSAO,'
      
        '   VW.FLGDEPREC, VW.DATAULTDEP, VW.DATAINICIODEP, VW.TAXADEP, VW' +
        '.IDGRUPO,'
      '   VW.IDCLASSEBEM, VW.VALHISTORICO, VW.NOMEFORN,'
      ''
      '   VW.CODGRUPO, VW.DESCGRUPO, VW.TIPOGRUPO,'
      '   VW.CODCENTROCUSTO, VW.DESCCCUSTO, VW.TIPOCCUSTO,'
      '   VW.CODCLASSEBEM, VW.DESCCLASSEBEM, VW.TIPOCLASSEBEM,'
      '   VW.DESCCONJUNTO, VW.DESCLOCAL, VW.NOMERESP,'
      ''
      '   VWT.CMBEM,'
      '   VWT.VALORG AS VALORG0,'
      '   VWT.DEPLANC,'
      '   VWT.CMDEP,'
      ''
      '   VWT.CMBEMACUM0,'
      '   VWT.DEPLANCACUM0,'
      '   VWT.CMDEPLANCACUM0,'
      '   VWT.VALCTB0,'
      ''
      '   (ATU.VALCMBEM + ATU.VALCMREAV)         AS CMBEMATU0,'
      '   (ATU.VALDEPBEM + ATU.VALDEPREAV)       AS DEPLANCATU0,'
      '   ATU.VALCMULTREAV AS VALULTCMREAVATU,'
      '   ATU.VALDEPULTREAV AS VALULTDEPREAVATU,'
      ''
      
        '   (ATU.VALCMBEM + ATU.VALCMREAV + ATU.VALCMULTREAV)      AS SUM' +
        'CMBEMATU,'
      
        '   (ATU.VALDEPBEM + ATU.VALDEPREAV + ATU.VALDEPULTREAV)   AS SUM' +
        'DEPATU,'
      ''
      '   VWT.VALORGREAV       AS VALREAVACUM0,'
      '   VWT.CMBEMREAV,'
      '   VWT.DEPLANCREAV,'
      '   VWT.CMDEPREAV,'
      '   VWT.VALORGULTREAV    AS VALULTREAVACUM1,'
      '   VWT.CMBEMULTREAV     AS VALULTCMREAVACUM1,'
      '   VWT.DEPLANCULTREAV   AS VALULTDEPREAVACUM1,'
      '   VWT.CMDEPULTREAV     AS VALULTCMDEPREAVACUM1,'
      ''
      '   VWT.CMBEMACUM0,'
      '   VWT.DEPLANCACUM0,'
      '   VWT.CMDEPLANCACUM0,'
      ''
      '   (VWT.VALORGREAV + VWT.VALORGULTREAV)      AS SUMPARCREAV,'
      '   (VWT.CMBEMACUM0 + VWT.CMBEMULTREAV)       AS SUMCMBEMACUM,'
      '   (VWT.DEPLANCACUM0 + VWT.DEPLANCULTREAV)   AS SUMDEPACUM,'
      '   (VWT.CMDEPACUM0 + VWT.CMDEPULTREAV)       AS SUMCMDEPACUM,'
      ''
      
        '   (VWT.VALORGULTREAV + VWT.CMBEMULTREAV - VWT.DEPLANCULTREAV - ' +
        'VWT.CMDEPULTREAV) AS VALCTB1,'
      ''
      '   VWT.SUMVALCTB,'
      '   VWT.SUMVALCTBIMOB'
      ''
      'FROM'
      '   VWBEMXIMOVEL VW,'
      ''
      '   ('
      '   SELECT'
      '      SCB.IDBEM, SCB.DATASLDBEM,'
      ''
      '      SCB.VALORG,'
      '      SCB.CMBEM,'
      '      SCB.DEPLANC,'
      '      SCB.CMDEP,'
      '      SCB.REAVVALORG       AS VALORGREAV,'
      '      SCB.REAVCMBEM        AS CMBEMREAV,'
      '      SCB.REAVDEPLANC      AS DEPLANCREAV,'
      '      SCB.REAVCMDEP        AS CMDEPREAV,'
      '      SCB.ULTREAVVALORG    AS VALORGULTREAV,'
      '      SCB.ULTREAVCMBEM     AS CMBEMULTREAV,'
      '      SCB.ULTREAVDEPLANC   AS DEPLANCULTREAV,'
      '      SCB.ULTREAVCMDEP     AS CMDEPULTREAV,'
      ''
      '      (SCB.CMBEM + SCB.REAVCMBEM)      AS CMBEMACUM0,'
      '      (SCB.DEPLANC + SCB.REAVDEPLANC ) AS DEPLANCACUM0,'
      '      (SCB.CMDEP + SCB.REAVCMDEP)      AS CMDEPLANCACUM0,'
      ''
      '      ('
      '      SCB.VALORG + SCB.CMBEM - SCB.DEPLANC - SCB.CMDEP +'
      '      SCB.REAVVALORG + SCB.REAVCMBEM - SCB.REAVDEPLANC -'
      '      SCB.REAVCMDEP'
      '      ) AS VALCTB0,'
      ''
      '      ('
      '      SCB.VALORG + SCB.CMBEM - SCB.DEPLANC - SCB.CMDEP +'
      '      SCB.REAVVALORG + SCB.REAVCMBEM - SCB.REAVDEPLANC -'
      '      SCB.REAVCMDEP + SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM -'
      '      SCB.ULTREAVDEPLANC - SCB.ULTREAVCMDEP'
      '      ) AS SUMVALCTB,'
      ''
      '      ('
      '      SCB.VALORG + SCB.CMBEM + SCB.REAVVALORG +'
      '      SCB.REAVCMBEM + SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM'
      '      ) AS SUMVALCTBIMOB'
      ''
      '   FROM'
      '      SALDOCONTABBEM SCB, IMOVELXBEM IXB,'
      '      ('
      '      SELECT'
      '         IDBEM, MAX(DATASLDBEM) AS DATA'
      '      FROM'
      '         SALDOCONTABBEM'
      '      WHERE'
      '         ( (:PDATAMOV IS NULL) OR (DATASLDBEM <=:PDATAMOV) )'
      '      GROUP BY'
      '         IDBEM'
      '      ) DTAMAX'
      ''
      '   WHERE'
      '      ( (:PIDIMOVEL IS NULL) OR (IXB.IDIMOVEL =:PIDIMOVEL) )'
      '      AND ( SCB.DATASLDBEM = DTAMAX.DATA )'
      '      AND ( SCB.IDBEM = DTAMAX.IDBEM )'
      '      AND ( SCB.IDBEM = IXB.IDBEM )'
      '   ) VWT,'
      ''
      '   ('
      '   SELECT'
      '      ATX.IDBEM, ATX.DATAMOVIMENTACAO,'
      '      SUM(ATX.VLCMBEM)        AS VALCMBEM,'
      '      SUM(ATX.VLCMREAV)       AS VALCMREAV,'
      '      SUM(ATX.VLDEPBEM)       AS VALDEPBEM,'
      '      SUM(ATX.VLDEPREAV)      AS VALDEPREAV,'
      '      SUM(ATX.VLCMULTREAV)    AS VALCMULTREAV,'
      '      SUM(ATX.VLDEPULTREAV)   AS VALDEPULTREAV'
      '   FROM'
      '      ('
      '         ('
      '         SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '            HM.IDBEM, HM.DATAMOVIMENTACAO,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO, 15, NVL(HM.VALOFI,' +
        ' 0), 42, NVL(HM.VALOFI, 0), 34, NVL(HM.VALOFI, 0), 50, NVL(HM.VA' +
        'LOFI, 0), 0)) AS VLCMBEM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO, 14, NVL(HM.VALOFI,' +
        ' 0), 17, NVL(HM.VALOFI, 0), 43, NVL(HM.VALOFI, 0), 35, NVL(HM.VA' +
        'LOFI, 0), 51, NVL(HM.VALOFI, 0), 0)) AS VLDEPBEM,'
      '            (0) AS VLCMREAV,'
      '            (0) AS VLDEPREAV,'
      '            (0) AS VLCMULTREAV,'
      '            (0) AS VLDEPULTREAV'
      '         FROM'
      '            HISTORICOMOVIMENTACAO HM, IMOVELXBEM IXB'
      '         WHERE'
      
        '            ( (:PIDIMOVEL IS NULL) OR (IXB.IDIMOVEL =:PIDIMOVEL)' +
        ' )'
      '            AND ( IXB.IDBEM = HM.IDBEM )'
      '            AND ( HM.IDPESSOA =:PIDPESSOA )'
      '            AND ( HM.DATAMOVIMENTACAO =:PDATAMOV )'
      '         GROUP BY'
      '            HM.IDBEM, HM.DATAMOVIMENTACAO'
      '         )'
      '         UNION'
      '         ('
      '            ('
      '            SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '               HM.IDBEM, HM.DATAMOVIMENTACAO,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO, 22, NVL(HM.VALO' +
        'FI, 0), 46, NVL(HM.VALOFI, 0),0)) AS  VALCMREAV,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO, 18, NVL(HM.VALO' +
        'FI, 0), 33, NVL(HM.VALOFI, 0), 47, NVL(HM.VALOFI, 0), 0)) AS  VA' +
        'LDEPREAV,'
      '               (0) AS VALCMBEM,'
      '               (0) AS VALDEPBEM,'
      '               (0) AS VALCMULTREAV,'
      '               (0) AS VALDEPULTREAV'
      '            FROM'
      
        '               HISTORICOMOVIMENTACAO HM, REAVALIACAO R, IMOVELXB' +
        'EM IXB'
      '            WHERE'
      
        '            ( (:PIDIMOVEL IS NULL) OR (IXB.IDIMOVEL =:PIDIMOVEL)' +
        ' )'
      '               AND ( IXB.IDBEM = HM.IDBEM )'
      '               AND ( HM.IDPESSOA =:PIDPESSOA )'
      '               AND ( HM.DATAMOVIMENTACAO =:PDATAMOV )'
      '               AND ( R.FLGULTREAVAL = 0)'
      '               AND ( HM.IDREAVALACRESC = R.IDREAVALIACAO(+) )'
      '            GROUP BY'
      '               HM.IDBEM, HM.DATAMOVIMENTACAO'
      '            )'
      '            UNION'
      '            ('
      '            SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '               HM.IDBEM, HM.DATAMOVIMENTACAO,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO, 22, NVL(HM.VALO' +
        'FI, 0), 46, NVL(HM.VALOFI, 0), 0)) AS VALCMULTREAV,'
      
        '               SUM(DECODE(HM.IDTIPOMOVIMENTACAO, 18, NVL(HM.VALO' +
        'FI, 0), 33, NVL(HM.VALOFI, 0), 47, NVL(HM.VALOFI, 0), 0)) AS VAL' +
        'DEPULTREAV,'
      '               (0) AS VALCMBEM,'
      '               (0) AS VALCMREAV,'
      '               (0) AS VALDEPBEM,'
      '               (0) AS VALDEPREAV'
      '            FROM'
      
        '               HISTORICOMOVIMENTACAO HM, REAVALIACAO R, IMOVELXB' +
        'EM IXB'
      '            WHERE'
      
        '               ( (:PIDIMOVEL IS NULL) OR (IXB.IDIMOVEL =:PIDIMOV' +
        'EL) )'
      '               AND ( IXB.IDBEM = HM.IDBEM )'
      '               AND ( HM.IDPESSOA =:PIDPESSOA )'
      '               AND ( HM.DATAMOVIMENTACAO =:PDATAMOV )'
      '               AND ( R.FLGULTREAVAL = 1 )'
      '               AND ( HM.IDREAVALACRESC = R.IDREAVALIACAO(+) )'
      '            GROUP BY'
      '               HM.IDBEM, HM.DATAMOVIMENTACAO'
      '            )'
      '         )'
      '      ) ATX'
      ''
      '      GROUP BY'
      '         ATX.IDBEM, ATX.DATAMOVIMENTACAO'
      ''
      '   ) ATU'
      ''
      'WHERE'
      
        '   ( (:PIDIMOVELMESTRE IS NULL) OR (VW.IDIMOVELMESTRE =:PIDIMOVE' +
        'LMESTRE) )'
      '   AND ( (:PIDIMOVEL IS NULL) OR (VW.IDIMOVEL =:PIDIMOVEL) )'
      '   AND ( (:PIDPESSOA IS NULL) OR (VW.IDPESSOA =:PIDPESSOA) )'
      '   AND ( VW.IDBEM = VWT.IDBEM )'
      ''
      'ORDER BY'
      '   VW.NOME_MESTRE, VW.NOME_IMOVEL, VW.IXBGRUPO, VW.DESBEM')
    ValidateWithMask = True
    Left = 368
    Top = 56
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryCCMestreAnal_GRUPO: TStringField
      FieldKind = fkCalculated
      FieldName = '_GRUPO'
      Size = 25
      Calculated = True
    end
    object qryCCMestreAnalIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryCCMestreAnalNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object qryCCMestreAnalNOME_IMOVEL: TStringField
      FieldName = 'NOME_IMOVEL'
      Size = 60
    end
    object qryCCMestreAnalIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryCCMestreAnalIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryCCMestreAnalPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryCCMestreAnalDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryCCMestreAnalIXBGRUPO: TStringField
      FieldName = 'IXBGRUPO'
      FixedChar = True
      Size = 1
    end
    object qryCCMestreAnalIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object qryCCMestreAnalIMOMATRICULA: TStringField
      FieldName = 'IMOMATRICULA'
    end
    object qryCCMestreAnalCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryCCMestreAnalDESCTIPOIMOVEL: TStringField
      FieldName = 'DESCTIPOIMOVEL'
      Size = 25
    end
    object qryCCMestreAnalFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
    end
    object qryCCMestreAnalSTATUS_IMOVEL: TStringField
      FieldName = 'STATUS_IMOVEL'
      FixedChar = True
      Size = 1
    end
    object qryCCMestreAnalFLGSTATUSOCUPACAO: TStringField
      FieldName = 'FLGSTATUSOCUPACAO'
      FixedChar = True
      Size = 1
    end
    object qryCCMestreAnalIMOAREA: TFloatField
      FieldName = 'IMOAREA'
    end
    object qryCCMestreAnalIMOAREAGERENCIAL: TFloatField
      FieldName = 'IMOAREAGERENCIAL'
    end
    object qryCCMestreAnalIMOFRACAOIDEAL: TFloatField
      FieldName = 'IMOFRACAOIDEAL'
    end
    object qryCCMestreAnalIMOPERCENTRATEIO: TFloatField
      FieldName = 'IMOPERCENTRATEIO'
    end
    object qryCCMestreAnalIMOMOEDACOMPRA: TFloatField
      FieldName = 'IMOMOEDACOMPRA'
    end
    object qryCCMestreAnalIMOVLRCOMPRA: TFloatField
      FieldName = 'IMOVLRCOMPRA'
    end
    object qryCCMestreAnalIMODATACOMPRA: TDateTimeField
      FieldName = 'IMODATACOMPRA'
    end
    object qryCCMestreAnalMOEDA_COMPRA: TStringField
      FieldName = 'MOEDA_COMPRA'
      Size = 10
    end
    object qryCCMestreAnalIMOMOEDAREAVAL: TFloatField
      FieldName = 'IMOMOEDAREAVAL'
    end
    object qryCCMestreAnalIMOVLRREAVAL: TFloatField
      FieldName = 'IMOVLRREAVAL'
    end
    object qryCCMestreAnalIMODATAREAVAL: TDateTimeField
      FieldName = 'IMODATAREAVAL'
    end
    object qryCCMestreAnalMOEDA_REAVAL: TStringField
      FieldName = 'MOEDA_REAVAL'
      Size = 10
    end
    object qryCCMestreAnalIMOMOEDAMERCADO: TFloatField
      FieldName = 'IMOMOEDAMERCADO'
    end
    object qryCCMestreAnalIMOVLRMERCADO: TFloatField
      FieldName = 'IMOVLRMERCADO'
    end
    object qryCCMestreAnalIMODATAMERCADO: TDateTimeField
      FieldName = 'IMODATAMERCADO'
    end
    object qryCCMestreAnalMOEDA_MERCADO: TStringField
      FieldName = 'MOEDA_MERCADO'
      Size = 10
    end
    object qryCCMestreAnalCONTROLE: TStringField
      FieldName = 'CONTROLE'
      FixedChar = True
      Size = 1
    end
    object qryCCMestreAnalBAIXATOTAL: TStringField
      FieldName = 'BAIXATOTAL'
      FixedChar = True
      Size = 1
    end
    object qryCCMestreAnalDTAINCLUSAO: TDateTimeField
      FieldName = 'DTAINCLUSAO'
    end
    object qryCCMestreAnalFLGDEPREC: TFloatField
      FieldName = 'FLGDEPREC'
    end
    object qryCCMestreAnalDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
    object qryCCMestreAnalDATAINICIODEP: TDateTimeField
      FieldName = 'DATAINICIODEP'
    end
    object qryCCMestreAnalTAXADEP: TFloatField
      FieldName = 'TAXADEP'
    end
    object qryCCMestreAnalIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryCCMestreAnalIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
    end
    object qryCCMestreAnalVALHISTORICO: TFloatField
      FieldName = 'VALHISTORICO'
    end
    object qryCCMestreAnalNOMEFORN: TStringField
      FieldName = 'NOMEFORN'
      Size = 60
    end
    object qryCCMestreAnalCODGRUPO: TStringField
      FieldName = 'CODGRUPO'
      FixedChar = True
      Size = 15
    end
    object qryCCMestreAnalDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryCCMestreAnalTIPOGRUPO: TStringField
      FieldName = 'TIPOGRUPO'
      FixedChar = True
      Size = 1
    end
    object qryCCMestreAnalCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object qryCCMestreAnalDESCCCUSTO: TStringField
      FieldName = 'DESCCCUSTO'
      Size = 30
    end
    object qryCCMestreAnalTIPOCCUSTO: TStringField
      FieldName = 'TIPOCCUSTO'
      FixedChar = True
      Size = 1
    end
    object qryCCMestreAnalCODCLASSEBEM: TStringField
      FieldName = 'CODCLASSEBEM'
      FixedChar = True
      Size = 15
    end
    object qryCCMestreAnalDESCCLASSEBEM: TStringField
      FieldName = 'DESCCLASSEBEM'
      Size = 60
    end
    object qryCCMestreAnalTIPOCLASSEBEM: TStringField
      FieldName = 'TIPOCLASSEBEM'
      FixedChar = True
      Size = 1
    end
    object qryCCMestreAnalDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object qryCCMestreAnalDESCLOCAL: TStringField
      FieldName = 'DESCLOCAL'
      Size = 60
    end
    object qryCCMestreAnalNOMERESP: TStringField
      FieldName = 'NOMERESP'
      Size = 60
    end
    object qryCCMestreAnalCMBEM: TFloatField
      FieldName = 'CMBEM'
    end
    object qryCCMestreAnalVALORG: TFloatField
      FieldName = 'VALORG'
    end
    object qryCCMestreAnalDEPLANC: TFloatField
      FieldName = 'DEPLANC'
    end
    object qryCCMestreAnalCMDEP: TFloatField
      FieldName = 'CMDEP'
    end
    object qryCCMestreAnalVALORG0: TFloatField
      FieldName = 'VALORG0'
    end
    object qryCCMestreAnalVALREAVACUM0: TFloatField
      FieldName = 'VALREAVACUM0'
    end
    object qryCCMestreAnalCMBEMATU0: TFloatField
      FieldName = 'CMBEMATU0'
    end
    object qryCCMestreAnalCMBEMACUM0: TFloatField
      FieldName = 'CMBEMACUM0'
    end
    object qryCCMestreAnalDEPLANCATU0: TFloatField
      FieldName = 'DEPLANCATU0'
    end
    object qryCCMestreAnalDEPLANCACUM0: TFloatField
      FieldName = 'DEPLANCACUM0'
    end
    object qryCCMestreAnalCMDEPLANCACUM0: TFloatField
      FieldName = 'CMDEPLANCACUM0'
    end
    object qryCCMestreAnalVALCTB0: TFloatField
      FieldName = 'VALCTB0'
    end
    object qryCCMestreAnalVALULTREAVACUM1: TFloatField
      FieldName = 'VALULTREAVACUM1'
    end
    object qryCCMestreAnalVALULTCMREAVATU: TFloatField
      FieldName = 'VALULTCMREAVATU'
    end
    object qryCCMestreAnalVALULTCMREAVACUM1: TFloatField
      FieldName = 'VALULTCMREAVACUM1'
    end
    object qryCCMestreAnalVALULTDEPREAVATU: TFloatField
      FieldName = 'VALULTDEPREAVATU'
    end
    object qryCCMestreAnalVALULTDEPREAVACUM1: TFloatField
      FieldName = 'VALULTDEPREAVACUM1'
    end
    object qryCCMestreAnalVALULTCMDEPREAVACUM1: TFloatField
      FieldName = 'VALULTCMDEPREAVACUM1'
    end
    object qryCCMestreAnalVALCTB1: TFloatField
      FieldName = 'VALCTB1'
    end
    object qryCCMestreAnalSUMPARCREAV: TFloatField
      FieldName = 'SUMPARCREAV'
    end
    object qryCCMestreAnalSUMCMBEMATU: TFloatField
      FieldName = 'SUMCMBEMATU'
    end
    object qryCCMestreAnalSUMCMBEMACUM: TFloatField
      FieldName = 'SUMCMBEMACUM'
    end
    object qryCCMestreAnalSUMDEPATU: TFloatField
      FieldName = 'SUMDEPATU'
    end
    object qryCCMestreAnalSUMDEPACUM: TFloatField
      FieldName = 'SUMDEPACUM'
    end
    object qryCCMestreAnalSUMCMDEPACUM: TFloatField
      FieldName = 'SUMCMDEPACUM'
    end
    object qryCCMestreAnalVALORGREAV: TFloatField
      FieldName = 'VALORGREAV'
    end
    object qryCCMestreAnalCMBEMREAV: TFloatField
      FieldName = 'CMBEMREAV'
    end
    object qryCCMestreAnalDEPLANCREAV: TFloatField
      FieldName = 'DEPLANCREAV'
    end
    object qryCCMestreAnalCMDEPREAV: TFloatField
      FieldName = 'CMDEPREAV'
    end
    object qryCCMestreAnalVALORGULTREAV: TFloatField
      FieldName = 'VALORGULTREAV'
    end
    object qryCCMestreAnalCMBEMULTREAV: TFloatField
      FieldName = 'CMBEMULTREAV'
    end
    object qryCCMestreAnalDEPLANCULTREAV: TFloatField
      FieldName = 'DEPLANCULTREAV'
    end
    object qryCCMestreAnalCMDEPULTREAV: TFloatField
      FieldName = 'CMDEPULTREAV'
    end
    object qryCCMestreAnalSUMVALCTB: TFloatField
      FieldName = 'SUMVALCTB'
    end
    object qryCCMestreAnalSUMVALCTBIMOB: TFloatField
      FieldName = 'SUMVALCTBIMOB'
    end
  end
  object dsCCMestreAnal: TwwDataSource
    DataSet = qryCCMestreAnal
    Left = 368
    Top = 68
  end
  object pplCCMestreAnal: TppBDEPipeline
    DataSource = dsCCMestreAnal
    UserName = 'lCCMestreAnal'
    Left = 368
    Top = 80
  end
  object rptCCMestreAnal: TppReport
    AutoStop = False
    DataPipeline = pplCCMestreAnal
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
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 368
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplCCMestreAnal'
    object ppHeaderBand10: TppHeaderBand
      mmBottomOffset = 40
      mmHeight = 23548
      mmPrintPosition = 0
      object ppLabel71: TppLabel
        UserName = 'ppLabel71'
        AutoSize = False
        Caption = 'Custo Contábil por Imóvel Mestre (Analítico)'
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
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel72: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel72'
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
        mmTop = 1588
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'ppLabel73'
        Caption = 'Data de Referência:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 17198
        mmWidth = 29369
        BandType = 0
      end
      object rptCCMestreAnal_lblDataContabil: TppLabel
        UserName = 'rptCCMestreAnal_lblDataContabil'
        Caption = 'rptCCMestreAnal_lblDataContabil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 29633
        mmTop = 17198
        mmWidth = 41804
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 24606
      mmPrintPosition = 0
      object ppLabel74: TppLabel
        UserName = 'ppLabel74'
        Caption = 'Valor Contábil:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 53975
        mmTop = 794
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'ppDBText28'
        DataField = 'VALREAVACUM0'
        DataPipeline = pplCCMestreAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestreAnal'
        mmHeight = 3704
        mmLeft = 104511
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'ppDBText29'
        DataField = 'VALULTREAVACUM1'
        DataPipeline = pplCCMestreAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestreAnal'
        mmHeight = 3704
        mmLeft = 104511
        mmTop = 5821
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'ppDBText30'
        DataField = 'CMBEMATU0'
        DataPipeline = pplCCMestreAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestreAnal'
        mmHeight = 3704
        mmLeft = 128852
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'ppDBText31'
        DataField = 'CMBEMACUM0'
        DataPipeline = pplCCMestreAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestreAnal'
        mmHeight = 3704
        mmLeft = 153723
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'ppDBText32'
        DataField = 'DEPLANCATU0'
        DataPipeline = pplCCMestreAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestreAnal'
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'ppDBText33'
        DataField = 'VALULTDEPREAVATU'
        DataPipeline = pplCCMestreAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestreAnal'
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 5821
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'ppDBText34'
        DataField = 'CMDEPLANCACUM0'
        DataPipeline = pplCCMestreAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestreAnal'
        mmHeight = 3704
        mmLeft = 203465
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'ppDBText35'
        DataField = 'DEPLANCACUM0'
        DataPipeline = pplCCMestreAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestreAnal'
        mmHeight = 3704
        mmLeft = 228336
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'ppDBText36'
        DataField = 'VALULTDEPREAVACUM1'
        DataPipeline = pplCCMestreAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestreAnal'
        mmHeight = 3704
        mmLeft = 228336
        mmTop = 5821
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'ppDBText37'
        DataField = 'VALCTB0'
        DataPipeline = pplCCMestreAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestreAnal'
        mmHeight = 3704
        mmLeft = 253207
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'ppDBText38'
        DataField = 'VALCTB1'
        DataPipeline = pplCCMestreAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestreAnal'
        mmHeight = 3704
        mmLeft = 253207
        mmTop = 5821
        mmWidth = 23548
        BandType = 4
      end
      object ppLabel75: TppLabel
        UserName = 'ppLabel75'
        Caption = 'Reavaliação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 57679
        mmTop = 5821
        mmWidth = 17463
        BandType = 4
      end
      object ppLine21: TppLine
        UserName = 'ppLine21'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 52917
        mmTop = 10319
        mmWidth = 231511
        BandType = 4
      end
      object ppDBMemo12: TppDBMemo
        UserName = 'ppDBMemo12'
        CharWrap = True
        DataField = 'DESBEM'
        DataPipeline = pplCCMestreAnal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCMestreAnal'
        mmHeight = 18785
        mmLeft = 4763
        mmTop = 4233
        mmWidth = 45244
        BandType = 4
        mmBottomOffset = 40
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText39: TppDBText
        UserName = 'ppDBText39'
        DataField = 'VALULTCMDEPREAVACUM1'
        DataPipeline = pplCCMestreAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestreAnal'
        mmHeight = 3704
        mmLeft = 203465
        mmTop = 5821
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'ppDBText40'
        DataField = 'VALULTCMREAVACUM1'
        DataPipeline = pplCCMestreAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestreAnal'
        mmHeight = 3704
        mmLeft = 153723
        mmTop = 5821
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'ppDBText41'
        DataField = 'VALULTCMREAVATU'
        DataPipeline = pplCCMestreAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestreAnal'
        mmHeight = 3704
        mmLeft = 128852
        mmTop = 5821
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'ppDBText42'
        DataField = 'VALORG0'
        DataPipeline = pplCCMestreAnal
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestreAnal'
        mmHeight = 3704
        mmLeft = 79111
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object rptCustoContabilMestreDBText1: TppDBText
        UserName = 'rptCustoContabilMestreDBText1'
        DataField = 'PLACA'
        DataPipeline = pplCCMestreAnal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCCMestreAnal'
        mmHeight = 3704
        mmLeft = 4763
        mmTop = 794
        mmWidth = 45244
        BandType = 4
      end
    end
    object ppFooterBand10: TppFooterBand
      mmBottomOffset = 40
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine22: TppLine
        UserName = 'ppLine22'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel76: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel76'
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
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc19: TppSystemVariable
        UserName = 'Calc19'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 120386
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc20: TppSystemVariable
        UserName = 'ppCalc201'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 241300
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'IDMESTRE'
      DataPipeline = pplCCMestreAnal
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCCMestreAnal'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 40
        mmHeight = 9790
        mmPrintPosition = 0
        object ppLine23: TppLine
          UserName = 'ppLine23'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 8996
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel77: TppLabel
          UserName = 'ppLabel77'
          Caption = 'Imóvel Mestre:  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 529
          mmTop = 5292
          mmWidth = 23548
          BandType = 3
          GroupNo = 1
        end
        object ppDBText43: TppDBText
          UserName = 'ppDBText43'
          AutoSize = True
          DataField = 'NOMEMESTRE'
          DataPipeline = pplCCMestreAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplCCMestreAnal'
          mmHeight = 3175
          mmLeft = 23813
          mmTop = 5292
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 40
        mmHeight = 14817
        mmPrintPosition = 0
        object ppShape4: TppShape
          UserName = 'ppShape4'
          Pen.Width = 2
          mmHeight = 6085
          mmLeft = 38894
          mmTop = 3969
          mmWidth = 238919
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'ppDBCalc10'
          DataField = 'VALORG0'
          DataPipeline = pplCCMestreAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestreAnal'
          mmHeight = 3704
          mmLeft = 79111
          mmTop = 5027
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'ppDBCalc11'
          DataField = 'SUMPARCREAV'
          DataPipeline = pplCCMestreAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestreAnal'
          mmHeight = 3704
          mmLeft = 104511
          mmTop = 5027
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'ppDBCalc12'
          DataField = 'SUMCMBEMATU'
          DataPipeline = pplCCMestreAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestreAnal'
          mmHeight = 3704
          mmLeft = 128852
          mmTop = 5027
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'ppDBCalc13'
          DataField = 'SUMCMBEMACUM'
          DataPipeline = pplCCMestreAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestreAnal'
          mmHeight = 3704
          mmLeft = 153723
          mmTop = 5027
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'ppDBCalc14'
          DataField = 'SUMDEPATU'
          DataPipeline = pplCCMestreAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestreAnal'
          mmHeight = 3704
          mmLeft = 178594
          mmTop = 5027
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'ppDBCalc15'
          DataField = 'SUMCMDEPACUM'
          DataPipeline = pplCCMestreAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestreAnal'
          mmHeight = 3704
          mmLeft = 203465
          mmTop = 5027
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'ppDBCalc16'
          DataField = 'SUMDEPACUM'
          DataPipeline = pplCCMestreAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestreAnal'
          mmHeight = 3704
          mmLeft = 228336
          mmTop = 5027
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'ppDBCalc17'
          DataField = 'SUMVALCTB'
          DataPipeline = pplCCMestreAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestreAnal'
          mmHeight = 3704
          mmLeft = 253207
          mmTop = 5027
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppLabel78: TppLabel
          UserName = 'ppLabel78'
          Caption = 'Total do Imóvel Mestre:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 40746
          mmTop = 5027
          mmWidth = 34396
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'IXBGRUPO'
      DataPipeline = pplCCMestreAnal
      OutlineSettings.CreateNode = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCCMestreAnal'
      object ppGroupHeaderBand7: TppGroupHeaderBand
        mmBottomOffset = 40
        mmHeight = 15875
        mmPrintPosition = 0
        object ppLine24: TppLine
          UserName = 'ppLine24'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 4233
          mmTop = 5556
          mmWidth = 280194
          BandType = 3
          GroupNo = 2
        end
        object ppDBText44: TppDBText
          UserName = 'ppDBText44'
          AutoSize = True
          DataField = 'Grupo'
          DataPipeline = pplCCMestreAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplCCMestreAnal'
          mmHeight = 3175
          mmLeft = 15875
          mmTop = 2117
          mmWidth = 7673
          BandType = 3
          GroupNo = 1
        end
        object ppLabel79: TppLabel
          UserName = 'ppLabel79'
          Caption = 'Custo Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 81227
          mmTop = 8202
          mmWidth = 21431
          BandType = 3
          GroupNo = 1
        end
        object ppLabel80: TppLabel
          UserName = 'ppLabel80'
          Caption = 'Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 116946
          mmTop = 8202
          mmWidth = 10583
          BandType = 3
          GroupNo = 1
        end
        object ppLabel81: TppLabel
          UserName = 'ppLabel81'
          Caption = 'Reavaliação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 110861
          mmTop = 11642
          mmWidth = 16669
          BandType = 3
          GroupNo = 1
        end
        object ppLabel82: TppLabel
          UserName = 'ppLabel82'
          Caption = 'Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 94456
          mmTop = 11642
          mmWidth = 8202
          BandType = 3
          GroupNo = 1
        end
        object ppLabel83: TppLabel
          UserName = 'ppLabel83'
          Caption = 'Corr. Mon.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 137054
          mmTop = 8202
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
        object ppLabel84: TppLabel
          UserName = 'ppLabel84'
          Caption = 'no Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 141552
          mmTop = 11642
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppLabel85: TppLabel
          UserName = 'ppLabel85'
          Caption = 'Corr. Mon.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 161925
          mmTop = 8202
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
        object ppLabel86: TppLabel
          UserName = 'ppLabel86'
          Caption = 'Acumulada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 161132
          mmTop = 11642
          mmWidth = 16140
          BandType = 3
          GroupNo = 1
        end
        object ppLabel87: TppLabel
          UserName = 'ppLabel87'
          Caption = 'Custo Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 255323
          mmTop = 8202
          mmWidth = 21431
          BandType = 3
          GroupNo = 1
        end
        object ppLabel88: TppLabel
          UserName = 'ppLabel88'
          Caption = 'Depreciação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 234157
          mmTop = 8202
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
        object ppLabel89: TppLabel
          UserName = 'ppLabel89'
          Caption = 'Acumulada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 235744
          mmTop = 11642
          mmWidth = 16140
          BandType = 3
          GroupNo = 1
        end
        object ppLabel90: TppLabel
          UserName = 'ppLabel90'
          Caption = 'Depreciação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 209286
          mmTop = 11642
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
        object ppLabel91: TppLabel
          UserName = 'ppLabel91'
          Caption = 'Corr. Mon. da'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 207434
          mmTop = 8202
          mmWidth = 19579
          BandType = 3
          GroupNo = 1
        end
        object ppLabel92: TppLabel
          UserName = 'ppLabel92'
          Caption = 'No Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 191294
          mmTop = 11642
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppLabel93: TppLabel
          UserName = 'ppLabel93'
          Caption = 'Depreciação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 184415
          mmTop = 8202
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
        object ppLine25: TppLine
          UserName = 'ppLine25'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 4233
          mmTop = 15081
          mmWidth = 280194
          BandType = 3
          GroupNo = 1
        end
        object ppLabel94: TppLabel
          UserName = 'ppLabel94'
          Caption = 'Descrição do Bem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 4763
          mmTop = 11642
          mmWidth = 26194
          BandType = 3
          GroupNo = 1
        end
        object ppLabel95: TppLabel
          UserName = 'ppLabel95'
          Caption = 'Grupo:  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 4763
          mmTop = 2117
          mmWidth = 11377
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        mmBottomOffset = 40
        mmHeight = 9260
        mmPrintPosition = 0
        object ppDBCalc18: TppDBCalc
          UserName = 'ppDBCalc18'
          DataField = 'VALORG0'
          DataPipeline = pplCCMestreAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestreAnal'
          mmHeight = 3704
          mmLeft = 79111
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc19: TppDBCalc
          UserName = 'ppDBCalc19'
          DataField = 'SUMPARCREAV'
          DataPipeline = pplCCMestreAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestreAnal'
          mmHeight = 3704
          mmLeft = 104511
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc20: TppDBCalc
          UserName = 'ppDBCalc20'
          DataField = 'SUMCMBEMATU'
          DataPipeline = pplCCMestreAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestreAnal'
          mmHeight = 3704
          mmLeft = 128852
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc21: TppDBCalc
          UserName = 'ppDBCalc21'
          DataField = 'SUMCMBEMACUM'
          DataPipeline = pplCCMestreAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestreAnal'
          mmHeight = 3704
          mmLeft = 153723
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc22: TppDBCalc
          UserName = 'ppDBCalc22'
          DataField = 'SUMDEPATU'
          DataPipeline = pplCCMestreAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestreAnal'
          mmHeight = 3704
          mmLeft = 178594
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc23: TppDBCalc
          UserName = 'ppDBCalc23'
          DataField = 'SUMCMDEPACUM'
          DataPipeline = pplCCMestreAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestreAnal'
          mmHeight = 3704
          mmLeft = 203465
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc24: TppDBCalc
          UserName = 'ppDBCalc24'
          DataField = 'SUMDEPACUM'
          DataPipeline = pplCCMestreAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestreAnal'
          mmHeight = 3704
          mmLeft = 228336
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc25: TppDBCalc
          UserName = 'ppDBCalc25'
          DataField = 'SUMVALCTB'
          DataPipeline = pplCCMestreAnal
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestreAnal'
          mmHeight = 3704
          mmLeft = 253207
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 1
        end
        object ppLabel96: TppLabel
          UserName = 'ppLabel96'
          Caption = 'Total do Grupo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 52917
          mmTop = 1588
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object qryCCMestreSint: TwwQuery
    OnCalcFields = qryCCMestreSintCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   VW.IDIMOVEL, VW.NOME_MESTRE, VW.NOME_IMOVEL, VW.IMOVEL_EXTENS' +
        'O,'
      '   VW.IDBEM, VW.PLACA, VW.DESBEM, VW.IXBGRUPO,'
      ''
      '   VW.IMOCODIGO, VW.IMOMATRICULA,'
      ''
      '   VW.CODTIPIMOVEL, VW.DESCTIPOIMOVEL,'
      '   VW.FLGATIVO, VW.STATUS_IMOVEL, VW.FLGSTATUSOCUPACAO,'
      ''
      
        '   VW.IMOAREA, VW.IMOAREAGERENCIAL, VW.IMOFRACAOIDEAL, VW.IMOPER' +
        'CENTRATEIO,'
      ''
      
        '   VW.IMOMOEDACOMPRA, VW.IMOVLRCOMPRA, VW.IMODATACOMPRA, VW.MOED' +
        'A_COMPRA,'
      
        '   VW.IMOMOEDAREAVAL, VW.IMOVLRREAVAL, VW.IMODATAREAVAL, VW.MOED' +
        'A_REAVAL,'
      
        '   VW.IMOMOEDAMERCADO, VW.IMOVLRMERCADO, VW.IMODATAMERCADO, VW.M' +
        'OEDA_MERCADO,'
      ''
      '   VW.CONTROLE, VW.BAIXATOTAL, VW.DTAINCLUSAO,'
      
        '   VW.FLGDEPREC, VW.DATAULTDEP, VW.DATAINICIODEP, VW.TAXADEP, VW' +
        '.IDGRUPO,'
      '   VW.IDCLASSEBEM, VW.VALHISTORICO, VW.NOMEFORN,'
      ''
      '   VW.CODGRUPO, VW.DESCGRUPO, VW.TIPOGRUPO,'
      '   VW.CODCENTROCUSTO, VW.DESCCCUSTO, VW.TIPOCCUSTO,'
      '   VW.CODCLASSEBEM, VW.DESCCLASSEBEM, VW.TIPOCLASSEBEM,'
      '   VW.DESCCONJUNTO, VW.DESCLOCAL, VW.NOMERESP,'
      ''
      '   VWT.VALORG,'
      '   VWT.CMBEM,'
      '   VWT.DEPLANC,'
      '   VWT.CMDEP,'
      ''
      '   VWT.VALORGREAV,'
      '   VWT.CMBEMREAV,'
      '   VWT.DEPLANCREAV,'
      '   VWT.CMDEPREAV,'
      '   VWT.VALORGULTREAV,'
      '   VWT.CMBEMULTREAV,'
      '   VWT.DEPLANCULTREAV,'
      '   VWT.CMDEPULTREAV,'
      ''
      '   VWT.SUMVALCTB,'
      '   VWT.SUMVALCTBIMOB'
      ''
      'FROM'
      '   VWBEMXIMOVEL VW,'
      ''
      '   ('
      '   SELECT'
      '      SCB.IDBEM, SCB.DATASLDBEM,'
      ''
      '      SCB.VALORG,'
      '      SCB.CMBEM,'
      '      SCB.DEPLANC,'
      '      SCB.CMDEP,'
      '      SCB.REAVVALORG AS VALORGREAV,'
      '      SCB.REAVCMBEM AS CMBEMREAV,'
      '      SCB.REAVDEPLANC AS DEPLANCREAV,'
      '      SCB.REAVCMDEP AS CMDEPREAV,'
      '      SCB.ULTREAVVALORG AS VALORGULTREAV,'
      '      SCB.ULTREAVCMBEM AS CMBEMULTREAV,'
      '      SCB.ULTREAVDEPLANC AS DEPLANCULTREAV,'
      '      SCB.ULTREAVCMDEP CMDEPULTREAV,'
      '      ('
      '      SCB.VALORG + SCB.CMBEM - SCB.DEPLANC - SCB.CMDEP +'
      '      SCB.REAVVALORG + SCB.REAVCMBEM - SCB.REAVDEPLANC -'
      '      SCB.REAVCMDEP + SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM -'
      '      SCB.ULTREAVDEPLANC - SCB.ULTREAVCMDEP'
      '      ) AS SUMVALCTB,'
      '      ('
      '      SCB.VALORG + SCB.CMBEM + SCB.REAVVALORG +'
      '      SCB.REAVCMBEM + SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM'
      '      ) AS SUMVALCTBIMOB'
      ''
      '   FROM'
      '      SALDOCONTABBEM SCB, IMOVELXBEM IXB,'
      '      ('
      '      SELECT'
      '         IDBEM, MAX(DATASLDBEM) AS DATA'
      '      FROM'
      '         SALDOCONTABBEM'
      '      WHERE'
      '         ( (:PDATAMOV IS NULL) OR (DATASLDBEM <=:PDATAMOV) )'
      '      GROUP BY'
      '         IDBEM'
      '      ) DTAMAX'
      ''
      '   WHERE'
      '      ( (:PIDIMOVEL IS NULL) OR (IXB.IDIMOVEL =:PIDIMOVEL) )'
      '      AND ( SCB.DATASLDBEM = DTAMAX.DATA )'
      '      AND ( SCB.IDBEM = DTAMAX.IDBEM )'
      '      AND ( SCB.IDBEM = IXB.IDBEM )'
      '   ) VWT'
      ''
      'WHERE'
      
        '   ( (:PIDIMOVELMESTRE IS NULL) OR (VW.IDIMOVELMESTRE =:PIDIMOVE' +
        'LMESTRE) )'
      '   AND ( (:PIDIMOVEL IS NULL) OR (VW.IDIMOVEL =:PIDIMOVEL) )'
      '   AND ( (:PIDPESSOA IS NULL) OR (VW.IDPESSOA =:PIDPESSOA) )'
      '   AND ( VW.IDBEM = VWT.IDBEM )'
      ''
      'ORDER BY'
      '   VW.NOME_MESTRE, VW.DESBEM'
      ' ')
    ValidateWithMask = True
    Left = 472
    Top = 56
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryCCMestreSint_GRUPO: TStringField
      DisplayLabel = 'Grupo'
      FieldKind = fkCalculated
      FieldName = '_GRUPO'
      Size = 25
      Calculated = True
    end
    object qryCCMestreSintIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryCCMestreSintNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object qryCCMestreSintNOME_IMOVEL: TStringField
      FieldName = 'NOME_IMOVEL'
      Size = 60
    end
    object qryCCMestreSintIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryCCMestreSintIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryCCMestreSintPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryCCMestreSintDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryCCMestreSintIXBGRUPO: TStringField
      FieldName = 'IXBGRUPO'
      FixedChar = True
      Size = 1
    end
    object qryCCMestreSintIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object qryCCMestreSintIMOMATRICULA: TStringField
      FieldName = 'IMOMATRICULA'
    end
    object qryCCMestreSintCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryCCMestreSintDESCTIPOIMOVEL: TStringField
      FieldName = 'DESCTIPOIMOVEL'
      Size = 25
    end
    object qryCCMestreSintFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
    end
    object qryCCMestreSintSTATUS_IMOVEL: TStringField
      FieldName = 'STATUS_IMOVEL'
      FixedChar = True
      Size = 1
    end
    object qryCCMestreSintFLGSTATUSOCUPACAO: TStringField
      FieldName = 'FLGSTATUSOCUPACAO'
      FixedChar = True
      Size = 1
    end
    object qryCCMestreSintIMOAREA: TFloatField
      FieldName = 'IMOAREA'
    end
    object qryCCMestreSintIMOAREAGERENCIAL: TFloatField
      FieldName = 'IMOAREAGERENCIAL'
    end
    object qryCCMestreSintIMOFRACAOIDEAL: TFloatField
      FieldName = 'IMOFRACAOIDEAL'
    end
    object qryCCMestreSintIMOPERCENTRATEIO: TFloatField
      FieldName = 'IMOPERCENTRATEIO'
    end
    object qryCCMestreSintIMOMOEDACOMPRA: TFloatField
      FieldName = 'IMOMOEDACOMPRA'
    end
    object qryCCMestreSintIMOVLRCOMPRA: TFloatField
      FieldName = 'IMOVLRCOMPRA'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCMestreSintIMODATACOMPRA: TDateTimeField
      FieldName = 'IMODATACOMPRA'
    end
    object qryCCMestreSintMOEDA_COMPRA: TStringField
      FieldName = 'MOEDA_COMPRA'
      Size = 10
    end
    object qryCCMestreSintIMOMOEDAREAVAL: TFloatField
      FieldName = 'IMOMOEDAREAVAL'
    end
    object qryCCMestreSintIMOVLRREAVAL: TFloatField
      FieldName = 'IMOVLRREAVAL'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCMestreSintIMODATAREAVAL: TDateTimeField
      FieldName = 'IMODATAREAVAL'
    end
    object qryCCMestreSintMOEDA_REAVAL: TStringField
      FieldName = 'MOEDA_REAVAL'
      Size = 10
    end
    object qryCCMestreSintIMOMOEDAMERCADO: TFloatField
      FieldName = 'IMOMOEDAMERCADO'
    end
    object qryCCMestreSintIMOVLRMERCADO: TFloatField
      FieldName = 'IMOVLRMERCADO'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCMestreSintIMODATAMERCADO: TDateTimeField
      FieldName = 'IMODATAMERCADO'
    end
    object qryCCMestreSintMOEDA_MERCADO: TStringField
      FieldName = 'MOEDA_MERCADO'
      Size = 10
    end
    object qryCCMestreSintCONTROLE: TStringField
      FieldName = 'CONTROLE'
      FixedChar = True
      Size = 1
    end
    object qryCCMestreSintBAIXATOTAL: TStringField
      FieldName = 'BAIXATOTAL'
      FixedChar = True
      Size = 1
    end
    object qryCCMestreSintDTAINCLUSAO: TDateTimeField
      FieldName = 'DTAINCLUSAO'
    end
    object qryCCMestreSintFLGDEPREC: TFloatField
      FieldName = 'FLGDEPREC'
    end
    object qryCCMestreSintDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
    object qryCCMestreSintDATAINICIODEP: TDateTimeField
      FieldName = 'DATAINICIODEP'
    end
    object qryCCMestreSintTAXADEP: TFloatField
      FieldName = 'TAXADEP'
    end
    object qryCCMestreSintIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryCCMestreSintIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
    end
    object qryCCMestreSintVALHISTORICO: TFloatField
      FieldName = 'VALHISTORICO'
    end
    object qryCCMestreSintNOMEFORN: TStringField
      FieldName = 'NOMEFORN'
      Size = 60
    end
    object qryCCMestreSintCODGRUPO: TStringField
      FieldName = 'CODGRUPO'
      FixedChar = True
      Size = 15
    end
    object qryCCMestreSintDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryCCMestreSintTIPOGRUPO: TStringField
      FieldName = 'TIPOGRUPO'
      FixedChar = True
      Size = 1
    end
    object qryCCMestreSintCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object qryCCMestreSintDESCCCUSTO: TStringField
      FieldName = 'DESCCCUSTO'
      Size = 30
    end
    object qryCCMestreSintTIPOCCUSTO: TStringField
      FieldName = 'TIPOCCUSTO'
      FixedChar = True
      Size = 1
    end
    object qryCCMestreSintCODCLASSEBEM: TStringField
      FieldName = 'CODCLASSEBEM'
      FixedChar = True
      Size = 15
    end
    object qryCCMestreSintDESCCLASSEBEM: TStringField
      FieldName = 'DESCCLASSEBEM'
      Size = 60
    end
    object qryCCMestreSintTIPOCLASSEBEM: TStringField
      FieldName = 'TIPOCLASSEBEM'
      FixedChar = True
      Size = 1
    end
    object qryCCMestreSintDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object qryCCMestreSintDESCLOCAL: TStringField
      FieldName = 'DESCLOCAL'
      Size = 60
    end
    object qryCCMestreSintNOMERESP: TStringField
      FieldName = 'NOMERESP'
      Size = 60
    end
    object qryCCMestreSintCMBEM: TFloatField
      FieldName = 'CMBEM'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCMestreSintDEPLANC: TFloatField
      FieldName = 'DEPLANC'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCMestreSintCMDEP: TFloatField
      FieldName = 'CMDEP'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCMestreSintVALORGREAV: TFloatField
      FieldName = 'VALORGREAV'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCMestreSintCMBEMREAV: TFloatField
      FieldName = 'CMBEMREAV'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCMestreSintDEPLANCREAV: TFloatField
      FieldName = 'DEPLANCREAV'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCMestreSintCMDEPREAV: TFloatField
      FieldName = 'CMDEPREAV'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCMestreSintVALORGULTREAV: TFloatField
      FieldName = 'VALORGULTREAV'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCMestreSintCMBEMULTREAV: TFloatField
      FieldName = 'CMBEMULTREAV'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCMestreSintDEPLANCULTREAV: TFloatField
      FieldName = 'DEPLANCULTREAV'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCMestreSintCMDEPULTREAV: TFloatField
      FieldName = 'CMDEPULTREAV'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCMestreSintSUMVALCTB: TFloatField
      FieldName = 'SUMVALCTB'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCMestreSintSUMVALCTBIMOB: TFloatField
      FieldName = 'SUMVALCTBIMOB'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCMestreSintVALORG: TFloatField
      FieldName = 'VALORG'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
  end
  object dsCCMestreSint: TwwDataSource
    DataSet = qryCCMestreSint
    Left = 472
    Top = 68
  end
  object pplCCMestreSint: TppBDEPipeline
    DataSource = dsCCMestreSint
    UserName = 'lCCMestreSint'
    Left = 472
    Top = 80
    object pplCCMestreSintppField1: TppField
      FieldAlias = '_GRUPO'
      FieldName = '_GRUPO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplCCMestreSintppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplCCMestreSintppField3: TppField
      FieldAlias = 'NOME_MESTRE'
      FieldName = 'NOME_MESTRE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplCCMestreSintppField4: TppField
      FieldAlias = 'NOME_IMOVEL'
      FieldName = 'NOME_IMOVEL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplCCMestreSintppField5: TppField
      FieldAlias = 'IMOVEL_EXTENSO'
      FieldName = 'IMOVEL_EXTENSO'
      FieldLength = 123
      DisplayWidth = 123
      Position = 4
    end
    object pplCCMestreSintppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBEM'
      FieldName = 'IDBEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplCCMestreSintppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLACA'
      FieldName = 'PLACA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplCCMestreSintppField8: TppField
      FieldAlias = 'DESBEM'
      FieldName = 'DESBEM'
      FieldLength = 200
      DisplayWidth = 200
      Position = 7
    end
    object pplCCMestreSintppField9: TppField
      FieldAlias = 'IXBGRUPO'
      FieldName = 'IXBGRUPO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 8
    end
    object pplCCMestreSintppField10: TppField
      FieldAlias = 'IMOCODIGO'
      FieldName = 'IMOCODIGO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 9
    end
    object pplCCMestreSintppField11: TppField
      FieldAlias = 'IMOMATRICULA'
      FieldName = 'IMOMATRICULA'
      FieldLength = 20
      DisplayWidth = 20
      Position = 10
    end
    object pplCCMestreSintppField12: TppField
      FieldAlias = 'CODTIPIMOVEL'
      FieldName = 'CODTIPIMOVEL'
      FieldLength = 5
      DisplayWidth = 5
      Position = 11
    end
    object pplCCMestreSintppField13: TppField
      FieldAlias = 'DESCTIPOIMOVEL'
      FieldName = 'DESCTIPOIMOVEL'
      FieldLength = 25
      DisplayWidth = 25
      Position = 12
    end
    object pplCCMestreSintppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGATIVO'
      FieldName = 'FLGATIVO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplCCMestreSintppField15: TppField
      FieldAlias = 'STATUS_IMOVEL'
      FieldName = 'STATUS_IMOVEL'
      FieldLength = 1
      DisplayWidth = 1
      Position = 14
    end
    object pplCCMestreSintppField16: TppField
      FieldAlias = 'FLGSTATUSOCUPACAO'
      FieldName = 'FLGSTATUSOCUPACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
    end
    object pplCCMestreSintppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOAREA'
      FieldName = 'IMOAREA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplCCMestreSintppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOAREAGERENCIAL'
      FieldName = 'IMOAREAGERENCIAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplCCMestreSintppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOFRACAOIDEAL'
      FieldName = 'IMOFRACAOIDEAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplCCMestreSintppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOPERCENTRATEIO'
      FieldName = 'IMOPERCENTRATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplCCMestreSintppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOMOEDACOMPRA'
      FieldName = 'IMOMOEDACOMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplCCMestreSintppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOVLRCOMPRA'
      FieldName = 'IMOVLRCOMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplCCMestreSintppField23: TppField
      FieldAlias = 'IMODATACOMPRA'
      FieldName = 'IMODATACOMPRA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 22
    end
    object pplCCMestreSintppField24: TppField
      FieldAlias = 'MOEDA_COMPRA'
      FieldName = 'MOEDA_COMPRA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 23
    end
    object pplCCMestreSintppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOMOEDAREAVAL'
      FieldName = 'IMOMOEDAREAVAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplCCMestreSintppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOVLRREAVAL'
      FieldName = 'IMOVLRREAVAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplCCMestreSintppField27: TppField
      FieldAlias = 'IMODATAREAVAL'
      FieldName = 'IMODATAREAVAL'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 26
    end
    object pplCCMestreSintppField28: TppField
      FieldAlias = 'MOEDA_REAVAL'
      FieldName = 'MOEDA_REAVAL'
      FieldLength = 10
      DisplayWidth = 10
      Position = 27
    end
    object pplCCMestreSintppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOMOEDAMERCADO'
      FieldName = 'IMOMOEDAMERCADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object pplCCMestreSintppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOVLRMERCADO'
      FieldName = 'IMOVLRMERCADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object pplCCMestreSintppField31: TppField
      FieldAlias = 'IMODATAMERCADO'
      FieldName = 'IMODATAMERCADO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 30
    end
    object pplCCMestreSintppField32: TppField
      FieldAlias = 'MOEDA_MERCADO'
      FieldName = 'MOEDA_MERCADO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 31
    end
    object pplCCMestreSintppField33: TppField
      FieldAlias = 'CONTROLE'
      FieldName = 'CONTROLE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 32
    end
    object pplCCMestreSintppField34: TppField
      FieldAlias = 'BAIXATOTAL'
      FieldName = 'BAIXATOTAL'
      FieldLength = 1
      DisplayWidth = 1
      Position = 33
    end
    object pplCCMestreSintppField35: TppField
      FieldAlias = 'DTAINCLUSAO'
      FieldName = 'DTAINCLUSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 34
    end
    object pplCCMestreSintppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGDEPREC'
      FieldName = 'FLGDEPREC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object pplCCMestreSintppField37: TppField
      FieldAlias = 'DATAULTDEP'
      FieldName = 'DATAULTDEP'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 36
    end
    object pplCCMestreSintppField38: TppField
      FieldAlias = 'DATAINICIODEP'
      FieldName = 'DATAINICIODEP'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 37
    end
    object pplCCMestreSintppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'TAXADEP'
      FieldName = 'TAXADEP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 38
    end
    object pplCCMestreSintppField40: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDGRUPO'
      FieldName = 'IDGRUPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 39
    end
    object pplCCMestreSintppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCLASSEBEM'
      FieldName = 'IDCLASSEBEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 40
    end
    object pplCCMestreSintppField42: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALHISTORICO'
      FieldName = 'VALHISTORICO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 41
    end
    object pplCCMestreSintppField43: TppField
      FieldAlias = 'NOMEFORN'
      FieldName = 'NOMEFORN'
      FieldLength = 60
      DisplayWidth = 60
      Position = 42
    end
    object pplCCMestreSintppField44: TppField
      FieldAlias = 'CODGRUPO'
      FieldName = 'CODGRUPO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 43
    end
    object pplCCMestreSintppField45: TppField
      FieldAlias = 'DESCGRUPO'
      FieldName = 'DESCGRUPO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 44
    end
    object pplCCMestreSintppField46: TppField
      FieldAlias = 'TIPOGRUPO'
      FieldName = 'TIPOGRUPO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 45
    end
    object pplCCMestreSintppField47: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 46
    end
    object pplCCMestreSintppField48: TppField
      FieldAlias = 'DESCCCUSTO'
      FieldName = 'DESCCCUSTO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 47
    end
    object pplCCMestreSintppField49: TppField
      FieldAlias = 'TIPOCCUSTO'
      FieldName = 'TIPOCCUSTO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 48
    end
    object pplCCMestreSintppField50: TppField
      FieldAlias = 'CODCLASSEBEM'
      FieldName = 'CODCLASSEBEM'
      FieldLength = 15
      DisplayWidth = 15
      Position = 49
    end
    object pplCCMestreSintppField51: TppField
      FieldAlias = 'DESCCLASSEBEM'
      FieldName = 'DESCCLASSEBEM'
      FieldLength = 60
      DisplayWidth = 60
      Position = 50
    end
    object pplCCMestreSintppField52: TppField
      FieldAlias = 'TIPOCLASSEBEM'
      FieldName = 'TIPOCLASSEBEM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 51
    end
    object pplCCMestreSintppField53: TppField
      FieldAlias = 'DESCCONJUNTO'
      FieldName = 'DESCCONJUNTO'
      FieldLength = 200
      DisplayWidth = 200
      Position = 52
    end
    object pplCCMestreSintppField54: TppField
      FieldAlias = 'DESCLOCAL'
      FieldName = 'DESCLOCAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 53
    end
    object pplCCMestreSintppField55: TppField
      FieldAlias = 'NOMERESP'
      FieldName = 'NOMERESP'
      FieldLength = 60
      DisplayWidth = 60
      Position = 54
    end
    object pplCCMestreSintppField56: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMBEM'
      FieldName = 'CMBEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 55
    end
    object pplCCMestreSintppField57: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEPLANC'
      FieldName = 'DEPLANC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 56
    end
    object pplCCMestreSintppField58: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMDEP'
      FieldName = 'CMDEP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 57
    end
    object pplCCMestreSintppField59: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORGREAV'
      FieldName = 'VALORGREAV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 58
    end
    object pplCCMestreSintppField60: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMBEMREAV'
      FieldName = 'CMBEMREAV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 59
    end
    object pplCCMestreSintppField61: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEPLANCREAV'
      FieldName = 'DEPLANCREAV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 60
    end
    object pplCCMestreSintppField62: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMDEPREAV'
      FieldName = 'CMDEPREAV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 61
    end
    object pplCCMestreSintppField63: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORGULTREAV'
      FieldName = 'VALORGULTREAV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 62
    end
    object pplCCMestreSintppField64: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMBEMULTREAV'
      FieldName = 'CMBEMULTREAV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 63
    end
    object pplCCMestreSintppField65: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEPLANCULTREAV'
      FieldName = 'DEPLANCULTREAV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 64
    end
    object pplCCMestreSintppField66: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMDEPULTREAV'
      FieldName = 'CMDEPULTREAV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 65
    end
    object pplCCMestreSintppField67: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMVALCTB'
      FieldName = 'SUMVALCTB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 66
    end
    object pplCCMestreSintppField68: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMVALCTBIMOB'
      FieldName = 'SUMVALCTBIMOB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 67
    end
    object pplCCMestreSintppField69: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORG'
      FieldName = 'VALORG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 68
    end
  end
  object rptCCMestreSint: TppReport
    AutoStop = False
    DataPipeline = pplCCMestreSint
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 472
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplCCMestreSint'
    object ppHeaderBand20: TppHeaderBand
      mmBottomOffset = 40
      mmHeight = 23548
      mmPrintPosition = 0
      object ppLabel188: TppLabel
        UserName = 'ppLabel188'
        AutoSize = False
        Caption = 'Custo Contábil por Imóvel Mestre (Sintético)'
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
      object ppLabel189: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel189'
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
        mmTop = 1588
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel195: TppLabel
        UserName = 'ppLabel195'
        Caption = 'Data de Referência:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 17198
        mmWidth = 28046
        BandType = 0
      end
      object rptCCMestreSint_lblDataContabil: TppLabel
        UserName = 'rptCCMestreSint_lblDataContabil'
        Caption = 'rptCCMestreSint_lblDataContabil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 29104
        mmTop = 17198
        mmWidth = 40217
        BandType = 0
      end
    end
    object ppDetailBand20: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 19315
      mmPrintPosition = 0
      object ppDBText79: TppDBText
        UserName = 'ppDBText79'
        DataField = 'SUMVALCTB'
        DataPipeline = pplCCMestreSint
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestreSint'
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object ppLine63: TppLine
        UserName = 'ppLine63'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 2117
        mmTop = 0
        mmWidth = 195263
        BandType = 4
      end
      object ppDBMemo25: TppDBMemo
        UserName = 'ppDBMemo25'
        CharWrap = True
        DataField = 'DESBEM'
        DataPipeline = pplCCMestreSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCCMestreSint'
        mmHeight = 17463
        mmLeft = 65617
        mmTop = 794
        mmWidth = 79640
        BandType = 4
        mmBottomOffset = 529
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText80: TppDBText
        UserName = 'ppDBText80'
        DataField = 'VALORG'
        DataPipeline = pplCCMestreSint
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestreSint'
        mmHeight = 3704
        mmLeft = 146050
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText82: TppDBText
        UserName = 'ppDBText82'
        DataField = 'PLACA'
        DataPipeline = pplCCMestreSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCCMestreSint'
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 794
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'Grupo'
        DataPipeline = pplCCMestreSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCCMestreSint'
        mmHeight = 3704
        mmLeft = 27252
        mmTop = 794
        mmWidth = 36513
        BandType = 4
      end
    end
    object ppFooterBand20: TppFooterBand
      mmBottomOffset = 40
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine65: TppLine
        UserName = 'ppLine65'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 196770
        BandType = 8
      end
      object ppLabel196: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel196'
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
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc38: TppSystemVariable
        UserName = 'Calc38'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 76994
        mmTop = 3440
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc39: TppSystemVariable
        UserName = 'Calc39'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 151077
        mmTop = 3440
        mmWidth = 35454
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 40
      mmHeight = 25929
      mmPrintPosition = 0
      object ppShape11: TppShape
        UserName = 'ppShape11'
        Pen.Width = 2
        mmHeight = 6085
        mmLeft = 136525
        mmTop = 10583
        mmWidth = 51329
        BandType = 7
      end
      object ppDBCalc39: TppDBCalc
        UserName = 'ppDBCalc39'
        DataField = 'VALORG0'
        DataPipeline = pplCCMestreSint
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestreSint'
        mmHeight = 3704
        mmLeft = 137584
        mmTop = 11642
        mmWidth = 23548
        BandType = 7
      end
      object ppDBCalc40: TppDBCalc
        UserName = 'ppDBCalc40'
        DataField = 'SUMVALCTB'
        DataPipeline = pplCCMestreSint
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCMestreSint'
        mmHeight = 3704
        mmLeft = 162984
        mmTop = 11642
        mmWidth = 23548
        BandType = 7
      end
      object ppLabel198: TppLabel
        UserName = 'ppLabel198'
        Caption = 'TOTAL GERAL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 114829
        mmTop = 11642
        mmWidth = 20638
        BandType = 7
      end
      object ppLine66: TppLine
        UserName = 'ppLine66'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 5556
        mmWidth = 196770
        BandType = 7
      end
    end
    object rptCCMestreSintGroup1: TppGroup
      BreakName = 'IDMESTRE'
      DataPipeline = pplCCMestreSint
      OutlineSettings.CreateNode = True
      UserName = 'rptCCMestreSintGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCCMestreSint'
      object rptCCMestreSintGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 40
        mmHeight = 18256
        mmPrintPosition = 0
        object ppLine67: TppLine
          UserName = 'ppLine67'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 8467
          mmWidth = 196770
          BandType = 3
          GroupNo = 1
        end
        object ppLabel199: TppLabel
          UserName = 'ppLabel199'
          Caption = 'Imóvel Mestre:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 4763
          mmWidth = 21960
          BandType = 3
          GroupNo = 1
        end
        object ppDBText83: TppDBText
          UserName = 'ppDBText83'
          AutoSize = True
          DataField = 'NOMEMESTRE'
          DataPipeline = pplCCMestreSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplCCMestreSint'
          mmHeight = 3175
          mmLeft = 23283
          mmTop = 4763
          mmWidth = 20108
          BandType = 3
          GroupNo = 1
        end
        object ppLabel200: TppLabel
          UserName = 'ppLabel200'
          Caption = 'Custo Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 149754
          mmTop = 10583
          mmWidth = 19844
          BandType = 3
          GroupNo = 1
        end
        object ppLabel201: TppLabel
          UserName = 'ppLabel201'
          Caption = 'Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 161925
          mmTop = 14023
          mmWidth = 7673
          BandType = 3
          GroupNo = 1
        end
        object ppLabel203: TppLabel
          UserName = 'ppLabel203'
          Caption = 'Nº Tombamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2117
          mmTop = 14023
          mmWidth = 21167
          BandType = 3
          GroupNo = 1
        end
        object ppLabel204: TppLabel
          UserName = 'ppLabel204'
          Caption = 'Custo Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 175155
          mmTop = 14023
          mmWidth = 19844
          BandType = 3
          GroupNo = 1
        end
        object ppLine68: TppLine
          UserName = 'ppLine68'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 2117
          mmTop = 17463
          mmWidth = 195263
          BandType = 3
          GroupNo = 1
        end
        object ppLabel205: TppLabel
          UserName = 'ppLabel205'
          Caption = 'Descrição do Bem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 65617
          mmTop = 14023
          mmWidth = 24077
          BandType = 3
          GroupNo = 1
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 27252
          mmTop = 14023
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
      end
      object rptCCMestreSintGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 40
        mmHeight = 18785
        mmPrintPosition = 0
        object ppShape12: TppShape
          UserName = 'ppShape12'
          Pen.Width = 2
          mmHeight = 6085
          mmLeft = 144992
          mmTop = 4233
          mmWidth = 51329
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc41: TppDBCalc
          UserName = 'ppDBCalc41'
          DataField = 'VALORG0'
          DataPipeline = pplCCMestreSint
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCCMestreSintGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestreSint'
          mmHeight = 3704
          mmLeft = 146050
          mmTop = 5292
          mmWidth = 23548
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc42: TppDBCalc
          UserName = 'ppDBCalc42'
          DataField = 'SUMVALCTB'
          DataPipeline = pplCCMestreSint
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCCMestreSintGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCMestreSint'
          mmHeight = 3704
          mmLeft = 171450
          mmTop = 5292
          mmWidth = 23548
          BandType = 5
          GroupNo = 1
        end
        object ppLabel206: TppLabel
          UserName = 'ppLabel206'
          Caption = 'Total do Imóvel Mestre:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 112713
          mmTop = 5292
          mmWidth = 31221
          BandType = 5
          GroupNo = 1
        end
        object ppLine69: TppLine
          UserName = 'ppLine69'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 2117
          mmTop = 0
          mmWidth = 195263
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object qryCCImovelSint: TwwQuery
    OnCalcFields = qryCCImovelSintCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   VW.IDIMOVEL, VW.NOME_MESTRE, VW.NOME_IMOVEL, VW.IMOVEL_EXTENS' +
        'O,'
      '   VW.IDBEM, VW.PLACA, VW.DESBEM, VW.IXBGRUPO,'
      ''
      '   VW.IMOCODIGO, VW.IMOMATRICULA,'
      ''
      '   VW.CODTIPIMOVEL, VW.DESCTIPOIMOVEL,'
      '   VW.FLGATIVO, VW.STATUS_IMOVEL, VW.FLGSTATUSOCUPACAO,'
      ''
      
        '   VW.IMOAREA, VW.IMOAREAGERENCIAL, VW.IMOFRACAOIDEAL, VW.IMOPER' +
        'CENTRATEIO,'
      ''
      
        '   VW.IMOMOEDACOMPRA, VW.IMOVLRCOMPRA, VW.IMODATACOMPRA, VW.MOED' +
        'A_COMPRA,'
      
        '   VW.IMOMOEDAREAVAL, VW.IMOVLRREAVAL, VW.IMODATAREAVAL, VW.MOED' +
        'A_REAVAL,'
      
        '   VW.IMOMOEDAMERCADO, VW.IMOVLRMERCADO, VW.IMODATAMERCADO, VW.M' +
        'OEDA_MERCADO,'
      ''
      '   VW.CONTROLE, VW.BAIXATOTAL, VW.DTAINCLUSAO,'
      
        '   VW.FLGDEPREC, VW.DATAULTDEP, VW.DATAINICIODEP, VW.TAXADEP, VW' +
        '.IDGRUPO,'
      '   VW.IDCLASSEBEM, VW.VALHISTORICO, VW.NOMEFORN,'
      ''
      '   VW.CODGRUPO, VW.DESCGRUPO, VW.TIPOGRUPO,'
      '   VW.CODCENTROCUSTO, VW.DESCCCUSTO, VW.TIPOCCUSTO,'
      '   VW.CODCLASSEBEM, VW.DESCCLASSEBEM, VW.TIPOCLASSEBEM,'
      '   VW.DESCCONJUNTO, VW.DESCLOCAL, VW.NOMERESP,'
      ''
      '   VWT.CMBEM,'
      '   VWT.VALORG,'
      '   VWT.DEPLANC,'
      '   VWT.CMDEP,'
      ''
      '   VWT.VALORGREAV,'
      '   VWT.CMBEMREAV,'
      '   VWT.DEPLANCREAV,'
      '   VWT.CMDEPREAV,'
      '   VWT.VALORGULTREAV,'
      '   VWT.CMBEMULTREAV,'
      '   VWT.DEPLANCULTREAV,'
      '   VWT.CMDEPULTREAV,'
      ''
      '   VWT.SUMVALCTB,'
      '   VWT.SUMVALCTBIMOB'
      ''
      'FROM'
      '   VWBEMXIMOVEL VW,'
      ''
      '   ('
      '   SELECT'
      '      SCB.IDBEM, SCB.DATASLDBEM,'
      ''
      '      SCB.VALORG,'
      '      SCB.CMBEM,'
      '      SCB.DEPLANC,'
      '      SCB.CMDEP,'
      '      SCB.REAVVALORG AS VALORGREAV,'
      '      SCB.REAVCMBEM AS CMBEMREAV,'
      '      SCB.REAVDEPLANC AS DEPLANCREAV,'
      '      SCB.REAVCMDEP AS CMDEPREAV,'
      '      SCB.ULTREAVVALORG AS VALORGULTREAV,'
      '      SCB.ULTREAVCMBEM AS CMBEMULTREAV,'
      '      SCB.ULTREAVDEPLANC AS DEPLANCULTREAV,'
      '      SCB.ULTREAVCMDEP CMDEPULTREAV,'
      '      ('
      '      SCB.VALORG + SCB.CMBEM - SCB.DEPLANC - SCB.CMDEP +'
      '      SCB.REAVVALORG + SCB.REAVCMBEM - SCB.REAVDEPLANC -'
      '      SCB.REAVCMDEP + SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM -'
      '      SCB.ULTREAVDEPLANC - SCB.ULTREAVCMDEP'
      '      ) AS SUMVALCTB,'
      '      ('
      '      SCB.VALORG + SCB.CMBEM + SCB.REAVVALORG +'
      '      SCB.REAVCMBEM + SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM'
      '      ) AS SUMVALCTBIMOB'
      ''
      '   FROM'
      '      SALDOCONTABBEM SCB, IMOVELXBEM IXB,'
      '      ('
      '      SELECT'
      '         IDBEM, MAX(DATASLDBEM) AS DATA'
      '      FROM'
      '         SALDOCONTABBEM'
      '      WHERE'
      '         ( (:PDATAMOV IS NULL) OR (DATASLDBEM <=:PDATAMOV) )'
      '      GROUP BY'
      '         IDBEM'
      '      ) DTAMAX'
      ''
      '   WHERE'
      '      ( (:PIDIMOVEL IS NULL) OR (IXB.IDIMOVEL =:PIDIMOVEL) )'
      '      AND ( SCB.DATASLDBEM = DTAMAX.DATA )'
      '      AND ( SCB.IDBEM = DTAMAX.IDBEM )'
      '      AND ( SCB.IDBEM = IXB.IDBEM )'
      '   ) VWT'
      ''
      'WHERE'
      
        '   ( (:PIDIMOVELMESTRE IS NULL) OR (VW.IDIMOVELMESTRE =:PIDIMOVE' +
        'LMESTRE) )'
      '   AND ( (:PIDIMOVEL IS NULL) OR (VW.IDIMOVEL =:PIDIMOVEL) )'
      '   AND ( (:PIDPESSOA IS NULL) OR (VW.IDPESSOA =:PIDPESSOA) )'
      '   AND ( VW.IDBEM = VWT.IDBEM )'
      ''
      'ORDER BY'
      '   VW.NOME_MESTRE, VW.NOME_IMOVEL, VW.DESBEM')
    ValidateWithMask = True
    Left = 160
    Top = 56
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVELMESTRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryCCImovelSint_GRUPO: TStringField
      DisplayLabel = 'Grupo'
      FieldKind = fkCalculated
      FieldName = '_GRUPO'
      Size = 25
      Calculated = True
    end
    object qryCCImovelSintIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryCCImovelSintNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object qryCCImovelSintNOME_IMOVEL: TStringField
      FieldName = 'NOME_IMOVEL'
      Size = 60
    end
    object qryCCImovelSintIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryCCImovelSintIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryCCImovelSintPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryCCImovelSintDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryCCImovelSintIXBGRUPO: TStringField
      FieldName = 'IXBGRUPO'
      FixedChar = True
      Size = 1
    end
    object qryCCImovelSintIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object qryCCImovelSintIMOMATRICULA: TStringField
      FieldName = 'IMOMATRICULA'
    end
    object qryCCImovelSintCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryCCImovelSintDESCTIPOIMOVEL: TStringField
      FieldName = 'DESCTIPOIMOVEL'
      Size = 25
    end
    object qryCCImovelSintFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
    end
    object qryCCImovelSintSTATUS_IMOVEL: TStringField
      FieldName = 'STATUS_IMOVEL'
      FixedChar = True
      Size = 1
    end
    object qryCCImovelSintFLGSTATUSOCUPACAO: TStringField
      FieldName = 'FLGSTATUSOCUPACAO'
      FixedChar = True
      Size = 1
    end
    object qryCCImovelSintIMOAREA: TFloatField
      FieldName = 'IMOAREA'
    end
    object qryCCImovelSintIMOAREAGERENCIAL: TFloatField
      FieldName = 'IMOAREAGERENCIAL'
    end
    object qryCCImovelSintIMOFRACAOIDEAL: TFloatField
      FieldName = 'IMOFRACAOIDEAL'
    end
    object qryCCImovelSintIMOPERCENTRATEIO: TFloatField
      FieldName = 'IMOPERCENTRATEIO'
    end
    object qryCCImovelSintIMOMOEDACOMPRA: TFloatField
      FieldName = 'IMOMOEDACOMPRA'
    end
    object qryCCImovelSintIMOVLRCOMPRA: TFloatField
      FieldName = 'IMOVLRCOMPRA'
    end
    object qryCCImovelSintIMODATACOMPRA: TDateTimeField
      FieldName = 'IMODATACOMPRA'
    end
    object qryCCImovelSintMOEDA_COMPRA: TStringField
      FieldName = 'MOEDA_COMPRA'
      Size = 10
    end
    object qryCCImovelSintIMOMOEDAREAVAL: TFloatField
      FieldName = 'IMOMOEDAREAVAL'
    end
    object qryCCImovelSintIMOVLRREAVAL: TFloatField
      FieldName = 'IMOVLRREAVAL'
    end
    object qryCCImovelSintIMODATAREAVAL: TDateTimeField
      FieldName = 'IMODATAREAVAL'
    end
    object qryCCImovelSintMOEDA_REAVAL: TStringField
      FieldName = 'MOEDA_REAVAL'
      Size = 10
    end
    object qryCCImovelSintIMOMOEDAMERCADO: TFloatField
      FieldName = 'IMOMOEDAMERCADO'
    end
    object qryCCImovelSintIMOVLRMERCADO: TFloatField
      FieldName = 'IMOVLRMERCADO'
    end
    object qryCCImovelSintIMODATAMERCADO: TDateTimeField
      FieldName = 'IMODATAMERCADO'
    end
    object qryCCImovelSintMOEDA_MERCADO: TStringField
      FieldName = 'MOEDA_MERCADO'
      Size = 10
    end
    object qryCCImovelSintCONTROLE: TStringField
      FieldName = 'CONTROLE'
      FixedChar = True
      Size = 1
    end
    object qryCCImovelSintBAIXATOTAL: TStringField
      FieldName = 'BAIXATOTAL'
      FixedChar = True
      Size = 1
    end
    object qryCCImovelSintDTAINCLUSAO: TDateTimeField
      FieldName = 'DTAINCLUSAO'
    end
    object qryCCImovelSintFLGDEPREC: TFloatField
      FieldName = 'FLGDEPREC'
    end
    object qryCCImovelSintDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
    object qryCCImovelSintDATAINICIODEP: TDateTimeField
      FieldName = 'DATAINICIODEP'
    end
    object qryCCImovelSintTAXADEP: TFloatField
      FieldName = 'TAXADEP'
    end
    object qryCCImovelSintIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryCCImovelSintIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
    end
    object qryCCImovelSintVALHISTORICO: TFloatField
      FieldName = 'VALHISTORICO'
    end
    object qryCCImovelSintNOMEFORN: TStringField
      FieldName = 'NOMEFORN'
      Size = 60
    end
    object qryCCImovelSintCODGRUPO: TStringField
      FieldName = 'CODGRUPO'
      FixedChar = True
      Size = 15
    end
    object qryCCImovelSintDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryCCImovelSintTIPOGRUPO: TStringField
      FieldName = 'TIPOGRUPO'
      FixedChar = True
      Size = 1
    end
    object qryCCImovelSintCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object qryCCImovelSintDESCCCUSTO: TStringField
      FieldName = 'DESCCCUSTO'
      Size = 30
    end
    object qryCCImovelSintTIPOCCUSTO: TStringField
      FieldName = 'TIPOCCUSTO'
      FixedChar = True
      Size = 1
    end
    object qryCCImovelSintCODCLASSEBEM: TStringField
      FieldName = 'CODCLASSEBEM'
      FixedChar = True
      Size = 15
    end
    object qryCCImovelSintDESCCLASSEBEM: TStringField
      FieldName = 'DESCCLASSEBEM'
      Size = 60
    end
    object qryCCImovelSintTIPOCLASSEBEM: TStringField
      FieldName = 'TIPOCLASSEBEM'
      FixedChar = True
      Size = 1
    end
    object qryCCImovelSintDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object qryCCImovelSintDESCLOCAL: TStringField
      FieldName = 'DESCLOCAL'
      Size = 60
    end
    object qryCCImovelSintNOMERESP: TStringField
      FieldName = 'NOMERESP'
      Size = 60
    end
    object qryCCImovelSintCMBEM: TFloatField
      FieldName = 'CMBEM'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCImovelSintVALORG: TFloatField
      FieldName = 'VALORG'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCImovelSintDEPLANC: TFloatField
      FieldName = 'DEPLANC'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCImovelSintCMDEP: TFloatField
      FieldName = 'CMDEP'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCImovelSintVALORGREAV: TFloatField
      FieldName = 'VALORGREAV'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCImovelSintCMBEMREAV: TFloatField
      FieldName = 'CMBEMREAV'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCImovelSintDEPLANCREAV: TFloatField
      FieldName = 'DEPLANCREAV'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCImovelSintCMDEPREAV: TFloatField
      FieldName = 'CMDEPREAV'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCImovelSintVALORGULTREAV: TFloatField
      FieldName = 'VALORGULTREAV'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCImovelSintCMBEMULTREAV: TFloatField
      FieldName = 'CMBEMULTREAV'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCImovelSintDEPLANCULTREAV: TFloatField
      FieldName = 'DEPLANCULTREAV'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCImovelSintCMDEPULTREAV: TFloatField
      FieldName = 'CMDEPULTREAV'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCImovelSintSUMVALCTB: TFloatField
      FieldName = 'SUMVALCTB'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
    object qryCCImovelSintSUMVALCTBIMOB: TFloatField
      FieldName = 'SUMVALCTBIMOB'
      DisplayFormat = '#,##0.00;(#,##0.00)'
      EditFormat = '#,##0.00;(#,##0.00)'
    end
  end
  object dsCCImovelSint: TwwDataSource
    DataSet = qryCCImovelSint
    Left = 160
    Top = 68
  end
  object pplCCImovelSint: TppBDEPipeline
    DataSource = dsCCImovelSint
    UserName = 'lCCImovelSint'
    Left = 160
    Top = 80
    object pplCCImovelSintppField1: TppField
      FieldAlias = '_GRUPO'
      FieldName = '_GRUPO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplCCImovelSintppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplCCImovelSintppField3: TppField
      FieldAlias = 'NOME_MESTRE'
      FieldName = 'NOME_MESTRE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplCCImovelSintppField4: TppField
      FieldAlias = 'NOME_IMOVEL'
      FieldName = 'NOME_IMOVEL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplCCImovelSintppField5: TppField
      FieldAlias = 'IMOVEL_EXTENSO'
      FieldName = 'IMOVEL_EXTENSO'
      FieldLength = 123
      DisplayWidth = 123
      Position = 4
    end
    object pplCCImovelSintppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBEM'
      FieldName = 'IDBEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplCCImovelSintppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLACA'
      FieldName = 'PLACA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplCCImovelSintppField8: TppField
      FieldAlias = 'DESBEM'
      FieldName = 'DESBEM'
      FieldLength = 200
      DisplayWidth = 200
      Position = 7
    end
    object pplCCImovelSintppField9: TppField
      FieldAlias = 'IXBGRUPO'
      FieldName = 'IXBGRUPO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 8
    end
    object pplCCImovelSintppField10: TppField
      FieldAlias = 'IMOCODIGO'
      FieldName = 'IMOCODIGO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 9
    end
    object pplCCImovelSintppField11: TppField
      FieldAlias = 'IMOMATRICULA'
      FieldName = 'IMOMATRICULA'
      FieldLength = 20
      DisplayWidth = 20
      Position = 10
    end
    object pplCCImovelSintppField12: TppField
      FieldAlias = 'CODTIPIMOVEL'
      FieldName = 'CODTIPIMOVEL'
      FieldLength = 5
      DisplayWidth = 5
      Position = 11
    end
    object pplCCImovelSintppField13: TppField
      FieldAlias = 'DESCTIPOIMOVEL'
      FieldName = 'DESCTIPOIMOVEL'
      FieldLength = 25
      DisplayWidth = 25
      Position = 12
    end
    object pplCCImovelSintppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGATIVO'
      FieldName = 'FLGATIVO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplCCImovelSintppField15: TppField
      FieldAlias = 'STATUS_IMOVEL'
      FieldName = 'STATUS_IMOVEL'
      FieldLength = 1
      DisplayWidth = 1
      Position = 14
    end
    object pplCCImovelSintppField16: TppField
      FieldAlias = 'FLGSTATUSOCUPACAO'
      FieldName = 'FLGSTATUSOCUPACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
    end
    object pplCCImovelSintppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOAREA'
      FieldName = 'IMOAREA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplCCImovelSintppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOAREAGERENCIAL'
      FieldName = 'IMOAREAGERENCIAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplCCImovelSintppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOFRACAOIDEAL'
      FieldName = 'IMOFRACAOIDEAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplCCImovelSintppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOPERCENTRATEIO'
      FieldName = 'IMOPERCENTRATEIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplCCImovelSintppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOMOEDACOMPRA'
      FieldName = 'IMOMOEDACOMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplCCImovelSintppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOVLRCOMPRA'
      FieldName = 'IMOVLRCOMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplCCImovelSintppField23: TppField
      FieldAlias = 'IMODATACOMPRA'
      FieldName = 'IMODATACOMPRA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 22
    end
    object pplCCImovelSintppField24: TppField
      FieldAlias = 'MOEDA_COMPRA'
      FieldName = 'MOEDA_COMPRA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 23
    end
    object pplCCImovelSintppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOMOEDAREAVAL'
      FieldName = 'IMOMOEDAREAVAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplCCImovelSintppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOVLRREAVAL'
      FieldName = 'IMOVLRREAVAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplCCImovelSintppField27: TppField
      FieldAlias = 'IMODATAREAVAL'
      FieldName = 'IMODATAREAVAL'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 26
    end
    object pplCCImovelSintppField28: TppField
      FieldAlias = 'MOEDA_REAVAL'
      FieldName = 'MOEDA_REAVAL'
      FieldLength = 10
      DisplayWidth = 10
      Position = 27
    end
    object pplCCImovelSintppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOMOEDAMERCADO'
      FieldName = 'IMOMOEDAMERCADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object pplCCImovelSintppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMOVLRMERCADO'
      FieldName = 'IMOVLRMERCADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object pplCCImovelSintppField31: TppField
      FieldAlias = 'IMODATAMERCADO'
      FieldName = 'IMODATAMERCADO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 30
    end
    object pplCCImovelSintppField32: TppField
      FieldAlias = 'MOEDA_MERCADO'
      FieldName = 'MOEDA_MERCADO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 31
    end
    object pplCCImovelSintppField33: TppField
      FieldAlias = 'CONTROLE'
      FieldName = 'CONTROLE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 32
    end
    object pplCCImovelSintppField34: TppField
      FieldAlias = 'BAIXATOTAL'
      FieldName = 'BAIXATOTAL'
      FieldLength = 1
      DisplayWidth = 1
      Position = 33
    end
    object pplCCImovelSintppField35: TppField
      FieldAlias = 'DTAINCLUSAO'
      FieldName = 'DTAINCLUSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 34
    end
    object pplCCImovelSintppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGDEPREC'
      FieldName = 'FLGDEPREC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object pplCCImovelSintppField37: TppField
      FieldAlias = 'DATAULTDEP'
      FieldName = 'DATAULTDEP'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 36
    end
    object pplCCImovelSintppField38: TppField
      FieldAlias = 'DATAINICIODEP'
      FieldName = 'DATAINICIODEP'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 37
    end
    object pplCCImovelSintppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'TAXADEP'
      FieldName = 'TAXADEP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 38
    end
    object pplCCImovelSintppField40: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDGRUPO'
      FieldName = 'IDGRUPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 39
    end
    object pplCCImovelSintppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCLASSEBEM'
      FieldName = 'IDCLASSEBEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 40
    end
    object pplCCImovelSintppField42: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALHISTORICO'
      FieldName = 'VALHISTORICO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 41
    end
    object pplCCImovelSintppField43: TppField
      FieldAlias = 'NOMEFORN'
      FieldName = 'NOMEFORN'
      FieldLength = 60
      DisplayWidth = 60
      Position = 42
    end
    object pplCCImovelSintppField44: TppField
      FieldAlias = 'CODGRUPO'
      FieldName = 'CODGRUPO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 43
    end
    object pplCCImovelSintppField45: TppField
      FieldAlias = 'DESCGRUPO'
      FieldName = 'DESCGRUPO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 44
    end
    object pplCCImovelSintppField46: TppField
      FieldAlias = 'TIPOGRUPO'
      FieldName = 'TIPOGRUPO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 45
    end
    object pplCCImovelSintppField47: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 46
    end
    object pplCCImovelSintppField48: TppField
      FieldAlias = 'DESCCCUSTO'
      FieldName = 'DESCCCUSTO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 47
    end
    object pplCCImovelSintppField49: TppField
      FieldAlias = 'TIPOCCUSTO'
      FieldName = 'TIPOCCUSTO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 48
    end
    object pplCCImovelSintppField50: TppField
      FieldAlias = 'CODCLASSEBEM'
      FieldName = 'CODCLASSEBEM'
      FieldLength = 15
      DisplayWidth = 15
      Position = 49
    end
    object pplCCImovelSintppField51: TppField
      FieldAlias = 'DESCCLASSEBEM'
      FieldName = 'DESCCLASSEBEM'
      FieldLength = 60
      DisplayWidth = 60
      Position = 50
    end
    object pplCCImovelSintppField52: TppField
      FieldAlias = 'TIPOCLASSEBEM'
      FieldName = 'TIPOCLASSEBEM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 51
    end
    object pplCCImovelSintppField53: TppField
      FieldAlias = 'DESCCONJUNTO'
      FieldName = 'DESCCONJUNTO'
      FieldLength = 200
      DisplayWidth = 200
      Position = 52
    end
    object pplCCImovelSintppField54: TppField
      FieldAlias = 'DESCLOCAL'
      FieldName = 'DESCLOCAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 53
    end
    object pplCCImovelSintppField55: TppField
      FieldAlias = 'NOMERESP'
      FieldName = 'NOMERESP'
      FieldLength = 60
      DisplayWidth = 60
      Position = 54
    end
    object pplCCImovelSintppField56: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMBEM'
      FieldName = 'CMBEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 55
    end
    object pplCCImovelSintppField57: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORG'
      FieldName = 'VALORG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 56
    end
    object pplCCImovelSintppField58: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEPLANC'
      FieldName = 'DEPLANC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 57
    end
    object pplCCImovelSintppField59: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMDEP'
      FieldName = 'CMDEP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 58
    end
    object pplCCImovelSintppField60: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORGREAV'
      FieldName = 'VALORGREAV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 59
    end
    object pplCCImovelSintppField61: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMBEMREAV'
      FieldName = 'CMBEMREAV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 60
    end
    object pplCCImovelSintppField62: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEPLANCREAV'
      FieldName = 'DEPLANCREAV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 61
    end
    object pplCCImovelSintppField63: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMDEPREAV'
      FieldName = 'CMDEPREAV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 62
    end
    object pplCCImovelSintppField64: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORGULTREAV'
      FieldName = 'VALORGULTREAV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 63
    end
    object pplCCImovelSintppField65: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMBEMULTREAV'
      FieldName = 'CMBEMULTREAV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 64
    end
    object pplCCImovelSintppField66: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEPLANCULTREAV'
      FieldName = 'DEPLANCULTREAV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 65
    end
    object pplCCImovelSintppField67: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMDEPULTREAV'
      FieldName = 'CMDEPULTREAV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 66
    end
    object pplCCImovelSintppField68: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMVALCTB'
      FieldName = 'SUMVALCTB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 67
    end
    object pplCCImovelSintppField69: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMVALCTBIMOB'
      FieldName = 'SUMVALCTBIMOB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 68
    end
  end
  object rptCCImovelSint: TppReport
    AutoStop = False
    DataPipeline = pplCCImovelSint
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
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 160
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplCCImovelSint'
    object ppHeaderBand18: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23548
      mmPrintPosition = 0
      object ppLabel126: TppLabel
        UserName = 'ppLabel126'
        Caption = 'Custo Contábil por Imóvel (Sintético)'
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
      object ppLabel127: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel127'
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
        mmTop = 1588
        mmWidth = 197380
        BandType = 0
      end
      object ppReport1Label2: TppLabel
        UserName = 'ppReport1Label2'
        Caption = 'Data Referência:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 17198
        mmWidth = 29369
        BandType = 0
      end
      object rptCCImovelSint_lblDataContabil: TppLabel
        UserName = 'rptCCImovelSint_lblDataContabil'
        Caption = 'rptCCImovelSint_lblDataContabil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 29104
        mmTop = 17198
        mmWidth = 39952
        BandType = 0
      end
    end
    object ppDetailBand14: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 20638
      mmPrintPosition = 0
      object rptCCImovelSintDBText4: TppDBText
        UserName = 'rptCCImovelSintDBText4'
        DataField = 'PLACA'
        DataPipeline = pplCCImovelSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCCImovelSint'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 529
        mmWidth = 24606
        BandType = 4
      end
      object rptCCImovelSintDBText9: TppDBText
        UserName = 'rptCCImovelSintDBText9'
        DataField = 'DTAINCLUSAO'
        DataPipeline = pplCCImovelSint
        DisplayFormat = 'DD/MM/YYYY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplCCImovelSint'
        mmHeight = 3704
        mmLeft = 103452
        mmTop = 529
        mmWidth = 19050
        BandType = 4
      end
      object rptCCImovelSintDBText10: TppDBText
        UserName = 'rptCCImovelSintDBText10'
        DataField = 'VALHISTORICO'
        DataPipeline = pplCCImovelSint
        DisplayFormat = 
          '###,###,###,###,##0.00;(###,###,###,##0.00;(###,###,###,###,##0.' +
          '00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelSint'
        mmHeight = 3704
        mmLeft = 123296
        mmTop = 529
        mmWidth = 30956
        BandType = 4
      end
      object rptCCImovelSintDBText11: TppDBText
        UserName = 'rptCCImovelSintDBText11'
        DataField = 'SUMVALCTB'
        DataPipeline = pplCCImovelSint
        DisplayFormat = 
          '###,###,###,###,##0.00;(###,###,###,##0.00;(###,###,###,###,##0.' +
          '00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCCImovelSint'
        mmHeight = 3704
        mmLeft = 155046
        mmTop = 529
        mmWidth = 25135
        BandType = 4
      end
      object rptCCImovelSintDBText12: TppDBText
        UserName = 'rptCCImovelSintDBText12'
        DataField = 'DATAULTDEP'
        DataPipeline = pplCCImovelSint
        DisplayFormat = 'DD/MM/YYYY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplCCImovelSint'
        mmHeight = 3704
        mmLeft = 182034
        mmTop = 529
        mmWidth = 15081
        BandType = 4
      end
      object rptCCImovelSintDBText8: TppDBText
        UserName = 'rptCCImovelSintDBText8'
        AutoSize = True
        DataField = 'DESBEM'
        DataPipeline = pplCCImovelSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'pplCCImovelSint'
        mmHeight = 3175
        mmLeft = 26458
        mmTop = 529
        mmWidth = 11642
        BandType = 4
      end
      object rptCCImovelSintLine5: TppLine
        UserName = 'rptCCImovelSintLine5'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 1058
        mmTop = 0
        mmWidth = 195792
        BandType = 4
      end
    end
    object ppFooterBand18: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel132: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel132'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2910
        mmWidth = 64294
        BandType = 8
      end
      object rptCCImovelSintLine7: TppLine
        UserName = 'rptCCImovelSintLine7'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 794
        mmLeft = 0
        mmTop = 1323
        mmWidth = 196850
        BandType = 8
      end
      object ppCalc32: TppSystemVariable
        UserName = 'Calc32'
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
      object ppCalc33: TppSystemVariable
        UserName = 'Calc33'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 73025
        mmTop = 2910
        mmWidth = 51065
        BandType = 8
      end
    end
    object rptCCImovelSintGroup1: TppGroup
      BreakName = 'IDIMOVEL'
      DataPipeline = pplCCImovelSint
      OutlineSettings.CreateNode = True
      UserName = 'rptCCImovelSintGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCCImovelSint'
      object rptCCImovelSintGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 20902
        mmPrintPosition = 0
        object rptCCImovelSintDBText13: TppDBText
          UserName = 'rptCCImovelSintDBText13'
          DataField = 'NOME_IMOVEL'
          DataPipeline = pplCCImovelSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplCCImovelSint'
          mmHeight = 3704
          mmLeft = 12700
          mmTop = 5292
          mmWidth = 26723
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelSintDBText14: TppDBText
          UserName = 'rptCCImovelSintDBText14'
          DataField = 'MOESIGLA'
          DataPipeline = pplCCImovelSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovelSint'
          mmHeight = 3704
          mmLeft = 126736
          mmTop = 5292
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelSintDBText15: TppDBText
          UserName = 'rptCCImovelSintDBText15'
          DataField = 'IMODATACOMPRA'
          DataPipeline = pplCCImovelSint
          DisplayFormat = 'DD/MM/YYYY'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplCCImovelSint'
          mmHeight = 3704
          mmLeft = 182034
          mmTop = 5292
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelSintDBText16: TppDBText
          UserName = 'rptCCImovelSintDBText16'
          DataField = 'IMOVLRCOMPRA'
          DataPipeline = pplCCImovelSint
          DisplayFormat = '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplCCImovelSint'
          mmHeight = 3704
          mmLeft = 137319
          mmTop = 5292
          mmWidth = 33867
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelSintLine1: TppLine
          UserName = 'rptCCImovelSintLine1'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 8996
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelSintLabel9: TppLabel
          UserName = 'rptCCImovelSintLabel9'
          Caption = 'Nº Tombamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 16933
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelSintLabel10: TppLabel
          UserName = 'rptCCImovelSintLabel10'
          Caption = 'Descrição do Bem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 26723
          mmTop = 16933
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelSintLine4: TppLine
          UserName = 'rptCCImovelSintLine4'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 1058
          mmTop = 20638
          mmWidth = 195792
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelSintLabel11: TppLabel
          UserName = 'rptCCImovelSintLabel11'
          Caption = 'Data Inclusão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 103452
          mmTop = 16933
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelSintLabel12: TppLabel
          UserName = 'rptCCImovelSintLabel12'
          Caption = 'Valor Histórico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 132821
          mmTop = 16933
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelSintLabel13: TppLabel
          UserName = 'rptCCImovelSintLabel13'
          Caption = 'Custo Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 158750
          mmTop = 16933
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelSintLabel14: TppLabel
          UserName = 'rptCCImovelSintLabel14'
          Caption = 'Deprec.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 185738
          mmTop = 16933
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelSintLabel15: TppLabel
          UserName = 'rptCCImovelSintLabel15'
          Caption = 'Data Última'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 180975
          mmTop = 13494
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelSintLabel16: TppLabel
          UserName = 'rptCCImovelSintLabel16'
          Caption = 'Data:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 173038
          mmTop = 5292
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelSintLabel17: TppLabel
          UserName = 'rptCCImovelSintLabel17'
          Caption = 'Vlr. Aquisição:  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 104511
          mmTop = 5292
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object rptCCImovelSintLabel8: TppLabel
          UserName = 'rptCCImovelSintLabel8'
          Caption = 'Imóvel:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 5292
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
      end
      object rptCCImovelSintGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 14817
        mmPrintPosition = 0
        object rptCCImovelSintShape1: TppShape
          UserName = 'rptCCImovelSintShape1'
          Pen.Width = 2
          mmHeight = 6085
          mmLeft = 153723
          mmTop = 4233
          mmWidth = 27781
          BandType = 5
          GroupNo = 0
        end
        object rptCCImovelSintLabel18: TppLabel
          UserName = 'rptCCImovelSintLabel18'
          Caption = 'Total do Imóvel:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128588
          mmTop = 5292
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object rptCCImovelSintLine3: TppLine
          UserName = 'rptCCImovelSintLine3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 1852
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object rptCCImovelSintDBCalc1: TppDBCalc
          UserName = 'rptCCImovelSintDBCalc1'
          DataField = 'SUMVALCTB'
          DataPipeline = pplCCImovelSint
          DisplayFormat = 
            '###,###,###,###,##0.00;(###,###,###,##0.00;(###,###,###,###,##0.' +
            '00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCCImovelSintGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCCImovelSint'
          mmHeight = 3704
          mmLeft = 155046
          mmTop = 5292
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
