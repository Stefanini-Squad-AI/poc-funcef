inherited dtmRelRetencaoIOF: TdtmRelRetencaoIOF
  Left = 416
  Top = 284
  Width = 201
  Height = 156
  Caption = 'dRelRetencaoIOF'
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
    DataPipelineName = 'pplExemplo'
  end
  object pplRetencaoIOF: TppBDEPipeline
    DataSource = dtsRetencaoIOF
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lExemplo1'
    Left = 120
    Top = 56
  end
  object dtsRetencaoIOF: TwwDataSource
    DataSet = qryRetencaoIOF
    Left = 120
    Top = 68
  end
  object qryRetencaoIOF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  TCE.TCEDESCRICAO,'
      '  CON.IDCONTRATOEMPTMO, CON.MATRICULA,'
      '  CON.NOME,'
      '  IOF.HMENUMPARCELAS || '#39' Vez(es)'#39' AS PRAZO,'
      '  IOF.HMEDATAPREVISTA, CRE.HMEDATAEFETIVA,'
      
        '  IOF.HMEVLRPREVISTO                                  AS IOF_PRE' +
        'VISTO,'
      
        '  DECODE(CRE.FLGBAIXADO, 0, 0, IOF.HMEVLRPREVISTO)    AS IOF_EFE' +
        'TIVO,'
      
        '  DECODE(IOF.IDLANCIRRF, NULL, 0, IOF.HMEVLRPREVISTO) AS IOF_REC' +
        'OLHIDO,'
      
        '  NVL(IOF.HMEVLRBASE, 0)                              AS HMEVLRB' +
        'ASE,'
      '  CON.VLRCONTRATO,'
      '  DECODE(CRE.HMETIPOMOV,'
      '         0, '#39'Concessão'#39','
      '         1, '#39'Prestação'#39','
      '         2, '#39'Amortização/Refinanciamento'#39','
      '         3, '#39'Quitação'#39','
      '         4, '#39'Atualização de Débito'#39','
      '         5, '#39'Atualização de Saldo'#39' ,'
      '         6, '#39'CARGA'#39','
      '         7, '#39'Ajustes de Valores'#39
      '        ) AS EVENTO,'
      '  ITE.ITEDESCRICAO'
      ''
      'FROM'
      '   VWCONTRATOEP    CON,'
      '   TIPOCONTREMPTMO TCE,'
      '   ITEMEMPTMO ITE,'
      '   ('
      '   SELECT'
      
        '      HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA, HME.HMENUMPARCE' +
        'LAS, HME.IDITEMEMPTMO,'
      
        '      HME.HMEVLRPREVISTO, HME.HMEVLRBASE, HME.IDLANCIRRF, HME.HM' +
        'ETIPOMOV'
      '   FROM'
      '      HISTMOVEMPTMO HME,'
      '      PARAMEMPTMO   PAR'
      '   WHERE'
      '          HME.HMETIPOMOV      = 0'
      '      and 1 = 2'
      '      AND HME.HMECENTRALIZA   = 0'
      
        '      AND ( (HME.FLGESTORNADO IS NULL) OR (HME.FLGESTORNADO = 0)' +
        ' )'
      '      AND HME.IDITEMEMPTMO    = PAR.IDITEMIOF'
      '   ) IOF,'
      '   ('
      '   SELECT'
      '      HME.IDCONTRATOEMPTMO, HME.HMETIPOMOV, HME.HMEDATAPREVISTA,'
      '      HME.HMEDATAEFETIVA, NVL(HME.FLGBAIXADO, 1) AS FLGBAIXADO'
      '   FROM'
      '      HISTMOVEMPTMO HME'
      '   WHERE'
      '          HME.HMETIPOMOV    = 0'
      '      and 1 = 2'
      '      AND HME.HMECENTRALIZA = 1'
      '   ) CRE'
      'WHERE'
      '       CON.FLGSITUACAO       <> '#39'C'#39
      '   and 1 = 2'
      '   AND CON.IDCONTRATOEMPTMO  = IOF.IDCONTRATOEMPTMO'
      '   AND CON.IDCONTRATOEMPTMO  = CRE.IDCONTRATOEMPTMO'
      '   AND ITE.IDITEMEMPTMO = IOF.IDITEMEMPTMO'
      'ORDER BY'
      '   PRAZO, CRE.HMEDATAPREVISTA, CON.IDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 120
    Top = 80
    object qryRetencaoIOFIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryRetencaoIOFMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryRetencaoIOFNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryRetencaoIOFPRAZO: TStringField
      FieldName = 'PRAZO'
      Size = 48
    end
    object qryRetencaoIOFHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryRetencaoIOFHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
    end
    object qryRetencaoIOFIOF_PREVISTO: TFloatField
      FieldName = 'IOF_PREVISTO'
    end
    object qryRetencaoIOFIOF_EFETIVO: TFloatField
      FieldName = 'IOF_EFETIVO'
    end
    object qryRetencaoIOFIOF_RECOLHIDO: TFloatField
      FieldName = 'IOF_RECOLHIDO'
    end
    object qryRetencaoIOFHMEVLRBASE: TFloatField
      FieldName = 'HMEVLRBASE'
    end
    object qryRetencaoIOFVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryRetencaoIOFEVENTO: TStringField
      FieldName = 'EVENTO'
      Size = 27
    end
    object qryRetencaoIOFTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryRetencaoIOFITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
  end
  object rptRetencaoIOF: TppReport
    AutoStop = False
    DataPipeline = pplRetencaoIOF
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Retenção de IOF'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 297128
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
    Left = 120
    Top = 8
    Version = '7.04'
    mmColumnWidth = 270670
    DataPipelineName = 'pplRetencaoIOF'
    object rptContratosAdminSint_CabecalhoRelat: TppHeaderBand
      mmBottomOffset = 40
      mmHeight = 33073
      mmPrintPosition = 0
      object pplbTitulo: TppLabel
        UserName = 'lbTitulo'
        AutoSize = False
        Caption = 'Retenção de I.O.F.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 54504
        mmTop = 9790
        mmWidth = 161396
        BandType = 0
      end
      object pplbNomeEmpresa: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'lbNomeEmpresa'
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
        mmLeft = 54504
        mmTop = 2910
        mmWidth = 161396
        BandType = 0
      end
      object lblTipoData: TppLabel
        UserName = 'lblTipoData'
        AutoSize = False
        Caption = 'Referência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 529
        mmTop = 21431
        mmWidth = 17992
        BandType = 0
      end
      object rptRetencaoIOF_lblDataIni: TppLabel
        UserName = 'rptRetencaoIOF_lblDataIni'
        AutoSize = False
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 19844
        mmTop = 21431
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'lbCompetenciaIni2'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 35719
        mmTop = 21431
        mmWidth = 1323
        BandType = 0
      end
      object rptRetencaoIOF_lblDataFim: TppLabel
        UserName = 'rptRetencaoIOF_lblDataFim'
        AutoSize = False
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 38100
        mmTop = 21431
        mmWidth = 14817
        BandType = 0
      end
      object rptRetencaoIOF_lblTipoData: TppLabel
        UserName = 'Label5'
        Caption = '(Datas Previstas)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 19844
        mmTop = 25929
        mmWidth = 20902
        BandType = 0
      end
    end
    object ppItensContrato: TppDetailBand
      BeforePrint = ppItensContratoBeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 3969
      mmPrintPosition = 0
      object rptContrato: TppShape
        OnPrint = ppShape1Print
        UserName = 'rptContrato'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 270670
        BandType = 4
      end
      object ppLine1: TppLine
        OnPrint = ppLine1Print
        UserName = 'Line1'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 270670
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOME'
        DataPipeline = pplRetencaoIOF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRetencaoIOF'
        mmHeight = 2910
        mmLeft = 38629
        mmTop = 529
        mmWidth = 68792
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'HMEVLRBASE'
        DataPipeline = pplRetencaoIOF
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRetencaoIOF'
        mmHeight = 2910
        mmLeft = 186267
        mmTop = 529
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplRetencaoIOF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRetencaoIOF'
        mmHeight = 2910
        mmLeft = 1058
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'MATRICULA'
        DataPipeline = pplRetencaoIOF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRetencaoIOF'
        mmHeight = 2910
        mmLeft = 22225
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'IOF_PREVISTO'
        DataPipeline = pplRetencaoIOF
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRetencaoIOF'
        mmHeight = 2910
        mmLeft = 233098
        mmTop = 529
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'HMEDATAPREVISTA'
        DataPipeline = pplRetencaoIOF
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRetencaoIOF'
        mmHeight = 2910
        mmLeft = 203200
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'HMEDATAEFETIVA'
        DataPipeline = pplRetencaoIOF
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRetencaoIOF'
        mmHeight = 2910
        mmLeft = 218017
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'IOF_EFETIVO'
        DataPipeline = pplRetencaoIOF
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRetencaoIOF'
        mmHeight = 2910
        mmLeft = 245798
        mmTop = 529
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'IOF_RECOLHIDO'
        DataPipeline = pplRetencaoIOF
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRetencaoIOF'
        mmHeight = 2910
        mmLeft = 258498
        mmTop = 529
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'EVENTO'
        DataPipeline = pplRetencaoIOF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRetencaoIOF'
        mmHeight = 2910
        mmLeft = 159544
        mmTop = 529
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'TCEDESCRICAO'
        DataPipeline = pplRetencaoIOF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRetencaoIOF'
        mmHeight = 2910
        mmLeft = 109273
        mmTop = 529
        mmWidth = 48419
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 40
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLine37: TppLine
        UserName = 'ppLine37'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 270670
        BandType = 8
      end
      object pplbNomeSistema: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'lbNomeSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 3175
        mmWidth = 23019
        BandType = 8
      end
      object ppCalc23: TppSystemVariable
        UserName = 'Calc23'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 126471
        mmTop = 3175
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 243946
        mmTop = 3175
        mmWidth = 25400
        BandType = 8
      end
    end
    object rptContratosAdminSintSummaryBand1: TppSummaryBand
      mmBottomOffset = 40
      mmHeight = 20638
      mmPrintPosition = 0
      object rptContratosAdminSintLine1: TppLine
        UserName = 'rptContratosAdminSintLine1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 2646
        mmWidth = 270670
        BandType = 7
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Pen.Width = 2
        mmHeight = 5292
        mmLeft = 184944
        mmTop = 6085
        mmWidth = 85725
        BandType = 7
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Total Geral:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 166688
        mmTop = 7144
        mmWidth = 18256
        BandType = 7
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Pen.Width = 2
        mmHeight = 5292
        mmLeft = 5292
        mmTop = 6085
        mmWidth = 27517
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplRetencaoIOF
        DisplayFormat = '#,#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pplRetencaoIOF'
        mmHeight = 2910
        mmLeft = 6350
        mmTop = 7144
        mmWidth = 7673
        BandType = 7
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Item(ns)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 15346
        mmTop = 7144
        mmWidth = 9525
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'HMEVLRBASE'
        DataPipeline = pplRetencaoIOF
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRetencaoIOF'
        mmHeight = 2910
        mmLeft = 186267
        mmTop = 7144
        mmWidth = 15081
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'IOF_PREVISTO'
        DataPipeline = pplRetencaoIOF
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRetencaoIOF'
        mmHeight = 2910
        mmLeft = 233098
        mmTop = 7144
        mmWidth = 10848
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'IOF_EFETIVO'
        DataPipeline = pplRetencaoIOF
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRetencaoIOF'
        mmHeight = 2910
        mmLeft = 245798
        mmTop = 7144
        mmWidth = 10848
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'IOF_RECOLHIDO'
        DataPipeline = pplRetencaoIOF
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRetencaoIOF'
        mmHeight = 2910
        mmLeft = 258498
        mmTop = 7144
        mmWidth = 10848
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PRAZO'
      DataPipeline = pplRetencaoIOF
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplRetencaoIOF'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8996
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 8996
          mmLeft = 0
          mmTop = 0
          mmWidth = 270670
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'lblTipoData1'
          AutoSize = False
          Caption = 'Prazo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 3440
          mmTop = 1058
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          AutoSize = True
          DataField = 'PRAZO'
          DataPipeline = pplRetencaoIOF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplRetencaoIOF'
          mmHeight = 3175
          mmLeft = 16140
          mmTop = 1058
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 8731
          mmWidth = 270670
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 5821
          mmTop = 5292
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 22225
          mmTop = 5292
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 38629
          mmTop = 5292
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'I.O.F.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 247650
          mmTop = 1323
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 214578
          mmTop = 1323
          mmWidth = 5821
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label2'
          Caption = 'Valor Base'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 187061
          mmTop = 5292
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Prevista'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 205317
          mmTop = 5292
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Efetivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 247386
          mmTop = 5292
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Previsto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 233892
          mmTop = 5292
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Recolh.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 259292
          mmTop = 5292
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 232834
          mmTop = 4498
          mmWidth = 36777
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'Efetiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 221721
          mmTop = 5292
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 203994
          mmTop = 4498
          mmWidth = 27252
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Tipo de Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 109273
          mmTop = 5292
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'Evento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 159544
          mmTop = 5292
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 15346
        mmPrintPosition = 0
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Total:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 175155
          mmTop = 2910
          mmWidth = 9790
          BandType = 5
          GroupNo = 0
        end
        object ppShape2: TppShape
          UserName = 'Shape2'
          mmHeight = 4763
          mmLeft = 184944
          mmTop = 2117
          mmWidth = 85461
          BandType = 5
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 270670
          BandType = 5
          GroupNo = 0
        end
        object ppShape5: TppShape
          UserName = 'Shape5'
          mmHeight = 4763
          mmLeft = 5556
          mmTop = 2117
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label101'
          Caption = 'Item(ns)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 15346
          mmTop = 2910
          mmWidth = 9525
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'HMEVLRBASE'
          DataPipeline = pplRetencaoIOF
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRetencaoIOF'
          mmHeight = 2910
          mmLeft = 186267
          mmTop = 2910
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplRetencaoIOF
          DisplayFormat = '#,#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplRetencaoIOF'
          mmHeight = 2910
          mmLeft = 6350
          mmTop = 2910
          mmWidth = 7673
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'IOF_EFETIVO'
          DataPipeline = pplRetencaoIOF
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRetencaoIOF'
          mmHeight = 2910
          mmLeft = 245798
          mmTop = 2910
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'IOF_PREVISTO'
          DataPipeline = pplRetencaoIOF
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRetencaoIOF'
          mmHeight = 2910
          mmLeft = 233098
          mmTop = 2910
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'IOF_RECOLHIDO'
          DataPipeline = pplRetencaoIOF
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRetencaoIOF'
          mmHeight = 2910
          mmLeft = 258498
          mmTop = 2910
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
