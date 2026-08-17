inherited dtmRelContrConc: TdtmRelContrConc
  Left = 416
  Top = 284
  Width = 281
  Height = 180
  Caption = 'dRelContrConc'
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
  object pplContrCon: TppBDEPipeline
    DataSource = dtsContrConc
    CloseDataSource = True
    UserName = 'lExemplo1'
    Left = 120
    Top = 56
  end
  object dtsContrConc: TwwDataSource
    DataSet = qryContrConc
    Left = 120
    Top = 68
  end
  object qryContrConc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PLA.NOME AS PLANO,'
      '   PAT.NOME AS PATRO,'
      '   CON.TCEDESCRICAO,'
      '   CON.IDCONTRATOEMPTMO,'
      '   CON.MATRICULA,'
      '   CON.NOME,'
      '   HME.ITEDESCRICAO,'
      '   CON.VLRCONTRATO,'
      '   HME.HMEVLRPREVISTO AS VLRPREVISTO,'
      '   HME.HMEVLRPREVISTO AS VLRCREDITO,'
      '   HME.ITCSEQCALCULO,'
      '   CON.VLRPARCELA,'
      '   CON.DATACREDITO,'
      '   CON.DATAASSINATURA,'
      '   SEG.HMEVLRPREVISTO AS SEGURO,'
      '   DECODE(CON.FLGSITUACAO,'
      '             '#39'A'#39', '#39'Ativo'#39','
      '             '#39'C'#39', '#39'Cancelado'#39','
      '             '#39'J'#39', '#39'Cobrança Jurídica'#39','
      '             '#39'E'#39', '#39'Encerrado'#39','
      '             '#39'Q'#39', '#39'Quitado'#39','
      '             '#39'R'#39', '#39'Refinanciado'#39','
      '             '#39'S'#39', '#39'Suspenso'#39','
      '             '#39'K'#39', '#39'Pendente de Quitação'#39') AS STATUSCONTR'
      'FROM'
      '   PLANPREV      PLA,'
      '   PESSOA        PAT,'
      '   VWCONTRATOEP  CON,'
      '   VW_MOVEP      HME,'
      '   (SELECT'
      '        HME.HMEVLRPREVISTO'
      '    FROM'
      '        VWCONTRATOEP  CON,'
      '        HISTMOVEMPTMO HME'
      '    WHERE'
      '        HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO'
      '    AND CON.IDCONTRATOEMPTMO = 325227'
      '    AND HME.IDITEMEMPTMO     = 10'
      '   ) SEG'
      'WHERE'
      '       ( CON.IDEMPRESAPROP     = 1 )'
      '   AND ( HME.EVENTO            = 0 )'
      '   AND ( HMECENTRALIZA         = 1 )'
      '   AND CON.IDCONTRATOEMPTMO = 325227'
      '   AND ( HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO )'
      '   AND ( PAT.IDPESSOA          = CON.IDPATRO )'
      '   AND ( PLA.IDPLANOPREV       = CON.IDPLANOPREV )'
      'ORDER BY'
      
        '   PLA.NOME, PAT.NOME, CON.TCEDESCRICAO, CON.IDCONTRATOEMPTMO, H' +
        'ME.ITCSEQCALCULO DESC'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 120
    Top = 80
    object qryContrConcPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object qryContrConcPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryContrConcTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryContrConcIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContrConcMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryContrConcNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryContrConcVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryContrConcVLRPREVISTO: TFloatField
      FieldName = 'VLRPREVISTO'
    end
    object qryContrConcVLRCREDITO: TFloatField
      FieldName = 'VLRCREDITO'
    end
    object qryContrConcVLRPARCELA: TFloatField
      FieldName = 'VLRPARCELA'
    end
    object qryContrConcDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryContrConcDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object qryContrConcSTATUSCONTR: TStringField
      FieldName = 'STATUSCONTR'
    end
    object qryContrConcSEGURO: TFloatField
      FieldName = 'SEGURO'
    end
  end
  object rpContrConc: TppReport
    AutoStop = False
    DataPipeline = pplContrCon
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Empréstimos Concedidos'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
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
    Left = 120
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplContrCon'
    object rptContratosAdminSint_CabecalhoRelat: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 28310
      mmPrintPosition = 0
      object pplbTitulo: TppLabel
        UserName = 'lbTitulo'
        AutoSize = False
        Caption = 'Empréstimos Concedidos (por Plano / Patrocinadora)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 9260
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
        mmLeft = 9260
        mmTop = 2910
        mmWidth = 161396
        BandType = 0
      end
      object lblTipoData: TppLabel
        OnPrint = lblTipoDataPrint
        UserName = 'lblTipoData'
        AutoSize = False
        Caption = 'Data de Assinatura:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 529
        mmTop = 20902
        mmWidth = 29104
        BandType = 0
      end
      object rptContrCond_lblDataIni: TppLabel
        UserName = 'rptContrCond_lblDataIni'
        AutoSize = False
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 31485
        mmTop = 20902
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
        mmLeft = 47361
        mmTop = 20902
        mmWidth = 1323
        BandType = 0
      end
      object rptContrCond_lblDataFim: TppLabel
        UserName = 'lblIni1'
        AutoSize = False
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 49742
        mmTop = 20902
        mmWidth = 14817
        BandType = 0
      end
    end
    object ppItensContrato: TppDetailBand
      BeforePrint = ppItensContratoBeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 4498
      mmPrintPosition = 0
      object shpItem: TppShape
        OnPrint = shpItemPrint
        UserName = 'shpItem'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 183622
        BandType = 4
      end
      object ppLine1: TppLine
        OnPrint = ppLine1Print
        UserName = 'Line1'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 183622
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'ITEDESCRICAO'
        DataPipeline = pplContrCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContrCon'
        mmHeight = 2910
        mmLeft = 107421
        mmTop = 794
        mmWidth = 49477
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'VLRPREVISTO'
        DataPipeline = pplContrCon
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContrCon'
        mmHeight = 2910
        mmLeft = 168805
        mmTop = 794
        mmWidth = 12965
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
        mmWidth = 183622
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
        mmLeft = 84402
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
        mmLeft = 157427
        mmTop = 3175
        mmWidth = 25400
        BandType = 8
      end
    end
    object rptContratosAdminSintSummaryBand1: TppSummaryBand
      mmBottomOffset = 40
      mmHeight = 15081
      mmPrintPosition = 0
      object rptContratosAdminSintLine1: TppLine
        UserName = 'rptContratosAdminSintLine1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 529
        mmWidth = 183622
        BandType = 7
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Pen.Width = 2
        mmHeight = 5292
        mmLeft = 120915
        mmTop = 2117
        mmWidth = 30427
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'VLRCONTRATO'
        DataPipeline = pplContrCon
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContrCon'
        mmHeight = 2910
        mmLeft = 122238
        mmTop = 3175
        mmWidth = 12965
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'VLRCREDITO'
        DataPipeline = pplContrCon
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContrCon'
        mmHeight = 2910
        mmLeft = 137054
        mmTop = 3175
        mmWidth = 12965
        BandType = 7
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Total Geral:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 104246
        mmTop = 2910
        mmWidth = 16933
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc12'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplContrCon
        DisplayFormat = '#,#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pplContrCon'
        mmHeight = 2910
        mmLeft = 5292
        mmTop = 3175
        mmWidth = 9790
        BandType = 7
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Contrato(s)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 16404
        mmTop = 2910
        mmWidth = 15081
        BandType = 7
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'PLANO'
      DataPipeline = pplContrCon
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContrCon'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          AutoSize = True
          DataField = 'PLANO'
          DataPipeline = pplContrCon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplContrCon'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 1058
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'rptContratosAdminSint_LinhaTitulo1'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2.25
          mmHeight = 529
          mmLeft = 0
          mmTop = 4763
          mmWidth = 183622
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object ppShape7: TppShape
          UserName = 'Shape7'
          mmHeight = 4763
          mmLeft = 120915
          mmTop = 1852
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label101'
          Caption = 'Total do Plano:  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 101865
          mmTop = 2910
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 183622
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'VLRCONTRATO'
          DataPipeline = pplContrCon
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContrCon'
          mmHeight = 2910
          mmLeft = 122238
          mmTop = 2910
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'VLRCREDITO'
          DataPipeline = pplContrCon
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContrCon'
          mmHeight = 2910
          mmLeft = 137054
          mmTop = 2646
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplContrCon
          DisplayFormat = '#,#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplContrCon'
          mmHeight = 2910
          mmLeft = 6350
          mmTop = 2910
          mmWidth = 8731
          BandType = 5
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = 'Contrato(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 16669
          mmTop = 2910
          mmWidth = 13494
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'PATRO'
      DataPipeline = pplContrCon
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContrCon'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          AutoSize = True
          DataField = 'PATRO'
          DataPipeline = pplContrCon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplContrCon'
          mmHeight = 3175
          mmLeft = 2117
          mmTop = 1058
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'rptContratosAdminSint_LinhaTitulo2'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2.25
          mmHeight = 529
          mmLeft = 0
          mmTop = 4763
          mmWidth = 183622
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 265
          mmWidth = 183622
          BandType = 5
          GroupNo = 0
        end
        object ppShape6: TppShape
          UserName = 'Shape6'
          mmHeight = 4763
          mmLeft = 120915
          mmTop = 1852
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Total da Patrocinadora:  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 92340
          mmTop = 2910
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'VLRCONTRATO'
          DataPipeline = pplContrCon
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContrCon'
          mmHeight = 2910
          mmLeft = 122238
          mmTop = 2910
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'VLRCREDITO'
          DataPipeline = pplContrCon
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContrCon'
          mmHeight = 2910
          mmLeft = 137054
          mmTop = 2910
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplContrCon
          DisplayFormat = '#,#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplContrCon'
          mmHeight = 2910
          mmLeft = 6350
          mmTop = 2910
          mmWidth = 8731
          BandType = 5
          GroupNo = 1
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'Contrato(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 16669
          mmTop = 2910
          mmWidth = 13229
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'TCEDESCRICAO'
      DataPipeline = pplContrCon
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContrCon'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppShape1: TppShape
          OnPrint = ppShape1Print
          UserName = 'rptContratosAdminSint_FundoBandaDetalhe1'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          Pen.Color = clAqua
          Pen.Style = psClear
          ReprintOnOverFlow = True
          StretchWithParent = True
          mmHeight = 9790
          mmLeft = 0
          mmTop = 0
          mmWidth = 183622
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText101'
          DataField = 'TCEDESCRICAO'
          DataPipeline = pplContrCon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplContrCon'
          mmHeight = 3175
          mmLeft = 4763
          mmTop = 1588
          mmWidth = 83079
          BandType = 3
          GroupNo = 0
        end
        object rptContratosAdminSintLabel18: TppLabel
          UserName = 'rptContratosAdminSintLabel18'
          Caption = 'Mutuário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 31750
          mmTop = 6350
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object rptContratosAdminSintLabel19: TppLabel
          UserName = 'rptContratosAdminSintLabel19'
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 4763
          mmTop = 6350
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object rptContratosAdminSint_LinhaTitulo: TppLine
          UserName = 'rptContratosAdminSint_LinhaTitulo'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2.25
          mmHeight = 529
          mmLeft = 0
          mmTop = 9525
          mmWidth = 183622
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 16933
          mmTop = 6350
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label5'
          Caption = 'Data de'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 94456
          mmTop = 3175
          mmWidth = 8996
          BandType = 3
          GroupNo = 2
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'Assinatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 92869
          mmTop = 6350
          mmWidth = 12435
          BandType = 3
          GroupNo = 2
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 129117
          mmTop = 3175
          mmWidth = 6085
          BandType = 3
          GroupNo = 2
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Solicitado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 123561
          mmTop = 6350
          mmWidth = 11642
          BandType = 3
          GroupNo = 2
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Valor do '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 139436
          mmTop = 3175
          mmWidth = 10583
          BandType = 3
          GroupNo = 2
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 141288
          mmTop = 6350
          mmWidth = 8731
          BandType = 3
          GroupNo = 2
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Valor da'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 155311
          mmTop = 3175
          mmWidth = 9525
          BandType = 3
          GroupNo = 2
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 156104
          mmTop = 6350
          mmWidth = 8731
          BandType = 3
          GroupNo = 2
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 109538
          mmTop = 6350
          mmWidth = 8731
          BandType = 3
          GroupNo = 2
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Data de'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 109273
          mmTop = 3175
          mmWidth = 8996
          BandType = 3
          GroupNo = 2
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          Caption = 'Valor do'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 170392
          mmTop = 3175
          mmWidth = 9790
          BandType = 3
          GroupNo = 2
        end
        object ppLabel22: TppLabel
          UserName = 'Label22'
          Caption = 'Seguro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 171715
          mmTop = 6350
          mmWidth = 8467
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object ppShape3: TppShape
          UserName = 'Shape3'
          mmHeight = 4763
          mmLeft = 120915
          mmTop = 1588
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLRCREDITO'
          DataPipeline = pplContrCon
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContrCon'
          mmHeight = 2910
          mmLeft = 137054
          mmTop = 2381
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VLRCONTRATO'
          DataPipeline = pplContrCon
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContrCon'
          mmHeight = 2910
          mmLeft = 122238
          mmTop = 2381
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 183622
          BandType = 5
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Total do Tipo de Contrato:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 88106
          mmTop = 2381
          mmWidth = 33073
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplContrCon
          DisplayFormat = '#,#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplContrCon'
          mmHeight = 2910
          mmLeft = 6350
          mmTop = 2381
          mmWidth = 8731
          BandType = 5
          GroupNo = 2
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Contrato(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 16669
          mmTop = 2381
          mmWidth = 13494
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDCONTRATOEMPTMO'
      DataPipeline = pplContrCon
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContrCon'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppLine2: TppLine
          OnPrint = ppLine1Print
          UserName = 'Line2'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 183622
          BandType = 3
          GroupNo = 3
        end
        object shpContrato: TppShape
          OnPrint = shpContratoPrint
          UserName = 'ppShapeDetalhe'
          Brush.Color = 13040076
          ParentHeight = True
          ParentWidth = True
          Pen.Color = clWhite
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 183622
          BandType = 3
          GroupNo = 3
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplContrCon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContrCon'
          mmHeight = 2910
          mmLeft = 0
          mmTop = 1058
          mmWidth = 15081
          BandType = 3
          GroupNo = 1
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'NOME'
          DataPipeline = pplContrCon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplContrCon'
          mmHeight = 2910
          mmLeft = 31750
          mmTop = 1058
          mmWidth = 58208
          BandType = 3
          GroupNo = 1
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'DATAASSINATURA'
          DataPipeline = pplContrCon
          DisplayFormat = 'DD/MM/YYYY'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplContrCon'
          mmHeight = 2910
          mmLeft = 92604
          mmTop = 1058
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
        object ppDBText15: TppDBText
          UserName = 'DBText15'
          DataField = 'DATACREDITO'
          DataPipeline = pplContrCon
          DisplayFormat = 'DD/MM/YYYY'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplContrCon'
          mmHeight = 2910
          mmLeft = 107686
          mmTop = 1058
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          DataField = 'VLRCONTRATO'
          DataPipeline = pplContrCon
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContrCon'
          mmHeight = 2910
          mmLeft = 122238
          mmTop = 1058
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'VLRCREDITO'
          DataPipeline = pplContrCon
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContrCon'
          mmHeight = 2910
          mmLeft = 137054
          mmTop = 1058
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
        object ppDBText14: TppDBText
          UserName = 'DBText14'
          DataField = 'VLRPARCELA'
          DataPipeline = pplContrCon
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContrCon'
          mmHeight = 2910
          mmLeft = 151871
          mmTop = 1058
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'MATRICULA'
          DataPipeline = pplContrCon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplContrCon'
          mmHeight = 2910
          mmLeft = 16933
          mmTop = 1058
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          DataField = 'SEGURO'
          DataPipeline = pplContrCon
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContrCon'
          mmHeight = 2910
          mmLeft = 167217
          mmTop = 1058
          mmWidth = 12965
          BandType = 3
          GroupNo = 3
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
end
