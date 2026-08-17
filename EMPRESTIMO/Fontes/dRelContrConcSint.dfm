inherited dtmRelContrConcSint: TdtmRelContrConcSint
  Left = 387
  Top = 217
  Width = 281
  Height = 192
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
  object pplContrConSint: TppBDEPipeline
    DataSource = dtsContrConcSint
    CloseDataSource = True
    UserName = 'lExemplo1'
    Left = 120
    Top = 56
    object pplContrConSintppField1: TppField
      FieldAlias = 'DESCTIPOEMPTMO'
      FieldName = 'DESCTIPOEMPTMO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object pplContrConSintppField2: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplContrConSintppField3: TppField
      FieldAlias = 'ITEDESCRICAO'
      FieldName = 'ITEDESCRICAO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object pplContrConSintppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'ITCSEQCALCULO'
      FieldName = 'ITCSEQCALCULO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplContrConSintppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRSOLIC'
      FieldName = 'VLRSOLIC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplContrConSintppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCREDITO'
      FieldName = 'VLRCREDITO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplContrConSintppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPREVISTO'
      FieldName = 'VLRPREVISTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object dtsContrConcSint: TwwDataSource
    DataSet = qryContrConcSint
    Left = 120
    Top = 68
  end
  object qryContrConcSint: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CON.DESCTIPOEMPTMO,'
      '  CON.TCEDESCRICAO,'
      '  HME.ITEDESCRICAO,'
      '  HME.ITCSEQCALCULO,'
      '  SUM(CON.VLRCONTRATO) AS VLRSOLIC,'
      '  SUM(HST.HMEVLRPREVISTO) AS VLRCREDITO,'
      '  sum(HME.HMEVLRPREVISTO) AS VLRPREVISTO'
      'FROM'
      '  VWCONTRATOEP  CON,'
      '  VW_MOVEP      HME,'
      '  (SELECT'
      '      IDCONTRATOEMPTMO,'
      '      SUM(HMEVLRPREVISTO) AS HMEVLRPREVISTO'
      '   FROM'
      '      VW_MOVEP'
      '   WHERE'
      '       ( HMECENTRALIZA     = 1 )'
      '   AND ( EVENTO            = 0 )'
      '   AND ( ITCSEQCALCULO    > 0)'
      '   GROUP BY'
      '       IDCONTRATOEMPTMO'
      '  ) HST'
      'WHERE'
      '      ( CON.IDEMPRESAPROP     = 1 )'
      ''
      '  AND 1 = 2'
      ''
      '  AND ( HME.EVENTO            = 0 )'
      '  AND ( HME.HMEMESCOMPETENCIA = 7 )'
      '  AND ( HME.HMEANOCOMPETENCIA = 2000 )'
      '  AND ( (HME.HMECENTRALIZA    = 0) OR (HME.HMEDESTACADO = 1) )'
      '  AND ( HME.ITCSEQCALCULO    > 0)'
      
        '  AND ( CON.IDPATRO IN (42904, 1, 42908, 2113, 2002, 42906, 2003' +
        ', 42902, 42905, 42907) )'
      '  AND ( CON.IDPLANOPREV IN (4, 6, 7) )'
      '  AND ( HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO )'
      '  AND ( HME.IDCONTRATOEMPTMO  = HST.IDCONTRATOEMPTMO )'
      'GROUP BY'
      '  CON.DESCTIPOEMPTMO,'
      '  CON.TCEDESCRICAO,'
      '  HME.ITEDESCRICAO,'
      '  HME.ITCSEQCALCULO'
      'ORDER BY'
      '  CON.DESCTIPOEMPTMO,CON.TCEDESCRICAO, HME.ITCSEQCALCULO DESC')
    ValidateWithMask = True
    Left = 120
    Top = 80
    object qryContrConcSintDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object qryContrConcSintTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryContrConcSintITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryContrConcSintITCSEQCALCULO: TFloatField
      FieldName = 'ITCSEQCALCULO'
    end
    object qryContrConcSintVLRSOLIC: TFloatField
      FieldName = 'VLRSOLIC'
    end
    object qryContrConcSintVLRCREDITO: TFloatField
      FieldName = 'VLRCREDITO'
    end
    object qryContrConcSintVLRPREVISTO: TFloatField
      FieldName = 'VLRPREVISTO'
    end
  end
  object rptContrConcSint: TppReport
    AutoStop = False
    DataPipeline = pplContrConSint
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Empréstimos Concedidos (Sintético)'
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
    DataPipelineName = 'pplContrConSint'
    object rptContratosAdminSint_CabecalhoRelat: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 43656
      mmPrintPosition = 0
      object pplbTitulo: TppLabel
        OnPrint = pplbTituloPrint
        UserName = 'lbTitulo'
        AutoSize = False
        Caption = 'pplbTitulo'
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
        mmLeft = 0
        mmTop = 20373
        mmWidth = 29104
        BandType = 0
      end
      object lblIni: TppLabel
        OnPrint = lblIniPrint
        UserName = 'lblIni'
        AutoSize = False
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 30956
        mmTop = 20373
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel5: TppLabel
        OnPrint = lblIniPrint
        UserName = 'lbCompetenciaIni2'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 46831
        mmTop = 20373
        mmWidth = 1323
        BandType = 0
      end
      object lblFim: TppLabel
        OnPrint = lblIniPrint
        UserName = 'lblFim'
        AutoSize = False
        Caption = '<Todos>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 49213
        mmTop = 20373
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        AutoSize = False
        Caption = 'Tipo Empréstimo:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 26988
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        Caption = 'Tipo Contrato:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 96309
        mmTop = 26988
        mmWidth = 23813
        BandType = 0
      end
      object lblTipoEmptmo: TppLabel
        UserName = 'lblTipoEmptmo'
        AutoSize = False
        Caption = ' < todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 28310
        mmTop = 26988
        mmWidth = 64558
        BandType = 0
      end
      object lblTipoContr: TppLabel
        UserName = 'lblTipoContr'
        AutoSize = False
        Caption = ' < todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 119856
        mmTop = 26988
        mmWidth = 63765
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'Patrocinadoras:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 31750
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label202'
        AutoSize = False
        Caption = 'Planos:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 107421
        mmTop = 31750
        mmWidth = 12700
        BandType = 0
      end
      object memPatro: TppRichText
        UserName = 'memPatro'
        Caption = 'memPatro'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '6 < todas >\f1\par'#13#10'}'#13#10
        Stretch = True
        Transparent = True
        mmHeight = 7673
        mmLeft = 25929
        mmTop = 31750
        mmWidth = 66940
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object memPlano: TppRichText
        UserName = 'memPlano'
        Caption = 'memPatro'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '6 < todos >\f1\par'#13#10'}'#13#10
        Stretch = True
        Transparent = True
        mmHeight = 7673
        mmLeft = 119856
        mmTop = 31750
        mmWidth = 63765
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppMemo2: TppMemo
        UserName = 'Memo2'
        KeepTogether = True
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 39158
        mmWidth = 283898
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        KeepTogether = True
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ShiftRelativeTo = memPlano
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 39158
        mmWidth = 283898
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppItensContrato: TppDetailBand
      BeforePrint = ppItensContratoBeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 3969
      mmPrintPosition = 0
      object ppLine1: TppLine
        OnPrint = ppLine1Print
        UserName = 'Line1'
        Pen.Style = psClear
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 183622
        BandType = 4
      end
      object rptContrato: TppShape
        OnPrint = rptContratoPrint
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
        mmWidth = 183622
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'ITEDESCRICAO'
        DataPipeline = pplContrConSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContrConSint'
        mmHeight = 2910
        mmLeft = 8996
        mmTop = 529
        mmWidth = 49477
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'VLRPREVISTO'
        DataPipeline = pplContrConSint
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContrConSint'
        mmHeight = 2910
        mmLeft = 67204
        mmTop = 529
        mmWidth = 17992
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
      mmHeight = 21431
      mmPrintPosition = 0
      object rptContratosAdminSintLine1: TppLine
        UserName = 'rptContratosAdminSintLine1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 2646
        mmWidth = 183622
        BandType = 7
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Visible = False
        mmHeight = 5292
        mmLeft = 82286
        mmTop = 6085
        mmWidth = 100542
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'VLRSOLIC'
        DataPipeline = pplContrConSint
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'pplContrConSint'
        mmHeight = 2910
        mmLeft = 118798
        mmTop = 7144
        mmWidth = 14023
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'VLRCREDITO'
        DataPipeline = pplContrConSint
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'pplContrConSint'
        mmHeight = 2910
        mmLeft = 138907
        mmTop = 7144
        mmWidth = 14023
        BandType = 7
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 65352
        mmTop = 7144
        mmWidth = 15610
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCTIPOEMPTMO'
      DataPipeline = pplContrConSint
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContrConSint'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9260
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 9260
          mmLeft = 0
          mmTop = 0
          mmWidth = 183622
          BandType = 3
          GroupNo = 1
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'DESCTIPOEMPTMO'
          DataPipeline = pplContrConSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplContrConSint'
          mmHeight = 2910
          mmLeft = 265
          mmTop = 1058
          mmWidth = 57679
          BandType = 3
          GroupNo = 1
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Valor Solicitado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 6350
          mmLeft = 120650
          mmTop = 794
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Valor Líquido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 6615
          mmLeft = 142082
          mmTop = 529
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'rptContratosAdminSint_LinhaTitulo1'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2.25
          mmHeight = 529
          mmLeft = 0
          mmTop = 8731
          mmWidth = 183622
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Total do Tipo de Empréstimo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 41540
          mmTop = 1852
          mmWidth = 39158
          BandType = 5
          GroupNo = 0
        end
        object ppShape5: TppShape
          UserName = 'Shape5'
          mmHeight = 5292
          mmLeft = 82286
          mmTop = 1323
          mmWidth = 100542
          BandType = 5
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
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
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'VLRSOLIC'
          DataPipeline = pplContrConSint
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContrConSint'
          mmHeight = 2910
          mmLeft = 118798
          mmTop = 2381
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'VLRCREDITO'
          DataPipeline = pplContrConSint
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContrConSint'
          mmHeight = 2910
          mmLeft = 138907
          mmTop = 2381
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'TCEDESCRICAO'
      DataPipeline = pplContrConSint
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContrConSint'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppShape1: TppShape
          OnPrint = ppShape1Print
          UserName = 'rptContratosAdminSint_FundoBandaDetalhe1'
          Brush.Color = 14342874
          ParentHeight = True
          ParentWidth = True
          Pen.Color = clAqua
          Pen.Style = psClear
          ReprintOnOverFlow = True
          StretchWithParent = True
          mmHeight = 5556
          mmLeft = 0
          mmTop = 0
          mmWidth = 183622
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText101'
          DataField = 'TCEDESCRICAO'
          DataPipeline = pplContrConSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplContrConSint'
          mmHeight = 2910
          mmLeft = 4233
          mmTop = 1323
          mmWidth = 49477
          BandType = 3
          GroupNo = 0
        end
        object rptContratosAdminSint_LinhaTitulo: TppLine
          UserName = 'rptContratosAdminSint_LinhaTitulo'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 5027
          mmWidth = 183622
          BandType = 3
          GroupNo = 0
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'VLRCREDITO'
          DataPipeline = pplContrConSint
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContrConSint'
          mmHeight = 2910
          mmLeft = 142082
          mmTop = 1323
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          DataField = 'VLRSOLIC'
          DataPipeline = pplContrConSint
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContrConSint'
          mmHeight = 2910
          mmLeft = 120650
          mmTop = 1323
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 9260
        mmPrintPosition = 0
        object ppShape3: TppShape
          UserName = 'Shape3'
          mmHeight = 5292
          mmLeft = 82286
          mmTop = 2646
          mmWidth = 100542
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLRCREDITO'
          DataPipeline = pplContrConSint
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContrConSint'
          mmHeight = 2910
          mmLeft = 138907
          mmTop = 3704
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VLRSOLIC'
          DataPipeline = pplContrConSint
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContrConSint'
          mmHeight = 2910
          mmLeft = 118798
          mmTop = 3704
          mmWidth = 14023
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
          mmTop = 265
          mmWidth = 183622
          BandType = 5
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Total do Tipo de Contrato:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 46038
          mmTop = 3704
          mmWidth = 34925
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object dtpContrConc: TDataSetProvider
    DataSet = qryContrConcSint
    Constraints = True
    Left = 208
    Top = 8
  end
  object cdsContrConc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dtpContrConc'
    Left = 208
    Top = 56
    object cdsContrConcITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object cdsContrConcVRLPREVISTO: TFloatField
      FieldName = 'VRLPREVISTO'
    end
    object cdsContrConcIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object cdsContrConcNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsContrConcVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object cdsContrConcVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
    end
    object cdsContrConcVLRPARCELA: TFloatField
      FieldName = 'VLRPARCELA'
    end
    object cdsContrConcDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object cdsContrConcDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object cdsContrConcSTATUSCONTR: TStringField
      FieldName = 'STATUSCONTR'
    end
  end
  object adoqryContrConc: TADOQuery
    Parameters = <>
    Left = 208
    Top = 104
  end
end
