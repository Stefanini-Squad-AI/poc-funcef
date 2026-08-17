inherited DmRelRenFixMapaIOF: TDmRelRenFixMapaIOF
  Left = 382
  Top = 184
  Width = 219
  Height = 167
  Caption = 'DmRelRenFixMapaIOF'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 10
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
    Left = 10
    Top = 8
  end
  inherited qryExemplo: TwwQuery
    Left = 10
    Top = 8
  end
  inherited rpExemplo: TppReport
    Left = 10
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object pplMapaIOF: TppBDEPipeline
    DataSource = dsMapaIOF
    UserName = 'pplMapaIOF'
    Left = 45
    Top = 64
  end
  object dsMapaIOF: TwwDataSource
    AutoEdit = False
    DataSet = qryMapaIOF
    Left = 95
    Top = 64
  end
  object qryMapaIOF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PLANPRVCONTABPATRO, DESCCLASSETIT, INVESTIMENTO, DATAHIST' +
        'RENFIX, DATAVIGENCIA,'
      '       VLRITEM, VLRACUITEM, IDOPERRENFIXAPLIC'
      
        'FROM (SELECT PLANPRVCONTABPATRO, DESCCLASSETIT, INVESTIMENTO, DA' +
        'TAHISTRENFIX, DATAVIGENCIA,'
      '             VLRITEM, VLRACUITEM, IDOPERRENFIXAPLIC'
      '      FROM (SELECT PP.PLANPRVCONTABPATRO, CL.DESCCLASSETIT,'
      
        '                   IV.DESCINVESTIMENTO || '#39' - '#39' || TO_CHAR(OP.DA' +
        'TAOPERACAO, '#39'DD/MM/YYYY'#39') AS INVESTIMENTO,'
      '                   HI.DATAHISTRENFIX,'
      
        '                   (SELECT MAX(TRUNC(HO.DATAVIGENCIA)) AS DATAVI' +
        'GENCIA'
      '                    FROM HISTOPERRENFIX HO'
      '                    WHERE HO.IDOPERRENFIX = HI.IDOPERRENFIXAPLIC'
      
        '                      AND TRUNC(HO.DATAVIGENCIA) <= HI.DATAHISTR' +
        'ENFIX) AS DATAVIGENCIA,'
      
        '                   HT.PUITEM, HT.PUACUITEM, HT.VLRITEM, HT.VLRAC' +
        'UITEM,'
      '                   HT.IDCURVARENFIX, HI.IDOPERRENFIXAPLIC'
      
        '            FROM HISTRENFIXXITENS HT, ITEMRENFIX IT, INVESTIMENT' +
        'O IV, OPERRENFIX OP, CLASSETITRENFIX CL,'
      '                 (SELECT PA.IDPLANPREVCTBPATR,'
      
        '                         ('#39'Plano / Patrocinadora: '#39' || PL.NOME |' +
        '|'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      
        '                  FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPR' +
        'EVCONTABIL PL'
      '                  WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '                    AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      
        '                 (SELECT IDHISTRENFIX, DATAHISTRENFIX, IDINVESTI' +
        'MENTO, IDOPERRENFIXAPLIC, IDPLANPREVCTBPATR'
      '                    FROM HISTRENFIX'
      
        '                  WHERE ((:IDINVESTIMENTO IS NULL) OR (IDINVESTI' +
        'MENTO = :IDINVESTIMENTO))'
      
        '                    AND ((:IDOPERRENFIXAPLIC IS NULL) OR (IDOPER' +
        'RENFIXAPLIC = :IDOPERRENFIXAPLIC))) HI'
      
        '            WHERE ((:IDINVESTIMENTO IS NULL) OR (OP.IDINVESTIMEN' +
        'TO = :IDINVESTIMENTO))'
      
        '              AND ((:IDOPERRENFIXAPLIC IS NULL) OR (OP.IDOPERREN' +
        'FIX = :IDOPERRENFIXAPLIC))'
      
        '              AND ((:IDCLASSETIT IS NULL) OR (CL.IDCLASSETIT = :' +
        'IDCLASSETIT))'
      
        '              AND ((:IDEMISSOR IS NULL) OR (IV.IDEMISSOR = :IDEM' +
        'ISSOR))'
      '              AND ((:DATAINI IS NULL) OR'
      
        '                   (HI.DATAHISTRENFIX BETWEEN TO_DATE(:DATAINI,'#39 +
        'DD/MM/YYYY'#39') AND'
      
        '                                              TO_DATE(:DATAFIM,'#39 +
        'DD/MM/YYYY'#39')))'
      '              AND IT.IDITEMRENFIX = -8'
      '              AND HT.VLRITEM <> 0'
      '              AND HT.IDHISTRENFIX = HI.IDHISTRENFIX'
      '              AND HT.IDITEMRENFIX = IT.IDITEMRENFIX'
      '              AND HI.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '              AND HI.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX'
      '              AND HI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      '              AND IV.IDCLASSETIT = CL.IDCLASSETIT'
      
        '            ORDER BY PP.PLANPRVCONTABPATRO, CL.DESCCLASSETIT, IN' +
        'VESTIMENTO, HI.IDOPERRENFIXAPLIC,'
      '                     HI.DATAHISTRENFIX, HI.IDHISTRENFIX)'
      '      )'
      
        'ORDER BY PLANPRVCONTABPATRO, DESCCLASSETIT, INVESTIMENTO, IDOPER' +
        'RENFIXAPLIC,'
      '         DATAHISTRENFIX')
    ValidateWithMask = True
    Left = 146
    Top = 64
    ParamData = <
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
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
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
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end>
    object qryMapaIOFPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 136
    end
    object qryMapaIOFDESCCLASSETIT: TStringField
      FieldName = 'DESCCLASSETIT'
      Size = 30
    end
    object qryMapaIOFINVESTIMENTO: TStringField
      FieldName = 'INVESTIMENTO'
      Size = 73
    end
    object qryMapaIOFDATAHISTRENFIX: TDateTimeField
      FieldName = 'DATAHISTRENFIX'
    end
    object qryMapaIOFDATAVIGENCIA: TDateTimeField
      FieldName = 'DATAVIGENCIA'
    end
    object qryMapaIOFVLRITEM: TFloatField
      FieldName = 'VLRITEM'
    end
    object qryMapaIOFVLRACUITEM: TFloatField
      FieldName = 'VLRACUITEM'
    end
    object qryMapaIOFIDOPERRENFIXAPLIC: TFloatField
      FieldName = 'IDOPERRENFIXAPLIC'
    end
  end
  object rptMapaIOF: TppReport
    AutoStop = False
    DataPipeline = pplMapaIOF
    OnStartPage = rptMapaIOFStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Mapa de IOF'
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
    Left = 146
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplMapaIOF'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Mapa de IOF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 20902
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
      object lblInvestimento: TppLabel
        UserName = 'lblInvestimento'
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
        mmWidth = 11113
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = pplMapaIOF
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaIOF'
        mmHeight = 3704
        mmLeft = 122502
        mmTop = 14023
        mmWidth = 73025
        BandType = 0
      end
      object shpCabecalho: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 19050
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label1'
        Caption = 'Investimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 3175
        mmTop = 19050
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label2'
        Caption = 'Data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 112448
        mmTop = 19050
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label3'
        Caption = 'IOF Movimentado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 132027
        mmTop = 19050
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'IOF Acumulado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 173038
        mmTop = 19315
        mmWidth = 23548
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'INVESTIMENTO'
        DataPipeline = pplMapaIOF
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        ReprintOnSubsequent = True
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'pplMapaIOF'
        mmHeight = 3175
        mmLeft = 3175
        mmTop = 0
        mmWidth = 101071
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DATAHISTRENFIX'
        DataPipeline = pplMapaIOF
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplMapaIOF'
        mmHeight = 3175
        mmLeft = 107950
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VLRITEM'
        DataPipeline = pplMapaIOF
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaIOF'
        mmHeight = 3175
        mmLeft = 137054
        mmTop = 0
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'VLRACUITEM'
        DataPipeline = pplMapaIOF
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaIOF'
        mmHeight = 3175
        mmLeft = 173038
        mmTop = 0
        mmWidth = 23548
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
        mmWidth = 197300
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
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = pplMapaIOF
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplMapaIOF'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DESCCLASSETIT'
      DataPipeline = pplMapaIOF
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplMapaIOF'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object shpCabClasse: TppShape
          UserName = 'shpCabecalho1'
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 3704
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Classe'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 3175
          mmTop = 0
          mmWidth = 10319
          BandType = 3
          GroupNo = 1
        end
        object ppDBText3: TppDBText
          OnPrint = ppDBText3Print
          UserName = 'DBText3'
          DataField = 'DESCCLASSETIT'
          DataPipeline = pplMapaIOF
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplMapaIOF'
          mmHeight = 3704
          mmLeft = 14817
          mmTop = 0
          mmWidth = 99484
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'INVESTIMENTO'
      DataPipeline = pplMapaIOF
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplMapaIOF'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2117
        mmPrintPosition = 0
      end
    end
  end
end
