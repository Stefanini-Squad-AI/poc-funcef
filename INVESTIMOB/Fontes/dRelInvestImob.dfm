inherited dtmRelInvestImob: TdtmRelInvestImob
  Left = 190
  Top = 134
  Width = 448
  Height = 232
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 24
    Top = 80
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
    Top = 68
  end
  inherited qryExemplo: TwwQuery
    Left = 24
    Top = 56
  end
  inherited rpExemplo: TppReport
    Left = 24
    Top = 8
    DataPipelineName = 'pplExemplo'
    inherited FooterBand1: TppFooterBand
      inherited Calc1: TppSystemVariable [1]
      end
      inherited Calc2: TppSystemVariable
        mmLeft = 69056
        mmTop = 2910
        mmWidth = 70644
      end
      inherited LblSistema: TppLabel [3]
        mmLeft = 529
        mmTop = 2910
        mmWidth = 64294
      end
    end
  end
  object qryQuadroImoveis: TwwQuery
    OnCalcFields = qryQuadroImoveisCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IM.IMONOME AS NOMEMESTRE,'
      '   IM.IMOLOGRADOURO, IM.IMONUMERO, IM.IMOBAIRRO, IM.IMOCEP,'
      '   CI.NOME AS DSC_CIDADE, CI.UF AS DSC_UF,   '
      '   I.IMONOME AS NOMEIMOVEL,IM.IDIMOVEL AS IDMESTRE,'
      '   I.FLGSTATUSOCUPACAO, I.IDIMOVEL, I.IMOAREAGERENCIAL,'
      ''
      '   C.IDCONTRATOIMOVEL, C.CONDATAINICIO, C.CONDATAFIM,'
      ''
      '   DECODE(C.IDLOCATARIO, NULL, '#39'VAGO'#39', PL.NOME) AS LOCATARIO,'
      ''
      '   XG.SUMVALCTB, XG.SUMVALCTBIMOB,'
      ''
      '   DECODE(CX.FLGRATEIO, NULL, 0,'
      '      DECODE(CX.FLGRATEIO, 0, 0,'
      '         DECODE(CX.CIMPERCENTRATEIO, 0, 0,'
      '            DECODE(0, NULL, 0,'
      '               0 * CX.CIMPERCENTRATEIO / 100)))) AS C_CONTABIL,'
      ''
      '   DECODE(CX.CIMVLRAJUSTADO, NULL, 0,'
      '      CX.CIMVLRAJUSTADO) AS ALUGUEL,'
      ''
      '   DECODE(CX.FLGRATEIO, NULL, I.IMOAREAGERENCIAL,'
      '      DECODE(CX.FLGRATEIO, 0, I.IMOAREAGERENCIAL,'
      '         DECODE(CX.CIMPERCENTRATEIO, 0, 0,'
      '            DECODE(I.IMOAREAGERENCIAL, NULL, 0,'
      
        '               I.IMOAREAGERENCIAL * CX.CIMPERCENTRATEIO / 100)))' +
        ') AS AREA_OCUPADA,'
      ''
      '   DECODE(CX.CIMVLRAJUSTADO, NULL, 0,'
      '      DECODE(I.IMOAREAGERENCIAL, NULL, 0,'
      '         DECODE(I.IMOAREAGERENCIAL, 0, 0,'
      
        '            DECODE(CX.FLGRATEIO, NULL, (CX.CIMVLRAJUSTADO / I.IM' +
        'OAREAGERENCIAL),'
      
        '               DECODE(CX.FLGRATEIO, 0, (CX.CIMVLRAJUSTADO / I.IM' +
        'OAREAGERENCIAL),'
      '                  DECODE(CX.CIMPERCENTRATEIO, NULL, 0,'
      '                     DECODE(CX.CIMPERCENTRATEIO, 0, 0,'
      
        '                        (CX.CIMVLRAJUSTADO / (I.IMOAREAGERENCIAL' +
        ' * CX.CIMPERCENTRATEIO / 100)) ))))))) AS ALUGUELM2'
      ''
      'FROM'
      '   PESSOA PL, CIDADES CI,'
      '   IMOVEL I, IMOVEL IM, CONTRATOIMOVEL C,'
      '   CONTRATOXIMOVEL CX,'
      ''
      '   ('
      '   SELECT'
      '      IXB.IDIMOVEL,'
      ''
      '      SUM('
      '      SCB.VALORG + SCB.CMBEM - SCB.DEPLANC - SCB.CMDEP +'
      '      SCB.REAVVALORG + SCB.REAVCMBEM - SCB.REAVDEPLANC -'
      '      SCB.REAVCMDEP + SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM -'
      '      SCB.ULTREAVDEPLANC - SCB.ULTREAVCMDEP'
      '      ) AS SUMVALCTB,'
      ''
      '      SUM('
      '      SCB.VALORG + SCB.CMBEM + SCB.REAVVALORG +'
      '      SCB.REAVCMBEM + SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM'
      '      ) AS SUMVALCTBIMOB'
      ''
      '   FROM'
      '      SALDOCONTABBEM SCB, IMOVELXBEM IXB,'
      ''
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
      '      ( SCB.DATASLDBEM = DTAMAX.DATA )'
      '      AND ( SCB.IDBEM = DTAMAX.IDBEM )'
      '      AND ( SCB.IDBEM = IXB.IDBEM )'
      ''
      '   GROUP BY'
      '      IXB.IDIMOVEL'
      '   ) XG'
      ''
      'WHERE'
      '   ( IM.FLGTIPOIMOVEL = 0 )'
      '   AND ( I.FLGTIPOIMOVEL = 1 )'
      '   AND ( C.FLGSTATUS = '#39'V'#39' )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '   AND ( I.IDIMOVEL = CX.IDIMOVEL )'
      '   AND ( CX.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      '   AND ( C.IDLOCATARIO = PL.IDPESSOA(+) )'
      '   AND ( IM.IDCIDADES = CI.IDCIDADES(+) )'
      ''
      'ORDER BY'
      '   NOMEMESTRE, NOMEIMOVEL')
    ValidateWithMask = True
    Left = 360
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
      end>
    object StringField1: TStringField
      FieldKind = fkCalculated
      FieldName = 'EnderecoExtenso'
      Size = 120
      Calculated = True
    end
    object StringField2: TStringField
      FieldKind = fkCalculated
      FieldName = 'Ocupacao'
      Size = 12
      Calculated = True
    end
    object qryQuadroImoveisDataReferencia: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'DataReferencia'
      Calculated = True
    end
    object qryQuadroImoveisNOMEMESTRE: TStringField
      FieldName = 'NOMEMESTRE'
      Size = 60
    end
    object qryQuadroImoveisIMONUMERO: TStringField
      FieldName = 'IMONUMERO'
      Size = 8
    end
    object qryQuadroImoveisIMOBAIRRO: TStringField
      FieldName = 'IMOBAIRRO'
    end
    object qryQuadroImoveisIMOCEP: TStringField
      FieldName = 'IMOCEP'
      Size = 8
    end
    object qryQuadroImoveisNOMEIMOVEL: TStringField
      FieldName = 'NOMEIMOVEL'
      Size = 60
    end
    object qryQuadroImoveisIDMESTRE: TFloatField
      FieldName = 'IDMESTRE'
    end
    object qryQuadroImoveisFLGSTATUSOCUPACAO: TStringField
      FieldName = 'FLGSTATUSOCUPACAO'
      Size = 1
    end
    object qryQuadroImoveisIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryQuadroImoveisIMOAREAGERENCIAL: TFloatField
      FieldName = 'IMOAREAGERENCIAL'
    end
    object qryQuadroImoveisIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryQuadroImoveisCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
    end
    object qryQuadroImoveisCONDATAFIM: TDateTimeField
      FieldName = 'CONDATAFIM'
    end
    object qryQuadroImoveisLOCATARIO: TStringField
      FieldName = 'LOCATARIO'
      Size = 60
    end
    object qryQuadroImoveisSUMVALCTB: TFloatField
      FieldName = 'SUMVALCTB'
    end
    object qryQuadroImoveisSUMVALCTBIMOB: TFloatField
      FieldName = 'SUMVALCTBIMOB'
    end
    object qryQuadroImoveisC_CONTABIL: TFloatField
      FieldName = 'C_CONTABIL'
    end
    object qryQuadroImoveisALUGUEL: TFloatField
      FieldName = 'ALUGUEL'
    end
    object qryQuadroImoveisAREA_OCUPADA: TFloatField
      FieldName = 'AREA_OCUPADA'
    end
    object qryQuadroImoveisALUGUELM2: TFloatField
      FieldName = 'ALUGUELM2'
    end
    object qryQuadroImoveisIMOLOGRADOURO: TStringField
      FieldName = 'IMOLOGRADOURO'
      Size = 80
    end
    object qryQuadroImoveisDSC_CIDADE: TStringField
      FieldName = 'DSC_CIDADE'
      Size = 50
    end
    object qryQuadroImoveisDSC_UF: TStringField
      FieldName = 'DSC_UF'
      FixedChar = True
      Size = 3
    end
  end
  object dsQuadroImoveis: TwwDataSource
    DataSet = qryQuadroImoveis
    Left = 360
    Top = 68
  end
  object pplQuadroImoveis: TppBDEPipeline
    DataSource = dsQuadroImoveis
    UserName = 'lQuadroImoveis'
    Left = 360
    Top = 80
  end
  object rptQuadroImoveis: TppReport
    AutoStop = False
    DataPipeline = pplQuadroImoveis
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13229
    PrinterSetup.mmMarginLeft = 6615
    PrinterSetup.mmMarginRight = 6615
    PrinterSetup.mmMarginTop = 13229
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
    Left = 360
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplQuadroImoveis'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 40
      mmHeight = 24871
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        AutoSize = False
        Caption = 'Quadro de Aluguéis por m2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 43127
        mmTop = 8731
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel5: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel5'
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
        mmLeft = 43127
        mmTop = 1588
        mmWidth = 197380
        BandType = 0
      end
      object rptQuadroImoveisLabel14: TppLabel
        UserName = 'rptQuadroImoveisLabel14'
        Caption = 'Data de referência:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 17727
        mmWidth = 28840
        BandType = 0
      end
      object rptQuadroImoveis_lblDataContabil: TppLabel
        UserName = 'rptQuadroImoveis_lblDataContabil'
        Caption = 'rptQuadroImoveis_lblDataContabil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 28575
        mmTop = 17727
        mmWidth = 42598
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 20108
      mmPrintPosition = 0
      object rptQuadroImoveis_FundoBandaDetalhe: TppShape
        UserName = 'rptQuadroImoveis_FundoBandaDetalhe'
        Brush.Color = 13040076
        ParentHeight = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 20108
        mmLeft = 4233
        mmTop = 0
        mmWidth = 279930
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'ppDBText2'
        DataField = 'IMOAREAGERENCIAL'
        DataPipeline = pplQuadroImoveis
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplQuadroImoveis'
        mmHeight = 3704
        mmLeft = 200555
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppReport1DBMemo1: TppDBMemo
        UserName = 'ppReport1DBMemo1'
        CharWrap = False
        DataField = 'NOMEIMOVEL'
        DataPipeline = pplQuadroImoveis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplQuadroImoveis'
        mmHeight = 15875
        mmLeft = 4233
        mmTop = 794
        mmWidth = 60854
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppReport1DBText1: TppDBText
        UserName = 'ppReport1DBText1'
        DataField = 'CONDATAINICIO'
        DataPipeline = pplQuadroImoveis
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplQuadroImoveis'
        mmHeight = 3704
        mmLeft = 138907
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppReport1DBMemo2: TppDBMemo
        UserName = 'ppReport1DBMemo2'
        CharWrap = False
        DataField = 'LOCATARIO'
        DataPipeline = pplQuadroImoveis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplQuadroImoveis'
        mmHeight = 15875
        mmLeft = 66940
        mmTop = 794
        mmWidth = 70115
        BandType = 4
        mmBottomOffset = 794
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppReport1DBText2: TppDBText
        UserName = 'ppReport1DBText2'
        DataField = 'C_CONTABIL'
        DataPipeline = pplQuadroImoveis
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplQuadroImoveis'
        mmHeight = 3704
        mmLeft = 259557
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object rptQuadroImoveis_Separador: TppLine
        UserName = 'rptQuadroImoveis_Separador'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 4233
        mmTop = 0
        mmWidth = 279665
        BandType = 4
      end
      object rptQuadroImoveisDBText1: TppDBText
        UserName = 'rptQuadroImoveisDBText1'
        DataField = 'CONDATAFIM'
        DataPipeline = pplQuadroImoveis
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplQuadroImoveis'
        mmHeight = 3704
        mmLeft = 158221
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object rptQuadroImoveisLabel2: TppLabel
        UserName = 'rptQuadroImoveisLabel2'
        AutoSize = False
        Caption = ' a '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 154517
        mmTop = 794
        mmWidth = 3175
        BandType = 4
      end
      object rptQuadroImoveisDBText2: TppDBText
        UserName = 'rptQuadroImoveisDBText2'
        DataField = 'AREA_OCUPADA'
        DataPipeline = pplQuadroImoveis
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplQuadroImoveis'
        mmHeight = 3704
        mmLeft = 221986
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object rptQuadroImoveisDBText3: TppDBText
        UserName = 'rptQuadroImoveisDBText3'
        DataField = 'ALUGUELM2'
        DataPipeline = pplQuadroImoveis
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplQuadroImoveis'
        mmHeight = 3704
        mmLeft = 243417
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object rptQuadroImoveisLabel8: TppLabel
        UserName = 'rptQuadroImoveisLabel8'
        Caption = 'm2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 237861
        mmTop = 794
        mmWidth = 3704
        BandType = 4
      end
      object rptQuadroImoveisLabel9: TppLabel
        UserName = 'rptQuadroImoveisLabel9'
        Caption = 'm2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 216430
        mmTop = 794
        mmWidth = 3704
        BandType = 4
      end
      object rptQuadroImoveisDBText4: TppDBText
        UserName = 'rptQuadroImoveisDBText4'
        DataField = 'ALUGUEL'
        DataPipeline = pplQuadroImoveis
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplQuadroImoveis'
        mmHeight = 3704
        mmLeft = 175155
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 40
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'ppLine1'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 283898
        BandType = 8
      end
      object ppLabel7: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel7'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 65617
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
        mmLeft = 120121
        mmTop = 3175
        mmWidth = 43392
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
        mmLeft = 248444
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NOMEMESTRE'
      DataPipeline = pplQuadroImoveis
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplQuadroImoveis'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 40
        mmHeight = 17992
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'ppLine3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 8202
          mmWidth = 283898
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'ppLabel8'
          Caption = 'Imóvel Mestre:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 529
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'ppDBText5'
          AutoSize = True
          DataField = 'NOMEMESTRE'
          DataPipeline = pplQuadroImoveis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplQuadroImoveis'
          mmHeight = 3175
          mmLeft = 24077
          mmTop = 529
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object rptQuadroImoveis_LinhaTitulo: TppLine
          OnPrint = rptQuadroImoveis_LinhaTituloPrint
          UserName = 'rptQuadroImoveis_LinhaTitulo'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 4233
          mmTop = 17463
          mmWidth = 279665
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'ppDBText6'
          AutoSize = True
          DataField = 'EnderecoExtenso'
          DataPipeline = pplQuadroImoveis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplQuadroImoveis'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 4498
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'ppLabel10'
          Caption = 'Imóvel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 4233
          mmTop = 13758
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'ppLabel11'
          Caption = 'Locatário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 66940
          mmTop = 13758
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'ppLabel12'
          Caption = 'Área Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 205317
          mmTop = 13758
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppReport1Label1: TppLabel
          UserName = 'ppReport1Label1'
          Caption = 'Vigência do Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 138907
          mmTop = 13758
          mmWidth = 30427
          BandType = 3
          GroupNo = 0
        end
        object ppReport1Label3: TppLabel
          UserName = 'ppReport1Label3'
          Caption = 'Custo Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 262467
          mmTop = 13758
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object rptQuadroImoveisLabel3: TppLabel
          UserName = 'rptQuadroImoveisLabel3'
          AutoSize = False
          Caption = 'Área'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 226484
          mmTop = 10319
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object rptQuadroImoveisLabel4: TppLabel
          UserName = 'rptQuadroImoveisLabel4'
          AutoSize = False
          Caption = 'Ocupada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 226484
          mmTop = 13758
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object rptQuadroImoveisLabel5: TppLabel
          UserName = 'rptQuadroImoveisLabel5'
          AutoSize = False
          Caption = 'Aluguel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 243417
          mmTop = 10319
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object rptQuadroImoveisLabel6: TppLabel
          UserName = 'rptQuadroImoveisLabel6'
          AutoSize = False
          Caption = 'por m2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 243417
          mmTop = 13758
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object rptQuadroImoveisLabel12: TppLabel
          UserName = 'rptQuadroImoveisLabel12'
          AutoSize = False
          Caption = 'Contratual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 175419
          mmTop = 13758
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object rptQuadroImoveisLabel13: TppLabel
          UserName = 'rptQuadroImoveisLabel13'
          AutoSize = False
          Caption = 'Aluguel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 183621
          mmTop = 10319
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 40
        mmHeight = 15081
        mmPrintPosition = 0
        object rptQuadroImoveisShape1: TppShape
          UserName = 'rptQuadroImoveisShape1'
          Pen.Width = 2
          mmHeight = 6085
          mmLeft = 174096
          mmTop = 3175
          mmWidth = 110331
          BandType = 5
          GroupNo = 0
        end
        object rptQuadroImoveisLine2: TppLine
          UserName = 'rptQuadroImoveisLine2'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 4233
          mmTop = 0
          mmWidth = 279665
          BandType = 5
          GroupNo = 0
        end
        object rptQuadroImoveisLabel7: TppLabel
          UserName = 'rptQuadroImoveisLabel7'
          Caption = 'Total do Imóvel Mestre:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 137584
          mmTop = 4233
          mmWidth = 36777
          BandType = 5
          GroupNo = 0
        end
        object rptQuadroImoveisDBCalc1: TppDBCalc
          UserName = 'rptQuadroImoveisDBCalc1'
          DataField = 'IMOAREAGERENCIAL'
          DataPipeline = pplQuadroImoveis
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplQuadroImoveis'
          mmHeight = 3704
          mmLeft = 200555
          mmTop = 4233
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object rptQuadroImoveisDBCalc3: TppDBCalc
          UserName = 'rptQuadroImoveisDBCalc3'
          DataField = 'C_CONTABIL'
          DataPipeline = pplQuadroImoveis
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplQuadroImoveis'
          mmHeight = 3704
          mmLeft = 259557
          mmTop = 4233
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object rptQuadroImoveisDBCalc2: TppDBCalc
          UserName = 'rptQuadroImoveisDBCalc2'
          DataField = 'AREA_OCUPADA'
          DataPipeline = pplQuadroImoveis
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplQuadroImoveis'
          mmHeight = 3704
          mmLeft = 221986
          mmTop = 4233
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object rptQuadroImoveisDBCalc4: TppDBCalc
          UserName = 'rptQuadroImoveisDBCalc4'
          DataField = 'ALUGUELM2'
          DataPipeline = pplQuadroImoveis
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcAverage
          DataPipelineName = 'pplQuadroImoveis'
          mmHeight = 3704
          mmLeft = 243417
          mmTop = 4233
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object rptQuadroImoveisLabel10: TppLabel
          UserName = 'rptQuadroImoveisLabel10'
          Caption = 'm2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 237861
          mmTop = 4233
          mmWidth = 3704
          BandType = 5
          GroupNo = 0
        end
        object rptQuadroImoveisLabel11: TppLabel
          UserName = 'rptQuadroImoveisLabel11'
          Caption = 'm2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 216430
          mmTop = 4233
          mmWidth = 3704
          BandType = 5
          GroupNo = 0
        end
        object rptQuadroImoveisDBCalc5: TppDBCalc
          UserName = 'rptQuadroImoveisDBCalc5'
          DataField = 'ALUGUEL'
          DataPipeline = pplQuadroImoveis
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplQuadroImoveis'
          mmHeight = 3704
          mmLeft = 175155
          mmTop = 4233
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryListagemImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IM.IDIMOVEL AS IDMESTRE, IM.IMONOME AS NOMEMESTRE,'
      '   IM.IMOLOGRADOURO, IM.IMONUMERO, IM.IMOBAIRRO, IM.IMOCEP,'
      ''
      '   I.IMONOME AS NOMEIMOVEL, I.IMOMATRICULA, I.IMOCODIGO,'
      '   I.FLGSTATUSOCUPACAO, I.IDIMOVEL, I.IMOAREA,'
      ''
      '   I.IMOVLRCOMPRA, I.IMODATACOMPRA, I.IMOMOEDACOMPRA,'
      '   I.IMOVLRREAVAL, I.IMODATAREAVAL, I.IMOMOEDAREAVAL,'
      '   I.IMOVLRMERCADO, I.IMODATAMERCADO, I.IMOMOEDAMERCADO,'
      ''
      '   M.MOESIGLA AS MOEDA_COMPRA,'
      '   CI.DESCCARTINVEST AS CARTEIRA_INVESTIMENTO,'
      '   T.DESCTIPOIMOVEL AS TIPO_IMOVEL,'
      ''
      
        '   DECODE(I.FLGSTATUSOCUPACAO, NULL, '#39'VAGO'#39', DECODE(I.FLGSTATUSO' +
        'CUPACAO, '#39'O'#39', '#39'Ocupado'#39', '#39'VAGO'#39')) AS OCUPACAO_IMOVEL,'
      ''
      '   DECODE(XG.SUMVALCTB, NULL, 0, XG.SUMVALCTB) AS CUSTO_CONTABIL'
      ''
      'FROM'
      '   IMOVEL I, IMOVEL IM, TIPOIMOVEL T,'
      '   MOEDA M, CARTEIRAINVEST CI,'
      ''
      '   ('
      '   SELECT'
      '      IXB.IDIMOVEL,'
      ''
      '      SUM('
      '      SCB.VALORG + SCB.CMBEM - SCB.DEPLANC - SCB.CMDEP +'
      '      SCB.REAVVALORG + SCB.REAVCMBEM - SCB.REAVDEPLANC -'
      '      SCB.REAVCMDEP + SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM -'
      '      SCB.ULTREAVDEPLANC - SCB.ULTREAVCMDEP'
      '      ) AS SUMVALCTB,'
      ''
      '      SUM('
      '      SCB.VALORG + SCB.CMBEM + SCB.REAVVALORG +'
      '      SCB.REAVCMBEM + SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM'
      '      ) AS SUMVALCTBIMOB'
      ''
      '   FROM'
      '      SALDOCONTABBEM SCB, IMOVELXBEM IXB,'
      ''
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
      ''
      '   GROUP BY'
      '      IXB.IDIMOVEL'
      '   ) XG'
      ''
      'WHERE'
      '   ( I.IDIMOVELMESTRE =:PIDIMOVELMESTRE )'
      
        '   AND ( (:PFLGSTATUSOCUPACAO IS NULL) OR ((:PFLGSTATUSOCUPACAO ' +
        'IS NOT NULL) AND (I.FLGSTATUSOCUPACAO =:PFLGSTATUSOCUPACAO)) )'
      '   AND ( (:PIMOAREA IS NULL) OR (I.IMOAREA > 0) )'
      '   AND ( (:PIMOVLRCOMPRA IS NULL) OR (I.IMOVLRCOMPRA <> 0) )'
      '   AND ( (:PFLGATIVO IS NULL) OR (I.FLGATIVO = 1) )'
      '   AND ( (:PSUMVALCONTAB IS NULL) OR (XG.SUMVALCTB > 0) )'
      ''
      '   AND ( IM.FLGTIPOIMOVEL = 0 )'
      '   AND ( I.FLGTIPOIMOVEL = 1 )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL(+) )'
      '   AND ( I.IDIMOVEL = XG.IDIMOVEL(+) )'
      '   AND ( I.CODTIPIMOVEL = T.CODTIPIMOVEL(+) )'
      '   AND ( I.IMOMOEDACOMPRA = M.MOECODIGO (+) )'
      '   AND ( I.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST(+) )'
      ''
      'ORDER BY'
      '   NOMEMESTRE, NOMEIMOVEL'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 120
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
        DataType = ftString
        Name = 'PFLGSTATUSOCUPACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGSTATUSOCUPACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGSTATUSOCUPACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIMOAREA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIMOVLRCOMPRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PSUMVALCONTAB'
        ParamType = ptUnknown
      end>
    object StringField15: TStringField
      FieldKind = fkCalculated
      FieldName = 'EnderecoExtenso'
      Size = 120
      Calculated = True
    end
    object StringField18: TStringField
      FieldKind = fkCalculated
      FieldName = 'Ocupacao'
      Size = 12
      Calculated = True
    end
    object DateTimeField5: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'DataReferencia'
      Calculated = True
    end
    object qryListagemImovelIDMESTRE: TFloatField
      FieldName = 'IDMESTRE'
    end
    object qryListagemImovelNOMEMESTRE: TStringField
      FieldName = 'NOMEMESTRE'
      Size = 60
    end
    object qryListagemImovelIMONUMERO: TStringField
      FieldName = 'IMONUMERO'
      Size = 8
    end
    object qryListagemImovelIMOBAIRRO: TStringField
      FieldName = 'IMOBAIRRO'
    end
    object qryListagemImovelIMOCEP: TStringField
      FieldName = 'IMOCEP'
      Size = 8
    end
    object qryListagemImovelNOMEIMOVEL: TStringField
      FieldName = 'NOMEIMOVEL'
      Size = 60
    end
    object qryListagemImovelIMOMATRICULA: TStringField
      FieldName = 'IMOMATRICULA'
    end
    object qryListagemImovelFLGSTATUSOCUPACAO: TStringField
      FieldName = 'FLGSTATUSOCUPACAO'
      Size = 1
    end
    object qryListagemImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryListagemImovelIMOAREA: TFloatField
      FieldName = 'IMOAREA'
    end
    object qryListagemImovelTIPO_IMOVEL: TStringField
      FieldName = 'TIPO_IMOVEL'
      Size = 25
    end
    object qryListagemImovelOCUPACAO_IMOVEL: TStringField
      FieldName = 'OCUPACAO_IMOVEL'
      Size = 7
    end
    object qryListagemImovelIMOVLRCOMPRA: TFloatField
      FieldName = 'IMOVLRCOMPRA'
    end
    object qryListagemImovelIMODATACOMPRA: TDateTimeField
      FieldName = 'IMODATACOMPRA'
    end
    object qryListagemImovelIMOMOEDACOMPRA: TFloatField
      FieldName = 'IMOMOEDACOMPRA'
    end
    object qryListagemImovelMOEDA_COMPRA: TStringField
      FieldName = 'MOEDA_COMPRA'
      Size = 10
    end
    object qryListagemImovelCARTEIRA_INVESTIMENTO: TStringField
      FieldName = 'CARTEIRA_INVESTIMENTO'
      Size = 60
    end
    object qryListagemImovelCUSTO_CONTABIL: TFloatField
      FieldName = 'CUSTO_CONTABIL'
    end
    object qryListagemImovelIMOLOGRADOURO: TStringField
      FieldName = 'IMOLOGRADOURO'
      Size = 80
    end
    object qryListagemImovelIMOVLRREAVAL: TFloatField
      FieldName = 'IMOVLRREAVAL'
    end
    object qryListagemImovelIMODATAREAVAL: TDateTimeField
      FieldName = 'IMODATAREAVAL'
    end
    object qryListagemImovelIMOMOEDAREAVAL: TFloatField
      FieldName = 'IMOMOEDAREAVAL'
    end
    object qryListagemImovelIMOVLRMERCADO: TFloatField
      FieldName = 'IMOVLRMERCADO'
    end
    object qryListagemImovelIMODATAMERCADO: TDateTimeField
      FieldName = 'IMODATAMERCADO'
    end
    object qryListagemImovelIMOMOEDAMERCADO: TFloatField
      FieldName = 'IMOMOEDAMERCADO'
    end
    object qryListagemImovelIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
  end
  object dsListagemImovel: TwwDataSource
    DataSet = qryListagemImovel
    Left = 120
    Top = 68
  end
  object pplListagemImovel: TppBDEPipeline
    DataSource = dsListagemImovel
    UserName = 'lListagemImovel'
    Left = 120
    Top = 80
  end
  object rptListagemImovel: TppReport
    AutoStop = False
    DataPipeline = pplListagemImovel
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
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
    mmColumnWidth = 197300
    DataPipelineName = 'pplListagemImovel'
    object ppHeaderBand14: TppHeaderBand
      mmBottomOffset = 40
      mmHeight = 25400
      mmPrintPosition = 0
      object ppLabel129: TppLabel
        UserName = 'ppLabel129'
        AutoSize = False
        Caption = 'Listagem de Imóveis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 43392
        mmTop = 8731
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel130: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel130'
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
        mmLeft = 43392
        mmTop = 1588
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel131: TppLabel
        UserName = 'ppLabel131'
        Caption = 'Data de referência:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 2910
        mmLeft = 529
        mmTop = 17727
        mmWidth = 24871
        BandType = 0
      end
      object rptListagemImovel_lblDataContabil: TppLabel
        UserName = 'rptListagemImovel_lblDataContabil'
        Caption = 'rptListagemImovel_lblDataContabil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 25135
        mmTop = 17727
        mmWidth = 38629
        BandType = 0
      end
    end
    object rptListagemImovel_bndImovel: TppDetailBand
      BeforePrint = rptListagemImovel_bndImovelBeforePrint
      BeforeGenerate = rptListagemImovel_bndImovelBeforeGenerate
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 20108
      mmPrintPosition = 0
      object ppDBText48: TppDBText
        UserName = 'ppDBText48'
        DataField = 'IMOAREA'
        DataPipeline = pplListagemImovel
        DisplayFormat = '###,###,##0.00 m2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 3175
        mmLeft = 212990
        mmTop = 1588
        mmWidth = 18785
        BandType = 4
      end
      object ppDBMemo16: TppDBMemo
        UserName = 'ppDBMemo16'
        CharWrap = False
        DataField = 'NOMEIMOVEL'
        DataPipeline = pplListagemImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 15875
        mmLeft = 34925
        mmTop = 1588
        mmWidth = 54769
        BandType = 4
        mmBottomOffset = 40
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText50: TppDBText
        UserName = 'ppDBText50'
        DataField = 'OCUPACAO_IMOVEL'
        DataPipeline = pplListagemImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 2910
        mmLeft = 255853
        mmTop = 1588
        mmWidth = 15081
        BandType = 4
      end
      object ppLine40: TppLine
        UserName = 'ppLine40'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 4233
        mmTop = 0
        mmWidth = 266436
        BandType = 4
      end
      object rptListagemImovelDBText1: TppDBText
        UserName = 'rptListagemImovelDBText1'
        DataField = 'CUSTO_CONTABIL'
        DataPipeline = pplListagemImovel
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 3175
        mmLeft = 232569
        mmTop = 1588
        mmWidth = 21431
        BandType = 4
      end
      object rptListagemImovelDBText4: TppDBText
        UserName = 'rptListagemImovelDBText4'
        DataField = 'IMOVLRCOMPRA'
        DataPipeline = pplListagemImovel
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 3175
        mmLeft = 179917
        mmTop = 1588
        mmWidth = 20638
        BandType = 4
      end
      object rptListagemImovelDBText5: TppDBText
        UserName = 'rptListagemImovelDBText5'
        DataField = 'IMODATACOMPRA'
        DataPipeline = pplListagemImovel
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 3175
        mmLeft = 164042
        mmTop = 1588
        mmWidth = 15346
        BandType = 4
      end
      object rptListagemImovelDBText6: TppDBText
        UserName = 'rptListagemImovelDBText6'
        DataField = 'MOEDA_COMPRA'
        DataPipeline = pplListagemImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 3175
        mmLeft = 201877
        mmTop = 1588
        mmWidth = 10319
        BandType = 4
      end
      object rptListagemImovelDBMemo1: TppDBMemo
        UserName = 'rptListagemImovelDBMemo1'
        CharWrap = False
        DataField = 'IMOMATRICULA'
        DataPipeline = pplListagemImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 15875
        mmLeft = 4233
        mmTop = 1588
        mmWidth = 14552
        BandType = 4
        mmBottomOffset = 40
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptListagemImovelDBMemo2: TppDBMemo
        UserName = 'rptListagemImovelDBMemo2'
        CharWrap = False
        DataField = 'TIPO_IMOVEL'
        DataPipeline = pplListagemImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 15875
        mmLeft = 90488
        mmTop = 1588
        mmWidth = 32808
        BandType = 4
        mmBottomOffset = 40
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptListagemImovelDBMemo3: TppDBMemo
        UserName = 'rptListagemImovelDBMemo3'
        CharWrap = False
        DataField = 'CARTEIRA_INVESTIMENTO'
        DataPipeline = pplListagemImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 3175
        mmLeft = 124090
        mmTop = 1588
        mmWidth = 39158
        BandType = 4
        mmBottomOffset = 40
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptListagemImovelDBMemo4: TppDBMemo
        UserName = 'rptListagemImovelDBMemo4'
        CharWrap = False
        DataField = 'IMOCODIGO'
        DataPipeline = pplListagemImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplListagemImovel'
        mmHeight = 15875
        mmLeft = 19579
        mmTop = 1588
        mmWidth = 14552
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand14: TppFooterBand
      mmBottomOffset = 40
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine41: TppLine
        UserName = 'ppLine41'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 270670
        BandType = 8
      end
      object ppLabel136: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel136'
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
      object ppCalc27: TppSystemVariable
        UserName = 'Calc27'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 113506
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc28: TppSystemVariable
        UserName = 'Calc28'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 235480
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
    object ppGroup11: TppGroup
      BreakName = 'NOMEMESTRE'
      DataPipeline = pplListagemImovel
      OutlineSettings.CreateNode = True
      UserName = 'Group11'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplListagemImovel'
      object ppGroupHeaderBand11: TppGroupHeaderBand
        mmBottomOffset = 40
        mmHeight = 15346
        mmPrintPosition = 0
        object ppLine42: TppLine
          UserName = 'ppLine42'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2.25
          mmHeight = 794
          mmLeft = 0
          mmTop = 4233
          mmWidth = 270670
          BandType = 3
          GroupNo = 0
        end
        object ppLabel137: TppLabel
          UserName = 'ppLabel137'
          Caption = 'Imóvel Mestre:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 0
          mmTop = 1058
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object ppDBText58: TppDBText
          UserName = 'ppDBText58'
          AutoSize = True
          DataField = 'NOMEMESTRE'
          DataPipeline = pplListagemImovel
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplListagemImovel'
          mmHeight = 2910
          mmLeft = 19050
          mmTop = 1058
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLine43: TppLine
          UserName = 'ppLine43'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 4233
          mmTop = 15081
          mmWidth = 266436
          BandType = 3
          GroupNo = 0
        end
        object ppDBText59: TppDBText
          UserName = 'ppDBText59'
          AutoSize = True
          DataField = 'EnderecoExtenso'
          DataPipeline = pplListagemImovel
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplListagemImovel'
          mmHeight = 2910
          mmLeft = 0
          mmTop = 5821
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object ppLabel138: TppLabel
          UserName = 'ppLabel138'
          Caption = 'Nome do Imóvel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 34925
          mmTop = 12171
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object ppLabel142: TppLabel
          UserName = 'ppLabel142'
          Caption = 'Custo Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 235744
          mmTop = 12171
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object ppLabel143: TppLabel
          UserName = 'ppLabel143'
          AutoSize = False
          Caption = 'Área Útil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 216694
          mmTop = 12171
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object rptListagemImovelLabel1: TppLabel
          UserName = 'rptListagemImovelLabel1'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 4233
          mmTop = 12171
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object rptListagemImovelLabel2: TppLabel
          UserName = 'rptListagemImovelLabel2'
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 90488
          mmTop = 12171
          mmWidth = 5292
          BandType = 3
          GroupNo = 0
        end
        object rptListagemImovelLabel3: TppLabel
          UserName = 'rptListagemImovelLabel3'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 169069
          mmTop = 12171
          mmWidth = 5292
          BandType = 3
          GroupNo = 0
        end
        object rptListagemImovelLabel4: TppLabel
          UserName = 'rptListagemImovelLabel4'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 194205
          mmTop = 12171
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
        object rptListagemImovelLabel5: TppLabel
          UserName = 'rptListagemImovelLabel5'
          Caption = 'Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 202407
          mmTop = 12171
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object rptListagemImovelLabel9: TppLabel
          UserName = 'rptListagemImovelLabel9'
          Caption = 'Aquisição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 182034
          mmTop = 7673
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object rptListagemImovelLine1: TppLine
          UserName = 'rptListagemImovelLine1'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 164042
          mmTop = 11113
          mmWidth = 47625
          BandType = 3
          GroupNo = 0
        end
        object rptListagemImovelLabel6: TppLabel
          UserName = 'rptListagemImovelLabel6'
          Caption = 'Carteira de Investimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 124090
          mmTop = 12171
          mmWidth = 29369
          BandType = 3
          GroupNo = 0
        end
        object rptListagemImovelLabel7: TppLabel
          UserName = 'rptListagemImovelLabel7'
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 19579
          mmTop = 12171
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand11: TppGroupFooterBand
        mmBottomOffset = 40
        mmHeight = 15081
        mmPrintPosition = 0
        object ppShape3: TppShape
          UserName = 'ppShape3'
          Pen.Width = 2
          mmHeight = 5556
          mmLeft = 211667
          mmTop = 3175
          mmWidth = 43921
          BandType = 5
          GroupNo = 0
        end
        object ppLine44: TppLine
          UserName = 'ppLine44'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 4233
          mmTop = 1058
          mmWidth = 266436
          BandType = 5
          GroupNo = 0
        end
        object ppLabel150: TppLabel
          UserName = 'ppLabel150'
          Caption = 'Total do Imóvel Mestre:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 182034
          mmTop = 4233
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'ppDBCalc5'
          DataField = 'IMOAREA'
          DataPipeline = pplListagemImovel
          DisplayFormat = '###,###,##0.00 m2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplListagemImovel'
          mmHeight = 3175
          mmLeft = 212990
          mmTop = 4233
          mmWidth = 18785
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'ppDBCalc7'
          DataField = 'CUSTO_CONTABIL'
          DataPipeline = pplListagemImovel
          DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplListagemImovel'
          mmHeight = 3175
          mmLeft = 232569
          mmTop = 4233
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object rptListagemImovelLabel8: TppLabel
          UserName = 'rptListagemImovelLabel8'
          Caption = 'Total de Imóveis:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 12700
          mmTop = 4233
          mmWidth = 22490
          BandType = 5
          GroupNo = 0
        end
        object rptListagemImovelDBCalc1: TppDBCalc
          UserName = 'rptListagemImovelDBCalc1'
          DataField = 'NOMEIMOVEL'
          DataPipeline = pplListagemImovel
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup11
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplListagemImovel'
          mmHeight = 3175
          mmLeft = 34925
          mmTop = 4233
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryContratoXImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CX.IDCONTRATOIMOVEL, CX.IDIMOVEL,'
      '   CX.FLGRATEIO, CX.CIMPERCENTRATEIO,'
      '   CX.CIMDESCRICAO'
      'FROM'
      '   CONTRATOXIMOVEL CX'
      'WHERE'
      '   CX.IDCONTRATOIMOVEL =:CONTRATO')
    ValidateWithMask = True
    Left = 240
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end>
    object qryContratoXImovelIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'CONTRATOXIMOVEL.IDCONTRATOIMOVEL'
    end
    object qryContratoXImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'CONTRATOXIMOVEL.IDIMOVEL'
    end
    object qryContratoXImovelFLGRATEIO: TFloatField
      FieldName = 'FLGRATEIO'
      Origin = 'CONTRATOXIMOVEL.FLGRATEIO'
    end
    object qryContratoXImovelCIMPERCENTRATEIO: TFloatField
      FieldName = 'CIMPERCENTRATEIO'
      Origin = 'CONTRATOXIMOVEL.CIMPERCENTRATEIO'
    end
    object qryContratoXImovelCIMDESCRICAO: TStringField
      FieldName = 'CIMDESCRICAO'
      Origin = 'CONTRATOXIMOVEL.CIMDESCRICAO'
      Size = 60
    end
  end
  object qryListagemProposta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   P.IDPROPOSTA, P.IDEMPRESAPROP,'
      ''
      '   P.PRODATA, P.PRONOME, P.PRODESCRICAO,'
      '   P.PROVLROM, P.PROVLR, P.PROTIR, P.PROPAYBACK,'
      '   P.PROCONDICOES, P.PROAPRESENTADA, P.PRONUMERO,'
      ''
      '   PP.NOME AS NF_PROPRIETARIO, '
      '   PP.RAZAOSOCIAL AS RS_PROPRIETARIO,'
      '   (PP.NOME||'#39', '#39'||PP.RAZAOSOCIAL) AS COMPLETO_PROPRIETARIO,'
      '   PR.NOME AS NF_RESPONSAVEL,'
      '   TI.DESCTIPOIMOVEL AS TIPO_IMOVEL,'
      '   M.MOESIGLA'
      'FROM'
      '   PESSOA PP, PESSOA PR,'
      '   PROPOSTANOVONEGOC P,'
      '   TIPOIMOVEL TI, MOEDA M'
      'WHERE'
      '   ( P.IDPROPRIETARIOUH = PP.IDPESSOA(+) )'
      '   AND ( P.IDRESPONSAVEL = PR.IDPESSOA(+) )'
      '   AND ( P.CODTIPIMOVEL = TI.CODTIPIMOVEL(+) )'
      '   AND ( P.MOECODIGO = M.MOECODIGO )')
    ValidateWithMask = True
    Left = 232
    Top = 56
    object qryListagemPropostaIDPROPOSTA: TFloatField
      FieldName = 'IDPROPOSTA'
    end
    object qryListagemPropostaIDEMPRESAPROP: TFloatField
      FieldName = 'IDEMPRESAPROP'
    end
    object qryListagemPropostaPRODATA: TDateTimeField
      FieldName = 'PRODATA'
    end
    object qryListagemPropostaPRONOME: TStringField
      FieldName = 'PRONOME'
      Size = 60
    end
    object qryListagemPropostaPRODESCRICAO: TMemoField
      FieldName = 'PRODESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryListagemPropostaPROVLROM: TFloatField
      FieldName = 'PROVLROM'
    end
    object qryListagemPropostaPROVLR: TFloatField
      FieldName = 'PROVLR'
    end
    object qryListagemPropostaPROTIR: TFloatField
      FieldName = 'PROTIR'
    end
    object qryListagemPropostaPROPAYBACK: TFloatField
      FieldName = 'PROPAYBACK'
    end
    object qryListagemPropostaPROCONDICOES: TMemoField
      FieldName = 'PROCONDICOES'
      BlobType = ftMemo
      Size = 2000
    end
    object qryListagemPropostaPROAPRESENTADA: TStringField
      FieldName = 'PROAPRESENTADA'
      Size = 60
    end
    object qryListagemPropostaPRONUMERO: TStringField
      FieldName = 'PRONUMERO'
    end
    object qryListagemPropostaNF_PROPRIETARIO: TStringField
      FieldName = 'NF_PROPRIETARIO'
      Size = 60
    end
    object qryListagemPropostaRS_PROPRIETARIO: TStringField
      FieldName = 'RS_PROPRIETARIO'
      Size = 60
    end
    object qryListagemPropostaNF_RESPONSAVEL: TStringField
      FieldName = 'NF_RESPONSAVEL'
      Size = 60
    end
    object qryListagemPropostaTIPO_IMOVEL: TStringField
      FieldName = 'TIPO_IMOVEL'
      Size = 25
    end
    object qryListagemPropostaMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryListagemPropostaCOMPLETO_PROPRIETARIO: TStringField
      FieldName = 'COMPLETO_PROPRIETARIO'
      Size = 122
    end
  end
  object dsListagemProposta: TwwDataSource
    DataSet = qryListagemProposta
    Left = 232
    Top = 68
  end
  object pplListagemProposta: TppBDEPipeline
    DataSource = dsListagemProposta
    UserName = 'lListagemProposta'
    Left = 232
    Top = 80
  end
  object rptListagemProposta: TppReport
    AutoStop = False
    DataPipeline = pplListagemProposta
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 6615
    PrinterSetup.mmMarginRight = 6615
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 297128
    PrinterSetup.mmPaperWidth = 210080
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
    Left = 232
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplListagemProposta'
    object ppHeaderBand27: TppHeaderBand
      mmBottomOffset = 40
      mmHeight = 36777
      mmPrintPosition = 0
      object ppLabel268: TppLabel
        UserName = 'ppLabel268'
        AutoSize = False
        Caption = 'Listagem de Propostas de Novos Negócios'
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
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel272: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel272'
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
        mmWidth = 196850
        BandType = 0
      end
      object rptListagemPropostaLabel9: TppLabel
        UserName = 'rptListagemPropostaLabel9'
        Caption = 'Período de Datas: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 21960
        mmWidth = 26194
        BandType = 0
      end
      object rptListagemPropostaLabel10: TppLabel
        UserName = 'rptListagemPropostaLabel10'
        AutoSize = False
        Caption = ' a '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 43921
        mmTop = 21960
        mmWidth = 3175
        BandType = 0
      end
      object rptListagemPropostalblDataIni: TppLabel
        UserName = 'rptListagemPropostalblDataIni'
        AutoSize = False
        Caption = 'rptListagemPropostalblDataIni'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 29369
        mmTop = 21960
        mmWidth = 14817
        BandType = 0
      end
      object rptListagemPropostalblDataFim: TppLabel
        UserName = 'rptListagemPropostalblDataFim'
        AutoSize = False
        Caption = 'rptListagemPropostalblDataFim'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 46831
        mmTop = 21960
        mmWidth = 14817
        BandType = 0
      end
      object rptListagemPropostaLabel13: TppLabel
        UserName = 'rptListagemPropostaLabel13'
        Caption = 'Segmento: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 12171
        mmTop = 27252
        mmWidth = 16669
        BandType = 0
      end
      object rptListagemPropostalblSegmento: TppLabel
        UserName = 'rptListagemPropostalblSegmento'
        Caption = 'rptListagemPropostalblSegmento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 29369
        mmTop = 27252
        mmWidth = 39952
        BandType = 0
      end
      object rptListagemPropostalblStatus: TppLabel
        UserName = 'rptListagemPropostalblStatus'
        Caption = '                                                     '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 152929
        mmTop = 27252
        mmWidth = 42069
        BandType = 0
      end
    end
    object ppDetailBand27: TppDetailBand
      mmBottomOffset = 40
      mmHeight = 38894
      mmPrintPosition = 0
      object rptListagemPropostaShape1: TppShape
        UserName = 'rptListagemPropostaShape1'
        mmHeight = 27252
        mmLeft = 1058
        mmTop = 1852
        mmWidth = 194998
        BandType = 4
      end
      object ppDBText108: TppDBText
        UserName = 'ppDBText108'
        DataField = 'PRODATA'
        DataPipeline = pplListagemProposta
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemProposta'
        mmHeight = 3704
        mmLeft = 178859
        mmTop = 3175
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel281: TppLabel
        UserName = 'ppLabel281'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        Caption = 'Payback: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        mmHeight = 3704
        mmLeft = 142875
        mmTop = 16933
        mmWidth = 13494
        BandType = 4
      end
      object ppLabel283: TppLabel
        UserName = 'ppLabel283'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        Caption = 'Valor: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        mmHeight = 3704
        mmLeft = 147109
        mmTop = 12700
        mmWidth = 9260
        BandType = 4
      end
      object ppLabel284: TppLabel
        UserName = 'ppLabel284'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        Caption = 'Proponente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 10054
        mmTop = 13494
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText115: TppDBText
        UserName = 'ppDBText115'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        DataField = 'PROVLROM'
        DataPipeline = pplListagemProposta
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListagemProposta'
        mmHeight = 3704
        mmLeft = 156104
        mmTop = 12700
        mmWidth = 23548
        BandType = 4
      end
      object ppLabel294: TppLabel
        UserName = 'ppLabel294'
        Caption = 'Proposta:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 14023
        mmTop = 9260
        mmWidth = 14023
        BandType = 4
      end
      object rptListagemPropostaLabel1: TppLabel
        UserName = 'rptListagemPropostaLabel1'
        Caption = 'Nº Proposta:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 3175
        mmWidth = 19315
        BandType = 4
      end
      object rptListagemPropostaLabel2: TppLabel
        UserName = 'rptListagemPropostaLabel2'
        Caption = 'Data:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 170657
        mmTop = 3175
        mmWidth = 8467
        BandType = 4
      end
      object rptListagemPropostaDBText1: TppDBText
        UserName = 'rptListagemPropostaDBText1'
        ReprintOnOverFlow = True
        DataField = 'PROAPRESENTADA'
        DataPipeline = pplListagemProposta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemProposta'
        mmHeight = 3704
        mmLeft = 29898
        mmTop = 19579
        mmWidth = 110067
        BandType = 4
      end
      object rptListagemPropostaDBText2: TppDBText
        UserName = 'rptListagemPropostaDBText2'
        ReprintOnOverFlow = True
        DataField = 'PRONOME'
        DataPipeline = pplListagemProposta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemProposta'
        mmHeight = 3704
        mmLeft = 29898
        mmTop = 9260
        mmWidth = 110067
        BandType = 4
      end
      object rptListagemPropostaLabel4: TppLabel
        UserName = 'rptListagemPropostaLabel4'
        Caption = 'Apresentada por:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 19579
        mmWidth = 25400
        BandType = 4
      end
      object rptListagemPropostaLine1: TppLine
        UserName = 'rptListagemPropostaLine1'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 1323
        mmTop = 7673
        mmWidth = 194469
        BandType = 4
      end
      object rptListagemPropostaDBText3: TppDBText
        UserName = 'rptListagemPropostaDBText3'
        ReprintOnOverFlow = True
        AutoSize = True
        DataField = 'PRONUMERO'
        DataPipeline = pplListagemProposta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemProposta'
        mmHeight = 3175
        mmLeft = 21696
        mmTop = 3175
        mmWidth = 18521
        BandType = 4
      end
      object rptListagemPropostaDBText4: TppDBText
        UserName = 'rptListagemPropostaDBText4'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        DataField = 'MOESIGLA'
        DataPipeline = pplListagemProposta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemProposta'
        mmHeight = 3704
        mmLeft = 181505
        mmTop = 12700
        mmWidth = 13494
        BandType = 4
      end
      object rptListagemPropostaLabel5: TppLabel
        UserName = 'rptListagemPropostaLabel5'
        Caption = 'meses'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 181505
        mmTop = 16933
        mmWidth = 8467
        BandType = 4
      end
      object rptListagemPropostaLabel6: TppLabel
        UserName = 'rptListagemPropostaLabel6'
        Caption = 'Segmento:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 86519
        mmTop = 3175
        mmWidth = 17463
        BandType = 4
      end
      object rptListagemPropostaDBText5: TppDBText
        UserName = 'rptListagemPropostaDBText5'
        ReprintOnOverFlow = True
        AutoSize = True
        DataField = 'TIPO_IMOVEL'
        DataPipeline = pplListagemProposta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemProposta'
        mmHeight = 3175
        mmLeft = 103717
        mmTop = 3175
        mmWidth = 18521
        BandType = 4
      end
      object rptListagemPropostaLabel7: TppLabel
        UserName = 'rptListagemPropostaLabel7'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        Caption = 'Responsável:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 8467
        mmTop = 23813
        mmWidth = 19579
        BandType = 4
      end
      object rptListagemPropostaDBText6: TppDBText
        UserName = 'rptListagemPropostaDBText6'
        ReprintOnOverFlow = True
        DataField = 'NF_RESPONSAVEL'
        DataPipeline = pplListagemProposta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemProposta'
        mmHeight = 3704
        mmLeft = 29898
        mmTop = 23813
        mmWidth = 110067
        BandType = 4
      end
      object rptListagemPropostaDBText7: TppDBText
        UserName = 'rptListagemPropostaDBText7'
        ReprintOnOverFlow = True
        DataField = 'RS_PROPRIETARIO'
        DataPipeline = pplListagemProposta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListagemProposta'
        mmHeight = 3704
        mmLeft = 29898
        mmTop = 13494
        mmWidth = 110067
        BandType = 4
      end
      object rptListagemPropostaLabel3: TppLabel
        UserName = 'rptListagemPropostaLabel3'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 181505
        mmTop = 21167
        mmWidth = 2646
        BandType = 4
      end
      object rptListagemPropostaDBText8: TppDBText
        UserName = 'rptListagemPropostaDBText8'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        DataField = 'PROPAYBACK'
        DataPipeline = pplListagemProposta
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListagemProposta'
        mmHeight = 3704
        mmLeft = 156104
        mmTop = 16933
        mmWidth = 23548
        BandType = 4
      end
      object rptListagemPropostaDBText9: TppDBText
        UserName = 'rptListagemPropostaDBText9'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        DataField = 'PROTIR'
        DataPipeline = pplListagemProposta
        DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListagemProposta'
        mmHeight = 3704
        mmLeft = 156104
        mmTop = 21167
        mmWidth = 23548
        BandType = 4
      end
      object rptListagemPropostaLabel8: TppLabel
        UserName = 'rptListagemPropostaLabel8'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        Caption = 'T.I.R.: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        mmHeight = 3704
        mmLeft = 147902
        mmTop = 21167
        mmWidth = 8467
        BandType = 4
      end
      object rptListagemPropostaLine2: TppLine
        UserName = 'rptListagemPropostaLine2'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 19050
        mmLeft = 141023
        mmTop = 8996
        mmWidth = 265
        BandType = 4
      end
    end
    object ppFooterBand27: TppFooterBand
      mmBottomOffset = 40
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine99: TppLine
        UserName = 'ppLine99'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 196850
        BandType = 8
      end
      object ppLabel299: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel299'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc52: TppSystemVariable
        UserName = 'Calc52'
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
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc53: TppSystemVariable
        UserName = 'Calc53'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 160602
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
  end
end
